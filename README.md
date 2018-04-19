# implicit_page_titles gem

Allows you to easily set page titles per view in your Rails app, but also follows Ruby on Rails naming conventions to set sensible default title if none is specified.

## Example

| Route           | Page title           |
|-----------------|----------------------|
| /               | Application name     |
| /login          | "Login"              |
| /posts          | "Posts"              |
| /posts/:id      | post.title           |
| /author/:id     | author.name          |
| /posts/:id/new  | "New Post"           |
| /posts/:id/edit | "Edit #{post.title}" |


## Usage

In your layout add the `page_title` helper method.

e.g. within app/views/layouts/application.html.erb

```erb
  <title><%= page_title %></title>
```

### Explicitly setting a page title

To set a specific title for a view, call the `page_title` method within the view with desired title.

e.g. within app/views/welcome/index.html.erb

```erb
  <%- page_title("My page title") %>
```

This method will also return the set title, enabling syntax like this:

```erb
  <h1><%= page_title("My page title") %></h1>
```

### Adding extra information to the page title

It is best to do this within the title tag:

```erb
  <title>
    <% unless current_page?(root_url) %>
      My app:
    <% end %>
    <%= page_title %>
  </title>
```

## Compatibility

Tested with Rails 4 & 5, and Ruby 2+. Although untested, it would likely work with Rails 3 and Ruby 1.9.x.

## License

This project rocks and uses MIT-LICENSE.
