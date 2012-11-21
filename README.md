Rails Example - Get To Know : Global Voices
===========================================

Small example Rails applicaton for the MAS.s60 course.

Installation
------------

Make sure you have Ruby 1.9 or higher installed (with RubyGems, the package manager).

Then make sure you have bundler installed:
```
gem install bundler
```

Then use that to install all the dependencies listed in the Gemfile:
```
bundle install
```

Then create the database and import the Global Voices path data:
```
rake db:migrate
rake gv:import
```

Use
---

Run the local rails server and then hit your http://localhost:5000/
```
rails server
```
