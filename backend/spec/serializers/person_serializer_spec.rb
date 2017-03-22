require 'rails_helper'

describe PersonSerializer do
  let(:object) { create(:person) }
  let(:serializer) { ActiveModelSerializers::SerializableResource.new(object) }
  subject { serializer.as_json }

  let(:expected_json) do
    {
      id: object.id,
      given_name: object.given_name,
      family_name: object.family_name
    }
  end

  it 'renders the expected attributes' do
    expect(subject).to eq(expected_json)
  end
end
