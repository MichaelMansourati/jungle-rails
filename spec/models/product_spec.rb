require 'rails_helper'

RSpec.describe Product, type: :model do
  subject { Product.new(name: 'electric bob', price_cents: 100000, quantity: 25, category_id: 2) }

  describe "Validations" do

    it 'is valid' do
      expect(subject).to be_valid
    end

    it "is invalid without a name" do
      subject.name = nil
      expect(subject).to be_invalid
      expect(subject.errors.full_messages).to eq ["Name can't be blank"]
    end

    it "is invalid without a price" do
      subject.price_cents = nil
      expect(subject).to be_invalid
      expect(subject.errors.full_messages).to eq ["Price cents is not a number", "Price cents can't be blank", "Price is not a number"]
    end

    it "is invalid without a quantity" do
      subject.quantity = nil
      expect(subject).to be_invalid
      expect(subject.errors.full_messages).to eq ["Quantity can't be blank"]
    end

    it "is invalid without a category" do
      subject.category_id = nil
      expect(subject).to be_invalid
      expect(subject.errors.full_messages).to eq ["Category can't be blank"]
    end

  end
end