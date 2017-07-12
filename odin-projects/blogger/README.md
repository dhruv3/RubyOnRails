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

# Form-based workflow

* `form_for` is a Rails helper method which takes one parameter, in this case @article and a block with the form fields.
* The `f.label` helper creates an HTML label for a field. This is good usability practice and will have some other benefits for us later. Example is as follows:
```ruby
<%= f.label :author_name, "Your Name"  %>
```
* The `f.text_field` helper creates a single-line text box named title
* The `f.text_area` helper creates a multi-line text box named body
* The `f.submit` helper creates a button labeled "Create"

`params[:article][:body])`
First article accessed then we got body because og the Hash received in our response. To check hash received we set method definition to `fail`.

**Reflection: Rails thingy**

For security reasons, it’s not a good idea to blindly save parameters sent into us via the params hash. Luckily, Rails gives us a feature to deal with this situation: Strong Parameters.

It works like this: You use two new methods, `require` and `permit`. They help you declare which attributes you’d like to accept. Also helper methods can be used to implement them. You need to add `include ArticlesHelper` in your class to use helper methods.

## Deleting Articles

```ruby
<%= link_to "delete", article_path(article), method: :delete %>
```

HTML forms only support GET and POST. So Rails’ solution to this problem is to fake a DELETE verb.

Find the element we want to delete using params[:id] and then destroy on the object.

## Editing Articles

Introduction to partials as CREATE and EDIT both have the same form. EDIT also needs ann UPDATE action. 

## Adding a flash

The controller provides you with accessors to interact with the flash.
```html
<p class="flash"><%= flash.notice %></p>
```

This outputs the value stored in the `flash` object in the attribute `:notice`.

# Adding Comments

## Comment Model

```ruby
bin/rails generate model Comment author_name:string body:text article:references
```

The Rails convention for a one-to-many relationship:

* the objects on the "many" end should have a foreign key referencing the "one" object.
* that foreign key should be titled with the name of the "one" object, then an underscore, then "id".

In this case one article has many comments, so each comment has a field named `article_id`.

Use `a.reload` to force console to clear the cache and lookup the accurate information.

### Displaying Comments
```ruby
<%= render partial: 'articles/comment', collection: @article.comments %>
```
This render line will pass each element of `article.comments` array one at a time into the partial named "comment".

### Web based comment creation

Creating a sub-resource:
```ruby
resources :articles do
  resources :comments
end
```
After creation of comment we need to redirect the page back to our submitted comment. We do this as-
```ruby
redirect_to article_path(@comment.article)
```
Recall that `article_path` needs to know which article we want to see. We might not have an `@article` object in this controller action, but we can find the Article associated with this Comment by calling `@comment.article`.

Many-to-many relationships are tricky because we’re using an SQL database.

The relationships will setup like this:
* An Article has_many Taggings
* A Tag has_many Taggings
* A Tagging belongs_to an Article and belongs_to a Tag

n Rails we can express this "has many" relationship through an existing "has many" relationship.
has_many :tags, through: :taggings
AND
has_many :articles, through: :taggings
We can now just query article.tags or tag.articles to get our answers.

We need a method tag_list in model so as to get the tag list.

def tag_list
  self.tags.collect do |tag|
    tag.name
  end.join(", ")
end

We could fix the tag_list method by:
* Converting all our tag objects to an array of tag names
* Joining the array of tag names together


tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq

