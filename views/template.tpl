<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>CitationExtractor</title>
</head>
<body>
    %if "error" in params:
    <p><strong>Error: {{ params["error"] }}</strong></p>
    % end

    % if "citations" in params:
    <pre>{{ params["citations"] }}</pre>
    % else:
    <form action="/upload" method="post" enctype="multipart/form-data">
        <p><label for="upload">Select a file: </label><input type="file" name="upload" id="upload" /></p>
        <p><input type="submit" value="Extract citations!" /></p>
    </form>
    % end
</form>
</body>
</html>
