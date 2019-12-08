----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2019/10/15 22:01:07
-- Design Name: 
-- Module Name: ADDER - Behavioral
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
use IEEE.std_logic_unsigned.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ADDER is
    generic(m:integer:=8;n:integer:=8);
    port(
        D,A:in std_logic_vector(m-1 downto 0);
        add_out:out std_logic_vector(m-1 downto 0);
        c_out:out std_logic
    );
end ADDER;

architecture Behavioral of ADDER is
signal add_result,data1,data2:std_logic_vector(m downto 0);

begin
data1<='0'&D;
data2<='0'&A;
add_result<=data1+data2;
add_out<=add_result(m-1 downto 0);
c_out<=add_result(m);
end Behavioral;
