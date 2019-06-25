class AddProducts < ActiveRecord::Migration[5.2]
  def change
    Product.create :title => 'maslini',
                   :description => 'Pizza with olives',
                   :price => 350,
                   :size => 30,
                   :is_spicy => false,
                   :is_veg => false,
                   :is_best_offer => false,
                   :path_to_image => '/images/maslini.jpg'

    Product.create :title => 'mooshrooms',
                   :description => 'Pizza with moshrooms',
                   :price => 450,
                   :size => 30,
                   :is_spicy => false,
                   :is_veg => false,
                   :is_best_offer => false,
                   :path_to_image => '/images/gribi.jpg'

    Product.create :title => 'peperony',
                   :description => 'Amazing vegeterian pizza',
                   :price => 400,
                   :size => 30,
                   :is_spicy => false,
                   :is_veg => false,
                   :is_best_offer => true,
                   :path_to_image => '/images/peperony.jpg'
  end
  end

