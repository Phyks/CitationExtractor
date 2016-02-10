#!/usr/bin/env python3
import config
import html
import json
import os
import tempfile

from bottle import redirect, request, route, run, view
from libbmc import doi
from libbmc.citations import pdf


@route("/upload", method="POST")
@view("template.tpl")
def do_upload():
    """
    Handle uploaded PDF files and process them for citations.
    """
    # Check uploaded file has been provided
    upload = request.files.get('upload')
    if upload is None:
        return redirect("/")

    # Check file is a PDF file
    _, ext = os.path.splitext(upload.filename)
    if ext not in (".pdf"):
        return {
            "params": {
                "error": "File does not seem to be a valid PDF file."
            }
        }

    # Process citations
    with tempfile.NamedTemporaryFile() as fh:
        upload.save(fh)
        raw_citations = pdf.cermine_dois(fh.name,
                                         override_local=config.CERMINE_PATH)
    citations = {
        html.unescape(k): {
            "doi": doi.to_canonical(v) if v is not None else v,
            "oa": doi.get_oa_version(doi.to_canonical(v) if v is not None
                                     else v)
        }
        for k, v in raw_citations.items()
    }

    return {
        "params": {
            "citations": citations,
            "upload_name": upload.filename
        }
    }


@route("/<:re:.+>")
def redirect_catchall():
    """
    Redirect everything else to /.
    """
    return redirect("/")


@route("/")
@view("template.tpl")
def index():
    """
    Main index view, upload form.
    """
    return {
        "params": {}
    }


if __name__ == "__main__":
    run(host=config.HOST, port=config.PORT, debug=config.DEBUG)
