# testetarget

# Teste Técnico Flutter

## Aplicativo de Teste em Flutter

Este projeto foi desenvolvido como parte de um teste técnico para avaliar habilidades em Flutter. Consiste em um aplicativo simples com duas telas: uma tela de login e uma tela de captura de informações. Aqui está um guia rápido para entender a estrutura do projeto.

### Estrutura do Projeto

- **main.dart:** Arquivo principal que inicializa o aplicativo Flutter.
- **screens/:** Contém as telas do aplicativo.
  - **login_screen.dart:** Tela de login.
  - **info_screen.dart:** Tela de captura de informações.
- **store/:** Contém a implementação do gerenciador de estado MOBX.
  - **login_store.dart:** Gerenciador de estado central usando MOBX.
  - **info_store.dart:** Gerenciador de estado central usando MOBX.
- **utils/:** Contém widgets personalizados reutilizáveis.
  - **http.dart:** url_launcher Politica de Privacidade.
  - **localstorage.dart:** url_launcher Politica de Privacidade.
- **widgets/:** Gerenciador armazenamento local usando shared_preference.
  - **custom_textfield.dart:** Um widget personalizado para campos de texto.

### Funcionalidades Principais

1. **Tela de Login:**
   - Interface simples com campos de e-mail e senha.
   - Autenticação básica para verificar se o e-mail e a senha são válidos.

2. **Tela de Captura de Informações:**
   - Lista de informações capturadas.
   - Adição de novas informações através de um formulário simples.
   - Utilização do gerenciador de estado MOBX para atualizar dinamicamente a lista.

3. **MOBX e shared_preferences:**
   - Utilização do MOBX para gerenciamento de estado reativo.
   - Armazenamento local de informações usando a biblioteca shared_preferences.

### Como Executar o Projeto

Certifique-se de ter o Flutter instalado em sua máquina. Em seguida, clone este repositório e execute os seguintes comandos no terminal:

```bash
flutter pub get
flutter run