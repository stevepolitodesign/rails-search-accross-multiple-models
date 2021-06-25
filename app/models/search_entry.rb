class SearchEntry < ApplicationRecord
  delegated_type :searchable, types: %w[ Post User ]
end
