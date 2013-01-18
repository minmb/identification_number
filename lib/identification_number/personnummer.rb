# -*- mode: ruby; tab-width: 2; indent-tabs-mode: nil; encoding: utf-8 -*-

require 'identification_number/helpers'
require 'identification_number/algorithms'

module IdentificationNumber

  class Personnummer

    SHORT_FORMAT = /^(?<year>\d{2})(?<month>\d{2})(?<day>\d{2})(?<separator>[-+])(?<serial>\d{3})(?<control_digit>\d)$/
    LONG_FORMAT = /^(?<year>\d{4})(?<month>\d{2})(?<day>\d{2})(?<serial>\d{3})(?<control_digit>\d)$/

    def initialize(number)
      year, @month, @day, @separator, @serial, @control_digit = *self.class.split(number)

      @year = case @separator
        when '-'
          DateHelper.year_with_century(year.to_i)
        when '+'
          DateHelper.year_with_century(year.to_i) - 100
        else
          year
        end.to_s
    end

    def sex
      @serial[-1, 1].to_i.even? ? :female : :male
    end

    def male?
      sex == :male
    end

    def female?
      sex == :female
    end

    def valid?
      valid_date? && Algorithms::Luhn.validates?(short_format_without_separator)
    end

    def to_s
      long_format
    end

    def short_format
      [@year[2..-1], @month, @day, separator, @serial, @control_digit].join
    end

    def long_format
      [@year, @month, @day, @serial, @control_digit].join
    end

    def valid_date?
      !!Date.new(@year.to_i, @month.to_i, @day.to_i)
    rescue ArgumentError
      false
    end

    def short_format_without_separator
      [@year[2..-1], @month, @day, @serial, @control_digit].join
    end

    def separator
      @separator || ( (@year.to_i < Date.today.year - 100) ? '+' : '-' ) 
    end

    def self.valid?(number)
      new(number).valid?
    rescue ArgumentError
      false
    end

    def self.format_error!
      raise ArgumentError, 'Invalid format'
    end

    def self.split(number)
      components = SHORT_FORMAT.match(number.to_s)
      components = LONG_FORMAT.match(number.to_s) if components.nil?

      format_error! if components.nil?

      %w(year month day separator serial control_digit).map do |key|
        components[key] rescue IndexError and nil
      end
    end

    include Helpers

  end
end