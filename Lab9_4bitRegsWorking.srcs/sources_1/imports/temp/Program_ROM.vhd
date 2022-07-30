----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Program_ROM is
    Port ( Mem_address : in STD_LOGIC_VECTOR (2 downto 0);
       Instruction : out STD_LOGIC_VECTOR (11 downto 0));
end Program_ROM;

architecture Behavioral of Program_ROM is
    type rom_type is array (0 to 7) of std_logic_vector(11 downto 0);
    signal progam_ROM : rom_type := (
        "100010001010", -- MOVI R1, 10 ; R1 ? 10                 format: 10 RRR 000 dddd
        "100100000001", -- MOVI R2, 1  ; R2 ? 1                  format: 10 RRR 000 dddd
        "010100000000", -- NEG R2      ; R2 ? -R2                format: 01 RRR 0000000
        "000010100000", -- ADD R1, R2  ; R1 ? R1 + R2            format: 00 RaRaRa RbRbRb 0000
        "110010000110", -- JZR R1, 7   ; If R1 = 0 jump to line 7 format: 11 RRR 0000 ddd
        "110000000011", -- JZR R0, 3   ; If R0 = 0 jump to line 3 format: 11 RRR 0000 ddd
        -- no line 7
        "100001000000", -- HALT SIGNAL ENABLING                   format: 10 000 100 0000
        "100001000000" -- JZR R0, 3   ; If R0 = 0 jump to line 3 format: 11 RRR 0000 ddd
    );
    begin
    Instruction <= progam_ROM(to_integer(unsigned(Mem_address)));
end Behavioral;