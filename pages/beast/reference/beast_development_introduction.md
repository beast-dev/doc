---
title: A less-than-brief, non-comprehensive, introduction to BEAST development
keywords: beast, tutorial
last_updated: August 8, 2023
author: Andy Magee
tags: [reference, article]
summary: 
sidebar: 
permalink: beast_development_introduction.html
toc: false
folder: beast
---

BEAST is scientific software for statistical analyses.
This means there are many things you will eventually need to know.
And this cannot be stressed enough, you don't need to know all this right now!

The purpose of this document is to provide the reader a foothold into the many pieces that one needs to know to work with BEAST at a developer level.
It is not a comprehensive introduction to many of those topics, which require treatises in their own right.
But hopefully it will help the reader figure out what to google, or where to look in the code base, to resolve errors.

## Don't panic
No one who has contributed to BEAST started out being good at it or knowing how to do all of it.
BEAST is _established_ software, it's been used for phylogenetic analyses since the early 2000s.
You're standing on many shoulders, which is at times really great (and at times really frustrating).
You're also working on a _massive_ code base.
Don't expect to know how everything works, though it's good for your character to at least have a general idea of how phylogenetic models work.

## IntelliJ has your back
Don't write BEAST java code without [IntelliJ](https://www.jetbrains.com/idea/).
Just don't.
It will make your life much, much easier, and is worth every minute that it took to get acquainted with.

<!-- TODO: a longer, better piece about using IntelliJ for BEAST development that expands on this stub -->
Setting up IntelliJ to work with BEAST may take a bit of time (all worth it!).
What follows are some basic tips to help with that.
- You will need to tell IntelliJ how to [build BEAST with ant](https://www.jetbrains.com/help/idea/adding-build-file-to-project.html) in order to incorporate your changes into a working version of BEAST that you can run.
- You can run BEAST through IntelliJ passively or in debug mode. Either way, you need to set up a Run/Debug configuration. 
  - In "Add New Configuration" select "Application". 
  - The main class (as requested by the space in the configuration) is `dr.app.beast.BeastMain`.
  - Things that would go in the command line after you call BEAST, like the path to the XML, whether to overwrite, and such, go in the `Program arguments` space.
  - You will want to make sure BEAGLE is accessible. One way this can be done is by choosing `Add VM Options` and in that space specifying `-Djava.library.path=/usr/local/lib` (or wherever you've installed BEAGLE to, if you don't have root access).
- For debugging purposes you will probably want to actually get into the code while it's bring run with [breakpoints](https://www.jetbrains.com/help/idea/starting-the-debugger-session.html). This should work if you've appropriately set up a Run/Debug configuration as above. Then you can put breaks in any line where you want to halt execution and run in debug mode. Note that execution stops _before_ the line with the break (so you can put one on a return statement line), and that the line has to _do something_ (`int someInt;` won't work, `int someInt = 0;` will).

## Make sure you work on the right branch
<!-- TODO: consider a bigger, better intro to git -->
Working with BEAST, like with any large software project, means working with version control.
For BEAST, that means [git](https://en.wikipedia.org/wiki/Git) via [GitHub](https://github.com/).
BEAST lives [here](https://github.com/beast-dev/beast-mcmc/), owned by the [beast-dev](https://github.com/beast-dev/) group.

An introduction to git is out of the scope of this overview.
But do be sure to get access priveleges to BEAST (become part of beast-dev), and be sure to work on the right branch.
Branches are how big projects can work on multiple things simultaneously, and keep more stable versions of a code base side by side with actively-developed versions.
- As a general rule, do not work on the master branch. This is for a more stable, less prone to breaking version of BEAST. Touch this _after_ you know what you're doing.
- You may want to make a new branch to work on a particular feature. Choose the branch to make this new branch from carefully. If you want access to other recent work, it's best to make it from the branch where that is happening. If you want it to merge into master easily and soon, make it from master.
- Much ongoing work on HMC sampling is being done on the hmc-clock branch.

## XML, java, and object-oriented programming
If you're going to actively develop BEAST, you will eventually need to work with two different languages.

The core of BEAST is written in java, which is an object-oriented programming (OOP) language.
Much of the computational burden of BEAST is outsourced to BEAGLE, which is written in C++ (another OOP language).
Neither of these may be quite as cool as they once were, but that's not to say learning either of them is a waste.
Computer language skills are like real language skills, when you learn more, you start to have an easier time picking new ones up.
Which is to say that learning java can help you learn other (possibly more marketable) languages, like python (which is also an OOP language).

BEAST analyses are specified via XML files.
The typical person using BEAST will generate their XML entirely in BEAUti, much as described in the [tutorials on the BEAST website](https://beast.community/first_tutorial).
Then BEAST will instantiate java objects from that XML and use it to run an analysis.
For such users, the XML file can be more or less an afterthought.
But BEAST is an iceberg. 
Much of its functionality lives below the surface accessible via BEAUti, and certainly all the new work you do will begin this way as well.
That means you should get comfortable manually editing XML files.
A good learning experience to get started on that is to generate XMLs using BEAUti and then look into the XMLs to see how your data and settings are encoded.

One thing that both java and XMLs have is that they are all about _objects_.
Object-oriented programming takes some getting used to, but this means that some lessons from XML-writing port to writing java code, and vice-versa.

## Writing XMLs

Let's get this out of the way first: XML is not really supposed to be human-readable or human-edited.
But, it's what we've got.

There are some tutorials that explain how to create custom models in XMLs, like [this one](https://beast.community/custom_substitution_models) and [this one](https://beast.community/markov_modulated) and many of the Advanced Tutorials.
Tutorials like this can be helpful for getting a general sense of what's going on and how to work with XML, or at least build a bit of intuition that will come in handy when you start running into issues.
But there are a few things worth considering specifically, which are largely linked to the object-centered nature of an XML.

Note that there's a reference of the sorts of things you can put in an XML block [here](https://beast.community/xml_reference).

### General tips
The following are some general-purpose tips that will serve you well from the moment you see your first XML all the way through your ten thousandth.

- **Use a good text editor.**
Writing XMLs without a good text editor is far more painful than it needs to be.
You'll be greatly assisted by things like a search/replace tool with good regex (regular expression) functionality, syntax highlighting, auto-closing of XML tags, and more.
You can use IntelliJ for this, or many other editors (for example the perpetually-popular BBEdit and VScode).
Don't use things like TextEdit, or Notepad+.
Just don't.
- **Don't start from scratch.**
Very few BEAST XML files get made from scratch.
Most start from pre-existing raw material, and many of those started as a BEAUti-generated XML.
BEAUti may not have everything you want in an analysis, but it can give you a functional starting point, and it is always good to start from a file that works.
- **Recycle (steal) XML blocks.**
If you don't know how to format an XML block for something, find an XML file that has that block.
Copy it over, and modify it until it works for you.
This is significantly faster and easier than trying to figure out how to format it based purely on reading through the parser's code.

### Key attributes of an XML object
All XML objects open and close with start and end tags, hence the error you may well encounter at some point: `The element type "someThing" must be terminated by the matching end-tag "</someThing>".`
That often looks like this,

    <someThing>
        code goes here
    </someThing>
But for some things that can be declared in one-liners, that looks like,

    <someThing thing="someValue" option="whatever"/>
where the last `/>` is the end-tag.

Many things can go inside these XML blocks, exactly what depends entirely on the class.
If you want to know what a class should have, you can always check the rules in its parser (an easy way to search for that in IntelliJ is to search for `"someThing"`, quotes and all, which should take you to the parser that defines its name on that basis).

There are two things to be careful about that have burned many a person and cost many hours of time.

#### Parsers only throw errors about things that you _don't_ specify.
You could throw just about anything into a `treeDataLikelihood` object and BEAST won't care.
A totally unrelated likelihood?
Sure.
An MCMC block?
Okay.
It will simply, and quietly, ignore anything it doesn't know how to use.
So, always check your spelling for arguments and make sure that the parser actually does something with whatever it is you're trying to feed in.

#### An unparsed object throws no (straightforward) errors
This is largely a corollary to the above point.
XML objects get parsed by parsers.
Parsers get loaded by being included in the appropriate files (`development_parsers.properties` being the one for development work, more stable things go elsewhere).
If a parser is not loaded, it is not called on the XML object it _would_ parse.
That object is then not parsed.
No error is thrown saying "hey I don't know what to do about this XML block."
Instead, if you're lucky, you'll get warnings caused by the non-existence the object you _thought_ you had created.

So when making new parsers for new classes (as discussed more below), be very careful to get that parser into a `development_parsers.properties`.

### Key attributes of a BEAST XML
A BEAST XML is a definition of a statistical model.
We are defining the _parameters_ of the model and how they go together.
We must define the prior and the likelihood and the joint (posterior) target distribution.
We must also specify how parameters are to be sampled in MCMC (via the `<operators>` block).
There are varying consequences for failing to specify all these things which are potentially disastrous if un-caught.
By way of example:
- A parameter can go unsampled if an operator on it is never specified.
- The wrong joint posterior distribution may be targeted if a parameter's prior is not included in the `<prior>` block or its effect on the likelihood is not accounted for in the `<likelihood>` block.

The resulting posterior will be incorrect and possibly improper.
Those are bad, so be careful!

The classic (somewhat weirdly-ordered) workflow of a BEAST XML is more or less:

1. Define a parameter at its first use.
2. Put an operator on it in the `<operators>` block.
3. In the `<MCMC>` block, put a prior on it in the `<priors>` (sub)block.
4. Put it in some log file in a `<log>` or `<logTree>` (sub)block (of the `<MCMC>` block).

### There will be bugs
XML editing is bound to result in errors.
Just like for any other coding job, you will find yourself spending time fixing these bugs.
(As well as time putting them in unintentionally, of course.)
BEAST does try to help you out with this.
BEAST will write error messages and those can refer to lines or specific XML objects where problems were encountered.
Heed those warnings, and start your debugging search there.

When you're writing your own code for BEAST, you can also gain information from the error messages.
BEAST can tell you what line in what java class ended up provoking a fatal error, and the call stack that led there.
This is very helpful.
And even when writing your own classes, XML bugs remain a leading source of issues when things go wrong.
Never take your XML for granted.

## Designing and writing BEAST code
Because of the java-XML dichotomy, to get something made in BEAST that is usable, you will generally need to write both a class (to do what you want) and a parser.

### Parsers
A parser in BEAST is a function that parses a specific kind of XML object, like a `<treeDataLikelihood>` or a `<newick>`.
When designing a parser, important questions to consider include:
- What, if any, fixed options will a user need to specify or set?
- More importantly, what other parts of a BEAST model will it need access to?

The Marc Suchard School of BEAST Development says that you should always start by thinking about what you want your parser to look like.
There are some very good arguments in favor:
- You won't get very far writing anything if your hypothetical user (who is you in a few hours or weeks) can't specify a way to access the code you're going to write.
- This is one less thing to debug later, helping separate out the many layers where issues can otherwise occur.
- If you have a working parser, you can start using an example XML and get inside the code with IntelliJ to trace and squash bugs earlier.

On the other hand, knowing what you need to pass in requires knowing a lot about what you can pass in and how things work. You may not know what is accessible for your needs.
Until you're sure what works best for you, it may be a good idea to not let either the parser or the actual class at hand get too far ahead of the other.
Minimally, don't assume you're done with developing your parser just because it can take in all the objects you think it needs.
The same applies the other way: don't assume your java class is done just because IntelliJ isn't throwing any more errors.
You may go through a few rounds of developing both of these before you know exactly what you need in them.

### Classes
To actually do something new in BEAST, you'll probably be writing a java class.
Eventually you might need Interfaces, which are entirely abstract classes that can't be used, but define a lot about how a class works.
A java class defines an object that will be made at some point when BEAST is called on the XML.
That object can be just about anything and do just about anything, BEAST has classes for parameters, trees, parameter transformations, multiple sequence alignments, the classical phylogenetic likelihood, HMC operators, and much, much more.

Classes are so general that the advice here is going to have to be pretty general.
The basic structure of a class is that it gets defined, then you define a constructor that sets up a new object, and then you write any code you need so the object can do what it needs to do.
IntelliJ is your friend because it is good at knowing what sorts of functions your class will need.

The `extends` and `implements` keywords are ways to relate your class to other classes.
A class can `extend` another existing regular class, while it can only `implement` an abstract class.
Both of these are useful tools for outsourcing a lot of work to stuff others have written.
In cases like this, you may start to see `super` get tossed around, which is a way to tell java to let this class's superclass (parent class) handle something.
Often in BEAST you'll see this for constructors.

Classes can (and will usually) have member objects.
Member objects can be important parts of a class, like the many things that go into a tree model.
Or they can be convenient ways to offload actually doing work into something else.
This is why many classes have some form of likelihood object as a member, it's much easier (and saves a lot of duplicated code) to say "hey likelihood, what are you now?" than to write out the likelihood again.

#### Case study: HKY
As a brief case study, let's take a very fast look at `HKY.java` (specifically the version on the `hmc-clock` branch).
This `extends` the class `BaseSubstitutionModel` while it `implements` several classes, `Citable`, `ParameterReplaceableSubstitutionModel`, and `DifferentiableSubstitutionModel`.
Thankfully, most of these do what they're named.
One thing we might ask ourselves is whether we really need to know what all of these are.
The answer in many cases will be no, which is quite convenient.

The class has only one member variable, kappa.
This seems suspicious, where are the stationary frequencies?
Let's check the constructor.
"Which constructor?" you might ask, as there are two.
That's easy enough to see here, though.
The first takes in kappa as a double (a fixed value), makes a parameter out of it, and calls the other one.
So the second one is the "real" constructor, and it takes in a kappa parameter and a frequency model.
The real constructor then calls the super class's constructor.
If we glance at `BaseSubstitutionModel`, we see that _it_ holds onto the stationary frequencies (the `frequencyModel`).
Mystery solved!

Most of the rest of the class does 4 things:

1. Handles the basics of HKY. Computes things about rate matrices, makes sure things get updated when kappa changes, and allows tracking the transition-transversion rate ratio if you really want to.
2. Tells BEAST how to cite the model, living up to its promise that it `implements Citable`.
3. A function called `public HKY factory(List<Parameter> oldParameters, List<Parameter> newParameters)` which, if you poke into it, will turn out to be living up to its promise that it `implements ParameterReplaceableSubstitutionModel`. That is a class that can be used to have branch-specific model parameters.
4. A lot of functions involved in gradient computation, which only matter when you need to know about that.

There is also a `public static void main(String[] args)` function that serves as a test.

And this class also highlights the existence of `enum`, which is sort of a low-level class that you can declare and use inside a class to handle different cases for something without writing tons of if/else statements.

### Beware the model graph
BEAST assembles the components of the statistical model from the XML into a graph.
This allows various parts of the model to know when something has changed, so they know if something should be recomputed.
For example, if you change the stationary frequencies of a GTR model, you expect that BEAST will know that:

- The prior density has changed.
- A rate matrix has changed, which means the phylogenetic likelihood needs to be recomputed, which means the likelihood has changed.

There are a number of components of BEAST classes that have to do with this.
These exist in things that are `Model`s or `Parameter`s and classes that `implement` things like `ModelListener` and `VariableListener`.
Through the ~~magic~~dark voodoo of good software design, you will often be able to do things without going anywhere near any of this.
But sometimes you'll get a dreaded error, like a likelihood not being the same after a move is rejected, and you'll have to pay attention.
The following is a non-exhaustive list of functions to pay attention to.
They may be implemented wrong, unimplemented, or unimportant:

- `fireModelChanged`
- `handleModelChangedEvent`
- `fireVariableChanged`
- `handleVariableChangedEvent`
- `storeState`
- `restoreState`
- `acceptState`

If you're reading this because you need it, good luck and godspeed.

### Write tests!
When you write something new, you should think really strongly about writing a test to make sure it works.
Maybe a few tests.
It doesn't matter how braindead simple you think your code is.
Tests are awesome, and tests are your friend.

At its most basic level, a test executes code and checks the value against a hard-coded (prespecified) value.
Then it either passes and says everything worked, or complains if the values are different (or too different, sometimes you need to allow for some variation).
But tests can serve a number of purposes when you're developing new code.
- They are debugging tools, to help you find and squash issues. You can write aspirational tests to make sure the code will handle everything you want it to.
- A test file can serve as a repository of edge-cases, since edge cases often provoke heretofore unseen issues. When something new and weird happens, add it to the pile.
- Tests prevent future muck-ups. If someone (possibly you in a few weeks or years) alters code and that in turn changes how your code executes, your test will complain about that. This will alert the author of the changes that those changes are having unexpected consequences elsewhere, so they need to make some tweaks.
- Tests keep _you_ safe from the worry of messing up existing functionality. (This is just the last point seen from the perspective of the person making changes.) If you're going to make changes to code, and it isn't being tested, add tests to check that you don't break any existing functionality.


In BEAST, we have two kinds of tests, XML tests and java tests.

#### Tests in XML
XML tests live in `beast-mcmc/ci/`, mostly in `beast-mcmc/ci/TestXML/` (some that need to load information live in `beast-mcmc/ci/TestXMLwithLoadState/`).
These tests are all, as you might expect, written as XMLs.
You set up XML objects, then you check that they produce the expected result.
This can test many things, from simple distributions, to complicated likelihoods, to MCMC (the latter can be done without loading with judicious usage of `fireParameterChanged` XML blocks).
These are the easiest place to make tests, and they have the additional benefit of making sure things get parsed acceptably too.

Many these tests hinge on the `<report>` XML block, which calls the `getReport()` method of a class that `implements Reportable`.
Reports are a great way for you to see what a class you're writing is doing, and can do and print basically anything to screen that you might want.
When you want to use a report to check against a prespecified value, you can use regex to parse the report and extract what you want.
This will all make more sense when you look at examples and try to start making it work.

You can run any of these tests by calling BEAST on the XML.

Note that "ci" stands for Continuous Integration because these tests are run as part of [GitHub's continuous integration](https://docs.github.com/en/actions/automating-builds-and-tests/about-continuous-integration).
The upshot is that whenever anything is pushed to the BEAST repository on GitHub, the tests are run (this is specified [here](https://github.com/beast-dev/beast-mcmc/blob/master/.github/workflows/ci.yml)).
This means that if you break something you'll find out pretty quickly.
That's good!
As bad as an "oops you broke BEAST" message feels, it's much better to know now than after that has caused analyses to be wrong.

#### Tests in java
Sometimes, you can't quite fit what you want or need to test into an XML.
This can happen when you're working with code that lives deeper in the code base.
But even some things that you use in XMLs are hard to test that way (a `transform` block doesn't know what variables go in it, making it hard to test directly in XML).
In these cases, you may need the more powerful and flexible internal unit testing done entirely in java.
These tests live in `beast-mcmc/src/test.dr/` and work by creating java objects directly, then checking that functions operating on those objects produce the expected results.

You can run these unit tests directly in IntelliJ, which will tell you which (if any) of the tests in a unit test file pass and fail.

These tests are executed when BEAST is built by ant (as noted in `beast-mcmc/build.xml`).
So if your changes to some code break something else that has a unit test, you'll know as soon as you try to compile the code to run it.

Note that the file structure of where these tests live mimics `beast-mcmc/src/dr`.

### A brief overview of some guiding principles
There are many tips for good software design, here are a few.

#### Don't reinvent the wheel!
BEAST is old enough that many things you might want to do have been done.
Before going out and writing something from scratch, see if it exists first!

#### Recycle, don't rewrite
Many times you will find what you want to do is a small modification of something else.
You could add your code directly to the existing class.
But if you instead make a new class that `extends` the pre-existing class, you may have an easier time.
And you certainly won't have to worry about messing up the existing functionality of that class.

#### KISS
KISS is a great [band](https://nl.wikipedia.org/wiki/Kiss_(band)) but it also stands for [keep it simple, stupid](https://en.wikipedia.org/wiki/KISS_principle).
Don't make things more complex than they need to be.

#### Keep an eye on generality
Sometimes it's easier not to solve just the problem at hand but a general class of problems.
Sometimes you know you've got an extension coming down the line.
Sometimes you just want to future-proof your work.
For any and all of these reasons, it's good to do things generally when possible (but _done_ and working code is better than hypothetical code).

#### Test early and test often
Tests are a developer's best friend.
Write them.
Use them.
Love them.