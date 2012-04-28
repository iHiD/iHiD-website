class BlogImage < ActiveRecord::Base
  has_attached_file :file, 
    path: "blog_images/:id_:style.:extension", 
    storage: :s3,
    bucket: ENV['S3_BUCKET_NAME'],
    :s3_credentials => {
      :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
      :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
    },
    styles: {
      full_width: "700x",
      thumb: "100x"
    }
end
