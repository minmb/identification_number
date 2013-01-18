# -*- mode: ruby; tab-width: 2; indent-tabs-mode: nil; encoding: utf-8 -*-

require 'date'

module IdentificationNumber
  module Helpers

    module DateHelper

      def self.century(date = nil)
        (date || Date.today).strftime("%C").to_i
      end

      def self.year_with_century(year)
        return year unless year.to_s.length < 4

        today = Date.today
        c = century(today)
        [c, c - 1].map { |c| c * 100 + year.to_i }.select { |y| y <= today.year }.max
      end

    end

  end
end