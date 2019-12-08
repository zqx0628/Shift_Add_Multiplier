----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2019/10/15 22:03:10
-- Design Name: 
-- Module Name: SHIFTER - Behavioral
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

entity SHIFTER is
    generic(m:integer:=8;n:integer:=8);
    port(
        add_out:in std_logic_vector(m-1 downto 0);
        c_out,load_cmd,add_cmd,shift_cmd,clk,rst,out_cmd:in std_logic;
        Q:in std_logic_vector(n-1 downto 0);
        A:out std_logic_vector(m-1 downto 0);
        lsb:out std_logic;
        output:out std_logic_vector(m+n-1 downto 0)
    );
end SHIFTER;

architecture Behavioral of SHIFTER is
    signal temp:std_logic_vector(m+n downto 0);
    signal add_temp:std_logic;
--    signal out_temp:std_logic_vector(m+n-1 downto 0);
begin
process(clk,rst)
    begin
    if rst='1' then
        add_temp<='0';
        temp<=(others=>'0');
    elsif rising_edge(clk) then
        if load_cmd='1' then
            temp(m+n downto n)<=(others=>'0');
            temp(n-1 downto 0)<=Q;
        elsif add_cmd='1' then
            add_temp<='1';
        elsif shift_cmd='1' and add_temp='1' then
            temp<='0'&c_out&add_out&temp(n-1 downto 1);
            add_temp<='0';
        elsif shift_cmd='1' and add_temp='0' then
            temp<='0'&temp(m+n downto 1);
        end if;
    end if;
end process;
A<=temp(m+n-1 downto n);
lsb<=temp(0);
--output<=temp(m+n-1 downto 0);
process(out_cmd)
begin
    if out_cmd='0' then
        output<=(others=>'0');
    else 
        output<=temp(m+n-1 downto 0);
    end if;
end process;
end Behavioral;
