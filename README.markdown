# Capistrano Git External Extension

Allows `capistrano` to use `git external` on `checkout` and `sync` from
a `git` repository.

## Usage

1. `require` the library on the `Capfile` before loading your `deploy.rb` file
        require 'rubygems'
        require 'capistrano-git-external'
        load 'config/deploy'

1. then enable `git external`s on your `deploy.rb` and **that's it**
        set :git_enable_externals, 1

