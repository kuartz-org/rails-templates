# Rails template by Kuartz

## Features

- [X] Slim
- [X] Devise
- [X] Force SSL
- [X] Mailcatcher
- [X] Rubocop

## Setup

```sh
mkdir -p kuartz-org
git clone git@github.com:kuartz-org/rails-templates.git kuartz-org/rails-templates

rails new \
  -T --database postgresql \
  --css tailwind \
  -m kuartz-org/rails-templates/default.rb \
  CHANGE_THIS_TO_YOUR_RAILS_APP_NAME
```

## TODO

- [ ] Rspec
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
- [ ] Tailwindcss config
- [ ] Simpleform with tailwindcss
