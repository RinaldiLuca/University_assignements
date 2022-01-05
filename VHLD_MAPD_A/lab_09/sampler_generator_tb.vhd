library ieee;
use ieee.std_logic_1164.all;

entity sampler_generator_tb is
end entity sampler_generator_tb;

architecture tb of sampler_generator_tb is
  component sampler_generator is
    port(
      clk       : in  std_logic;
      uart_rx   : in  std_logic;
      delay_out : out std_logic);
  end component sampler_generator;
  signal uart_rx, delay_out : std_logic;
  signal clk : std_logic := '0';

begin
  DUT : sampler_generator port map(clk,uart_rx,delay_out);

  clk <= not clk after 5 ns;

  main : process is
    begin
      uart_rx <= '1';
      wait for 500 ns;
      uart_rx <= '0';
      wait for 8680 ns;
      uart_rx <= '1';
      wait for 8680 ns;
      uart_rx <= '0';
      wait for 34720 ns;
      uart_rx <= '1';
      wait for 17360 ns;
      uart_rx <= '0';
      wait for 8680 ns;
      uart_rx <= '1';
      wait for 30000 ns;
    end process main;
end architecture tb;
