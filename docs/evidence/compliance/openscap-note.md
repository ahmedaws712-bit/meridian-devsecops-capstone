# OpenSCAP Evidence Note

OpenSCAP was installed successfully in the local WSL environment and verified using `oscap --version`.

However, the SCAP Security Guide benchmark content packages were not available in the current WSL package repositories. Therefore, no CIS/standard benchmark XML content was available under `/usr/share/xml/scap`.

For this capstone, OPA is used as the executable compliance-as-code gate in the CI/CD pipeline. OpenSCAP is documented as part of the compliance automation design and would be executed in a full Linux environment where SCAP benchmark content is available.

In a production environment, OpenSCAP would generate XML and HTML compliance reports and store them in the compliance evidence pack.
