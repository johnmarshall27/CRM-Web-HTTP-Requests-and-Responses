require_relative('contact.rb')

class Rolodex

  def initialize
    @contacts = []
    @@id = 1000
  end

  def add_contact(first_name, last_name, email, note)
    contact = Contact.new(@@id, first_name,last_name, email, note)
    @@id += 1

    @contacts << contact
  end

  def all
    @contacts
  end
end
