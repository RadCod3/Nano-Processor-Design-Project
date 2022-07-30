----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/21/2022 12:25:54 PM
-- Design Name: 
-- Module Name: Instruction_decoder - Behavioral
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

entity Instruction_decoder is
    Port ( Instruction : in STD_LOGIC_VECTOR (11 downto 0);
           Reg_en : out STD_LOGIC_VECTOR (2 downto 0);
           Load_sel : out STD_LOGIC; -- 4 way to 4 bit mux needed
           Imd_val : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_selA : out STD_LOGIC_VECTOR (2 downto 0);
           Reg_selB : out STD_LOGIC_VECTOR (2 downto 0);
           Add_sub_sel : out STD_LOGIC;
           Jump : out STD_LOGIC;
           Jump_address : out STD_LOGIC_VECTOR (2 downto 0);
           -- WE NEED TO CONTROL THE MUXES
           MUX_EN_A : out STD_LOGIC;
           MUX_EN_B : out STD_LOGIC;
           -- WE NEED TO CONTROL THE REGISTER BANK
           REG_BANK_EN : out STD_LOGIC;
           -- CONTROL FOR ADD/SUB
           MUX_EN_2TO4 : out STD_LOGIC;
           -- HALT THE INSTRUCTION
           HALT : out STD_LOGIC;
           -- SELECT IF WE HAVE TO JUMP
           JMP_SEL : in STD_LOGIC_VECTOR(3 DOWNTO 0)
           );
end Instruction_decoder;

architecture Behavioral of Instruction_decoder is
begin
    process(Instruction,JMP_SEL) 
        begin
        
        ------------------------------------------------------------------
        -------------------------ADDED CODE ------------------------------
        MUX_EN_A <= '0';
        MUX_EN_B <= '0';
        REG_BANK_EN <= '0';
        Jump <= '0';
        MUX_EN_2TO4 <= '0';
        HALT <= '0';
        
        if (Instruction(11 downto 10) = "00") then -- ADD instruction 

            MUX_EN_A <= '1';
            MUX_EN_B <= '1';
            -- LOADING THE MUX A
            Reg_selA <= Instruction(9 downto 7);    -- SELECT THE VALUE FROM THE REGISTER RaRaRa
            -- LOADING THE MUX B
            Reg_selB <= Instruction(6 downto 4);    -- SELECT THE VALUE FROM THE REGISTER RbRbRb
            Add_sub_sel <= '0';                     -- SELECT ADDITION IN ADD/SUB UNIT
            
            -- SELECT THE ADD/SUB OUTPUT FROM THE 2 WAY 4 BIT REGISTER
            MUX_EN_2TO4 <= '1';                     -- SWITCH ON THE MUX 2 WAY 4 BIT
            Load_sel <= '0';                        -- select 4bitAdder/subtractor output
            REG_BANK_EN <= '1';
            Reg_en <= Instruction(9 downto 7);      -- again stored in RegA

            
        elsif (Instruction(11 downto 10) = "01") then -- NEG instruction
            -- NEG R2      ; R2 ? -R2                format: 01 RRR 0000000
            
            ------------------------------------------------------------------
            -------------------------ADDED CODE ------------------------------
            MUX_EN_A <= '1';
            MUX_EN_B <= '1';
            Reg_selA <= "000"; -- SELECT THE FIRST REGISTER WITH VALUE 0000
            Reg_selB <= Instruction(9 downto 7); -- LOAD THE ADD/SUB WITH THE VALUE IN REGISTER RRR
            Add_sub_sel <= '1'; -- ENABLE THE SUBTRACTOR IN ADD/SUB UNIT
            
            MUX_EN_2TO4 <= '1';  -- SWITCH ON THE MUX 2 WAY 4 BIT
            Load_sel <= '0';  -- SELECT THE OUTPUT FROM THE ADD/SUB UNI -- THIS IS MUX SELECTION
            REG_BANK_EN <= '1';
            Reg_en <= Instruction(9 downto 7); -- AGAIN STORE IN THE SAME REGISTER
 
            
        elsif (Instruction(11 downto 10) = "10") then -- MOVI instruction
            -- 
            IF (Instruction(6 downto 4) = "100") then
                HALT <= '1';
            ELSE
                -- MOVI R1, 10 ; R1 ? 10                 format: 10 RRR 000 dddd
                REG_BANK_EN <= '1';
                Reg_en <= Instruction(9 downto 7);
                
                MUX_EN_2TO4 <= '1';  -- SWITCH ON THE MUX 2 WAY 4 BIT
                Load_sel <= '1'; -- select imd_val
                Imd_val <= Instruction(3 downto 0);  
            end if;
            
        elsif (Instruction(11 downto 10) = "11") then -- JZR instruction
            -- JZR R1, 7   ; If R1 = 0 jump to line 7 format: 11 RRR 0000 ddd
            Reg_selA <= Instruction(9 downto 7);         -- GET THE VALUE OF THE REGISTER RRR IN THE REGISTER A
            if (JMP_SEL = "0000") then
               Jump <= '1'; -- set jump flag
               Jump_address <= Instruction(2 downto 0);
            end if;

        end if;
    end process;

end Behavioral;