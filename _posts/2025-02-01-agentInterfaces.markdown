---
layout: post
title:  "Someone needs to build agent interfaces for web services"
description: "Explore why standardized agent interfaces are crucial for the future of web services and how they can solve common challenges in building autonomous AI agents."
date: 2025-02-02 00:00:00 -0800
categories: 
  - AI
  - Web Development
  - Software Architecture
tags:
  - agents
  - web services
  - API design
  - artificial intelligence
  - software architecture
image: /assets/images/posts/agent-interfaces-hero.svg
author: Jonas Erthal
excerpt: "As AI agents become more prevalent, web services need standardized interfaces to handle agent interactions effectively. Learn about the challenges and a proposed solution for building agent-friendly web services."
---

{% include hero-image.html 
  url="/res/agent-interfaces/hero.svg"
  alt="Diagram showing multiple AI agents connecting through a standardized interface layer" %}

## Agent Explosion

There are numerous efforts in the AI space right now to develop autonomous programs that can execute actions on behalf of users. The marketing buzzword we’ve collectively agreed on to communicate this class of software has been dubbed “agents”, and it’s been all the rage in both the startup ecosystem and large tech companies.

The proposed benefits are obvious - agents can “work” and make decisions based on constraints they have been given much faster, cheaper, and at times more effectively than humans. Most importantly, agents don’t need to complete a task in its entirety, and can do 80% of the heavy-lifting before a human comes in, evaluates its performance, and does the remaining 20%. Users get all the benefit of autonomous actions kickstarting their important workflows minus the potential cost of bad decisions that cannot be undone. 

It’s clear that everyone and their dog is trying to integrate some “agentic layer” into their services and applications. It’s an inexpensive way to attract more money (hello, venture capitalists) while grabbing market attention, making a hedge that prepares their products for incoming waves of more advanced and cheaper AI tools.

But in a potential blunder, many application-level developers are focused on their own agents, and not spending as much time on how external agents will interact with their own systems.

Working on your own agent is “sexy” and much more tempting/exciting due to the following:
- Your product evolves with current market trends, showing that you are a serious player in the applied AI landscape
- Your own skills as a programmer/manager/designer are sharpened by working with this new paradigm 
- Most importantly, you get to signal to the world that you are a blue-flamed thinker/innovator implementing cutting edge technology into your work.

This has worked really well so far for many individuals, and even companies, who have not been publicly part of the “big kids table” for AI development but now get airtime in the media because their old and unexciting CRM product has an “agentic layer”.

But these are short-term gains that don’t address long-term problems faced by everyone who wants to exist in this space.

## A problem that exists today

If you have spent any amount of time developing an agent yourself that interacts with other services over the web, you have no doubt come across the problems of:
- Managing context state for various web API services, along with proper documentation
- Handling the overhead of user authentication and OBO (on-behalf-of) behavior
- Integration testing to ensure combinations of several chained behaviors would work as expected for the users they represent.

Here is an example. An e-commerce agent that helps small business owners manage operations across Shopify, Amazon, and Etsy faces several challenges:
- **State Synchronization:** Maintaining consistency of inventory levels, pricing, and customer interactions across platforms that each have their own update frequencies, data models, and requirements.
- **Authentication Complexity:** Managing different API permissions and automated decision-making rules for each marketplace, especially for sensitive operations like refunds or price changes.
- **Platform Dependencies:** Handling partial failures when one platform's API is down or when operations succeed on some platforms but fail on others.

This example illustrates how these challenges compound when building agents that need to operate across multiple web services without standardized interfaces.

![E-Commerce Agent Architecture - Image of the architecture demonstrating the problems mentioned](/res/agent-interfaces/mermaid-ecommerceagentarchitecture.svg)

Without standardized interfaces for agent interactions, developers must create complex state reconciliation systems and handle an explosion of edge cases. A task that should be about business logic becomes buried in platform-specific implementation details.

## The Agent Interface

This idea of an “interface for robots” is not something new. As a matter of fact, that is exactly what traditional APIs are at a primitive level! The “Internet of Things” ecosystem is a strong example of this, and so are financial markets in the world of high-frequency trading.

So what can an agent interface look like?

A proposed implementation would require the following core components:
- **The external-facing interface layer:** The main point of contact agents will communicate with. Their requests and responses are handled at this layer.
- **Internal LLM:** What tool better to manage all knowledge and use of internal APIs than a large language model itself? The key benefit of an “internal llm” is that it is only ever worried about the set of APIs it manages. All of its context and reasoning can be directed towards orchestrating and translating external requests.
- **Translation Engine:** an extension of what the internal LLM itself does, its main job is to transform data between agent and business-logic formats. This handles data type conversions and validations, manages schema mappings, and finally processes business-specific transformations.
- **Business Logic Layer:** Traditionally, where all business workflows are executed. This is what web services traditionally expose to customers, but now would accept calls from the Agent-Interface.

![Agent Interface - Image of how requests are handled](/res/agent-interfaces/mermaid-agentinterfacesequence.svg)

Let’s walk through the steps of how an interaction could work.

**Request Submitted:** Before anything happens this is where an application could handle authentication and initial request processing. This phase establishes the agent’s identity and sets up the context for the interaction. When an agent submits a request, the system verifies not just basic authentication credentials, but establishes a complete identity profile - who the agent is, who it represents, and what types of interactions it’s authorized to perform. The system creates a session context that includes the agent’s historical interactions, permissions,and any relevant business rules that should apply to their requests.

**Understanding Phase:** The internal LLM begins the task of understanding what the agent wants to accomplish.This isn’t just about parsing a request, but rather comprehending the intent and planning how to achieve it within the business’s rules and capabilities. It should identify necessary operations and create a structured plan for execution. This makes it a lightweight agent in itself!

**Execution Phase:** With a clear understanding and plan in place, the translation engine converts the agent’s request into formats that the business’s internal APIs can understand and process. This is where the complexity of working with multiple endpoints and managing state across multiple operations should be handled. If multiple steps are required, the system manages them as a single transaction, ensuring all steps complete successfully or none do. As mentioned in the components explanation, this is still an extension of the LLM’s capabilities, but more narrow-minded and focused on executing and orchestrating the tasks at hand. 

**Response Phase:** The final phase transforms the raw results from the business systems into a format that’s optimal for the calling agent to consume. What happens here is not just data transformation, it’s about providing context that helps the agent make informed decisions. The response should include the traditional “requested data”, but also metadata about the operation’s success, any relevant context about the results, and suggested next steps. This enriched response helps agents understand what happened and give them some degree of confidence and knowledge about the results and what they might want to do next.

## What if I need complete control?

If there is one clear advantage to working with exposed sets of APIs directly and not going through a predefined agent interface, it’s that you get direct control of every knob and switch available to you. 

While it seems counterintuitive to everything we have spoken about so far, there is a set of agents of very focused and narrow-minded agents that will be best served by this paradigm. If your agent will only ever be interacting with a small set of endpoints, complete control is probably in your best interest because the scope of complexity is still manageable and you have nothing to lose by not engaging with an abstraction layer.

## So who is going to build it?

Because this is something that will affect all web services trying to sell themselves as "agent-friendly", I think we all should be taking a crack at this, to some extent.

This is an interesting problem space, and whoever can build an interface that can then be onboarded to several existing web services will have a large market to address. Businesses are much better served only having to connect an interface with their existing applications, ensure that agents can interact with it properly, and maintain it overtime.

If the agent interface is something you are interested in working on, I highly encourage you to do so. The proposed system in this post is all theoretical, so only by getting your hands dirty can you figure out what works well or not. And I would certainly love to learn about what actually works!

***

*Special thanks to [Steve Won](https://www.linkedin.com/in/sjstevewon/) and [Jeremiah Seraphine](https://www.linkedin.com/in/jseraphine/) for reading and providing feedback on the initial draft of this post*