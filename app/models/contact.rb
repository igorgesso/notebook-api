class Contact < ApplicationRecord
belongs_to :kind, optional: true

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
