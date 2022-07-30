----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/21/2022 12:14:48 PM
-- Design Name: 
-- Module Name: ProgramRomAdd - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ProgramRomAdd is
    Port ( Mem_address : in STD_LOGIC_VECTOR (2 downto 0);
       Instruction : out STD_LOGIC_VECTOR (11 downto 0));
end ProgramRomAdd;

architecture Behavioral of ProgramRomAdd is
    type rom_type is array (0 to 7) of std_logic_vector(11 downto 0);
    signal progam_ROM : rom_type := (
        "101110000001", -- MOVI R7, 1 ; R1 ? 1                format: 10 RRR 000 dddd
        "100010000010", -- MOVI R1, 2 ; R1 ? 2                 format: 10 RRR 000 dddd
        "001110010000", -- ADD R7, R1  ; R7 ? R7 + R1            format: 00 RaRaRa RbRbRb 0000
        "100010000011", -- MOVI R1, 10 ; R1 ? 3                 format: 10 RRR 000 dddd
        "001110010000", -- ADD R7, R1  ; R7 ? R7 + R1            format: 00 RaRaRa RbRbRb 0000
        "110000000110",  -- JZR R0, 6   ; If R0 = 0 jump to line 3 format: 11 RRR 0000 ddd
        -- JUST FOR FUN
        "100001000000", -- HALT SIGNAL ENABLING                   format: 10 000 100 0000
        "100001000000" -- HALT SIGNAL ENABLING                   format: 10 000 100 0000
    );
    
    begin
    Instruction <= progam_ROM(to_integer(unsigned(Mem_address)));
end Behavioral;
