.PHONY: all package install clean check-zip
.DEFAULT_GOAL := all

PACKAGE_NAME := Mar.sublime-package
DIST_DIR := dist
OUT := $(DIST_DIR)/$(PACKAGE_NAME)
SUBLIME_INSTALLED_PACKAGES := $(HOME)/Library/Application Support/Sublime Text/Installed Packages

define print_title
	@sh -c 'if [ -n "$$NO_COLOR" ] || ! [ -t 1 ]; then printf "\n%s\n" "$(1)"; else printf "\n\033[1;36m%s\033[0m\n" "$(1)"; fi'
endef

define print_info
	@sh -c 'printf "  %s\n" "$(1)"'
endef

define print_ok
	@sh -c 'if [ -n "$$NO_COLOR" ] || ! [ -t 1 ]; then printf "  %s\n" "$(1)"; else printf "  \033[1;32m%s\033[0m\n" "$(1)"; fi'
endef

check-zip:
	@command -v zip >/dev/null 2>&1 || { \
		printf "\nzip is required to package this plugin.\n\n"; \
		exit 1; \
	}

all: package

package: check-zip
	$(call print_title,Sublime Text package)
	$(call print_info,Packaging Mar.sublime-package)
	@mkdir -p "$(DIST_DIR)"
	@rm -f "$(OUT)"
	@zip -qr "$(OUT)" Mar.sublime-syntax Mar.sublime-completions README.md
	@sh -c 'if [ -n "$$NO_COLOR" ] || ! [ -t 1 ]; then \
		printf "  %s\n" "Output: $(OUT)"; \
		printf "  %s\n" "Install in Sublime Text on macOS with: cp $(OUT) \"$$HOME/Library/Application Support/Sublime Text/Installed Packages/\""; \
	else \
		printf "  Output: \033[1;32m%s\033[0m\n" "$(OUT)"; \
		printf "  Install in Sublime Text on macOS with: \033[1;32mcp %s \"$$HOME/Library/Application Support/Sublime Text/Installed Packages/\"\033[0m\n" "$(OUT)"; \
	fi'
	@printf "\n"

install: package
	$(call print_info,Installing in $(SUBLIME_INSTALLED_PACKAGES))
	@cp "$(OUT)" "$(SUBLIME_INSTALLED_PACKAGES)/"

clean:
	@rm -rf "$(DIST_DIR)"
