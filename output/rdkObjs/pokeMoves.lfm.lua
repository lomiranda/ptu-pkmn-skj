require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmMoves()
    __o_rrpgObjs.beginObjectsLoading();

    local obj = gui.fromHandle(_obj_newObject("form"));
    local self = obj;
    local sheet = nil;

    rawset(obj, "_oldSetNodeObjectFunction", rawget(obj, "setNodeObject"));

    function obj:setNodeObject(nodeObject)
        sheet = nodeObject;
        self.sheet = nodeObject;
        self:_oldSetNodeObjectFunction(nodeObject);
    end;

    function obj:setNodeDatabase(nodeObject)
        self:setNodeObject(nodeObject);
    end;

    _gui_assignInitialParentForForm(obj.handle);
    obj:beginUpdate();
    obj:setName("frmMoves");
    obj:setHeight(40);
    obj:setMargins({top=2, right=5, bottom=2});

    obj.rectangle1 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("transparent");
    obj.rectangle1:setStrokeColor("white");
    obj.rectangle1:setStrokeSize(1);
    obj.rectangle1:setXradius(10);
    obj.rectangle1:setYradius(10);
    obj.rectangle1:setCornerType("innerLine");
    obj.rectangle1:setStrokeDash("dash");
    obj.rectangle1:setMargins({left=5, right=5});
    obj.rectangle1:setName("rectangle1");

    obj.layout1 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.rectangle1);
    obj.layout1:setAlign("left");
    obj.layout1:setWidth(205);
    obj.layout1:setHeight(30);
    obj.layout1:setMargins({left=5, top=5, bottom=5});
    obj.layout1:setName("layout1");

    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout1);
    obj.label1:setText("Move:");
    obj.label1:setWidth(40);
    obj.label1:setFontSize(12);
    lfm_setPropAsString(obj.label1, "fontStyle",  "bold");
    obj.label1:setAlign("left");
    obj.label1:setMargins({left=5});
    obj.label1:setName("label1");
    obj.label1:setFontColor("Moccasin");

    obj.rectangle2 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout1);
    obj.rectangle2:setAlign("left");
    obj.rectangle2:setWidth(140);
    obj.rectangle2:setColor("transparent");
    obj.rectangle2:setStrokeColor("white");
    obj.rectangle2:setStrokeSize(1);
    obj.rectangle2:setXradius(10);
    obj.rectangle2:setYradius(10);
    obj.rectangle2:setCornerType("bevel");
    obj.rectangle2:setStrokeDash("dash");
    obj.rectangle2:setMargins({left=5});
    obj.rectangle2:setName("rectangle2");

    obj.edit1 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.rectangle2);
    obj.edit1:setField("moveName");
    obj.edit1:setAlign("client");
    obj.edit1:setTransparent(true);
    obj.edit1:setMargins({left=5, right=5});
    obj.edit1:setHorzTextAlign("center");
    obj.edit1:setName("edit1");
    obj.edit1:setFontColor("White");
    lfm_setPropAsString(obj.edit1, "fontStyle",  "bold");

    obj.layout2 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.rectangle1);
    obj.layout2:setAlign("left");
    obj.layout2:setWidth(165);
    obj.layout2:setHeight(50);
    obj.layout2:setMargins({top=5, bottom=5});
    obj.layout2:setName("layout2");

    obj.label2 = gui.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout2);
    obj.label2:setText("Tipo:");
    obj.label2:setWidth(40);
    obj.label2:setFontSize(12);
    lfm_setPropAsString(obj.label2, "fontStyle",  "bold");
    obj.label2:setAlign("left");
    obj.label2:setMargins({left=5});
    obj.label2:setName("label2");
    obj.label2:setFontColor("Moccasin");

    obj.rectangle3 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout2);
    obj.rectangle3:setAlign("left");
    obj.rectangle3:setWidth(100);
    obj.rectangle3:setColor("transparent");
    obj.rectangle3:setStrokeColor("white");
    obj.rectangle3:setStrokeSize(1);
    obj.rectangle3:setXradius(10);
    obj.rectangle3:setYradius(10);
    obj.rectangle3:setCornerType("bevel");
    obj.rectangle3:setStrokeDash("dash");
    obj.rectangle3:setMargins({left=5});
    obj.rectangle3:setName("rectangle3");

    obj.edit2 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.rectangle3);
    obj.edit2:setField("moveType");
    obj.edit2:setAlign("client");
    obj.edit2:setTransparent(true);
    obj.edit2:setMargins({left=5,right=5});
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setName("edit2");
    obj.edit2:setFontColor("White");
    lfm_setPropAsString(obj.edit2, "fontStyle",  "bold");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj);
    obj.button1:setAlign("right");
    obj.button1:setText("i");
    obj.button1:setHint("Informações do Move");
    obj.button1:setWidth(30);
    obj.button1:setMargins({left=10});
    obj.button1:setName("button1");

    obj.button2 = gui.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj);
    obj.button2:setAlign("right");
    obj.button2:setText("⚂");
    obj.button2:setHint("Utilizar Move");
    obj.button2:setFontColor("Orange");
    obj.button2:setWidth(30);
    obj.button2:setMargins({left=10});
    obj.button2:setName("button2");
    obj.button2:setFontSize(20);
    obj.button2:setLeft(5);
    obj.button2:setTop(5);
    obj.button2:setHeight(25);

    obj.button3 = gui.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj);
    obj.button3:setAlign("right");
    obj.button3:setText("X");
    obj.button3:setHint("Apagar Move");
    obj.button3:setWidth(30);
    obj.button3:setMargins({left=10});
    obj.button3:setName("button3");

    obj.movePopUp = gui.fromHandle(_obj_newObject("popup"));
    obj.movePopUp:setParent(obj);
    obj.movePopUp:setName("movePopUp");
    obj.movePopUp:setWidth(500);
    obj.movePopUp:setHeight(520);
    obj.movePopUp:setBackOpacity(0.5);

    obj.layout3 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.movePopUp);
    obj.layout3:setAlign("top");
    obj.layout3:setHeight(30);
    obj.layout3:setMargins({top=5, left=5});
    obj.layout3:setName("layout3");

    obj.label3 = gui.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout3);
    obj.label3:setText("Nome:");
    obj.label3:setWidth(60);
    obj.label3:setFontSize(11);
    obj.label3:setAlign("left");
    obj.label3:setMargins({left=5});
    obj.label3:setName("label3");
    obj.label3:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label3, "fontStyle",  "bold");

    obj.rectangle4 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout3);
    obj.rectangle4:setAlign("left");
    obj.rectangle4:setWidth(270);
    obj.rectangle4:setColor("transparent");
    obj.rectangle4:setStrokeColor("white");
    obj.rectangle4:setStrokeSize(1);
    obj.rectangle4:setXradius(10);
    obj.rectangle4:setYradius(10);
    obj.rectangle4:setCornerType("bevel");
    obj.rectangle4:setStrokeDash("dash");
    obj.rectangle4:setMargins({left=5});
    obj.rectangle4:setName("rectangle4");

    obj.edit3 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.rectangle4);
    obj.edit3:setField("moveName");
    obj.edit3:setAlign("client");
    obj.edit3:setTransparent(true);
    obj.edit3:setMargins({left=5, right=5});
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setName("edit3");
    obj.edit3:setFontColor("White");
    lfm_setPropAsString(obj.edit3, "fontStyle",  "bold");

    obj.label4 = gui.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout3);
    obj.label4:setText("AC:");
    obj.label4:setWidth(50);
    obj.label4:setFontSize(12);
    obj.label4:setAlign("left");
    obj.label4:setMargins({left=25});
    obj.label4:setName("label4");
    obj.label4:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label4, "fontStyle",  "bold");

    obj.rectangle5 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout3);
    obj.rectangle5:setAlign("left");
    obj.rectangle5:setWidth(50);
    obj.rectangle5:setColor("transparent");
    obj.rectangle5:setStrokeColor("white");
    obj.rectangle5:setStrokeSize(1);
    obj.rectangle5:setXradius(10);
    obj.rectangle5:setYradius(10);
    obj.rectangle5:setCornerType("bevel");
    obj.rectangle5:setStrokeDash("dash");
    obj.rectangle5:setMargins({left=5});
    obj.rectangle5:setName("rectangle5");

    obj.edit4 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.rectangle5);
    obj.edit4:setField("moveAc");
    obj.edit4:setAlign("client");
    obj.edit4:setTransparent(true);
    obj.edit4:setMargins({left=5, right=5});
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setName("edit4");
    obj.edit4:setFontColor("White");
    lfm_setPropAsString(obj.edit4, "fontStyle",  "bold");

    obj.layout4 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.movePopUp);
    obj.layout4:setAlign("top");
    obj.layout4:setHeight(30);
    obj.layout4:setMargins({top=5, left=5});
    obj.layout4:setName("layout4");

    obj.label5 = gui.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout4);
    obj.label5:setText("Adquirido:");
    obj.label5:setWidth(60);
    obj.label5:setFontSize(11);
    obj.label5:setAlign("left");
    obj.label5:setMargins({left=5});
    obj.label5:setName("label5");
    obj.label5:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label5, "fontStyle",  "bold");

    obj.rectangle6 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout4);
    obj.rectangle6:setAlign("left");
    obj.rectangle6:setWidth(270);
    obj.rectangle6:setColor("transparent");
    obj.rectangle6:setStrokeColor("white");
    obj.rectangle6:setStrokeSize(1);
    obj.rectangle6:setXradius(10);
    obj.rectangle6:setYradius(10);
    obj.rectangle6:setCornerType("bevel");
    obj.rectangle6:setStrokeDash("dash");
    obj.rectangle6:setMargins({left=5});
    obj.rectangle6:setName("rectangle6");

    obj.edit5 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.rectangle6);
    obj.edit5:setField("moveLearned");
    obj.edit5:setAlign("client");
    obj.edit5:setTransparent(true);
    obj.edit5:setMargins({left=5, right=5});
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setName("edit5");
    obj.edit5:setFontColor("White");
    lfm_setPropAsString(obj.edit5, "fontStyle",  "bold");

    obj.label6 = gui.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout4);
    obj.label6:setText("Página:");
    obj.label6:setWidth(50);
    obj.label6:setFontSize(12);
    obj.label6:setAlign("left");
    obj.label6:setMargins({left=25});
    obj.label6:setName("label6");
    obj.label6:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label6, "fontStyle",  "bold");

    obj.rectangle7 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.layout4);
    obj.rectangle7:setAlign("left");
    obj.rectangle7:setWidth(50);
    obj.rectangle7:setColor("transparent");
    obj.rectangle7:setStrokeColor("white");
    obj.rectangle7:setStrokeSize(1);
    obj.rectangle7:setXradius(10);
    obj.rectangle7:setYradius(10);
    obj.rectangle7:setCornerType("bevel");
    obj.rectangle7:setStrokeDash("dash");
    obj.rectangle7:setMargins({left=5});
    obj.rectangle7:setName("rectangle7");

    obj.edit6 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.rectangle7);
    obj.edit6:setField("movePage");
    obj.edit6:setAlign("client");
    obj.edit6:setTransparent(true);
    obj.edit6:setMargins({left=5, right=5});
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setName("edit6");
    obj.edit6:setFontColor("White");
    lfm_setPropAsString(obj.edit6, "fontStyle",  "bold");

    obj.layout5 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.movePopUp);
    obj.layout5:setAlign("top");
    obj.layout5:setHeight(30);
    obj.layout5:setMargins({left=5, top=15, right=5});
    obj.layout5:setName("layout5");

    obj.label7 = gui.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout5);
    obj.label7:setAlign("client");
    obj.label7:setText("COMBATE");
    obj.label7:setHorzTextAlign("center");
    obj.label7:setName("label7");
    obj.label7:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label7, "fontStyle",  "bold");
    obj.label7:setFontSize(18);

    obj.layout6 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.movePopUp);
    obj.layout6:setAlign("top");
    obj.layout6:setHeight(30);
    obj.layout6:setMargins({left=5, top=5});
    obj.layout6:setName("layout6");

    obj.label8 = gui.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout6);
    obj.label8:setText("Freq.:");
    obj.label8:setWidth(60);
    obj.label8:setFontSize(12);
    lfm_setPropAsString(obj.label8, "fontStyle",  "bold");
    obj.label8:setAlign("left");
    obj.label8:setMargins({left=5});
    obj.label8:setName("label8");
    obj.label8:setFontColor("Moccasin");

    obj.rectangle8 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.layout6);
    obj.rectangle8:setAlign("left");
    obj.rectangle8:setWidth(400);
    obj.rectangle8:setColor("transparent");
    obj.rectangle8:setStrokeColor("white");
    obj.rectangle8:setStrokeSize(1);
    obj.rectangle8:setXradius(10);
    obj.rectangle8:setYradius(10);
    obj.rectangle8:setCornerType("bevel");
    obj.rectangle8:setStrokeDash("dash");
    obj.rectangle8:setMargins({left=5});
    obj.rectangle8:setName("rectangle8");

    obj.edit7 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.rectangle8);
    obj.edit7:setField("moveFreq");
    obj.edit7:setAlign("client");
    obj.edit7:setTransparent(true);
    obj.edit7:setMargins({left=5,right=5});
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setName("edit7");
    obj.edit7:setFontColor("White");
    lfm_setPropAsString(obj.edit7, "fontStyle",  "bold");

    obj.layout7 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.movePopUp);
    obj.layout7:setAlign("top");
    obj.layout7:setHeight(30);
    obj.layout7:setMargins({top=5, left=5});
    obj.layout7:setName("layout7");

    obj.label9 = gui.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout7);
    obj.label9:setText("Alcance:");
    obj.label9:setWidth(60);
    obj.label9:setAlign("left");
    obj.label9:setMargins({left=5});
    obj.label9:setName("label9");
    obj.label9:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label9, "fontStyle",  "bold");

    obj.rectangle9 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.layout7);
    obj.rectangle9:setAlign("left");
    obj.rectangle9:setWidth(400);
    obj.rectangle9:setColor("transparent");
    obj.rectangle9:setStrokeColor("white");
    obj.rectangle9:setStrokeSize(1);
    obj.rectangle9:setXradius(10);
    obj.rectangle9:setYradius(10);
    obj.rectangle9:setCornerType("bevel");
    obj.rectangle9:setStrokeDash("dash");
    obj.rectangle9:setMargins({left=5});
    obj.rectangle9:setName("rectangle9");

    obj.edit8 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.rectangle9);
    obj.edit8:setField("moveRange");
    obj.edit8:setAlign("client");
    obj.edit8:setTransparent(true);
    obj.edit8:setMargins({left=5,right=5});
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setName("edit8");
    obj.edit8:setFontColor("White");
    lfm_setPropAsString(obj.edit8, "fontStyle",  "bold");

    obj.layout8 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.movePopUp);
    obj.layout8:setAlign("top");
    obj.layout8:setHeight(30);
    obj.layout8:setMargins({top=5, left=5});
    obj.layout8:setName("layout8");

    obj.label10 = gui.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout8);
    obj.label10:setText("D. Base:");
    obj.label10:setWidth(60);
    obj.label10:setAlign("left");
    obj.label10:setMargins({left=5});
    obj.label10:setName("label10");
    obj.label10:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label10, "fontStyle",  "bold");

    obj.rectangle10 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.layout8);
    obj.rectangle10:setAlign("left");
    obj.rectangle10:setWidth(160);
    obj.rectangle10:setColor("transparent");
    obj.rectangle10:setStrokeColor("white");
    obj.rectangle10:setStrokeSize(1);
    obj.rectangle10:setXradius(10);
    obj.rectangle10:setYradius(10);
    obj.rectangle10:setCornerType("bevel");
    obj.rectangle10:setStrokeDash("dash");
    obj.rectangle10:setMargins({left=5});
    obj.rectangle10:setName("rectangle10");

    obj.edit9 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.rectangle10);
    obj.edit9:setField("moveDB");
    obj.edit9:setAlign("client");
    obj.edit9:setTransparent(true);
    obj.edit9:setMargins({left=5, right=5});
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setName("edit9");
    obj.edit9:setFontColor("White");
    lfm_setPropAsString(obj.edit9, "fontStyle",  "bold");

    obj.label11 = gui.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout8);
    obj.label11:setText("Set Dmg:");
    obj.label11:setWidth(60);
    obj.label11:setWordWrap(true);
    lfm_setPropAsString(obj.label11, "fontStyle",  "bold");
    obj.label11:setAlign("left");
    obj.label11:setMargins({left=15});
    obj.label11:setName("label11");
    obj.label11:setFontColor("Moccasin");

    obj.rectangle11 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.layout8);
    obj.rectangle11:setAlign("left");
    obj.rectangle11:setWidth(160);
    obj.rectangle11:setColor("transparent");
    obj.rectangle11:setStrokeColor("white");
    obj.rectangle11:setStrokeSize(1);
    obj.rectangle11:setXradius(10);
    obj.rectangle11:setYradius(10);
    obj.rectangle11:setCornerType("bevel");
    obj.rectangle11:setStrokeDash("dash");
    obj.rectangle11:setMargins({left=5});
    obj.rectangle11:setName("rectangle11");

    obj.edit10 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.rectangle11);
    obj.edit10:setField("moveSetDmg");
    obj.edit10:setAlign("client");
    obj.edit10:setTransparent(true);
    obj.edit10:setMargins({left=5, right=5});
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setName("edit10");
    obj.edit10:setFontColor("White");
    lfm_setPropAsString(obj.edit10, "fontStyle",  "bold");

    obj.layout9 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.movePopUp);
    obj.layout9:setAlign("top");
    obj.layout9:setHeight(30);
    obj.layout9:setMargins({top=5, left=5});
    obj.layout9:setName("layout9");

    obj.label12 = gui.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout9);
    obj.label12:setText("Dano:");
    obj.label12:setWidth(60);
    obj.label12:setAlign("left");
    obj.label12:setMargins({left=5});
    obj.label12:setName("label12");
    obj.label12:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label12, "fontStyle",  "bold");

    obj.rectangle12 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.layout9);
    obj.rectangle12:setAlign("left");
    obj.rectangle12:setWidth(160);
    obj.rectangle12:setColor("transparent");
    obj.rectangle12:setStrokeColor("white");
    obj.rectangle12:setStrokeSize(1);
    obj.rectangle12:setXradius(10);
    obj.rectangle12:setYradius(10);
    obj.rectangle12:setCornerType("bevel");
    obj.rectangle12:setStrokeDash("dash");
    obj.rectangle12:setMargins({left=5});
    obj.rectangle12:setName("rectangle12");

    obj.edit11 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.rectangle12);
    obj.edit11:setField("moveDamage");
    obj.edit11:setAlign("client");
    obj.edit11:setTransparent(true);
    obj.edit11:setMargins({left=5, right=5});
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setName("edit11");
    obj.edit11:setFontColor("White");
    lfm_setPropAsString(obj.edit11, "fontStyle",  "bold");

    obj.label13 = gui.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout9);
    obj.label13:setText("STAB:");
    obj.label13:setWidth(60);
    obj.label13:setWordWrap(true);
    lfm_setPropAsString(obj.label13, "fontStyle",  "bold");
    obj.label13:setAlign("left");
    obj.label13:setMargins({left=15});
    obj.label13:setName("label13");
    obj.label13:setFontColor("Moccasin");

    obj.rectangle13 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.layout9);
    obj.rectangle13:setAlign("left");
    obj.rectangle13:setWidth(160);
    obj.rectangle13:setColor("transparent");
    obj.rectangle13:setStrokeColor("white");
    obj.rectangle13:setStrokeSize(1);
    obj.rectangle13:setXradius(10);
    obj.rectangle13:setYradius(10);
    obj.rectangle13:setCornerType("bevel");
    obj.rectangle13:setStrokeDash("dash");
    obj.rectangle13:setMargins({left=5});
    obj.rectangle13:setName("rectangle13");

    obj.checkBox1 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.rectangle13);
    obj.checkBox1:setWidth(20);
    obj.checkBox1:setField("moveSTAB");
    obj.checkBox1:setAlign("left");
    obj.checkBox1:setMargins({left=8});
    obj.checkBox1:setName("checkBox1");

    obj.edit12 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.rectangle13);
    obj.edit12:setField("moveDamageSTAB");
    obj.edit12:setAlign("client");
    obj.edit12:setTransparent(true);
    obj.edit12:setMargins({left=5, right=5});
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setName("edit12");
    obj.edit12:setFontColor("White");
    lfm_setPropAsString(obj.edit12, "fontStyle",  "bold");

    obj.layout10 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.movePopUp);
    obj.layout10:setAlign("top");
    obj.layout10:setHeight(30);
    obj.layout10:setMargins({top=5, left=5});
    obj.layout10:setName("layout10");

    obj.label14 = gui.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout10);
    obj.label14:setAlign("left");
    obj.label14:setText("Tipo:");
    obj.label14:setWidth(60);
    obj.label14:setWordWrap(true);
    obj.label14:setMargins({left=5});
    obj.label14:setName("label14");
    obj.label14:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label14, "fontStyle",  "bold");

    obj.rectangle14 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.layout10);
    obj.rectangle14:setAlign("left");
    obj.rectangle14:setWidth(160);
    obj.rectangle14:setMargins({left=5});
    obj.rectangle14:setName("rectangle14");
    obj.rectangle14:setColor("transparent");
    obj.rectangle14:setStrokeColor("white");
    obj.rectangle14:setStrokeSize(1);
    obj.rectangle14:setXradius(10);
    obj.rectangle14:setYradius(10);
    obj.rectangle14:setCornerType("bevel");
    obj.rectangle14:setStrokeDash("dash");

    obj.edit13 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.rectangle14);
    obj.edit13:setField("moveType");
    obj.edit13:setAlign("client");
    obj.edit13:setTransparent(true);
    obj.edit13:setMargins({left=5,right=5});
    obj.edit13:setHorzTextAlign("center");
    obj.edit13:setName("edit13");
    obj.edit13:setFontColor("White");
    lfm_setPropAsString(obj.edit13, "fontStyle",  "bold");

    obj.label15 = gui.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout10);
    obj.label15:setText("Classe:");
    obj.label15:setWidth(60);
    obj.label15:setAlign("left");
    obj.label15:setMargins({left=15});
    obj.label15:setName("label15");
    obj.label15:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label15, "fontStyle",  "bold");

    obj.rectangle15 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.layout10);
    obj.rectangle15:setAlign("left");
    obj.rectangle15:setWidth(160);
    obj.rectangle15:setColor("transparent");
    obj.rectangle15:setStrokeColor("white");
    obj.rectangle15:setStrokeSize(1);
    obj.rectangle15:setXradius(10);
    obj.rectangle15:setYradius(10);
    obj.rectangle15:setCornerType("bevel");
    obj.rectangle15:setStrokeDash("dash");
    obj.rectangle15:setMargins({left=5});
    obj.rectangle15:setName("rectangle15");

    obj.edit14 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.rectangle15);
    obj.edit14:setField("moveClass");
    obj.edit14:setAlign("client");
    obj.edit14:setTransparent(true);
    obj.edit14:setMargins({left=5, right=5});
    obj.edit14:setHorzTextAlign("center");
    obj.edit14:setName("edit14");
    obj.edit14:setFontColor("White");
    lfm_setPropAsString(obj.edit14, "fontStyle",  "bold");

    obj.layout11 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.movePopUp);
    obj.layout11:setAlign("top");
    obj.layout11:setHeight(60);
    obj.layout11:setMargins({top=5, left=5});
    obj.layout11:setName("layout11");

    obj.label16 = gui.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout11);
    obj.label16:setText("Special:");
    obj.label16:setWidth(60);
    obj.label16:setAlign("left");
    obj.label16:setMargins({left=5});
    obj.label16:setName("label16");
    obj.label16:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label16, "fontStyle",  "bold");

    obj.rectangle16 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.layout11);
    obj.rectangle16:setAlign("left");
    obj.rectangle16:setWidth(400);
    obj.rectangle16:setMargins({left=5});
    obj.rectangle16:setName("rectangle16");
    obj.rectangle16:setColor("transparent");
    obj.rectangle16:setStrokeColor("white");
    obj.rectangle16:setStrokeSize(1);
    obj.rectangle16:setXradius(10);
    obj.rectangle16:setYradius(10);
    obj.rectangle16:setCornerType("bevel");
    obj.rectangle16:setStrokeDash("dash");

    obj.textEditor1 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.rectangle16);
    obj.textEditor1:setField("moveSpecial");
    obj.textEditor1:setAlign("client");
    obj.textEditor1:setTransparent(true);
    obj.textEditor1:setMargins({left=8, right=8});
    obj.textEditor1:setHorzTextAlign("leading");
    obj.textEditor1:setName("textEditor1");

    obj.layout12 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.movePopUp);
    obj.layout12:setAlign("top");
    obj.layout12:setHeight(60);
    obj.layout12:setMargins({top=10, left=5});
    obj.layout12:setName("layout12");

    obj.label17 = gui.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout12);
    obj.label17:setText("Efeito:");
    obj.label17:setWidth(60);
    obj.label17:setAlign("left");
    obj.label17:setMargins({left=5});
    obj.label17:setName("label17");
    obj.label17:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label17, "fontStyle",  "bold");

    obj.rectangle17 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.layout12);
    obj.rectangle17:setAlign("left");
    obj.rectangle17:setWidth(400);
    obj.rectangle17:setMargins({left=5});
    obj.rectangle17:setName("rectangle17");
    obj.rectangle17:setColor("transparent");
    obj.rectangle17:setStrokeColor("white");
    obj.rectangle17:setStrokeSize(1);
    obj.rectangle17:setXradius(10);
    obj.rectangle17:setYradius(10);
    obj.rectangle17:setCornerType("bevel");
    obj.rectangle17:setStrokeDash("dash");

    obj.textEditor2 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.rectangle17);
    obj.textEditor2:setField("moveEffect");
    obj.textEditor2:setAlign("client");
    obj.textEditor2:setTransparent(true);
    obj.textEditor2:setMargins({left=5, right=5});
    obj.textEditor2:setHorzTextAlign("leading");
    obj.textEditor2:setName("textEditor2");

    obj.layout13 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.movePopUp);
    obj.layout13:setAlign("top");
    obj.layout13:setHeight(30);
    obj.layout13:setMargins({left=5, top=15, right=5});
    obj.layout13:setName("layout13");

    obj.label18 = gui.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout13);
    obj.label18:setAlign("client");
    obj.label18:setText("CONTEST");
    obj.label18:setHorzTextAlign("center");
    obj.label18:setName("label18");
    obj.label18:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label18, "fontStyle",  "bold");
    obj.label18:setFontSize(18);

    obj.layout14 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.movePopUp);
    obj.layout14:setAlign("top");
    obj.layout14:setHeight(30);
    obj.layout14:setMargins({top=5, left=5});
    obj.layout14:setName("layout14");

    obj.label19 = gui.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout14);
    obj.label19:setText("C. Tipo:");
    obj.label19:setWidth(60);
    obj.label19:setAlign("left");
    obj.label19:setMargins({left=5});
    obj.label19:setName("label19");
    obj.label19:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label19, "fontStyle",  "bold");

    obj.rectangle18 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.layout14);
    obj.rectangle18:setAlign("left");
    obj.rectangle18:setWidth(160);
    obj.rectangle18:setColor("transparent");
    obj.rectangle18:setStrokeColor("white");
    obj.rectangle18:setStrokeSize(1);
    obj.rectangle18:setXradius(10);
    obj.rectangle18:setYradius(10);
    obj.rectangle18:setCornerType("bevel");
    obj.rectangle18:setStrokeDash("dash");
    obj.rectangle18:setMargins({left=5});
    obj.rectangle18:setName("rectangle18");

    obj.edit15 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.rectangle18);
    obj.edit15:setField("moveContestType");
    obj.edit15:setAlign("client");
    obj.edit15:setTransparent(true);
    obj.edit15:setMargins({left=5, right=5});
    obj.edit15:setHorzTextAlign("center");
    obj.edit15:setName("edit15");
    obj.edit15:setFontColor("White");
    lfm_setPropAsString(obj.edit15, "fontStyle",  "bold");

    obj.label20 = gui.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout14);
    obj.label20:setText("C. Efeito:");
    obj.label20:setWidth(60);
    obj.label20:setAlign("left");
    obj.label20:setMargins({left=15});
    obj.label20:setName("label20");
    obj.label20:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label20, "fontStyle",  "bold");

    obj.rectangle19 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle19:setParent(obj.layout14);
    obj.rectangle19:setAlign("left");
    obj.rectangle19:setWidth(160);
    obj.rectangle19:setColor("transparent");
    obj.rectangle19:setStrokeColor("white");
    obj.rectangle19:setStrokeSize(1);
    obj.rectangle19:setXradius(10);
    obj.rectangle19:setYradius(10);
    obj.rectangle19:setCornerType("bevel");
    obj.rectangle19:setStrokeDash("dash");
    obj.rectangle19:setMargins({left=5});
    obj.rectangle19:setName("rectangle19");

    obj.edit16 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.rectangle19);
    obj.edit16:setField("moveContestEffect");
    obj.edit16:setAlign("client");
    obj.edit16:setTransparent(true);
    obj.edit16:setMargins({left=5,right=5});
    obj.edit16:setHorzTextAlign("center");
    obj.edit16:setName("edit16");
    obj.edit16:setFontColor("White");
    lfm_setPropAsString(obj.edit16, "fontStyle",  "bold");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (self)
            local pop = self:findControlByName("movePopUp");
            	
            		if pop ~= nil then
            			pop:setNodeObject(self.sheet);
            			pop:showPopupEx("center", self.AtrBut);
            		else
            			showMessage("Ops, bug.. nao encontrei o popup do move para exibir");
            		end;
        end, obj);

    obj._e_event1 = obj.button2:addEventListener("onClick",
        function (self)
            local rolagem = rrpg.interpretarRolagem("1d20");
            		local node = ndb.getRoot(sheet);
            
            		local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            		mesaDoPersonagem.activeChat:rolarDados(rolagem, sheet.moveName .. " de " .. node.pokeName .. " com AC " .. sheet.moveAC);
        end, obj);

    obj._e_event2 = obj.button3:addEventListener("onClick",
        function (self)
            Dialogs.confirmYesNo("Deseja realmente apagar este item?",
            			function (confirmado)
            					if confirmado then
            							ndb.deleteNode(sheet);
            					else
            							-- usuário escolheu NAO
            					end;
            			end);
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event2);
        __o_rrpgObjs.removeEventListenerById(self._e_event1);
        __o_rrpgObjs.removeEventListenerById(self._e_event0);
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.movePopUp ~= nil then self.movePopUp:destroy(); self.movePopUp = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmMoves = {
    newEditor = newfrmMoves, 
    new = newfrmMoves, 
    name = "frmMoves", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmMoves = _frmMoves;
rrpg.registrarForm(_frmMoves);

return _frmMoves;
