----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2019/10/15 22:46:03
-- Design Name: 
-- Module Name: controller_test - Behavioral
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

entity testbench is
--  Port ( );
    generic(m:integer:=8;n:integer:=8);
end testbench;

architecture Behavioral of testbench is
    component multiplier
        port(
            clk,rst:in std_logic;
            D:in std_logic_vector(m-1 downto 0);
            Q:in std_logic_vector(n-1 downto 0);
            output:out std_logic_vector(m+n-1 downto 0)
        );
    end component;
    signal clk,rst:std_logic;
    signal D:std_logic_vector(m-1 downto 0);
    signal Q:std_logic_vector(n-1 downto 0);
    signal output:std_logic_vector(m+n-1 downto 0);
begin
    G:multiplier port map(
        clk=>clk,rst=>rst,D=>D,Q=>Q,output=>output
    );
process
    begin
    clk<='1';
    wait for 5 ns;
    clk<='0';
    wait for 5 ns;
end process;
process
    begin
--64*64
--    rst<='0';
--    D<="1111111111111111111111111111111111111111111111111111111111111111";
--    Q<="1111111111111111111111111111111111111111111111111111111111111111";
--    wait for 10 us;
--    rst<='1';
--    wait for 1000 ns;
--    rst<='0';
--    D<="1110111111011111110111111011111111111111111111111111111111111111";
--    Q<="1011011100011010000110111111100011111111111111111111111111111111";
--    wait for 10 us;
--    rst<='1';
--    wait for 1000 ns;
--    rst<='0';
--    D<="0000000000000000111111111111111111111111111111111111111111111111";
--    Q<="1111111111111111111111111111111111111111111111111111111111111111";
--    wait for 10 us;
--    rst<='1';
--    wait for 1000 ns;
--    rst<='0';
--    D<="0000000000000000000000001111111111111111111111111111111111111111";
--    Q<="0000000000000000111111111111111111111111111111111111111111111111";
--    wait for 10 us;
--    rst<='1';
--    wait for 1000 ns;
--    rst<='0';
--    D<="0000000000000000000000000000111111111111111111111111111111111111";
--    Q<="0000000000000000000000001111111111111111111111111111111111111111";
--    wait for 10 us;
    rst<='0';
    D<="11111111";
    Q<="11111111";
    wait for 10 us;
    rst<='1';
    wait for 1000 ns;
    rst<='0';
    D<="10000000";
    Q<="10000111";
    wait for 10 us;
    rst<='1';
    wait for 1000 ns;
    rst<='0';
    D<="11111000";
    Q<="11010100";
    wait for 10 us;
    rst<='1';
    wait for 1000 ns;
    rst<='0';
    D<="11100001";
    Q<="00011111";
    wait for 10 us;
    rst<='1';
    wait for 1000 ns;
    rst<='0';
    D<="00000000";
    Q<="11111111";
    wait for 10 us;
--    D<="100";
--    Q<="110";
--    wait for 1000 ns;
--    rst<='1';
--    wait for 200 ns;
--    rst<='0';
--    wait for 800 ns;
end process;
end Behavioral;
