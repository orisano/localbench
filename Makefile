.PHONY: setup

setup:
	mkdir -p bin
	curl -SsL https://github.com/matsuu/kataribe/releases/download/v0.4.1/kataribe-v0.4.1_darwin_amd64.zip | tar xC bin kataribe
	brew install percona-toolkit

kataribe.toml:
	bin/kataribe -generate

.PHONY: nginx
nginx: kataribe.toml
	cat ./log/nginx/access.log | kataribe

.PHONY: mysql
mysql:
	pt-query-digest ./log/mysql/slow.log
