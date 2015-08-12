#!/bin/bash -ex

rpm -Uvh http://yum.newrelic.com/pub/newrelic/el5/x86_64/newrelic-repo-5-3.noarch.rpm || true
yum install -y newrelic-php5 newrelic-sysmond || true

export NR_INSTALL_SILENT=true
export NR_INSTALL_KEY=4325ccc1fd3927fd680e82b7b5191d5a4f186875
newrelic-install install
nrsysmond-config --set license_key=4325ccc1fd3927fd680e82b7b5191d5a4f186875
/sbin/chkconfig newrelic-sysmond on
/etc/init.d/newrelic-sysmond start
