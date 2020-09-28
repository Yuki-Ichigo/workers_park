class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_one :profile, dependent: :destroy

  has_many :company_members, dependent: :destroy
  has_many :companies, through: :company_members
  accepts_nested_attributes_for :company_members

  has_many :works, dependent: :destroy
  has_many :work_companies, through: :works
  accepts_nested_attributes_for :works

  has_many :talk_rooms, dependent: :destroy
  has_many :talk_room_companies, through: :talk_rooms
  accepts_nested_attributes_for :talk_rooms

  has_many :talks, dependent: :destroy
  has_many :talk_rooms, through: :talks
  accepts_nested_attributes_for :talks

  # メッセージ送信側
  # 送信者のUserから見て、宛先（受信者）のUserを(中間テーブルを介して)集める。ユーザーの判別は 'sent_msgs(送信者)'カラムで行う。
  has_many :communicates, foreign_key: 'user_id', dependent: :destroy
  # 中間テーブル(messages)を介して「destination」モデルのUser(宛名)「destination_id」を集めることを「sent(送信済みメッセージ)」と定義
  has_many :sent_msgs, through: :communicates, source: :destination

  # メッセージ受信側
  # 受信者から見て、送信者のUserを(中間テーブルを介して)集める。ユーザーの判別は ’destination_id(宛先)’カラムで行う。
  has_many :receive_communicates, class_name: 'Communicate', foreign_key: 'destination_id', dependent: :destroy
  # 中間テーブル(messages)を介して「user」モデルのUser(送信者)「user_id」を集めることを「received_msgs」と定義
  has_many :received_msgs, through: :receive_communicates, source: :user


  validates :name, presence: true, length: {minimum: 2, maximum: 30}
  validates :name_kana, presence: true, length: {minimum: 2, maximum: 30}, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}
  validates :nic_name, presence: true, length: {minimum: 2, maximum: 10}
  validates :birthday, length: {is: 8}
  validates :email, presence: true, length: {minimum: 5, maximum: 50}
  validates :zip_code, length: {is: 7}, format: { with: /\A[0-9]+\z/, message: 'はハイフンなし、半角数字で入力して下さい。'}
  validates :address_prefecture_name, length: {minimum: 1, maximum: 5}
  validates :address_city, length: {maximum: 15}
  validates :address_line1, length: {maximum: 20}
  validates :address_line2, length: {maximum: 20}
  validates :phone_number, length: {minimum: 3, maximum: 15}, format: { with: /\A[0-9]+\z/, message: 'はハイフンなし、半角数字で入力して下さい。'}

  enum sex: {男性: 0, 女性: 1}
  enum permissions: {nomal: 0, company_rep: 1, admin: 2}

  attachment :image, destroy: false


  def belongs_to?(company)
    self.company_rep? && company.users.include?(self)
  end
end
