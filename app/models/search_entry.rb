class SearchEntry < ApplicationRecord
  delegated_type :searchable, types: %w[ Post User ]

  validates :searchable_type, uniqueness: { scope: :searchable_id }
end
