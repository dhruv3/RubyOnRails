 Project Source: http://tutorials.jumpstartlab.com/projects/blogger.html
 
 ## Getting Started
 
 ### Creating the Article Model
 
```ruby
bin/rails generate model Article
```
* `db/migrate/(some_time_stamp)_create_articles.rb` : A database migration to create the articles table. Rails uses migration files to perform modifications to the database. You write your migrations once, then run them against almost any database.
* `app/models/article.rb` : The file that will hold the model code
* `test/models/article_test.rb` : A file to hold unit tests for Article
* `test/fixtures/articles.yml` : A fixtures file to assist with unit testing

```ruby
bin/rake db:migrate
```

The migrate action finds all migrations in the db/migrate/ folder, looks at a special table in the DB to determine which migrations have and have not been run yet, then runs any migration that hasn’t been run.

Reflection: Rails thingy

Rails queries the database, looks at the articles table, and assumes that whatever columns that table has should be the attributes for the model. Creates these attributes automatically for this model.

