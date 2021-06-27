## Step 1: Set Up

1. Create a new Rails application.

```
rails new rails-search-accross-multiple-models
```

2. Generate a Post and User Scaffold.

```
rails g scaffold Post title body:text
rails g scaffold User name biography:text
```

## Step 2: Create a Model to Store Search Entries

1. Create a SearchEntry model.

```
rails g model SearchEntry title body:text searchable:references{polymorphic}
```

2. Convert the SearchEntry model to a Delegated Type

``` ruby
# app/models/search_entry.rb
class SearchEntry < ApplicationRecord
  delegated_type :searchable, types: %w[ Post User ]
end
```

> **What's Going On Here?**
>
> - We give the model a title and a body to standardize what columns we will be able to search against.
> - The model will connect other models through a [polymorphic association](https://guides.rubyonrails.org/association_basics.html#polymorphic-associations). This means we can make any model searchable.
> - We use a [delegated type](https://api.rubyonrails.org/classes/ActiveRecord/DelegatedType.html) to connect the SearchEntry model with the Post and User models. 

3. Create a Searchable Concern

``` ruby
# app/models/concerns/searchable.rb
module Searchable
  extend ActiveSupport::Concern

  included do
    has_one :search_entry, as: :searchable, touch: true
  end    
end 
```

```ruby
# app/models/post.rb
class Post < ApplicationRecord
  include Searchable
end
```

```ruby
# app/models/user.rb
class User < ApplicationRecord
  include Searchable
end
```

> **What's Going On Here?**
>
> - We create a [concern](https://api.rubyonrails.org/classes/ActiveSupport/Concern.html) to be shared across the Post and User model. This is not required, but helps keep our code DRY.
> - The concern is simply connecting the Post and User models to the SearchEntry model. When the Post and User model is updated, the associated SearchEntry model will have it's `updated_at` column updated. This is because we're calling `touch: true`. That part is not required, but helps keep things consistent between models. 

## Step 3: Use Callbacks to Dynamically Create, Update and Destroy SearchEntry Records.

1. Add the following callbacks to the Post and User models.

```ruby
# app/models/post.rb
class Post < ApplicationRecord
  include Searchable

  after_commit :create_search_entry, on: :create
  after_commit :update_search_entry, on: :update
  after_commit :destroy_search_entry, on: :destroy

  private

    def create_search_entry
      SearchEntry.create(title: self.title, body: self.body, searchable: self)
    end

    def update_search_entry
      self.search_entry.update(title: self.title, body: self.body) if self.search_entry.present?
    end

    def destroy_search_entry
      self.search_entry.destroy if self.search_entry.present?
    end
end
```

```ruby
# app/models/user.rb
class User < ApplicationRecord
  include Searchable

  after_commit :create_search_entry, on: :create
  after_commit :update_search_entry, on: :update
  after_commit :destroy_search_entry, on: :destroy

  private

    def create_search_entry
      SearchEntry.create(title: self.name, body: self.biography, searchable: self)
    end

    def update_search_entry
      self.search_entry.update(title: self.name, body: self.biography) if self.search_entry.present?
    end

    def destroy_search_entry
      self.search_entry.destroy if self.search_entry.present?
    end    
end
```
