class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :Admin
  has_many :Items
  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :addresses, dependent: :destroy
  
  validates :first_name, presence:true
  validates :last_name, presence:true
  validates :first_name_kana, presence:true
  validates :last_name_kana, presence:true
  validates :post_code, presence:true
  validates :address, presence:true
  validates :telephone_number, presence:true
  
  # 会員フルネーム
  def full_name
    self.last_name + " " + self.first_name
  end
  
  # 会員カナフルネーム
  def full_name_kana
    self.last_name_kana + " " + self.first_name_kana
  end
  
  
end
