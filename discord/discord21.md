[link 2021 jan 16](https://discordapp.com/channels/601130461678272522/614593951969574961/800040500827914280)

Hey just wanted to double check - there's no current means to temporarily update an environment right? I was thinking of a way to assign something much like export PATH=blah
I was checking the docs, but I think they're out of date as of the most recent release of Nu(things like aliasing is different in comparison to the docs)
jturnerToday at 8:39 AM
@koalazub you can use let-env PATH = blah
starting with 0.25 and later
koalazubToday at 8:39 AM
oh! Great thanks!
jturnerToday at 8:39 AM
working on a docs update this weekend :slight_smile:
koalazubToday at 8:40 AM
Don't party too hard now!
koalazubToday at 8:52 AM
I tried giving that method a crack and it wouldn't read it. Would this be the correct syntax? let-env PATH="$HOME/.symfony/bin:$PATH"  or is it that you can't map as yet?
jturnerToday at 8:54 AM
@koalazub a couple things:

* you'll need to create the string you'll want to use. We don't interpolate variables in strings currently (we may in the future)
* you'll need spaces around =. Whitespace is significant in nu
you could do something like:
also, if you want to update the PATH, we use a different way in Nushell, as the path is structured data:
hmmm
you know, I think you just found a gap with our let-env
you can't temporarily update the path very easily
koalazubToday at 8:56 AM
I'll keep that in mind. Thanks for pointing that out
koalazubToday at 8:57 AM
oh that's interesting. I'm still very fresh with all the shell things. Glad I helped spot something somehow
jturnerToday at 8:57 AM
you can see the currently path doing echo $nu.path
and you'll get a list of the different directories that are in the path (rather than a string like other shells)
there's a way to update this permanently, but seems we need to add support for updating it temporarily
koalazubToday at 9:00 AM
Yeah gotcha. And that part where you said that I'll need to create a string, what'd you mean when you said that?
I thought quoting in double quotes was passing a string literal, is that right?
jturnerToday at 9:01 AM
yeah, the double quotes passes a string literal. The "interpolation" part is replacing the uses of a variable inside that string with the values, which we don't currently support
koalazubToday at 9:02 AM
Ok I get what you mean now
jturnerToday at 9:02 AM
instead, we tend to use either the format command, or str collect.  Something like this:
echo "my" "first" "string" | str collect
would make one string by collecting together the strings passed to it
if you wanted to use variables:
echo $myvar "=" $myvalue | str collect
so it uses a very similar pattern
koalazubToday at 9:06 AM
Really appreciate the clarification on this and thanks so much for spending the time to do so
jturnerToday at 9:20 AM
no worries, happy to help
