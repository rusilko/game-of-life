require "minitest/autorun"
require_relative "../lib/meme"

class TestMeme < Minitest::Test
  def setup
    @meme = ::Meme.new
  end

    # assert_equal "OHAI!", @meme.i_can_has_cheezburger?

    # refute_match /^no/i, @meme.will_it_blend?

  def test_under_population
    generation_one = [ 0,0,0, 0,1,0, 0,0,1 ]
    generation_two = [ 0,0,0, 0,0,0, 0,0,0 ]

    assert_equal generation_two, @meme.fornicate(generation_one)
  end

  def test_survival
    generation_one = [ 0,0,0, 1,1,0, 0,1,0 ]
    generation_two = [ 0,0,0, 1,1,0, 1,1,0 ]

    assert_equal generation_two, @meme.fornicate(generation_one)
  end

  def test_overcrowding
    generation_one = [ 1,1,1, 1,1,1, 1,1,1 ]
    generation_two = [ 1,0,1, 0,0,0, 1,0,1 ]

    assert_equal generation_two, @meme.fornicate(generation_one)
  end

  def test_reproduction
    generation_one = [ 0,0,0, 1,0,0, 0,1,1 ]
    generation_two = [ 0,0,0, 0,1,0, 0,1,0 ]

    assert_equal generation_two, @meme.fornicate(generation_one)
  end

  def test_neighbors
    assert_equal [ 0, 1, 2, 3, 5, 6, 7, 8 ], @meme.neighbors(4)
    assert_equal [ 1, 4, 5 ], @meme.neighbors(2)
    assert_equal [ 3, 4, 7 ], @meme.neighbors(6)
    assert_equal [ 0, 1, 4, 6, 7 ], @meme.neighbors(3)
    assert_equal [ 1, 2, 4, 7, 8 ], @meme.neighbors(5)
    assert_equal [ 0, 2, 3, 4, 5 ], @meme.neighbors(1)
  end
end
