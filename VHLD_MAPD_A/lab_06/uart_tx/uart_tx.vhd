library ieee;
use ieee.std_logic_1164.all;

entity uart_tx is
  port (
    clk      : in  std_logic;
    data     : in  std_logic_vector(7 downto 0);
    valid    : in  std_logic;
    busy     : out std_logic;
    uart_out : out std_logic);
end entity uart_tx;

architecture rtl of uart_tx is
  component baudrate is
    port(
      clk          : in std_logic;
      baudrate_out : out std_logic);
  end component baudrate;

  component tx_sm
    port (
      clk         : in  std_logic;
      baudrate_in : in  std_logic;
      valid       : in  std_logic;
      data        : in  std_logic_vector(7 downto 0);
      busy        : out std_logic;
      tx_out      : out std_logic := '1');
  end component tx_sm;

  signal baudrate_mid : std_logic;

begin
  baudrate_generator : baudrate
    port map (clk => clk,
          baudrate_out => baudrate_mid);

  TX_state_machine : tx_sm
    port map (clk => clk, baudrate_in => baudrate_mid,
              valid => valid, data => data,
              busy => busy, tx_out => uart_out);
end architecture rtl;
