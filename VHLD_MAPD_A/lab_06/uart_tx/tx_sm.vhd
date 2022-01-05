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
  type state_t is (idle, s_start, s0, s1, s2, s3, s4, s5, s6, s7, s_stop);
  signal state : state_t := idle;
  signal curr  : std_logic_vector(7 downto 0);
  signal b     : std_logic := '0';
begin
  main: process (clk, baudrate_in) is
    begin
      if rising_edge(clk) then
        if (valid = '1') and (b = '0') then
          state <= s_start;
          curr <= data;
          busy <= '1';
          b <= '1';
          tx_out <= '0';
        else
          --if rising_edge(baudrate_in) then
          if baudrate_in='1' then
            case state is
              when s_start =>
                tx_out <= curr(0);
                state <= s0;
                busy <= '1';
                b <= '1';
              when s0 =>
                tx_out <= curr(1);
                state <= s1;
                busy <= '1';
                b <= '1';
              when s1 =>
                tx_out <= curr(2);
                state <= s2;
                busy <= '1';
                b <= '1';
              when s2 =>
                tx_out <= curr(3);
                state <= s3;
                busy <= '1';
                b <= '1';
              when s3 =>
                tx_out <= curr(4);
                state <= s4;
                busy <= '1';
                b <= '1';
              when s4 =>
                tx_out <= curr(5);
                state <= s5;
                busy <= '1';
                b <= '1';
              when s5 =>
                tx_out <= curr(6);
                state <= s6;
                busy <= '1';
                b <= '1';
              when s6 =>
                tx_out <= curr(7);
                state <= s7;
                busy <= '1';
                b <= '1';
              when s7 =>
                tx_out <= '1';
                state <= s_stop;
                busy <= '1';
                b <= '1';
              when s_stop =>
                --tx_out <= '1';
                state <= idle;
                busy <= '1';
                b <= '1';
              when idle =>
                busy <= '0';
                b <= '0';
              when others => null;
            end case;
          end if;
        end if;
      end if;
    end process main;
end architecture rtl;
