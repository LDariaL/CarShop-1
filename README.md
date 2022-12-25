There is a simple stand with items (cars) for an online-catalog or a shop, with ratings, prices and images, with registration, without cart (but with this option in the back-end potentially). You can choose, delete and modified any of cars!

**Ruby 3.1.2**

**Rails 7.0.4**

**postgreSQL 10.22**

**Rails testing: RSpec & Factory Bot**
![Screenshot from 2022-12-24 03-59-12](https://user-images.githubusercontent.com/112487480/209482554-fa89f205-5e2d-4669-b114-4d8d4bbff36c.png)
![Screenshot from 2022-12-24 04-00-05](https://user-images.githubusercontent.com/112487480/209482557-517420b8-6cbe-4af6-84fe-7b48c74a5b84.png)
![Screenshot from 2022-12-24 04-01-27](https://user-images.githubusercontent.com/112487480/209482561-ff38dafe-4ff8-4df7-b6c7-654c6362d274.png)




To get started with the app, clone the repo and then install the needed gems:
```
$ bundle install 
```

Initialize the database
```
rails db:create db:migrate db:seed
```

Run the app in a local server:
```
$ rails server
```

Opening the application:

> open http://localhost:3000/

If you want to see it "in action", you also need PostgreSQL in your machine, and add your own credentials (user&pass) in the database.yml or edit rails credentials. 
