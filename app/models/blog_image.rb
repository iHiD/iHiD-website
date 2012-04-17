class BlogImage < ActiveRecord::Base
  has_attached_file :file, path: ":rails_root/public/system/blog_images/:id_:style.:extension", 
                           url: "/system/blog_images/:id_:style.:extension",
                           styles: {
                              full_width: "700x",
                              thumb: "100x"
                           }
end
