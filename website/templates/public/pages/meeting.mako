<%inherit file="base.mako"/>
<%def name="title()">${ meeting['name'] } Presentations</%def>

<%def name="content()">

    <h2 style="padding-bottom: 30px;">${ meeting['name'] } Posters & Talks</h2>

    % if meeting['logo_url']:
        <img src="${ meeting['logo_url'] }" class="image-responsive" />
        <br /><br />
    % endif

    <div id="grid" style="width: 100%;"></div>

    % if meeting['active'] and not meeting.get('info_url'):
        <hr />
        <div id="submit">
            <h3>Add your poster or talk</h3>
            <p>
                Send an email to one of the following addresses from the email
                account you would like used on the OSF:
            </p>
            <ul>
                <li>For posters, email <a href="mailto:${ label }-poster@osf.io">${ label }-poster@osf.io</a></li>
                <li>For talks, email <a href="mailto:${ label }-talk@osf.io">${ label }-talk@osf.io</a></li>
            </ul>
            <p>The format of the email should be as follows:</p>
            <div>
                <dl style="padding-left: 25px">
                    <dt>Subject</dt>
                    <dd>Presentation title</dd>
                    <dt>Message body</dt>
                    <dd>Presentation abstract (if any)</dd>
                    <dt>Attachment</dt>
                    <dd>Your presentation file (e.g., PowerPoint, PDF, etc.)</dd>
                </dl>
            </div>
            <p>
                Once sent, we will follow-up by sending you the permanent identifier
                that others can use to cite your work; you can also login and make changes,
                such as uploading additional files, to your project at that URL. If you
                didn't have an OSF account, one will be created automatically and a link
                to set your password will be emailed to you; if you do, we will simply create
                a new project in your account.
            </p>
        </div>
    % endif

</%def>

<%def name="stylesheets()">
    ${parent.stylesheets()}
    <link rel="stylesheet" href="/static/vendor/bower_components/hgrid/dist/hgrid.min.css" />
</%def>

<%def name="javascript_bottom()">
    ${parent.javascript_bottom()}
    <script type="text/javascript">
        window.contextVars = window.contextVars || {};
        window.contextVars.meetingData = ${data};
        
        % if meeting['active'] and meeting['info_url']:
            window.contextVars.tbInstructionsLink =  '${ meeting['info_url'] }';
        % endif


    </script>
    <script src=${"/static/public/js/conference-page.js" | webpack_asset}></script>
</%def>
