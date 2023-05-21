#!/usr/bin/env perl

use strict;
use warnings;

use Test::More;
use Blockchain::Ethereum::Transaction::Legacy;

subtest "eip-155 example" => sub {
    my $transaction = Blockchain::Ethereum::Transaction::Legacy->new(
        nonce     => '0x9',
        gas_price => '0x4A817C800',
        gas_limit => '0x5208',
        to        => '0x3535353535353535353535353535353535353535',
        value     => '0xDE0B6B3A7640000',
        data      => '0x',
        chain_id  => '0x1'
    );

    my $raw_transaction = $transaction->sign('4646464646464646464646464646464646464646464646464646464646464646');

    is($raw_transaction,
        'f86c098504a817c800825208943535353535353535353535353535353535353535880de0b6b3a76400008025a028ef61340bd939bc2195fe537567866003e1a15d3c71ff63e1590620aa636276a067cbe9d8997f761aecb703304b3800ccf555c9f3dc64214b297fb1966a3b6d83'
    );
};

done_testing;
