use strict;
use warnings;
package RT::Extension::CSP;

our $VERSION = '0.01';

=head1 NAME

RT-Extension-CSP - View Content Security Policy Reports

=head1 DESCRIPTION

This extension helps test with and view Content Security
Policy Reports for various CSP settings.

=head1 RT VERSION

Works with RT 5.0.6

=head1 INSTALLATION

=over

=item C<perl Makefile.PL>

=item C<make>

=item C<make install>

May need root permissions

=item Edit your F</opt/rt4/etc/RT_SiteConfig.pm>

Add this line:

    Plugin('RT::Extension::CSP');

=item Clear your mason cache

    rm -rf /opt/rt5/var/mason_data/obj

=item Restart your webserver

=back

=head1 CONFIGURATION

Use the following to set the CSP you want to test with.

=head2 C<$CSPReportURI>

By default, this is set to C</NoAuth/CSP-Report.html>, which is provided
with this extension. This endpoint will accept the POSTed CSP reports sent
by the browser and print them to your log at the debug level.

You can set a different value if you have a custom alternate endpoint to
send these reports to.

    Set($CSPReportURI, '/my/custom/csp-report');

Note that this may not work in all browsers. Reports have been confirmed
with Firefox on Mac.

If you don't see CSP information in your RT logs, you can still set the
headers below and use the browser console to see CSP notices.

=head2 C<$CSPDirective>

The directive for the C<Content-Security-Policy> header.

By default, this is not set.

Setting a value may cause RT to stop working as expected. This is provided
as a tool to help with testing.

    Set($CSPDirective, "default-src 'none';");

See L<Content Security Policy|https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Security-Policy>
for values.

=head2 <$CSPReportDirective>

The directive for the C<Content-Security-Policy-Report-Only> header.

This will cause the browser to report CSP issues, but still render the page
as normal.

By default, it uses the most restrictive C<default-src 'none';>.

Provide only the CSP rules, including semicolons. Do not provide the
C<report-to> part. That is added automatically based on the C<$CSPReportURI>.

    Set($CSPReportDirective, "default-src 'none';");

=head1 AUTHOR

Best Practical Solutions, LLC E<lt>modules@bestpractical.comE<gt>

=for html <p>All bugs should be reported via email to <a
href="mailto:bug-RT-Extension-CSP@rt.cpan.org">bug-RT-Extension-CSP@rt.cpan.org</a>
or via the web at <a
href="http://rt.cpan.org/Public/Dist/Display.html?Name=RT-Extension-CSP">rt.cpan.org</a>.</p>

=for text
    All bugs should be reported via email to
        bug-RT-Extension-CSP@rt.cpan.org
    or via the web at
        http://rt.cpan.org/Public/Dist/Display.html?Name=RT-Extension-CSP

=head1 LICENSE AND COPYRIGHT

This software is Copyright (c) 2024 by Best Practical Solutions, LLC

This is free software, licensed under:

  The GNU General Public License, Version 2, June 1991

=cut

1;
