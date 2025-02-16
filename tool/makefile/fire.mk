.PHONY: help-fire init-firebase fire-login configure

help-fire:
	@echo 'Usage: make <OPTIONS> ... <TARGETS>'
	@echo ''
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

init-firebase: fire-login configure ## Firebase initialize for this project

fire-login: ## Login to Firebase
	@(curl -sL https://firebase.tools | bash)
# 	@(curl -sL https://firebase.tools | upgrade=true bash)
# 	@firebase logout
	@firebase login
	@firebase init

configure: ## Firebase configure project 
	@dart pub global activate flutterfire_cli
	@flutterfire configure \
		-i uz.udevs.mbfSapMobile \
		-a uz.udevs.mbf_sap_mobile \
		-p mbf-sap-mobile \
		-e udevs4help@gmail.com \
		-o lib/src/common/constant/firebase_options.g.dart
