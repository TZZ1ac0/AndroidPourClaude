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

## Dépendances (Dependabot)

Chaque lundi, Dependabot compare les dépendances aux dernières versions et ouvre des pull requests (configuration : `.github/dependabot.yml`). Il ne fusionne jamais rien : la décision reste au mainteneur, et la CI sert de filet de sécurité.

**Regroupements**
- Le plugin Kotlin et le plugin du compilateur Compose sont mis à jour **ensemble** dans une seule PR, car ils doivent toujours avoir la même version.
- Toutes les actions GitHub des workflows sont mises à jour dans une seule PR.
- Les autres dépendances (BOM Compose, wrapper Gradle...) restent des PR individuelles.

**Versions majeures du plugin Android (AGP)**
Elles sont ignorées volontairement : le passage à l'AGP 9 demande d'adapter les fichiers de build. Les versions 8.x restent proposées. Pour migrer, ouvrir une PR dédiée, puis supprimer les règles `ignore` correspondantes dans `dependabot.yml`.

**Que faire d'une PR Dependabot ?**
1. CI verte : relire le changement puis fusionner. Si la PR est en retard sur `main`, commenter `@dependabot rebase`.
2. CI rouge : ne pas fusionner. Ouvrir la PR pour voir l'étape en échec, puis soit corriger dans une PR dédiée, soit l'écarter.
3. Ne plus vouloir d'une mise à jour : commenter `@dependabot ignore this major version` (ou `minor version`, ou `dependency`). La PR est fermée et Dependabot ne la reproposera pas.

Fusionner une PR Dependabot ne publie pas de release : seule une modification de `gradle.properties` déclenche le workflow de publication.
