# Routing
The Router looks at the HTTP verb (GET, POST, PUT, DELETE) and the URL that it being requested and matches it with the appropriate controller action to run.

When a request enters your application is that Rails grabs all the parameters that came with it and makes them available for you in a special hash called params that you can later use in your controller.

```ruby
get "/posts/:id" => "posts#show"
```
The "id" field is prepended by a colon that just tells Rails "Look for anything here and save it as the ID in the params hash".

## Route Helpers
```ruby
edit_post  GET  /posts/:id/edit(.:format)  posts#edit
```
edit_post is the name of the route. Rails automatically generates helper methods for you which correspond to the names of all your routes. These methods end with *_path* and *_url*. path, as in *edit_post_path(3)*, will generate just the path portion of the URL, which is sufficient for most applications. url will generate the full URL.

# Controller
```ruby
def index
  @posts = Post.all
end
```
In this simple action, we have the controller asking the model for something ("Hey, give me all the posts!"), packaging them up in an instance variable *@posts* so the view can use them, then will automatically render the view at *app/views/posts/index.html.erb*

*redirect_to post_path(@post.id)* is equivalent to *redirect_to @post*

## Strong Params
```ruby
def whitelisted_post_params
  params.require(:post).permit(:title,:body,:author_id)
end
```
Basically, you *require* the name of your array or hash to be in Params (otherwise it'll throw an error), and then you *permit* the individual attributes inside that hash to be used.

## Flash

A redirect submits a completely new HTTP request, effectively leaving our application in the dust and starting over from the top. We lose all our data... except for the flash. The flash is specifically designed to travel with that HTTP request so you have access to it when you get redirected to the next page.

# Views

Put anything that's needed across all your webpages into the layout. The view template at *app/views/posts/index.html.erb* gets inserted where the *yield* statement is.



