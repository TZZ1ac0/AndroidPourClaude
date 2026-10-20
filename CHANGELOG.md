# Changelog

Les changements notables du projet sont documentés ici. Le format suit les principes de [Keep a Changelog](https://keepachangelog.com/fr/1.1.0/) et le versionnement [SemVer](https://semver.org/lang/fr/).

## [Non publié]

## [0.1.0] - 2026-10-19

### Ajouté
- Application Android native « Hello World! » en Kotlin et Jetpack Compose.
- Tests unitaires du message d'accueil.
- Gradle Wrapper 8.9 : la compilation ne dépend plus d'une installation locale de Gradle.
- CI GitHub Actions : validation du wrapper, lint, tests unitaires, APK de débogage et rapports en artefacts.
- Contrôle du titre des pull requests (Conventional Commits).
- Workflow de publication : tag `vX.Y.Z`, GitHub Release avec les notes du changelog et APK installable.
- Mises à jour hebdomadaires des dépendances Gradle et des actions GitHub par Dependabot.
- Modèle de pull request et fichier `CODEOWNERS`.
