use strict;
use warnings;
use utf8;
use Test2::V0;

use Client::Util;

my $target = 'Client::Util';

subtest '#is_valid_text' => sub {
    subtest 'within 140 is ok' => sub {
        my $alphabet_140 = 'ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJ';
        ok $target->is_valid_text($alphabet_140), 'alphabet 140 is as expected';
        my $hiragana_140 = 'ぁあぃいぅうぇえぉおかがきぎくぐけげこごさざしじすずせぜそぞただちぢっつづてでとどなにぬねのはばぱひびぴふぶぷへべぺほぼぽまみむめもゃやゅゆょよらりるれろゎわゐゑをんぁあぃいぅうぇえぉおかがきぎくぐけげこごさざしじすずせぜそぞただちぢっつづてでとどなにぬねのはばぱひびぴふぶぷへべ';
        ok $target->is_valid_text($hiragana_140), 'hiragana 140 is as expected';
    };

    subtest 'over 140 is ng' => sub {
        my $alphabet_141 = 'ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJK';
        ok !$target->is_valid_text($alphabet_141), 'alphabet 141 is as expected';
        my $hiragana_141 = 'ぁあぃいぅうぇえぉおかがきぎくぐけげこごさざしじすずせぜそぞただちぢっつづてでとどなにぬねのはばぱひびぴふぶぷへべぺほぼぽまみむめもゃやゅゆょよらりるれろゎわゐゑをんぁあぃいぅうぇえぉおかがきぎくぐけげこごさざしじすずせぜそぞただちぢっつづてでとどなにぬねのはばぱひびぴふぶぷへべぺ';
        ok !$target->is_valid_text($hiragana_141), 'hiragana 141 is as expected';
    };


};

done_testing;
