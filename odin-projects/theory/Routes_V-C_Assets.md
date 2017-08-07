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

