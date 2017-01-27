##rails4-example

A Rails 4.2 / Ruby 2 starter site using Devise and Bootstrap 4.

Active demo sites:

- <http://rails4example.gitrepoexamples.com> (master branch)
- <http://arails4eg.joanswork.net/> (dev branch)

####Versions

As of Jan 23, 2017:
* Bootstrap 4.0 (alpha6)
* Rails 4.2.7
* Devise 4.2.0
* Rspec 3.5
* Capistrano 3.2

NOTE: The original Bootstap 3 version is available in the 'bootstrap3' branch. (not maintained)

###Related Blog Posts

Blog posts on [joanswork.com](http://joanswork.com) that provide further explanation and instruction.

- [Devise 4.2.0: Updating from 3.x](http://joanswork.com/updating-devise-4-2-0/)
- [Tracking Devise activity like login, sign-up, etc](http://joanswork.com/devise-usage-tracking/)
- [Turbolinks, Google Analytics & SEO: Keeping everybody happy](http://joanswork.com/turbolinks-and-ga/)
- [Using I18n for SEO related tags](http://joanswork.com/rails-seo-and-i18n-the-basics/)

###Installation Note

The following files will need to be customized to your installation.

  ```
  cp config/database.yml.example config/database.yml
  cp config/application.yml.example config/application.yml
  cp config/deploy.rb.example config/deploy.rb
  cp config/deploy/production.rb.example config/deploy/production.rb
  ```

###Author

Joan Hughes @ [http://72breezy.io](http://72breezy.io)

<http://www.linkedin.com/in/jehughes>

###License
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE.md)

[![Analytics](https://ga-beacon.appspot.com/UA-46923629-1/rails4-example/README)](https://github.com/igrigorik/ga-beacon)
