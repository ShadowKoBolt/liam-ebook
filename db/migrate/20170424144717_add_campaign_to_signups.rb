class AddCampaignToSignups < ActiveRecord::Migration[5.1]
  def change
    add_column :signups, :name, :string
    add_column :signups, :campaign, :string, default: 'guide'
  end
end
