ScaffR (Alpha)
======

ScaffR is a code automation and scaffolding framework, built in powershell, that gives you more flexibility to deliver richer NuGet packages.

Philosophy
-----
ScaffR was designed to reduce the amount of boilerplate code that developers have to produce.  When you use ScaffR, you compose your application powershell,
deliver it with NuGet.  You don't need to store the generated files in source control, just the instructions of how the application is constructed.
 
Does this work?  Yes.

Technology
-----
ScaffR takes full advantage of the following technologies:

+ NuGet
+ Powershell
+ T4Scaffolding
+ Visual Studio DTE

Usage
-----
You can use either the low-level ScaffR libraries, or the high level libraries, depending on how you wish to use ScaffR.

Core Package
-----
To use the low-level libraries, you just need to install the core package

<pre>install-package ScaffR.Core</pre>

High-Level Package
-----
The high-level package uses the low-level packages and builds more complicated architectural patterns.

<pre>install-package ScaffR</pre>