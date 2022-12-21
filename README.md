There is a simple stand with items (cars) for an online-catalog or a shop, with ratings, prices and images, with registration, without cart (but with this option in the back-end potentially). You can choose, delete and modified any of items.

**Ruby 3.1.2**

**Rails 7.0.4**

**postgreSQL 10.22**

**Rails testing: RSpec & Factory Bot**




To get started with the app, clone the repo and then install the needed gems:
```
$ bundle install 

Initialize the database
```
rails db:create db:migrate db:seed

Run the app in a local server:
```
$ rails server

Opening the application:
```
open http://localhost:3000/
