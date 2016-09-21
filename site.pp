node default {

    include '::mysql::server'

    mysql_database { 'test_mdb':
        ensure  => 'present',
        charset => 'utf8',
        collate => 'utf8_swedish_ci',
    }

    mysql_user { 'test_user@127.0.0.1':
        ensure                   => 'present',
        max_connections_per_hour => '0',
        max_queries_per_hour     => '0',
        max_updates_per_hour     => '0',
        max_user_connections     => '0',
    }  

    mysql_grant { 'test_user@localhost/test_mdb.*':
        ensure     => 'present',
        options    => ['GRANT'],
        privileges => ['ALL'],
        table      => 'test_mdb.*',
        user       => 'test_user@localhost',
    }
}
