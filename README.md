# ShoppingApp

Este projeto é um aplicativo de lista de compras desenvolvido em Flutter, com o objetivo de organizar e gerenciar itens de compras. Ele atende a diversos requisitos funcionais, de design e de estrutura de dados.

## Funcionalidades

O ShoppingApp permite que os usuários:
- Adicionem, visualizem e excluam itens de uma lista de compras.
- Organizem os itens com base em categorias, facilitando a visualização e o gerenciamento.
- Naveguem entre diferentes telas (home, listagem e formulário) através de um menu.

## Estrutura do Projeto

O projeto é dividido em módulos para facilitar a manutenção e a escalabilidade:

- **lib/components**: Contém widgets reutilizáveis, como o `CategoryDropdown`, que é usado para a seleção de categorias no formulário.
- **lib/models**: Define os modelos de dados principais, como `Item` e `Category`, representando as classes de domínio do projeto.
- **lib/screens**: Contém as telas principais do aplicativo, incluindo `ItemFormScreen`, `ItemListScreen` e `DashboardScreen`.
- **lib/services**: Inclui o `ApiService`, responsável pela comunicação com o backend, que pode ser um servidor real ou um simulador usando json-server.

## Requisitos Atendidos

### Classes de Domínio com Cardinalidade

1. **Item**: Representa um item individual na lista de compras. Tem atributos como `id`, `name`, `categoryId` e `categoryName`.
2. **Category**: Representa uma categoria de item (por exemplo, "Frutas", "Limpeza"). Também possui atributos como `id` e `name`.

**Cardinalidade**:
- Existe uma relação `many-to-one` entre `Item` e `Category`, pois cada item pertence a uma única categoria, mas uma categoria pode ter múltiplos itens.

### Tela de Listagem

- A tela de listagem (`ItemListScreen`) exibe todos os itens adicionados pelo usuário. Cada item é mostrado com seu nome e categoria.
- Nessa tela, o usuário também pode navegar para o formulário para adicionar novos itens ou atualizar os itens existentes.

### Tela de Formulário

- A tela de formulário (`ItemFormScreen`) permite adicionar um novo item à lista de compras.
- O formulário possui um campo de entrada de texto para o nome do item e um `CategoryDropdown` para a seleção de categoria.
- Ao preencher os campos e tocar no botão "Adicionar", o item é salvo e exibido na tela de listagem.

### Tela de Dashboard (Apresentação / Home)

- A tela de dashboard (`DashboardScreen`) é a tela inicial do aplicativo, com uma visão geral do conteúdo e navegação.
- Nessa tela, os usuários encontram opções para visualizar a lista de itens ou adicionar um novo item.

### Menu de Navegação

- O aplicativo possui um menu de navegação que permite alternar entre as telas de **Dashboard**, **Listagem de Itens** e **Formulário de Adição de Item**.
- Isso proporciona uma experiência de navegação fluida e intuitiva.

### CRUD com Backend

- O aplicativo implementa operações de **Create (criação)**, **Read (leitura)**, **Update (atualização)** e **Delete (exclusão)**, integrando-se a um backend (simulado ou real) para gerenciar os dados dos itens e categorias.
- O backend pode ser simulado com `json-server`, permitindo que as operações de rede sejam testadas localmente.

### Componentes

- **CategoryDropdown**: Um componente que exibe uma lista suspensa de categorias, usado na tela de formulário para associar um item a uma categoria específica.
- **ItemTile** (opcional): Pode ser um componente para exibir itens individuais na lista de compras, facilitando a reutilização em diferentes telas.

### Testes Unitários

- O projeto inclui testes unitários para garantir a qualidade do código e a precisão das funcionalidades principais.
- Os testes verificam casos como:
  - A validação do formulário para garantir que o nome do item seja obrigatório.
  - A adição de itens, simulando a interação do usuário com os componentes.

## Como Iniciar o Projeto

### Pré-requisitos

Para executar o projeto localmente, é necessário:
- **Flutter SDK**: Certifique-se de que o Flutter esteja instalado. [Instruções de instalação](https://flutter.dev/docs/get-started/install).
- **Git**: Para clonar o repositório.
- **json-server**: Opcionalmente, para simular o backend.

### Passo a Passo

1. **Clonar o repositório**:

   ```bash
   git clone https://github.com/usuario/shoppingapp.git
   cd shoppingapp
   ```

2. **Instalar dependências**:

   Execute o comando abaixo para instalar todas as dependências:

   ```bash
   flutter pub get
   ```

3. **Simular o Backend com json-server** (opcional):

   Para simular o backend com `json-server`:
   - Instale o json-server: `npm install -g json-server`.
   - No diretório do projeto, crie um arquivo `db.json` com dados de exemplo.
   - Execute: `json-server --watch db.json --port 3000`.

4. **Executar o aplicativo**:

   Conecte um dispositivo ou inicialize um emulador e execute o comando:

   ```bash
   flutter run
   ```

5. **Executar Testes Unitários**:

   Para rodar os testes unitários:

   ```bash
   flutter test
   ```

---
