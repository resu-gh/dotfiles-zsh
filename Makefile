include config.mk

.DEFAULT_GOAL := help

.SILENT: help
.PHONY: help # print help
help:
	grep '^.PHONY: .* #' $(firstword $(MAKEFILE_LIST)) |\
	sed 's/\.PHONY: \(.*\) # \(.*\)/\1 # \2/' |\
	awk 'BEGIN {FS = "#"}; {printf "%-30s%s\n", $$1, $$2}'

.SILENT: build
.PHONY: build # @combo [clean deps link]
build: clean dirs deps link

.SILENT: deps
.PHONY: deps # install required dependencies
deps:
	$(PKGC) $(DEPS)

.PHONY: dirs # create required dirs
dirs:
	mkdir -p ${HOME}/.config
	mkdir -p ${HOME}/.local
	mkdir -p ${HOME}/.cache

.PHONY: link # link zsh
link:
	ln -sf $(CURDIR)/zsh ${HOME}/.config
	ln -sf ${HOME}/.config/zsh/.zshenv ${HOME}/.zprofile
	ln -sf ${HOME}/.config/zsh/.zshenv ${HOME}/.profile
	find $(XDIR)/* -name '*.zsh' | xargs -r -I {} ln -sf {} $(CURDIR)/zsh/modules/mtarget

.PHONY: clean # clean/unlink zsh
clean:
	find $(CURDIR)/zsh/modules/mtarget/* -not -name '.gitkeep' -name '*.zsh' | xargs -r -I {} rm -f {}
	rm -rf ${HOME}/.config/zsh
	rm -rf ${HOME}/.cache/zsh
	rm -rf ${HOME}/.local/share/zsh
	rm -f ${HOME}/.zshenv
