# AndroidPourClaude

[![Android CI](https://github.com/TZZ1ac0/AndroidPourClaude/actions/workflows/android-ci.yml/badge.svg)](https://github.com/TZZ1ac0/AndroidPourClaude/actions/workflows/android-ci.yml)
[![Latest release](https://img.shields.io/github/v/release/TZZ1ac0/AndroidPourClaude)](https://github.com/TZZ1ac0/AndroidPourClaude/releases)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

Une application Android « Hello World! » construite avec **Kotlin** et **Jetpack Compose**, dont tout le cycle de vie (vérification, tests, publication, mises à jour) est automatisé avec **GitHub Actions**.

## Cycle de vie automatisé

| Étape | Déclencheur | Workflow | Résultat |
| --- | --- | --- | --- |
| Vérification | Pull request vers `main`, push sur `main` | [`android-ci.yml`](.github/workflows/android-ci.yml) | Validation du wrapper Gradle, lint, tests unitaires, APK de débogage et rapports en artefacts |
| Titre de PR | Ouverture ou modification d'une PR | [`pr-title.yml`](.github/workflows/pr-title.yml) | Vérifie que le titre suit Conventional Commits |
| Publication | Push sur `main` modifiant `gradle.properties` | [`release.yml`](.github/workflows/release.yml) | Tag `vX.Y.Z`, GitHub Release avec les notes du changelog et APK installable |
| Mises à jour | Chaque lundi | [`dependabot.yml`](.github/dependabot.yml) | Pull requests groupées (Kotlin ensemble, actions GitHub ensemble) ; voir [CONTRIBUTING.md](CONTRIBUTING.md#dépendances-dependabot) |

## Prérequis

- Android Studio récent avec Android SDK (plateforme 35 et build-tools 35.0.0).
- JDK 17.

Le Gradle Wrapper est fourni : aucune installation de Gradle n'est nécessaire.

## Démarrer

1. Cloner le dépôt et l'ouvrir dans Android Studio.
2. Laisser Android Studio synchroniser les fichiers Gradle.
3. Lancer la configuration `app` sur un émulateur ou un appareil Android.

En ligne de commande :

```bash
./gradlew lintDebug testDebugUnitTest
./gradlew assembleDebug
```

L'APK de débogage est généré dans `app/build/outputs/apk/debug/`.

## Qualité et contribution

Chaque modification est développée sur une branche dédiée et proposée par pull request. La CI doit réussir avant la revue ; la fusion est réservée au mainteneur. Voir [CONTRIBUTING.md](CONTRIBUTING.md).

Les messages de commit et les titres de pull request suivent [Conventional Commits](https://www.conventionalcommits.org/) : par exemple `feat: add welcome screen` ou `fix: correct greeting`.

## Versions et releases

Le projet suit [Semantic Versioning](https://semver.org/lang/fr/). La version est déclarée dans `VERSION_NAME` et `VERSION_CODE` de `gradle.properties`.

**Pour chaque publication, augmente `VERSION_NAME` et `VERSION_CODE` dans la PR** et ajoute la section correspondante à `CHANGELOG.md`. La fusion sur `main` déclenche la compilation, les tests, la création du tag `vX.Y.Z`, la GitHub Release (dont les notes viennent du changelog) et le téléversement de l'APK installable. Si la version existe déjà pour un autre commit, le workflow échoue au lieu de remplacer la version publiée.

Consulter [CHANGELOG.md](CHANGELOG.md) et la page [Releases](https://github.com/TZZ1ac0/AndroidPourClaude/releases).

## Licence

Distribué sous licence MIT. Voir [LICENSE](LICENSE).
