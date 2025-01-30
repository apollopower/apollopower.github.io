---
layout: default
title: Jonas Erthal
description: Personal blog and portfolio of Jonas Erthal - Software Engineer, focusing on web development, system architecture, and game development.
permalink: /
---

![Jonas Erthal - Profile Picture](res/JonasImage2.jpg){: .profile-pic }

I'm Jonas Erthal, a computer programmer and writer (in that order). 

My work primarily focuses on data-oriented, machine-learning based applications. I currently count much of my work as part of the LLM boom which has surfaced the last few years.

I've worked previously at Microsoft in the exciting area of business process monitoring (data) and at JP Morgan for the Energy Trading Desk managing applications around risk (more data). I have also created several independent products, [one of which I have sold](https://www.cognisell.ai/).

I currently work at a startup, [Empwr.ai](https://www.empwr.ai/), focused on transforming meeting conversations into org-wide knowledge.

My current passion project is [Tiranor](https://app.tiranor.com/), an urban safety tool that ingests and combines various data sources to understand criminal activity and extract patterns.

Finally, I have worked on small games from time to time, which you can find here.

## Recent Posts
{% for post in site.posts limit:3 %}
- ### [{{ post.title }}]({{ post.url }})
  {{ post.excerpt | strip_html | truncatewords:30 }}
{% endfor %}
