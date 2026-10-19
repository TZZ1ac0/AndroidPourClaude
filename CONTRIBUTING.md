# Contribuer

## Flux de travail

1. Créer une branche dédiée : `feat/...`, `fix/...`, `test/...`, `docs/...` ou `ci/...`.
2. Réaliser une modification ciblée et ajouter ou adapter les tests.
3. Utiliser des commits [Conventional Commits](https://www.conventionalcommits.org/).
4. Ouvrir une pull request vers `main` avec le but, les changements et les vérifications. Le titre de la PR suit aussi Conventional Commits (contrôlé par la CI).
5. Attendre la réussite de la CI, puis demander la revue. La fusion est réservée au mainteneur.
6. Après fusion, le workflow de publication crée un tag et une release si la version de `gradle.properties` n'a pas encore été publiée.

## Vérifications locales

Avec JDK 17 et le SDK Android (plateforme 35, build-tools 35.0.0) :

```bash
./gradlew lintDebug testDebugUnitTest
./gradlew assembleDebug
```

## Versionnement

Suivre SemVer : correctif pour les corrections compatibles, mineure pour les nouvelles fonctionnalités compatibles, majeure pour les changements incompatibles. Dans la même pull request, mettre à jour `VERSION_NAME` et `VERSION_CODE` dans `gradle.properties`, ainsi que `CHANGELOG.md`.

Le workflow de publication lit les notes de la release dans la section `## [X.Y.Z]` du changelog : elle doit exister, sinon la publication échoue. Pour vérifier localement :

```bash
scripts/release-notes.sh X.Y.Z
```

## Dépendances

Dependabot propose chaque semaine des mises à jour Gradle et GitHub Actions. Les relire comme toute autre pull request.
