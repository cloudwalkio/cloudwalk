module Util
  POSXML_EN_XSD =<<'EOF'
﻿<?xml version="1.0" encoding="utf-8"?>
<xs:schema targetNamespace="http://tempuri.org/posxml.xsd" elementFormDefault="qualified" xmlns="http://tempuri.org/posxml.xsd" xmlns:mstns="http://tempuri.org/posxml.xsd" xmlns:xs="http://www.w3.org/2001/XMLSchema">
  <xs:element name="posxmlapplication">
    <xs:annotation>
      <xs:documentation>PosXml Application</xs:documentation>
    </xs:annotation>
    <xs:complexType>
      <xs:sequence>
        <xs:element name="page" type="page" maxOccurs="unbounded">
          <xs:annotation>
            <xs:documentation>Page of application PosXml</xs:documentation>
          </xs:annotation>
        </xs:element>
      </xs:sequence>
    </xs:complexType>
  </xs:element>
  <xs:complexType name="page">
    <xs:choice maxOccurs="unbounded">
      <xs:group ref="comandos" />
    </xs:choice>
    <xs:attribute name="name" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>Set the page name of application PosXml. Put 'main' if this page will be the first one to be executed.</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:group name="comandos">
    <xs:choice>
      <xs:element name="display" type="display">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>line,column,message</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>d;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Display is used to show message in the terminal's display</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="cleandisplay" type="cleandisplay">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>
          </xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>H;false;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Cleandisplay is used to clean the terminal's display</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="if" type="if" maxOccurs="unbounded">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>variable,operator,value</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>I;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>E;false;false;false</xs:appinfo>
          <xs:documentation>If is used to make logical blocks in PosXml Application.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="function" type="function" maxOccurs="unbounded">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>name</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>l;true;true;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>r;false;false;false</xs:appinfo>
          <xs:documentation>Function is used to make functions in PosXml Application.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="inputinteger" type="inputinteger">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>variable,line,column,message,minimum,maximum</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>i;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Inputinteger is used to enter only numeric values in the terminal. While pressing the key Enter, the captured value is put in variable.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="inputoption" type="inputoption">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>variable,line,column,message,minimum,maximum</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>o;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Inputoption is used to enter only numeric value in the terminal. The value captured is automatically put in variable if it is valid, without pressing any key.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="inputmoney" type="inputmoney">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>variable,line,column,message</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>y;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Inputmoney is used to enter money values in the terminal. The terminal shows a mask with comma and points, while pressing the digit keys. The captured value is multiplied by 100 and put in variable without comma and points.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="inputformat" type="inputformat">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>variable,line,column,message,format</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>f;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Inputformat is used to enter a value in a specific format. The format is specified in the format paramater. The value captured is put in variable.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="print" type="print">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>message</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>p;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Print is used to print a message in the terminal's printer.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="printbig" type="printbig">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>message</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>P;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Printbig is used to printer a message in the terminal's printer. The message is printed in big size.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="paperfeed" type="paperfeed">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>
          </xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>h;false;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Paperfeed is used to advance paper of the terminal's printer.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="inputfloat" type="inputfloat">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>variable,line,column,message</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>s;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Inputfloat is used to enter a float value. While pressing the key Enter, the captured value is put in variable with point.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="preconnect" type="preconnect">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>variablestatus</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>S;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Preconnect is used to estabilish a connection with the Walk Server.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="shutdownmodem" type="shutdownmodem">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>
          </xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>D;false;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Shutdownmodem is used to disconnect from the Walk Server , and shutdown the communication device of the terminal.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="getcardvariable" type="getcardvariable">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>firstmessage,secondmessage,minimum,maximum,variable</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>k;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Getcardvariable is used to capture the card swiped in the terminal's magnetic reader. The captured value is put in variable. Is possible to use this instruction with a EMV card, if the card is a card with chip the instruction 'emv.inittransaction' will be executed.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="waitkey" type="waitkey">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>
          </xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>u;false;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Waitkey is used to wait the user press any key of the terminal. The instruction will wait 30 seconds if the user dont't press any key.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="wait" type="wait">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>miliseconds</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>C;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Wait is used to wait the time specified in miliseconds.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="callfunction" type="callfunction">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>name</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>g;true;true;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Callfunction is used to call a function defined with the function instruction.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="integervariable" type="integervariable">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>value,variable</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>m;true;false;true</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Integer is used to declare an integer variable.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="stringvariable" type="stringvariable">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>value,variable</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>&gt;;true;false;true</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>String is used to declare a string variable</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="substring" type="substring">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>index,variablesource,variabledestination,character,variablereturn</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>&lt;;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Substring is used to extract the characters in variablesource.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="stringtoint" type="stringtoint">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>variablestring,variableinteger</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>a;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Stringtoint is used to convert a string variable in an integer variable.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="inttostring" type="inttostring">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>variableinteger,variablestring</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>b;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Inttostring is used to convert an integer variable in a string variable.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="string.getvaluebykey" type="string.getvaluebykey">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>string,key,variablereturn</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>K;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>The command string.getvaluebykey searches on a string for a value based in key/value.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="menu" type="menu">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>variable,options</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>L;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Menu is used to show a menu in the terminal's display. The captured value is put in variable.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="menuwithheader" type="menuwithheader">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>header,options,timeoutheader,timeout,variablereturn</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>\x81;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>The instruction menuwithheader builds a menu in the display of the terminal, in accordance with numbers of lines of the same. In the constant string options for each bar ‘\’ Existing, will be a line break. The header will be broken in "|" and shown in the first row updating based on the time set in timeoutheader. When the number of options reaches the maximum size of the number of lines, will appear beside the title a sign of '+' indicating that you can scroll to another screen.You can show the other screen, pressing (enter, or OK).
            The user can type any key. The value entered is stored in a variable. When the timeout reaches, will return "-1". The key of config.dat iskeytimeout must be 1.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="readfile" type="readfile">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>filename,key,variabledestination</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>B;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Readfile is used to read a file in 'Walk Db format'. The format of the file in 'Walk Db format', is: ('key=value\nkey=value\n ... ').</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="editfile" type="editfile">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>filename,key,value</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>A;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Editfile is used to write or edit a file in 'Walk Db format'. The format of the file in 'Walk Db format', is: ('key=value\nkey=value\n ... ').</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="integeroperator" type="integeroperator">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>operator,variablesource</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>G;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Integeroperator is used to increment ou decrement an integer value specified in variablesource.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="adjustdatetime" type="adjustdatetime">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>datetime</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>J;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Adjustdatetime is used to adjust the terminal's clock.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="getdatetime" type="getdatetime">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>format,variabledestination</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>n;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Getdatetime is used to get the date and time of the terminal's clock. The captured value is put in variable. The format of variable is defined in format parameter.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="checkpaperout" type="checkpaperout">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>variablereturn</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>N;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Checkpaperout is used to check if the paper of the terminal's printer is over.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="mathematicaloperation" type="mathematicaloperation">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>variabledestination,operator,firstvalue,secondvalue</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>T;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Mathematicaloperation is used to make a mathematical operation between firstvalue and secondvalue.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="joinstring" type="joinstring">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>firstvalue,secondvalue,variabledestination</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>t;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Joinstring is used to join firstvalue and secondvalue in variabledestination.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="deletefile" type="deletefile">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>filename</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>x;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Deletefile is used to remove a file from the terminal's memory.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="printbarcode" type="printbarcode">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>number,horizontal</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>X;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Prinbarcode is used to print a barcode in I25 format.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="waitkeytimeout" type="waitkeytimeout">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>seconds</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>U;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Waitkey is used to wait the user press any key of the terminal. The waitkey instruction will wait x seconds defined in the seconds parameter if the user doesn't press any key.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="execute" type="execute">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>filename</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>j;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Execute is used to execute a compiled PosXml application.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="while" type="while">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>variable,operator,value</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>V;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>v;false;false;false</xs:appinfo>
          <xs:documentation>While is used to make logical blocks in PosXml Application.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="break" type="break">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>
          </xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>Z;false;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Break is used to break while loops.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="openserialport" type="openserialport">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>port,rate,configuration,variablereturn</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>Y;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Openserialport is used to open the terminal's serial port.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="readserialport" type="readserialport">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>variablehandle,variablebuffer,bytes,timeout,variablereturn</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>w;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Readserialport is used to read values from the terminal's serial port. The terminal's serial port must be opened with the openserialport instruction.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="writeserialport" type="writeserialport">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>variablehandle,buffer</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>W;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Writeserialport is used to write values to the terminal's serial port. The terminal's serial port must be opened with the openserialport instruction.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="closeserialport" type="closeserialport">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>variablehandle</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>!;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Close is used to close the terminal's serial port. The terminal's serial port must be opened with the openserialport instruction.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="string.length" type="string.length">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>value,variablereturn</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>@;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>String.length is used to return the length of the string specified in value.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="exit" type="exit">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>
          </xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>1;false;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Exit is used to finalize a PosXml application.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="downloadfile" type="downloadfile">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>filename,remotepath,variablereturn</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>4;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Downloadfile is used to download a file from WALK Manager to the terminal's memory.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="readfilebyindex" type="readfilebyindex">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>filename,index,variablekey,variablevalue,variablereturn</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>%;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Readfilebyindex is used to read a file in 'Walk Db format' in specified index. The format of the file in 'Walk Db format', is: ('key=value\nkey=value\n ... ').</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="diffdatetime" type="diffdatetime">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>firstdatetime,seconddatetime,variablereturn</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>7;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Diffdatetime is used to calculate the time difference between firstdatetime and seconddatetime.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="displaybitmap" type="displaybitmap">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>filename,variablereturn</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>8;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Displaybitmap is used to display a monochrome bitmap file in the terminal's display.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="printbitmap" type="printbitmap">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>filename,variablereturn</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>9;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Printbitmap is used to print a monochrome bitmap file.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="readkey" type="readkey">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>miliseconds,variablereturn</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>/;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Readkey is used to capture a key pressed by the user in the terminal's keypad. The captured key is put in variablereturn.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="unzipfile" type="unzipfile">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>filename,variablereturn</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>\;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Unzipfile is used to unzip compacted files.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="else" type="else">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>
          </xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>,;false;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Else is used to make logical blocks in PosXml Application.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="integerconvert" type="integerconvert">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>number,base,sizereturn,variablereturn</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>\x01;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Integerconvert is used to convert a decimal number in a binary,octal or hexadecimal number.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="iso8583.initfieldtable" type="iso8583.initfieldtable">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>filename,variablereturn</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>\x02;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Initialize a table with fields of ISO8583 especification. This function must be called before any other ISO85853 function.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="iso8583.initmessage" type="iso8583.initmessage">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>format,id,variablemessage,variablereturn</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>\x03;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Initialize a ISO8583 message that will be sended to host.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="iso8583.analyzemessage" type="iso8583.analyzemessage">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>format,size,variablemessage,variableid,variablereturn</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>\x05;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Initialize the process for analyze the fields in the specified message.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="iso8583.endmessage" type="iso8583.endmessage">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>variablesize,variablereturn</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>\x06;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Finish the message initied by function iso8583.initmessage.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="iso8583.putfield" type="iso8583.putfield">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>fieldnumber,type,value,variablereturn</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>\x07;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Insert a field in the message that was initialized by function iso8583.initmessage. The fields must be inserted in the increasing order.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="iso8583.getfield" type="iso8583.getfield">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>fieldnumber,type,variablevalue,variablereturn</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>\x08;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Get a field in the message that was initialized by function iso8583.initmessage. The fields must be retrieved in the increasing order.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="string.charat" type="string.charat">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>string,character_index,variablereturn</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>\x09;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Returns the character at a specified position.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="string.trim" type="string.trim">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>string,variablereturn</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>\x0B;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Returns a string without leading and trailing spaces.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="string.find" type="string.find">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>string,substring,start,variablereturn</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>\x0C;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Returns the position of a substring in a string.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="string.replace" type="string.replace">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>original_string,old_substring,new_substring,variablereturn</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>\x0E;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Replaces a part of a string with a new string.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="string.substring" type="string.substring">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>string,start,length,variablereturn</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>\x0F;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Returns a specified part of a string.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="string.elements" type="string.elements">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>string,delimiter,variablereturn</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>\x10;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Returns the number of elements in a specified string.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="string.insertat" type="string.insertat">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>string,string_to_be_inserted,element_index,delimiter,variablereturn</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>\x11;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Divides a string into elements and inserts a substring at a specified index position.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="string.replaceat" type="string.replaceat">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>string,new_element,element_index,delimiter,variablereturn</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>\x12;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Divides a string into elements and replaces a specified element.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="string.elementat" type="string.elementat">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>string,element_index,delimiter,variablereturn</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>\x13;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Divides a string into elements and returns a specified element.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="string.removeat" type="string.removeat">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>string,element_index,delimiter,variablereturn</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>\x14;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Divides a string into elements and removes a specified element.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="network.send" type="network.send">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>buffer,size,variablereturn</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>\x15;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Send a buffer to a host that the terminal is connected. The terminal must be already connected to host. To make a connection with host use a preconnect function.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="network.receive" type="network.receive">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>variablebuffer,maxsize,variablereceivedbytes,variablereturn</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>\x16;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Receive a buffer from host that the terminal is connected. The terminal must be already connected to host. To make a connection with host use a preconnect function.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="network.wifi_scan" type="network.wifi_scan">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>timeout,aps,variablereturn</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>\xa0;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Perform WIFI scan for APs.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="system.restart" type="system.restart">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>
          </xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>\x17;false;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Restarts the terminal.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="filesystem.filesize" type="filesystem.filesize">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>filename,variablereturn</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>\x19;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Return the size of specified file</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="filesystem.space" type="filesystem.space">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>dir,type,variablereturn</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>\x1A;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Return one of this parameters: free space on the flash or ram memory, total space, used space, number of files.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="filesystem.listfiles" type="filesystem.listfiles">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>dir,listfilename,variablereturn</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>\x1B;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>List files of the specified directory and then save this list in a 'Walk Db file'.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="filesystem.renamefile" type="filesystem.renamefile">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>oldname,newname,variablereturn</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>\x8A;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Renames a file that already exist on the device's memory.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="network.cloudwalkhandshake" type="network.cloudwalkhandshake">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>variablereturn</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>\x8B;false;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Performs a handshake operation with the CloudWalk service(This instruction is exclusive for CloudWalk environment).</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="xml.getelement" type="xml.getelement">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>filename,parentnode,childnode,variablevalue,variablereturn</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>\x8C;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>This command opens a xml file previously saved on the terminal's memory, and, search for specific nodes.
The 'root' node and the 'child' node that you're looking for, must be passed on 'parentnode' and 'childnode' parameters.
In case of sucess in this function, the content of the 'child' node will be copied to 'variablevalue' parameter.
          </xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="json.getelement" type="json.getelement">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>filename,jsonstring,jsonvalue,variablereturn</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>\x8E;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>
            This command opens a json file previously saved on the terminal's memory, and, search for specific json values.
            The json string that you're looking for, must be passed on 'the json string' parameter.
            In case of sucess in this function, the content of the json string will be copied to 'jsonvalue' parameter.
          </xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="convert.toint" type="convert.toint">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>base,number,variablereturn</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>\x1D;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Convert.toint is used to convert a string that contains a binary,decimal or hexadecimal number to a integer number.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="predial" type="predial">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>option,variablestatus</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>#;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Predial is used to dial in provider.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="network.checkgprssignal" type="network.checkgprssignal">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>variablestatus</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>$;false;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>The command network.checkgprssignal checks the percentage of signal strength.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="system.checkbattery" type="system.checkbattery">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>variablestatus</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>';false;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>The command system.checkbattery checks the percentage of battery remaining.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="network.ping" type="network.ping">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>host,variablereturn</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>O;false;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>The command network.ping checks the host status. Is necessary that the modem device is already initialized with the "preconnect" instruction.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="system.beep" type="system.beep">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>
          </xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>Q;false;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>The command system.beep executes a short signal sound.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="system.readcard" type="system.readcard">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>keyvariable,cardvariable,timeout,variablereturn</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>\x26;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>This function waits which a card be read or a key pressed, the time that the instruction will wait is timeout value, if any action happens, the default return values is: keyvariable="KEY_CANCEL", cardvariable="0". Is possible to use this instruction with a EMV card, if the card is a card with chip the instruction 'emv.inittransaction' will be executed </xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="system.inputtransaction" type="system.inputtransaction">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>keyvariable,cardvariable,timeout,variablereturn,keyboard,inputtype</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>\x91;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>This function waits which a card be read or a key pressed, the time that the instruction will wait is timeout value, if any action happens, the default return values is: keyvariable="KEY_CANCEL", cardvariable="0". Is possible to use this instruction with a EMV card or CTLS EMV card, if the card is a card with chip the instruction 'emv.inittransaction' will be executed or CTLS transaction will starts (PINPad 1000 SE CTLS required).</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="system.backlight" type="system.backlight">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>level,variablereturn</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>\x92;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Allows you to control the backlight of the device.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="system.update" type="system.update">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>file,variablereturn</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>\x99;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>This instruction activates the new software downloaded with the instruction 'system.update.'</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="system.qrcode" type="system.qrcode">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>filename,input,size,version</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>\x94;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Generates a bitmap file containing a qrcode from the data of the input parameter.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="network.hostdisconnect" type="network.hostdisconnect">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>
          </xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>\x65;false;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>The command network.hostdisconnect disconnects the terminal from host, but it keeps the terminal connected in network.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="iso8583.transactmessage" type="iso8583.transactmessage">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>channel,header,trailler,isomsg,variableresponse,variablereturn</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>\x3B;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>This function connects to the host, and based on the parameters especified it adds a size, header and trailer in the iso message, sends message to the host and try to receive the reply iso message 10 times.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="iso8583.transactmessagesubfield" type="iso8583.transactmessagesubfield">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>channel,header,trailler,variablereturn</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>\x95;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>This function connects to the host, and based on the parameters especified it adds a size, header and trailer in the iso message, sends message to the host and try to receive the reply iso message 10 times. This instruction differs from iso8583.transactmessage, it sends a message that contains a subfield in binary format.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="network.start" type="network.start">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>variablereturn</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>\x96;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>This instruction initializes the modem of the device.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="notification.setup" type="notification.setup">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>
          </xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>\x97;false;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>This instruction setup the device on CloudWalk's server for notification messages.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="notification.receive" type="notification.receive">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>variablepayload,variablereturn</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>\x98;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>This instruction receives a notification message from CloudWalk's server.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="smartcard.insertedcard" type="smartcard.insertedcard">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>slot,variablereturn</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>|;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Verifies if the card is already inserted on terminal's reader.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="smartcard.startreader" type="smartcard.startreader">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>slot,variablereturn</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>=;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Starts the terminal's reader and try to initialize the card, sending an ATR command.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="smartcard.transmitAPDU" type="smartcard.transmitAPDU">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>slot,header,LC,datafield,LE,variabledatafieldresponse,variableSW,variablereturn</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>.;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Sends an APDU command to the card in a specified slot. Note that before using this instruction, the reader should be already started through the instruction smartcard.startreader. All the fields should be filled in with hexadecimal values. See instructions string.tohex and string.fromhex.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="smartcard.closereader" type="smartcard.closereader">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>slot,variablereturn</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>2;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Closes the communication channel with the card and closes the terminal's reader.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="string.tohex" type="string.tohex">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>string,variablereturn</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>0;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Converts a ASCII representation string in a hexadecimal representation. Example: '12345' It's equal to '3132333435'</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="string.fromhex" type="string.fromhex">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>string,variablereturn</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>?;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Converts a hexadecimal representation in a ASCII representation string. Example: '3132333435' It's equal to '12345'</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="crypto.encryptdecrypt" type="crypto.encryptdecrypt">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>message,key,cryptotype,type,variablereturn</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>{;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Encrypt or decrypt a message using DES, 3DES ou NEWDES.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="crypto.lrc" type="crypto.lrc">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>buffer,size,variablereturn</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>};true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Generates a LRC byte from a string defined in parameter buffer.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="crypto.xor" type="crypto.xor">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>buffer1,buffer2,size,variablereturn</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>^;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Makes a binary XOR between the bytes defined in buffer1 and buffer2.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="crypto.crc" type="crypto.crc">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>buffer,size,type,variablereturn</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>_;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Calculate CRC 16 bits, CRC-CCITT support.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="system.info" type="system.info">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>type,variablereturn</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>`;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Info about system, example MAC Address e SIM ID.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="system.gettouchscreen" type="system.gettouchscreen">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>axisx,axisy,variablereturn</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>\x87;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>The command system.gettouchscreen capture the coordinates where the display is pressed. </xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="system.gettouchscreenkeyboard" type="system.gettouchscreenkeyboard">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>axisx,axisy,timeout,variablekey,variablereturn</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>\x8D;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>The command system.gettouchscreenkeyboard capture the coordinates where the display is pressed, or capture the key if it was pressed.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="pinpad.open" type="pinpad.open">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>type,variableserialnumber,variablereturn</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>\x1C;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>The command pinpad.open enables the communication between external or internal pinpad and the POS terminal
          </xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="pinpad.display" type="pinpad.display">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>message</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>(;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>The command pinpad.display displays the message contained in the message parameter on the display of external pinpad.Do not apply to internal pinpad.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="pinpad.getkey" type="pinpad.getkey">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>message,timeout,variablereturn</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>);true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>The command pinpad.getkey captures a key that is pressed on external pinpad while viewing a message contained in the  message parameter on the display of external pinpad.Do not apply to internal pinpad.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="pinpad.getpindukpt" type="pinpad.getpindukpt">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>message,type,pan,maxlen,variablereturnpin,variablereturnksn,variablereturn</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>*;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>The command pinpad.getpindukpt captures a pin and encrypts using The DUKPT standard in the external pinpad or internal while viewing a message contained in the message parameter on the display of external pinpad or on the display of POS terminal.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="pinpad.loadipek" type="pinpad.loadipek">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>ipek,ksn,type,variablereturn</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>+;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>The command pinpad.loadipek record an initial key and an initial ksn on the memory of internal pinpad or external to perform an encryption of passwords using DUKPT standard. </xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="pinpad.close" type="pinpad.close">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>message</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>~;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>The command pinpad.close terminates the communication with an external or internal pinpad that was previously established with pinpad.open. And put a standard message on the display of external pinpad. </xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="emv.open" type="emv.open">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>variablereturn,mkslot,pinpadtype,pinpadwk,showamount</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>\x2D;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Initialize EMV library.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="emv.close" type="emv.close">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>variablereturn</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>\x22;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Finaliza EMV library.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="emv.settimeout" type="emv.settimeout">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>seconds,variablereturn</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>\x1E;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Set a Timeout(in seconds) of library process EMV.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="emv.loadtables" type="emv.loadtables">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>acquirer,variablereturn</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>\x5D;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Load tables EMV and PKI of file by Acquirer.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="emv.cleanstructures" type="emv.cleanstructures">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>
          </xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>\x1F;false;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Clean all parameters of input and output for 'init', 'process' and 'finish'.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="emv.adddata" type="emv.adddata">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>type,parameter,value,variablereturn</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>\x88;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Added parameters to the Process EMV, types 'init', 'process', 'finish'.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="emv.getinfo" type="emv.getinfo">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>type,parameter,value</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>\x35;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Return parâmeters of information after running the process EMV, types 'init', 'process', 'finish'.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="emv.inittransaction" type="emv.inittransaction">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>variablereturn</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>\x20;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Initialize EMV with the parameters inserted in emv.adddata with 'init' type.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="emv.processtransaction" type="emv.processtransaction">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>variablereturn,ctls</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>\x3A;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation> processing of transaction EMV, use data inserted in emv.adddata with 'process' type.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="emv.finishtransaction" type="emv.finishtransaction">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>variablereturn</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>\x5B;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Finalisation of EMV transaction, use data inserted in emv.adddata with 'finish' type</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="emv.removecard" type="emv.removecard">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>variablereturn</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>\x71;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Awaits removal of the card, use of emv.settimeout, if setted.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="parseticket" type="parseticket">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>productmenu,ticket,message,literal,variablereturn</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>\x80;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Awaits removal of the card, use of emv.settimeout, if setted.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="file.open" type="file.open">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>mode,filename,variablehandle</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>\x83;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>opens a file for reading or writing.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="file.close" type="file.close">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>handle</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>\x84;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Closes a file that was previously opened with file.open.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="file.read" type="file.read">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>handle,size,variablebuffer,variablereturn</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>\x85;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Read a file that was previously opened with file.open.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="file.write" type="file.write">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>handle,size,buffer</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>\x86;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Writes a file that was previously opened with file.open.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="file.concat" type="file.concat">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>config,out,variablereturn</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>\xA1;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Concatenate files.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="input.getvalue" type="input.getvalue">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>linecaption,columncaption,caption,lineinput,columninput,minimum,maximum,allowsempty,variablereturn</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>\x82;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Allows you to capture a string and display it on screen in any position.</xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="string.pad" type="string.pad">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>origin,character,align,length,destination</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>\x89;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>The string that is passed receives a pad with the specified character.</xs:documentation>
        </xs:annotation>
      </xs:element>
	    <xs:element name="time.calculate" type="time.calculate">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>operation,type,date,greaterdate,value,variablereturn</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>\x90;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Time calculation, addition, subtraction and difference.</xs:documentation>
        </xs:annotation>
      </xs:element>
	  <xs:element name="paymentchannel.receive" type="paymentchannel.receive">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>socket,compressed,timeout,variableresponse,variablereturn</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>\xa5;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Receive a buffer from a payment channel</xs:documentation>
        </xs:annotation>
      </xs:element>
	  <xs:element name="paymentchannel.send" type="paymentchannel.send">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>socket,compressed,msg</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>\xa2;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Send a buffer to a payment channel</xs:documentation>
        </xs:annotation>
      </xs:element>
	  <xs:element name="paymentchannel.connect" type="paymentchannel.connect">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>variablecompressed,variablereturn</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>\xa3;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Create a payment channel</xs:documentation>
        </xs:annotation>
      </xs:element>
	  <xs:element name="paymentchannel.close" type="paymentchannel.close">
        <xs:annotation>
          <!-- ordem dos parametros -->
          <xs:appinfo>socket</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (startelement) -->
          <xs:appinfo>\xa4;true;false;false</xs:appinfo>
          <!-- bytecode;tem parametros;declaracao ou chamada de funcao;declaracao de variavel; (endelement) -->
          <xs:appinfo>
          </xs:appinfo>
          <xs:documentation>Close a payment channel</xs:documentation>
        </xs:annotation>
      </xs:element>
    </xs:choice>
  </xs:group>
  <xs:complexType name="display">
    <xs:sequence>
    </xs:sequence>
    <xs:attribute name="line" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>(integer) Line of display.</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="column" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>(integer) Column of display.</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="message" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>(string) Message to show in display.</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="cleandisplay">
    <xs:sequence />
  </xs:complexType>
  <xs:complexType name="function">
    <xs:choice maxOccurs="unbounded">
      <xs:group ref="comandos" />
    </xs:choice>
    <xs:attribute name="name" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Name of function)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="if">
    <xs:choice maxOccurs="unbounded">
      <xs:group ref="comandos" />
    </xs:choice>
    <xs:attribute name="variable" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string or integer (Variable for comparison)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="operator" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Operator, can be: lessthan,greaterthan,equalto,notequalto,greaterthanorequalto,lessthanorequalto)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="value" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string or integer (Value for comparison)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="inputinteger">
    <xs:sequence />
    <xs:attribute name="variable" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (Variable where the captured value will be stored)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="line" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (Line of display where the message will be shown)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="column" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (Column of display where the message will be shown)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="message" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (The message that will be shown in the display)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="minimum" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (The minimum value permited)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="maximum" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (The maximum value permited)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="inputoption">
    <xs:sequence />
    <xs:attribute name="variable" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (Variable where the captured value will be stored)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="line" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (Line of display where the message will be shown)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="column" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (Column of display where the message will be shown)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="message" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (The message that will be shown in the display)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="minimum" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (The minimum value permited)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="maximum" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (The maximum value permited)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="inputmoney">
    <xs:sequence />
    <xs:attribute name="variable" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (Variable where the captured value will be stored)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="line" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (Line of display where the message will be shown)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="column" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (Column of display where the message will be shown)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="message" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (The message that will be shown in the display)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="inputformat">
    <xs:sequence />
    <xs:attribute name="variable" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Variable where the captured value will be stored)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="line" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (Line of display where the message will be shown)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="column" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (Column of display where the message will be shown)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="message" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (The message that will be shown in the display)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="format" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Mask for input values. 9:numbers A:letters *:password. The other characters will be inserted automatically. Ex: 999-AAA/***)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="print">
    <xs:sequence />
    <xs:attribute name="message" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (The message that will be printed by the terminal's printer)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="printbig">
    <xs:sequence />
    <xs:attribute name="message" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (The message that will be printed by the terminal's printer)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="paperfeed">
    <xs:sequence />
  </xs:complexType>
  <xs:complexType name="inputfloat">
    <xs:sequence />
    <xs:attribute name="variable" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Variable where the captured value will be stored)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="line" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (Line of display where the message will be shown)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="column" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (Column of display where the message will be shown)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="message" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (The message that will be shown in the display)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="preconnect">
    <xs:sequence />
    <xs:attribute name="variablestatus" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (Connection status. 0: success -1: error)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="shutdownmodem">
    <xs:sequence />
  </xs:complexType>
  <xs:complexType name="getcardvariable">
    <xs:sequence />
    <xs:attribute name="firstmessage" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (The first message that will be shown in the display)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="secondmessage" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (The second message that will be shown in the display when the user press Enter key)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="minimum" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (Minimum length of digited card number)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="maximum" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (Maximum length of digited card number)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variable" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Variable where the captured value will be stored)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="waitkey">
    <xs:sequence />
  </xs:complexType>
  <xs:complexType name="wait">
    <xs:sequence />
    <xs:attribute type="xs:string" use="required" name="miliseconds">
      <xs:annotation>
        <xs:documentation>integer (Time that the instruction will wait)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="callfunction">
    <xs:sequence />
    <xs:attribute name="name" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>function (Name of the function that will be called)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="integervariable">
    <xs:sequence />
    <xs:attribute name="value" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (Value of variable)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variable" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>variable (Name of variable)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="stringvariable">
    <xs:sequence />
    <xs:attribute name="value" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Value of variable)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variable" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>variable (Name of variable)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="substring">
    <xs:sequence />
    <xs:attribute name="index" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (The position in variablesource where the substring will be started.)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variablesource" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Variable where the substring will be made)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variabledestination" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Variable where the result of substring will be stored)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="character" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Character that the substring will search in variablesource)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variablereturn" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (Position of the found character in variablesource. If the specified character was not found, the value of variablereturn will be -1.</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="stringtoint">
    <xs:sequence />
    <xs:attribute name="variablestring" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Variable that will be converted)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variableinteger" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (Variable where the converted value will be stored)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="inttostring">
    <xs:sequence />
    <xs:attribute name="variableinteger" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (Variable that will be converted)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variablestring" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Variable where the converted value will be stored)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="string.getvaluebykey">
    <xs:sequence />
    <xs:attribute name="string" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>The string which will be used to search. (string)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="key" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>Name of the existing key in the string. (string)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variablereturn" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>Variable where the value of the key specified in parameter key will be stored. (string)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="menu">
    <xs:sequence />
    <xs:attribute name="variable" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (Variable where the key pressed will be stored. This value can be of 0 to 9.)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="options" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (The options of menu delimited by '\')</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="menuwithheader">
    <xs:sequence />
    <xs:attribute name="header" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>Options of header delimited by '|'. (string)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="options" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>Options of menu delimited by '\'. (string)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="timeoutheader" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>Time for change to the next header. (string)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="timeout" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>Timeout of the function, iskeytimeout must be 1. (string)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variablereturn" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>Variable that will be stored the value pressed. (string)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="readfile">
    <xs:sequence />
    <xs:attribute name="filename" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Name of the file that will be opened)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="key" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Name of the existing key in the file)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variabledestination" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Variable where the value of the key specified in parameter key will be stored)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="editfile">
    <xs:sequence />
    <xs:attribute name="filename" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Name of the file that will be opened or created)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="key" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Name of existing or new key in the file)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="value" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Value of the key specified in parameter key)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="integeroperator">
    <xs:sequence />
    <xs:attribute name="operator" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Operator can be: '++' to increment number in + 1 or '--' to decrement number in -1)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variablesource" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (Variable will be incremented or decremented)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="adjustdatetime">
    <xs:sequence />
    <xs:attribute name="datetime" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Date time in the specified format. The format must be: 'yyyyMMddhhmmss')</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="getdatetime">
    <xs:sequence />
    <xs:attribute name="format" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (The format for the captured date time. yy:year with four digits; y:year with two digits; M:month with two digits; d:day with two digits; h:hour with two digits; m:minute with two digits; second:second with two digits. The other characters will be inserted automatically. Ex: "Date: dd/MM/yy")</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variabledestination" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Variable where the formatted date time value will be stored)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="checkpaperout">
    <xs:sequence />
    <xs:attribute name="variablereturn" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (0:paper out 1:it has paper)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="mathematicaloperation">
    <xs:sequence />
    <xs:attribute name="firstvalue" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (float) or  integer (The first value of the mathematical operation)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="operator" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Operator can be: +,-,*,/,%,^)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="secondvalue" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (float) or  integer (The second value of the mathematical operation)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variabledestination" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (float) or  integer (Variable where the result of mathematical operation between firstvalue and secondvalue will be stored)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="joinstring">
    <xs:sequence />
    <xs:attribute name="firstvalue" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (The value that will be joined with secondvalue)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="secondvalue" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (The value that will be joined with firstvalue)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variabledestination" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Variable where the result of the joining of the firstvalue with secondvalue will be stored)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="deletefile">
    <xs:sequence />
    <xs:attribute name="filename" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Name of the file that will be deleted of the terminal's memory)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="printbarcode">
    <xs:sequence />
    <xs:attribute name="number" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Number of the barcode that will be printed)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="horizontal" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (Set this parameter to 1 if you want to print the barcode on horizontal position.)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="waitkeytimeout">
    <xs:sequence />
    <xs:attribute name="seconds" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (Time that the instruction will wait)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="execute">
    <xs:sequence />
    <xs:attribute name="filename" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Name of the compiled PosXml application that will be executed)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="while">
    <xs:choice maxOccurs="unbounded">
      <xs:group ref="comandos" />
    </xs:choice>
    <xs:attribute name="variable" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string or integer (Variable for comparison)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="operator" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Operator can be: lessthan,greaterthan,equalto,notequalto,greaterthanorequalto,lessthanorequalto)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="value" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string or integer (Value for comparison)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="break">
    <xs:sequence />
  </xs:complexType>
  <xs:complexType name="openserialport">
    <xs:sequence />
    <xs:attribute name="port" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (The name of the serial port can be: COM1,COM2,COM3,COM4,COM5,COM6)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="rate" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Rate of serial port can be: 300,600,1200,2400,4800,9600,19200,38400,57600,115200,12000,14400,28800,33600)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="configuration" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (The configuration of serial port. can be: A7E1,A7N1,A7O1,A8E1,A8N1,A8O1)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variablereturn" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (-2: incorrect configuration parameters; -1 or 0: error in serial port open; greater than 0: handle for the opened serial port)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="readserialport">
    <xs:sequence />
    <xs:attribute name="variablehandle" type="xs:string">
      <xs:annotation>
        <xs:documentation>integer (Handle for an opened serial port)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variablebuffer" type="xs:string">
      <xs:annotation>
        <xs:documentation>string (Variable where the captured buffer from serial port will be stored)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="bytes" type="xs:string">
      <xs:annotation>
        <xs:documentation>integer (Quantity of bytes that will be read of the serial port)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="timeout" type="xs:string">
      <xs:annotation>
        <xs:documentation>integer (Time that the instruction will be wait while not receiving any buffer of the serial port)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variablereturn" type="xs:string">
      <xs:annotation>
        <xs:documentation>integer (-1: timeout; greater than 0: quantity of read bytes)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="writeserialport">
    <xs:sequence />
    <xs:attribute name="variablehandle" type="xs:string">
      <xs:annotation>
        <xs:documentation>integer (Handle for an opened serial port)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="buffer" type="xs:string">
      <xs:annotation>
        <xs:documentation>string (Buffer that will be written in the serial port)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="closeserialport">
    <xs:sequence />
    <xs:attribute name="variablehandle" type="xs:string">
      <xs:annotation>
        <xs:documentation>integer (Handle for an opened serial port)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="string.length">
    <xs:sequence />
    <xs:attribute name="value" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (String that will be counted)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variablereturn" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (Variable where the length of the string will be stored)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="exit">
    <xs:sequence />
  </xs:complexType>
  <xs:complexType name="downloadfile">
    <xs:sequence />
    <xs:attribute name="filename" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (The name of the file that will be written in the terminal's memory)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="remotepath" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>(string)File name that is registered on WALK Manager</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variablereturn" type="xs:string">
      <xs:annotation>
        <xs:documentation>integer (
2: local file has the same crc of server file,
1: download success,
0: base 64 encode error,
-1: file not found or encode error,
-2: connection error in buffer send,
-3: error in receive of buffer from Walk Server,
-4: error in the packet received from Walk Server,
-5: error in connection with Walk Server,
-6: error in transfer of header or footer,
-7: error in send of download complete confirmation,
-8: unauthorized serial number)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="readfilebyindex">
    <xs:sequence />
    <xs:attribute name="filename" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Name of file that will be opened)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="index" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (The index of a key in the file. This index begin in 0 and increases in accordance to the quantity of items inserted in the file)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variablekey" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Variable where the name of the key specified in index will be stored)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variablevalue" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Variable where the value of the key specified in index will be stored)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variablereturn" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (0: item not found, 1: item found)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="diffdatetime">
    <xs:sequence />
    <xs:attribute name="firstdatetime" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Date time in specified format. The format must be: 'yyyyMMddhhmmss'. This date must be greater than seconddatetime)</xs:documentation>
      </xs:annotation>
      </xs:attribute>
      <xs:attribute name="seconddatetime" type="xs:string" use="required">
        <xs:annotation>
          <xs:documentation>string (Date time in specified format. The format must be: 'yyyyMMddhhmmss')</xs:documentation>
        </xs:annotation>
      </xs:attribute>
      <xs:attribute name="variablereturn" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (The difference in seconds between two specified dates)</xs:documentation>
      </xs:annotation>
      </xs:attribute>
  </xs:complexType>
  <xs:complexType name="displaybitmap">
    <xs:sequence />
    <xs:attribute name="filename" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (The file name of the bitmap that will be shown in the terminal's display)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variablereturn" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (1: bitmap display success; 0: bitmap file not found; -1: invalid bitmap size; -2: bitmap is not monochrome)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="printbitmap">
    <xs:sequence />
    <xs:attribute name="filename" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (The file name of the bitmap that will be printed)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variablereturn" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (1: bitmap print success; 0: bitmap file not found; -1: invalid bitmap size; -2: bitmap is not monochrome)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="readkey">
    <xs:sequence />
    <xs:attribute name="miliseconds" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (Time that the instruction will wait)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variablereturn" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Key pressed by user. The default keys are: KEY_0,KEY_1,KEY_2,KEY_3,KEY_4,KEY_5,KEY_6,KEY_7,KEY_8,KEY_9,KEY_POUND,KEY_STAR,KEY_CLEAR,KEY_CANCEL,KEY_ENTER. The optional keys can be: of KEY_EXTRA1 up to KEY_EXTRA99.)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="unzipfile">
    <xs:sequence />
    <xs:attribute name="filename" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (The filename of the zipped file)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variablereturn" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (0: unzip success, -1: unzip error)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="else">
    <xs:sequence />
  </xs:complexType>
  <xs:complexType name="integerconvert">
    <xs:sequence />
    <xs:attribute name="number" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (Number that will be converted.)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="base" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (2:binary, 8:octal, 16:hexadecimal)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="sizereturn" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (Size of result. If the converted number is less, it will be padded with zeros on the left.)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variablereturn" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Variable where the converted number will be stored)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="iso8583.initfieldtable">
    <xs:sequence />
    <xs:attribute name="filename" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Name of the file that contains the format and size of all 128 field of ISO8583 especification.)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variablereturn" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (0: table initialized, -802: error in table initialize)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="iso8583.initmessage">
    <xs:sequence />
    <xs:attribute name="format" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Message format. Can be: "ASCII" or "BCD")</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="id" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Message identifier with a four digits, for example: "0200" ou "0400")</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variablemessage" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Variable where the ISO8583 message will be stored)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variablereturn" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (0: message initialized, -803: buffer overrun, -801: invalid parameter)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="iso8583.analyzemessage">
    <xs:sequence />
    <xs:attribute name="format" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Message format. Can be: "ASCII" or "BCD")</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="size" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (Message size)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variablemessage" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Variable where the message is stored)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variableid" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Variable where the message id will be stored)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variablereturn" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (0: message analyzed, -806: error in message analyze)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="iso8583.endmessage">
    <xs:sequence />
    <xs:attribute name="variablesize" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (Variable where the message size will be stored)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variablereturn" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (0: message finished, -803: buffer overrun, -802: function error)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="iso8583.putfield">
    <xs:sequence />
    <xs:attribute name="fieldnumber" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (Number of field that will be put in the message. Can be of 2 to 128)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="type" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Type of field that will be put in the message. Can be : "string" or "integer")</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="value" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string or integer (Field value)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variablereturn" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (0: success, -801: invalid parameter, -802: function error , -803: buffer overrun, -804: field error)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="iso8583.getfield">
    <xs:sequence />
    <xs:attribute name="fieldnumber" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (Number of field that will be got from the message. Can be of 2 to 128)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="type" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Type of field that will be got from the message. Can be : "string" or "integer")</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variablevalue" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string or integer (Variable where the field value will be stored)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variablereturn" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (0: success, -801: invalid parameter, -802: function error , -803: buffer overrun, -805: no field, -806: msg error)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="string.charat">
    <xs:sequence />
    <xs:attribute name="string" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (A string)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="character_index" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (A number that specifies the index position in the string)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variablereturn" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Character from specified position)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="string.trim">
    <xs:sequence />
    <xs:attribute name="string" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (A string)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variablereturn" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (A string without leading and trailing spaces)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="string.find">
    <xs:sequence>
    </xs:sequence>
    <xs:attribute name="string" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (The string to search)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="substring" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (The value to search for in the string)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="start" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (A number that specifies the index position in the string)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variablereturn" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (-1: substring not found, > -1: zero-based index into substring found)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="string.replace">
    <xs:sequence />
    <xs:attribute name="original_string" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (The original string)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="old_substring" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (The value that is going to be replaced)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="new_substring" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (The value that will replace oldvalue)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variablereturn" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Variable where the original_string with old_substring replaced will be stored)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="string.elements">
    <xs:sequence />
    <xs:attribute name="string" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (A string that will be splitted)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="delimiter" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (The string value to search for in the string. If this string is found, it will be used to split the specified string in several elements)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variablereturn" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (The number of elements)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="string.insertat">
    <xs:sequence />
    <xs:attribute name="string" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (A string that will be splitted)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="string_to_be_inserted" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (The string to be inserted into the original string)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="element_index" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (A number that specifies the index position of an element)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="delimiter" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (The string value to search for in the string. If this string is found, it will be used to split the specified string in several elements)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variablereturn" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (The string with the specified element inserted)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="string.replaceat">
    <xs:sequence />
    <xs:attribute name="string" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (A string that will be splitted)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="new_element" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (The string to be inserted into the original string)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="element_index" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (A number that specifies the index position of an element)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="delimiter" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (The string value to search for in the string. If this string is found, it will be used to split the specified string in several elements)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variablereturn" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (The string with the specified element replaced)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="string.elementat">
    <xs:sequence />
    <xs:attribute name="string" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (A string that will be splitted)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="element_index" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (A number that specifies the index position of an element)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="delimiter" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (The string value to search for in the string. If this string is found, it will be used to split the specified string in several elements)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variablereturn" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (The specified element)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="string.removeat">
    <xs:sequence />
    <xs:attribute name="string" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (A string that will be splitted)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="element_index" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (A number that specifies the index position of an element)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="delimiter" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (The string value to search for in the string. If this string is found, it will be used to split the specified string in several elements)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variablereturn" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (The string with the specified element replaced)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="string.substring">
    <xs:sequence />
    <xs:attribute name="string" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (A string that will be splitted)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="start" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (A number that specifies the index position in the string)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="length" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (Specifies the length of the new string)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variablereturn" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (The new string returned from the function)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="network.send">
    <xs:sequence />
    <xs:attribute name="buffer" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (The buffer that will be sended to host)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="size" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (The size of buffer that will be sended)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variablereturn" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (1: success, 0: send buffer error)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="network.receive">
    <xs:sequence />
    <xs:attribute name="variablebuffer" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Variable that will receive the buffer from connected host)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="maxsize" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (The size of buffer that we want to receive)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variablereceivedbytes" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (The quantity of bytes received from host)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variablereturn" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (1: success, 0: receive buffer error)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="network.wifi_scan">
    <xs:sequence />
    <xs:attribute name="timeout" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (Variable that defines, in miliseconds, the timeout to to scan for APs)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="aps" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Scan result variable with the format "SSID="Authentication"\n...")</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variablereturn" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (-1: Interface not found; -2: Problem to search, maybe driver is not ready yet; -3: Not Supported; >= 0: Success, number of APs up to 25 results)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="system.restart">
    <xs:sequence>
    </xs:sequence>
  </xs:complexType>
  <xs:complexType name="filesystem.filesize">
    <xs:sequence />
    <xs:attribute name="filename" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Name of a file)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variablereturn" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (Size of file in bytes)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="filesystem.space">
    <xs:sequence />
    <xs:attribute name="dir" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (A directory. Can be: 'I:' or 'F:')</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="type" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Information about the terminal's memory. Can be: 'free','used','total' ou 'countfiles')</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variablereturn" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (Space in bytes or number of files)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="filesystem.listfiles">
    <xs:sequence />
    <xs:attribute name="dir" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (A directory. Can be: 'I:' or 'F:')</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="listfilename" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Name of file that will be saved with the list of files in the specified directory.)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variablereturn" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>inteiro (-1: empty directory, 0: list file saved)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="filesystem.renamefile">
    <xs:sequence />
    <xs:attribute name="oldname" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Name of the file on the device's memory).</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="newname" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (New name for this file)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variablereturn" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>inteiro
0: OK, file renamed.
-1: File does not exist.
        </xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="network.cloudwalkhandshake">
    <xs:sequence />
    <xs:attribute name="variablereturn" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>Variable which will store the result of the operation, where:
1: Success.
0: Failed.(integer).
        </xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="xml.getelement">
    <xs:sequence />
    <xs:attribute name="filename" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>Name of the file thats is saved on terminal's memory(string).</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="parentnode" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>Name of the 'root' tag we're looking for(string).</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="childnode" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>Name of the 'child' node that we're looking for(string).</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variablevalue" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>Variable that will store the content of the 'child' node, in case of successful(string).</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variablereturn" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>Variable that will store the result of the command, where: 1: Command executed successfully.  0: Node 'root', node 'child' or value of the 'child' node was not found in the xml.  -1: Error trying to open the xml file.  -2: Error parsing the xml file. (integer) </xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="json.getelement">
    <xs:sequence />
    <xs:attribute name="filename" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>Name of the file thats is saved on terminal's memory(string).</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="jsonstring" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>Name of the json string we're looking for(string).</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="jsonvalue" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>Variable that will store the content of the json value, in case of successful(string).</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variablereturn" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>
          Variable that will store the result of the command, where:
          1: Command executed successfully.
          0: json string was not found on the json.
          -1: Error trying to open the json file.
          -2: Error trying to extract data from the file(json value not found).
          -3: Error parsing the json file.
          -4: Error json object not found.
        </xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="convert.toint">
    <xs:sequence />
    <xs:attribute name="number" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Number that will be converted)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="base" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (2:binary, 10:decimal, 16:hexadecimal)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variablereturn" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (Variable where the converted number will be stored)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="predial">
    <xs:sequence />
    <xs:attribute name="option" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (:1 This command realizes a pre-dial connection. :2 This command checks if the dial process is complete.)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variablestatus" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (Dial status. :0 Success :-1 Error in dial :-2 Invalid value in option)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="network.checkgprssignal">
    <xs:sequence />
    <xs:attribute name="variablestatus" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (Percentage of signal strength.)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="system.checkbattery">
    <xs:sequence />
    <xs:attribute name="variablestatus" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (Percentage of battery remaining.)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="network.ping">
    <xs:sequence />
    <xs:attribute name="variablereturn" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (:0 Success. :-1 Error in connection with server. :-2 Send fail.)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="host" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>(string)IP or domain name that we want to perform a ping</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="system.beep">
    <xs:sequence />
  </xs:complexType>
  <xs:complexType name="system.readcard">
    <xs:sequence />
    <xs:attribute name="keyvariable" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Key pressed by user. The default keys are: KEY_0, KEY_1, KEY_2, KEY_3, KEY_4, KEY_5, KEY_6, KEY_7, KEY_8, KEY_9, KEY_CLEAR, KEY_CANCEL, KEY_ENTER. The optional keys can be: of KEY_EXTRA1 up to KEY_EXTRA99.)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="cardvariable" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (The variable where store card value.)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="timeout" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (Time that the instruction will wait.)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variablereturn" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (:0 Pressed key or read card with success. :-1 Error in read card. :-2 The timeout it's over and any action happens. EMV: Card read with sucess: 1, Errors: > 1)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="system.inputtransaction">
    <xs:sequence />
    <xs:attribute name="keyvariable" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Key pressed by user. The default keys are: KEY_0, KEY_1, KEY_2, KEY_3, KEY_4, KEY_5, KEY_6, KEY_7, KEY_8, KEY_9, KEY_CLEAR, KEY_CANCEL, KEY_ENTER. The optional keys can be: of KEY_EXTRA1 up to KEY_EXTRA99.)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="cardvariable" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (The variable where store card value.)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="timeout" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (Time that the instruction will wait.)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variablereturn" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (:0 Pressed key or read card with success. :-1 Error in read card. :-2 The timeout it's over and any action happens. EMV: Card read with sucess: 1, Errors: > 1)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="keyboard" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (:0 Keyboard disable, only KEY_CANCEL return. :1 Keyboard enable, return all keys)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="inputtype" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (:1 Banda :2 Chip :3 CTLS :4 Keyboard :5 Touch)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="system.backlight">
    <xs:sequence />
    <xs:attribute name="level" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (Level of the backlight in percents, a range from 0 - 100)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variablereturn" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (Success: 0, Error: -1)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="system.update">
    <xs:sequence />
    <xs:attribute name="file" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation> (string) File that was downloaded and is going to be used on the update.  For Verifone it is a single zip file. For Ingenico it is a comma separated file containing all the components that must be updated.  </xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variablereturn" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation> (integer) Return code -1: Internal error.  Otherwise the device will restart and run the new software.  </xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="system.qrcode">
    <xs:sequence />
    <xs:attribute name="filename" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>(string) Name of the bitmap qrcode file to be generated.</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="input" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>(string) Data to be encoded on the qrcode.</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="size" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>(string) Size of the qrcode:
x1: 33x33 pixels (can be used on the display)
x2: 66x66 pixels (can be used on the printer)
x3: 99x99 pixels (can be used on the printer)
        </xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="version" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>(string) Version of the qrcode. If you want to print the qrcode you need to use: from 1 to 4, if you want to show on display, use: from 1 to 6.</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="network.hostdisconnect">
    <xs:sequence />
  </xs:complexType>
  <xs:complexType name="iso8583.transactmessage">
    <xs:sequence />
    <xs:attribute name="channel" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (
"NONE": it doesn't add any size
"NAC" : size of 2 binary bytes (x01 x00 ou 0000-0001 0000-0000)
"NCC" : size of 2 binary bytes in BCD format (x02 x56)
"RAW" : size of 4 binary bytes (x00 x00 x01 x00 ou 0000-0000 0000-0000 0000-0001 0000-0000)
"ASCII": size of 4 binary bytes in ASCII format (x30 x32 x35 x36 ou "0256"))</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="header" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Header which will be add to the beggining of iso message)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="trailler" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Trailer which will be add in the end of iso message)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="isomsg" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (ISO message)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variableresponse" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (ISO message replied by the host)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variablereturn" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (
>0 : Size of replied message
-1 : Channel unknown or not implemented
-2 : Didn't get connection to the host or dial failed
-3 : Fail in the message sending
-4 : Fail in the receiving of message size
-5 : Fail in the receiving of message replied)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="iso8583.transactmessagesubfield">
    <xs:sequence />
    <xs:attribute name="channel" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (
"NONE": it doesn't add any size
"NAC" : size of 2 binary bytes (x01 x00 ou 0000-0001 0000-0000)
"NCC" : size of 2 binary bytes in BCD format (x02 x56)
"RAW" : size of 4 binary bytes (x00 x00 x01 x00 ou 0000-0000 0000-0000 0000-0001 0000-0000)
"ASCII": size of 4 binary bytes in ASCII format (x30 x32 x35 x36 ou "0256"))</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="header" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Header which will be add to the beggining of iso message)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="trailler" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Trailer which will be add in the end of iso message)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variablereturn" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (
>0 : Size of replied message
-1 : Channel unknown or not implemented
-2 : Didn't get connection to the host or dial failed
-3 : Fail in the message sending
-4 : Fail in the receiving of message size
-5 : Fail in the receiving of message replied)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="network.start">
    <xs:sequence />
    <xs:attribute name="variablereturn" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer, return of the function:
1: OK, modem initialized.
&lt; 1: error.
        </xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="notification.setup">
    <xs:sequence />
  </xs:complexType>
  <xs:complexType name="notification.receive">
    <xs:sequence />
    <xs:attribute name="variablepayload" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>Variable that will store the notification message received (string)
        </xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variablereturn" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>Variable that will store the return of the function, where: 1:  OK, message received.  &lt;= 0:  Nothing received from server(integer).
        </xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="smartcard.insertedcard">
    <xs:sequence />
    <xs:attribute name="slot" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (Main = 1 , sam1 = 2 , sam2 = 3, sam3 = 4, sam4 = 5)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variablereturn" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (-2: The card hasn't been inserted, -1: invalid slot, 1: the card has been inserted in the terminal's reader.)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="smartcard.startreader">
    <xs:sequence />
    <xs:attribute name="slot" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (Main = 1 , sam1 = 2 , sam2 = 3, sam3 = 4, sam4 = 5)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variablereturn" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (-2: reader initialize error or card read error, -1: invalid slot, 1: terminal's reader started and ATR sent with sucess.)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="smartcard.transmitAPDU">
    <xs:sequence />
    <xs:attribute name="slot" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (main = 1 , sam1 = 2 , sam2 = 3, sam3 = 4, sam4 = 5)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="header" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (A hexadecimal APDU command composite by CLA + INS + P1 + P2. It's a mandatory field. Example: 'B00C0000')</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="LC" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (A hexadecimal size of datafield parameter. It's an optional field. If we don't want to use this parameter, it's necessary set the field with '00'. For example, If the datafield has 10 bytes of size, it's necessary set this parameter with '0A'.)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="datafield" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (A hexadecimal APDU command composite by additional information. It's an optional field. If we don't want to use it, we have to set the field with '00'.)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="LE" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (A hexadecimal response size. It's an optional field. If we don't want to use it, we have to set the field with '00'. If we've a response size greater than 2 bytes (SW1 and SW2), we must have to specify the response size on this field.)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variabledatafieldresponse" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (A variable will receive the response of an APDU command, It's a hexadecimal representation.)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variableSW" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (A variable which will contain the mandatory 2 bytes hexadecimal for a response to an APDU command.)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variablereturn" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (-2: error to send a command for the card, -1: invalid slot, 1: sent command with success.)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="smartcard.closereader">
    <xs:sequence />
    <xs:attribute name="slot" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (Main = 1 , sam1 = 2 , sam2 = 3, sam3 = 4, sam4 = 5)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variablereturn" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (-1: Invalid slot, 1: closed reader with success.)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="string.tohex">
    <xs:sequence>
    </xs:sequence>
    <xs:attribute name="string" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (The string which will be converted.)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variablereturn" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (A string parameter converted from a ASCII to a hexadecimal representation. It'll have the double in size of original string.)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="string.fromhex">
    <xs:sequence>
    </xs:sequence>
    <xs:attribute name="string" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (A hexadecimal representation of string.)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variablereturn" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (A string parameter converted from hexadecimal to an ASCII representation. It'll have the half in size of original hexadecimal representation.)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="crypto.encryptdecrypt">
    <xs:sequence>
    </xs:sequence>
    <xs:attribute name="message" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (A message in a hexadecimal representation to be encrypted or decrypted. In the encrypt or decrypt process, we must have to use only blocks with 8 bytes. If you have a message greater than 8 bytes, you'll need to split in blocks of 8 bytes each, for the encrypt or decrypt process.)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="key" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (It's a cryptographic key, in a hexadecimal representation. For DES algorithm, the key has 8 bytes or 16 characters in a hexadecimal representation. For 3DES algorithm, the key has 16 bytes or 32 characters in a hexadecimal representation. For 3DESTripleLength, the key has 24 bytes or 48 characters in a hexadecimal representation and for NEWDES, the key has 15 bytes or 30 characters in a hexadecimal representation.)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="cryptotype" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (The algorithm to be used. Could be: 'DES', '3DES', '3DESTripleLength', 'NEWDES'.)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="type" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (0: Encrypt the message 1: Decrypt the message)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variablereturn" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (The message encrypted or decrypted in a hexadecimal representation.)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="crypto.lrc">
    <xs:sequence>
    </xs:sequence>
    <xs:attribute name="buffer" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (A buffer in a hexadecimal representation that will be used to generate de LRC byte.)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="size" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (Number of bytes in buffer. For example, the size of '0A0A', is 2 bytes.)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variablereturn" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Variable that will store the byte LRC in a hexadecimal representation.)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="crypto.xor">
    <xs:sequence>
    </xs:sequence>
    <xs:attribute name="buffer1" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (A buffer in a hexadecimal representation that will be used in the XOR operation.)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="buffer2" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (A buffer in a hexadecimal representation that will be used in the XOR operation.)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="size" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (Number of bytes in buffer. For example, the size of '0A0A', is 2 bytes.)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variablereturn" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Variable that will store the result of XOR operation between buffer1 and buffer2 in a hexadecimal representation.)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="crypto.crc">
    <xs:sequence>
    </xs:sequence>
    <xs:attribute name="buffer" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (A buffer in a hexadecimal representation that will be used in the CRC calculation, or file).</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="size" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (Number of bytes in buffer. For example, the size of '0A0A', is 2 bytes, if file use 0).</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="type" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (CRC type, CRC-CCITT support).</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variablereturn" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (Variable that will store the result of CRC calculation).</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="system.info">
    <xs:sequence>
    </xs:sequence>
    <xs:attribute name="type" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (info type, simid or macaddress).</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variablereturn" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (info)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="system.gettouchscreen">
    <xs:sequence>
    </xs:sequence>
    <xs:attribute name="axisx" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (X axis coordinate where display was pressed.)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="axisy" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (Y axis coordinate where display was pressed.)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variablereturn" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (1: Display was pressed. 0: Display was not pressed.)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="system.gettouchscreenkeyboard">
    <xs:sequence>
    </xs:sequence>
    <xs:attribute name="axisx" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (X axis coordinate where display was pressed.)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="axisy" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (Y axis coordinate where display was pressed.)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="timeout" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (Timeout of the function)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variablekey" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Key of the keyboad pressed)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variablereturn" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (1: Display was pressed. 0: Display was not pressed. 2: Key of the keyboad pressed. :-1: timeout)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="pinpad.open">
    <xs:sequence>
    </xs:sequence>
    <xs:attribute name="type" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (0: internal pinpad 1: external pinpad.)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variableserialnumber" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Variable that will store the serial number of the pinpad that has just been opened.)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variablereturn" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (0: Pinpad connected. -1: Pinpad not connected.)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="pinpad.display">
    <xs:sequence>
    </xs:sequence>
    <xs:attribute name="message" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Message that will be displayed on display.)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="pinpad.getkey">
    <xs:sequence>
    </xs:sequence>
    <xs:attribute name="message" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Message that will be displayed on display.)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="timeout" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (Timeout in seconds that the instruction will waiting before continue execution.)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variablereturn" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (-1: timeout, KEY_ENTER, KEY_CANCEL, KEY_CLEAR, KEY_EXTRAS)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="pinpad.getpindukpt">
    <xs:sequence>
    </xs:sequence>
    <xs:attribute name="message" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Message that will be displayed on display.)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="type" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (0: DES 1: 3DES.)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="pan" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Account number.)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="maxlen" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (Maximum number of characters typed in the pin.)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variablereturnpin" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Pin encrypted DUKPT DES or 3DES.)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variablereturnksn" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (KSN.)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variablereturn" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (0: OK, -1: COMM error, -2: Cancel, -3: Error pin)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="pinpad.loadipek">
    <xs:sequence>
    </xs:sequence>
    <xs:attribute name="ipek" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Initial key in hex ascii format 16 or 32 characters.)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="ksn" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Initial ksn in hex ascii format 20 characters.)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="type" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (0: DES 1: 3DES.)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variablereturn" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (0: OK, -1: Error.)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="pinpad.close">
    <xs:sequence>
    </xs:sequence>
    <xs:attribute name="message" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Default message that will be displayed on display of pinpad.)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="emv.open">
    <xs:sequence>
    </xs:sequence>
    <xs:attribute name="variablereturn" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (0: OK, 14: Already initialized, 16: Error.)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="mkslot" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (Slot of the terminal where is recorded the master key) .</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="pinpadtype" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (Type of pinpad utilized, external 2 or internal 1).</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="pinpadwk" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Working Key used in the session with pinpad) .</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="showamount" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (defines if the library shows amount or not, 1 - show 0 - hide) .</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
	<xs:complexType name="emv.close">
		<xs:sequence>
		</xs:sequence>
		<xs:attribute name="variablereturn" type="xs:string" use="required">
			<xs:annotation>
				<xs:documentation>integer (0: OK, >0: Error.)</xs:documentation>
			</xs:annotation>
		</xs:attribute>
	</xs:complexType>
  <xs:complexType name="emv.settimeout">
    <xs:sequence />
    <xs:attribute name="seconds" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (Time in seconds).</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variablereturn" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (0: OK, 15: Library EMV not initialized).</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="emv.loadtables">
    <xs:sequence />
    <xs:attribute name="acquirer" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (Identification number of acquirer).</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variablereturn" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (0: OK, 15: Library EMV not initialized, 30: Comunication error (busy), 31: Comunication error (Desconected), 10: Error on startup of the table, 21: Error on write of the table, -1: File .dat not found for this acquirer).</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="emv.cleanstructures">
    <xs:sequence />
  </xs:complexType>
  <xs:complexType name="emv.adddata">
    <xs:sequence />
    <xs:attribute name="type" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Type of parameter).</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="parameter" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Parameter name, that will be assigned in data).</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="value" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Value that will be assigned to the specified parameter).</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variablereturn" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (0: OK, -1: Error, type, key or value does not exist).</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="emv.getinfo">
    <xs:sequence />
    <xs:attribute name="type" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (parameter type).</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="parameter" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Parameter Name to search).</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="value" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Parameter value sought).</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="emv.inittransaction">
    <xs:sequence />
    <xs:attribute name="variablereturn" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (0: OK, 11: Invalid parameter, 12: Timeout, 13: Canceled by the operator, 15: Library EMV not initialized, 40: Internal error, 41: Error reading the magnetic stripe, 43: Card is not inserted).</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="emv.processtransaction">
    <xs:sequence />
    <xs:attribute name="variablereturn" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (0: OK, 11: Ivalid parameter, 12: Timeout, 13: Operation PIN entry canceled by user, 15: Library EMV not initialized, 19: Absence of data mandatory for processing, 40: Internal error, 41: Error reading the magnetic stripe, 43: Card is not inserted).
        </xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="ctls" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (defines if transaction will be Contact Less or not, 1 - CTLS 0 - With contact) .</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="emv.finishtransaction">
    <xs:sequence />
    <xs:attribute name="variablereturn" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (0: OK, 11: Invalid parameter, 12: Timeout, 40: Internal error, 43: Card removed in the middle of the operation).
        </xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="emv.removecard">
    <xs:sequence />
    <xs:attribute name="variablereturn" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (0: OK, 12: Timeout, 13: Canceled, 15: Library EMV not initialized).</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="parseticket">
    <xs:sequence />
    <xs:attribute name="productmenu" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Name of product that appear in menu).</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="ticket" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Ticket not parsed).</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="menssage" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Message not parsed).</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="literal" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Literal in Walk file DB).</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variablereturn" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Ticket parsed).</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="file.open">
    <xs:sequence />
    <xs:attribute name="mode" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string ("w" for write, "r" for read and "a" for append mode).</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="filename" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Name of file that will be opened).</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variablehandle" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (-1: file not opened, >-1: Handle for opened file.).</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="file.close">
    <xs:sequence />
    <xs:attribute name="handle" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (Handle of file that will be closed).</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="file.read">
    <xs:sequence />
    <xs:attribute name="handle" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (Handle of file for read).</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="size" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (Number of bytes that we want to read from file).</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variablebuffer" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Variable that will store the bytes that was read in format hex ascii).</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variablereturn" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (Variable that will store the number of bytes read).</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="file.write">
    <xs:sequence />
    <xs:attribute name="handle" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (Handle of file that will be recorded).</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="size" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (Number of bytes that we want to record on file).</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="buffer" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Buffer in format hex ascii that will be recorded on file).</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="file.concat">
    <xs:sequence />
    <xs:attribute name="config" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Path to configuration file, not required).</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="out" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Path to file merged).</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variablereturn" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (0 - Success; -1 Fail, check out.status).</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="input.getvalue">
    <xs:sequence />
    <xs:attribute name="linecaption" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (display of line of caption).</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="columncaption" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (Display column of caption).</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="caption" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (A message that will be displayed).</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="lineinput" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (Display line of numbers captured).</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="columninput" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (Display column of numbers captured).</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="minimun" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (Minimum size of the string we are waiting).</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="maximum" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (Maximum size of the string we are waiting).</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="allowsempty" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Boolean Operator that allows return if any key has been not pressed. true or false).</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variablereturn" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Return of command).</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="string.pad">
    <xs:sequence />
    <xs:attribute name="origin" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (The string that receive the pad).</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="destination" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (The variable that receive the string with pad).</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="character" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (The character that will be use on the pad).</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="length" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>inteiro (Size of string with the pad).</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="align" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Alignment of the pad, can be left, right or center).</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="time.calculate">
    <xs:sequence />
    <xs:attribute name="operation" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (sum, less, difference).</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="type" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Time to calculate(to sum or less), years, months, days, hours, minutes, seconds).</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="date" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Variable date to be changed or used as a comparison(if operation difference)).</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="greaterdate" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Greater variable date to be used as a comparison(if operation difference)).</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="value" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (Value years, months, days, hours, minutes or seconds to be added or subtracted).</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variablereturn" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (If difference is operation return the value of the difference in seconds; If operation is sum or less will return 0 success, -1 error).</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="paymentchannel.receive">
    <xs:sequence />
    <xs:attribute name="socket" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (Payment channel SSL socket)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
	<xs:attribute name="compressed" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (1:receive deflated messages 0: non compressed messages)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
	<xs:attribute name="timeout" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (Timeout in seconds to receive a message)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variableresponse" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string(Variable with the host response)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variablereturn" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (Number of bytes received from the host or -1 if timeout. It could be 0 and variableresponse is equal 'OPCODE_PING')</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="paymentchannel.send">
    <xs:sequence />
    <xs:attribute name="socket" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (Payment channel SSL socket)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
	<xs:attribute name="compressed" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (1:send deflated messages 0: non compressed messages)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="msg" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>string (Variable with the message to be sent to the host)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="paymentchannel.connect">
    <xs:sequence />
	<xs:attribute name="variablecompressed" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (Variable that return from the handshake that indicates if the messages should be sent or received using, 1: deflated messages or 0: non compressed messages)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
    <xs:attribute name="variablereturn" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (Variable with the SSL socket to be used in the other paymentchannel instructions or error)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
  <xs:complexType name="paymentchannel.close">
    <xs:sequence />
	<xs:attribute name="socket" type="xs:string" use="required">
      <xs:annotation>
        <xs:documentation>integer (Payment channel SSL socket to be closed)</xs:documentation>
      </xs:annotation>
    </xs:attribute>
  </xs:complexType>
</xs:schema>
EOF
end
