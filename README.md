== Welcome to Ripple

Ripple is a web-application built upon Rails.  This application manages and
automates functions for the Resound School of Music. The core functionality
of this application is the management of students, teachers and their
respective schedules.

== Getting Started

1. To run the application, type the following at the command prompt at the root of the project directory:
      <tt>rails server</tt>

2. Open your web browser and go to the following url:
      <tt>http://localhost:3000</tt>

== Running the tests

To run the Rspec test suite, type the following at the command prompt in the root of the project directory:
      <tt>bundle exec rspec spec/</tt>

== Heroku

To view the application at heroku, visit the following url in your web browser:
      <tt>http://ripple-app.herokuapp.com/</tt>
      
To deploy the app on Heroku, do the following:
      <tt>git push heroku</tt>
      <tt>heroku run rake db:migrate</tt>
