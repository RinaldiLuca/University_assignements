use std.textio.all;
entity hello_world is
end hello_world;
architecture behaviour of hello_world is
  begin
    process
      variable l : line;
    begin
      write (l, string'("Hello world"));
      writeline (output, l);
      wait; --with no additional arguments it mean wait forever
    end process;
  end behaviour;
