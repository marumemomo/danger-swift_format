.PHONY: install-swift-format
install-swift-format:
	xcrun -sdk macosx swift build -c release --skip-update --product swift-format
	


