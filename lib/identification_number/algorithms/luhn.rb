# -*- mode: ruby; tab-width: 2; indent-tabs-mode: nil; encoding: utf-8 -*-

require 'luhnacy'

module IdentificationNumber
  module Algorithms

    module Luhn

      def self.validates?(number)
        Luhnacy.valid?(number)
      end

    end
  end
end