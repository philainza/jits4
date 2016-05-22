class Registration < ActiveRecord::Base
  belongs_to :open_mat
  belongs_to :user

  BELT_LEVEL_OPTIONS = [
    'White',
    'Blue',
    'Purple',
    'Brown',
    'Black'
  ]


  GENDER_OPTIONS = [
    'M',
    'F',
    'Other'
  ]

end
