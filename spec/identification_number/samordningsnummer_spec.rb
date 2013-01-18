# -*- mode: ruby; tab-width: 2; indent-tabs-mode: nil; encoding: utf-8 -*-

require 'identification_number/samordningsnummer'

module IdentificationNumber

  describe Samordningsnummer do

    describe "#valid?" do

      it "should accept numbers where day in range 61 - 91" do

        Samordningsnummer.new('870761-2134').should be_valid
        Samordningsnummer.new('198707912138').should be_valid

      end

      it "should not accept numbers where day outside of range 61 - 91" do

        Samordningsnummer.new('870706-2132').should_not be_valid
        Samordningsnummer.new('870792-2137').should_not be_valid
      
      end

    end

    describe "::valid?" do

      it "should accept numbers where day in range 61 - 91" do

        Samordningsnummer.valid?('870761-2134').should be_true
        Samordningsnummer.valid?('198707912138').should be_true

      end

      it "should not accept numbers where day outside of range 61 - 91" do

        Samordningsnummer.valid?('870706-2132').should be_false
        Samordningsnummer.valid?('870792-2137').should be_false
      
      end

    end

  end

end