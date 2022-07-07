----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Kavindu Warnakulasuriya
-- Create Date: 05/26/2022 05:35:31 PM
-- Design Name: 
-- Module Name: RCA - Behavioral
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

entity RCA is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           C_in : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           C_out : out STD_LOGIC;
           Ctrl: in STD_LOGIC);
end RCA;
architecture Behavioral of RCA is
component FA
    port (
        A: in std_logic;
        B: in std_logic;
        C_in: in std_logic;
        S: out std_logic;
        C_out: out std_logic
        );
end component;
SIGNAL FA0_S, FA0_C, FA1_S, FA1_C, FA2_S, FA2_C, FA3_S, FA3_C: std_logic;
SIGNAL B0, B1, B2, B3: std_logic;
begin
    FA_0 : FA
        port map (
        A => A(0),
        B => B0,
        C_in => ctrl, -- Set to ground
        S => S(0),
        C_Out => FA0_C);
    FA_1 : FA
        port map (
        A => A(1),
        B => B1,
        C_in => FA0_C,
        S => S(1),
        C_Out => FA1_C);
    FA_2 : FA
        port map (
        A => A(2),
        B => B2,
        C_in => FA1_C,
        S => S(2),
        C_Out => FA2_C);
    FA_3 : FA
        port map (
        A => A(3),
        B => B3,
        C_in => FA2_C,
        S => S(3),
        C_Out => C_out);
B0<= B(0) XOR Ctrl;
B1<= B(1) XOR Ctrl;
B2<= B(2) XOR Ctrl;
B3<= B(3) XOR Ctrl;
   

end Behavioral;
