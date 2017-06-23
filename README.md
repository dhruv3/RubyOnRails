# RubyOnRails

Making things while following tutorial-

https://www.railstutorial.org/book/frontmatter

Installing Rails with a specific version number.
```ruby
gem install rails -v 5.0.1
```
Creating new app
```ruby
rails _5.0.3_ new hello_app
```
After creating a new Rails application, the next step is to use Bundler to install and include the gems needed by the app
```ruby
bundle install
```
run a local development webserver with the rails server command

MVC

Adding a hello action to the Application controller.
```ruby
def hello
    render html: "hello, world!"
end
```
root route, which determines the page that is served on the root URL
config/routes.rb
```ruby
Rails.application.routes.draw do
  root 'application#hello'
end
```
GIT
```
git init //Initialized empty Git repository
git add -A //add all the project files to the repository
git status
git commit -m "Initialize repository"
```
Adding Bitbucket and pushing up the repository.
```
$ git remote add origin git@bitbucket.org:<username>/hello_app.git
$ git push -u origin --all
```
TOY APP

The typical first step when making a web application is to create a data model, which is a representation of the structures needed by our application

Migrating the database.
```ruby
$ rails db:migrate
```
Update the database with our new users data model

class User < ApplicationRecord
Rails library called Active Record, arranges for User.all to return all the users in the database.

Variables that start with the @ sign, called instance variables, are automatically available in the views; in this case, the index.html.erb view

resources :microposts routing rule maps micropost URLs to actions in the Microposts controller

form associations between different data models.
belongs_to and has_many

rails generate controller StaticPages home help
creates a controller with actions home, help
```ruby
<% provide(:title, "Home") %>
indicates using <% ... %> that Rails should call the provide function and associate the string "Home" with the label :title
<title><%= yield(:title) %> | Ruby on Rails Tutorial Sample App</title>
to insert the title into the template using Ruby’s yield function.
```
```
>> "#{first_name} #{last_name}"    # The equivalent interpolation
=> "Michael Hartl"
```
