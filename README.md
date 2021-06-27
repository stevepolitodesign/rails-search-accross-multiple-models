## Step 1: Set up

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

