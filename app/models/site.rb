class Site < ActiveRecord::Base
  has_one :business
  has_many :pages

  def readonly?
    true
  end

  def to_h
    # descriptions = self.description.split("\n").reject{ |n| n == "" }
    hash = self.attributes.merge({ business: business.to_h,
                                   pages: pages.sort { |a,b| a.order <=> b.order }.map { |p| p.to_h },
                                   description: self.description.split("\n").reject{ |n| n == "" }
                                  }).except("description")
                            # descriptions: descriptions,
                            # content1_title: "Coffee (CONTENT TITLE1)",
                            # content1_desc: "We use coffee from Cup in Woolloongabba. They roast a seasonal blend just for us and we also offer single origin espresso from them. (CONTENT_DESC1)",
                            # content2_title: "Baking (CONTENT TITLE2)",
                            # content2_desc: "We bake every morning and will always have fresh cakes, pastries and muffins on hand. (CONTENT_DESC2)",
                            # content3_title: "Food (CONTENT TITLE3)",
                            # content3_desc: "Seasonal and simple. Our menu is designed with clean, tasty flavours in mind. (CONTENT_DESC3)",
                            # title1: "FOOD & DRINK (TITLE1)",
                            # title2: "OUR MENU (TITLE2)",
                            # title3: "CONTACT US (TITLE3)",
                            # title_desc1: "ph. 075 6542 8714 (TITLE_DESC1)",
                            # title_desc2: "Seasonal and simple food done well. (TITLE_DESC2)",
                            # main_background_img1: "/layouts/1/table1.jpg",
                            # main_background_img2: "/layouts/1/french-toast.jpg",
                            # main_background_img3: "/layouts/1/table1-pov.jpg",
                            # intro_img1: "/layouts/1/spirit-outside.jpg",
                            # intro_img2: "/layouts/1/espresso.jpg",
                            # intro_img3: "/layouts/1/baking.jpg",
                            # intro_img4: "/layouts/1/eggs-hash.jpg"

  end
end
