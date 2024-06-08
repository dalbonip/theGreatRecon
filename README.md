# theGreatRecon
Note that the script isn't 100% automated. it gets you to type some Y or N in it.

if you want to step out of the computer while it runs, you can add your user to sudoers without password.
(since this is not a good security advise, i won't tell you how to apply (%sudo	ALL=(ALL:ALL) NOPASSWD: ALL) in this README file.)

======

theGreatSetup.sh is the Script for installing and configuring my daily recon tools.

### Debian Based only.

#### Kali linux VPS recommended due to high network traffic used by AMASS
then debian.
if not, other debian based distros. please.

====

the ensure instalation of Go, Ruby, Rust, Python. everything installed on:
    -   /opt
    -   /usr/local/bin
    -   ./local/bin


and install all tools necessary for running properly:

    -   nahamsec's lazyrecon script
    -   ofjaaah's recons script
    -   almost all of Kingofbugbounty tips oneliners

====

Please remember to:

    -   change YOURAPIKEY from GitHub on ofjaaaaah.sh at github-search
    -   set up your AWS config file on ~/.aws
    -   Finally, initialize the Shodan CLI with your API key: $ shodan init YOUR_API_KEY

    -   get me on instagram or twitter @dalbonip

:)
