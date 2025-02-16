.PHONY: help-pub version doctor clean_all get fluttergen l10n fix build_runner codegen upgrade upgrade-major outdated dependencies format f add fcg c_get build_vec vec

help-pub:
	@echo 'Usage: make <OPTIONS> ... <TARGETS>'
	@echo ''
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

version: ## Check flutter version
	@flutter --version

doctor: ## Check flutter doctor
	@flutter doctor

clean_all: ## Clean the project and remove all generated files
	@rm -f coverage.*
	@rm -rf dist bin out build
	@rm -rf coverage .dart_tool .packages pubspec.lock
	@echo "Project successfully cleaned"

get: ## Get dependencies
	@flutter pub get

fluttergen: ## Generate assets
	@dart pub global activate flutter_gen
	@fluttergen -c pubspec.yaml

l10n: ## Generate localization
	@dart pub global activate intl_utils
	@(dart pub global run intl_utils:generate)
	@(flutter gen-l10n --arb-dir lib/src/common/localization --output-dir lib/src/common/localization/generated --template-arb-file intl_en.arb)

fix: format ## Fix the code
	@dart fix --apply lib

build_runner: ## Build runner
	@dart run build_runner build --delete-conflicting-outputs --release

codegen: get format ## Generate code

gen: codegen ## Generate all

upgrade: ## Upgrade dependencies
	@flutter pub upgrade

upgrade-major: get ## Upgrade to major versions
	@flutter pub upgrade --major-versions

outdated: get ## Check outdated dependencies
	@flutter pub outdated

dependencies: get ## Check outdated dependencies
	@flutter pub outdated --dependency-overrides \
		--dev-dependencies --prereleases --show-all --transitive

format: ## Format code
	@dart format --fix -l 120 lib/ test/

f: format

add: ## add new package or plugin
	@flutter pub add $(p)

fcg: ## flutter clean, get dependencies
	@flutter clean 
	@flutter pub get
	@make format

c_get: clean_all get

build_vec:
	@dart run tool/dart/vector_generator.dart $(r)

vec: r ?= false
vec: build_vec build_runner ## build vector graphics from svg and run flutter gens

# https://pub.dev/packages/flutter_launcher_icons
.PHONY: generate-icons
generate-icons: ## Generate icons for the app
	@dart run flutter_launcher_icons -f flutter_launcher_icons.yaml

# https://pub.dev/packages/flutter_native_splash
.PHONY: generate-splash
generate-splash: ## Generate splash screen for the app
	@dart run flutter_native_splash:create --path=flutter_native_splash.yaml
