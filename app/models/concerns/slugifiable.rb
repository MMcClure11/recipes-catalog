module Slugifiable

  module InstanceMethods
    def slug 
      self.name.gsub(/[^_\.\$\+\*'\(\)\,\-!A-Za-z0-9]/, "-").downcase
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      self.all.find {|instance| instance.slug == slug}
    end
  end

end