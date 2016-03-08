install:
	bundle exec setup

clean:
	bundle exec setup

test:
	@export RAILS_ENV=test
	@bundle exec rake db:drop RAILS_ENV=test
	@bundle exec rake db:setup RAILS_ENV=test
	@bundle exec rake db:test:prepare RAILS_ENV=test
	@bundle exec rspec

run:
	@export RAILS_ENV=production
	@bundle exec rails s Puma RAILS_ENV=production

dev:
	@export RAILS_ENV=development
	@bundle exec rails s RAILS_ENV=development
