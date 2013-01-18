# -*- mode: ruby; tab-width: 2; indent-tabs-mode: nil; encoding: utf-8 -*-

module IdentificationNumber

  class Samordningsnummer < Personnummer

    def valid_date?
      !!Date.new(@year.to_i, @month.to_i, @day.to_i - 60)
    rescue ArgumentError
      false
    end

  end

end