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
                        id: item.id,
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
                id: list.id,
                icon: list.icon,
                urlindex:list.urlindex,
                items: list.items.map{|item| {
                    id: item.id,
                    name: item.name,
                    category: item.category,
                }}
            }
            render json: list_hash, status: :ok
        end
    end

    def create
        puts list_params
        list = List.new(name:list_params[:name], icon: list_params[:icon])
        list.urlindex = List.create_url_index

        if list.save
            list_hash ={
                name: list.name,
                id: list.id,
                icon: list.icon,
                urlindex:list.urlindex,
                items: list.items.map{|item| {
                    id: item.id,
                    name: item.name,
                    category: item.category,
                }}
            }
            Right.create(list:list, user:current_user)
            render json: list_hash, status: :ok
        else
            render json: {message: "List not created"}, status: :conflict
        end

    end

    def delete 
        list = List.find_by(id: params[:id])
        if list.users.any?{|user| user == current_user} 
            list.destroy
            render status: :ok
        else
            render status: :unauthorized
        end
    end

    private

    def list_params 
        puts params
        params.require(:list).permit!
    end

end
