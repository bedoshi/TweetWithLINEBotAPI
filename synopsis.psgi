# in the synopsis.psgi
use strict;
use warnings;
use LINE::Bot::API;
use LINE::Bot::API::Builder::SendMessage;
use Plack::Request;

my $channel_secret         = $ENV{CHANNEL_SECRET};
my $channel_access_token   = $ENV{CHANNEL_ACCESS_TOKEN};

# the following is Twitter API key.
my $consumer_key           = $ENV{CONSUMER_KEY};
my $consumer_secret        = $ENV{CONSUMER_SECRET};
my $access_token_key       = $ENV{ACCESS_TOKEN_KEY};
my $access_token_secret    = $ENV{ACCESS_TOKEN_SECRET};

my $nt = Net::Twitter->new(legacy => 0);
my $nt = Net::Twitter->new(
    traits   => [qw/API::RESTv1_1/],
    consumer_key        => $consumer_key,
    consumer_secret     => $consumer_secret,
    access_token        => $access_token_key,
    access_token_secret => $access_token_secret,
);

my $bot = LINE::Bot::API->new(
    channel_secret       => $channel_secret,
    channel_access_token => $channel_access_token,
);
 
sub {
    my $req = Plack::Request->new(shift);
 
    unless ($req->method eq 'POST' && $req->path eq '/callback') {
        return [200, [], ['Not Found']];
    }
 
    unless ($bot->validate_signature($req->content, $req->header('X-Line-Signature'))) {
        return [200, [], ['failed to validate signature']];
    }
 
    my $events = $bot->parse_events_from_json($req->content);
    for my $event (@{ $events }) {
        next unless $event->is_message_event && $event->is_text_message;
 
        my $messages = LINE::Bot::API::Builder::SendMessage->new;
        
        my $result = $nt->update($event->text);

        $messages->add_text( text => $event->text );
        $bot->reply_message($event->reply_token, $messages->build);
    }
 
    return [200, [], ["OK"]];
};