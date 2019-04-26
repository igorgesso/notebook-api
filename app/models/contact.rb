class Contact < ApplicationRecord
#Associations
belongs_to :kind, optional: true
has_many :phones
has_one :address

accepts_nested_attributes_for :phones, allow_destroy: true
accepts_nested_attributes_for :address, update_only: true



    # def kind_description
    #     self.kind.description
    # end

    # def as_json(options={})
    #     super(
    #         root: true,
    #         methods: :kind_description,
    #         include: {kind: {only: :description}}        
    #     )
    # end
end
