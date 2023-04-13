ThisBuild / version := "0.1.0-SNAPSHOT"

ThisBuild / scalaVersion := "2.12.13"

lazy val root = (project in file("."))
  .settings(
    name := "Protocols"
  )

scalacOptions ++= Seq(
  "-language:reflectiveCalls",
  "-deprecation",
  "-feature",
  "-Xcheckinit",
  "-P:chiselplugin:genBundleElements",
)

addCompilerPlugin("edu.berkeley.cs" % "chisel3-plugin" % "3.5.4" cross CrossVersion.full)
libraryDependencies += "edu.berkeley.cs" %% "chisel3" % "3.5.4"
libraryDependencies += "edu.berkeley.cs" %% "chiseltest" % "0.5.4"// See README.md for license details.

scalaVersion     := "2.12.13"
//ThisBuild / version          := "0.1.0"
//ThisBuild / organization     := "%ORGANIZATION%"

//val chiselVersion = "3.5.4"

//lazy val root = (project in file("."))
//  .settings(
//    name := "%NAME%",
//    libraryDependencies ++= Seq(
//      "edu.berkeley.cs" %% "chisel3" % chiselVersion,
//      "edu.berkeley.cs" %% "chiseltest" % "0.5.4" % "test"
//    ),

scalacOptions ++= Seq(
  "-language:reflectiveCalls",
  "-deprecation",
  "-feature",
  "-Xcheckinit",
  "-P:chiselplugin:genBundleElements",
)

addCompilerPlugin("edu.berkeley.cs" % "chisel3-plugin" % "3.5.4" cross CrossVersion.full)
libraryDependencies += "edu.berkeley.cs" %% "chisel3" % "3.5.4"
libraryDependencies += "edu.berkeley.cs" %% "chiseltest" % "0.5.4"