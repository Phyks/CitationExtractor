<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>CitationExtractor</title>

    <style>
        body {
            margin: auto;
            width: 75%;
        }

        h1 a {
            text-decoration: none;
            color: black;
        }

        dl {
            margin-top: 2em;
        }

        form {
            padding-left: 25%;
            margin-top: 2em;
        }

        dt:not(:first-child) {
            margin-top: 1em;
        }

        .red {
            text-color: red;
        }

        .green {
            text-color: green;
        }
    </style>
</head>
<body>
    <h1><a href="/">Citation Extractor</a></h1>

    %if "error" in params:
    <p><strong>Error: {{ params["error"] }}</strong></p>
    % end

    % if "citations" in params:
    <p>Extracted citations for your paper <code>{{ params["upload_name"] }}</code> (not that some citations may have not been extracted properly):</p>
    <hr/>
    <dl>
    % for k, v in params["citations"].items():
        <dt>• {{ k }}</dt>
        <dd>>
            % if v["doi"] is not None:
            <a href="http://dx.doi.org/{{v["doi"]}}">doi://{{ v["doi"] }}</a>
            % else:
            <em>No DOI found.</em>
            % end
        </dd>
        <dd>>
            % if v["oa"] is not None:
            <a href="{{ v["oa"] }}">{{ v["oa"] }}</a>
            % else:
            <em>
                No OpenAccess version found.
                % if v["sharable"]:
                <strong class="green">It could be shared.</strong>
                % else:
                <strong class="red">It could not be shared.</strong>
                % end
            </em>
            % end
        </dd>
    % end
    </dl>
    % else:
    <p>This tool allows you to extract citations from a given PDF paper. Upload a file below and let it process your paper!</p>
    <hr/>
    <form action="/upload" method="post" enctype="multipart/form-data">
        <p><input type="file" name="upload" id="upload" /> <span style="margin-left: 5em"><input type="submit" value="Extract citations!" /></span></p>
    </form>
    % end
</form>
</body>
</html>
