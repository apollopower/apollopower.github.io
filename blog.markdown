---
layout: blog
title: Blog
permalink: /blog/
---

{% for post in site.posts limit:3 %}
- ### [{{ post.title }}]({{ post.url }})
  {{ post.excerpt | strip_html | truncatewords:30 }}
{% endfor %}
