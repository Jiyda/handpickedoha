class Service < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name        :string, :required, :unique
    description :text
    imageurl    :string
    timestamps
  end

  attr_accessible :name, :description, :category, :category_id, :imageurl

  belongs_to :category
  has_many  :providers
  children  :providers

  
  # --- Permissions --- #

  def create_permitted?
    acting_user.administrator?
  end

  def update_permitted?
    acting_user.administrator?
  end

  def destroy_permitted?
    acting_user.administrator?
  end

  def view_permitted?(field)
    true
  end

end
