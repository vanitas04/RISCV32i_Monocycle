library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity somador is
	Port (	i_A, i_B  : in  std_logic_vector(31 downto 0); 
            o_DATA    : out std_logic_vector(31 downto 0) 
         );
end somador;

architecture arch_somador of somador is

begin
	o_DATA <= i_A + i_B;
end arch_somador;