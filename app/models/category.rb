class Category < ActiveRecord::Base
    
    has_many :discussions
    
    validates_presence_of :name
    
    acts_as_list
    
    class << self

        # Enable work safe URLs
        def work_safe_urls=(state)
            @@work_safe_urls = state
        end

        def work_safe_urls
            @@work_safe_urls ||= false
        end

    end
    
    
    # Humanized ID for URLs
    def to_param
        (Discussion.work_safe_urls) ? self.id : "#{self.id}-" + self.name.downcase.gsub(/[^\w\d]+/,'_')
    end
    
end
