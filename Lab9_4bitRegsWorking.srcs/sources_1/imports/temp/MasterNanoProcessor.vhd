----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/13/2022 03:28:01 PM
-- Design Name: 
-- Module Name: MasterNanoProcessor - Behavioral
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

entity MasterNanoProcessor is
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

end MasterNanoProcessor;

architecture Behavioral of MasterNanoProcessor is
component NanoProcessor 
  Port ( Clk: in STD_LOGIC;
         Res : in STD_LOGIC;
         Halt : in STD_LOGIC;
         Zero : out STD_LOGIC;
         Overflow : out STD_LOGIC;
         R0 : out STD_LOGIC_VECTOR (3 DOWNTO 0);
         R1 : out STD_LOGIC_VECTOR (3 DOWNTO 0);
         R2 : out STD_LOGIC_VECTOR (3 DOWNTO 0);
         R3 : out STD_LOGIC_VECTOR (3 DOWNTO 0);
         R4 : out STD_LOGIC_VECTOR (3 DOWNTO 0);
         R5 : out STD_LOGIC_VECTOR (3 DOWNTO 0);
         R6 : out STD_LOGIC_VECTOR (3 DOWNTO 0);
         R7 : out STD_LOGIC_VECTOR (3 DOWNTO 0)
  );
end component;
component LUT_16_7
    Port ( address : in STD_LOGIC_VECTOR (3 downto 0);
       data : out STD_LOGIC_VECTOR (6 downto 0));
end component;
component Slow_Clk is
    Port ( Clk_in : in STD_LOGIC;
           Clk_out : out STD_LOGIC);
end component;
SIGNAL slowClk: std_logic;
signal address, address0, address1, address2, address3, address4, address5, address6, address7 :STD_LOGIC_VECTOR (3 downto 0);
begin

    Clk0: Slow_Clk
        port map(
        Clk_in => Clk,
        Clk_out => slowClk
        );
        
    NanoProcessor0: NanoProcessor
        port map(
                Clk=> slowClk,
                Res => Res,
                Halt => Halt,
                Zero => Zero,
                Overflow => Overflow,
                R0 => address0,
                R1 => address1,
                R2 => address2,
                R3 => address3,
                R4 => address4,
                R5 => address5,
                R6 => address6,
                R7 => address7
        );
LUT_16_7_0: LUT_16_7
        port map( address => address,
        data => S_7Seg);

    -- to only switch on last 7 seg display
    Anode <= "1110";
    process (slowClk, switch1) begin
        if (rising_edge(slowClk)) then
            if(switch1="000") then
                address <=address0;
                S_LED<= address;
            elsif(switch1="001") then
                address <=address1;
                S_LED<= address;
            elsif(switch1="010") then
                address <=address2;
                S_LED<= address;
            elsif(switch1="011") then
                address <=address3;
                S_LED<= address;
            elsif(switch1="100") then
                address <=address4;
                S_LED<= address;
            elsif(switch1="101") then
                address <=address5;
                S_LED<= address;
            elsif(switch1="110") then
                address <=address6;    
                S_LED<= address;
            elsif(switch1="111") then
                address <=address7;                              
                S_LED<= address;

            end if;
        end if;
    end process;


end Behavioral;