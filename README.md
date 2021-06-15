# Pessable Project
This is a simple rails application. User can login and signup and can also invites his friends to the application.

## Acceptance Criteria
- Create a new Rails application - preferably matchingour current stack of Railsversion 6.0.x and Ruby version 2.6.x2.
- Use your database of choice.
- Application should allow for users to create an accountand log in.
  a.Preferably with no additional full suite gems, suchas Devise (Hint: try using bcrypt)
  b.There is no need to send any account related emails(Welcome, PasswordReset, etc)
  c.Passwords that are set should be a secured password,not stored in plaintext, so that the user has a secure password storedin the database.
- Users that are not logged in should not be able toget to your logged in userpage.
- Accounts that log in normally should not be assignedany roles.
- Accounts that are logged in should be able to sendan invite to new users.
  a.An email does not actually need to be sent to an inviteduser.
  b.Have an input shown to logged in users where theyenter an email andwhen the “email is sent” a new account is createdfor the invited user, apassword is set for the invitee as “password,” andthey are assigned therole of “friend.”
  c.When a “friend” account logs in, they should see somethingspecial in theiraccount that lets them know they are an invited friend.
- Setup a versioned RESTful API endpoint (Versioningthrough URI Path) that canhave a GET request sent to it that returns a listof all the users that are friends ofa specified user, as JSON. For example, I want tobe able to make a request toget some information about the friends for a userwho has the id 1.a.This API endpoint does not need to be protected withAPI Keys

## Requirements
- Ruby 2.6.3
- Rails 6.0.3.6
## Database
- Postgres 13.2
## Installation steps
- git clone git@github.com:dev-asadhameed/Pressable.git
- cd pressable
- `bundle install`
- `yarn`
- `rake db:create` `rake db:migrate`
- `rails s`
## If I had extra time
- I can write test cases.
- Improvements in UI/UX.
## Quick start for local development
The application will be running at http://localhost:3000/
