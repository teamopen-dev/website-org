---
title: Project Lifeguard open for ideas
date: 2019-09-16T14:39:57+02:00
featured_image: /images/no-lifeguard-on-duty-antonia-felipe.jpg
description: Giving drowning maintainers an escape.
author: Robin van Boven ([@Beanow](https://github.com/beanow))
---

<sub>*Photo by [Antônia Felipe](https://unsplash.com/@a_mfelipe).*</sub>

You may have
[heard](https://nolanlawson.com/2017/03/05/what-it-feels-like-to-be-an-open-source-maintainer/),
[this](https://www.youtube.com/watch?v=0t85TyH-h04),
[before](https://github.com/notify-rs/notify/issues/209).
Many maintainers working on OSS people depend upon are under
a lot of stress, responding to people's wants and needs, while doing
their best not to set the world on fire with breaking changes or security
vulnerabilities.

![Your packages depend on mine. All of them.](/images/all-your-upstream.png)

It's impressive how much great software is built this way,
but in the same breath, people have been pushing on to the
point where having **one or two episodes of burnout became normal**.

But what options are there for maintainers?
They may have realized it's causing them grief, but
posting an abandonment notice and hoping for the best&hellip;?
That seems like a last resort and something you could
feel quite guilty about doing.

## Project Lifeguard

What I feel is missing here, is a responsible way to leave your
maintainer position. **Giving _drowning maintainers_ an escape.**

![Life buoy](/images/life-buoy-jametlene-reskp.jpg)
<sub>*Photo by [Jametlene Reskp](https://unsplash.com/@reskp).*</sub>

The working idea I have now, is to be a group you can hand off
maintenance to which will offer:

1. Emergency bug and security fixes, by developers we find and pay?
1. A standard message asking for new maintainers and sponsors.
1. A long-term plan, to deprecate and archive if needed.

For sponsorships, in particular I think it would be good to look for businesses
that are using the software and derive value from it.

The standard message, could be used to _make risk a lot clearer_
for people using the software. Similar to an `npm audit`.
Or the sustainability information [proposed here](https://writing.kemitchell.com/2019/04/12/package-json-sustainability.html).
I'm imagining an output such as:

```
$ npm install
...
4 packages have been abandoned.
12 packages are receiving emergency maintenance.
Learn what you can do: https://lifeguard.teamopen.dev
Show the package list with: npx lifeguard
```

### Just an idea

For now this is an idea. If you're interested in helping,
[get in touch](/community) and share your thoughts.
