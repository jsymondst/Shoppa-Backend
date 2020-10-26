class ListsController < ApplicationController


    def index
        all_lists = current_user.lists.map{|list|
            {
                name: list.name,
                id:list.id,
                icon:list.icon,
                urlindex:list.urlindex,
                items: list.items.map{|item|
                    {
                        name:item.name,
                        category: item.category,
                    }
                }
            }
        }
        render json:{all_lists: all_lists}, status: :ok
    end

    def show
        list = List.find_by(id: params[:id])
        if !list
            render json:{error: "list not found"}, status: :not_found
        elsif !list.users.any?{|user| user.id== current_user.id}
            render json: {error: "not authorized"}, status: :unauthorized
        else
            list_hash ={
                name: list.name,
                list: list.id,
                icon: list.icon,
                urlindex:list.urlindex,
                items: list.items.map{|item| {
                    name: item.name,
                    category: item.category,
                }}
            }
            render json: list_hash, status: :ok
        end
    end

end
