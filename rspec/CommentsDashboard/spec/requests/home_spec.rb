require 'spec_helper'

describe "Home Page" do
    describe "GET /" do

        context "empty database" do

            before(:each) do
                visit '/'
            end

            it "renders success" do
                expect(page.status_code).to be(200)
            end

            describe "masthead" do
                
                it "displays title" do
                    expect(page).to have_selector 'h1', text: 'Comments Dashboard'
                end

                it "displays subtitle" do
                    expect(page).to have_selector 'h2', text: 'Read comments from your favorite blogs!'
                end

            end
        end

        context "populated database" do

            before(:each) do
                visit '/'
            end

            it "show a list of blogs" do
                pending "Need to wirte unit tests and Blog model first."
                expect(page).to have_selector 'li a', text:'Mashable'
            end

        end

    end
end