class Device < ActiveRecord::Base
	attr_accessor :image_data_encoded

	belongs_to :person

  	has_attached_file :avatar, :styles => { :medium => "100x130>"}
  	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  	before_save :decode_avatar_data, :avatar_url

	def decode_avatar_data
		if self.image_data_encoded.present?
			data = StringIO.new(Base64.decode64(self.image_data_encoded))
		    data.class.class_eval {attr_accessor :original_filename, :content_type}
		    data.original_filename = self.id.to_s + ".png"
		    data.content_type = "image/png"

		    self.avatar = data
		end
	end

	def avatar_url
        self.image_url = "http://cryptic-journey-8537.herokuapp.com" + avatar.url(:medium)
    end

end
