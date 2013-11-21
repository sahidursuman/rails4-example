#rails4-example

Very beginnings of a Rails 4 / Ruby 2 site using Devise and Bootstrap 3.

Demo site: <http://rails4-example.gitrepoexamples.com>

##Installation

1. Download the zip file or clone this repository.

2. Add `config/database.yml` and `config/private.yml`.

  ```
  cp config/database-yml.example config/database.yml
  cp config/private.yml.example config/private.yml
  ```
  
  Update the two new files with your project specific settings.

  NOTE: `config/private.yml` contains the settings not appropriate for saving in a public repository.

3. Run:

  ```
  bundle install
  rake db:migrate
  ```

5. Update what's necessary for your hosting. Such as creating the `./tmp` and `./log` directories, editing the ngnix conf, etc.

###Capistrano

`config/deploy.rb` is listed in `.gitignore`. The file `config/deploy.rb.example` is included as a sample.

##Author

Joan Hughes

http://www.linkedin.com/in/jehughes

##License
The MIT License (MIT)

Copyright (c) 2013 Joan Hughes (ZoeOberon Solutions)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

![image](http://joanswork.com/images/gh_rails4eg_spot.png)

