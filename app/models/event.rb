class Event < ActiveRecord::Base
  #before_validation :date_format

  validates :organizer_name, :title, :organizer_email, :presence => true
  
  before_save :set_date_before_save
  #validates_presence_of :date, :accept "tomorrow"
    # validates :date, presence: true
    # validates that the date is 
    # validate that the email has a .com and @ symbol
  # def date_format
  #   p self.date 
  #   self.date = 
  #   p self.date
  # end


  def set_date_before_save
    self.date = Chronic.parse(self.human_date)
  end

end


