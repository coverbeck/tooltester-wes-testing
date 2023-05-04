#!/usr/bin/env cwl-runner

class: CommandLineTool
id: Md5sum
label: Simple md5sum tool this is
cwlVersion: v1.0

$namespaces:
 s: https://schema.org/
 edam: http://edamontology.org/

#doc: |
#  [![Docker Repository on Quay.io](https://quay.io/repository/briandoconnor/dockstore-tool-md5sum/status "Docker Repository on Quay.io")](https://quay.io/repository/briandoconnor/dockstore-tool-md5sum)
#  [![Build Status](https://travis-ci.org/briandoconnor/dockstore-tool-md5sum.svg)](https://travis-ci.org/briandoconnor/dockstore-tool-md5sum)
#  A very, very simple Docker container for the md5sum command. See the [README](https://github.com/briandoconnor/dockstore-tool-md5sum/blob/master/README.md) for more information.
#

requirements:
- class: DockerRequirement
  dockerPull: quay.io/briandoconnor/dockstore-tool-md5sum:1.0.4
- class: InlineJavascriptRequirement

hints:
- class: ResourceRequirement
  # The command really requires very little resources.
  coresMin: 1
  ramMin: 1024
  outdirMin: 512

inputs:
  input_file:
    type: File
    inputBinding:
      position: 1
    doc: The file that will have its md5sum calculated.

outputs:
  output_file:
    type: File
    format: http://edamontology.org/data_3671
    outputBinding:
      glob: md5sum.txt
    doc: A text file that contains a single line that is the md5sum of the input file.

baseCommand: [/bin/my_md5sum]
