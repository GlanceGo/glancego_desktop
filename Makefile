DEST_DIR=./dist/${COMPLETE_APP_VERSION}
OUTPUT_PATH=${DEST_DIR}/glancego_${APP_VERSION}
COMPLETE_APP_VERSION=$$(grep '^version:' ./pubspec.yaml | awk '{print $$2}')
APP_VERSION=$$(grep '^version:' ./pubspec.yaml | sed -E 's/version:[[:space:]]*([0-9]+\.[0-9]+\.[0-9]+)\+[0-9]+/\1/')

.PHONY: icons macos_deps fedora_deps snap macos windows upgrade clean

icons:
	@echo "Generating launch icons..."
	@cp -f -v ./assets/icon_linux.svg ./snap/gui/glancego.svg
	@dart run flutter_launcher_icons

macos_deps:
	@echo "Installing macOS dependencies..."
	@npm install -g appdmg

fedora_deps:
	@echo "Installing Fedora dependencies..."
	@sudo dnf install snapd
	@sudo ln -s /var/lib/snapd/snap /snap
	@sudo snap install snapcraft --classic
	@sudo snap install lxd

snap:
	@echo "Building Snap application..."
	@mkdir -p ${DEST_DIR}/
	@make clean
	@snapcraft clean glancego
	@snapcraft --use-lxd --bind-ssh
	@mv ./glancego_*_amd64.snap ${OUTPUT_PATH}_linux_x64.snap
	@echo "Done! Successfully packaged at $$(echo ${OUTPUT_PATH}_linux_x64.snap)"

macos:
	@echo "Building macOS application..."
	@mkdir -p ${DEST_DIR}/
	@make clean
	@fvm dart run fastforge:main release --name release --jobs macos
	@mv ${DEST_DIR}/glancego-*-macos.dmg ${OUTPUT_PATH}_macos_x64.dmg
	@echo "Done! Successfully packaged at $$(echo ${OUTPUT_PATH}_macos_x64.dmg)"

windows:
	@echo "Building Windows application..."
	@mkdir -p ${DEST_DIR}/
	@make clean
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
