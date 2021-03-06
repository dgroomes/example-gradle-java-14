# consuming-a-maven-bom

This sub-project shows how to consume a Maven BOM in a Gradle project and *strictly* override a BOM dependency.

---

In particular, this project imports the [Jackson project](https://github.com/FasterXML/jackson) BOM dependency: <https://github.com/FasterXML/jackson-bom>.
This allows Jackson dependencies defined in the BOM to be declared in the Gradle project *without* a version because
the version will be determined by the BOM (pretty cool!). Also, we are able to specifically override versions of any
dependency defined in the BOM. See the block comments in the `build.gradle.kts` file for details.

While I develop this project, I use the Gradle `dependencies` and `dependencyInsight` tasks to observe the resolved
versions of dependencies. For example:

```
./gradlew dependencies
./gradlew dependencies --configuration compileClasspath
./gradlew dependencyInsight --dependency jackson-bom
./gradlew dependencyInsight --dependency jackson-databind
```  

## Referenced material

* Gradle docs: [_Importing Maven BOMs_](https://docs.gradle.org/current/userguide/platforms.html#sub:bom_import)
* Gradle docs: [_Declaring Rich Versions_](https://docs.gradle.org/current/userguide/rich_versions.html#sec:strict-version)
* Blog post (brilliant post as always, by mrhaki): [_Use bill of materials (BOM) As Dependency Constraints_](https://mrhaki.blogspot.com/2019/04/gradle-goodness-use-bill-of-materials.html)
* GitHub issue: [_Support overriding BOM version properties with ext_](https://github.com/gradle/gradle/issues/9160) ?
