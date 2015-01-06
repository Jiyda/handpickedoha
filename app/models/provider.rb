class Provider < ActiveRecord::Base
  acts_as_votable
  hobo_model # Don't put anything above this


  fields do
    name        :string, :required
    description :text,   :required
    website     :string
    pricerange  :string
    rating      :string
    imageurl    :string
    timestamps
  end
  attr_accessible :name, :description, :website, :pricerange, :rating, :service, :service_id, :imageurl

  belongs_to :service

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
