# Voltex
This engine aims to provide an easy way to work with dynamic permissions.


## Compatibility
* Rails 4+
* ActiveRecord 4+
* Ruby 2+


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
      # Voltex classes configuration.
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


## Using Voltex with Pundit
Include voltex in your application policy.
```ruby
require 'voltex/pundit'

class ApplicationPolicy
  include Voltex::Pundit
end
```
Now a new helper is available in your policies.
```ruby
class PostPolicy
  def index?
    permission?(Post, :index)
  end
end
```
