class Page < ActiveRecord::Base
  attr_accessible :page_content, :page_name, :header_content
end
