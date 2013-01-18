# -*- mode: ruby; tab-width: 2; indent-tabs-mode: nil; encoding: utf-8 -*-

require 'identification_number/personnummer'

module IdentificationNumber

  describe Personnummer do

    describe "#new" do

      it "should accept syntactially valid numbers" do
        expect { Personnummer.new('870706-2132') }.to_not raise_error(ArgumentError)
        expect { Personnummer.new('870706+2132') }.to_not raise_error(ArgumentError)
        expect { Personnummer.new('198707062132') }.to_not raise_error(ArgumentError)
      end

      it "should reject syntactially invalid numbers" do
        expect { Personnummer.new('888') }.to raise_error(ArgumentError)
        expect { Personnummer.new('8707062132') }.to raise_error(ArgumentError)
        expect { Personnummer.new('19870706-2132') }.to raise_error(ArgumentError)
      end
    
    end

    describe "#sex" do

      it "should be male if the last serial digit is odd" do
        Personnummer.new('870706-2132').sex.should eq(:male)
      end

      it "should be female if the last digit is even" do
         Personnummer.new('870706-6240').sex.should eq(:female)
      end

    end

    describe "#short_format" do

      it "returns the short format" do
        Date.stub(:today).and_return(Date.new(2013, 01, 18))

        Personnummer.new('198707062132').short_format.should eq("870706-2132")
        Personnummer.new('188707062132').short_format.should eq("870706+2132")
      end

    end

    describe "#long_format" do

      it "returns the long format" do
        Personnummer.new('870706-2132').long_format.should eq("198707062132")
        Personnummer.new('870706+2132').long_format.should eq("188707062132")
      end

    end

    describe "#valid?" do

      it "succeeds if given a valid number" do

        Personnummer.new('870706-2132').should be_valid
        Personnummer.new('870706+2132').should be_valid
        Personnummer.new('198707062132').should be_valid

      end

       it "fails if given an invalid number" do

        Personnummer.new('870706-2133').should_not be_valid
        Personnummer.new('871306-2132').should_not be_valid

      end

    end

    describe "::valid?" do

      it "succeeds if given a valid number" do

        Personnummer.valid?('870706-2132').should be_true
        Personnummer.valid?('870706+2132').should be_true
        Personnummer.valid?('198707062132').should be_true

      end

       it "fails if given an invalid number" do

        Personnummer.valid?('870736-2136').should be_false 
        Personnummer.valid?('870706-2133').should be_false
        Personnummer.valid?('871306-2132').should be_false

      end

    end

  end

end