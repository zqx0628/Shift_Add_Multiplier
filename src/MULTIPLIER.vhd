----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2019/10/16 21:34:36
-- Design Name: 
-- Module Name: MULTIPLIER - Behavioral
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

entity MULTIPLIER is
    generic(m:integer:=8;n:integer:=8);
    port(
        clk,rst:in std_logic;
        D:in std_logic_vector(m-1 downto 0);
        Q:in std_logic_vector(n-1 downto 0);
        output:out std_logic_vector(m+n-1 downto 0)
    );
end MULTIPLIER;
architecture Behavioral of MULTIPLIER is
    signal c_out,load_cmd,add_cmd,shift_cmd,lsb,out_cmd:std_logic;
    signal A,add_out:std_logic_vector(m-1 downto 0);
    component adder
        port(
            D,A:in std_logic_vector(m-1 downto 0);
            add_out:out std_logic_vector(m-1 downto 0);
            c_out:out std_logic
        );
    end component;
    component shifter
        port(
            add_out:in std_logic_vector(m-1 downto 0);
            c_out,load_cmd,add_cmd,shift_cmd,clk,rst,out_cmd:in std_logic;
            Q:in std_logic_vector(n-1 downto 0);
            A:out std_logic_vector(m-1 downto 0);
            lsb:out std_logic;
            output:out std_logic_vector(m+n-1 downto 0)
        );
    end component;
    component controller
        port(
            rst,clk,lsb:in std_logic;
            load_cmd,add_cmd,shift_cmd,out_cmd:out std_logic
        );
    end component;
begin
    G1:adder port map(
        D=>D,A=>A,
        add_out=>add_out,
        c_out=>c_out
    );
    G2:shifter port map(
        add_out=>add_out,
        c_out=>c_out,load_cmd=>load_cmd,add_cmd=>add_cmd,shift_cmd=>shift_cmd,clk=>clk,rst=>rst,
        Q=>Q,A=>A,lsb=>lsb,output=>output,out_cmd=>out_cmd
    );
    G3:controller port map(
        rst=>rst,clk=>clk,lsb=>lsb,out_cmd=>out_cmd,
        load_cmd=>load_cmd,add_cmd=>add_cmd,shift_cmd=>shift_cmd
    );

end Behavioral;
