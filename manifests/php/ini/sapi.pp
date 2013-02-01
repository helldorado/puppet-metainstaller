class metainstaller::php::ini::sapi($sapi) {

  include metainstaller::php::install

  case $::sapi {
      'cli': {
         metainstaller::php::sapi {
            'PHP/short_open_tag':       value => 'Off';
            'PHP/asp_tags':             value => 'Off';
            'PHP/expose_php':           value => 'Off';
            'PHP/memory_limit':         value => '1G';
            'PHP/display_errors':       value => 'Off';
            'PHP/log_errors':           value => 'On';
            'PHP/post_max_size':        value => '500M';
            'PHP/upload_max_filesize':  value => '500M';
            'PHP/max_execution_time':   value => 600;
            'PHP/allow_url_include':    value => 'Off';
            'PHP/error_log':            value => 'syslog';
            'PHP/output_buffering':     value => 4096;
            'PHP/output_handler':       value => 'Off';
            'Date/date.timezone':       value => 'UTC';
          }
      }
      'apache': {
          metainstaller::php::sapi {
            'PHP/short_open_tag':       value => 'Off';
            'PHP/asp_tags':             value => 'Off';
            'PHP/expose_php':           value => 'Off';
            'PHP/memory_limit':         value => '1G';
            'PHP/display_errors':       value => 'Off';
            'PHP/log_errors':           value => 'On';
            'PHP/post_max_size':        value => '500M';
            'PHP/upload_max_filesize':  value => '500M';
            'PHP/max_execution_time':   value => 600;
            'PHP/allow_url_include':    value => 'Off';
            'PHP/error_log':            value => 'syslog';
            'PHP/output_buffering':     value => 4096;
            'PHP/output_handler':       value => 'Off';
            'Date/date.timezone':       value => 'UTC';
          }
      }
      'fpm': {
          metainstaller::php::sapi {
            'PHP/short_open_tag':       value => 'Off';
            'PHP/asp_tags':             value => 'Off';
            'PHP/expose_php':           value => 'Off';
            'PHP/memory_limit':         value => '1G';
            'PHP/display_errors':       value => 'Off';
            'PHP/log_errors':           value => 'On';
            'PHP/post_max_size':        value => '500M';
            'PHP/upload_max_filesize':  value => '500M';
            'PHP/max_execution_time':   value => 600;
            'PHP/allow_url_include':    value => 'Off';
            'PHP/error_log':            value => 'syslog';
            'PHP/output_buffering':     value => 4096;
            'PHP/output_handler':       value => 'Off';
            'Date/date.timezone':       value => 'UTC';
          }
      }
    }
}
