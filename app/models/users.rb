class Users < ActiveRecord::Base
  
  validates_presence_of  :username, :name
  validates_uniqueness_of :username, :message => " already exists. Choose another."

  validates_length_of :password, :minimum => 4, :message => " has to have at least 4 characters."

  attr_accessor :password_confirmation
  validates_confirmation_of :password, :message => " not the same with the confirmed passoword. Retry."


  def self.login(username, password)
      user = Users.find(:first, :conditions => ['username = ?' , username])
      if user
          expected_password = encrypted_password(password, user.password_salt)
          if user.password_hash != expected_password
              user = nil
          end
      end
      user
  end

  # password getter
  def password
      @password
  end

  #password setter
  def password=(pwd)
      @password = pwd
      create_new_salt
      self.password_hash = Users.encrypted_password(self.password, self.password_salt)
  end

  # minim 1 utilizator in baza de date
  def safe_delete
      transaction do
          destroy
          if Users.count.zero?
              raise "The application has to have at least one account."
          end
      end
  end
  private

  # create the salt we will use when encrypting the password
  def create_new_salt
      self.password_salt = [Array.new(6){rand(256).chr}.join].pack("m").chomp
  end

  # returs the hash for the password using the salt provided
  def self.encrypted_password(password, salt)
      string_to_hash = password + salt
      Digest::SHA1.hexdigest(string_to_hash)
  end
  
end
