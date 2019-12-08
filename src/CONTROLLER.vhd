----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2019/10/15 22:04:02
-- Design Name: 
-- Module Name: CONTROLLER - Behavioral
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

entity CONTROLLER is
    generic(m:integer:=8;n:integer:=8);
    port(
        rst,clk,lsb:in std_logic;
        load_cmd,add_cmd,shift_cmd,out_cmd:out std_logic
--        cnt:out integer
    );
end CONTROLLER;

architecture Behavioral of CONTROLLER is
signal count:integer:=0;
type state_type is (idle,init,test,add,shift);
signal state:state_type;
signal start:std_logic:='1';
begin
process(clk,rst)
begin
    if rst='1' then 
        state<=idle;
        count<=0;
        start<='1';
        out_cmd<='0';
    elsif rising_edge(clk) then
        case state is
            when idle=>
                load_cmd<='0';
                add_cmd<='0';
                shift_cmd<='0';
                if start='1' then
                    state<=init;
                    out_cmd<='0';
                else
                    state<=idle;
                    out_cmd<='1';
                end if;
            when init=>
                load_cmd<='1';
                add_cmd<='0';
                shift_cmd<='0';
                out_cmd<='0';
                state<=test;
            when test=>
                load_cmd<='0';
                add_cmd<='0';
                shift_cmd<='0';
                out_cmd<='0';
                if lsb='1' then
                    state<=add;
                else
                    state<=shift;
                end if;
            when add=>
                load_cmd<='0';
                add_cmd<='1';
                shift_cmd<='0';
                out_cmd<='0';
                state<=shift;
            when shift=>
                load_cmd<='0';
                add_cmd<='0';
                shift_cmd<='1'; 
                out_cmd<='0';
                if count<m then
                    state<=test;
                    count<=count+1;
                else
                    count<=0;
                    state<=idle;
                    start<='0';
                end if;
            when others=>state<=idle;
        end case;
    end if;
end process;
end Behavioral;
