library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.ALL;

entity fir_filter_4 is
  port(
    signal i_clk     : in std_logic;
    signal i_rstb    : in std_logic;
    signal i_coeff_0 : in std_logic_vector(7 downto 0);
    signal i_coeff_1 : in std_logic_vector(7 downto 0);
    signal i_coeff_2 : in std_logic_vector(7 downto 0);
    signal i_coeff_3 : in std_logic_vector(7 downto 0);
    signal i_data    : in std_logic_vector(7 downto 0);
    signal o_data    : out std_logic_vector(9 downto 0));
end entity fir_filter_4;

architecture rtl of fir_filter_4 is
  signal x1, x2, x3 : std_logic_vector(7 downto 0);
  signal y0, y1, y2, y3 : std_logic_vector(9 downto 0);

begin
  main: process(i_clk) is
    begin
      if rising_edge(i_clk) then
        --y3 <= std_logic_vector(resize(signed(y2) + signed(x3) * signed(i_coeff_3),10));
        y2 <= std_logic_vector(resize(signed(y1) + signed(x2) * signed(i_coeff_2),10));
        --y1 <= std_logic_vector(resize(signed(y0) + signed(x1) * signed(i_coeff_1),10));
        y0 <= std_logic_vector(resize(signed(i_data) * signed(i_coeff_0),10));
        x3 <= x2;
        x2 <= x1;
        --o_data <= y3;
      end if;
    end process;
end architecture;
