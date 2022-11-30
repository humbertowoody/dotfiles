#!/bin/bash
# activatevenv - @humbertowoody
# Activate the, already creaeted, virtual environment for Python present on the
# current directory.
function activatevenv()
{
  source ./venv/bin/activate && python --version && pip --version; 
}

