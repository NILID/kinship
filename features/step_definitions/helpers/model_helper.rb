module ModelHelper
  class << self
    def to_resource(string)
      to_class_name(string).underscore.pluralize
    end

    def to_class(string)
      to_class_name(string).constantize
    end

    def to_class_name(string)
      Rails.application.eager_load!
      ActiveRecord::Base.descendants.
        map(&:name).
        select{|m| m =~ /#{string.singularize}/i}.
        first
    end
  end
end
