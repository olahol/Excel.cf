#!/bin/bash

function simpleParseTest() {
    cd tmp
	echo "- testing $1"
	Run=`cat ../input/$1.formula | ./TestExcel | tail -n 1 | sed "s/ //g"`
    cat ../input/$1.formula | ./TestExcel
    ExpectedOutput=`cat ../input/$1.formula | sed "s/ //g"`
    assertEquals "${ExpectedOutput}" "${Run}"
    cd ..
}

# Setup & Cleanup
function oneTimeSetUp() {
    mkdir -p tmp
    cd tmp
    cp ../../Excel.cf .
    echo " bnfc -haskell -m Excel.cf"
    bnfc -haskell -m Excel.cf > /dev/null
    #make 2>1 > /dev/null
    make
    cd ..
}

function oneTimeTearDown() {
    rm -rf tmp
}

# Tests
testSimple() {
    simpleParseTest "if"
    simpleParseTest "arith"
    simpleParseTest "range"
    simpleParseTest "neg"
}

. ./shunit2
