require 'rails_helper'

describe Gallery do
  it 'has meetings' do
    should have_many :meetings
  end

  it 'selects galleries' do
    gallery1 = create(:gallery, tech_support: true, capacity: 10)
    gallery2 = create(:gallery, tech_support: true, capacity: 30)
    gallery3 = create(:gallery, tech_support: false, capacity: 80)

    3.times { create(:meeting, meeting_room: meeting_room_2) }
    2.times { create(:meeting, meeting_room: meeting_room_4) }
    1.times { create(:meeting, meeting_room: meeting_room_1) }

    galleries = Gallery.select_rooms(25, "true")
    expected = [meeting_room_2, meeting_room_4]
    expect(galleries).to eq(expected)
    galleries = Gallery.select_rooms(25, nil)
    expected = [meeting_room_4, meeting_room_2]
    expect(galleries).to eq(expected)
    galleries = Gallery.select_rooms(nil, "true")
    expected = [meeting_room_2, meeting_room_4, meeting_room_3, meeting_room_1]
    expect(galleries).to eq(expected)
    galleries = Gallery.select_rooms(nil, nil)
    expected = [meeting_room_4, meeting_room_3, meeting_room_2, meeting_room_1]
    expect(galleries).to eq(expected)
  end
end
