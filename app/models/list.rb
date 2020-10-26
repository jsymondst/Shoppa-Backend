class List < ApplicationRecord

    has_many :items, dependent: :destroy
    has_many :rights, dependent: :destroy
    has_many :users, through: :rights

    validates :urlindex, { presence: true, uniqueness:true}

    def List.create_url_index    
        url_string = SecureRandom.alphanumeric(8)
        until List.where(urlindex:url_string).length==0
            url_string = SecureRandom.alphanumeric(8)
        end

        return url_string
    end

end
