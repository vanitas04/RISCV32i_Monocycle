# Processador RISC-V RV32I Monociclo

Implementação de um processador monociclo compatível com o conjunto de instruções RISC-V RV32I. Este projeto foi desenvolvido no contexto da disciplina de Organização e Arquitetura de Computadores, sob orientação do professor Thiago Felski Pereira, no curso de Ciência da Computação da Universidade do Vale do Itajaí (UNIVALI).

## Visão Geral

O processador executa uma instrução por ciclo de clock e é capaz de realizar operações aritméticas, lógicas e de acesso à memória. Todo o caminho de dados foi desenvolvido em VHDL, respeitando a estrutura modular da arquitetura.

## Funcionalidades Implementadas

- **Decodificação da Instrução**  
  Extração dos campos: opcode (bits [6:0]), rd, rs1, rs2, funct3, funct7 e imediatos (I-type, S-type, B-type).

- **Unidade de Controle**  
  Geração dos sinais de controle: RegWrite, MemWrite, MemRead, ALUSrc, MemToReg, ALUOp, Branch.

- **ULA (Unidade Lógica e Aritmética)**  
  Operações suportadas:
  - `ADD`, `SUB`, `ADDI`
  - `AND`, `OR`, `XOR`  
  Operações controladas pelos sinais `funct3`, `funct7` e `ALUOp`.

- **Banco de Registradores**  
  32 registradores de 32 bits, com escrita controlada por `RegWrite`.

- **Memória de Dados**  
  Capaz de realizar leitura (`LW`) e escrita (`SW`), utilizando `w_ULA` como endereço e `w_RS2` como dado de entrada. Controlada por `MemWrite` e `MemRead`.

- **Multiplexador (MemToReg)**  
  Direciona o valor escrito no banco de registradores com base na origem (ULA ou memória de dados).

- **Simulação e Testes**  
  Instruções `ADDI`, `ADD`, `SUB`, `AND`, `OR`, `XOR`, `LW` e `SW` foram simuladas com sucesso.  
  O sinal de desvio (`Branch`) é gerado, mas o caminho de desvio ainda não foi implementado.

## Compilação e Simulação

A simulação pode ser realizada com o simulador Cadence/Xcelium disponível no ambiente da instituição ou utilizando a plataforma online [EDA Playground](https://edaplayground.com/x/PqyC).

### Rodando no EDA Playground:

1. Acesse: [https://edaplayground.com/x/YTiz](https://edaplayground.com/x/PqyC)
2. Clique em "Run" no canto superior esquerdo.
3. Visualize os sinais na aba "EPWave" após a simulação.

### Requisitos:

- Linguagem: VHDL-93
- Simulador: Cadence Xcelium ou equivalente
- O projeto utiliza arquivos separados para cada componente (ULA, Controle, Memória, etc.)
