![My RiscV Single Core Logo](./riscsingle/docs/my_riscv_logo.png)

<p align="center">
<img src="https://img.shields.io/github/license/iss2718/My_RiscV_SingleCore"/>
<img src="https://img.shields.io/badge/_-VHDL-55aa55?logo=data:image/svg%2bxml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMjgiIGhlaWdodD0iMTI4IiB2aWV3Qm94PSIwIDAgNTEyIDUxMiI+PHBhdGggZmlsbD0iIzMyMzMzMCIgZD0iTTM3OC4wNCA0MjQuMjNIMTMzLjk2Yy0yNi4xMDQgMC00Ny40NjItMjEuMzU3LTQ3LjQ2Mi00Ny40NjF2LTI0NC4wOGMwLTI2LjEwNSAyMS4zNTgtNDcuNDYyIDQ3LjQ2Mi00Ny40NjJoMjQ0LjA4YzI2LjEwNCAwIDQ3LjQ2MiAyMS4zNTcgNDcuNDYyIDQ3LjQ2MXYyNDQuMDhjMCAyNi4xMDUtMjEuMzU4IDQ3LjQ2Mi00Ny40NjIgNDcuNDYybS0zOS44NDctMjUzLjA1OUgxNzcuOXYxNjAuMjk0aDE2MC4yOTR6TTE4Mi4zNTEgMEgxNTIuNXY3MS43NjhoMjkuODV6bTU5Ljg3OSAwaC0yOS44NTF2NzEuNzY4aDI5Ljg1em01OS44OCAwaC0yOS44NTF2NzEuNzY4aDI5Ljg1em01OS44NzkgMGgtMjkuODUxdjcxLjc2OGgyOS44NXpNNzMuMDM5IDMyOS42ODRIMHYyOS44NTFoNzMuMDR6bTAtNTkuODc4SDB2MjkuODVoNzMuMDR6bTAtNTkuODhIMHYyOS44NWg3My4wNHptMC01OS44OEgwdjI5Ljg1MWg3My4wNHpNNTEyIDMyOS42ODRoLTczLjA0djI5Ljg1MUg1MTJ6bTAtNTkuODc4aC03My4wNHYyOS44NUg1MTJ6bTAtNTkuODhoLTczLjA0djI5Ljg1SDUxMnptMC01OS44OGgtNzMuMDR2MjkuODUxSDUxMnpNMTgyLjM1IDQ0MC4yMzJIMTUyLjVWNTEyaDI5Ljg1em01OS44OCAwaC0yOS44NTFWNTEyaDI5Ljg1em01OS44NzkgMGgtMjkuODUxVjUxMmgyOS44NXptNTkuODggMGgtMjkuODUxVjUxMmgyOS44NXpNMTUxLjU1IDEyOC45MDJjMC0xMi4yNzItMTMuMzc2LTE5Ljk4My0yNC4wMTgtMTMuODQ3Yy0xMC42NDMgNi4xMzUtMTAuNjQzIDIxLjU1NyAwIDI3LjY5M3MyNC4wMTgtMS41NzYgMjQuMDE4LTEzLjg0NyIvPjwvc3ZnPg=="/>
<img src="https://img.shields.io/badge/_-Assembly-5555aa?logo=data:image/svg%2bxml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMjgiIGhlaWdodD0iMTI4IiB2aWV3Qm94PSIwIDAgMjQgMjQiPjxwYXRoIGZpbGw9IiMzMjMzMzAiIGQ9Ik0wIDB2MjRoMjRWMGgtOS4yMjVjMCAxLjQwNi0xLjA0IDIuODEzLTIuNzU2IDIuODEzQTIuNzY2IDIuNzY2IDAgMCAxIDkuMjM0IDB6bTE4LjIwNCAxMC45NDdxMS4wNiAwIDEuODIuNDEycS43NzUuMzk2IDEuMzMgMS4zNjFsLTEuNzI2IDEuMTA4cS0uMjg1LS41MDctLjYxNy0uNzI4YTEuNCAxLjQgMCAwIDAtLjgwNy0uMjIycS0uNDkgMC0uNzc2LjI3YS45LjkgMCAwIDAtLjI4NS42OHEwIC41MDYuMzE3Ljc3NXEuMzMzLjI1NSAxLjA0NS41N2wuNTU0LjIzOHEuNzExLjMgMS4yNS42MzNxLjU1NC4zMTUuOTE4LjcyOGEyLjYgMi42IDAgMCAxIC41Ny45MThxLjIwNi41MDYuMjA2IDEuMjAzYTMgMyAwIDAgMS0uMjg1IDEuMzNxLS4yNy41Ny0uNzYuOTY1YTMuNCAzLjQgMCAwIDEtMS4xNzEuNjAxcS0uNjY1LjE5LTEuNDU2LjE5YTUuMyA1LjMgMCAwIDEtMS40MS0uMTc0YTQuNiA0LjYgMCAwIDEtMS4xMzktLjQ3NWE0IDQgMCAwIDEtLjg4Ni0uNzEyYTQuNSA0LjUgMCAwIDEtLjYwMi0uOTAyTDE2LjEgMTguNjdxLjM2My41ODUuODU1Ljk2NnEuNTA1LjM4IDEuMzMuMzhxLjY5NSAwIDEuMDkxLS4zMDFxLjQxMi0uMzE2LjQxMi0uNzkycTAtLjU3LS40MjgtLjg1NHEtLjQyNy0uMjg1LTEuMTg3LS42MThsLS41NTQtLjIzN2E4IDggMCAwIDEtMS4wOTItLjU1NGEzLjYgMy42IDAgMCAxLS44MzktLjY5NmEyLjkgMi45IDAgMCAxLS41MzgtLjkwM2EzLjQgMy40IDAgMCAxLS4xOS0xLjE4N2EzIDMgMCAwIDEgLjIyMi0xLjE1NWEyLjkgMi45IDAgMCAxIC42NDktLjkzNHEuNDI4LS4zOTYgMS4wMjktLjYxN3EuNi0uMjIyIDEuMzQ1LS4yMjJ6bS04Ljc5Ni4wMzJoLjE5bDQuOTIyIDEwLjg1OGgtMi4zMjdsLS41MDYtMS4yMTlINy4zMThsLS41MDYgMS4yMTlINC42NzV6bS4wNjMgMy45ODhhMjIgMjIgMCAwIDEtLjIwNi42OTdsLS4yMDUuNjQ5YTcgNyAwIDAgMS0uMjIyLjU4NWwtLjc3NiAxLjg2OGgyLjgzNGwtLjc3Ni0xLjg2OGExNiAxNiAwIDAgMS0uMjM3LS42MzNhMjQgMjQgMCAwIDEtLjQxMi0xLjI5OCIvPjwvc3ZnPg=="/>
<img src="https://img.shields.io/badge/_-RISC--V-E30B5C?logo=riscv&logoColor=323330"/>
</p>


Este projeto implementa um processador RISC-V de núcleo único utilizando VHDL. O processador é composto por vários componentes, cada um responsável por uma parte específica da execução das instruções RISC-V.

## Estrutura do Processador 🏗️

O processador é composto pelos seguintes componentes principais:

- **Instruction Memory (imem.vhdl)**: Memória de instruções que armazena o código do programa.
- **Data Memory (dmem.vhdl)**: Memória de dados que armazena os dados durante a execução do programa.
- **Register File (regfile.vhdl)**: Conjunto de registradores utilizados para armazenar valores temporários.
- **Arithmetic Logic Unit (alu.vhdl)**: Unidade Lógica e Aritmética que executa operações matemáticas e lógicas.
- **Control Unit (controller.vhdl)**: Unidade de controle que decodifica as instruções e gera sinais de controle.
- **Datapath (datapath.vhdl)**: Caminho de dados que interconecta todos os componentes e realiza a execução das instruções.
- **Top-level Module (top.vhdl)**: Módulo de nível superior que instancia o processador e as memórias.
- **Testbench (testbench.vhdl)**: Banco de testes para verificar o funcionamento do processador.

## Componentes Implementados 🛠️

- **datapath.vhdl**: Implementa o caminho de dados do processador, interconectando todos os componentes e realizando a execução das instruções.
- **controller.vhdl**: Decodifica os sinais de controle com base no campo opcode das instruções.
- **imem.vhdl**: Implementa a memória de instruções, inicializada a partir de um arquivo.
- **dmem.vhdl**: Implementa a memória de dados, permitindo leitura e escrita de dados.
- **regfile.vhdl**: Implementa o conjunto de registradores utilizados para armazenar valores temporários.
- **alu.vhdl**: Implementa a unidade lógica e aritmética, realizando operações matemáticas e lógicas.
- **aludec.vhdl**: Decodifica a operação da ALU com base nos campos opcode e funct3 das instruções.
- **extend.vhdl**: Extende valores imediatos das instruções RISC-V.
- **flopr.vhdl**: Implementa um registrador de 32 bits com reset assíncrono.
- **adder.vhdl**: Implementa um somador parametrizável.
- **mux2.vhdl**: Implementa um multiplexador de 2 entradas.
- **mux3.vhdl**: Implementa um multiplexador de 3 entradas.
- **maindec.vhdl**: Decodifica os sinais de controle principais com base no campo opcode das instruções.
- **riscv_pkg.vhdl**: Pacote que contém constantes, componentes e funções utilizadas no processador.
- **riscvsingle.vhdl**: Implementa o núcleo do processador RISC-V de núcleo único.
- **top.vhdl**: Instancia o processador e as memórias, conectando todos os componentes.
- **testbench.vhdl**: Verifica o funcionamento do processador através de simulações.

## Descrição dos Componentes 📜

### datapath.vhdl
O componente `datapath` é responsável por interconectar todos os componentes do processador e realizar a execução das instruções. Ele inclui os seguintes subcomponentes:
- **flopr**: Flip-flop com reset.
- **adder**: Somador.
- **extend**: Extensor de valores imediatos.
- **regfile**: Conjunto de registradores.
- **alu**: Unidade Lógica e Aritmética.
- **mux2**: Multiplexador de 2 entradas.
- **mux3**: Multiplexador de 3 entradas.

### controller.vhdl
O componente `controller` decodifica os sinais de controle com base no campo opcode das instruções. Ele gera sinais de controle para os outros componentes do processador.

### imem.vhdl
O componente `imem` implementa a memória de instruções, que armazena o código do programa. A memória é inicializada a partir de um arquivo chamado "riscvtest.txt".

### dmem.vhdl
O componente `dmem` implementa a memória de dados, que armazena os dados durante a execução do programa. A memória permite leitura e escrita de dados.

### regfile.vhdl
O componente `regfile` implementa o conjunto de registradores utilizados para armazenar valores temporários. Ele possui portas de leitura e escrita para acessar os registradores.

### alu.vhdl
O componente `alu` implementa a unidade lógica e aritmética, que realiza operações matemáticas e lógicas. Ele suporta operações como AND, OR, ADD, SUB e SLT (Set Less Than).

### aludec.vhdl
O componente `aludec` decodifica a operação da ALU com base nos campos opcode e funct3 das instruções. Ele gera o sinal de controle para a ALU.

### extend.vhdl
O componente `extend` extende valores imediatos das instruções RISC-V. Ele recebe um sinal de controle `immsrc` e uma instrução `instr`, e gera um valor imediato estendido `immext`.

### flopr.vhdl
O componente `flopr` implementa um registrador de 32 bits com reset assíncrono. Ele armazena valores temporários e permite resetar o valor armazenado.

### adder.vhdl
O componente `adder` implementa um somador parametrizável. Ele realiza a soma de dois vetores de entrada e um carry-in, e gera um vetor de soma e um carry-out.

### mux2.vhdl
O componente `mux2` implementa um multiplexador de 2 entradas. Ele seleciona uma das duas entradas com base no sinal de seleção.

### mux3.vhdl
O componente `mux3` implementa um multiplexador de 3 entradas. Ele seleciona uma das três entradas com base no sinal de seleção.

### maindec.vhdl
O componente `maindec` decodifica os sinais de controle principais com base no campo opcode das instruções. Ele gera sinais de controle para os outros componentes do processador.

### riscv_pkg.vhdl
O pacote `riscv_pkg` contém constantes, componentes e funções utilizadas no processador. Ele inclui componentes como multiplexadores, flip-flops, somadores, ALU, conjunto de registradores, extensor de valores imediatos, decodificadores de controle e memória.

### riscvsingle.vhdl
O componente `riscvsingle` implementa o núcleo do processador RISC-V de núcleo único. Ele instancia o controlador e o caminho de dados, conectando todos os componentes necessários para a execução das instruções.

### top.vhdl
O componente `top` instancia o processador e as memórias, conectando todos os componentes. Ele é o módulo de nível superior do projeto.

### testbench.vhdl
O componente `testbench` verifica o funcionamento do processador através de simulações. Ele gera sinais de clock e reset, e verifica se os resultados das operações estão corretos.

## Como Executar 🚀

### Quartus
O projeto foi compilado e sintetizado utilizando o Quartus. O arquivo do projeto do Quartus está na pasta `./riscsingle/quartus`.

Para abrir este projeto no Quartus, basta abrir o arquivo `./riscsingle/quartus/riscsingle.qpf`.

### ModelSim
O projeto foi testado utilizando o ModelSim. O projeto de teste está dentro da pasta `./riscsingle/modelsim`.

Para abrir este projeto no ModelSim e realizar as simulações, basta abrir o arquivo `./riscsingle/modelsim/riscsingle.mpf`.

## Licença 📄

Este projeto está licenciado sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.
