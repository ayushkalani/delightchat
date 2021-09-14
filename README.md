# Welcome to Analytics Dashboard!

For the person who runs the e-commerce business, it is important to understand how much our tool is helping them and how efficiently their support agents are working and therefore they would require an analytics dashboard to view the following metrics. 

# Problem Statement

There are 3 parts to this project which is built using a [Django](https://www.djangoproject.com/) application.

1.  Designing the backend tables/models needed in order to expose the above analytics over APIs.
2.  Designing APIs that will be called when certain events take place in our system in order to record these metrics in the backend models.
3.  Designing APIs to expose the above analytics to a UI which can then render these analytics.

Each of these parts are described in detail below.

### Part 1

Database models must be designed in a way that the data is already stored in an aggregated way. You can aggregate the data hourly/daily and store it in the db instead of running a `count()` or a `sum()` query on all the individual rows. This is to ensure low query time and fast API response.

You can still use aggregate functions but only on a reduced dataset.

The models must be written using all the conventions that are to be followed when writing models in Django. You can find more information [here](https://docs.djangoproject.com/en/3.1/topics/db/models/).

Host these tables on a **PostgresSQL** database on any free cloud provider that you are comfortable with. You could sign up for a free trial on AWS, or you could use Heroku.

### Part 2

In order to record these metrics in the database models you create in part 1, the app backend that is hosting the support tool will fire an API call when certain events take place. Some examples for these events are :

-   New conversation gets created
-   Agent replies to a conversation
-   Agent closes a conversation after it got resolved
-   A conversation is assigned to an agent

Each of these events would contain certain metadata such as:

-   Details of the support agent
-   Details of support channel

We want you to create an API or a set of APIs which accept these events along with their meta data as an input and record the metrics in your database tables. The business logic must be written in a way that these events will be fired in real time and therefore the metrics must adapt and update accordingly.

The API/APIs must be written using [Django Rest Framework](https://www.django-rest-framework.org/) which contains boilerplate code for various things including CRUD operations and serialization of data in request and response. The code you write must therefore focus on the main business logic while the rest of the things are taken care of by DRF. **The lesser the code you write, the better it is.**

These APIs must be authenticated using [Token based authentication](https://www.django-rest-framework.org/api-guide/authentication/#tokenauthentication). Once again this can be done easily using DRF and we don't want you to spend extra time building an auth layer.

**Note:** It is possible that some events and metadata got missed in the above description. The expectation is that you use the figma file to figure out what all events and metadata are needed to make the UI look the way it looks.

### Part 3

This part is quite straightforward where you expose GET APIs to return the data that can then be used by a UI to render the analytics shown in the above design.

These APIs must also be written using [Django Rest Framework](https://www.django-rest-framework.org/) and just like the APIs in part 2, these APIs must also be authenticated using token based auth.

