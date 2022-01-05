library ieee;
use ieee.std_logic_1164.all;

entity patterndetect is
  port (
    a   :  in std_logic;
    clk :  in std_logic;
    rst :  in std_logic;
    y   : out std_logic);
end entity patterndetect;

architecture rtl of patterndetect is
  type state_t is (S0, S1, S2, S3, detect);
  signal state : state_t := S0;
begin
  main : process (clk) is
  begin
    if rising_edge(clk) then    -- clk syncro
      if rst = '0' then         -- rst = 0
        state <= S0;
        y     <= '0';
      else                      -- rst = 0
        case state is
          when S0 =>
            y <= '0';
            if a = '0' then
              state <= S1;
            end if;

          when S1 =>
            y <= '0';
            if a = '0' then
              state <= S1;
            elsif a = '1' then
              state <= S2;
            end if;

          when S2 =>
            y <= '0';
            if a = '0' then
              state <= S3;
            elsif a = '1' then
              state <= S0;
            end if;

          when S3 =>
            y <= '0';
            if a = '0' then
              state <= S1;
            elsif a = '1' then
              state <= detect;
            else
              null;
            end if;

          when detect =>
            y <= '1';
            state <= S0;

          when others => null;
        end case;
      end if;
    end if;
  end process main;
end architecture rtl;
