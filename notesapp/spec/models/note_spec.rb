require 'rails_helper'

RSpec.describe Note, type: :model do

  let(:note) { Note.new(title: "Note 1", note: "Note note note") }

  it "is valid with valid attributes" do
    expect(note).to be_valid
  end

  it "is valid with without a note" do
    note.note = nil
    expect(note).to be_valid
  end

  it "is not valid without a title" do
    note.title = nil
    expect(note).to_not be_valid
  end

end
