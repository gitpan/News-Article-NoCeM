# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl test.pl'

######################### We start with some black magic to print on failure.

# Change 1..1 below to 1..last_test_to_print .
# (It may become useful if the test is moved to ./t subdirectory.)

BEGIN { $| = 1; print "1..1\n"; }
END {print "not ok 1\n" unless $loaded;}
use News::Article::NoCeM;

$loaded = 1;
print "ok 1\n";

# the spam article
my $article = new News::Article::NoCeM;

# the nocem notice
my $nocem = new News::Article::NoCeM;

$article->set_headers('Newsgroups', 'the.spammed.group');
$article->set_headers('From', 'Spam <spammer@spamhost.com>');
$article->set_headers('Subject', 'This is a spam');
$article->add_date();
$article->add_message_id();

$nocem->hide('spam', $article);

$nocem->make_notice('spam', 'SpamKiller', 'the.nocem.group', 'nocem-issuer@email.address', 'This is a notice');

# If you want to test it, please make sure your PGP key is ready.
#$nocem->sign('YourKeyId', 'YourPassPhrase');

# If you want to see the content of nocem notice, you'll need this.
#use Data::Dumper;
#print Dumper(\$nocem);

######################### End of black magic.

# Insert your test code below (better if it prints "ok 13"
# (correspondingly "not ok 13") depending on the success of chunk 13
# of the test code):

