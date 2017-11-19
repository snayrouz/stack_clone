require 'rails_helper'

describe 'tags API' do
  it 'can sends all tags' do
    create_list(:tag, 3)

    get "/api/v1/tags"

    tags = JSON.parse(response.body)

    expect(response).to be_success
    expect(tags.count).to eq(3)
  end

  it 'can send one tag' do
    id = create(:tag).id

    get "/api/v1/tags/#{id}"

    tag = JSON.parse(response.body)

    expect(response).to be_success
    expect(tag["id"]).to eq(id)
  end

  it 'can create an tag' do
    tag_params = {name: 'Java'}

    post "/api/v1/tags", params: {tag: tag_params}
    tag = Tag.last

    assert_response :success
    expect(response).to be_success
    expect(tag.name).to eq(tag_params[:name])
  end

  it 'can update an tag' do
    id = create(:tag).id
    previous_name = Tag.last.name
    tag_params = {name: 'Java'}

    put "/api/v1/tags/#{id}", params: {tag: tag_params}
    tag = Tag.find_by(id: id)

    expect(response).to be_success
    expect(tag.name).to_not eq(previous_name)
    expect(tag.name).to eq('Java')
  end

  it 'can delete an tag' do
    tag = create(:tag)

    expect(Tag.count).to eq(1)

    delete "/api/v1/tags/#{tag.id}"

    expect(response).to be_success
    expect(Tag.count).to eq(0)
    expect{Tag.find(tag.id)}.to raise_error(ActiveRecord::RecordNotFound)
  end

end
