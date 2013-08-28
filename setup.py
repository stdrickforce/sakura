# -*- coding: utf-8 -*-
import ez_setup
ez_setup.use_setuptools()

from setuptools import setup, find_packages

setup(
    name="sakura",
    version="1.0",
    description="stdrickforce's ubuntu rapid configuration solution",
    long_description=open("README.md").read(),
    author="[STD]Rick_Force",
    author_email="stdrickforce@gmail.com",
    packages=find_packages(),
    pacakage_data={},
    install_requires=[
        "fabric>=1.6.0",
        "pip>=1.4.1",
        "paramiko>=1.10",
        "virtualenv>=1.10.1",
        "virtualenvwrapper>=4.1.1",
        "autoenv>=1.0.0",
    ]
)
