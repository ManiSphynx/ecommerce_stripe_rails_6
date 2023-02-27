# Finance app 📈
this is a project with rails 6 and ruby 3 that demonstrates my skills implementing a payment gateway like stripe in a basic but fun level.

### Requirements 💻
To run this project, you need to have installed:

* Ruby >= 3
* Rails >= 6
* Bundler 
* Create an account at https://stripe.com/es-mx and get your public and secret api key.
* Add the secrets to your environment variables.

### Tech Stack 🙌

- Ruby 3.0.1
- Rails 6.1.4
- Yarn 1.22.10
- PostgreSQL 13.3

### Important gems 💎

- Devise
- Pundit
- TailwindCSS-rails
- dotenv-rails
- Faker
- Stripe

### Installation ⚙️
1. Clone this repository to your local machine:

```bash 
git clone https://github.com/ManiSphynx/ecommerce_stripe_rails_6
```

2. Install the dependencies:

```bash 
bundle install
yarn install
```

3. Create the database:

```bash 
rails db:migrate
```

4. Optionally, you can seed some test data into the database:

```bash 
rails db:seed
```

### Usage 👨‍💻

1. Start the Rails server:

```bash 
rails server
```

2. Open your web browser and visit the address http://localhost:3000.
3. Add products to cart.

* Optionally run bundle exec rails webpacker:install

### Contributing 🤝

If you want to contribute to this project, please create a pull request with your changes and I'll be happy to review them.

### License 👮‍♂️

This project is available under the MIT License. For more details, please read the LICENSE file.


