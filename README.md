# Rails template by Kuartz

## Features

- [X] Slim
- [X] Devise
- [X] Force SSL

## Setup

```sh
mkdir -p kuartz-org
git clone git@github.com:kuartz-org/rails-templates.git kuartz-org/rails-templates

rails new \
  --database postgresql \
  -m kuartz-org/rails-templates/default.rb \
  CHANGE_THIS_TO_YOUR_RAILS_APP_NAME
```

## TODO

- [ ] Slim
- [ ] Rspec
- [ ] Rubocop
- [ ] I18n
- [ ] ViewComponent
- [ ] Flash messages
- [ ] Devise views
- [ ] devise_invitable
- [ ] User management
- [ ] Clevercloud setup
- [ ] Clevercloud S3 setup (option, default: false)
- [ ] Sidekiq
- [ ] Sidekiq scheduler (option, default: false)
