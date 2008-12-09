class User < ActiveRecord::Base
  
  attr_accessor :pwd
  
  before_save :encrypt_pwd
  
  belongs_to :profile
  has_and_belongs_to_many :ideas
  
  
  def self.encrypt(pass, salt)
    Digest::SHA1.hexdigest("--#{salt}--#{pass}--")
  end
  
  def self.authenticate(email, pwd)
    user = find_by_email(email)
    user && user.authenticated?(pwd) ? user : nil
  end
  
  def participate_on(idea)  
      ideas << idea
  end
  
  def working_on_ideas
    idea_ids = []
    for i in ideas do
      idea_ids << i.id
    end
    idea_ids
  end

  
  def encrypt_pwd
    return if pwd.blank?
    if new_record?
      self.salt = Digest::SHA1.hexdigest("--#{Time.now}--#{email}--" )
    end
    self.enc_pwd = User.encrypt(pwd, salt)
  end
  
  def need_to_validate_pwd?
    #enc_pwd.blank? || !pwd.blank?
    puts enc_pwd.blank? || !pwd.blank?
  end
  
  def authenticated?(pass)
    enc_pwd == User.encrypt(pass, salt)
  end
  
end
