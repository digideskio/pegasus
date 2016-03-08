install:
	./bin/setup

clean:
	./bin/setup

test:
	@export RAILS_ENV=test
	@./bin/bundle exec rake db:drop RAILS_ENV=test
	@./bin/bundle exec rake db:setup RAILS_ENV=test
	@./bin/bundle exec rake db:test:prepare RAILS_ENV=test
	@./bin/bundle exec rspec

run:
	@export RAILS_ENV=production
	@./bin/bundle exec rails s Puma RAILS_ENV=production

dev:
	@export RAILS_ENV=development
	@./bin/bundle exec rails s RAILS_ENV=development
