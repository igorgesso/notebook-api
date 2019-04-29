class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birthdate

  belongs_to :kind do
    link(:related) {kind_path(object.kind.id)}
  end
  has_many :phones
  has_one :address

  #link(:self) {contact_path(object.id)}

  meta do
    { author: "Igor Rezende"}
  end

  def attributes(*args)
    h = super(*args)
    h[:birthdate] = object.birthdate.to_time.iso8601 unless object.birthdate.blank?
    h  
  end
end
