# -*- mode: ruby; tab-width: 2; indent-tabs-mode: nil; encoding: utf-8 -*-

require 'identification_number/version'

module IdentificationNumber
  
  autoload :Personnummer, 'identification_number/personnummer'
  autoload :Samordningsnummer, 'identification_number/samordningsnummer'

end
