FROM centos:7

WORKDIR /usr/src/app
ENV FLASK_APP=js_example
ENV LC_ALL=en_US.utf-8
ENV LANG=en_US.utf-8
RUN yum -y update; \
yum install -y python3 python3-pip git;
ADD ./student-exam2 ./student-exam2
#RUN git clone https://github.com/RaZ52/student-exam2; \
RUN cd student-exam2/; \
python3 -m pip install -e .;
EXPOSE 5000
CMD ["flask","run","-h","0.0.0.0","-p","5000"]
