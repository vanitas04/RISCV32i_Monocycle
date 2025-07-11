library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;


entity MUX_MEMTOREG is

	port(
    	i_A  		: in  std_logic_vector(31 downto 0);
        i_B  		: in  std_logic_vector(31 downto 0);
        i_SEL 		: in  std_logic;
        o_MUX  		: out std_logic_vector(31 downto 0)
    );

end MUX_MEMTOREG;


architecture arch_mux_memtoreg of MUX_MEMTOREG is

begin
	process(i_A, i_B, i_SEL)
    begin
    	if (i_SEL = '0') then
            o_MUX <= i_A;
        else
        	o_MUX <= i_B;
        end if;
    end process;
    
   
end arch_mux_memtoreg;