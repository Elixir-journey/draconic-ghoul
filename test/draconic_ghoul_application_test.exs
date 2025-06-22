# test/draconic_ghoul_application_test.exs
defmodule DraconicGhoul.ApplicationTest do
  @moduledoc """
  Tests for the DraconicGhoul.Application module.
  """

  use ExUnit.Case

  test "ensures the application starts correctly" do
    # Ensure the application is started, starting it only if necessary
    case Application.ensure_all_started(:draconic_ghoul) do
      {:ok, _apps} -> assert true
      {:error, {:already_started, _app}} -> assert true
    end
  end
end
