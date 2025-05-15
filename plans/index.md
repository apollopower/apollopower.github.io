---
layout: page
title: ".plan Updates"
permalink: /plans/
---

<ul>
  {% for plan in site.plans reversed %}
    <li>
      <a href="{{ plan.url }}">{{ plan.title }}</a>
    </li>
  {% endfor %}
</ul>
