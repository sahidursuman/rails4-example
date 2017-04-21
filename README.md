## rails4-example

A Rails 4.2 / Ruby 2 starter site using Devise and Bootstrap 4.

Active demo site:

- <https://rails4example.gitrepoexamples.com> (master branch)

#### Versions

As of April 21, 2017:
* Updated to Bootstrap 4.0 (alpha6)
* Updated to Rails 4.2.8
* Updated to Devise 4.2.1
* Updated to Rspec 3.5
* Updated to Capistrano 3.2

NOTE: The original Bootstap 3 version is available in the 'bootstrap3' branch. (not maintained)

### Related Blog Posts

Blog posts on [joanswork.com](https://joanswork.com) that provide further explanation and instruction.

- [Devise 4.2.0: Updating from 3.x](https://joanswork.com/updating-devise-4-2-0/)
- [Tracking Devise activity like login, sign-up, etc](https://joanswork.com/devise-usage-tracking/)
- [Turbolinks, Google Analytics & SEO: Keeping everybody happy](https://joanswork.com/turbolinks-and-ga/)
- [Using I18n for SEO related tags](https://joanswork.com/rails-seo-and-i18n-the-basics/)

### Installation Note

The following files will need to be customized to your installation.

  ```
  cp config/database.yml.example config/database.yml
  cp config/application.yml.example config/application.yml
  cp config/deploy.rb.example config/deploy.rb
  cp config/deploy/production.rb.example config/deploy/production.rb
  ```

### Author

Joan Hughes @ [https://72breezy.io](https://72breezy.io)

<http://www.linkedin.com/in/jehughes>

### License
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE.md)

[![Analytics](https://ga-beacon.appspot.com/UA-46923629-1/rails4-example/README)](https://github.com/igrigorik/ga-beacon)
