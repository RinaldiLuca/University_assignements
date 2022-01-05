library ieee;
use ieee.std_logic_1164.all;

entity baudrate_tb is
end entity baudrate_tb;

architecture tb of baudrate_tb is
  component baudrate is
    port(
      clk          : in  std_logic;
      baudrate_out : out std_logic);
  end component;

  signal baudrate_out : std_logic;
  signal clk : std_logic := '0';

begin
  DUT : baudrate port map(clk, baudrate_out);

  clock : process is
    begin
    --clk <= not clk after 5 ns;
    clk <= '0';
    wait for 5 ns;
    clk <= '1';
    wait for 5 ns;
  end process clock;

end architecture tb;
