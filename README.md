# Voltex
This engine aims to provide an easy way to work with dynamic permissions.


## Installation
1. Add Voltex to your Gemfile.

```ruby
gem 'voltex'
```

2. Generate voltex initializer.

```
rails g voltex:install
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
rails g voltex:resources
```

5. Migrate your database.

```
rails db:migrate
```

6. Create default permissions.

```
rake voltex
```

7. Load current user permissions in your application controller.

```ruby
class ApplicationController < ActionController::Base
  ...
  before_action :set_current_permissions
end
```

By default this callback preloads permissions for `current_user` if this
is defined. If you need that this callback preloads permission for
another user just overwrite `voltex_user` method.

Example:

```ruby
class ApplicationController < ActionController::Base
  ...
  def voltex_user
    # Default is current_user.
    another_awesome_user
  end
end
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
require 'voltex/cancan'

class Ability
  include CanCan::Ability
  include Voltex::CanCan

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
rake voltex
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
rails g voltex:views
```

This will define a route `/voltex/roles/:id/edit` where
permissions can be defined for each role.
