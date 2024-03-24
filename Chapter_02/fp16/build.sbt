ThisBuild / version := "0.1.0-SNAPSHOT"

ThisBuild / scalaVersion := "2.12.13"

lazy val root = (project in file("."))
  .settings(
    name := "fp32mul"
  )

scalacOptions ++= Seq(
  "-deprecation",
  "-feature",
  "-unchecked",
  // "-Xfatal-warnings",
  "-language:reflectiveCalls",
)

val chiselVersion = "3.5.+"
addCompilerPlugin("edu.berkeley.cs" %% "chisel3-plugin" % chiselVersion cross CrossVersion.full)
libraryDependencies += "edu.berkeley.cs" %% "chisel3" % chiselVersion
libraryDependencies += "edu.berkeley.cs" %% "chiseltest" % "0.5.+"
//libraryDependencies += "edu.berkeley.cs" %% "dsptools" % "1.4.+"
//libraryDependencies += "edu.berkeley.cs" %% "rocket-dsptools" % "1.2.0"