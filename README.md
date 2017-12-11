# Pretium
#### A simple, minimalistic cryptocurrency price tracking web application, built with Ruby on Rails

### How to run
1. Clone the repository with
```
git clone https://github.com/alexpotter1/Pretium
```
2. Set up database tables according to `db/schema.rb`, using:
```
rake db:schema:load
```
**Note: Do this rather than running `rake db:migrate`; it works better for initial setup.**

3. Run with Rails
```
rails server -p 8080
```
4. Check out the app that's now running at 
```
localhost:8080 or 127.0.0.1:8080 or ::1:8080
(depending on ipv4/ipv6 support)
```

*Note: This is not a production quality application*


### Supporting software used
Several gems and plugins are used in this project to make it possible. Thanks to the devs of these awesome gems and plugins:
* Chartkick: [github.com/ankane/chartkick](https://github.com/ankane/chartkick)
* Groupdate: [github.com/ankane/groupdate](https://github.com/ankane/groupdate)
* Chart.js: [chartjs.org](http://www.chartjs.org)

And of course:
* Ruby on Rails: [github.com/rails](https://github.com/rails/rails)
* Bootstrap 4: [getbootstrap.com](https://getbootstrap.com)
