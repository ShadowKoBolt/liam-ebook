require 'csv'

class Signup < ApplicationRecord
  validates :email, presence: true
  validates :name, presence: { if: :interest? }

  def interest?
    (campaign || "").inquiry.interest?
  end

  def self.to_csv
    attributes = %w{id email name campaign}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |item|
        csv << attributes.map{ |attr| item.send(attr) }
      end
    end
  end
end
