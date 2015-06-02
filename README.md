# Voltex
This engine aims to provide an easy way to work with dynamic permissions.


## Installation
1. Add Voltex to your Gemfile.

    ```ruby
    gem 'voltex'
    ```

2. Generate voltex initializer.

    ```
    bundle exec rails g voltex:install
    ```

3. Update initializer according your needs.

    ```ruby
    Voltex.setup do |config|
      # Configurable options should be here.
      # config.user_class = 'User'
      # config.role_class = 'Role'
      # config.permission_class = 'Permission'
    ```

4. Generate voltex resources.

    ```
    bundle exec rails g voltex:resources
    ```

5. Migrate your database.

    ```
    bundle exec rake db:migrate
    ```

6. Create default permissions.

    ```
    bundle exec rake voltex
    ```
