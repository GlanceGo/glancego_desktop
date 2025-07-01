DEST_DIR=./dist/${COMPLETE_APP_VERSION}
OUTPUT_PATH=${DEST_DIR}/glancego_${APP_VERSION}
COMPLETE_APP_VERSION=$$(grep '^version:' ./pubspec.yaml | awk '{print $$2}')
APP_VERSION=$$(grep '^version:' ./pubspec.yaml | sed -E 's/version:[[:space:]]*([0-9]+\.[0-9]+\.[0-9]+)\+[0-9]+/\1/')

.PHONY: icons runner macos_deps debian_deps deb macos windows upgrade clean

icons:
	@echo "Generating launch icons..."
	@cp -f -v ./assets/icon_linux.svg ./snap/gui/glancego.svg
	@cp -f -v ./assets/icon_macos.icns ./macos/packaging/dmg/icon.icns
	@dart run flutter_launcher_icons

runner:
	@echo "Running the build_runner..."
	@fvm dart run build_runner build -d

macos_deps:
	@echo "Installing macOS dependencies..."
	@npm install -g appdmg

debian_deps:
	@echo "Installing Linux dependencies..."
	@sudo apt install libkeybinder-3.0-dev libkeybinder-3.0-0 gir1.2-keybinder-3.0 keybinder-3.0-doc

deb:
	@echo "Building Linux application..."
	@make clean
	@mkdir -p ${DEST_DIR}/
	@fvm dart run fastforge:main release --name release --jobs linux
	@mv ${DEST_DIR}/glancego-*-linux.deb ${OUTPUT_PATH}_linux_x64.deb
	@echo "Done! Successfully packaged at $$(echo ${OUTPUT_PATH}_linux_x64.deb)"

macos:
	@echo "Building macOS application..."
	@make clean
	@mkdir -p ${DEST_DIR}/
	@fvm dart run fastforge:main release --name release --jobs macos
	@mv ${DEST_DIR}/glancego-*-macos.dmg ${OUTPUT_PATH}_macos_x64.dmg
	@echo "Done! Successfully packaged at $$(echo ${OUTPUT_PATH}_macos_x64.dmg)"

windows:
	@echo "Building Windows application..."
	@make clean
	@mkdir -p ${DEST_DIR}/
	@cp ./LICENSE ./CHANGELOG.md ./README.md ${DEST_DIR}/
	@fvm dart run fastforge:main release --name release --jobs windows
	@rm -rf ${DEST_DIR}/LICENSE ${DEST_DIR}/CHANGELOG.md ${DEST_DIR}/README.md
	@mv ${DEST_DIR}/glancego-*-windows-setup.exe ${OUTPUT_PATH}_windows_x64.exe
	@echo "Done! Successfully packaged at $$(echo ${OUTPUT_PATH}_windows_x64.exe)"

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
