use lib '.';
use inc::Module::Install;

requires 'Data::Printer';

RTx     'RT-Extension-CSP';
license 'gpl_2';
repository 'https://github.com/bestpractical/rt-extension-csp';

requires_rt '4.4.0';
rt_too_new '5.2.0';

sign;
WriteAll;
