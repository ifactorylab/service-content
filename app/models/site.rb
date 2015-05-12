class Site < ActiveRecord::Base
  has_one :business
  has_many :pages

  def readonly?
    true
  end

  def to_h
    # descriptions = self.description.split("\n").reject{ |n| n == "" }
    hash = self.attributes.merge({ business: business.to_h,
                                   pages: pages.sort { |a,b| a.order <=> b.order }.map { |p| p.to_h }
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
                            }).except("description")
    pages_body = {}
    contents_body = {}
    pages.each do |page|
      id = (page.order.to_i + 1).to_s
      pages_body["title#{id}".to_sym] = page.title
      pages_body["title_desc#{id}".to_sym] = page.description
      pages_body["main_background_img#{id}".to_sym] = page.background_url

      page.contents.each do |content|
        order = (content.order.to_i + 1).to_s
        contents_body["content#{order}_title".to_sym] = content.title
        contents_body["content#{order}_desc".to_sym] = content.description.split("\n").reject{ |n| n == "" }
        contents_body["intro_img#{order}".to_sym] = content.image_url
      end
    end
    hash.merge!(pages_body)
    hash.merge!(contents_body)
  end
end
