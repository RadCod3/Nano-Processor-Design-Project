----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/21/2022 12:15:57 PM
-- Design Name: 
-- Module Name: ProgramCounter - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ProgramCounter is
    Port ( D : in STD_LOGIC_VECTOR (2 downto 0);
           Clk : in STD_LOGIC;
           Res: in STD_LOGIC;  -- SIGNAL TO RESET
           Load : in STD_LOGIC; -- SIGNAL TO LOAD 
           Q : out STD_LOGIC_VECTOR (2 downto 0));
end ProgramCounter;

architecture Behavioral of ProgramCounter is

begin
    
--    process (Clk) begin
--        if (rising_edge(Clk)) then
--            if (Res = '1') then
--                Q <= "000";
--            elsif (Load = '1') then
--                Q <= D;
--            end if;
--        end if;
--    end process;
     process (Clk) begin
        if (rising_edge(Clk)) then
            if (Res = '1') then
                Q <= "000";
            elsif (Load = '1') then
                Q <= D;
            end if;
        end if;
    end process;

end Behavioral;
