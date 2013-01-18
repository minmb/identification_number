# -*- mode: ruby; tab-width: 2; indent-tabs-mode: nil; encoding: utf-8 -*-

require 'identification_number/helpers/date_helper'

module IdentificationNumber
  module Helpers
    describe DateHelper do
      
      subject { DateHelper }

      describe "#century" do

        it "returns the century of a given date" do

          subject.century(Date.new(1987, 07, 06)).should eq(19)

        end

        it "returns the current century when no date is given" do

          Date.stub(:today).and_return(Date.new(1813, 01, 18))

          subject.century.should eq(18)
        end

      end

      describe "#year_with_century" do

        it "always returns a year between now and 100 years back in time" do

          Date.stub(:today).and_return(Date.new(1813, 01, 18))

          subject.year_with_century(87).should eq(1787)
          subject.year_with_century(13).should eq(1813)
          subject.year_with_century(14).should eq(1714)

        end

      end

    end
  end
end