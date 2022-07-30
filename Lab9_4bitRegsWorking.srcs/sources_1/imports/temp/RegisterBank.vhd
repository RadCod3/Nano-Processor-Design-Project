----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/21/2022 12:12:33 PM
-- Design Name: 
-- Module Name: RegisterBank - Behavioral
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

entity Reg_Bank is
  Port (
        Reg_En: in STD_LOGIC_VECTOR (2 DOWNTO 0);
        EN : in STD_LOGIC;
        A : in STD_LOGIC_VECTOR (3 DOWNTO 0);
        Clk : in STD_LOGIC;
        RESET_REG_BANK : in STD_LOGIC;
        B0 : out STD_LOGIC_VECTOR (3 DOWNTO 0);
        B1 : out STD_LOGIC_VECTOR (3 DOWNTO 0);
        B2 : out STD_LOGIC_VECTOR (3 DOWNTO 0);
        B3 : out STD_LOGIC_VECTOR (3 DOWNTO 0);
        B4 : out STD_LOGIC_VECTOR (3 DOWNTO 0);
        B5 : out STD_LOGIC_VECTOR (3 DOWNTO 0);
        B6 : out STD_LOGIC_VECTOR (3 DOWNTO 0);
        B7 : out STD_LOGIC_VECTOR (3 DOWNTO 0) 
  );
end Reg_Bank;

architecture Behavioral of Reg_Bank is

    component reg
        Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
               En : in STD_LOGIC;
               Clk : in STD_LOGIC;
               Res : in STD_LOGIC;
               Q : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    component Decoder_3_to_8
        Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
               EN : in STD_LOGIC;
               Y : out STD_LOGIC_VECTOR (7 downto 0));
    end component;
    

SIGNAL Y0: STD_LOGIC_VECTOR(7 DOWNTO 0);

begin

    Decoder_3_to_8_0: Decoder_3_to_8 PORT MAP(
        I => Reg_En,
        EN => EN,
        Y => Y0
    );

    Reg0: reg PORT MAP(
        D => "0000",
        En => '1',
        Clk => Clk,
        Res => RESET_REG_BANK,
        Q => B0
    );
    
    Reg1: reg PORT MAP(
        D => A,
        En => Y0(1),
        Clk => Clk,
        Res => RESET_REG_BANK,
        Q => B1
    );
    
    Reg2: reg PORT MAP(
        D => A,
        En => Y0(2),
        Clk => Clk,
        Res => RESET_REG_BANK,
        Q => B2
    );
    
    Reg3: reg PORT MAP(
        D => A,
        En => Y0(3),
        Clk => Clk,
        Res => RESET_REG_BANK,
        Q => B3
    );
    
    Reg4: reg PORT MAP(
        D => A,
        En => Y0(4),
        Clk => Clk,
        Res => RESET_REG_BANK,
        Q => B4
    );
    
    Reg5: reg PORT MAP(
        D => A,
        En => Y0(5),
        Clk => Clk,
        Res => RESET_REG_BANK,
        Q => B5
    );
    
    
    Reg6: reg PORT MAP(
        D => A,
        En => Y0(6),
        Clk => Clk,
        Res => RESET_REG_BANK,
        Q => B6
    );
    
    Reg7: reg PORT MAP(
        D => A,
        En => Y0(7),
        Clk => Clk,
        Res => RESET_REG_BANK,
        Q => B7
    );
    


end Behavioral;
