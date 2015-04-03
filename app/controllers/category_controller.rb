class CategoryController < ApplicationController
  private

  def category_params
    params.require(:category).permit(:name, :category_id )
  end
end
