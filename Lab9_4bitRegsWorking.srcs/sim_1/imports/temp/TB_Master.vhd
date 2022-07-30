----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/21/2022 12:36:45 PM
-- Design Name: 
-- Module Name: TB_Master - Behavioral
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

entity TB_Master is
--  Port ( );
end TB_Master;

architecture Behavioral of TB_Master is

component MasterNanoProcessor 
  Port ( Clk: in STD_LOGIC;
       Res : in STD_LOGIC;
       Halt : in STD_LOGIC;
       Zero : out STD_LOGIC;
       Overflow : out STD_LOGIC;
       switch1 : in STD_LOGIC_VECTOR (2 DOWNTO 0);
       S_LED : out STD_LOGIC_VECTOR (3 DOWNTO 0);
       S_7Seg : out STD_LOGIC_VECTOR (6 downto 0);
       Anode : out STD_LOGIC_VECTOR (3 downto 0)
       );
end component;

--component NanoProcessor
--  Port ( Clk: in STD_LOGIC;
--         Res : in STD_LOGIC;
--         Halt : in STD_LOGIC
--  );
--end component;


SIGNAL clk : STD_LOGIC := '0';
SIGNAL res, halt, zero, overflow : STD_LOGIC;
SIGNAL switch1 : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL sled, anode : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL sev_seg : STD_LOGIC_VECTOR(6 DOWNTO 0);

begin

    UUT: MasterNanoProcessor PORT MAP(
        Clk => clk,
        Res => res,
        Halt => halt,
        switch1 => switch1,
        Zero => zero,
        Overflow => overflow,
        S_LED => sled,
        S_7Seg => sev_seg,
        Anode => anode
    );

     -- Clock signal
    process
    begin
        WAIT FOR 5ns;
        clk <= NOT(clk);
    end process;
    
    process
    begin
        halt <= '1';
        res <= '1';
        
        wait for 100ns;
        
        halt <= '0';
        res <= '0';
        switch1 <= "001";

        
        wait for 900ns;
    end process;
        

end Behavioral;
