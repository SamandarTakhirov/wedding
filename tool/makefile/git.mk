.PHONY: help-git
help-git:
	@echo 'Usage: make <OPTIONS> ... <TARGETS>'
	@echo ''
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: push
push: # Git push with "m" message and "u" branch name and marges it with test
ifndef m
	$(error Error: Commit message (m) is required. Usage: make push m="commit message" u=branch_name)
endif
ifndef u
	$(error Error: Branch name (u) is required. Usage: make push m="commit message" u=branch_name)
endif
	@dart format --fix -l 120 lib/ test/
	@git add .
	@git commit -m "$(m)"
	@git push -u origin $(u)
	# @git push -u origin $(u):test


.PHONY: pull
pull: # Git pull from test branch
	@git pull origin test

.PHONY: push-test
push-test:
	@git push origin $(b):test

