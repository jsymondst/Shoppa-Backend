class ExampleitemsController < ApplicationController

    skip_before_action :authorized, only: [:index]

    def index
        all_items = Exampleitem.all.map{|item|
            ExampleitemSerializer.new(item)
        }
        all_categories = Exampleitem.select("category").group("category").map{
            |i|
            i.category
        }

        render json: {exampleitems: all_items, categories: all_categories}, status: :ok
    end

end
