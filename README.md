# Kuartz rails template

## Usage

1. Install mailcatcher
    ```bash
    # For Linux
    gem install mailcatcher

    # For MacOS
    gem install mailcatcher -- --with-cflags="-Wno-error=implicit-function-declaration"
    ```

1. Clone the components_template repo
    ```bash
    git clone git@github.com:kuartz-org/components_templates.git
    ```

1. Clone this repo
    ```bash
    git clone git@github.com:kuartz-org/rails-templates.git
    ```

1. Create a new rails app using this template
    ```bash
    rails new -d postgresql --css tailwind -m rails-templates/template.rb CHANGE_THIS_WITH_APP_NAME
    ```

## Features

- [X] Default config
- [X] Slim
- [X] Enumerize
- [X] ViewComponent
- [X] Simple form
- [X] Devise
- [X] Sidekiq
- [X] CleverCloud
- [X] Modal
- [X] Chart-js
- [X] TomSelect
- [X] Flatpickr
