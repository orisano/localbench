.PHONY: setup

setup:
	mkdir -p bin
	curl -SsL https://github.com/matsuu/kataribe/releases/download/v0.3.3/darwin_amd64.zip | tar xC bin kataribe
	brew install percona-toolkit
