# Recursive Partial Calling with Caching / self calling partials / deep nesting
# Introduction
This project is to show case a problem in dealing with recursive partial calling while using caching.
Say, you need to display comments and their replies upto unknown nesting level, and both have same display structure, Author and Content
You may call the `comments.rabl` within `comments.rabl`
This will work perfect in normal case.
What when you decide to implement caching along with this partial?

- The cache_key is generated along with digests for all the templates and dependent partials
- Since, I had called the same partial recursively in my current project, the dependencies lead to a stack overflow. As `comments.rabl` would have its dependency `comments.rabl` and repeat.
- Tried to find out and traced down to `action_view` and then `Rabl::Tracker` which was responsible for figuring out dependencies for any template/partial.
- So seeing to the strategy it was using - Regex matching, I used a different style to write the code. You can see it under `app/veiws/posts/comment.rabl` and it was **working smooth and good**.

> Project went fine and fun. Now was the time to contribute to the community

# Funny Story

- I created this project to replicate the bug and try my fix in the gem
- Installed the latest gems
- but **Bang**, could not replicate. It was fixed in the **latest rabl**
- So basically, I experienced the bug in `rabl 0.9.4.pre1` and older versions.


Note: Do enable caching in which ever env you are working to replicate the bug.
