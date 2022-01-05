library ieee;
use ieee.std_logic_1164.all;

entity uart_tb is
end entity uart_tb;

architecture tb of uart_tb is
  component uart_tx is
    port (
      clk      : in  std_logic;
      data     : in  std_logic_vector(7 downto 0);
      valid    : in  std_logic;
      busy     : out std_logic;
      uart_out : out std_logic);
  end component uart_tx;
  signal clk, valid, busy, uart_out : std_logic;
  signal data : std_logic_vector(7 downto 0);

begin
  DUT : uart_tx port map(clk, data, valid, busy, uart_out);

  clock : process is
    begin
      clk <= '1';
      wait for 5 ns;
      clk <= '0';
      wait for 5 ns;
    end process clock;

  main : process is
    begin
      data <= X"0f";
      valid <= '0';
      wait for 300 ns;
      wait until rising_edge(clk);
      valid <= '1';
      wait until rising_edge(clk);
      valid <= '0';
      wait;
    end process main;
end architecture tb;
