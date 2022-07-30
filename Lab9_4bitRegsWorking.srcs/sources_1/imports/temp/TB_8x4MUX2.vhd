----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/24/2022 11:47:55 AM
-- Design Name: 
-- Module Name: TB_8x4MUX - Behavioral
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

entity TB_8x4MUX is
--  Port ( );
end TB_8x4MUX;

architecture Behavioral of TB_8x4MUX is

component TB_8x4MUX
    Port ( D0 : in STD_LOGIC_VECTOR (3 downto 0);
        D1 : in STD_LOGIC_VECTOR (3 downto 0);
        D2 : in STD_LOGIC_VECTOR (3 downto 0);
        D3 : in STD_LOGIC_VECTOR (3 downto 0);
        D4 : in STD_LOGIC_VECTOR (3 downto 0);
        D5 : in STD_LOGIC_VECTOR (3 downto 0);
        D6 : in STD_LOGIC_VECTOR (3 downto 0);
        D7 : in STD_LOGIC_VECTOR (3 downto 0);
        Y_out : out STD_LOGIC_VECTOR (3 downto 0);
        EN : in STD_LOGIC;
        S : in STD_LOGIC_VECTOR (2 downto 0));
end component;
signal d0,d1,d2,d3,d4,d5,d6,d7,y_out : STD_LOGIC_VECTOR(3 DOWNTO 0);
signal en : STD_LOGIC;
signal s : STD_LOGIC_VECTOR (2 downto 0);
begin
    UUT : TB_8x4MUX PORT MAP(
        D0 => d0,
        D1 => d1,
        D2 => d2,
        D3 => d3,
        D4 => d4,
        D5 => d5,
        D6 => d6,
        D7 => d7,
        EN => en,
        S => s,
        Y_out => y_out
    );
    
    process begin
        d0<= "0001";
        d1<= "0010";
        d2<= "0011";
        d3<= "0100";
        d4<= "0101";
        d5<= "0110";
        d6<= "0111";
        d7<= "1000";
        wait for 100ns;
        en <= '0';
        s <= "001";
        wait for 100ns;
        en <= '1';
        wait;
    end process;


end Behavioral;
