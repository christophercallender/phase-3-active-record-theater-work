class Role < ActiveRecord::Base
   has_many :auditions

   def actors
      self.auditions.map { |audition| audition.actor }
   end

   def locations
      self.auditions.map { |audition| audition.location }
   end

   def lead
      self.auditions.where(hired: true).first || 'no actor has been hired for this role'
   end

   def understudy
      self.auditions.where(hired: true).second || 'no actor has been hired for understudy for this role'
   end
end
