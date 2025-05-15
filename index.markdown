---
layout: default
title: Jonas Erthal
description: Personal blog and portfolio of Jonas Erthal - Computer Programmer focusing on machine learning, system architecture, and game development.
permalink: /
---

![Jonas Erthal - Profile Picture](res/JonasImage2.jpg){: .profile-pic }

I'm Jonas Erthal, a computer programmer and (occassional) writer. 

My work primarily focuses on data-oriented, machine-learning based applications. In recent years this has evolved into the applications of reinforcement learning and large language models.

I've worked previously at Microsoft in the exciting area of business process monitoring (data) and at JP Morgan for the Energy Trading Desk managing applications around risk (more data). I have also created and sold several independent products, [like this AI sales training education tool](https://www.cognisell.ai/).

I currently work at a startup, [Empwr.ai](https://www.empwr.ai/), focused on transforming meeting conversations into org-wide knowledge.

On the fun side of life, I'm an amateur Ironman-distance triathlete. Finally, I have worked on small games from time to time, which you can find on this site.

{% assign latest_plan = site.plans | sort: 'date' | last %}
**[My current .plan]({{ latest_plan.url }})**


## Recent Posts
{% for post in site.posts limit:3 %}
- ### [{{ post.title }}]({{ post.url }})
{% endfor %}
