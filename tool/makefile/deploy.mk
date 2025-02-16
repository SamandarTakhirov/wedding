BUILD_NAME=$(shell grep '^version: ' pubspec.yaml | cut -d+ -f1 | sed 's/version: //')
BUILD_NUMBER=$(shell grep '^version: ' pubspec.yaml | cut -d+ -f2)


.PHONY: help-deploy
help-deploy:
	@echo 'Usage: make <OPTIONS> ... <TARGETS>'
	@echo ''
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: apk
apk: c_get gen ## Release build APK with build-name and build-number
	@flutter build apk --release --build-name=$(BUILD_NAME) --build-number=$(BUILD_NUMBER)
# 	@flutter build $@ --release --split-per-abi
	@open build/app/outputs/apk/release

.PHONY: ipa
ipa: c_get gen ## Release build IPA with build-name and build-number
	@flutter build $@ --build-name=$(BUILD_NAME) --build-number=$(BUILD_NUMBER)
	@open build/ios/archive/Runner.xcarchive

.PHONY: aab
aab: c_get gen ## Release build AAB with build-name and build-number
	@flutter build appbundle --build-name=$(BUILD_NAME) --build-number=$(BUILD_NUMBER) --dart-define=env=prod
	@open build/app/outputs/bundle/release/

.PHONY: github
github: format
	@git add .
	@git commit -m "$(M)"
	@git push origin test

.PHONY: apk-prod
apk-prod: c_get gen ## Build the android app
	@flutter build apk --release --build-name=$(BUILD_NAME) --build-number=$(BUILD_NUMBER) --dart-define=env=prod
	@open build/app/outputs/apk/release
 
.PHONY: ipa-prod
ipa-prod: c_get gen ## Build the ios app
	@flutter build ipa --release --build-name=$(BUILD_NAME) --build-number=$(BUILD_NUMBER) --dart-define=env=prod
	@open build/ios/archive/Runner.xcarchive

.PHONY: vgc
vgc:
	@dart run vector_graphics_compiler -i assets/icons/$(name).svg -o assets/icons/$(name).svg.vec

.PHONY: ilvi
ilvi:
	@echo "Finding the last iOS build version in the archive..."
	@LAST_ARCHIVE=$(shell ls -td $(ARCHIVE_DIR)/* | head -n 1) && \
	BUILD_VERSION=$$(/usr/libexec/PlistBuddy -c "Print :ApplicationProperties:CFBundleVersion" "$$LAST_ARCHIVE"/Info.plist) && \
	APP_VERSION=$$(/usr/libexec/PlistBuddy -c "Print :ApplicationProperties:CFBundleShortVersionString" "$$LAST_ARCHIVE"/Info.plist) && \
	echo "Last Version Info: $$APP_VERSION - $$BUILD_VERSION"

.PHONY: alvi
alvi:
	@echo "Finding the last Android build version and app version from local.properties..."
	@ANDROID_BUILD_VERSION=$$(grep "versionCode" $(LOCAL_PROPERTIES_FILE) | awk -F '=' '{print $$2}' | xargs) && \
	ANDROID_APP_VERSION=$$(grep "versionName" $(LOCAL_PROPERTIES_FILE) | awk -F '=' '{print $$2}' | xargs) && \
	echo "Last Version Info: $$ANDROID_APP_VERSION" - $$ANDROID_BUILD_VERSION


