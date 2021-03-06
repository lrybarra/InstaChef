class Recipe < ActiveRecord::Base
  has_many :recipe_procedures
  has_many :procedures, through: :recipe_procedures, source: :procedure
  has_many :ingredients
  has_many :directions

  def self.search(input)
    where("name ILIKE ? ", "%#{input}%")
  end

  def self.sort_courses(type)
    Recipe.all.select do |r|
      r.course == type
    end
  end
end
