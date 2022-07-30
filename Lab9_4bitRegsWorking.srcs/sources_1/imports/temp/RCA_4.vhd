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

entity RCA_4 is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           S : out STD_LOGIC_VECTOR (3 downto 0);
           Ctrl: in STD_LOGIC;
           Zero : out STD_LOGIC;
           Overflow : out STD_LOGIC);
end RCA_4;

architecture Behavioral of RCA_4 is
    SIGNAL CUR_OUT : STD_LOGIC_VECTOR(4 DOWNTO 0);

begin
    
    -- MAKING THE OUTPUT 8 BITS
    PROCESS(Ctrl, A, B)
    BEGIN
        IF (Ctrl = '0') THEN 
            CUR_OUT <= ('0' & A) + ('0' & B);
        ELSE
            CUR_OUT <= ('0' & A) - ('0' & B);
        END IF;
    END PROCESS;
    
    Overflow <= CUR_OUT(4);
    S <= CUR_OUT(3 DOWNTO 0);
    
    -- NEED TO CODE FOR SIGN AND PARITY FLAG
--    Parity_flag <= XOR CUR_OUT(7 DOWNTO 0);
    
    PROCESS(CUR_OUT, A, B)
    BEGIN
        -- ZERO FLAG WILL BE ON WHEN EVERY BIT OF OUTPUT IS ZERO
        IF (CUR_OUT(3 DOWNTO 0) = "0000") THEN 
            Zero <= '1';
        ELSE
            Zero <= '0';
        END IF;
        --OVERFLOW FLAG => ONLY HAPPENS WHEN ADDING NUMBER OF SAME SIGN
--        IF (A(3) = B(3)) THEN
--            Overflow_flag <= CUR_OUT(8);
--        ELSE
--            Overflow_flag <= '0';
--        END IF;
    END PROCESS;

end Behavioral;