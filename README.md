# Formy Automation Tests Portifolio
**Formy** is a demo web application that contains multiple different types of common web attibutes that help when you need to practice or showcase specific situations involving autonomously interacting with web applications.

## Objective
I chose this application to start my portifolio. Not only for its simplicity, but also to show that even the smaller of the applications can be tested for something. I also believe that it is a good way to show understanding of the basics, and practical application of the good practices.

As I learned from all my coding/testing experience:
> A strong foundation in the basics is essential to build robust and scalable solutions.

## Focus
The part of this application that I chose was the **Complete Web Form Page**, which contains all the basic attributes a web form might have, like:
* Text Fields;
* Drop Down Menus;
* Date / Calendar FIeld;
* Radio Buttons;
* Checkboxes

This way I could show at least one way to interact with each one on those.

### Tools
I've used the **Robot Framework** with the **Python** language, and the **Selenium Library** for this project.
The test were ran from a **Jenkins** server running locally, calling the execution on the **Pabot Library** to run the tests in parallel in three different browsers.


### Approach
The application contains a lot of basic design an programmatic issues that are good practices when building web forms, like (but not limited to):
* Not having mandatory fields;
* Radio Buttons not making part of the same group;

In my automation, I approach some of those design issues as they were intentional flaws, and thus, didn't made verifications for design flaws, testing if the application was working the way it was designed. This assumption was based in the fact that I didn't have a Requirements Documentation for it, so my focus was in displaying my knowledge in working with Page Objects oriented pattern and the way I write my scripts.

## Good Practices
I've chose as the design pattern for this project the **Page Object Oriented Pattern** as I believe to be one of the most organized and easy to maintain designs for this kind of job, since "real-world" applications usually have a huge amount of systems integrated to it, and keeping things separated this way helps when adapting the tests for new features or design changes in future application's builds.

---

## Final Considerations
I plan to add more complex stuff in my automations portfolio, with a bigger application to explore more E2E tests and different systems integrations, but I believe that for the first one I could apply many core concepts that gives an overview of what I'm capable of. Also, I'd really appreciate every tip/constructive critisism that anyone can give me on how to improve this.