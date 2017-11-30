class Song < ApplicationRecord
  belongs_to :album
  belongs_to :billboard, optional: true
end
