require_relative('contact.rb')


class Rolodex
  attr_reader :contacts
  def initialize
    @contacts = []
    @@id = 1000
  end

  def add_contact(id, first_name, last_name, email, note)
    contact = Contact.new(@@id, first_name,last_name, email, note)
    @@id += 1

    @contacts << contact
  end

  def all
    @contacts
  end

  def find(id)
    @contacts.find {|contact| contact.id == id}

  end
end
