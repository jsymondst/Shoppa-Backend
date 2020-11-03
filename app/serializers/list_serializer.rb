class ListSerializer < ActiveModel::Serializer
  attributes :id, :name, :icon, :urlindex, :items, :created_at, :updated_at

  def items
    self.object.items.map{|item|
      {
        id: item.id,
        name: item.name,
        category: item.category,
      }
    }
  end
end
