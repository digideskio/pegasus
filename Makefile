all: install run

test:
	@echo "no tests"

run:
	bundle exec serve 3333

install:
	npm install
	./node_modules/.bin/bower install
	bundle install
