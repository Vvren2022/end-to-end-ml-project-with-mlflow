from setuptools import setup, find_packages

setup(
    name="end_to_end_ml_project",
    version="0.0.1",
    packages=find_packages(exclude=("tests","docs")),
)
