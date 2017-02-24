require_relative '../../../../lib/wordpress/comments/client'
require_relative '../../../support/match_date'

describe Wordpress::Comments::Client do

    let(:client) { Wordpress::Comments::Client.new 'http://masable.com/comments/feed' }

    describe "#initialize" do

        it "stores a URL" do
            expect(client.url).to eq 'http://masable.com/comments/feed'
        end

    end

    describe "#parse" do

        let(:xml) { File.read(File.join('spec', 'fixtures', 'feed.xml')) }
        
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
    
end