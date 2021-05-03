# ==============================================================================
# env
# ==============================================================================
project_name='event_payment_app'
alias docker-compose="docker-compose -p $project_name"
alias build="docker-compose build"
alias up="docker-compose up"
alias stop="docker-compose stop"
alias app="rm -f tmp/pids/server.pid && up app"
alias bundle="docker-compose run -e RAILS_ENV=development --rm app bundle"
alias rails="docker-compose run -e RAILS_ENV=development --rm app bundle exec rails"
alias rspec="docker-compose run -e RAILS_ENV=test --rm app bundle exec rspec"
alias rubocop="docker-compose run -e RAILS_ENV=development --rm app bundle exec rubocop -DESP"
alias rubocopa="docker-compose run -e RAILS_ENV=development --rm app bundle exec rubocop -a"
alias yarn="docker-compose run -e RAILS_ENV=development --rm app yarn"
alias webpacker="docker-compose run -e RAILS_ENV=development --rm app ruby ./bin/webpack-dev-server"
