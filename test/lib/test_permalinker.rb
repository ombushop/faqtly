# encoding: utf-8

require "test_helper"

class PermalinkerTest < Test::Unit::TestCase
  include Permalinker
  
  def test_generate_permalink_with_accent
    assert_equal "configuracion", generate_permalink("Configuración")
  end

  def test_generate_permalink_with_spaces
    assert_equal "quien-engano-a-roger-rabbit",
                    generate_permalink("¿Quién engañó a Roger Rabbit?")
  end

end