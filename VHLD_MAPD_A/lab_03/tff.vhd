library ieee;
use ieee.std_logic_1164.all;
entity tff is
  port (
    clk : in std_logic;
    rst : in std_logic;
    t   : in std_logic;
    q   : out std_logic);
end entity tff;

architecture rtl of tff is
  signal s_q : std_logic;
begin      -- architecture rtl
  flipflop : process (clk) is
  begin    -- process flipflop
    if rising_edge(clk) then
      if rst = '0' then
        s_q <= '0';
      else
        s_q <= t xor s_q;
      end if;
      --q <= s_q;
    end if;
    --q <= s_q;
  end process flipflop;

  q <= s_q;

end architecture rtl;
