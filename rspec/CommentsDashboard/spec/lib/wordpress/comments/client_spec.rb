require_relative '../../../../lib/wordpress/comments/client'
require_relative '../../../support/match_date'

describe Wordpress::Comments::Client do

    let(:client) { Wordpress::Comments::Client.new 'http://masable.com/comments/feed' }
    let(:xml) { File.read(File.join('spec', 'fixtures', 'feed.xml')) }


    describe "#initialize" do

        it "stores a URL" do
            expect(client.url).to eq 'http://masable.com/comments/feed'
        end

    end

    describe "#parse" do

        let(:comments) { client.parse xml }
        let(:comment) { comments.first }

        it "extracts the link" do
            link = 'http://mashable.com/2007/11/27/snooth-funding/'
            expect(comment[:link]).to eq link
        end

        it "extracts the title" do
            title = 'Snooth This: $1M for Wine Review Site'
            expect(comment[:title]).to eq title
        end

        it "extracts the commenter" do
            expect(comment[:commenter]).to eq 'Kristen Nicole'
        end

        it "extracts the date" do
            # Tue, 27 Nov 2007 20:25:08 +0000
            expect(comment[:date].year).to eq 2007
        end

        it "extracts the date (redux)" do
            # Tue, 27 Nov 2007 20:25:08 +0000
            expect(comment[:date]).to match_date '2007-11-27'
        end

    end

    describe "#fetch" do

        let(:comments) { client.fetch }

        context "success" do

            before(:each) do
                client.stub(:get).and_return(xml)
            end

            it "build comment objects" do
                expect(comments.length).to eq 30
            end

        end

        context "bad URL" do
        
            let(:client) { Wordpress::Comments::Client.new 'not a URL' }

            #it "raises error" do
            #    expect {
            #        client.fetch
            #    }.to raise_error(Errno::ENOENT)
            #end

        end

        context "bad XML" do
        
            before(:each) do
                client.stub(:get).and_return("BAD XML!")
            end

            it "raises error" do
                expect {
                    client.fetch
                }.to raise_error(Nokogiri::XML::SyntaxError)
            end

        end

    end
    
end