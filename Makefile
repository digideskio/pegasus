install:
	@sh ./bin/setup

clean:
	@sh ./bin/setup

test:
	@export RAILS_ENV=test
	@sh ./bin/bundle exec rake db:drop RAILS_ENV=test
	@sh ./bin/bundle exec rake db:setup RAILS_ENV=test
	@sh ./bin/bundle exec rake db:test:prepare RAILS_ENV=test
	@sh ./bin/bundle exec rspec

run:
	@export RAILS_ENV=production
	@sh ./bin/bundle exec rails s Puma RAILS_ENV=production

dev:
	@export RAILS_ENV=development
	@sh ./bin/bundle exec rails s RAILS_ENV=development
