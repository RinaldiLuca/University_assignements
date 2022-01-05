library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity baudrate is
  port(
    clk          : in std_logic;
    baudrate_out : out std_logic);
end entity baudrate;

architecture rtl of baudrate is
  signal count   : unsigned(9 downto 0) := (others => '0');
  constant divis : unsigned(9 downto 0) := to_unsigned(868,10);
begin
  baud : process(clk) is
  begin
    if rising_edge(clk) then
      count <= count + 1;
      if count = divis then
        count <= (others => '0');
        baudrate_out <= '1';
      else
        baudrate_out <= '0';
      end if;
    end if;
  end process baud;
end architecture rtl;
