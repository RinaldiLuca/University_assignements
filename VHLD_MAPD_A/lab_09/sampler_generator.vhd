library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sampler_generator is
  port(
    clk       : in  std_logic;
    uart_rx   : in  std_logic;
    delay_out : out std_logic := '0');
end entity sampler_generator;

architecture rtl of sampler_generator is
  signal enable, pulse_out : std_logic := '0';
  signal baud_divis : unsigned(9 downto 0) := to_unsigned(868,10);
  signal baud_count : unsigned(9 downto 0) := to_unsigned(0, 10);
  signal delay_count: unsigned(9 downto 0) := to_unsigned(0, 10);
  signal stat_divis : unsigned(3 downto 0) := to_unsigned(10, 4);
  signal stat_count : unsigned(3 downto 0) := to_unsigned(0, 4);
  type   state_t is (idle, active);
  signal state : state_t := idle;

begin
  pulse_gen : process(clk) is
    begin
      if rising_edge(clk) then
        if enable = '1' then
          if baud_count = to_unsigned(0, 10) then
            pulse_out <= '1';
          else
            pulse_out <= '0';
          end if;
          baud_count <= baud_count + 1;
          if baud_count = baud_divis then
            baud_count <= (others => '0');
          end if;
        else
          baud_count <= (others => '0');
        end if;
      end if;
    end process pulse_gen;

  delay_line : process(clk) is
    begin
      if rising_edge(clk) then
        if delay_count = to_unsigned(0, 10) then
          delay_out <= '0';
          if pulse_out = '1' then
            delay_count <= delay_count + 1;
            delay_out <= '0';
          end if;
        elsif delay_count = to_unsigned(434, 10) then
          delay_out <= '1';
          delay_count <= (others => '0');
        else
          delay_count <= delay_count +1;
        end if;
      end if;
    end process delay_line;

  state_machine : process(clk) is
    begin
      if rising_edge(clk) then
        case state is
          when idle =>
            enable <= '0';
            if uart_rx = '0' then
              state <= active;
            end if;
          when active =>
            enable <= '1';
            --
            if stat_count = (stat_divis) then
              state <= idle;
              stat_count <= (others => '0');
            end if;
            --
            if pulse_out = '1' then
              stat_count <= stat_count +1;
              --
            end if;
        end case;
      end if;
    end process state_machine;
end architecture rtl;
