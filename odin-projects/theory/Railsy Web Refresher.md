# HTTP

Link: https://code.tutsplus.com/tutorials/http-the-protocol-every-web-developer-must-know-part-1--net-31177

HTTP stands for Hypertext Transfer Protocol. It's a stateless, application-layer protocol for communicating between distributed systems, and is the foundation of the modern web.

Communication between a host and a client occurs, via a request/response pair. The client initiates an HTTP request message, which is serviced through a HTTP response message in return.

## URLs

https://github.com/dhruv3?tab=overview&from=2017-06-17

* https: Protocol
* github.com: Host
* dhruv3: Path to resource. The resource path is the local path to the resource on the server.
* tab=overview&from=2017-06-17: Query

## Verbs

URLs reveal the identity of the particular host with which we want to communicate, but the action that should be performed on the host is specified via HTTP verbs. These request verbs are:

* GET: fetch an existing resource. The URL contains all the necessary information the server needs to locate and return the resource.
* POST: create a new resource. POST requests usually carry a payload that specifies the data for the new resource.
* PUT: update an existing resource. The payload may contain the updated data for the resource.
* DELETE: delete an existing resource.

## Status Code

1xx: Informational Messages

2xx: Successful

3xx: Redirection

4xx: Client Error

5xx: Server Error

## Request and Response Message Formats

There are two primary tasks when dealing with HTTP messages:
* Read URL fragments and request headers.
* Write response headers and body

In Rails, the ActionController and ActionDispatch modules provide the API for handling request and response messages.

ActionController provides a high level API to read the request URL, render output and redirect to a different end-point. An end-point (aka route) is handled as an action method. Most of the necessary context information inside an action-method is provided via the request, response and params objects.

* params: gives access to the URL parameters and POST data.
* request: contains information about the client, headers and URL.
* response: used to set headers and status codes.
* render: render views by expanding templates.
* redirect_to: redirect to a different action-method or URL.

ActionDispatch provides fine-grained access to the request/response messages, via the ActionDispatch::Request and ActionDispatch::Response classes. It exposes a set of query methods to check the type of request (get?(), post?(), head?(), local?()). Request headers can be directly accessed via the request.headers() method.

On the response side, it provides methods to set cookies(), location=() and status=(). If you feel adventurous, you can also set the body=() and bypass the Rails rendering system.

# REST

7 things you can do to a resource and you can do them by mixing HTTP verbs. These things are listed below-
1. GET all the posts (aka **"index"** the posts)
2. GET just one specific post (aka **"show"** that post)
3. GET the page that lets you create a new post (aka view the **"new"** post page)
4. POST the data you just filled out for a new post back to the server so it can create that post (aka **"create"** the post)
5. GET the page that lets you edit an existing post (aka view the **"edit"** post page)
6. PUT (or PATCH) the data you just filled out for editing the post back to the server so it can actually perform the update (aka **"update"** the post)
7. DELETE one specific post by sending a delete request to the server (aka **"delete"** the post)

# API

An API is just an interface. It is a set of programming instructions and standards for accessing a Web-based software application or Web
tool. A software company releases its API to the public so that other software developers can design products that are powered by its 
service

When you buy movie tickets online and enter your credit card information, the movie ticket Web site uses an API to send your credit card 
information to a remote application that verifies whether your information is correct. 
Once payment is confirmed, the remote application sends a response back to the movie ticket Web site saying it's OK to issue the tickets..



