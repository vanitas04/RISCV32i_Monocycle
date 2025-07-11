library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity ULA is
    port(
        i_A       : in  std_logic_vector(31 downto 0);
        i_B       : in  std_logic_vector(31 downto 0);
        i_F3      : in  std_logic_vector(2 downto 0);
        i_INST30  : in  std_logic;
        i_ALUOP   : in  std_logic_vector(1 downto 0);
        o_ZERO    : out std_logic;
        o_ULA     : out std_logic_vector(31 downto 0)
    );
end entity;

architecture arch_ULA of ULA is
    signal w_ULA : std_logic_vector(31 downto 0);
begin

    process(i_A, i_B, i_F3, i_INST30, i_ALUOP)
    begin
        case i_ALUOP is
            when "00" =>        
                w_ULA <= i_A + i_B;

            when "01" =>        
                w_ULA <= i_A - i_B;

            when "10" =>        -- Tipo R
                case i_F3 is
                    when "000" =>
                        if i_INST30 = '0' then
                            w_ULA <= i_A + i_B;  -- ADD
                        else
                            w_ULA <= i_A - i_B;  -- SUB
                        end if;
                    when "001" =>
                        w_ULA <= i_A xor i_B;
                    when "010" =>
                        w_ULA <= i_A or i_B;
                    when "011" =>
                        w_ULA <= i_A and i_B;
                    when others =>
                        w_ULA <= (others => '0');
                end case;

            when others =>
                w_ULA <= (others => '0');
        end case;
    end process;


    o_ULA  <= w_ULA;
    o_ZERO <= '1' when w_ULA = x"00000000" else '0';

end architecture;
