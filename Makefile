.PHONY: icons upgrade clean

icons:
	@echo "Generating launch icons..."
	@dart run flutter_launcher_icons

upgrade:
	@echo "Upgrading dependencies..."
	@make clean
	@flutter pub upgrade
	@flutter pub upgrade --major-versions

clean:
	@echo "Cleaning up project..."
	@rm -rf dist
	@flutter clean
	@flutter pub get
