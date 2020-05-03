class Subject < ApplicationRecord
  enum status: ['new', 'old']
end
