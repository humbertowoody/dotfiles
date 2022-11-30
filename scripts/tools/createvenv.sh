#!/bin/bash
# createvenv - @humbertowoody
# Creates a new Python 3 virtual environment and activates it.
# Useful for Python development.

function createvenv()
{
  python3 -m venv ./venv && source ./venv/bin/activate && python --version && pip --version;
}

