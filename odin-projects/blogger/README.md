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

**Reflection: Rails thingy**

Rails queries the database, looks at the articles table, and assumes that whatever columns that table has should be the attributes for the model. Creates these attributes automatically for this model.

 ### Setting up the Router
 
 ```ruby
resources :articles
```

This line tells Rails that we have a resource named articles and the router should expect requests to follow the RESTful model of web interaction.

```ruby
articles; GET; /articles(.:format); articles#index
```

Running rake/routes gives the above example. The left most column says `articles`. This is the prefix of the path. The second column, here `GET`, is the HTTP verb for the route. Third column is regex expression. In our example line, `/articles(.:format)` will match the URLs /articles/, /articles.json, /articles and other similar forms. The fourth column is where the route maps to in the applications.

Now that the router knows how to handle requests about articles, it needs a place to actually send those requests, the *Controller*.

### Controller

The first feature we want to add is an "index" page. This is what the app will send back when a user requests `http://localhost:3000/articles/` – following the RESTful conventions, this should be a list of the articles.
```ruby
def index
  @articles = Article.all
end
```

#### Creating the Template
Rails has assumed that our index action in the controller should have a corresponding index.erb view template in the views folder. 

We want our link to display the single article which happens in the show action.
When `resources :articles` was done it automatically created the following paths as well
```
posts_path
post_path
new_post_path
edit_post_path
```

For example, `article_path(1)` would generate the string `"/articles/1"`.

#### Creating the SHOW action

Within the controller, we have access to a method named `params` which returns us a hash of the request parameters. Within that hash we can find the `:id` from the URL by accessing the key `params[:id]`.
