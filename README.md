# Touch Inspiration Interview Project

Thanks for taking the time to complete this exercise. We're excited that you're considering joining our amazing team.

This Rails application is a basic skeleton of an app that serves an API about questions and answers. It already includes 4 basic models:

1.  Question
2.  Answer
3.  User
4.  Tenant

A Question can have one or more answers, and can be private. Every Answer belongs to one question. Each Question has an asker (User), and each Answer has a provider (User).

A Tenant is a consumer of the API you are going to write. A db/seeds.rb file is included to preload the database with test data when you setup the DB.

## You need to accomplish the following tasks:

*   Add a RESTful, read-only API to allow consumers to retrieve Questions with Answers as JSON (no need to retrieve Answers on their own). The response should include Answers inside their Question as well as include the id and name of the Question and Answer users.
*   Don't return private Questions in the API response.
*   Every API request should include a valid Tenant API key, and return an HTTP code of your choice if the request does not include a valid key.
*   Add an JSON dashboard page as the root URL that shows the total number of Users, Questions, and Answers in the system, as well as Tenant API request counts for all Tenants.  Style it enough to not assault a viewer's sensibilities.
*   Add tests around the code you write as you deem appropriate. Assume that the API cannot be changed once it's released and test accordingly.
*   You are welcome to add any models or other code you think you need, as well as any gems.
