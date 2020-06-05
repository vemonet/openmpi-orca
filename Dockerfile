FROM ubuntu:18.04
# FROM python:3

WORKDIR /opt

RUN apt-get update
RUN apt-get install -y build-essential

ADD https://download.open-mpi.org/release/open-mpi/v3.1/openmpi-3.1.4.tar.gz .

RUN tar xzvf openmpi-3.1.4.tar.gz

RUN ./configure --prefix=$HOME/opt/openmpi
RUN make all
RUN make install

RUN rm openmpi-3.1.4.tar.gz

RUN echo "export PATH=\$PATH:\$HOME/opt/openmpi/bin" >> $HOME/.bashrc
RUN echo "export LD_LIBRARY_PATH=\$LD_LIBRARY_PATH:\$HOME/opt/openmpi/lib" >> $HOME/.bashrc

# 3.4G file that can be download by going to a forum from the 90': https://orcaforum.kofo.mpg.de/app.php/dlext/
ADD  ./orca_4_2_1_linux_x86-64_openmpi314.tar.xz $HOME/opt
RUN tar xzvf $HOME/opt/orca_4_2_1_linux_x86-64_openmpi314.tar.xz
# Cannot be redistributed


# Run undefinetly, use bash to get in
ENTRYPOINT [ "tail", "-f", "/dev/null" ]
# ENTRYPOINT [ "bash" ]