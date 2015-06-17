require_relative('contact.rb')


class Rolodex
  attr_reader :contacts
  def initialize
    @contacts = []
    @@highest_id = 1000
  end

  def add_contact( first_name , last_name , email , note)
    contact = Contact.new(@@highest_id, first_name,last_name, email, note)
    @@highest_id += 1

    @contacts << contact
  end

  def all
    @contacts
  end
end
