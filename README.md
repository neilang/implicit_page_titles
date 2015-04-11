# implicit_page_titles gem

A rails gem that adds a page title helper to your app, but also follows the ruby and rails naming conventions to set an appropriate page where possible.

## Example

| Route          | Page title  |
|----------------|-------------|
| /              | App name    |
| /login         | "Login"     |
| /posts         | "Posts"     |
| /posts/:id     | post.title  |
| /author/:id    | author.name |

## Usage

In your application layout add the `page_title` helper method.

```
  <title><%= page_title %></title>
```

### Explicitly setting a page title

To set a specific title for a view, call the `page_title` method within the view with desired title:

```
  <%- page_title("My page title") %>
```

This method will also return the set title, enabling syntax like this:

```
  <h1><%= page_title("My page title") %></h1>
```

### Adding extra information to the page title

It is best to do this within the title tag:

```
  <title>
    <% unless current_page?(root_url) %>
      My app:
    <% end %>
    <%= page_title %>
  </title>
```




## License

This project rocks and uses MIT-LICENSE.
