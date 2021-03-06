class Visitor < ActiveRecord::Base

  def self.total_pageviews
    self.sum { |visitor| visitor.pageview_count }
  end

  def self.total_visits
    self.sum { |visitor| visitor.visit_count }
  end
end
