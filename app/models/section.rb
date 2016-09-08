class Section < ActiveRecord::Base
	has_many :section_edits
	has_many :editors, :through => :section_edits, :class_name => "AdminUser"
	belongs_to :page

  	acts_as_list :scope => :page

  	after_save :touch_page 
	  	# after_destroy :delete_related_sections
	CONTENT_TYPES = ['text','HTML']
	validates_presence_of :name
	validates_length_of :name, :maximum => 255
	validates_inclusion_of :content_type, :in => CONTENT_TYPES,
		:message => "must be one of: #{CONTENT_TYPES.join(', ')}" 
	validates_presence_of :content

  	scope :visible, lambda { where(:visible => true) }
  	scope :invisible, lambda { where(:visible => false) }
  	scope :sorted, lambda { order("sections.position ASC") }
  	scope :newest_first, lambda { order("sections.created_at DESC")}

  	private

    def touch_page
      page.touch #updates time of update
    end


    def delete_related_sections
   		self.sections.each do |section|
   	 	# section.destroy
   		end	
    end
end
