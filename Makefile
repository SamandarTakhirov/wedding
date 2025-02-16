.PHONY: help
help: # Script description and usage through `make` or `make help` commands
	$(MAKE) -C ./tool/makefile/ -f deploy.mk help-deploy
	$(MAKE) -C ./tool/makefile/ -f fire.mk help-fire
	$(MAKE) -C ./tool/makefile/ -f git.mk help-git
	$(MAKE) -C ./tool/makefile/ -f pub.mk help-pub

-include tool/makefile/deploy.mk tool/makefile/fire.mk tool/makefile/git.mk tool/makefile/pub.mk 