Trabalho desenvolvido para a materia ORGANIZAÇÃO E ARQUITETURA DE COMPUTADORES II da UNIVERSIDADE FEDERAL DE OURO PRETO.

A proposta do trabalho era desenvolver um processador da família MIPS monociclo de 16 bits, capaz de executar o equivalente as seguintes instruções: add, and, or, beq, bne, lw, sw, slt e j. Para isso, foi utilizada o seguinte formato de instruções:

![formato_instrucoes](https://user-images.githubusercontent.com/69698754/197090747-01f735cd-84c5-43db-b506-b2d24474bcad.png)

Onde o OPCODE (de 4 bits) foi definido da seguinte maneira:

0000    ->      Jump
0001    ->      R-Type
0010    ->      LW
0011    ->      SW
0100    ->      BRANCH

Já o campo as operações utilizadas na ULA são controladas pelo campo de 3 bits ALUControl, definido por:

000     ->      AND
001     ->      OR
010     ->      ADD
110     ->      SUB
011     ->      BRANCH
111     ->      slt

Quanto ao funcionamento do processador existem algumas peculiaridades:

1. O Program Counter é incrementado bit a bit, sendo que sua saída é utilizada como índice para localizar a próxima instrução a ser executada.
2. Os 8 algarismos mais significativos são utilizados como índice para a Memória de Dados.

QUANTO A EXECUÇÃO

O processador automaticamente executa em ordem as 9 instruções predeterminadas, como pode-se verificar no arquivo "InstructionMemory.v", para isso basta executar o arquivo "Monocycle.v" que é basicamente o arquivo main. Porém a exibição dos dados está um pouco confusa. Assim sendo, recomenda-se que sejam executados os arquivos iniciados em "_TB" onde são feitos os testes individuais de cada módulo desenvolvido. Lá o próprio usuario pode definir os inputs para cada módulo e verificar a corretude de sua saída. Tais arquivos estão executando uma instrução add cujos 16 bits são 0001 010 001 010 010 (com exceção do módulo IF que automaticamente pega a instrução no primeiro local de memória).

