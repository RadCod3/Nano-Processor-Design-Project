library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Slow_Clk is
    Port ( Clk_in : in STD_LOGIC;
           Clk_out : out STD_LOGIC);
end Slow_Clk;

architecture Behavioral of Slow_Clk is

SIGNAL count : STD_LOGIC_VECTOR(1 DOWNTO 0) := "00";--"00000000000000000000000000";  -- (25 DOWNTO 0)
SIGNAL clk_status : STD_LOGIC := '0';

begin
    -- For 100 MHz input clock this generates 1 Hz clock
    process (Clk_in, count) begin
        if (Clk_in'event and Clk_in = '1') then 
            count <= count + '1';
            Clk_out <= count(1);
        end if;
    end process;

end Behavioral;