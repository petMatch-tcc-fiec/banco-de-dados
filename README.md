# Projeto de Banco de Dados: Sistema de Adoção de Animais

Este repositório contém o modelo lógico e a documentação do banco de dados para o sistema de adoção de animais. O objetivo é fornecer uma base de dados robusta e bem estruturada para gerenciar os cadastros de usuários, ONGs, animais e todo o fluxo de adoção.

---

### Visão Geral do Modelo

O modelo lógico foi projetado para capturar as entidades principais do sistema e os relacionamentos entre elas. A arquitetura do banco de dados foi desenvolvida para ser escalável e eficiente, permitindo operações como cadastro, busca, manifestação de interesse e aprovação de adoções.

### Entidades do Modelo

As principais entidades e seus atributos são:

**adotanteUsuarios**: Contém as informações dos usuários que desejam adotar animais.

`id_adotante`: Chave primária.

`nome_adotante`: Nome completo do adotante.

`cpf_adotante`: CPF para identificação única.

`endereco_adotante`: Endereço de residência.

`celular_adotante`: Número de contato.

`email_adotante`: E-mail para comunicação.

`descricao_outros_animais`: Detalhes sobre outros animais que o adotante possa ter.

`preferencia_adocao`: Preferências sobre o tipo de animal a ser adotado.

**ongUsuarios**: Armazena os dados das ONGs e abrigos parceiros.

`id_ong`: Chave primária.

`nome_fantasia_ong`: Nome comercial da ONG.

`razao_social_ong`: Razão social.

`endereco_ong`: Endereço da ONG.

`telefone_ong`: Telefone de contato.

`email_ong`: E-mail oficial.

`contato_ong`: Nome do responsável pelo contato.

**animais**: Tabela principal para os animais disponíveis para adoção.

`id_animal`: Chave primária.

`nome_animal`: Nome do animal.

`idade_animal`: Idade do animal.

`porte_animal`: Porte (ex: pequeno, médio, grande).

`sexo_animal`: Sexo (macho/fêmea).

`especie_animal`: Espécie (ex: cachorro, gato).

`raca_animal`: Raça.

`cor_animal`: Cor.

`observacoes_animal`: Informações adicionais.

`fk_ongUsuarios_id_ong`: Chave estrangeira que liga o animal à ONG responsável.

**adocao**: Gerencia o status do processo de adoção.

`id_adocao`: Chave primária.

`fk_animais_id_animal`: Chave estrangeira que identifica o animal na adoção.

`fk_adotanteUsuarios_id_adotante`: Chave estrangeira que identifica o adotante.

`data_hora_adocao`: Data e hora em que a adoção foi aprovada.

`status_adocao`: Status do processo (ex: `pendente`, `aprovado`, `rejeitado`).

**listaEspera**: Mantém a fila de interessados em um determinado animal.

`id_listaEspera`: Chave primária.

`fk_animais_id_animal`: Chave estrangeira que identifica o animal.

`fk_adotanteUsuarios_id_adotante`: Chave estrangeira que identifica o adotante na fila.

`data_hora_lista`: Data e hora em que o usuário manifestou interesse.

**fotosAnimais**: Armazena as fotos dos animais.

`id_foto_animal`: Chave primária.

`arquivo_foto`: O caminho ou link para a imagem.

`fk_animais_id_animal`: Chave estrangeira que liga a foto a um animal.

**fotosAdotantes**: Armazena as fotos dos adotantes (ex: fotos de perfil, comprovantes).

`id_foto_adotante`: Chave primária.

`arquivo_foto`: O caminho ou link para a imagem.

`fk_adotanteUsuarios_id_adotante`: Chave estrangeira que liga a foto a um adotante.

**fichaMedicaAnimal**: Contém os dados de saúde dos animais.

`id_ficha_medica`: Chave primária.

`vacinas`: Informações sobre vacinas.

`historico_saude`: Histórico médico do animal.

`fk_animais_id_animal`: Chave estrangeira que liga a ficha médica a um animal.

**eventos**: Gerencia os eventos de adoção e outras atividades da ONG.

`id_evento`: Chave primária.

`nome_evento`: Nome do evento.

`data_hora_evento`: Data e hora do evento.

`endereco_evento`: Local do evento.

`fk_ongUsuarios_id_ong`: Chave estrangeira que liga o evento à ONG responsável.

---

### Chaves Estrangeiras

`fk_ongUsuarios_id_ong` em `animais`

`fk_ongUsuarios_id_ong` em `eventos`

`fk_animais_id_animal` em `adocao`

`fk_adotanteUsuarios_id_adotante` em `adocao`

`fk_animais_id_animal` em `listaEspera`

`fk_adotanteUsuarios_id_adotante` em `listaEspera`

`fk_animais_id_animal` em `fotosAnimais`

`fk_animais_id_animal` em `fichaMedicaAnimal`

`fk_adotanteUsuarios_id_adotante` em `fotosAdotantes`

---

### Como Contribuir

Se você deseja fazer alterações no modelo, por favor, abra uma _issue_ ou um _pull request_. Para sugestões de melhoria ou novas funcionalidades, utilize o mesmo processo.
