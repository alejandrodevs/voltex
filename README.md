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
      ...
    end
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


## Using Voltex with CanCan
Include voltex in your ability class.
```ruby
require 'voltex/cancan/ability'

class Ability
  include CanCan::Ability
  include Voltex::CanCan::Ability

  def initialize(user)
    define_voltex_abilities(user)
  end
end
```


## Including and Excluding permissions
Update your voltex initializer:
```ruby
Voltex.setup do |config|
  # Voltex classes configuration.
  # config.user_class = 'User'
  # config.role_class = 'Role'
  # config.permission_class = 'Permission'
  #
  # Excluding default permissions.
  config.exclude = [
    { resource: 'Payment', action: 'destroy' },
    { resource: 'Post', action: 'update' },
  ]
  #
  # Including other permissions.
  config.include = [
    { resource: 'User', action: 'enable' },
    { resource: 'User', action: 'disable' },
  ]
end
```
And run voltex rake task again:
```
bundle exec rake voltex
```


## Defining role permissions
Mount voltex engine in your application:
```ruby
Rails.application.routes.draw do
  mount Voltex::Engine => '/voltex'
end
```
Run voltex views generator:
```
bundle exec rails g voltex:views
```
This will define a route `/voltex/roles/:id/edit` where
permissions can be defined for each role.
