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
