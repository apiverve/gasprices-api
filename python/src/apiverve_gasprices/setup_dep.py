from setuptools import setup, find_packages

setup(
    name='apiverve_gasprices',
    version='1.2.2',
    packages=find_packages(),
    include_package_data=True,
    install_requires=[
        'requests',
        'setuptools'
    ],
    description='Gas Prices returns average retail gasoline, diesel and LPG prices from official weekly government surveys for the US, the UK, all 27 EU countries and the EU average. Pass a country, or a US state, region or city, to get the latest week with week-over-week and year-over-year changes, in any currency, per liter or per gallon.',
    author='APIVerve',
    author_email='hello@apiverve.com',
    url='https://apiverve.com/marketplace/gasprices?utm_source=pypi&utm_medium=referral&utm_content=homepage',
    classifiers=[
        'Programming Language :: Python :: 3',
        'Operating System :: OS Independent',
    ],
    python_requires='>=3.6',
)
