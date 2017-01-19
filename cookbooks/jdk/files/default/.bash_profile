if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi
if [ -d ~/bin ] ; then
    PATH=~/bin:"${PATH}"
fi

JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64/jre/
export JAVA_HOME

PATH=$PATH:$JAVA_HOME/bin
export M2_HOME=/usr/share/maven
export M2=$M2_HOME/bin
export MAVEN_OPTS="-Xms256m -Xmx512m"
export PATH

