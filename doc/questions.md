## Questions and observations

- What are the possible project statuses?
    - Assuming 3 states:
        - On hold, In review, Completed
- Do comments need some sort of approval (moderation)?
    - Assuming no for simplicity
- Can all users change the project status?
    - Assuming yes for simplicity
- Can all users leave a comment?
    - Yes for simplicity
- Is a designer going to help with this feature?
    - No -> improvise
- Do we (currently or in the future) require a conversation history for entities other than project?
  - No

## TODO:
  - add proper form validations
  - implement all CRUD operations for comments
  - add a recaptcha
  - add the possibility to leave replies to comments
  - add user authentication and authorization (devise/cancancan)
