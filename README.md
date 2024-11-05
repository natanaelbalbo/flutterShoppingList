# ShoppingApp

Este é um aplicativo de lista de compras desenvolvido em Flutter. O aplicativo permite aos usuários criar, visualizar e gerenciar itens de uma lista de compras, incluindo a seleção de categorias para cada item. A estrutura foi desenvolvida com um foco em uma experiência de usuário intuitiva e também em um código modular e testável.

## Funcionalidades

- **Adição de itens**: Permite ao usuário adicionar um novo item à lista com um nome e uma categoria selecionada.
- **Listagem de itens**: Mostra todos os itens adicionados pelo usuário.
- **Categorias**: As categorias ajudam a organizar os itens de acordo com diferentes tipos.

## Estrutura do Projeto

O projeto é organizado em algumas pastas principais:
- **lib/components**: Contém widgets reutilizáveis, como `CategoryDropdown`.
- **lib/models**: Contém a definição dos modelos de dados, como `Item`.
- **lib/screens**: Contém as telas principais do aplicativo, como `ItemFormScreen`.
- **lib/services**: Contém as classes de serviços, incluindo `ApiService`, que faz chamadas para o backend ou manipula dados.

## Pré-requisitos

Para rodar o projeto localmente, é necessário:

- **Flutter SDK**: Certifique-se de ter o Flutter instalado. [Instruções de instalação](https://flutter.dev/docs/get-started/install).
- **Git**: Para clonar o repositório.

## Como Iniciar o Projeto

1. **Clonar o repositório**:

   ```bash
   git clone https://github.com/usuario/shoppingapp.git
   cd shoppingapp
   ```

2. **Instalar dependências**:

   Na raiz do projeto, execute o comando abaixo para instalar as dependências listadas no arquivo `pubspec.yaml`.

   ```bash
   flutter pub get
   ```

3. **Executar o aplicativo**:

   Conecte um dispositivo ou inicialize um emulador e execute:

   ```bash
   flutter run
   ```

## Estrutura de Dados

- **Item**: Representa um item na lista de compras, com propriedades como `id`, `name`, `categoryId` e `categoryName`.
- **Category**: Representa uma categoria de itens, com propriedades como `id` e `name`.

## Testes

Para rodar os tests use: 

```bash
flutter test
```
