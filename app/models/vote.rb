class Vote < ActiveRecord::Base
	# belongs_to :provider ,:class_name=>"Vote",:foreign_key => :votable_id

	belongs_to :votable, :polymorphic => true
	belongs_to :provider,:class_name=>"Provider",:foreign_key => :votable_id
end