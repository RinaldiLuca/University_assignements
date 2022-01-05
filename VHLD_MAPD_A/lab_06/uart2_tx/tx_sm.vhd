library ieee;
use ieee.std_logic_1164.all;

entity tx_sm is
  port (
    clk         : in  std_logic;
    baudrate_in : in  std_logic;
    valid       : in  std_logic;
    data        : in  std_logic_vector(7 downto 0);
    busy        : out std_logic := '0';
    tx_out      : out std_logic := '1');
end entity tx_sm;

architecture rtl of tx_sm is
  type state_t is (idle, s_valid, s_start, s0, s1, s2, s3, s4, s5, s6, s7, s_stop);
  signal state : state_t := idle;
  signal curr  : std_logic_vector(7 downto 0);
  signal b     : std_logic := '0';
begin
  main: process (clk, baudrate_in) is
    begin
      if rising_edge(clk) then
        case state is
          when idle =>
            b <= '0';
            busy <= b;
            if (b = '0') and (valid = '1') then
              state <= s_valid;
              curr <= data;
            end if;
          when s_valid =>
            b <= '1';
            busy <= b;
            if baudrate_in = '1' then
              state <= s_start;
            end if;
          when s_start =>
            tx_out <= '0';
            if baudrate_in = '1' then
              state <= s0;
            end if;
          when s0 =>
            tx_out <= curr(0);
            if baudrate_in = '1' then
              state <= s1;
            end if;
          when s1 =>
            tx_out <= curr(1);
            if baudrate_in = '1' then
              state <= s2;
            end if;
          when s2 =>
            tx_out <= curr(2);
            if baudrate_in = '1' then
              state <= s3;
            end if;
          when s3 =>
            tx_out <= curr(3);
            if baudrate_in = '1' then
              state <= s4;
            end if;
          when s4 =>
            tx_out <= curr(4);
            if baudrate_in = '1' then
              state <= s5;
            end if;
          when s5 =>
            tx_out <= curr(5);
            if baudrate_in = '1' then
              state <= s6;
            end if;
          when s6 =>
            tx_out <= curr(6);
            if baudrate_in = '1' then
              state <= s7;
            end if;
          when s7 =>
            tx_out <= curr(7);
            if baudrate_in = '1' then
              state <= s_stop;
            end if;
          when s_stop =>
            tx_out <= '1';
            if baudrate_in = '1' then
              state <= idle;
            end if;
        end case;
      end if;
    end process main;
end architecture rtl;
