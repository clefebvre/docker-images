#!/usr/bin/python3
import subprocess

keyring = "2016.05.26"
packages = "mint-dev-tools build-essential devscripts fakeroot quilt dh-make automake libdistro-info-perl less nano ubuntu-dev-tools python python2.7 python3"

with open("mint18-amd64.Dockerfile", "w") as docker_file:
    files = "mint18"
    image = "ubuntu:16.04"
    command = ["sed", "-e", "s/@DOCKER_IMAGE@/%s/" % image, "-e", "s/@FILES@/%s/" % files, "-e", "s/@KEYRING@/%s/" % keyring, "-e", "s/@PACKAGES@/%s/" % packages, "template.Dockerfile"]
    subprocess.call(command, stdout=docker_file)

with open("mint18-i386.Dockerfile", "w") as docker_file:
    files = "mint18"
    image = "i386\/ubuntu:16.04"
    command = ["sed", "-e", "s/@DOCKER_IMAGE@/%s/" % image, "-e", "s/@FILES@/%s/" % files, "-e", "s/@KEYRING@/%s/" % keyring, "-e", "s/@PACKAGES@/%s/" % packages, "template.Dockerfile"]
    subprocess.call(command, stdout=docker_file)

with open("mint19-amd64.Dockerfile", "w") as docker_file:
    files = "mint19"
    image = "ubuntu:18.04"
    command = ["sed", "-e", "s/@DOCKER_IMAGE@/%s/" % image, "-e", "s/@FILES@/%s/" % files, "-e", "s/@KEYRING@/%s/" % keyring, "-e", "s/@PACKAGES@/%s/" % packages, "template.Dockerfile"]
    subprocess.call(command, stdout=docker_file)

with open("mint19-i386.Dockerfile", "w") as docker_file:
    files = "mint19"
    image = "i386\/ubuntu:18.04"
    command = ["sed", "-e", "s/@DOCKER_IMAGE@/%s/" % image, "-e", "s/@FILES@/%s/" % files, "-e", "s/@KEYRING@/%s/" % keyring, "-e", "s/@PACKAGES@/%s/" % packages, "template.Dockerfile"]
    subprocess.call(command, stdout=docker_file)

with open("lmde3-amd64.Dockerfile", "w") as docker_file:
    files = "lmde3"
    image = "debian:stretch"
    command = ["sed", "-e", "s/@DOCKER_IMAGE@/%s/" % image, "-e", "s/@FILES@/%s/" % files, "-e", "s/@KEYRING@/%s/" % keyring, "-e", "s/@PACKAGES@/%s/" % packages, "template.Dockerfile"]
    subprocess.call(command, stdout=docker_file)

with open("lmde3-i386.Dockerfile", "w") as docker_file:
    files = "lmde3"
    image = "i386\/debian:stretch"
    command = ["sed", "-e", "s/@DOCKER_IMAGE@/%s/" % image, "-e", "s/@FILES@/%s/" % files, "-e", "s/@KEYRING@/%s/" % keyring, "-e", "s/@PACKAGES@/%s/" % packages, "template.Dockerfile"]
    subprocess.call(command, stdout=docker_file)

keyring = "2009.04.29"

with open("mint17-amd64.Dockerfile", "w") as docker_file:
    files = "mint17"
    image = "ubuntu:14.04"
    command = ["sed", "-e", "s/@DOCKER_IMAGE@/%s/" % image, "-e", "s/@FILES@/%s/" % files, "-e", "s/@KEYRING@/%s/" % keyring, "-e", "s/@PACKAGES@/%s/" % packages, "template.Dockerfile"]
    subprocess.call(command, stdout=docker_file)

with open("mint17-i386.Dockerfile", "w") as docker_file:
    files = "mint17"
    image = "i386\/ubuntu:14.04"
    command = ["sed", "-e", "s/@DOCKER_IMAGE@/%s/" % image, "-e", "s/@FILES@/%s/" % files, "-e", "s/@KEYRING@/%s/" % keyring, "-e", "s/@PACKAGES@/%s/" % packages, "template.Dockerfile"]
    subprocess.call(command, stdout=docker_file)

with open("lmde2-amd64.Dockerfile", "w") as docker_file:
    files = "lmde2"
    image = "debian:jessie"
    command = ["sed", "-e", "s/@DOCKER_IMAGE@/%s/" % image, "-e", "s/@FILES@/%s/" % files, "-e", "s/@KEYRING@/%s/" % keyring, "-e", "s/@PACKAGES@/%s/" % packages, "template.Dockerfile"]
    subprocess.call(command, stdout=docker_file)

with open("lmde2-i386.Dockerfile", "w") as docker_file:
    files = "lmde2"
    image = "i386\/debian:jessie"
    command = ["sed", "-e", "s/@DOCKER_IMAGE@/%s/" % image, "-e", "s/@FILES@/%s/" % files, "-e", "s/@KEYRING@/%s/" % keyring, "-e", "s/@PACKAGES@/%s/" % packages, "template.Dockerfile"]
    subprocess.call(command, stdout=docker_file)
