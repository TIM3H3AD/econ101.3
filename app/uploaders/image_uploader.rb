class ImageUploader < CarrierWave::Uploader::Base
  
  include Cloudinary::CarrierWave
  
  version :standard do
    process :eager => true
    process :resize_to_fill => [300, 300, :center]
    process :convert => 'jpg'   
    cloudinary_transformation :quality => 90       
  end
  
  version :thumbnail do
    process :eager => true
    process :resize_to_fill => [150, 150, :center]
    process :convert => 'jpg'   
    cloudinary_transformation :quality => 90 

  end
  
   version :smoke do
    process :eager => true
    process :resize_to_fill => [150, 150, :center]
    cloudinary_transformation :transformation => [{:effect => "cartoonify:2:bw"},{:effect => "replace_color:orange:25:black"}]
    cloudinary_transformation :quality => 90 
    process :convert => 'jpg'   
    
  end
   version :welcome do
    process :eager => true
    process :resize_to_fill => [300, 300, :center]
    cloudinary_transformation :transformation => [{:effect => "cartoonify:2:bw"},{:effect => "replace_color:orange:100:black"}]
    cloudinary_transformation :quality => 90 
    process :convert => 'jpg'   
    
  end
  
end




