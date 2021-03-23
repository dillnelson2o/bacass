FROM nfcore/base:1.13.2
LABEL authors="Andreas Wilm, Alexander Peltzer" \
      description="Docker image containing all software requirements for the nf-core/bacass pipeline"

# Install the conda environment
COPY environment.yml /
RUN conda env create --quiet -f /environment.yml && conda clean -a

# Add conda installation dir to PATH (instead of doing 'conda activate')
ENV PATH /opt/conda/envs/nf-core-bacass-1.1.1/bin:$PATH

# Dump the details of the installed packages to a file for posterity
RUN conda env export --name nf-core-bacass-1.1.1 > nf-core-bacass-1.1.1.yml
