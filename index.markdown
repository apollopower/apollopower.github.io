---
layout: default
title: Jonas Erthal
description: Personal blog and portfolio of Jonas Erthal - Software Engineer, focusing on web development, system architecture, and game development.
permalink: /
---

# Welcome

I'm Jonas, a software engineer passionate about building scalable applications, exploring new technologies, and occasionally creating games. Here you'll find my thoughts on software development, tech insights, and various projects I'm working on.

## Recent Posts
{% for post in site.posts limit:3 %}
- ### [{{ post.title }}]({{ post.url }})
  {{ post.excerpt | strip_html | truncatewords:30 }}
{% endfor %}
