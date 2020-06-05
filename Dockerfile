FROM ubuntu:18.04
# FROM python:3


RUN apt-get update
RUN apt-get install -y build-essential ssh rsh-client

WORKDIR /tmp
ADD https://download.open-mpi.org/release/open-mpi/v3.1/openmpi-3.1.4.tar.gz .
RUN tar xzvf openmpi-3.1.4.tar.gz

WORKDIR /tmp/openmpi-3.1.4
RUN ./configure --prefix=/root/openmpi
RUN make all
RUN make install

RUN rm /tmp/openmpi-3.1.4.tar.gz

RUN echo "export PATH=\$PATH:/root/openmpi/bin" >> $HOME/.bashrc
RUN echo "export LD_LIBRARY_PATH=\$LD_LIBRARY_PATH:/root/openmpi/lib" >> $HOME/.bashrc


# 3.4G file that can be download by going to a forum from the 90': https://orcaforum.kofo.mpg.de/app.php/dlext/
ADD ./orca_4_2_1_linux_x86-64_openmpi314.tar.xz /tmp/orca

# COPY  ./orca_4_2_1_linux_x86-64_openmpi314.tar.xz $HOME/opt/
# RUN tar xzvf $HOME/opt/orca_4_2_1_linux_x86-64_openmpi314.tar.xz
# Cannot be redistributed

RUN mv /tmp/orca/orca_4_2_1_linux_x86-64_openmpi314 /root/orca

WORKDIR /root

# Run undefinetly, use bash to get in
ENTRYPOINT [ "tail", "-f", "/dev/null" ]
# ENTRYPOINT [ "bash" ]