---
layout: post
comments: true
title : My Journey To Winning Amazon's Hackathon
categories: [Hackathon, Amazon]
---


`Raise up Build-a-thon` was an online event presented by AWS whose aim was to Build sustainable solutions using AWS to ensure the survival of nonprofits and cultural institutions.

Here is how we used SDLC(Software Development Life Cycle) in our hackathon project. This is just to give you an insight into how we moved from the Planning phase to the Development phase for our hackathon project.

## Planning
When we began this project we started by watching the keynote presentation and taking notes to gather insights about the problems nonprofit organizations are currently facing. We decided to use a design sprint methodology to turn these insights into a solution by re-framing key information as How Might We questions which were following by grouping certain themes into an Affinity Diagram, a Note-N-Map exercise, Lightning Demos, and more. Given the massive scope of the problem and the generous amount of information we were provided with at the start, we found that running this process remotely through Miro helped to narrow down big problems into achievable solutions within a short period.

![team work](https://res.cloudinary.com/dcrzh66on/image/upload/v1595432286/Cloutvocate/Team_Work_sqcwts.png)
[Diagram showing teamwork and service architecture]

![value proposition](https://res.cloudinary.com/dcrzh66on/image/upload/v1595445705/Cloutvocate/Cloutvocate_Value_Model-05_czz6se.png)
[Diagram that shows how this project incorporates value to non profit organisation]


## Defining

For this hackathon [Hendy](https://www.linkedin.com/in/hendyirawan) suggested that we should use [Graphql](https://graphql.org) as the query language and also suggested [Strapi](https://strapi.io) as a CMS. It was particularly new for everyone but since Hendy was comfortable using this software we decided to go with it.

For the frontend part, we decided to use Angular as the frontend language as I was working on the frontend part and I was comfortable working with it.

We needed everything to be hosted on the AWS as per the hackathon's rules so we decided to use an EC2 instance to deploy the Strapi, AWS Amplify for hosting the frontend part, and RDS to host the Postgres database for Strapi.

![Defining the components](https://res.cloudinary.com/dcrzh66on/image/upload/v1595362124/Cloutvocate/image_luowdq.png)
[Diagram showing the complete distribution of services]


### Designing the Product Architecture

We started by creating a `user flow diagram` incorporating all three types of users.

This gave all the team members a robust understanding of the application and how the MVP for this hackathon would look like.

![User Flow Diagram](https://res.cloudinary.com/dcrzh66on/image/upload/v1595080915/User_Flow_tl9qoa.png)
[Diagram showing the User Flow for the project]

### Building and Testing the products

We started building the product 10 days before the deadline even though the hackathon was 2 months long (we took too long for the planning part xD) and so we started with defining the database structure and started with the frontend part of the application. Thanks to the 1 week extension that they gave us. We were able to finish the project.

### Submission

This is the most important part of a hackathon (in my opinion). We started working on the video and the submission blog on the devpost page. This is where we needed to present our idea in such a way that the person viewing our submission can see the potential in our project. So no lagging behind in this part of the hackathon.

### Conclusion

Overall this was an awesome experience, I learnt a lot of great things from this hackathon like using Strapi, Youtube's api, Graphql most importantly working as a team. Also, I met a lot of cool people ([Kori](https://www.linkedin.com/in/koriskeffington/), [Romeo](https://www.linkedin.com/in/romeo-radanyi-9a815882/), [Hendy](https://www.linkedin.com/in/hendyirawan/), [Michelle](https://www.linkedin.com/in/michelle-z-54594a138/), [Shelli](https://www.linkedin.com/in/shelligorokhovsky/)).



Project's source code : <https://gitlab.com/theinfluencers>

Read about the project in depth : <https://devpost.com/software/cloutvocate>

Raise-up Buildathon : <https://amazonraiseup.devpost.com>