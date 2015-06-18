class Contact
  attr_accessor :first_name, :last_name, :email, :note
  attr_reader :highest_id

  def initialize(highest_id, first_name, last_name, email, note)
    @highest_id = highest_id
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
  end
end

