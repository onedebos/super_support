# SuperSupport API

This is a customer support application that allows for 3 user roles: Admin, Agents and Customers. Admins can make other users Admins and can see all tickets created on the system. Agents can change the status of a ticket and can leave comments on tickets. Customers cannot comment on a ticket till an Agent or Admin has commented on it.

## Technologies used in this API

- Rails
- JWT
- Rack-cors

## Getting Started

**To get started, follow the instructions below**

To get a local copy up and running follow these simple example steps.

- Ensure you have ruby 2.5.1 and Rails 6 installed on your achine

- Ensure you have MySQL installed on your machine. Update the `config/database.yml` file to use YOUR MySQL user DB credentials.

- Run bundle to install the required gems

```
bundle install
```

- Create and migrate the DB

```
rails db:create db:migrate
```

- Seed the DB

```
 rails db:seed
```

- run the rails server

```
rails s
```

### Automated Tests

- Code coverage on this application is currently at 97% (using SimpleCov ).
- To run tests, simply run

```
 bundle exec rspec
```

### Planned Features/improvements

- CI/CD with TravisCI
- Use FactoryBot for Seeding
- Implement social-auth for faster sign-ups and sign-in
- Dockerize application

### Endpoints

- All endpoints start with

```
/api/v1
```

- To see a full list of all endpoints, run

```
rails routes
```

- All users are given the "customer" role on sign up. To update a user's role, use the rails c by entering `rails c` in the terminal. Then

```
user = User.find(id_of_user_to_make admin)
user.update(role: "admin")
```

## Authors

👤 **Adebola Adeniran**

- Github: [@githubhandle](https://github.com/onedebos)
- Linkedin: [linkedin](https://www.linkedin.com/in/adebola-niran/)
- Portfolio: [portfolio](https://www.adebola.dev/)

## 📝 License

This project is [MIT](lic.url) licensed.

```

```
