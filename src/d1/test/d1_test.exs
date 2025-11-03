defmodule D1Test do
  use ExUnit.Case
  doctest D1

  test "Converting Temps" do
    assert D1.f_to_c("32") == 0
  end
end
