class Resume < ApplicationRecord

    before_save :do_logging

    def do_logging
        puts "saving object"
    end

    has_many :view_histories
    has_many :jobs
    has_one :cover_letter
    has_and_belongs_to_many :employers
    has_many :applications
    has_many :employers, :through => :applications
end
