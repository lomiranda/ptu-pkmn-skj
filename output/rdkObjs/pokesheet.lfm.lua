require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmPtuPoke()
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
    obj:setFormType("sheetTemplate");
    obj:setDataType("br.com.shakerskj.ptu_pkm");
    obj:setTitle("PTU Pokemon Sheet");
    obj:setName("frmPtuPoke");

    obj.scrollBox1 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setLeft(10);
    obj.scrollBox1:setTop(10);
    obj.scrollBox1:setWidth(600);
    obj.scrollBox1:setHeight(250);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.flowLayout1 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout1:setParent(obj.scrollBox1);
    obj.flowLayout1:setAutoHeight(true);
    obj.flowLayout1:setAlign("top");
    obj.flowLayout1:setOrientation("horizontal");
    obj.flowLayout1:setHorzAlign("center");
    obj.flowLayout1:setMargins({top=8, left=20, right=20});
    obj.flowLayout1:setName("flowLayout1");

    obj.flowPart1 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart1:setParent(obj.flowLayout1);
    obj.flowPart1:setMinWidth(600);
    obj.flowPart1:setMaxWidth(600);
    obj.flowPart1:setHeight(900);
    obj.flowPart1:setAdjustHeightToLine(true);
    obj.flowPart1:setName("flowPart1");

    obj.topLayout = gui.fromHandle(_obj_newObject("layout"));
    obj.topLayout:setParent(obj.flowPart1);
    obj.topLayout:setName("topLayout");
    obj.topLayout:setAlign("top");
    obj.topLayout:setMargins({top=8, bottom=4, left=26, right=26});

    obj.rectangle1 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.topLayout);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("transparent");
    obj.rectangle1:setStrokeColor("white");
    obj.rectangle1:setStrokeSize(1);
    obj.rectangle1:setXradius(25);
    obj.rectangle1:setYradius(25);
    obj.rectangle1:setCornerType("innerLine");
    obj.rectangle1:setStrokeDash("dash");
    obj.rectangle1:setName("rectangle1");

    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.rectangle1);
    obj.label1:setText("-=| FICHA POKÉMON |=-");
    lfm_setPropAsString(obj.label1, "fontStyle",  "bold");
    obj.label1:setFontSize(18);
    obj.label1:setAlign("client");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");
    obj.label1:setFontColor("Moccasin");

    obj.bodyLayout = gui.fromHandle(_obj_newObject("layout"));
    obj.bodyLayout:setParent(obj.flowPart1);
    obj.bodyLayout:setName("bodyLayout");
    obj.bodyLayout:setAlign("client");

    obj.rectangle2 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.bodyLayout);
    obj.rectangle2:setAlign("client");
    obj.rectangle2:setColor("transparent");
    obj.rectangle2:setStrokeColor("white");
    obj.rectangle2:setStrokeSize(1);
    obj.rectangle2:setXradius(25);
    obj.rectangle2:setYradius(25);
    obj.rectangle2:setCornerType("bevel");
    obj.rectangle2:setStrokeDash("dash");
    obj.rectangle2:setMargins({top=8, bottom=4, left=26, right=26});
    obj.rectangle2:setName("rectangle2");

    obj.firstSection = gui.fromHandle(_obj_newObject("layout"));
    obj.firstSection:setParent(obj.rectangle2);
    obj.firstSection:setName("firstSection");
    obj.firstSection:setAlign("top");
    obj.firstSection:setHeight(300);

    obj.layout1 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.firstSection);
    obj.layout1:setAlign("left");
    obj.layout1:setWidth(275);
    obj.layout1:setName("layout1");

    obj.layout2 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.layout1);
    obj.layout2:setAlign("top");
    obj.layout2:setWidth(250);
    obj.layout2:setHeight(30);
    obj.layout2:setMargins({top=10,left=5});
    obj.layout2:setName("layout2");

    obj.label2 = gui.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout2);
    obj.label2:setText("Nome:");
    lfm_setPropAsString(obj.label2, "fontStyle",  "bold");
    obj.label2:setAlign("left");
    obj.label2:setMargins({left=5});
    obj.label2:setWidth(70);
    obj.label2:setName("label2");
    obj.label2:setFontColor("Moccasin");

    obj.rectangle3 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout2);
    obj.rectangle3:setAlign("left");
    obj.rectangle3:setWidth(170);
    obj.rectangle3:setMargins({left=10});
    obj.rectangle3:setName("rectangle3");
    obj.rectangle3:setColor("transparent");
    obj.rectangle3:setStrokeColor("white");
    obj.rectangle3:setStrokeSize(1);
    obj.rectangle3:setXradius(10);
    obj.rectangle3:setYradius(10);
    obj.rectangle3:setCornerType("bevel");
    obj.rectangle3:setStrokeDash("dash");

    obj.edit1 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.rectangle3);
    obj.edit1:setField("pokeName");
    obj.edit1:setAlign("client");
    obj.edit1:setTransparent(true);
    obj.edit1:setMargins({left=5,right=15});
    obj.edit1:setHorzTextAlign("center");
    obj.edit1:setName("edit1");
    obj.edit1:setFontColor("White");
    lfm_setPropAsString(obj.edit1, "fontStyle",  "bold");

    obj.layout3 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.rectangle3);
    obj.layout3:setAlign("right");
    obj.layout3:setWidth(20);
    obj.layout3:setMargins({top=5, right=10, bottom=5});
    obj.layout3:setName("layout3");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout3);
    obj.button1:setAlign("client");
    obj.button1:setText("i");
    obj.button1:setName("button1");

    obj.pokemonPopUp = gui.fromHandle(_obj_newObject("popup"));
    obj.pokemonPopUp:setParent(obj.layout2);
    obj.pokemonPopUp:setName("pokemonPopUp");
    obj.pokemonPopUp:setWidth(450);
    obj.pokemonPopUp:setHeight(600);
    obj.pokemonPopUp:setBackOpacity(0.5);

    obj.label3 = gui.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.pokemonPopUp);
    obj.label3:setText("INFORMAÇÕES DO POKÉMON");
    obj.label3:setAlign("top");
    obj.label3:setHeight(50);
    obj.label3:setHorzTextAlign("center");
    obj.label3:setName("label3");
    obj.label3:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label3, "fontStyle",  "bold");
    obj.label3:setFontSize(18);

    obj.layout4 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.pokemonPopUp);
    obj.layout4:setAlign("top");
    obj.layout4:setWidth(250);
    obj.layout4:setHeight(40);
    obj.layout4:setMargins({top=10,left=5});
    obj.layout4:setName("layout4");

    obj.label4 = gui.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout4);
    obj.label4:setText("Nome:");
    obj.label4:setAlign("left");
    obj.label4:setWidth(80);
    obj.label4:setMargins({left=5});
    obj.label4:setName("label4");
    obj.label4:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label4, "fontStyle",  "bold");

    obj.rectangle4 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout4);
    obj.rectangle4:setAlign("left");
    obj.rectangle4:setWidth(200);
    obj.rectangle4:setMargins({left=10});
    obj.rectangle4:setName("rectangle4");
    obj.rectangle4:setColor("transparent");
    obj.rectangle4:setStrokeColor("white");
    obj.rectangle4:setStrokeSize(1);
    obj.rectangle4:setXradius(10);
    obj.rectangle4:setYradius(10);
    obj.rectangle4:setCornerType("bevel");
    obj.rectangle4:setStrokeDash("dash");

    obj.edit2 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.rectangle4);
    obj.edit2:setField("pokeName");
    obj.edit2:setAlign("client");
    obj.edit2:setTransparent(true);
    obj.edit2:setMargins({left=5,right=15});
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setName("edit2");
    obj.edit2:setFontColor("White");
    lfm_setPropAsString(obj.edit2, "fontStyle",  "bold");

    obj.label5 = gui.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout4);
    obj.label5:setText("Nível:");
    obj.label5:setAlign("right");
    obj.label5:setMargins({right=10});
    obj.label5:setWidth(45);
    obj.label5:setName("label5");
    obj.label5:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label5, "fontStyle",  "bold");

    obj.rectangle5 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout4);
    obj.rectangle5:setAlign("right");
    obj.rectangle5:setWidth(50);
    obj.rectangle5:setMargins({right=12});
    obj.rectangle5:setName("rectangle5");
    obj.rectangle5:setColor("transparent");
    obj.rectangle5:setStrokeColor("white");
    obj.rectangle5:setStrokeSize(1);
    obj.rectangle5:setXradius(10);
    obj.rectangle5:setYradius(10);
    obj.rectangle5:setCornerType("bevel");
    obj.rectangle5:setStrokeDash("dash");

    obj.edit3 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.rectangle5);
    obj.edit3:setField("pokeLevel");
    obj.edit3:setAlign("client");
    obj.edit3:setType("number");
    obj.edit3:setTransparent(true);
    obj.edit3:setMargins({left=5,right=5});
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setName("edit3");
    obj.edit3:setFontColor("White");
    lfm_setPropAsString(obj.edit3, "fontStyle",  "bold");

    obj.layout5 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.pokemonPopUp);
    obj.layout5:setAlign("top");
    obj.layout5:setHeight(40);
    obj.layout5:setMargins({top=10, left=5});
    obj.layout5:setName("layout5");

    obj.label6 = gui.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout5);
    obj.label6:setText("Gênero:");
    obj.label6:setWidth(80);
    obj.label6:setAlign("left");
    obj.label6:setMargins({left=5});
    obj.label6:setName("label6");
    obj.label6:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label6, "fontStyle",  "bold");

    obj.rectangle6 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout5);
    obj.rectangle6:setAlign("left");
    obj.rectangle6:setWidth(330);
    obj.rectangle6:setMargins({left=10});
    obj.rectangle6:setName("rectangle6");
    obj.rectangle6:setColor("transparent");
    obj.rectangle6:setStrokeColor("white");
    obj.rectangle6:setStrokeSize(1);
    obj.rectangle6:setXradius(10);
    obj.rectangle6:setYradius(10);
    obj.rectangle6:setCornerType("bevel");
    obj.rectangle6:setStrokeDash("dash");

    obj.edit4 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.rectangle6);
    obj.edit4:setField("pokeSex");
    obj.edit4:setAlign("client");
    obj.edit4:setTransparent(true);
    obj.edit4:setMargins({left=5,right=5});
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setName("edit4");
    obj.edit4:setFontColor("White");
    lfm_setPropAsString(obj.edit4, "fontStyle",  "bold");

    obj.layout6 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.pokemonPopUp);
    obj.layout6:setAlign("top");
    obj.layout6:setHeight(40);
    obj.layout6:setMargins({top=10, left=5});
    obj.layout6:setName("layout6");

    obj.label7 = gui.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout6);
    obj.label7:setText("Encontro:");
    obj.label7:setWidth(80);
    obj.label7:setAlign("left");
    obj.label7:setMargins({left=5});
    obj.label7:setName("label7");
    obj.label7:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label7, "fontStyle",  "bold");

    obj.rectangle7 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.layout6);
    obj.rectangle7:setAlign("left");
    obj.rectangle7:setWidth(330);
    obj.rectangle7:setMargins({left=10});
    obj.rectangle7:setName("rectangle7");
    obj.rectangle7:setColor("transparent");
    obj.rectangle7:setStrokeColor("white");
    obj.rectangle7:setStrokeSize(1);
    obj.rectangle7:setXradius(10);
    obj.rectangle7:setYradius(10);
    obj.rectangle7:setCornerType("bevel");
    obj.rectangle7:setStrokeDash("dash");

    obj.edit5 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.rectangle7);
    obj.edit5:setField("pokeFound");
    obj.edit5:setAlign("client");
    obj.edit5:setTransparent(true);
    obj.edit5:setMargins({left=5,right=15});
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setName("edit5");
    obj.edit5:setFontColor("White");
    lfm_setPropAsString(obj.edit5, "fontStyle",  "bold");

    obj.layout7 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.pokemonPopUp);
    obj.layout7:setAlign("top");
    obj.layout7:setHeight(40);
    obj.layout7:setMargins({top=10, left=5});
    obj.layout7:setName("layout7");

    obj.label8 = gui.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout7);
    obj.label8:setText("Original Trainer:");
    obj.label8:setWidth(80);
    obj.label8:setWordWrap(true);
    obj.label8:setAlign("left");
    obj.label8:setMargins({left=5});
    obj.label8:setName("label8");
    obj.label8:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label8, "fontStyle",  "bold");

    obj.rectangle8 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.layout7);
    obj.rectangle8:setAlign("left");
    obj.rectangle8:setWidth(330);
    obj.rectangle8:setMargins({left=10});
    obj.rectangle8:setName("rectangle8");
    obj.rectangle8:setColor("transparent");
    obj.rectangle8:setStrokeColor("white");
    obj.rectangle8:setStrokeSize(1);
    obj.rectangle8:setXradius(10);
    obj.rectangle8:setYradius(10);
    obj.rectangle8:setCornerType("bevel");
    obj.rectangle8:setStrokeDash("dash");

    obj.edit6 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.rectangle8);
    obj.edit6:setField("pokeOT");
    obj.edit6:setAlign("client");
    obj.edit6:setTransparent(true);
    obj.edit6:setMargins({left=5,right=15});
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setName("edit6");
    obj.edit6:setFontColor("White");
    lfm_setPropAsString(obj.edit6, "fontStyle",  "bold");

    obj.layout8 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.pokemonPopUp);
    obj.layout8:setAlign("top");
    obj.layout8:setHeight(40);
    obj.layout8:setMargins({top=10, left=5});
    obj.layout8:setName("layout8");

    obj.label9 = gui.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout8);
    obj.label9:setText("Pokébola:");
    obj.label9:setWidth(80);
    obj.label9:setAlign("left");
    obj.label9:setMargins({left=5});
    obj.label9:setName("label9");
    obj.label9:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label9, "fontStyle",  "bold");

    obj.rectangle9 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.layout8);
    obj.rectangle9:setAlign("left");
    obj.rectangle9:setWidth(330);
    obj.rectangle9:setMargins({left=10});
    obj.rectangle9:setName("rectangle9");
    obj.rectangle9:setColor("transparent");
    obj.rectangle9:setStrokeColor("white");
    obj.rectangle9:setStrokeSize(1);
    obj.rectangle9:setXradius(10);
    obj.rectangle9:setYradius(10);
    obj.rectangle9:setCornerType("bevel");
    obj.rectangle9:setStrokeDash("dash");

    obj.edit7 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.rectangle9);
    obj.edit7:setField("pokeCaughtBall");
    obj.edit7:setAlign("client");
    obj.edit7:setTransparent(true);
    obj.edit7:setMargins({left=5,right=15});
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setName("edit7");
    obj.edit7:setFontColor("White");
    lfm_setPropAsString(obj.edit7, "fontStyle",  "bold");

    obj.layout9 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.pokemonPopUp);
    obj.layout9:setAlign("top");
    obj.layout9:setHeight(100);
    obj.layout9:setMargins({top=10, left=5});
    obj.layout9:setName("layout9");

    obj.label10 = gui.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout9);
    obj.label10:setText("Personalidade:");
    obj.label10:setFontSize(11);
    obj.label10:setWidth(80);
    obj.label10:setWordWrap(true);
    obj.label10:setAlign("left");
    obj.label10:setMargins({left=5});
    obj.label10:setName("label10");
    obj.label10:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label10, "fontStyle",  "bold");

    obj.rectangle10 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.layout9);
    obj.rectangle10:setAlign("left");
    obj.rectangle10:setWidth(330);
    obj.rectangle10:setMargins({left=10});
    obj.rectangle10:setName("rectangle10");
    obj.rectangle10:setColor("transparent");
    obj.rectangle10:setStrokeColor("white");
    obj.rectangle10:setStrokeSize(1);
    obj.rectangle10:setXradius(10);
    obj.rectangle10:setYradius(10);
    obj.rectangle10:setCornerType("bevel");
    obj.rectangle10:setStrokeDash("dash");

    obj.textEditor1 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.rectangle10);
    obj.textEditor1:setField("pokePersonality");
    obj.textEditor1:setAlign("client");
    obj.textEditor1:setTransparent(true);
    obj.textEditor1:setMargins({top=5, bottom=5, left=15, right=15});
    obj.textEditor1:setHorzTextAlign("leading");
    obj.textEditor1:setName("textEditor1");

    obj.layout10 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.pokemonPopUp);
    obj.layout10:setAlign("top");
    obj.layout10:setHeight(150);
    obj.layout10:setMargins({top=10, left=5});
    obj.layout10:setName("layout10");

    obj.label11 = gui.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout10);
    obj.label11:setText("História:");
    obj.label11:setWidth(80);
    obj.label11:setAlign("left");
    obj.label11:setMargins({left=5});
    obj.label11:setName("label11");
    obj.label11:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label11, "fontStyle",  "bold");

    obj.rectangle11 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.layout10);
    obj.rectangle11:setAlign("left");
    obj.rectangle11:setWidth(330);
    obj.rectangle11:setMargins({left=10});
    obj.rectangle11:setName("rectangle11");
    obj.rectangle11:setColor("transparent");
    obj.rectangle11:setStrokeColor("white");
    obj.rectangle11:setStrokeSize(1);
    obj.rectangle11:setXradius(10);
    obj.rectangle11:setYradius(10);
    obj.rectangle11:setCornerType("bevel");
    obj.rectangle11:setStrokeDash("dash");

    obj.textEditor2 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.rectangle11);
    obj.textEditor2:setField("pokeHistory");
    obj.textEditor2:setAlign("client");
    obj.textEditor2:setTransparent(true);
    obj.textEditor2:setMargins({top=5, bottom=5, left=15, right=15});
    obj.textEditor2:setHorzTextAlign("leading");
    obj.textEditor2:setName("textEditor2");

    obj.layout11 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.layout1);
    obj.layout11:setAlign("top");
    obj.layout11:setWidth(120);
    obj.layout11:setHeight(30);
    obj.layout11:setMargins({top=10,left=5});
    obj.layout11:setName("layout11");

    obj.label12 = gui.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout11);
    obj.label12:setText("Espécie:");
    obj.label12:setAlign("left");
    obj.label12:setMargins({left=5});
    obj.label12:setWidth(70);
    obj.label12:setName("label12");
    obj.label12:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label12, "fontStyle",  "bold");

    obj.rectangle12 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.layout11);
    obj.rectangle12:setAlign("left");
    obj.rectangle12:setWidth(170);
    obj.rectangle12:setMargins({left=10});
    obj.rectangle12:setName("rectangle12");
    obj.rectangle12:setColor("transparent");
    obj.rectangle12:setStrokeColor("white");
    obj.rectangle12:setStrokeSize(1);
    obj.rectangle12:setXradius(10);
    obj.rectangle12:setYradius(10);
    obj.rectangle12:setCornerType("bevel");
    obj.rectangle12:setStrokeDash("dash");

    obj.edit8 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.rectangle12);
    obj.edit8:setField("pokeSpec");
    obj.edit8:setAlign("client");
    obj.edit8:setTransparent(true);
    obj.edit8:setMargins({left=5,right=15});
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setName("edit8");
    obj.edit8:setFontColor("White");
    lfm_setPropAsString(obj.edit8, "fontStyle",  "bold");

    obj.layout12 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.rectangle12);
    obj.layout12:setAlign("right");
    obj.layout12:setWidth(20);
    obj.layout12:setMargins({top=5, right=10, bottom=5});
    obj.layout12:setName("layout12");

    obj.button2 = gui.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout12);
    obj.button2:setAlign("client");
    obj.button2:setText("i");
    obj.button2:setName("button2");

    obj.speciesPopUp = gui.fromHandle(_obj_newObject("popup"));
    obj.speciesPopUp:setParent(obj.layout11);
    obj.speciesPopUp:setName("speciesPopUp");
    obj.speciesPopUp:setWidth(430);
    obj.speciesPopUp:setHeight(440);
    obj.speciesPopUp:setBackOpacity(0.5);

    obj.label13 = gui.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.speciesPopUp);
    obj.label13:setText("INFORMAÇÕES DA ESPÉCIE");
    obj.label13:setAlign("top");
    obj.label13:setHeight(30);
    obj.label13:setHorzTextAlign("center");
    obj.label13:setName("label13");
    obj.label13:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label13, "fontStyle",  "bold");
    obj.label13:setFontSize(18);

    obj.layout13 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.speciesPopUp);
    obj.layout13:setAlign("top");
    obj.layout13:setWidth(250);
    obj.layout13:setHeight(30);
    obj.layout13:setMargins({top=10,left=5});
    obj.layout13:setName("layout13");

    obj.label14 = gui.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout13);
    obj.label14:setText("Espécie:");
    obj.label14:setAlign("left");
    obj.label14:setWidth(60);
    obj.label14:setMargins({left=5});
    obj.label14:setName("label14");
    obj.label14:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label14, "fontStyle",  "bold");

    obj.rectangle13 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.layout13);
    obj.rectangle13:setAlign("left");
    obj.rectangle13:setWidth(200);
    obj.rectangle13:setMargins({left=10});
    obj.rectangle13:setName("rectangle13");
    obj.rectangle13:setColor("transparent");
    obj.rectangle13:setStrokeColor("white");
    obj.rectangle13:setStrokeSize(1);
    obj.rectangle13:setXradius(10);
    obj.rectangle13:setYradius(10);
    obj.rectangle13:setCornerType("bevel");
    obj.rectangle13:setStrokeDash("dash");

    obj.edit9 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.rectangle13);
    obj.edit9:setField("pokeSpec");
    obj.edit9:setAlign("client");
    obj.edit9:setTransparent(true);
    obj.edit9:setMargins({left=5,right=15});
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setName("edit9");
    obj.edit9:setFontColor("White");
    lfm_setPropAsString(obj.edit9, "fontStyle",  "bold");

    obj.label15 = gui.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout13);
    obj.label15:setText("Dex Nº:");
    obj.label15:setAlign("right");
    obj.label15:setMargins({right=10});
    obj.label15:setWidth(50);
    obj.label15:setName("label15");
    obj.label15:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label15, "fontStyle",  "bold");

    obj.rectangle14 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.layout13);
    obj.rectangle14:setAlign("right");
    obj.rectangle14:setWidth(50);
    obj.rectangle14:setMargins({right=10});
    obj.rectangle14:setName("rectangle14");
    obj.rectangle14:setColor("transparent");
    obj.rectangle14:setStrokeColor("white");
    obj.rectangle14:setStrokeSize(1);
    obj.rectangle14:setXradius(10);
    obj.rectangle14:setYradius(10);
    obj.rectangle14:setCornerType("bevel");
    obj.rectangle14:setStrokeDash("dash");

    obj.edit10 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.rectangle14);
    obj.edit10:setField("pokeDexNumber");
    obj.edit10:setAlign("client");
    obj.edit10:setType("number");
    obj.edit10:setTransparent(true);
    obj.edit10:setMargins({left=5,right=5});
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setName("edit10");
    obj.edit10:setFontColor("White");
    lfm_setPropAsString(obj.edit10, "fontStyle",  "bold");

    obj.layout14 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.speciesPopUp);
    obj.layout14:setAlign("top");
    obj.layout14:setHeight(30);
    obj.layout14:setMargins({top=10, left=5});
    obj.layout14:setName("layout14");

    obj.label16 = gui.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout14);
    obj.label16:setText("Tipo:");
    obj.label16:setWidth(60);
    obj.label16:setAlign("left");
    obj.label16:setMargins({left=5});
    obj.label16:setName("label16");
    obj.label16:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label16, "fontStyle",  "bold");

    obj.rectangle15 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.layout14);
    obj.rectangle15:setAlign("left");
    obj.rectangle15:setWidth(330);
    obj.rectangle15:setMargins({left=10});
    obj.rectangle15:setName("rectangle15");
    obj.rectangle15:setColor("transparent");
    obj.rectangle15:setStrokeColor("white");
    obj.rectangle15:setStrokeSize(1);
    obj.rectangle15:setXradius(10);
    obj.rectangle15:setYradius(10);
    obj.rectangle15:setCornerType("bevel");
    obj.rectangle15:setStrokeDash("dash");

    obj.edit11 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.rectangle15);
    obj.edit11:setField("pokeType");
    obj.edit11:setAlign("client");
    obj.edit11:setTransparent(true);
    obj.edit11:setMargins({left=5, right=5});
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setName("edit11");
    obj.edit11:setFontColor("White");
    lfm_setPropAsString(obj.edit11, "fontStyle",  "bold");

    obj.layout15 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.speciesPopUp);
    obj.layout15:setAlign("top");
    obj.layout15:setWidth(250);
    obj.layout15:setHeight(30);
    obj.layout15:setMargins({top=10,left=5});
    obj.layout15:setName("layout15");

    obj.label17 = gui.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout15);
    obj.label17:setText("Altura [C]:");
    obj.label17:setFontSize(11);
    obj.label17:setAlign("left");
    obj.label17:setWidth(60);
    obj.label17:setMargins({left=5});
    obj.label17:setName("label17");
    obj.label17:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label17, "fontStyle",  "bold");

    obj.rectangle16 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.layout15);
    obj.rectangle16:setAlign("left");
    obj.rectangle16:setWidth(120);
    obj.rectangle16:setMargins({left=10});
    obj.rectangle16:setName("rectangle16");
    obj.rectangle16:setColor("transparent");
    obj.rectangle16:setStrokeColor("white");
    obj.rectangle16:setStrokeSize(1);
    obj.rectangle16:setXradius(10);
    obj.rectangle16:setYradius(10);
    obj.rectangle16:setCornerType("bevel");
    obj.rectangle16:setStrokeDash("dash");

    obj.edit12 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.rectangle16);
    obj.edit12:setField("pokeSizeClass");
    obj.edit12:setAlign("client");
    obj.edit12:setTransparent(true);
    obj.edit12:setMargins({left=5,right=15});
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setName("edit12");
    obj.edit12:setFontColor("White");
    lfm_setPropAsString(obj.edit12, "fontStyle",  "bold");

    obj.label18 = gui.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout15);
    obj.label18:setText("Peso [C]:");
    obj.label18:setFontSize(11);
    obj.label18:setAlign("left");
    obj.label18:setWidth(60);
    obj.label18:setMargins({left=20});
    obj.label18:setName("label18");
    obj.label18:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label18, "fontStyle",  "bold");

    obj.rectangle17 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.layout15);
    obj.rectangle17:setAlign("left");
    obj.rectangle17:setWidth(120);
    obj.rectangle17:setMargins({left=10});
    obj.rectangle17:setName("rectangle17");
    obj.rectangle17:setColor("transparent");
    obj.rectangle17:setStrokeColor("white");
    obj.rectangle17:setStrokeSize(1);
    obj.rectangle17:setXradius(10);
    obj.rectangle17:setYradius(10);
    obj.rectangle17:setCornerType("bevel");
    obj.rectangle17:setStrokeDash("dash");

    obj.edit13 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.rectangle17);
    obj.edit13:setField("pokeWeightClass");
    obj.edit13:setAlign("client");
    obj.edit13:setTransparent(true);
    obj.edit13:setMargins({left=5,right=5});
    obj.edit13:setHorzTextAlign("center");
    obj.edit13:setName("edit13");
    obj.edit13:setFontColor("White");
    lfm_setPropAsString(obj.edit13, "fontStyle",  "bold");

    obj.layout16 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.speciesPopUp);
    obj.layout16:setAlign("top");
    obj.layout16:setHeight(30);
    obj.layout16:setMargins({top=10, left=5});
    obj.layout16:setName("layout16");

    obj.label19 = gui.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout16);
    obj.label19:setText("Habitat:");
    obj.label19:setWidth(60);
    obj.label19:setAlign("left");
    obj.label19:setMargins({left=5});
    obj.label19:setName("label19");
    obj.label19:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label19, "fontStyle",  "bold");

    obj.rectangle18 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.layout16);
    obj.rectangle18:setAlign("left");
    obj.rectangle18:setWidth(330);
    obj.rectangle18:setMargins({left=10});
    obj.rectangle18:setName("rectangle18");
    obj.rectangle18:setColor("transparent");
    obj.rectangle18:setStrokeColor("white");
    obj.rectangle18:setStrokeSize(1);
    obj.rectangle18:setXradius(10);
    obj.rectangle18:setYradius(10);
    obj.rectangle18:setCornerType("bevel");
    obj.rectangle18:setStrokeDash("dash");

    obj.edit14 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.rectangle18);
    obj.edit14:setField("pokeHabitat");
    obj.edit14:setAlign("client");
    obj.edit14:setTransparent(true);
    obj.edit14:setMargins({left=5, right=5});
    obj.edit14:setHorzTextAlign("center");
    obj.edit14:setName("edit14");
    obj.edit14:setFontColor("White");
    lfm_setPropAsString(obj.edit14, "fontStyle",  "bold");

    obj.layout17 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.speciesPopUp);
    obj.layout17:setAlign("top");
    obj.layout17:setHeight(100);
    obj.layout17:setMargins({top=10, left=5});
    obj.layout17:setName("layout17");

    obj.label20 = gui.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout17);
    obj.label20:setText("Visual:");
    obj.label20:setWidth(60);
    obj.label20:setAlign("left");
    obj.label20:setMargins({left=5});
    obj.label20:setName("label20");
    obj.label20:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label20, "fontStyle",  "bold");

    obj.rectangle19 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle19:setParent(obj.layout17);
    obj.rectangle19:setAlign("left");
    obj.rectangle19:setWidth(330);
    obj.rectangle19:setMargins({left=10});
    obj.rectangle19:setName("rectangle19");
    obj.rectangle19:setColor("transparent");
    obj.rectangle19:setStrokeColor("white");
    obj.rectangle19:setStrokeSize(1);
    obj.rectangle19:setXradius(10);
    obj.rectangle19:setYradius(10);
    obj.rectangle19:setCornerType("bevel");
    obj.rectangle19:setStrokeDash("dash");

    obj.textEditor3 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.rectangle19);
    obj.textEditor3:setField("pokePhysicDesc");
    obj.textEditor3:setAlign("client");
    obj.textEditor3:setTransparent(true);
    obj.textEditor3:setMargins({top=5, bottom=5, left=15, right=15});
    obj.textEditor3:setHorzTextAlign("leading");
    obj.textEditor3:setName("textEditor3");

    obj.layout18 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.speciesPopUp);
    obj.layout18:setAlign("top");
    obj.layout18:setHeight(100);
    obj.layout18:setMargins({top=10, left=5});
    obj.layout18:setName("layout18");

    obj.label21 = gui.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout18);
    obj.label21:setText("Pokédex:");
    obj.label21:setWidth(60);
    obj.label21:setAlign("left");
    obj.label21:setMargins({left=5});
    obj.label21:setName("label21");
    obj.label21:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label21, "fontStyle",  "bold");

    obj.rectangle20 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle20:setParent(obj.layout18);
    obj.rectangle20:setAlign("left");
    obj.rectangle20:setWidth(330);
    obj.rectangle20:setMargins({left=10});
    obj.rectangle20:setName("rectangle20");
    obj.rectangle20:setColor("transparent");
    obj.rectangle20:setStrokeColor("white");
    obj.rectangle20:setStrokeSize(1);
    obj.rectangle20:setXradius(10);
    obj.rectangle20:setYradius(10);
    obj.rectangle20:setCornerType("bevel");
    obj.rectangle20:setStrokeDash("dash");

    obj.textEditor4 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.rectangle20);
    obj.textEditor4:setField("pokedexEntry");
    obj.textEditor4:setAlign("client");
    obj.textEditor4:setTransparent(true);
    obj.textEditor4:setMargins({top=5, bottom=5, left=15, right=15});
    obj.textEditor4:setHorzTextAlign("leading");
    obj.textEditor4:setName("textEditor4");

    obj.layout19 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.layout1);
    obj.layout19:setAlign("top");
    obj.layout19:setWidth(250);
    obj.layout19:setHeight(30);
    obj.layout19:setMargins({top=10,left=5});
    obj.layout19:setName("layout19");

    obj.label22 = gui.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout19);
    obj.label22:setText("Tipo:");
    obj.label22:setAlign("left");
    obj.label22:setMargins({left=5});
    obj.label22:setWidth(70);
    obj.label22:setName("label22");
    obj.label22:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label22, "fontStyle",  "bold");

    obj.rectangle21 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle21:setParent(obj.layout19);
    obj.rectangle21:setAlign("left");
    obj.rectangle21:setWidth(170);
    obj.rectangle21:setMargins({left=10});
    obj.rectangle21:setName("rectangle21");
    obj.rectangle21:setColor("transparent");
    obj.rectangle21:setStrokeColor("white");
    obj.rectangle21:setStrokeSize(1);
    obj.rectangle21:setXradius(10);
    obj.rectangle21:setYradius(10);
    obj.rectangle21:setCornerType("bevel");
    obj.rectangle21:setStrokeDash("dash");

    obj.edit15 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.rectangle21);
    obj.edit15:setField("pokeType");
    obj.edit15:setAlign("client");
    obj.edit15:setTransparent(true);
    obj.edit15:setMargins({left=5,right=5});
    obj.edit15:setHorzTextAlign("center");
    obj.edit15:setName("edit15");
    obj.edit15:setFontColor("White");
    lfm_setPropAsString(obj.edit15, "fontStyle",  "bold");

    obj.layout20 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.layout1);
    obj.layout20:setAlign("top");
    obj.layout20:setWidth(250);
    obj.layout20:setHeight(30);
    obj.layout20:setMargins({top=10,left=5});
    obj.layout20:setName("layout20");

    obj.label23 = gui.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.layout20);
    obj.label23:setText("Peso [C]:");
    obj.label23:setAlign("left");
    obj.label23:setMargins({left=5});
    obj.label23:setWidth(70);
    obj.label23:setName("label23");
    obj.label23:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label23, "fontStyle",  "bold");

    obj.rectangle22 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle22:setParent(obj.layout20);
    obj.rectangle22:setAlign("left");
    obj.rectangle22:setWidth(170);
    obj.rectangle22:setMargins({left=10});
    obj.rectangle22:setName("rectangle22");
    obj.rectangle22:setColor("transparent");
    obj.rectangle22:setStrokeColor("white");
    obj.rectangle22:setStrokeSize(1);
    obj.rectangle22:setXradius(10);
    obj.rectangle22:setYradius(10);
    obj.rectangle22:setCornerType("bevel");
    obj.rectangle22:setStrokeDash("dash");

    obj.edit16 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.rectangle22);
    obj.edit16:setField("pokeWeightClass");
    obj.edit16:setAlign("client");
    obj.edit16:setTransparent(true);
    obj.edit16:setMargins({left=5,right=5});
    obj.edit16:setHorzTextAlign("center");
    obj.edit16:setName("edit16");
    obj.edit16:setFontColor("White");
    lfm_setPropAsString(obj.edit16, "fontStyle",  "bold");

    obj.layout21 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.layout1);
    obj.layout21:setAlign("top");
    obj.layout21:setWidth(250);
    obj.layout21:setHeight(30);
    obj.layout21:setMargins({top=10,left=5});
    obj.layout21:setName("layout21");

    obj.label24 = gui.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.layout21);
    obj.label24:setText("Natureza:");
    obj.label24:setAlign("left");
    obj.label24:setMargins({left=5});
    obj.label24:setWidth(70);
    obj.label24:setName("label24");
    obj.label24:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label24, "fontStyle",  "bold");

    obj.rectangle23 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle23:setParent(obj.layout21);
    obj.rectangle23:setAlign("left");
    obj.rectangle23:setWidth(170);
    obj.rectangle23:setMargins({left=10});
    obj.rectangle23:setName("rectangle23");
    obj.rectangle23:setColor("transparent");
    obj.rectangle23:setStrokeColor("white");
    obj.rectangle23:setStrokeSize(1);
    obj.rectangle23:setXradius(10);
    obj.rectangle23:setYradius(10);
    obj.rectangle23:setCornerType("bevel");
    obj.rectangle23:setStrokeDash("dash");

    obj.comboBox1 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.rectangle23);
    obj.comboBox1:setField("pokeNature");
    obj.comboBox1:setText("Escolha");
    obj.comboBox1:setAlign("client");
    obj.comboBox1:setTransparent(true);
    obj.comboBox1:setMargins({left=5,right=5});
    obj.comboBox1:setHorzTextAlign("center");
    obj.comboBox1:setItems({'Cuddly', 'Distracted', 'Proud', 'Decisive', 'Patient', 'Desperate', 'Lonely', 'Adamant', 'Naughty', 'Brave', 'Stark', 'Bold', 'Impish', 'Lax', 'Relaxed', 'Curious', 'Modest', 'Mild', 'Rash', 'Quiet', 'Dreamy', 'Calm', 'Gentle', 'Careful', 'Sassy', 'Skittish', 'Timid', 'Hasty', 'Jolly', 'Naive', 'Compossed', 'Hardy', 'Docile', 'Bashful', 'Quirky', 'Serious'});
    obj.comboBox1:setValues({'1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31', '32', '33', '34', '35', '36'});
    obj.comboBox1:setFontColor("White");
    obj.comboBox1:setName("comboBox1");

    obj.layout22 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.layout1);
    obj.layout22:setAlign("top");
    obj.layout22:setWidth(250);
    obj.layout22:setHeight(30);
    obj.layout22:setMargins({top=10,left=5});
    obj.layout22:setName("layout22");

    obj.label25 = gui.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.layout22);
    obj.label25:setText("Item:");
    obj.label25:setAlign("left");
    obj.label25:setMargins({left=5});
    obj.label25:setWidth(70);
    obj.label25:setName("label25");
    obj.label25:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label25, "fontStyle",  "bold");

    obj.rectangle24 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle24:setParent(obj.layout22);
    obj.rectangle24:setAlign("left");
    obj.rectangle24:setWidth(170);
    obj.rectangle24:setMargins({left=10});
    obj.rectangle24:setName("rectangle24");
    obj.rectangle24:setColor("transparent");
    obj.rectangle24:setStrokeColor("white");
    obj.rectangle24:setStrokeSize(1);
    obj.rectangle24:setXradius(10);
    obj.rectangle24:setYradius(10);
    obj.rectangle24:setCornerType("bevel");
    obj.rectangle24:setStrokeDash("dash");

    obj.edit17 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.rectangle24);
    obj.edit17:setField("pokeHeldItem");
    obj.edit17:setAlign("client");
    obj.edit17:setTransparent(true);
    obj.edit17:setMargins({left=5,right=5});
    obj.edit17:setHorzTextAlign("center");
    obj.edit17:setName("edit17");
    obj.edit17:setFontColor("White");
    lfm_setPropAsString(obj.edit17, "fontStyle",  "bold");

    obj.layout23 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.layout1);
    obj.layout23:setAlign("top");
    obj.layout23:setWidth(250);
    obj.layout23:setHeight(30);
    obj.layout23:setMargins({top=10,left=5});
    obj.layout23:setName("layout23");

    obj.label26 = gui.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.layout23);
    obj.label26:setText("Lealdade:");
    obj.label26:setAlign("left");
    obj.label26:setMargins({left=5});
    obj.label26:setWidth(70);
    obj.label26:setName("label26");
    obj.label26:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label26, "fontStyle",  "bold");

    obj.rectangle25 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle25:setParent(obj.layout23);
    obj.rectangle25:setAlign("left");
    obj.rectangle25:setWidth(170);
    obj.rectangle25:setMargins({left=10});
    obj.rectangle25:setName("rectangle25");
    obj.rectangle25:setColor("transparent");
    obj.rectangle25:setStrokeColor("white");
    obj.rectangle25:setStrokeSize(1);
    obj.rectangle25:setXradius(10);
    obj.rectangle25:setYradius(10);
    obj.rectangle25:setCornerType("bevel");
    obj.rectangle25:setStrokeDash("dash");

    obj.label27 = gui.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.rectangle25);
    obj.label27:setText("Apenas o Mestre");
    obj.label27:setFontSize(10);
    obj.label27:setAlign("client");
    obj.label27:setMargins({left=5, right=5});
    obj.label27:setHorzTextAlign("center");
    obj.label27:setName("label27");
    obj.label27:setFontColor("Orange");
    lfm_setPropAsString(obj.label27, "fontStyle",  "bold");

    obj.layout24 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.rectangle25);
    obj.layout24:setAlign("right");
    obj.layout24:setWidth(20);
    obj.layout24:setMargins({top=5, right=10, bottom=5});
    obj.layout24:setName("layout24");

    obj.loyaltyBtn = gui.fromHandle(_obj_newObject("button"));
    obj.loyaltyBtn:setParent(obj.layout24);
    obj.loyaltyBtn:setName("loyaltyBtn");
    obj.loyaltyBtn:setEnabled(false);
    obj.loyaltyBtn:setAlign("client");
    obj.loyaltyBtn:setText("i");

    obj.loyaltyPopUp = gui.fromHandle(_obj_newObject("popup"));
    obj.loyaltyPopUp:setParent(obj.layout1);
    obj.loyaltyPopUp:setName("loyaltyPopUp");
    obj.loyaltyPopUp:setWidth(430);
    obj.loyaltyPopUp:setHeight(150);
    obj.loyaltyPopUp:setBackOpacity(0.5);

    obj.label28 = gui.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.loyaltyPopUp);
    obj.label28:setText("LEALDADE");
    obj.label28:setAlign("top");
    obj.label28:setHeight(30);
    obj.label28:setHorzTextAlign("center");
    obj.label28:setName("label28");
    obj.label28:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label28, "fontStyle",  "bold");
    obj.label28:setFontSize(18);

    obj.layout25 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.loyaltyPopUp);
    obj.layout25:setAlign("top");
    obj.layout25:setHeight(30);
    obj.layout25:setMargins({top=10, left=5});
    obj.layout25:setName("layout25");

    obj.label29 = gui.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.layout25);
    obj.label29:setText("Lealdade:");
    obj.label29:setWidth(90);
    obj.label29:setAlign("left");
    obj.label29:setMargins({left=5});
    obj.label29:setName("label29");
    obj.label29:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label29, "fontStyle",  "bold");

    obj.rectangle26 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle26:setParent(obj.layout25);
    obj.rectangle26:setAlign("left");
    obj.rectangle26:setWidth(300);
    obj.rectangle26:setMargins({left=10});
    obj.rectangle26:setName("rectangle26");
    obj.rectangle26:setColor("transparent");
    obj.rectangle26:setStrokeColor("white");
    obj.rectangle26:setStrokeSize(1);
    obj.rectangle26:setXradius(10);
    obj.rectangle26:setYradius(10);
    obj.rectangle26:setCornerType("bevel");
    obj.rectangle26:setStrokeDash("dash");

    obj.comboBox2 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.rectangle26);
    obj.comboBox2:setField("pokeLoyalty");
    obj.comboBox2:setText("Escolha");
    obj.comboBox2:setAlign("client");
    obj.comboBox2:setTransparent(true);
    obj.comboBox2:setMargins({left=5,right=5});
    obj.comboBox2:setHorzTextAlign("center");
    obj.comboBox2:setItems({'0', '1', '2', '3', '4', '5', '6'});
    obj.comboBox2:setValues({'0', '1', '2', '3', '4', '5', '6'});
    obj.comboBox2:setFontColor("White");
    obj.comboBox2:setName("comboBox2");

    obj.layout26 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.loyaltyPopUp);
    obj.layout26:setAlign("top");
    obj.layout26:setHeight(30);
    obj.layout26:setMargins({top=10, left=5});
    obj.layout26:setName("layout26");

    obj.label30 = gui.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.layout26);
    obj.label30:setText("Natureza:");
    obj.label30:setWidth(90);
    obj.label30:setAlign("left");
    obj.label30:setMargins({left=5});
    obj.label30:setName("label30");
    obj.label30:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label30, "fontStyle",  "bold");

    obj.rectangle27 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle27:setParent(obj.layout26);
    obj.rectangle27:setAlign("left");
    obj.rectangle27:setWidth(300);
    obj.rectangle27:setMargins({left=10});
    obj.rectangle27:setName("rectangle27");
    obj.rectangle27:setColor("transparent");
    obj.rectangle27:setStrokeColor("white");
    obj.rectangle27:setStrokeSize(1);
    obj.rectangle27:setXradius(10);
    obj.rectangle27:setYradius(10);
    obj.rectangle27:setCornerType("bevel");
    obj.rectangle27:setStrokeDash("dash");

    obj.comboBox3 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox3:setParent(obj.rectangle27);
    obj.comboBox3:setField("pokeNature");
    obj.comboBox3:setText("Escolha");
    obj.comboBox3:setAlign("client");
    obj.comboBox3:setTransparent(true);
    obj.comboBox3:setMargins({left=5,right=5});
    obj.comboBox3:setHorzTextAlign("center");
    obj.comboBox3:setItems({'Cuddly', 'Distracted', 'Proud', 'Decisive', 'Patient', 'Desperate', 'Lonely', 'Adamant', 'Naughty', 'Brave', 'Stark', 'Bold', 'Impish', 'Lax', 'Relaxed', 'Curious', 'Modest', 'Mild', 'Rash', 'Quiet', 'Dreamy', 'Calm', 'Gentle', 'Careful', 'Sassy', 'Skittish', 'Timid', 'Hasty', 'Jolly', 'Naive', 'Compossed', 'Hardy', 'Docile', 'Bashful', 'Quirky', 'Serious'});
    obj.comboBox3:setValues({'1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31', '32', '33', '34', '35', '36'});
    obj.comboBox3:setFontColor("White");
    obj.comboBox3:setName("comboBox3");

    obj.imageSection = gui.fromHandle(_obj_newObject("layout"));
    obj.imageSection:setParent(obj.firstSection);
    obj.imageSection:setName("imageSection");
    obj.imageSection:setAlign("left");
    obj.imageSection:setWidth(250);
    obj.imageSection:setMargins({top=8, right=25});

    obj.layout27 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.imageSection);
    obj.layout27:setAlign("client");
    obj.layout27:setMargins({bottom=50});
    obj.layout27:setName("layout27");

    obj.rectangle28 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle28:setParent(obj.layout27);
    obj.rectangle28:setAlign("client");
    obj.rectangle28:setColor("white");
    obj.rectangle28:setStrokeColor("black");
    obj.rectangle28:setStrokeSize(1);
    obj.rectangle28:setCornerType("innerLine");
    obj.rectangle28:setStrokeDash("dash");
    obj.rectangle28:setName("rectangle28");

    obj.image1 = gui.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.rectangle28);
    obj.image1:setField("imagemDoPersonagem");
    obj.image1:setEditable(true);
    obj.image1:setStyle("proportional");
    obj.image1:setLeft(5);
    obj.image1:setTop(5);
    obj.image1:setWidth(230);
    obj.image1:setHeight(230);
    obj.image1:setName("image1");

    obj.layout28 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.imageSection);
    obj.layout28:setAlign("client");
    obj.layout28:setMargins({top=250,bottom=10});
    obj.layout28:setName("layout28");

    obj.label31 = gui.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.layout28);
    obj.label31:setText("Nível:");
    obj.label31:setAlign("left");
    obj.label31:setWidth(50);
    obj.label31:setMargins({left=5});
    obj.label31:setName("label31");
    obj.label31:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label31, "fontStyle",  "bold");

    obj.rectangle29 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle29:setParent(obj.layout28);
    obj.rectangle29:setAlign("left");
    obj.rectangle29:setWidth(50);
    obj.rectangle29:setMargins({left=5});
    obj.rectangle29:setName("rectangle29");
    obj.rectangle29:setColor("transparent");
    obj.rectangle29:setStrokeColor("white");
    obj.rectangle29:setStrokeSize(1);
    obj.rectangle29:setXradius(10);
    obj.rectangle29:setYradius(10);
    obj.rectangle29:setCornerType("bevel");
    obj.rectangle29:setStrokeDash("dash");

    obj.edit18 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.rectangle29);
    obj.edit18:setField("pokeLevel");
    obj.edit18:setAlign("client");
    obj.edit18:setType("number");
    obj.edit18:setTransparent(true);
    obj.edit18:setMargins({left=5,right=5});
    obj.edit18:setHorzTextAlign("center");
    obj.edit18:setName("edit18");
    obj.edit18:setFontColor("White");
    lfm_setPropAsString(obj.edit18, "fontStyle",  "bold");

    obj.label32 = gui.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.layout28);
    obj.label32:setText("EXP: ");
    obj.label32:setAlign("left");
    obj.label32:setWidth(30);
    obj.label32:setMargins({left=15});
    obj.label32:setName("label32");
    obj.label32:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label32, "fontStyle",  "bold");

    obj.progressBar1 = gui.fromHandle(_obj_newObject("progressBar"));
    obj.progressBar1:setParent(obj.layout28);
    obj.progressBar1:setAlign("left");
    obj.progressBar1:setWidth(80);
    obj.progressBar1:setHeight(20);
    obj.progressBar1:setColor("blue");
    obj.progressBar1:setHitTest(true);
    obj.progressBar1:setMargins({left=10});
    obj.progressBar1:setColorMode("hl");
    obj.progressBar1:setField("pokeCurXP");
    obj.progressBar1:setFieldMax("pokeTrgtXP");
    obj.progressBar1:setName("progressBar1");

    obj.xpPopUp = gui.fromHandle(_obj_newObject("popup"));
    obj.xpPopUp:setParent(obj.layout28);
    obj.xpPopUp:setName("xpPopUp");
    obj.xpPopUp:setWidth(420);
    obj.xpPopUp:setHeight(110);
    obj.xpPopUp:setBackOpacity(0.5);

    obj.label33 = gui.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.xpPopUp);
    obj.label33:setText("EXPERIÊNCIA");
    obj.label33:setAlign("top");
    obj.label33:setHeight(30);
    obj.label33:setHorzTextAlign("center");
    obj.label33:setName("label33");
    obj.label33:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label33, "fontStyle",  "bold");
    obj.label33:setFontSize(18);

    obj.layout29 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.xpPopUp);
    obj.layout29:setAlign("top");
    obj.layout29:setHeight(50);
    obj.layout29:setMargins({top=10});
    obj.layout29:setName("layout29");

    obj.rectangle30 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle30:setParent(obj.layout29);
    obj.rectangle30:setAlign("left");
    obj.rectangle30:setWidth(170);
    obj.rectangle30:setMargins({left=10});
    obj.rectangle30:setName("rectangle30");
    obj.rectangle30:setColor("transparent");
    obj.rectangle30:setStrokeColor("white");
    obj.rectangle30:setStrokeSize(1);
    obj.rectangle30:setXradius(10);
    obj.rectangle30:setYradius(10);
    obj.rectangle30:setCornerType("bevel");
    obj.rectangle30:setStrokeDash("dash");

    obj.edit19 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.rectangle30);
    obj.edit19:setField("pokeCurXP");
    obj.edit19:setAlign("client");
    obj.edit19:setTransparent(true);
    obj.edit19:setMargins({left=10});
    obj.edit19:setHorzTextAlign("center");
    obj.edit19:setName("edit19");
    obj.edit19:setFontColor("White");
    lfm_setPropAsString(obj.edit19, "fontStyle",  "bold");

    obj.label34 = gui.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.layout29);
    obj.label34:setText("/");
    obj.label34:setAlign("left");
    lfm_setPropAsString(obj.label34, "fontStyle",  "bold");
    obj.label34:setFontSize(18);
    obj.label34:setWidth(10);
    obj.label34:setMargins({left=20});
    obj.label34:setName("label34");
    obj.label34:setFontColor("Moccasin");

    obj.rectangle31 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle31:setParent(obj.layout29);
    obj.rectangle31:setAlign("left");
    obj.rectangle31:setWidth(170);
    obj.rectangle31:setMargins({left=20});
    obj.rectangle31:setName("rectangle31");
    obj.rectangle31:setColor("transparent");
    obj.rectangle31:setStrokeColor("white");
    obj.rectangle31:setStrokeSize(1);
    obj.rectangle31:setXradius(10);
    obj.rectangle31:setYradius(10);
    obj.rectangle31:setCornerType("bevel");
    obj.rectangle31:setStrokeDash("dash");

    obj.edit20 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.rectangle31);
    obj.edit20:setField("pokeTrgtXP");
    obj.edit20:setAlign("client");
    obj.edit20:setTransparent(true);
    obj.edit20:setMargins({left=10});
    obj.edit20:setHorzTextAlign("center");
    obj.edit20:setName("edit20");
    obj.edit20:setFontColor("White");
    lfm_setPropAsString(obj.edit20, "fontStyle",  "bold");

    obj.secondSection = gui.fromHandle(_obj_newObject("layout"));
    obj.secondSection:setParent(obj.rectangle2);
    obj.secondSection:setName("secondSection");
    obj.secondSection:setAlign("top");
    obj.secondSection:setHeight(100);

    obj.rectangle32 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle32:setParent(obj.secondSection);
    obj.rectangle32:setAlign("client");
    obj.rectangle32:setMargins({left=5, right=5});
    obj.rectangle32:setName("rectangle32");
    obj.rectangle32:setColor("transparent");
    obj.rectangle32:setStrokeColor("white");
    obj.rectangle32:setStrokeSize(1);
    obj.rectangle32:setXradius(10);
    obj.rectangle32:setYradius(10);
    obj.rectangle32:setCornerType("bevel");
    obj.rectangle32:setStrokeDash("dash");

    obj.label35 = gui.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.rectangle32);
    obj.label35:setAlign("top");
    obj.label35:setText("CAPACIDADES");
    lfm_setPropAsString(obj.label35, "fontStyle",  "bold");
    obj.label35:setFontSize(14);
    obj.label35:setHorzTextAlign("center");
    obj.label35:setMargins({top=5});
    obj.label35:setName("label35");
    obj.label35:setFontColor("Moccasin");

    obj.layout30 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.rectangle32);
    obj.layout30:setAlign("top");
    obj.layout30:setHeight(25);
    obj.layout30:setMargins({top=5, left=5, right=5});
    obj.layout30:setName("layout30");

    obj.layout31 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.layout30);
    obj.layout31:setAlign("left");
    obj.layout31:setWidth(120);
    obj.layout31:setHeight(25);
    obj.layout31:setName("layout31");

    obj.label36 = gui.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.layout31);
    obj.label36:setText("Solo:");
    obj.label36:setAlign("left");
    obj.label36:setFontSize(12);
    obj.label36:setMargins({left=10});
    obj.label36:setWidth(40);
    obj.label36:setName("label36");
    obj.label36:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label36, "fontStyle",  "bold");

    obj.rectangle33 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle33:setParent(obj.layout31);
    obj.rectangle33:setAlign("left");
    obj.rectangle33:setWidth(50);
    obj.rectangle33:setMargins({left=5});
    obj.rectangle33:setName("rectangle33");
    obj.rectangle33:setColor("transparent");
    obj.rectangle33:setStrokeColor("white");
    obj.rectangle33:setStrokeSize(1);
    obj.rectangle33:setXradius(10);
    obj.rectangle33:setYradius(10);
    obj.rectangle33:setCornerType("bevel");
    obj.rectangle33:setStrokeDash("dash");

    obj.edit21 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.rectangle33);
    obj.edit21:setField("pokeDeslocLand");
    obj.edit21:setAlign("client");
    obj.edit21:setTransparent(true);
    obj.edit21:setMargins({left=5,right=5});
    obj.edit21:setHorzTextAlign("center");
    obj.edit21:setName("edit21");
    obj.edit21:setFontColor("White");
    lfm_setPropAsString(obj.edit21, "fontStyle",  "bold");

    obj.layout32 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.layout30);
    obj.layout32:setAlign("left");
    obj.layout32:setWidth(120);
    obj.layout32:setHeight(25);
    obj.layout32:setName("layout32");

    obj.label37 = gui.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.layout32);
    obj.label37:setText("Nado:");
    obj.label37:setAlign("left");
    obj.label37:setFontSize(12);
    obj.label37:setMargins({left=10});
    obj.label37:setWidth(40);
    obj.label37:setName("label37");
    obj.label37:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label37, "fontStyle",  "bold");

    obj.rectangle34 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle34:setParent(obj.layout32);
    obj.rectangle34:setAlign("left");
    obj.rectangle34:setWidth(50);
    obj.rectangle34:setMargins({left=5});
    obj.rectangle34:setName("rectangle34");
    obj.rectangle34:setColor("transparent");
    obj.rectangle34:setStrokeColor("white");
    obj.rectangle34:setStrokeSize(1);
    obj.rectangle34:setXradius(10);
    obj.rectangle34:setYradius(10);
    obj.rectangle34:setCornerType("bevel");
    obj.rectangle34:setStrokeDash("dash");

    obj.edit22 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.rectangle34);
    obj.edit22:setField("pokeDeslocSwim");
    obj.edit22:setAlign("client");
    obj.edit22:setTransparent(true);
    obj.edit22:setMargins({left=5,right=5});
    obj.edit22:setHorzTextAlign("center");
    obj.edit22:setName("edit22");
    obj.edit22:setFontColor("White");
    lfm_setPropAsString(obj.edit22, "fontStyle",  "bold");

    obj.layout33 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.layout30);
    obj.layout33:setAlign("left");
    obj.layout33:setWidth(120);
    obj.layout33:setHeight(25);
    obj.layout33:setName("layout33");

    obj.label38 = gui.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.layout33);
    obj.label38:setText("Alc.:");
    obj.label38:setAlign("left");
    obj.label38:setFontSize(12);
    obj.label38:setMargins({left=10});
    obj.label38:setWidth(40);
    obj.label38:setName("label38");
    obj.label38:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label38, "fontStyle",  "bold");

    obj.rectangle35 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle35:setParent(obj.layout33);
    obj.rectangle35:setAlign("left");
    obj.rectangle35:setWidth(50);
    obj.rectangle35:setMargins({left=5});
    obj.rectangle35:setName("rectangle35");
    obj.rectangle35:setColor("transparent");
    obj.rectangle35:setStrokeColor("white");
    obj.rectangle35:setStrokeSize(1);
    obj.rectangle35:setXradius(10);
    obj.rectangle35:setYradius(10);
    obj.rectangle35:setCornerType("bevel");
    obj.rectangle35:setStrokeDash("dash");

    obj.edit23 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.rectangle35);
    obj.edit23:setField("pokeDeslocReach");
    obj.edit23:setAlign("client");
    obj.edit23:setTransparent(true);
    obj.edit23:setMargins({left=5,right=5});
    obj.edit23:setHorzTextAlign("center");
    obj.edit23:setName("edit23");
    obj.edit23:setFontColor("White");
    lfm_setPropAsString(obj.edit23, "fontStyle",  "bold");

    obj.layout34 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.layout30);
    obj.layout34:setAlign("left");
    obj.layout34:setWidth(210);
    obj.layout34:setHeight(25);
    obj.layout34:setName("layout34");

    obj.label39 = gui.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.layout34);
    obj.label39:setText("Salto Horizontal:");
    obj.label39:setAlign("left");
    obj.label39:setFontSize(12);
    obj.label39:setMargins({left=10});
    obj.label39:setWidth(100);
    obj.label39:setName("label39");
    obj.label39:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label39, "fontStyle",  "bold");

    obj.rectangle36 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle36:setParent(obj.layout34);
    obj.rectangle36:setAlign("left");
    obj.rectangle36:setWidth(50);
    obj.rectangle36:setMargins({left=5});
    obj.rectangle36:setName("rectangle36");
    obj.rectangle36:setColor("transparent");
    obj.rectangle36:setStrokeColor("white");
    obj.rectangle36:setStrokeSize(1);
    obj.rectangle36:setXradius(10);
    obj.rectangle36:setYradius(10);
    obj.rectangle36:setCornerType("bevel");
    obj.rectangle36:setStrokeDash("dash");

    obj.edit24 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.rectangle36);
    obj.edit24:setField("pokeDeslocJH");
    obj.edit24:setAlign("client");
    obj.edit24:setTransparent(true);
    obj.edit24:setMargins({left=5,right=5});
    obj.edit24:setHorzTextAlign("center");
    obj.edit24:setName("edit24");
    obj.edit24:setFontColor("White");
    lfm_setPropAsString(obj.edit24, "fontStyle",  "bold");

    obj.layout35 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.rectangle32);
    obj.layout35:setAlign("top");
    obj.layout35:setHeight(25);
    obj.layout35:setMargins({top=10, left=5, right=5});
    obj.layout35:setName("layout35");

    obj.layout36 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.layout35);
    obj.layout36:setAlign("left");
    obj.layout36:setWidth(120);
    obj.layout36:setHeight(25);
    obj.layout36:setName("layout36");

    obj.label40 = gui.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.layout36);
    obj.label40:setText("Cavar:");
    obj.label40:setAlign("left");
    obj.label40:setFontSize(12);
    obj.label40:setMargins({left=10});
    obj.label40:setWidth(40);
    obj.label40:setName("label40");
    obj.label40:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label40, "fontStyle",  "bold");

    obj.rectangle37 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle37:setParent(obj.layout36);
    obj.rectangle37:setAlign("left");
    obj.rectangle37:setWidth(50);
    obj.rectangle37:setMargins({left=5});
    obj.rectangle37:setName("rectangle37");
    obj.rectangle37:setColor("transparent");
    obj.rectangle37:setStrokeColor("white");
    obj.rectangle37:setStrokeSize(1);
    obj.rectangle37:setXradius(10);
    obj.rectangle37:setYradius(10);
    obj.rectangle37:setCornerType("bevel");
    obj.rectangle37:setStrokeDash("dash");

    obj.edit25 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.rectangle37);
    obj.edit25:setField("pokeDeslocSub");
    obj.edit25:setAlign("client");
    obj.edit25:setTransparent(true);
    obj.edit25:setMargins({left=5,right=5});
    obj.edit25:setHorzTextAlign("center");
    obj.edit25:setName("edit25");
    obj.edit25:setFontColor("White");
    lfm_setPropAsString(obj.edit25, "fontStyle",  "bold");

    obj.layout37 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.layout35);
    obj.layout37:setAlign("left");
    obj.layout37:setWidth(120);
    obj.layout37:setHeight(25);
    obj.layout37:setName("layout37");

    obj.label41 = gui.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.layout37);
    obj.label41:setText("Voo:");
    obj.label41:setAlign("left");
    obj.label41:setFontSize(12);
    obj.label41:setMargins({left=10});
    obj.label41:setWidth(40);
    obj.label41:setName("label41");
    obj.label41:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label41, "fontStyle",  "bold");

    obj.rectangle38 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle38:setParent(obj.layout37);
    obj.rectangle38:setAlign("left");
    obj.rectangle38:setWidth(50);
    obj.rectangle38:setMargins({left=5});
    obj.rectangle38:setName("rectangle38");
    obj.rectangle38:setColor("transparent");
    obj.rectangle38:setStrokeColor("white");
    obj.rectangle38:setStrokeSize(1);
    obj.rectangle38:setXradius(10);
    obj.rectangle38:setYradius(10);
    obj.rectangle38:setCornerType("bevel");
    obj.rectangle38:setStrokeDash("dash");

    obj.edit26 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.rectangle38);
    obj.edit26:setField("pokeDeslocFly");
    obj.edit26:setAlign("client");
    obj.edit26:setTransparent(true);
    obj.edit26:setMargins({left=5,right=5});
    obj.edit26:setHorzTextAlign("center");
    obj.edit26:setName("edit26");
    obj.edit26:setFontColor("White");
    lfm_setPropAsString(obj.edit26, "fontStyle",  "bold");

    obj.layout38 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.layout35);
    obj.layout38:setAlign("left");
    obj.layout38:setWidth(120);
    obj.layout38:setHeight(25);
    obj.layout38:setName("layout38");

    obj.label42 = gui.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.layout38);
    obj.label42:setText("Poder:");
    obj.label42:setAlign("left");
    obj.label42:setFontSize(12);
    obj.label42:setMargins({left=10});
    obj.label42:setWidth(40);
    obj.label42:setName("label42");
    obj.label42:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label42, "fontStyle",  "bold");

    obj.rectangle39 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle39:setParent(obj.layout38);
    obj.rectangle39:setAlign("left");
    obj.rectangle39:setWidth(50);
    obj.rectangle39:setMargins({left=5});
    obj.rectangle39:setName("rectangle39");
    obj.rectangle39:setColor("transparent");
    obj.rectangle39:setStrokeColor("white");
    obj.rectangle39:setStrokeSize(1);
    obj.rectangle39:setXradius(10);
    obj.rectangle39:setYradius(10);
    obj.rectangle39:setCornerType("bevel");
    obj.rectangle39:setStrokeDash("dash");

    obj.edit27 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.rectangle39);
    obj.edit27:setField("pokeCapPower");
    obj.edit27:setAlign("client");
    obj.edit27:setTransparent(true);
    obj.edit27:setMargins({left=5,right=5});
    obj.edit27:setHorzTextAlign("center");
    obj.edit27:setName("edit27");
    obj.edit27:setFontColor("White");
    lfm_setPropAsString(obj.edit27, "fontStyle",  "bold");

    obj.layout39 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.layout35);
    obj.layout39:setAlign("left");
    obj.layout39:setWidth(210);
    obj.layout39:setHeight(25);
    obj.layout39:setName("layout39");

    obj.label43 = gui.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.layout39);
    obj.label43:setText("Salto Vertical:");
    obj.label43:setAlign("left");
    obj.label43:setFontSize(12);
    obj.label43:setMargins({left=10});
    obj.label43:setWidth(100);
    obj.label43:setName("label43");
    obj.label43:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label43, "fontStyle",  "bold");

    obj.rectangle40 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle40:setParent(obj.layout39);
    obj.rectangle40:setAlign("left");
    obj.rectangle40:setWidth(50);
    obj.rectangle40:setMargins({left=5});
    obj.rectangle40:setName("rectangle40");
    obj.rectangle40:setColor("transparent");
    obj.rectangle40:setStrokeColor("white");
    obj.rectangle40:setStrokeSize(1);
    obj.rectangle40:setXradius(10);
    obj.rectangle40:setYradius(10);
    obj.rectangle40:setCornerType("bevel");
    obj.rectangle40:setStrokeDash("dash");

    obj.edit28 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.rectangle40);
    obj.edit28:setField("pokeDeslocJV");
    obj.edit28:setAlign("client");
    obj.edit28:setTransparent(true);
    obj.edit28:setMargins({left=5,right=5});
    obj.edit28:setHorzTextAlign("center");
    obj.edit28:setName("edit28");
    obj.edit28:setFontColor("White");
    lfm_setPropAsString(obj.edit28, "fontStyle",  "bold");

    obj.flowPart2 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart2:setParent(obj.rectangle2);
    obj.flowPart2:setAlign("top");
    obj.flowPart2:setMinWidth(600);
    obj.flowPart2:setMaxWidth(650);
    obj.flowPart2:setHeight(400);
    obj.flowPart2:setAdjustHeightToLine(true);
    obj.flowPart2:setMargins({left=5, top=5, right=5});
    obj.flowPart2:setName("flowPart2");

    obj.thirdSection = gui.fromHandle(_obj_newObject("layout"));
    obj.thirdSection:setParent(obj.flowPart2);
    obj.thirdSection:setName("thirdSection");
    obj.thirdSection:setAlign("client");

    obj.tabControl1 = gui.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl1:setParent(obj.thirdSection);
    obj.tabControl1:setLeft(20);
    obj.tabControl1:setTop(20);
    obj.tabControl1:setAlign("client");
    obj.tabControl1:setName("tabControl1");

    obj.tab1 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab1:setParent(obj.tabControl1);
    obj.tab1:setTitle("Stats");
    obj.tab1:setName("tab1");

    obj.layout40 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.tab1);
    obj.layout40:setAlign("top");
    obj.layout40:setWidth(600);
    obj.layout40:setHeight(50);
    obj.layout40:setName("layout40");

    obj.layout41 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.layout40);
    obj.layout41:setAlign("left");
    obj.layout41:setWidth(350);
    obj.layout41:setHeight(50);
    obj.layout41:setMargins({top=10});
    obj.layout41:setName("layout41");

    obj.label44 = gui.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.layout41);
    obj.label44:setText("Relação Base:");
    obj.label44:setAlign("left");
    obj.label44:setMargins({left=10});
    obj.label44:setWidth(50);
    obj.label44:setName("label44");
    obj.label44:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label44, "fontStyle",  "bold");

    obj.rectangle41 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle41:setParent(obj.layout41);
    obj.rectangle41:setAlign("left");
    obj.rectangle41:setWidth(270);
    obj.rectangle41:setColor("transparent");
    obj.rectangle41:setStrokeColor("white");
    obj.rectangle41:setStrokeSize(1);
    obj.rectangle41:setXradius(10);
    obj.rectangle41:setYradius(10);
    obj.rectangle41:setCornerType("round");
    obj.rectangle41:setStrokeDash("dash");
    obj.rectangle41:setMargins({left=10});
    obj.rectangle41:setName("rectangle41");

    obj.edit29 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.rectangle41);
    obj.edit29:setField("pokeBaseRelation");
    obj.edit29:setAlign("client");
    obj.edit29:setTransparent(true);
    obj.edit29:setMargins({left=5,right=5});
    obj.edit29:setHorzTextAlign("center");
    obj.edit29:setTextPrompt("SpDef | Atk > Def | Speed > HP > SpAtk");
    obj.edit29:setName("edit29");
    obj.edit29:setFontColor("White");
    lfm_setPropAsString(obj.edit29, "fontStyle",  "bold");

    obj.layout42 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.layout40);
    obj.layout42:setAlign("left");
    obj.layout42:setWidth(200);
    obj.layout42:setHeight(50);
    obj.layout42:setMargins({top=10, right=5});
    obj.layout42:setName("layout42");

    obj.label45 = gui.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.layout42);
    obj.label45:setText("Pontos de Vida:");
    obj.label45:setAlign("left");
    obj.label45:setMargins({left=10});
    obj.label45:setWidth(50);
    obj.label45:setName("label45");
    obj.label45:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label45, "fontStyle",  "bold");

    obj.rectangle42 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle42:setParent(obj.layout42);
    obj.rectangle42:setAlign("left");
    obj.rectangle42:setWidth(100);
    obj.rectangle42:setColor("transparent");
    obj.rectangle42:setStrokeColor("white");
    obj.rectangle42:setStrokeSize(1);
    obj.rectangle42:setXradius(10);
    obj.rectangle42:setYradius(10);
    obj.rectangle42:setCornerType("round");
    obj.rectangle42:setStrokeDash("dash");
    obj.rectangle42:setMargins({left=10});
    obj.rectangle42:setName("rectangle42");

    obj.edit30 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.rectangle42);
    obj.edit30:setField("pokeCurPV");
    obj.edit30:setType("number");
    obj.edit30:setReadOnly(true);
    obj.edit30:setAlign("client");
    obj.edit30:setTransparent(true);
    obj.edit30:setMargins({left=5, right=52});
    obj.edit30:setHorzTextAlign("center");
    obj.edit30:setName("edit30");
    obj.edit30:setFontColor("White");
    lfm_setPropAsString(obj.edit30, "fontStyle",  "bold");

    obj.label46 = gui.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.rectangle42);
    obj.label46:setText("/");
    obj.label46:setFontSize(14);
    obj.label46:setAlign("client");
    obj.label46:setWidth(50);
    obj.label46:setMargins({left=50});
    obj.label46:setName("label46");
    obj.label46:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label46, "fontStyle",  "bold");

    obj.label47 = gui.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.rectangle42);
    obj.label47:setField("pokePV");
    obj.label47:setFontSize(14);
    obj.label47:setAlign("client");
    obj.label47:setWidth(50);
    obj.label47:setMargins({left=70});
    obj.label47:setName("label47");
    obj.label47:setFontColor("Orange");
    lfm_setPropAsString(obj.label47, "fontStyle",  "bold");

    obj.label48 = gui.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.layout42);
    obj.label48:setField("pokePV");
    obj.label48:setFontSize(14);
    obj.label48:setAlign("client");
    obj.label48:setWidth(50);
    obj.label48:setMargins({left=70});
    obj.label48:setName("label48");
    obj.label48:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label48, "fontStyle",  "bold");

    obj.layout43 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.tab1);
    obj.layout43:setAlign("top");
    obj.layout43:setWidth(600);
    obj.layout43:setHeight(110);
    obj.layout43:setMargins({top=10});
    obj.layout43:setName("layout43");

    obj.rectangle43 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle43:setParent(obj.layout43);
    obj.rectangle43:setAlign("client");
    obj.rectangle43:setWidth(60);
    obj.rectangle43:setMargins({left=5, right=5});
    obj.rectangle43:setName("rectangle43");
    obj.rectangle43:setColor("transparent");
    obj.rectangle43:setStrokeColor("white");
    obj.rectangle43:setStrokeSize(1);
    obj.rectangle43:setXradius(10);
    obj.rectangle43:setYradius(10);
    obj.rectangle43:setCornerType("bevel");
    obj.rectangle43:setStrokeDash("dash");

    obj.layout44 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.rectangle43);
    obj.layout44:setAlign("top");
    obj.layout44:setWidth(600);
    obj.layout44:setHeight(40);
    obj.layout44:setMargins({top=10});
    obj.layout44:setName("layout44");

    obj.layout45 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.layout44);
    obj.layout45:setAlign("left");
    obj.layout45:setWidth(170);
    obj.layout45:setHeight(40);
    obj.layout45:setMargins({right=5});
    obj.layout45:setName("layout45");

    obj.label49 = gui.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.layout45);
    obj.label49:setText("HP:");
    lfm_setPropAsString(obj.label49, "fontStyle",  "bold");
    obj.label49:setAlign("left");
    obj.label49:setMargins({left=10});
    obj.label49:setWidth(60);
    obj.label49:setName("label49");
    obj.label49:setFontColor("Moccasin");

    obj.rectangle44 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle44:setParent(obj.layout45);
    obj.rectangle44:setAlign("left");
    obj.rectangle44:setWidth(60);
    obj.rectangle44:setMargins({left=10});
    obj.rectangle44:setName("rectangle44");
    obj.rectangle44:setColor("transparent");
    obj.rectangle44:setStrokeColor("Orange");
    obj.rectangle44:setStrokeSize(1);
    obj.rectangle44:setXradius(10);
    obj.rectangle44:setYradius(10);
    obj.rectangle44:setCornerType("innerRound");
    obj.rectangle44:setStrokeDash("dash");

    obj.label50 = gui.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.rectangle44);
    obj.label50:setField("pokeHP");
    obj.label50:setAlign("client");
    obj.label50:setMargins({left=5,right=5});
    obj.label50:setHorzTextAlign("center");
    obj.label50:setName("label50");
    obj.label50:setFontColor("Orange");
    lfm_setPropAsString(obj.label50, "fontStyle",  "bold");

    obj.hpPopUp = gui.fromHandle(_obj_newObject("popup"));
    obj.hpPopUp:setParent(obj.layout45);
    obj.hpPopUp:setName("hpPopUp");
    obj.hpPopUp:setWidth(420);
    obj.hpPopUp:setHeight(150);
    obj.hpPopUp:setBackOpacity(0.5);

    obj.label51 = gui.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.hpPopUp);
    obj.label51:setText("HP");
    obj.label51:setAlign("top");
    obj.label51:setHeight(30);
    obj.label51:setHorzTextAlign("center");
    obj.label51:setName("label51");
    obj.label51:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label51, "fontStyle",  "bold");
    obj.label51:setFontSize(18);

    obj.layout46 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout46:setParent(obj.hpPopUp);
    obj.layout46:setAlign("top");
    obj.layout46:setHeight(150);
    obj.layout46:setMargins({top=10});
    obj.layout46:setName("layout46");

    obj.layout47 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout47:setParent(obj.layout46);
    obj.layout47:setAlign("top");
    obj.layout47:setHeight(40);
    obj.layout47:setWidth(400);
    obj.layout47:setMargins({bottom=4});
    obj.layout47:setName("layout47");

    obj.label52 = gui.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.layout47);
    obj.label52:setText("Total");
    lfm_setPropAsString(obj.label52, "fontStyle",  "bold");
    obj.label52:setWordWrap(true);
    obj.label52:setHorzTextAlign("center");
    obj.label52:setAlign("left");
    obj.label52:setMargins({left=10});
    obj.label52:setWidth(70);
    obj.label52:setName("label52");
    obj.label52:setFontColor("Moccasin");

    obj.label53 = gui.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.layout47);
    obj.label53:setText("Base");
    lfm_setPropAsString(obj.label53, "fontStyle",  "bold");
    obj.label53:setWordWrap(true);
    obj.label53:setHorzTextAlign("center");
    obj.label53:setAlign("left");
    obj.label53:setMargins({left=10});
    obj.label53:setWidth(70);
    obj.label53:setName("label53");
    obj.label53:setFontColor("Moccasin");

    obj.label54 = gui.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.layout47);
    obj.label54:setText("Progresso");
    lfm_setPropAsString(obj.label54, "fontStyle",  "bold");
    obj.label54:setWordWrap(true);
    obj.label54:setHorzTextAlign("center");
    obj.label54:setAlign("left");
    obj.label54:setMargins({left=10});
    obj.label54:setWidth(70);
    obj.label54:setName("label54");
    obj.label54:setFontColor("Moccasin");

    obj.label55 = gui.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.layout47);
    obj.label55:setText("Natureza");
    lfm_setPropAsString(obj.label55, "fontStyle",  "bold");
    obj.label55:setWordWrap(true);
    obj.label55:setHorzTextAlign("center");
    obj.label55:setAlign("left");
    obj.label55:setMargins({left=10});
    obj.label55:setWidth(70);
    obj.label55:setName("label55");
    obj.label55:setFontColor("Moccasin");

    obj.label56 = gui.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.layout47);
    obj.label56:setText("Lesões");
    lfm_setPropAsString(obj.label56, "fontStyle",  "bold");
    obj.label56:setWordWrap(true);
    obj.label56:setHorzTextAlign("center");
    obj.label56:setAlign("left");
    obj.label56:setMargins({left=10});
    obj.label56:setWidth(70);
    obj.label56:setName("label56");
    obj.label56:setFontColor("Moccasin");

    obj.layout48 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout48:setParent(obj.layout46);
    obj.layout48:setAlign("top");
    obj.layout48:setMargins({bottom=4});
    obj.layout48:setName("layout48");

    obj.rectangle45 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle45:setParent(obj.layout48);
    obj.rectangle45:setAlign("left");
    obj.rectangle45:setWidth(70);
    obj.rectangle45:setMargins({left=10});
    obj.rectangle45:setName("rectangle45");
    obj.rectangle45:setColor("transparent");
    obj.rectangle45:setStrokeColor("Orange");
    obj.rectangle45:setStrokeSize(1);
    obj.rectangle45:setXradius(10);
    obj.rectangle45:setYradius(10);
    obj.rectangle45:setCornerType("innerRound");
    obj.rectangle45:setStrokeDash("dash");

    obj.label57 = gui.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.rectangle45);
    obj.label57:setField("pokeHP");
    obj.label57:setAlign("client");
    obj.label57:setHorzTextAlign("center");
    obj.label57:setWidth(40);
    obj.label57:setName("label57");
    obj.label57:setFontColor("Orange");
    lfm_setPropAsString(obj.label57, "fontStyle",  "bold");

    obj.rectangle46 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle46:setParent(obj.layout48);
    obj.rectangle46:setAlign("left");
    obj.rectangle46:setWidth(70);
    obj.rectangle46:setMargins({left=10});
    obj.rectangle46:setName("rectangle46");
    obj.rectangle46:setColor("transparent");
    obj.rectangle46:setStrokeColor("white");
    obj.rectangle46:setStrokeSize(1);
    obj.rectangle46:setXradius(10);
    obj.rectangle46:setYradius(10);
    obj.rectangle46:setCornerType("bevel");
    obj.rectangle46:setStrokeDash("dash");

    obj.edit31 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.rectangle46);
    obj.edit31:setField("pokeHPBase");
    obj.edit31:setTransparent(true);
    lfm_setPropAsString(obj.edit31, "fontStyle",  "bold");
    obj.edit31:setAlign("client");
    obj.edit31:setHorzTextAlign("center");
    obj.edit31:setWidth(40);
    obj.edit31:setName("edit31");
    obj.edit31:setFontColor("White");

    obj.rectangle47 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle47:setParent(obj.layout48);
    obj.rectangle47:setAlign("left");
    obj.rectangle47:setWidth(70);
    obj.rectangle47:setMargins({left=10});
    obj.rectangle47:setName("rectangle47");
    obj.rectangle47:setColor("transparent");
    obj.rectangle47:setStrokeColor("white");
    obj.rectangle47:setStrokeSize(1);
    obj.rectangle47:setXradius(10);
    obj.rectangle47:setYradius(10);
    obj.rectangle47:setCornerType("bevel");
    obj.rectangle47:setStrokeDash("dash");

    obj.edit32 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.rectangle47);
    obj.edit32:setField("pokeHPProg");
    obj.edit32:setTransparent(true);
    lfm_setPropAsString(obj.edit32, "fontStyle",  "bold");
    obj.edit32:setAlign("client");
    obj.edit32:setHorzTextAlign("center");
    obj.edit32:setWidth(40);
    obj.edit32:setName("edit32");
    obj.edit32:setFontColor("White");

    obj.rectangle48 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle48:setParent(obj.layout48);
    obj.rectangle48:setAlign("left");
    obj.rectangle48:setWidth(70);
    obj.rectangle48:setMargins({left=10});
    obj.rectangle48:setName("rectangle48");
    obj.rectangle48:setColor("transparent");
    obj.rectangle48:setStrokeColor("Orange");
    obj.rectangle48:setStrokeSize(1);
    obj.rectangle48:setXradius(10);
    obj.rectangle48:setYradius(10);
    obj.rectangle48:setCornerType("innerRound");
    obj.rectangle48:setStrokeDash("dash");

    obj.label58 = gui.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.rectangle48);
    obj.label58:setField("pokeNatureHP");
    obj.label58:setAlign("client");
    obj.label58:setHorzTextAlign("center");
    obj.label58:setWidth(40);
    obj.label58:setName("label58");
    obj.label58:setFontColor("Orange");
    lfm_setPropAsString(obj.label58, "fontStyle",  "bold");

    obj.rectangle49 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle49:setParent(obj.layout48);
    obj.rectangle49:setAlign("left");
    obj.rectangle49:setWidth(70);
    obj.rectangle49:setMargins({left=10});
    obj.rectangle49:setName("rectangle49");
    obj.rectangle49:setColor("transparent");
    obj.rectangle49:setStrokeColor("white");
    obj.rectangle49:setStrokeSize(1);
    obj.rectangle49:setXradius(10);
    obj.rectangle49:setYradius(10);
    obj.rectangle49:setCornerType("bevel");
    obj.rectangle49:setStrokeDash("dash");

    obj.comboBox4 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox4:setParent(obj.rectangle49);
    obj.comboBox4:setField("pokeInjuriesQtd");
    obj.comboBox4:setText("Escolha");
    obj.comboBox4:setAlign("client");
    obj.comboBox4:setTransparent(true);
    obj.comboBox4:setMargins({left=10});
    obj.comboBox4:setHorzTextAlign("center");
    obj.comboBox4:setItems({'0', '1', '2', '3', '4', '5'});
    obj.comboBox4:setValues({'0', '1', '2', '3', '4', '5',});
    obj.comboBox4:setValue("0");
    obj.comboBox4:setFontColor("White");
    obj.comboBox4:setName("comboBox4");

    obj.button3 = gui.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout45);
    obj.button3:setAlign("left");
    obj.button3:setText("i");
    obj.button3:setWidth(15);
    obj.button3:setMargins({left=10});
    obj.button3:setName("button3");

    obj.layout49 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout49:setParent(obj.layout44);
    obj.layout49:setAlign("left");
    obj.layout49:setWidth(170);
    obj.layout49:setHeight(40);
    obj.layout49:setMargins({right=5});
    obj.layout49:setName("layout49");

    obj.label59 = gui.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.layout49);
    obj.label59:setText("Attack:");
    lfm_setPropAsString(obj.label59, "fontStyle",  "bold");
    obj.label59:setAlign("left");
    obj.label59:setMargins({left=10});
    obj.label59:setWidth(60);
    obj.label59:setName("label59");
    obj.label59:setFontColor("Moccasin");

    obj.rectangle50 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle50:setParent(obj.layout49);
    obj.rectangle50:setAlign("left");
    obj.rectangle50:setWidth(60);
    obj.rectangle50:setMargins({left=10});
    obj.rectangle50:setName("rectangle50");
    obj.rectangle50:setColor("transparent");
    obj.rectangle50:setStrokeColor("Orange");
    obj.rectangle50:setStrokeSize(1);
    obj.rectangle50:setXradius(10);
    obj.rectangle50:setYradius(10);
    obj.rectangle50:setCornerType("innerRound");
    obj.rectangle50:setStrokeDash("dash");

    obj.label60 = gui.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.rectangle50);
    obj.label60:setField("pokeAttack");
    obj.label60:setAlign("client");
    obj.label60:setMargins({left=5,right=5});
    obj.label60:setHorzTextAlign("center");
    obj.label60:setName("label60");
    obj.label60:setFontColor("Orange");
    lfm_setPropAsString(obj.label60, "fontStyle",  "bold");

    obj.atkPopUp = gui.fromHandle(_obj_newObject("popup"));
    obj.atkPopUp:setParent(obj.layout49);
    obj.atkPopUp:setName("atkPopUp");
    obj.atkPopUp:setWidth(420);
    obj.atkPopUp:setHeight(150);
    obj.atkPopUp:setBackOpacity(0.5);

    obj.label61 = gui.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.atkPopUp);
    obj.label61:setText("Attack");
    obj.label61:setAlign("top");
    obj.label61:setHeight(30);
    obj.label61:setHorzTextAlign("center");
    obj.label61:setName("label61");
    obj.label61:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label61, "fontStyle",  "bold");
    obj.label61:setFontSize(18);

    obj.layout50 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout50:setParent(obj.atkPopUp);
    obj.layout50:setAlign("top");
    obj.layout50:setHeight(150);
    obj.layout50:setMargins({top=10});
    obj.layout50:setName("layout50");

    obj.layout51 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout51:setParent(obj.layout50);
    obj.layout51:setAlign("top");
    obj.layout51:setHeight(40);
    obj.layout51:setWidth(400);
    obj.layout51:setMargins({bottom=4});
    obj.layout51:setName("layout51");

    obj.label62 = gui.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.layout51);
    obj.label62:setText("Total");
    lfm_setPropAsString(obj.label62, "fontStyle",  "bold");
    obj.label62:setWordWrap(true);
    obj.label62:setHorzTextAlign("center");
    obj.label62:setAlign("left");
    obj.label62:setMargins({left=10});
    obj.label62:setWidth(70);
    obj.label62:setName("label62");
    obj.label62:setFontColor("Moccasin");

    obj.label63 = gui.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.layout51);
    obj.label63:setText("Base");
    lfm_setPropAsString(obj.label63, "fontStyle",  "bold");
    obj.label63:setWordWrap(true);
    obj.label63:setHorzTextAlign("center");
    obj.label63:setAlign("left");
    obj.label63:setMargins({left=10});
    obj.label63:setWidth(70);
    obj.label63:setName("label63");
    obj.label63:setFontColor("Moccasin");

    obj.label64 = gui.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.layout51);
    obj.label64:setText("Progresso");
    lfm_setPropAsString(obj.label64, "fontStyle",  "bold");
    obj.label64:setWordWrap(true);
    obj.label64:setHorzTextAlign("center");
    obj.label64:setAlign("left");
    obj.label64:setMargins({left=10});
    obj.label64:setWidth(70);
    obj.label64:setName("label64");
    obj.label64:setFontColor("Moccasin");

    obj.label65 = gui.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.layout51);
    obj.label65:setText("Natureza");
    lfm_setPropAsString(obj.label65, "fontStyle",  "bold");
    obj.label65:setWordWrap(true);
    obj.label65:setHorzTextAlign("center");
    obj.label65:setAlign("left");
    obj.label65:setMargins({left=10});
    obj.label65:setWidth(70);
    obj.label65:setName("label65");
    obj.label65:setFontColor("Moccasin");

    obj.label66 = gui.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.layout51);
    obj.label66:setText("Combat Stage");
    lfm_setPropAsString(obj.label66, "fontStyle",  "bold");
    obj.label66:setWordWrap(true);
    obj.label66:setHorzTextAlign("center");
    obj.label66:setAlign("left");
    obj.label66:setMargins({left=10});
    obj.label66:setWidth(70);
    obj.label66:setName("label66");
    obj.label66:setFontColor("Moccasin");

    obj.layout52 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout52:setParent(obj.layout50);
    obj.layout52:setAlign("top");
    obj.layout52:setMargins({bottom=4});
    obj.layout52:setName("layout52");

    obj.rectangle51 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle51:setParent(obj.layout52);
    obj.rectangle51:setAlign("left");
    obj.rectangle51:setWidth(70);
    obj.rectangle51:setMargins({left=10});
    obj.rectangle51:setName("rectangle51");
    obj.rectangle51:setColor("transparent");
    obj.rectangle51:setStrokeColor("Orange");
    obj.rectangle51:setStrokeSize(1);
    obj.rectangle51:setXradius(10);
    obj.rectangle51:setYradius(10);
    obj.rectangle51:setCornerType("innerRound");
    obj.rectangle51:setStrokeDash("dash");

    obj.label67 = gui.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.rectangle51);
    obj.label67:setField("pokeAttack");
    obj.label67:setAlign("client");
    obj.label67:setHorzTextAlign("center");
    obj.label67:setWidth(40);
    obj.label67:setName("label67");
    obj.label67:setFontColor("Orange");
    lfm_setPropAsString(obj.label67, "fontStyle",  "bold");

    obj.rectangle52 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle52:setParent(obj.layout52);
    obj.rectangle52:setAlign("left");
    obj.rectangle52:setWidth(70);
    obj.rectangle52:setMargins({left=10});
    obj.rectangle52:setName("rectangle52");
    obj.rectangle52:setColor("transparent");
    obj.rectangle52:setStrokeColor("white");
    obj.rectangle52:setStrokeSize(1);
    obj.rectangle52:setXradius(10);
    obj.rectangle52:setYradius(10);
    obj.rectangle52:setCornerType("bevel");
    obj.rectangle52:setStrokeDash("dash");

    obj.edit33 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.rectangle52);
    obj.edit33:setField("pokeAttackBase");
    obj.edit33:setTransparent(true);
    lfm_setPropAsString(obj.edit33, "fontStyle",  "bold");
    obj.edit33:setAlign("client");
    obj.edit33:setHorzTextAlign("center");
    obj.edit33:setWidth(40);
    obj.edit33:setName("edit33");
    obj.edit33:setFontColor("White");

    obj.rectangle53 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle53:setParent(obj.layout52);
    obj.rectangle53:setAlign("left");
    obj.rectangle53:setWidth(70);
    obj.rectangle53:setMargins({left=10});
    obj.rectangle53:setName("rectangle53");
    obj.rectangle53:setColor("transparent");
    obj.rectangle53:setStrokeColor("white");
    obj.rectangle53:setStrokeSize(1);
    obj.rectangle53:setXradius(10);
    obj.rectangle53:setYradius(10);
    obj.rectangle53:setCornerType("bevel");
    obj.rectangle53:setStrokeDash("dash");

    obj.edit34 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.rectangle53);
    obj.edit34:setField("pokeAttackProg");
    obj.edit34:setTransparent(true);
    lfm_setPropAsString(obj.edit34, "fontStyle",  "bold");
    obj.edit34:setAlign("client");
    obj.edit34:setHorzTextAlign("center");
    obj.edit34:setWidth(40);
    obj.edit34:setName("edit34");
    obj.edit34:setFontColor("White");

    obj.rectangle54 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle54:setParent(obj.layout52);
    obj.rectangle54:setAlign("left");
    obj.rectangle54:setWidth(70);
    obj.rectangle54:setMargins({left=10});
    obj.rectangle54:setName("rectangle54");
    obj.rectangle54:setColor("transparent");
    obj.rectangle54:setStrokeColor("Orange");
    obj.rectangle54:setStrokeSize(1);
    obj.rectangle54:setXradius(10);
    obj.rectangle54:setYradius(10);
    obj.rectangle54:setCornerType("innerRound");
    obj.rectangle54:setStrokeDash("dash");

    obj.label68 = gui.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.rectangle54);
    obj.label68:setField("pokeNatureAtk");
    obj.label68:setAlign("client");
    obj.label68:setHorzTextAlign("center");
    obj.label68:setWidth(40);
    obj.label68:setName("label68");
    obj.label68:setFontColor("Orange");
    lfm_setPropAsString(obj.label68, "fontStyle",  "bold");

    obj.rectangle55 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle55:setParent(obj.layout52);
    obj.rectangle55:setAlign("left");
    obj.rectangle55:setWidth(70);
    obj.rectangle55:setMargins({left=10});
    obj.rectangle55:setName("rectangle55");
    obj.rectangle55:setColor("transparent");
    obj.rectangle55:setStrokeColor("white");
    obj.rectangle55:setStrokeSize(1);
    obj.rectangle55:setXradius(10);
    obj.rectangle55:setYradius(10);
    obj.rectangle55:setCornerType("bevel");
    obj.rectangle55:setStrokeDash("dash");

    obj.comboBox5 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox5:setParent(obj.rectangle55);
    obj.comboBox5:setField("pokeCmbtStgAtk");
    obj.comboBox5:setText("Escolha");
    obj.comboBox5:setAlign("client");
    obj.comboBox5:setTransparent(true);
    obj.comboBox5:setMargins({left=5,right=5});
    obj.comboBox5:setHorzTextAlign("center");
    obj.comboBox5:setItems({'-6', '-5', '-4', '-3', '-2', '-1', '0', '1', '2', '3', '4', '5', '6'});
    obj.comboBox5:setValues({'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'});
    obj.comboBox5:setValue("6");
    obj.comboBox5:setFontColor("White");
    obj.comboBox5:setName("comboBox5");

    obj.button4 = gui.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.layout49);
    obj.button4:setAlign("left");
    obj.button4:setText("i");
    obj.button4:setWidth(15);
    obj.button4:setMargins({left=10});
    obj.button4:setName("button4");

    obj.layout53 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout53:setParent(obj.layout44);
    obj.layout53:setAlign("left");
    obj.layout53:setWidth(170);
    obj.layout53:setHeight(40);
    obj.layout53:setMargins({right=5});
    obj.layout53:setName("layout53");

    obj.label69 = gui.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.layout53);
    obj.label69:setText("Sp. Attack:");
    lfm_setPropAsString(obj.label69, "fontStyle",  "bold");
    obj.label69:setAlign("left");
    obj.label69:setWordWrap(true);
    obj.label69:setMargins({left=10});
    obj.label69:setWidth(60);
    obj.label69:setName("label69");
    obj.label69:setFontColor("Moccasin");

    obj.rectangle56 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle56:setParent(obj.layout53);
    obj.rectangle56:setAlign("left");
    obj.rectangle56:setWidth(60);
    obj.rectangle56:setMargins({left=10});
    obj.rectangle56:setName("rectangle56");
    obj.rectangle56:setColor("transparent");
    obj.rectangle56:setStrokeColor("Orange");
    obj.rectangle56:setStrokeSize(1);
    obj.rectangle56:setXradius(10);
    obj.rectangle56:setYradius(10);
    obj.rectangle56:setCornerType("innerRound");
    obj.rectangle56:setStrokeDash("dash");

    obj.label70 = gui.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.rectangle56);
    obj.label70:setField("pokeSpAttack");
    obj.label70:setAlign("client");
    obj.label70:setMargins({left=5,right=5});
    obj.label70:setHorzTextAlign("center");
    obj.label70:setName("label70");
    obj.label70:setFontColor("Orange");
    lfm_setPropAsString(obj.label70, "fontStyle",  "bold");

    obj.spAtkPopUp = gui.fromHandle(_obj_newObject("popup"));
    obj.spAtkPopUp:setParent(obj.layout53);
    obj.spAtkPopUp:setName("spAtkPopUp");
    obj.spAtkPopUp:setWidth(420);
    obj.spAtkPopUp:setHeight(150);
    obj.spAtkPopUp:setBackOpacity(0.5);

    obj.label71 = gui.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.spAtkPopUp);
    obj.label71:setText("SpAttack");
    obj.label71:setAlign("top");
    obj.label71:setHeight(30);
    obj.label71:setHorzTextAlign("center");
    obj.label71:setName("label71");
    obj.label71:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label71, "fontStyle",  "bold");
    obj.label71:setFontSize(18);

    obj.layout54 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout54:setParent(obj.spAtkPopUp);
    obj.layout54:setAlign("top");
    obj.layout54:setHeight(150);
    obj.layout54:setMargins({top=10});
    obj.layout54:setName("layout54");

    obj.layout55 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout55:setParent(obj.layout54);
    obj.layout55:setAlign("top");
    obj.layout55:setHeight(40);
    obj.layout55:setWidth(400);
    obj.layout55:setMargins({bottom=4});
    obj.layout55:setName("layout55");

    obj.label72 = gui.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.layout55);
    obj.label72:setText("Total");
    lfm_setPropAsString(obj.label72, "fontStyle",  "bold");
    obj.label72:setWordWrap(true);
    obj.label72:setHorzTextAlign("center");
    obj.label72:setAlign("left");
    obj.label72:setMargins({left=10});
    obj.label72:setWidth(70);
    obj.label72:setName("label72");
    obj.label72:setFontColor("Moccasin");

    obj.label73 = gui.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.layout55);
    obj.label73:setText("Base");
    lfm_setPropAsString(obj.label73, "fontStyle",  "bold");
    obj.label73:setWordWrap(true);
    obj.label73:setHorzTextAlign("center");
    obj.label73:setAlign("left");
    obj.label73:setMargins({left=10});
    obj.label73:setWidth(70);
    obj.label73:setName("label73");
    obj.label73:setFontColor("Moccasin");

    obj.label74 = gui.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj.layout55);
    obj.label74:setText("Progresso");
    lfm_setPropAsString(obj.label74, "fontStyle",  "bold");
    obj.label74:setWordWrap(true);
    obj.label74:setHorzTextAlign("center");
    obj.label74:setAlign("left");
    obj.label74:setMargins({left=10});
    obj.label74:setWidth(70);
    obj.label74:setName("label74");
    obj.label74:setFontColor("Moccasin");

    obj.label75 = gui.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.layout55);
    obj.label75:setText("Natureza");
    lfm_setPropAsString(obj.label75, "fontStyle",  "bold");
    obj.label75:setWordWrap(true);
    obj.label75:setHorzTextAlign("center");
    obj.label75:setAlign("left");
    obj.label75:setMargins({left=10});
    obj.label75:setWidth(70);
    obj.label75:setName("label75");
    obj.label75:setFontColor("Moccasin");

    obj.label76 = gui.fromHandle(_obj_newObject("label"));
    obj.label76:setParent(obj.layout55);
    obj.label76:setText("Combat Stage");
    lfm_setPropAsString(obj.label76, "fontStyle",  "bold");
    obj.label76:setWordWrap(true);
    obj.label76:setHorzTextAlign("center");
    obj.label76:setAlign("left");
    obj.label76:setMargins({left=10});
    obj.label76:setWidth(70);
    obj.label76:setName("label76");
    obj.label76:setFontColor("Moccasin");

    obj.layout56 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout56:setParent(obj.layout54);
    obj.layout56:setAlign("top");
    obj.layout56:setMargins({bottom=4});
    obj.layout56:setName("layout56");

    obj.rectangle57 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle57:setParent(obj.layout56);
    obj.rectangle57:setAlign("left");
    obj.rectangle57:setWidth(70);
    obj.rectangle57:setMargins({left=10});
    obj.rectangle57:setName("rectangle57");
    obj.rectangle57:setColor("transparent");
    obj.rectangle57:setStrokeColor("Orange");
    obj.rectangle57:setStrokeSize(1);
    obj.rectangle57:setXradius(10);
    obj.rectangle57:setYradius(10);
    obj.rectangle57:setCornerType("innerRound");
    obj.rectangle57:setStrokeDash("dash");

    obj.label77 = gui.fromHandle(_obj_newObject("label"));
    obj.label77:setParent(obj.rectangle57);
    obj.label77:setField("pokeSpAttack");
    obj.label77:setAlign("client");
    obj.label77:setHorzTextAlign("center");
    obj.label77:setWidth(40);
    obj.label77:setName("label77");
    obj.label77:setFontColor("Orange");
    lfm_setPropAsString(obj.label77, "fontStyle",  "bold");

    obj.rectangle58 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle58:setParent(obj.layout56);
    obj.rectangle58:setAlign("left");
    obj.rectangle58:setWidth(70);
    obj.rectangle58:setMargins({left=10});
    obj.rectangle58:setName("rectangle58");
    obj.rectangle58:setColor("transparent");
    obj.rectangle58:setStrokeColor("white");
    obj.rectangle58:setStrokeSize(1);
    obj.rectangle58:setXradius(10);
    obj.rectangle58:setYradius(10);
    obj.rectangle58:setCornerType("bevel");
    obj.rectangle58:setStrokeDash("dash");

    obj.edit35 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.rectangle58);
    obj.edit35:setField("pokeSpAttackBase");
    obj.edit35:setTransparent(true);
    lfm_setPropAsString(obj.edit35, "fontStyle",  "bold");
    obj.edit35:setAlign("client");
    obj.edit35:setHorzTextAlign("center");
    obj.edit35:setWidth(40);
    obj.edit35:setName("edit35");
    obj.edit35:setFontColor("White");

    obj.rectangle59 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle59:setParent(obj.layout56);
    obj.rectangle59:setAlign("left");
    obj.rectangle59:setWidth(70);
    obj.rectangle59:setMargins({left=10});
    obj.rectangle59:setName("rectangle59");
    obj.rectangle59:setColor("transparent");
    obj.rectangle59:setStrokeColor("white");
    obj.rectangle59:setStrokeSize(1);
    obj.rectangle59:setXradius(10);
    obj.rectangle59:setYradius(10);
    obj.rectangle59:setCornerType("bevel");
    obj.rectangle59:setStrokeDash("dash");

    obj.edit36 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.rectangle59);
    obj.edit36:setField("pokeSpAttackProg");
    obj.edit36:setTransparent(true);
    lfm_setPropAsString(obj.edit36, "fontStyle",  "bold");
    obj.edit36:setAlign("client");
    obj.edit36:setHorzTextAlign("center");
    obj.edit36:setWidth(40);
    obj.edit36:setName("edit36");
    obj.edit36:setFontColor("White");

    obj.rectangle60 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle60:setParent(obj.layout56);
    obj.rectangle60:setAlign("left");
    obj.rectangle60:setWidth(70);
    obj.rectangle60:setMargins({left=10});
    obj.rectangle60:setName("rectangle60");
    obj.rectangle60:setColor("transparent");
    obj.rectangle60:setStrokeColor("Orange");
    obj.rectangle60:setStrokeSize(1);
    obj.rectangle60:setXradius(10);
    obj.rectangle60:setYradius(10);
    obj.rectangle60:setCornerType("innerRound");
    obj.rectangle60:setStrokeDash("dash");

    obj.label78 = gui.fromHandle(_obj_newObject("label"));
    obj.label78:setParent(obj.rectangle60);
    obj.label78:setField("pokeNatureSpAtk");
    obj.label78:setAlign("client");
    obj.label78:setHorzTextAlign("center");
    obj.label78:setWidth(40);
    obj.label78:setName("label78");
    obj.label78:setFontColor("Orange");
    lfm_setPropAsString(obj.label78, "fontStyle",  "bold");

    obj.rectangle61 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle61:setParent(obj.layout56);
    obj.rectangle61:setAlign("left");
    obj.rectangle61:setWidth(70);
    obj.rectangle61:setMargins({left=10});
    obj.rectangle61:setName("rectangle61");
    obj.rectangle61:setColor("transparent");
    obj.rectangle61:setStrokeColor("white");
    obj.rectangle61:setStrokeSize(1);
    obj.rectangle61:setXradius(10);
    obj.rectangle61:setYradius(10);
    obj.rectangle61:setCornerType("bevel");
    obj.rectangle61:setStrokeDash("dash");

    obj.comboBox6 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox6:setParent(obj.rectangle61);
    obj.comboBox6:setField("pokeCmbtStgSpAtk");
    obj.comboBox6:setText("Escolha");
    obj.comboBox6:setAlign("client");
    obj.comboBox6:setTransparent(true);
    obj.comboBox6:setMargins({left=5,right=5});
    obj.comboBox6:setHorzTextAlign("center");
    obj.comboBox6:setItems({'-6', '-5', '-4', '-3', '-2', '-1', '0', '1', '2', '3', '4', '5', '6'});
    obj.comboBox6:setValues({'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'});
    obj.comboBox6:setValue("6");
    obj.comboBox6:setFontColor("White");
    obj.comboBox6:setName("comboBox6");

    obj.button5 = gui.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.layout53);
    obj.button5:setAlign("left");
    obj.button5:setText("i");
    obj.button5:setWidth(15);
    obj.button5:setMargins({left=10});
    obj.button5:setName("button5");

    obj.layout57 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout57:setParent(obj.rectangle43);
    obj.layout57:setAlign("top");
    obj.layout57:setWidth(600);
    obj.layout57:setHeight(40);
    obj.layout57:setMargins({top=10});
    obj.layout57:setName("layout57");

    obj.layout58 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout58:setParent(obj.layout57);
    obj.layout58:setAlign("left");
    obj.layout58:setWidth(170);
    obj.layout58:setHeight(40);
    obj.layout58:setMargins({right=5});
    obj.layout58:setName("layout58");

    obj.label79 = gui.fromHandle(_obj_newObject("label"));
    obj.label79:setParent(obj.layout58);
    obj.label79:setText("Speed:");
    lfm_setPropAsString(obj.label79, "fontStyle",  "bold");
    obj.label79:setAlign("left");
    obj.label79:setMargins({left=10});
    obj.label79:setWidth(60);
    obj.label79:setName("label79");
    obj.label79:setFontColor("Moccasin");

    obj.rectangle62 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle62:setParent(obj.layout58);
    obj.rectangle62:setAlign("left");
    obj.rectangle62:setWidth(60);
    obj.rectangle62:setMargins({left=10});
    obj.rectangle62:setName("rectangle62");
    obj.rectangle62:setColor("transparent");
    obj.rectangle62:setStrokeColor("Orange");
    obj.rectangle62:setStrokeSize(1);
    obj.rectangle62:setXradius(10);
    obj.rectangle62:setYradius(10);
    obj.rectangle62:setCornerType("innerRound");
    obj.rectangle62:setStrokeDash("dash");

    obj.label80 = gui.fromHandle(_obj_newObject("label"));
    obj.label80:setParent(obj.rectangle62);
    obj.label80:setField("pokeSpeed");
    obj.label80:setAlign("client");
    obj.label80:setMargins({left=5,right=5});
    obj.label80:setHorzTextAlign("center");
    obj.label80:setName("label80");
    obj.label80:setFontColor("Orange");
    lfm_setPropAsString(obj.label80, "fontStyle",  "bold");

    obj.spdPopUp = gui.fromHandle(_obj_newObject("popup"));
    obj.spdPopUp:setParent(obj.layout58);
    obj.spdPopUp:setName("spdPopUp");
    obj.spdPopUp:setWidth(420);
    obj.spdPopUp:setHeight(150);
    obj.spdPopUp:setBackOpacity(0.5);

    obj.label81 = gui.fromHandle(_obj_newObject("label"));
    obj.label81:setParent(obj.spdPopUp);
    obj.label81:setText("Speed");
    obj.label81:setAlign("top");
    obj.label81:setHeight(30);
    obj.label81:setHorzTextAlign("center");
    obj.label81:setName("label81");
    obj.label81:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label81, "fontStyle",  "bold");
    obj.label81:setFontSize(18);

    obj.layout59 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout59:setParent(obj.spdPopUp);
    obj.layout59:setAlign("top");
    obj.layout59:setHeight(150);
    obj.layout59:setMargins({top=10});
    obj.layout59:setName("layout59");

    obj.layout60 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout60:setParent(obj.layout59);
    obj.layout60:setAlign("top");
    obj.layout60:setHeight(40);
    obj.layout60:setWidth(400);
    obj.layout60:setMargins({bottom=4});
    obj.layout60:setName("layout60");

    obj.label82 = gui.fromHandle(_obj_newObject("label"));
    obj.label82:setParent(obj.layout60);
    obj.label82:setText("Total");
    lfm_setPropAsString(obj.label82, "fontStyle",  "bold");
    obj.label82:setWordWrap(true);
    obj.label82:setHorzTextAlign("center");
    obj.label82:setAlign("left");
    obj.label82:setMargins({left=10});
    obj.label82:setWidth(70);
    obj.label82:setName("label82");
    obj.label82:setFontColor("Moccasin");

    obj.label83 = gui.fromHandle(_obj_newObject("label"));
    obj.label83:setParent(obj.layout60);
    obj.label83:setText("Base");
    lfm_setPropAsString(obj.label83, "fontStyle",  "bold");
    obj.label83:setWordWrap(true);
    obj.label83:setHorzTextAlign("center");
    obj.label83:setAlign("left");
    obj.label83:setMargins({left=10});
    obj.label83:setWidth(70);
    obj.label83:setName("label83");
    obj.label83:setFontColor("Moccasin");

    obj.label84 = gui.fromHandle(_obj_newObject("label"));
    obj.label84:setParent(obj.layout60);
    obj.label84:setText("Progresso");
    lfm_setPropAsString(obj.label84, "fontStyle",  "bold");
    obj.label84:setWordWrap(true);
    obj.label84:setHorzTextAlign("center");
    obj.label84:setAlign("left");
    obj.label84:setMargins({left=10});
    obj.label84:setWidth(70);
    obj.label84:setName("label84");
    obj.label84:setFontColor("Moccasin");

    obj.label85 = gui.fromHandle(_obj_newObject("label"));
    obj.label85:setParent(obj.layout60);
    obj.label85:setText("Natureza");
    lfm_setPropAsString(obj.label85, "fontStyle",  "bold");
    obj.label85:setWordWrap(true);
    obj.label85:setHorzTextAlign("center");
    obj.label85:setAlign("left");
    obj.label85:setMargins({left=10});
    obj.label85:setWidth(70);
    obj.label85:setName("label85");
    obj.label85:setFontColor("Moccasin");

    obj.label86 = gui.fromHandle(_obj_newObject("label"));
    obj.label86:setParent(obj.layout60);
    obj.label86:setText("Combat Stage");
    lfm_setPropAsString(obj.label86, "fontStyle",  "bold");
    obj.label86:setWordWrap(true);
    obj.label86:setHorzTextAlign("center");
    obj.label86:setAlign("left");
    obj.label86:setMargins({left=10});
    obj.label86:setWidth(70);
    obj.label86:setName("label86");
    obj.label86:setFontColor("Moccasin");

    obj.layout61 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout61:setParent(obj.layout59);
    obj.layout61:setAlign("top");
    obj.layout61:setMargins({bottom=4});
    obj.layout61:setName("layout61");

    obj.rectangle63 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle63:setParent(obj.layout61);
    obj.rectangle63:setAlign("left");
    obj.rectangle63:setWidth(70);
    obj.rectangle63:setMargins({left=10});
    obj.rectangle63:setName("rectangle63");
    obj.rectangle63:setColor("transparent");
    obj.rectangle63:setStrokeColor("Orange");
    obj.rectangle63:setStrokeSize(1);
    obj.rectangle63:setXradius(10);
    obj.rectangle63:setYradius(10);
    obj.rectangle63:setCornerType("innerRound");
    obj.rectangle63:setStrokeDash("dash");

    obj.label87 = gui.fromHandle(_obj_newObject("label"));
    obj.label87:setParent(obj.rectangle63);
    obj.label87:setField("pokeSpeed");
    obj.label87:setAlign("client");
    obj.label87:setHorzTextAlign("center");
    obj.label87:setWidth(40);
    obj.label87:setName("label87");
    obj.label87:setFontColor("Orange");
    lfm_setPropAsString(obj.label87, "fontStyle",  "bold");

    obj.rectangle64 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle64:setParent(obj.layout61);
    obj.rectangle64:setAlign("left");
    obj.rectangle64:setWidth(70);
    obj.rectangle64:setMargins({left=10});
    obj.rectangle64:setName("rectangle64");
    obj.rectangle64:setColor("transparent");
    obj.rectangle64:setStrokeColor("white");
    obj.rectangle64:setStrokeSize(1);
    obj.rectangle64:setXradius(10);
    obj.rectangle64:setYradius(10);
    obj.rectangle64:setCornerType("bevel");
    obj.rectangle64:setStrokeDash("dash");

    obj.edit37 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.rectangle64);
    obj.edit37:setField("pokeSpeedBase");
    obj.edit37:setTransparent(true);
    lfm_setPropAsString(obj.edit37, "fontStyle",  "bold");
    obj.edit37:setAlign("client");
    obj.edit37:setHorzTextAlign("center");
    obj.edit37:setWidth(40);
    obj.edit37:setName("edit37");
    obj.edit37:setFontColor("White");

    obj.rectangle65 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle65:setParent(obj.layout61);
    obj.rectangle65:setAlign("left");
    obj.rectangle65:setWidth(70);
    obj.rectangle65:setMargins({left=10});
    obj.rectangle65:setName("rectangle65");
    obj.rectangle65:setColor("transparent");
    obj.rectangle65:setStrokeColor("white");
    obj.rectangle65:setStrokeSize(1);
    obj.rectangle65:setXradius(10);
    obj.rectangle65:setYradius(10);
    obj.rectangle65:setCornerType("bevel");
    obj.rectangle65:setStrokeDash("dash");

    obj.edit38 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.rectangle65);
    obj.edit38:setField("pokeSpeedProg");
    obj.edit38:setTransparent(true);
    lfm_setPropAsString(obj.edit38, "fontStyle",  "bold");
    obj.edit38:setAlign("client");
    obj.edit38:setHorzTextAlign("center");
    obj.edit38:setWidth(40);
    obj.edit38:setName("edit38");
    obj.edit38:setFontColor("White");

    obj.rectangle66 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle66:setParent(obj.layout61);
    obj.rectangle66:setAlign("left");
    obj.rectangle66:setWidth(70);
    obj.rectangle66:setMargins({left=10});
    obj.rectangle66:setName("rectangle66");
    obj.rectangle66:setColor("transparent");
    obj.rectangle66:setStrokeColor("Orange");
    obj.rectangle66:setStrokeSize(1);
    obj.rectangle66:setXradius(10);
    obj.rectangle66:setYradius(10);
    obj.rectangle66:setCornerType("innerRound");
    obj.rectangle66:setStrokeDash("dash");

    obj.label88 = gui.fromHandle(_obj_newObject("label"));
    obj.label88:setParent(obj.rectangle66);
    obj.label88:setField("pokeNatureSpd");
    obj.label88:setAlign("client");
    obj.label88:setHorzTextAlign("center");
    obj.label88:setWidth(40);
    obj.label88:setName("label88");
    obj.label88:setFontColor("Orange");
    lfm_setPropAsString(obj.label88, "fontStyle",  "bold");

    obj.rectangle67 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle67:setParent(obj.layout61);
    obj.rectangle67:setAlign("left");
    obj.rectangle67:setWidth(70);
    obj.rectangle67:setMargins({left=10});
    obj.rectangle67:setName("rectangle67");
    obj.rectangle67:setColor("transparent");
    obj.rectangle67:setStrokeColor("white");
    obj.rectangle67:setStrokeSize(1);
    obj.rectangle67:setXradius(10);
    obj.rectangle67:setYradius(10);
    obj.rectangle67:setCornerType("bevel");
    obj.rectangle67:setStrokeDash("dash");

    obj.comboBox7 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox7:setParent(obj.rectangle67);
    obj.comboBox7:setField("pokeCmbtStgSpd");
    obj.comboBox7:setText("Escolha");
    obj.comboBox7:setAlign("client");
    obj.comboBox7:setTransparent(true);
    obj.comboBox7:setMargins({left=5,right=5});
    obj.comboBox7:setHorzTextAlign("center");
    obj.comboBox7:setItems({'-6', '-5', '-4', '-3', '-2', '-1', '0', '1', '2', '3', '4', '5', '6'});
    obj.comboBox7:setValues({'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'});
    obj.comboBox7:setValue("6");
    obj.comboBox7:setFontColor("White");
    obj.comboBox7:setName("comboBox7");

    obj.button6 = gui.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.layout58);
    obj.button6:setAlign("left");
    obj.button6:setText("i");
    obj.button6:setWidth(15);
    obj.button6:setMargins({left=10});
    obj.button6:setName("button6");

    obj.layout62 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout62:setParent(obj.layout57);
    obj.layout62:setAlign("left");
    obj.layout62:setWidth(170);
    obj.layout62:setHeight(40);
    obj.layout62:setMargins({right=5});
    obj.layout62:setName("layout62");

    obj.label89 = gui.fromHandle(_obj_newObject("label"));
    obj.label89:setParent(obj.layout62);
    obj.label89:setText("Defense:");
    lfm_setPropAsString(obj.label89, "fontStyle",  "bold");
    obj.label89:setAlign("left");
    obj.label89:setMargins({left=10});
    obj.label89:setWidth(60);
    obj.label89:setName("label89");
    obj.label89:setFontColor("Moccasin");

    obj.rectangle68 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle68:setParent(obj.layout62);
    obj.rectangle68:setAlign("left");
    obj.rectangle68:setWidth(60);
    obj.rectangle68:setMargins({left=10});
    obj.rectangle68:setName("rectangle68");
    obj.rectangle68:setColor("transparent");
    obj.rectangle68:setStrokeColor("Orange");
    obj.rectangle68:setStrokeSize(1);
    obj.rectangle68:setXradius(10);
    obj.rectangle68:setYradius(10);
    obj.rectangle68:setCornerType("innerRound");
    obj.rectangle68:setStrokeDash("dash");

    obj.label90 = gui.fromHandle(_obj_newObject("label"));
    obj.label90:setParent(obj.rectangle68);
    obj.label90:setField("pokeDefense");
    obj.label90:setAlign("client");
    obj.label90:setMargins({left=5,right=5});
    obj.label90:setHorzTextAlign("center");
    obj.label90:setName("label90");
    obj.label90:setFontColor("Orange");
    lfm_setPropAsString(obj.label90, "fontStyle",  "bold");

    obj.defPopUp = gui.fromHandle(_obj_newObject("popup"));
    obj.defPopUp:setParent(obj.layout62);
    obj.defPopUp:setName("defPopUp");
    obj.defPopUp:setWidth(420);
    obj.defPopUp:setHeight(150);
    obj.defPopUp:setBackOpacity(0.5);

    obj.label91 = gui.fromHandle(_obj_newObject("label"));
    obj.label91:setParent(obj.defPopUp);
    obj.label91:setText("Defense");
    obj.label91:setAlign("top");
    obj.label91:setHeight(30);
    obj.label91:setHorzTextAlign("center");
    obj.label91:setName("label91");
    obj.label91:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label91, "fontStyle",  "bold");
    obj.label91:setFontSize(18);

    obj.layout63 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout63:setParent(obj.defPopUp);
    obj.layout63:setAlign("top");
    obj.layout63:setHeight(150);
    obj.layout63:setMargins({top=10});
    obj.layout63:setName("layout63");

    obj.layout64 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout64:setParent(obj.layout63);
    obj.layout64:setAlign("top");
    obj.layout64:setHeight(40);
    obj.layout64:setWidth(400);
    obj.layout64:setMargins({bottom=4});
    obj.layout64:setName("layout64");

    obj.label92 = gui.fromHandle(_obj_newObject("label"));
    obj.label92:setParent(obj.layout64);
    obj.label92:setText("Total");
    lfm_setPropAsString(obj.label92, "fontStyle",  "bold");
    obj.label92:setWordWrap(true);
    obj.label92:setHorzTextAlign("center");
    obj.label92:setAlign("left");
    obj.label92:setMargins({left=10});
    obj.label92:setWidth(70);
    obj.label92:setName("label92");
    obj.label92:setFontColor("Moccasin");

    obj.label93 = gui.fromHandle(_obj_newObject("label"));
    obj.label93:setParent(obj.layout64);
    obj.label93:setText("Base");
    lfm_setPropAsString(obj.label93, "fontStyle",  "bold");
    obj.label93:setWordWrap(true);
    obj.label93:setHorzTextAlign("center");
    obj.label93:setAlign("left");
    obj.label93:setMargins({left=10});
    obj.label93:setWidth(70);
    obj.label93:setName("label93");
    obj.label93:setFontColor("Moccasin");

    obj.label94 = gui.fromHandle(_obj_newObject("label"));
    obj.label94:setParent(obj.layout64);
    obj.label94:setText("Progresso");
    lfm_setPropAsString(obj.label94, "fontStyle",  "bold");
    obj.label94:setWordWrap(true);
    obj.label94:setHorzTextAlign("center");
    obj.label94:setAlign("left");
    obj.label94:setMargins({left=10});
    obj.label94:setWidth(70);
    obj.label94:setName("label94");
    obj.label94:setFontColor("Moccasin");

    obj.label95 = gui.fromHandle(_obj_newObject("label"));
    obj.label95:setParent(obj.layout64);
    obj.label95:setText("Natureza");
    lfm_setPropAsString(obj.label95, "fontStyle",  "bold");
    obj.label95:setWordWrap(true);
    obj.label95:setHorzTextAlign("center");
    obj.label95:setAlign("left");
    obj.label95:setMargins({left=10});
    obj.label95:setWidth(70);
    obj.label95:setName("label95");
    obj.label95:setFontColor("Moccasin");

    obj.label96 = gui.fromHandle(_obj_newObject("label"));
    obj.label96:setParent(obj.layout64);
    obj.label96:setText("Combat Stage");
    lfm_setPropAsString(obj.label96, "fontStyle",  "bold");
    obj.label96:setWordWrap(true);
    obj.label96:setHorzTextAlign("center");
    obj.label96:setAlign("left");
    obj.label96:setMargins({left=10});
    obj.label96:setWidth(70);
    obj.label96:setName("label96");
    obj.label96:setFontColor("Moccasin");

    obj.layout65 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout65:setParent(obj.layout63);
    obj.layout65:setAlign("top");
    obj.layout65:setMargins({bottom=4});
    obj.layout65:setName("layout65");

    obj.rectangle69 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle69:setParent(obj.layout65);
    obj.rectangle69:setAlign("left");
    obj.rectangle69:setWidth(70);
    obj.rectangle69:setMargins({left=10});
    obj.rectangle69:setName("rectangle69");
    obj.rectangle69:setColor("transparent");
    obj.rectangle69:setStrokeColor("Orange");
    obj.rectangle69:setStrokeSize(1);
    obj.rectangle69:setXradius(10);
    obj.rectangle69:setYradius(10);
    obj.rectangle69:setCornerType("innerRound");
    obj.rectangle69:setStrokeDash("dash");

    obj.label97 = gui.fromHandle(_obj_newObject("label"));
    obj.label97:setParent(obj.rectangle69);
    obj.label97:setField("pokeDefense");
    obj.label97:setAlign("client");
    obj.label97:setHorzTextAlign("center");
    obj.label97:setWidth(40);
    obj.label97:setName("label97");
    obj.label97:setFontColor("Orange");
    lfm_setPropAsString(obj.label97, "fontStyle",  "bold");

    obj.rectangle70 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle70:setParent(obj.layout65);
    obj.rectangle70:setAlign("left");
    obj.rectangle70:setWidth(70);
    obj.rectangle70:setMargins({left=10});
    obj.rectangle70:setName("rectangle70");
    obj.rectangle70:setColor("transparent");
    obj.rectangle70:setStrokeColor("white");
    obj.rectangle70:setStrokeSize(1);
    obj.rectangle70:setXradius(10);
    obj.rectangle70:setYradius(10);
    obj.rectangle70:setCornerType("bevel");
    obj.rectangle70:setStrokeDash("dash");

    obj.edit39 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.rectangle70);
    obj.edit39:setField("pokeDefenseBase");
    obj.edit39:setTransparent(true);
    lfm_setPropAsString(obj.edit39, "fontStyle",  "bold");
    obj.edit39:setAlign("client");
    obj.edit39:setHorzTextAlign("center");
    obj.edit39:setWidth(40);
    obj.edit39:setName("edit39");
    obj.edit39:setFontColor("White");

    obj.rectangle71 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle71:setParent(obj.layout65);
    obj.rectangle71:setAlign("left");
    obj.rectangle71:setWidth(70);
    obj.rectangle71:setMargins({left=10});
    obj.rectangle71:setName("rectangle71");
    obj.rectangle71:setColor("transparent");
    obj.rectangle71:setStrokeColor("white");
    obj.rectangle71:setStrokeSize(1);
    obj.rectangle71:setXradius(10);
    obj.rectangle71:setYradius(10);
    obj.rectangle71:setCornerType("bevel");
    obj.rectangle71:setStrokeDash("dash");

    obj.edit40 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.rectangle71);
    obj.edit40:setField("pokeDefenseProg");
    obj.edit40:setTransparent(true);
    lfm_setPropAsString(obj.edit40, "fontStyle",  "bold");
    obj.edit40:setAlign("client");
    obj.edit40:setHorzTextAlign("center");
    obj.edit40:setWidth(40);
    obj.edit40:setName("edit40");
    obj.edit40:setFontColor("White");

    obj.rectangle72 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle72:setParent(obj.layout65);
    obj.rectangle72:setAlign("left");
    obj.rectangle72:setWidth(70);
    obj.rectangle72:setMargins({left=10});
    obj.rectangle72:setName("rectangle72");
    obj.rectangle72:setColor("transparent");
    obj.rectangle72:setStrokeColor("Orange");
    obj.rectangle72:setStrokeSize(1);
    obj.rectangle72:setXradius(10);
    obj.rectangle72:setYradius(10);
    obj.rectangle72:setCornerType("innerRound");
    obj.rectangle72:setStrokeDash("dash");

    obj.label98 = gui.fromHandle(_obj_newObject("label"));
    obj.label98:setParent(obj.rectangle72);
    obj.label98:setField("pokeNatureDef");
    obj.label98:setAlign("client");
    obj.label98:setHorzTextAlign("center");
    obj.label98:setWidth(40);
    obj.label98:setName("label98");
    obj.label98:setFontColor("Orange");
    lfm_setPropAsString(obj.label98, "fontStyle",  "bold");

    obj.rectangle73 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle73:setParent(obj.layout65);
    obj.rectangle73:setAlign("left");
    obj.rectangle73:setWidth(70);
    obj.rectangle73:setMargins({left=10});
    obj.rectangle73:setName("rectangle73");
    obj.rectangle73:setColor("transparent");
    obj.rectangle73:setStrokeColor("white");
    obj.rectangle73:setStrokeSize(1);
    obj.rectangle73:setXradius(10);
    obj.rectangle73:setYradius(10);
    obj.rectangle73:setCornerType("bevel");
    obj.rectangle73:setStrokeDash("dash");

    obj.comboBox8 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox8:setParent(obj.rectangle73);
    obj.comboBox8:setField("pokeCmbtStgDef");
    obj.comboBox8:setText("Escolha");
    obj.comboBox8:setAlign("client");
    obj.comboBox8:setTransparent(true);
    obj.comboBox8:setMargins({left=5,right=5});
    obj.comboBox8:setHorzTextAlign("center");
    obj.comboBox8:setItems({'-6', '-5', '-4', '-3', '-2', '-1', '0', '1', '2', '3', '4', '5', '6'});
    obj.comboBox8:setValues({'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'});
    obj.comboBox8:setValue("6");
    obj.comboBox8:setFontColor("White");
    obj.comboBox8:setName("comboBox8");

    obj.button7 = gui.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.layout62);
    obj.button7:setAlign("left");
    obj.button7:setText("i");
    obj.button7:setWidth(15);
    obj.button7:setMargins({left=10});
    obj.button7:setName("button7");

    obj.layout66 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout66:setParent(obj.layout57);
    obj.layout66:setAlign("left");
    obj.layout66:setWidth(170);
    obj.layout66:setHeight(40);
    obj.layout66:setMargins({right=5});
    obj.layout66:setName("layout66");

    obj.label99 = gui.fromHandle(_obj_newObject("label"));
    obj.label99:setParent(obj.layout66);
    obj.label99:setText("Sp. Defense:");
    lfm_setPropAsString(obj.label99, "fontStyle",  "bold");
    obj.label99:setAlign("left");
    obj.label99:setMargins({left=10});
    obj.label99:setWidth(60);
    obj.label99:setName("label99");
    obj.label99:setFontColor("Moccasin");

    obj.rectangle74 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle74:setParent(obj.layout66);
    obj.rectangle74:setAlign("left");
    obj.rectangle74:setWidth(60);
    obj.rectangle74:setMargins({left=10});
    obj.rectangle74:setName("rectangle74");
    obj.rectangle74:setColor("transparent");
    obj.rectangle74:setStrokeColor("Orange");
    obj.rectangle74:setStrokeSize(1);
    obj.rectangle74:setXradius(10);
    obj.rectangle74:setYradius(10);
    obj.rectangle74:setCornerType("innerRound");
    obj.rectangle74:setStrokeDash("dash");

    obj.label100 = gui.fromHandle(_obj_newObject("label"));
    obj.label100:setParent(obj.rectangle74);
    obj.label100:setField("pokeSpDefense");
    obj.label100:setAlign("client");
    obj.label100:setMargins({left=5,right=5});
    obj.label100:setHorzTextAlign("center");
    obj.label100:setName("label100");
    obj.label100:setFontColor("Orange");
    lfm_setPropAsString(obj.label100, "fontStyle",  "bold");

    obj.spDefPopUp = gui.fromHandle(_obj_newObject("popup"));
    obj.spDefPopUp:setParent(obj.layout66);
    obj.spDefPopUp:setName("spDefPopUp");
    obj.spDefPopUp:setWidth(420);
    obj.spDefPopUp:setHeight(150);
    obj.spDefPopUp:setBackOpacity(0.5);

    obj.label101 = gui.fromHandle(_obj_newObject("label"));
    obj.label101:setParent(obj.spDefPopUp);
    obj.label101:setText("SpDefense");
    obj.label101:setAlign("top");
    obj.label101:setHeight(30);
    obj.label101:setHorzTextAlign("center");
    obj.label101:setName("label101");
    obj.label101:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label101, "fontStyle",  "bold");
    obj.label101:setFontSize(18);

    obj.layout67 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout67:setParent(obj.spDefPopUp);
    obj.layout67:setAlign("top");
    obj.layout67:setHeight(150);
    obj.layout67:setMargins({top=10});
    obj.layout67:setName("layout67");

    obj.layout68 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout68:setParent(obj.layout67);
    obj.layout68:setAlign("top");
    obj.layout68:setHeight(40);
    obj.layout68:setWidth(400);
    obj.layout68:setMargins({bottom=4});
    obj.layout68:setName("layout68");

    obj.label102 = gui.fromHandle(_obj_newObject("label"));
    obj.label102:setParent(obj.layout68);
    obj.label102:setText("Total");
    lfm_setPropAsString(obj.label102, "fontStyle",  "bold");
    obj.label102:setWordWrap(true);
    obj.label102:setHorzTextAlign("center");
    obj.label102:setAlign("left");
    obj.label102:setMargins({left=10});
    obj.label102:setWidth(70);
    obj.label102:setName("label102");
    obj.label102:setFontColor("Moccasin");

    obj.label103 = gui.fromHandle(_obj_newObject("label"));
    obj.label103:setParent(obj.layout68);
    obj.label103:setText("Base");
    lfm_setPropAsString(obj.label103, "fontStyle",  "bold");
    obj.label103:setWordWrap(true);
    obj.label103:setHorzTextAlign("center");
    obj.label103:setAlign("left");
    obj.label103:setMargins({left=10});
    obj.label103:setWidth(70);
    obj.label103:setName("label103");
    obj.label103:setFontColor("Moccasin");

    obj.label104 = gui.fromHandle(_obj_newObject("label"));
    obj.label104:setParent(obj.layout68);
    obj.label104:setText("Progresso");
    lfm_setPropAsString(obj.label104, "fontStyle",  "bold");
    obj.label104:setWordWrap(true);
    obj.label104:setHorzTextAlign("center");
    obj.label104:setAlign("left");
    obj.label104:setMargins({left=10});
    obj.label104:setWidth(70);
    obj.label104:setName("label104");
    obj.label104:setFontColor("Moccasin");

    obj.label105 = gui.fromHandle(_obj_newObject("label"));
    obj.label105:setParent(obj.layout68);
    obj.label105:setText("Natureza");
    lfm_setPropAsString(obj.label105, "fontStyle",  "bold");
    obj.label105:setWordWrap(true);
    obj.label105:setHorzTextAlign("center");
    obj.label105:setAlign("left");
    obj.label105:setMargins({left=10});
    obj.label105:setWidth(70);
    obj.label105:setName("label105");
    obj.label105:setFontColor("Moccasin");

    obj.label106 = gui.fromHandle(_obj_newObject("label"));
    obj.label106:setParent(obj.layout68);
    obj.label106:setText("Combat Stage");
    lfm_setPropAsString(obj.label106, "fontStyle",  "bold");
    obj.label106:setWordWrap(true);
    obj.label106:setHorzTextAlign("center");
    obj.label106:setAlign("left");
    obj.label106:setMargins({left=10});
    obj.label106:setWidth(70);
    obj.label106:setName("label106");
    obj.label106:setFontColor("Moccasin");

    obj.layout69 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout69:setParent(obj.layout67);
    obj.layout69:setAlign("top");
    obj.layout69:setMargins({bottom=4});
    obj.layout69:setName("layout69");

    obj.rectangle75 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle75:setParent(obj.layout69);
    obj.rectangle75:setAlign("left");
    obj.rectangle75:setWidth(70);
    obj.rectangle75:setMargins({left=10});
    obj.rectangle75:setName("rectangle75");
    obj.rectangle75:setColor("transparent");
    obj.rectangle75:setStrokeColor("Orange");
    obj.rectangle75:setStrokeSize(1);
    obj.rectangle75:setXradius(10);
    obj.rectangle75:setYradius(10);
    obj.rectangle75:setCornerType("innerRound");
    obj.rectangle75:setStrokeDash("dash");

    obj.label107 = gui.fromHandle(_obj_newObject("label"));
    obj.label107:setParent(obj.rectangle75);
    obj.label107:setField("pokeSpDefense");
    obj.label107:setAlign("client");
    obj.label107:setHorzTextAlign("center");
    obj.label107:setWidth(40);
    obj.label107:setName("label107");
    obj.label107:setFontColor("Orange");
    lfm_setPropAsString(obj.label107, "fontStyle",  "bold");

    obj.rectangle76 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle76:setParent(obj.layout69);
    obj.rectangle76:setAlign("left");
    obj.rectangle76:setWidth(70);
    obj.rectangle76:setMargins({left=10});
    obj.rectangle76:setName("rectangle76");
    obj.rectangle76:setColor("transparent");
    obj.rectangle76:setStrokeColor("white");
    obj.rectangle76:setStrokeSize(1);
    obj.rectangle76:setXradius(10);
    obj.rectangle76:setYradius(10);
    obj.rectangle76:setCornerType("bevel");
    obj.rectangle76:setStrokeDash("dash");

    obj.edit41 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.rectangle76);
    obj.edit41:setField("pokeSpDefenseBase");
    obj.edit41:setTransparent(true);
    lfm_setPropAsString(obj.edit41, "fontStyle",  "bold");
    obj.edit41:setAlign("client");
    obj.edit41:setHorzTextAlign("center");
    obj.edit41:setWidth(40);
    obj.edit41:setName("edit41");
    obj.edit41:setFontColor("White");

    obj.rectangle77 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle77:setParent(obj.layout69);
    obj.rectangle77:setAlign("left");
    obj.rectangle77:setWidth(70);
    obj.rectangle77:setMargins({left=10});
    obj.rectangle77:setName("rectangle77");
    obj.rectangle77:setColor("transparent");
    obj.rectangle77:setStrokeColor("white");
    obj.rectangle77:setStrokeSize(1);
    obj.rectangle77:setXradius(10);
    obj.rectangle77:setYradius(10);
    obj.rectangle77:setCornerType("bevel");
    obj.rectangle77:setStrokeDash("dash");

    obj.edit42 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.rectangle77);
    obj.edit42:setField("pokeSpDefenseProg");
    obj.edit42:setTransparent(true);
    lfm_setPropAsString(obj.edit42, "fontStyle",  "bold");
    obj.edit42:setAlign("client");
    obj.edit42:setHorzTextAlign("center");
    obj.edit42:setWidth(40);
    obj.edit42:setName("edit42");
    obj.edit42:setFontColor("White");

    obj.rectangle78 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle78:setParent(obj.layout69);
    obj.rectangle78:setAlign("left");
    obj.rectangle78:setWidth(70);
    obj.rectangle78:setMargins({left=10});
    obj.rectangle78:setName("rectangle78");
    obj.rectangle78:setColor("transparent");
    obj.rectangle78:setStrokeColor("Orange");
    obj.rectangle78:setStrokeSize(1);
    obj.rectangle78:setXradius(10);
    obj.rectangle78:setYradius(10);
    obj.rectangle78:setCornerType("innerRound");
    obj.rectangle78:setStrokeDash("dash");

    obj.label108 = gui.fromHandle(_obj_newObject("label"));
    obj.label108:setParent(obj.rectangle78);
    obj.label108:setField("pokeNatureSpDef");
    obj.label108:setAlign("client");
    obj.label108:setHorzTextAlign("center");
    obj.label108:setWidth(40);
    obj.label108:setName("label108");
    obj.label108:setFontColor("Orange");
    lfm_setPropAsString(obj.label108, "fontStyle",  "bold");

    obj.rectangle79 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle79:setParent(obj.layout69);
    obj.rectangle79:setAlign("left");
    obj.rectangle79:setWidth(70);
    obj.rectangle79:setMargins({left=10});
    obj.rectangle79:setName("rectangle79");
    obj.rectangle79:setColor("transparent");
    obj.rectangle79:setStrokeColor("white");
    obj.rectangle79:setStrokeSize(1);
    obj.rectangle79:setXradius(10);
    obj.rectangle79:setYradius(10);
    obj.rectangle79:setCornerType("bevel");
    obj.rectangle79:setStrokeDash("dash");

    obj.comboBox9 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox9:setParent(obj.rectangle79);
    obj.comboBox9:setField("pokeCmbtStgSpDef");
    obj.comboBox9:setText("Escolha");
    obj.comboBox9:setAlign("client");
    obj.comboBox9:setTransparent(true);
    obj.comboBox9:setMargins({left=5,right=5});
    obj.comboBox9:setHorzTextAlign("center");
    obj.comboBox9:setItems({'-6', '-5', '-4', '-3', '-2', '-1', '0', '1', '2', '3', '4', '5', '6'});
    obj.comboBox9:setValues({'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'});
    obj.comboBox9:setValue("6");
    obj.comboBox9:setFontColor("White");
    obj.comboBox9:setName("comboBox9");

    obj.button8 = gui.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.layout66);
    obj.button8:setAlign("left");
    obj.button8:setText("i");
    obj.button8:setWidth(15);
    obj.button8:setMargins({left=10});
    obj.button8:setName("button8");

    obj.layout70 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout70:setParent(obj.tab1);
    obj.layout70:setAlign("top");
    obj.layout70:setWidth(600);
    obj.layout70:setHeight(80);
    obj.layout70:setMargins({top=10});
    obj.layout70:setName("layout70");

    obj.rectangle80 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle80:setParent(obj.layout70);
    obj.rectangle80:setAlign("client");
    obj.rectangle80:setWidth(60);
    obj.rectangle80:setMargins({left=5, right=5});
    obj.rectangle80:setName("rectangle80");
    obj.rectangle80:setColor("transparent");
    obj.rectangle80:setStrokeColor("white");
    obj.rectangle80:setStrokeSize(1);
    obj.rectangle80:setXradius(10);
    obj.rectangle80:setYradius(10);
    obj.rectangle80:setCornerType("bevel");
    obj.rectangle80:setStrokeDash("dash");

    obj.layout71 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout71:setParent(obj.rectangle80);
    obj.layout71:setAlign("client");
    obj.layout71:setWidth(100);
    obj.layout71:setHeight(50);
    obj.layout71:setMargins({right=275, top=20, bottom=20});
    obj.layout71:setName("layout71");

    obj.label109 = gui.fromHandle(_obj_newObject("label"));
    obj.label109:setParent(obj.layout71);
    obj.label109:setText("Evasão Física:");
    lfm_setPropAsString(obj.label109, "fontStyle",  "bold");
    obj.label109:setAlign("left");
    obj.label109:setWordWrap(true);
    obj.label109:setMargins({left=10});
    obj.label109:setWidth(60);
    obj.label109:setName("label109");
    obj.label109:setFontColor("Moccasin");

    obj.rectangle81 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle81:setParent(obj.layout71);
    obj.rectangle81:setAlign("left");
    obj.rectangle81:setWidth(60);
    obj.rectangle81:setMargins({left=5});
    obj.rectangle81:setName("rectangle81");
    obj.rectangle81:setColor("transparent");
    obj.rectangle81:setStrokeColor("Orange");
    obj.rectangle81:setStrokeSize(1);
    obj.rectangle81:setXradius(10);
    obj.rectangle81:setYradius(10);
    obj.rectangle81:setCornerType("innerRound");
    obj.rectangle81:setStrokeDash("dash");

    obj.label110 = gui.fromHandle(_obj_newObject("label"));
    obj.label110:setParent(obj.rectangle81);
    obj.label110:setField("pokeEvasionPhysic");
    obj.label110:setAlign("client");
    obj.label110:setMargins({left=5,right=5});
    obj.label110:setHorzTextAlign("center");
    obj.label110:setName("label110");
    obj.label110:setFontColor("Orange");
    lfm_setPropAsString(obj.label110, "fontStyle",  "bold");

    obj.layout72 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout72:setParent(obj.rectangle80);
    obj.layout72:setAlign("client");
    obj.layout72:setWidth(100);
    obj.layout72:setHeight(50);
    obj.layout72:setMargins({left=180, top=20, right=155, bottom=20});
    obj.layout72:setName("layout72");

    obj.label111 = gui.fromHandle(_obj_newObject("label"));
    obj.label111:setParent(obj.layout72);
    obj.label111:setText("Evasão Especial:");
    lfm_setPropAsString(obj.label111, "fontStyle",  "bold");
    obj.label111:setAlign("left");
    obj.label111:setWordWrap(true);
    obj.label111:setMargins({left=10});
    obj.label111:setWidth(80);
    obj.label111:setName("label111");
    obj.label111:setFontColor("Moccasin");

    obj.rectangle82 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle82:setParent(obj.layout72);
    obj.rectangle82:setAlign("left");
    obj.rectangle82:setWidth(60);
    obj.rectangle82:setMargins({left=5});
    obj.rectangle82:setName("rectangle82");
    obj.rectangle82:setColor("transparent");
    obj.rectangle82:setStrokeColor("Orange");
    obj.rectangle82:setStrokeSize(1);
    obj.rectangle82:setXradius(10);
    obj.rectangle82:setYradius(10);
    obj.rectangle82:setCornerType("innerRound");
    obj.rectangle82:setStrokeDash("dash");

    obj.label112 = gui.fromHandle(_obj_newObject("label"));
    obj.label112:setParent(obj.rectangle82);
    obj.label112:setField("pokeEvasionSpecial");
    obj.label112:setAlign("client");
    obj.label112:setMargins({left=5,right=5});
    obj.label112:setHorzTextAlign("center");
    obj.label112:setName("label112");
    obj.label112:setFontColor("Orange");
    lfm_setPropAsString(obj.label112, "fontStyle",  "bold");

    obj.layout73 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout73:setParent(obj.rectangle80);
    obj.layout73:setAlign("client");
    obj.layout73:setWidth(100);
    obj.layout73:setHeight(50);
    obj.layout73:setMargins({left=360, top=20, right=5, bottom=20});
    obj.layout73:setName("layout73");

    obj.label113 = gui.fromHandle(_obj_newObject("label"));
    obj.label113:setParent(obj.layout73);
    obj.label113:setText("Evasão de Velocidade:");
    lfm_setPropAsString(obj.label113, "fontStyle",  "bold");
    obj.label113:setAlign("left");
    obj.label113:setWordWrap(true);
    obj.label113:setMargins({left=10});
    obj.label113:setWidth(80);
    obj.label113:setName("label113");
    obj.label113:setFontColor("Moccasin");

    obj.rectangle83 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle83:setParent(obj.layout73);
    obj.rectangle83:setAlign("left");
    obj.rectangle83:setWidth(60);
    obj.rectangle83:setMargins({left=5});
    obj.rectangle83:setName("rectangle83");
    obj.rectangle83:setColor("transparent");
    obj.rectangle83:setStrokeColor("Orange");
    obj.rectangle83:setStrokeSize(1);
    obj.rectangle83:setXradius(10);
    obj.rectangle83:setYradius(10);
    obj.rectangle83:setCornerType("innerRound");
    obj.rectangle83:setStrokeDash("dash");

    obj.label114 = gui.fromHandle(_obj_newObject("label"));
    obj.label114:setParent(obj.rectangle83);
    obj.label114:setField("pokeEvasionSpeed");
    obj.label114:setAlign("client");
    obj.label114:setMargins({left=5,right=5});
    obj.label114:setHorzTextAlign("center");
    obj.label114:setName("label114");
    obj.label114:setFontColor("Orange");
    lfm_setPropAsString(obj.label114, "fontStyle",  "bold");

    obj.layout74 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout74:setParent(obj.tab1);
    obj.layout74:setAlign("top");
    obj.layout74:setWidth(600);
    obj.layout74:setHeight(80);
    obj.layout74:setMargins({top=10});
    obj.layout74:setName("layout74");

    obj.rectangle84 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle84:setParent(obj.layout74);
    obj.rectangle84:setAlign("client");
    obj.rectangle84:setWidth(60);
    obj.rectangle84:setMargins({left=5, right=5});
    obj.rectangle84:setName("rectangle84");
    obj.rectangle84:setColor("transparent");
    obj.rectangle84:setStrokeColor("white");
    obj.rectangle84:setStrokeSize(1);
    obj.rectangle84:setXradius(10);
    obj.rectangle84:setYradius(10);
    obj.rectangle84:setCornerType("bevel");
    obj.rectangle84:setStrokeDash("dash");

    obj.layout75 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout75:setParent(obj.rectangle84);
    obj.layout75:setAlign("client");
    obj.layout75:setWidth(100);
    obj.layout75:setHeight(50);
    obj.layout75:setMargins({right=275, top=20, bottom=20});
    obj.layout75:setName("layout75");

    obj.label115 = gui.fromHandle(_obj_newObject("label"));
    obj.label115:setParent(obj.layout75);
    obj.label115:setText("Iniciativa:");
    lfm_setPropAsString(obj.label115, "fontStyle",  "bold");
    obj.label115:setAlign("left");
    obj.label115:setWordWrap(true);
    obj.label115:setMargins({left=10});
    obj.label115:setWidth(60);
    obj.label115:setName("label115");
    obj.label115:setFontColor("Moccasin");

    obj.rectangle85 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle85:setParent(obj.layout75);
    obj.rectangle85:setAlign("left");
    obj.rectangle85:setWidth(60);
    obj.rectangle85:setMargins({left=5});
    obj.rectangle85:setName("rectangle85");
    obj.rectangle85:setColor("transparent");
    obj.rectangle85:setStrokeColor("Orange");
    obj.rectangle85:setStrokeSize(1);
    obj.rectangle85:setXradius(10);
    obj.rectangle85:setYradius(10);
    obj.rectangle85:setCornerType("innerRound");
    obj.rectangle85:setStrokeDash("dash");

    obj.label116 = gui.fromHandle(_obj_newObject("label"));
    obj.label116:setParent(obj.rectangle85);
    obj.label116:setField("pokeInitiative");
    obj.label116:setAlign("client");
    obj.label116:setMargins({left=5,right=5});
    obj.label116:setHorzTextAlign("center");
    obj.label116:setName("label116");
    obj.label116:setFontColor("Orange");
    lfm_setPropAsString(obj.label116, "fontStyle",  "bold");

    obj.layout76 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout76:setParent(obj.rectangle84);
    obj.layout76:setAlign("client");
    obj.layout76:setWidth(100);
    obj.layout76:setHeight(50);
    obj.layout76:setMargins({left=180, top=20, right=155, bottom=20});
    obj.layout76:setName("layout76");

    obj.label117 = gui.fromHandle(_obj_newObject("label"));
    obj.label117:setParent(obj.layout76);
    obj.label117:setText("Dano Atk. Físico:");
    lfm_setPropAsString(obj.label117, "fontStyle",  "bold");
    obj.label117:setAlign("left");
    obj.label117:setWordWrap(true);
    obj.label117:setMargins({left=10});
    obj.label117:setWidth(80);
    obj.label117:setName("label117");
    obj.label117:setFontColor("Moccasin");

    obj.rectangle86 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle86:setParent(obj.layout76);
    obj.rectangle86:setAlign("left");
    obj.rectangle86:setWidth(60);
    obj.rectangle86:setMargins({left=5});
    obj.rectangle86:setName("rectangle86");
    obj.rectangle86:setColor("transparent");
    obj.rectangle86:setStrokeColor("Orange");
    obj.rectangle86:setStrokeSize(1);
    obj.rectangle86:setXradius(10);
    obj.rectangle86:setYradius(10);
    obj.rectangle86:setCornerType("innerRound");
    obj.rectangle86:setStrokeDash("dash");

    obj.label118 = gui.fromHandle(_obj_newObject("label"));
    obj.label118:setParent(obj.rectangle86);
    obj.label118:setField("pokeDamagePhysical");
    obj.label118:setAlign("client");
    obj.label118:setMargins({left=5,right=5});
    obj.label118:setHorzTextAlign("center");
    obj.label118:setName("label118");
    obj.label118:setFontColor("Orange");
    lfm_setPropAsString(obj.label118, "fontStyle",  "bold");

    obj.layout77 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout77:setParent(obj.rectangle84);
    obj.layout77:setAlign("client");
    obj.layout77:setWidth(100);
    obj.layout77:setHeight(50);
    obj.layout77:setMargins({left=360, top=20, right=5, bottom=20});
    obj.layout77:setName("layout77");

    obj.label119 = gui.fromHandle(_obj_newObject("label"));
    obj.label119:setParent(obj.layout77);
    obj.label119:setText("Dano Atk. Especial:");
    lfm_setPropAsString(obj.label119, "fontStyle",  "bold");
    obj.label119:setAlign("left");
    obj.label119:setWordWrap(true);
    obj.label119:setMargins({left=10});
    obj.label119:setWidth(80);
    obj.label119:setName("label119");
    obj.label119:setFontColor("Moccasin");

    obj.rectangle87 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle87:setParent(obj.layout77);
    obj.rectangle87:setAlign("left");
    obj.rectangle87:setWidth(60);
    obj.rectangle87:setMargins({left=5});
    obj.rectangle87:setName("rectangle87");
    obj.rectangle87:setColor("transparent");
    obj.rectangle87:setStrokeColor("Orange");
    obj.rectangle87:setStrokeSize(1);
    obj.rectangle87:setXradius(10);
    obj.rectangle87:setYradius(10);
    obj.rectangle87:setCornerType("innerRound");
    obj.rectangle87:setStrokeDash("dash");

    obj.label120 = gui.fromHandle(_obj_newObject("label"));
    obj.label120:setParent(obj.rectangle87);
    obj.label120:setField("pokeDamageSpecial");
    obj.label120:setAlign("client");
    obj.label120:setMargins({left=5,right=5});
    obj.label120:setHorzTextAlign("center");
    obj.label120:setName("label120");
    obj.label120:setFontColor("Orange");
    lfm_setPropAsString(obj.label120, "fontStyle",  "bold");

    obj.tab2 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.tabControl1);
    obj.tab2:setTitle("Skills");
    obj.tab2:setName("tab2");

    obj.button9 = gui.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.tab2);
    obj.button9:setLeft(5);
    obj.button9:setTop(5);
    obj.button9:setHeight(25);
    obj.button9:setAlign("top");
    obj.button9:setText("Adicionar Skill");
    obj.button9:setName("button9");

    obj.scrollBox2 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.tab2);
    obj.scrollBox2:setMargins({top=5});
    obj.scrollBox2:setAlign("client");
    obj.scrollBox2:setName("scrollBox2");

    obj.flowLayout2 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout2:setParent(obj.scrollBox2);
    obj.flowLayout2:setAutoHeight(true);
    obj.flowLayout2:setAlign("top");
    obj.flowLayout2:setOrientation("vertical");
    obj.flowLayout2:setHorzAlign("center");
    obj.flowLayout2:setMargins({top=5, left=5, right=5});
    obj.flowLayout2:setName("flowLayout2");

    obj.flowPart3 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart3:setParent(obj.flowLayout2);
    obj.flowPart3:setMinWidth(450);
    obj.flowPart3:setMaxWidth(500);
    obj.flowPart3:setHeight(300);
    obj.flowPart3:setAdjustHeightToLine(true);
    obj.flowPart3:setName("flowPart3");

    obj.layout78 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout78:setParent(obj.flowPart3);
    obj.layout78:setAlign("client");
    obj.layout78:setName("layout78");

    obj.rclSkills = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclSkills:setParent(obj.layout78);
    obj.rclSkills:setName("rclSkills");
    obj.rclSkills:setField("recSkills");
    obj.rclSkills:setTemplateForm("frmSkills");
    obj.rclSkills:setAlign("client");
    obj.rclSkills:setAutoHeight(true);

    obj.tab3 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.tabControl1);
    obj.tab3:setTitle("Habilidades");
    obj.tab3:setName("tab3");

    obj.button10 = gui.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.tab3);
    obj.button10:setLeft(5);
    obj.button10:setTop(5);
    obj.button10:setHeight(25);
    obj.button10:setAlign("top");
    obj.button10:setText("Adicionar Habilidade");
    obj.button10:setName("button10");

    obj.scrollBox3 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox3:setParent(obj.tab3);
    obj.scrollBox3:setMargins({top=5});
    obj.scrollBox3:setAlign("client");
    obj.scrollBox3:setName("scrollBox3");

    obj.flowLayout3 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout3:setParent(obj.scrollBox3);
    obj.flowLayout3:setAutoHeight(true);
    obj.flowLayout3:setAlign("top");
    obj.flowLayout3:setOrientation("vertical");
    obj.flowLayout3:setHorzAlign("center");
    obj.flowLayout3:setMargins({top=5, left=5, right=5});
    obj.flowLayout3:setName("flowLayout3");

    obj.flowPart4 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart4:setParent(obj.flowLayout3);
    obj.flowPart4:setMinWidth(450);
    obj.flowPart4:setMaxWidth(500);
    obj.flowPart4:setHeight(300);
    obj.flowPart4:setAdjustHeightToLine(true);
    obj.flowPart4:setName("flowPart4");

    obj.layout79 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout79:setParent(obj.flowPart4);
    obj.layout79:setAlign("client");
    obj.layout79:setName("layout79");

    obj.rclAbilities = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclAbilities:setParent(obj.layout79);
    obj.rclAbilities:setName("rclAbilities");
    obj.rclAbilities:setField("recAbilities");
    obj.rclAbilities:setTemplateForm("frmAbilities");
    obj.rclAbilities:setAlign("client");
    obj.rclAbilities:setAutoHeight(true);

    obj.tab4 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab4:setParent(obj.tabControl1);
    obj.tab4:setTitle("Moves");
    obj.tab4:setName("tab4");

    obj.button11 = gui.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.tab4);
    obj.button11:setLeft(5);
    obj.button11:setTop(5);
    obj.button11:setHeight(25);
    obj.button11:setAlign("top");
    obj.button11:setText("Adicionar Move");
    obj.button11:setName("button11");

    obj.scrollBox4 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox4:setParent(obj.tab4);
    obj.scrollBox4:setMargins({top=5});
    obj.scrollBox4:setAlign("client");
    obj.scrollBox4:setName("scrollBox4");

    obj.flowLayout4 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout4:setParent(obj.scrollBox4);
    obj.flowLayout4:setAutoHeight(true);
    obj.flowLayout4:setAlign("top");
    obj.flowLayout4:setOrientation("vertical");
    obj.flowLayout4:setHorzAlign("center");
    obj.flowLayout4:setMargins({top=5, left=5, right=5});
    obj.flowLayout4:setName("flowLayout4");

    obj.flowPart5 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart5:setParent(obj.flowLayout4);
    obj.flowPart5:setMinWidth(450);
    obj.flowPart5:setMaxWidth(500);
    obj.flowPart5:setHeight(300);
    obj.flowPart5:setAdjustHeightToLine(true);
    obj.flowPart5:setName("flowPart5");

    obj.layout80 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout80:setParent(obj.flowPart5);
    obj.layout80:setAlign("client");
    obj.layout80:setName("layout80");

    obj.rclMoves = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclMoves:setParent(obj.layout80);
    obj.rclMoves:setName("rclMoves");
    obj.rclMoves:setField("recMoves");
    obj.rclMoves:setTemplateForm("frmMoves");
    obj.rclMoves:setAlign("client");
    obj.rclMoves:setAutoHeight(true);

    obj.tab5 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab5:setParent(obj.tabControl1);
    obj.tab5:setTitle("PokéEdge/Tutor");
    obj.tab5:setName("tab5");

    obj.layout81 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout81:setParent(obj.tab5);
    obj.layout81:setAlign("top");
    obj.layout81:setMargins({left=10, top=10, right=300, bottom=5});
    obj.layout81:setHeight(30);
    obj.layout81:setName("layout81");

    obj.label121 = gui.fromHandle(_obj_newObject("label"));
    obj.label121:setParent(obj.layout81);
    obj.label121:setText("Tutor Points:");
    lfm_setPropAsString(obj.label121, "fontStyle",  "bold");
    obj.label121:setAlign("left");
    obj.label121:setWidth(80);
    obj.label121:setName("label121");
    obj.label121:setFontColor("Moccasin");

    obj.rectangle88 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle88:setParent(obj.layout81);
    obj.rectangle88:setAlign("client");
    obj.rectangle88:setWidth(80);
    obj.rectangle88:setColor("transparent");
    obj.rectangle88:setStrokeColor("white");
    obj.rectangle88:setStrokeSize(1);
    obj.rectangle88:setXradius(10);
    obj.rectangle88:setYradius(10);
    obj.rectangle88:setCornerType("bevel");
    obj.rectangle88:setStrokeDash("dash");
    obj.rectangle88:setMargins({left=5, right=2});
    obj.rectangle88:setName("rectangle88");

    obj.edit43 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.rectangle88);
    obj.edit43:setField("pokeTutorPoints");
    obj.edit43:setAlign("client");
    obj.edit43:setType("number");
    obj.edit43:setTransparent(true);
    obj.edit43:setMargins({left=5, right=5});
    obj.edit43:setHorzTextAlign("center");
    obj.edit43:setName("edit43");
    obj.edit43:setFontColor("White");
    lfm_setPropAsString(obj.edit43, "fontStyle",  "bold");

    obj.button12 = gui.fromHandle(_obj_newObject("button"));
    obj.button12:setParent(obj.tab5);
    obj.button12:setLeft(5);
    obj.button12:setTop(5);
    obj.button12:setHeight(25);
    obj.button12:setAlign("top");
    obj.button12:setText("Adicionar Item");
    obj.button12:setName("button12");

    obj.scrollBox5 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox5:setParent(obj.tab5);
    obj.scrollBox5:setMargins({top=5});
    obj.scrollBox5:setAlign("client");
    obj.scrollBox5:setName("scrollBox5");

    obj.flowLayout5 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout5:setParent(obj.scrollBox5);
    obj.flowLayout5:setAutoHeight(true);
    obj.flowLayout5:setAlign("top");
    obj.flowLayout5:setOrientation("vertical");
    obj.flowLayout5:setHorzAlign("center");
    obj.flowLayout5:setMargins({top=5, left=5, right=5});
    obj.flowLayout5:setName("flowLayout5");

    obj.flowPart6 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart6:setParent(obj.flowLayout5);
    obj.flowPart6:setMinWidth(450);
    obj.flowPart6:setMaxWidth(500);
    obj.flowPart6:setHeight(1000);
    obj.flowPart6:setAdjustHeightToLine(true);
    obj.flowPart6:setName("flowPart6");

    obj.layout82 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout82:setParent(obj.flowPart6);
    obj.layout82:setAlign("client");
    obj.layout82:setName("layout82");

    obj.rclTutor = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclTutor:setParent(obj.layout82);
    obj.rclTutor:setName("rclTutor");
    obj.rclTutor:setField("recTutor");
    obj.rclTutor:setTemplateForm("frmTutor");
    obj.rclTutor:setAlign("client");
    obj.rclTutor:setAutoHeight(true);

    obj.tab6 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab6:setParent(obj.tabControl1);
    obj.tab6:setTitle("Misc");
    obj.tab6:setName("tab6");

    obj.layout83 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout83:setParent(obj.tab6);
    obj.layout83:setAlign("top");
    obj.layout83:setWidth(100);
    obj.layout83:setHeight(100);
    obj.layout83:setMargins({left=5, top=5, right=5});
    obj.layout83:setName("layout83");

    obj.label122 = gui.fromHandle(_obj_newObject("label"));
    obj.label122:setParent(obj.layout83);
    obj.label122:setText("Vitaminas");
    obj.label122:setFontSize(18);
    lfm_setPropAsString(obj.label122, "fontStyle",  "bold");
    obj.label122:setAlign("top");
    obj.label122:setWidth(50);
    obj.label122:setHeight(30);
    obj.label122:setName("label122");
    obj.label122:setFontColor("Moccasin");

    obj.rectangle89 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle89:setParent(obj.layout83);
    obj.rectangle89:setAlign("client");
    obj.rectangle89:setHeight(60);
    obj.rectangle89:setMargins({left=5, top=5, right=5});
    obj.rectangle89:setName("rectangle89");
    obj.rectangle89:setColor("transparent");
    obj.rectangle89:setStrokeColor("white");
    obj.rectangle89:setStrokeSize(1);
    obj.rectangle89:setXradius(10);
    obj.rectangle89:setYradius(10);
    obj.rectangle89:setCornerType("bevel");
    obj.rectangle89:setStrokeDash("dash");

    obj.textEditor5 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor5:setParent(obj.rectangle89);
    obj.textEditor5:setField("pokeVitamins");
    obj.textEditor5:setAlign("client");
    obj.textEditor5:setTransparent(true);
    obj.textEditor5:setMargins({left=5, top=5, right=5, bottom=5});
    obj.textEditor5:setName("textEditor5");

    obj.layout84 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout84:setParent(obj.tab6);
    obj.layout84:setAlign("top");
    obj.layout84:setWidth(100);
    obj.layout84:setHeight(250);
    obj.layout84:setMargins({left=5, top=5});
    obj.layout84:setName("layout84");

    obj.layout85 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout85:setParent(obj.layout84);
    obj.layout85:setAlign("left");
    obj.layout85:setWidth(250);
    obj.layout85:setMargins({left=5, top=10, right=5});
    obj.layout85:setName("layout85");

    obj.label123 = gui.fromHandle(_obj_newObject("label"));
    obj.label123:setParent(obj.layout85);
    obj.label123:setText("Moves de Herança");
    obj.label123:setFontSize(18);
    lfm_setPropAsString(obj.label123, "fontStyle",  "bold");
    obj.label123:setAlign("top");
    obj.label123:setWidth(50);
    obj.label123:setHeight(30);
    obj.label123:setName("label123");
    obj.label123:setFontColor("Moccasin");

    obj.rectangle90 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle90:setParent(obj.layout85);
    obj.rectangle90:setAlign("client");
    obj.rectangle90:setHeight(60);
    obj.rectangle90:setMargins({left=5, top=5, right=5});
    obj.rectangle90:setName("rectangle90");
    obj.rectangle90:setColor("transparent");
    obj.rectangle90:setStrokeColor("white");
    obj.rectangle90:setStrokeSize(1);
    obj.rectangle90:setXradius(10);
    obj.rectangle90:setYradius(10);
    obj.rectangle90:setCornerType("bevel");
    obj.rectangle90:setStrokeDash("dash");

    obj.textEditor6 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor6:setParent(obj.rectangle90);
    obj.textEditor6:setField("pokeHeritage");
    obj.textEditor6:setAlign("client");
    obj.textEditor6:setTransparent(true);
    obj.textEditor6:setMargins({left=5, top=5, right=5, bottom=5});
    obj.textEditor6:setName("textEditor6");

    obj.layout86 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout86:setParent(obj.layout84);
    obj.layout86:setAlign("left");
    obj.layout86:setWidth(250);
    obj.layout86:setMargins({left=15, top=10, right=5});
    obj.layout86:setName("layout86");

    obj.layout87 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout87:setParent(obj.layout86);
    obj.layout87:setAlign("top");
    obj.layout87:setHeight(30);
    obj.layout87:setWidth(250);
    obj.layout87:setName("layout87");

    obj.label124 = gui.fromHandle(_obj_newObject("label"));
    obj.label124:setParent(obj.layout87);
    obj.label124:setAlign("left");
    obj.label124:setText("Lesões");
    obj.label124:setFontSize(18);
    lfm_setPropAsString(obj.label124, "fontStyle",  "bold");
    obj.label124:setWidth(180);
    obj.label124:setHeight(30);
    obj.label124:setName("label124");
    obj.label124:setFontColor("Moccasin");

    obj.rectangle91 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle91:setParent(obj.layout87);
    obj.rectangle91:setAlign("left");
    obj.rectangle91:setWidth(50);
    obj.rectangle91:setMargins({left=10});
    obj.rectangle91:setName("rectangle91");
    obj.rectangle91:setColor("transparent");
    obj.rectangle91:setStrokeColor("white");
    obj.rectangle91:setStrokeSize(1);
    obj.rectangle91:setXradius(10);
    obj.rectangle91:setYradius(10);
    obj.rectangle91:setCornerType("bevel");
    obj.rectangle91:setStrokeDash("dash");

    obj.comboBox10 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox10:setParent(obj.rectangle91);
    obj.comboBox10:setField("pokeInjuriesQtd");
    obj.comboBox10:setText("Escolha");
    obj.comboBox10:setAlign("client");
    obj.comboBox10:setTransparent(true);
    obj.comboBox10:setMargins({left=10});
    obj.comboBox10:setHorzTextAlign("center");
    obj.comboBox10:setItems({'0', '1', '2', '3', '4', '5'});
    obj.comboBox10:setValues({'0', '1', '2', '3', '4', '5',});
    obj.comboBox10:setValue("0");
    obj.comboBox10:setFontColor("White");
    obj.comboBox10:setName("comboBox10");

    obj.rectangle92 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle92:setParent(obj.layout86);
    obj.rectangle92:setAlign("client");
    obj.rectangle92:setHeight(60);
    obj.rectangle92:setMargins({left=5, top=5, right=5});
    obj.rectangle92:setName("rectangle92");
    obj.rectangle92:setColor("transparent");
    obj.rectangle92:setStrokeColor("white");
    obj.rectangle92:setStrokeSize(1);
    obj.rectangle92:setXradius(10);
    obj.rectangle92:setYradius(10);
    obj.rectangle92:setCornerType("bevel");
    obj.rectangle92:setStrokeDash("dash");

    obj.textEditor7 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor7:setParent(obj.rectangle92);
    obj.textEditor7:setField("pokeInjuries");
    obj.textEditor7:setAlign("client");
    obj.textEditor7:setTransparent(true);
    obj.textEditor7:setMargins({left=5, top=5, right=5, bottom=5});
    obj.textEditor7:setName("textEditor7");

    obj.tab7 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab7:setParent(obj.tabControl1);
    obj.tab7:setTitle("Anotações");
    obj.tab7:setName("tab7");

    obj.rectangle93 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle93:setParent(obj.tab7);
    obj.rectangle93:setAlign("left");
    obj.rectangle93:setWidth(250);
    obj.rectangle93:setMargins({top=5, left=10, bottom=5});
    obj.rectangle93:setName("rectangle93");
    obj.rectangle93:setColor("transparent");
    obj.rectangle93:setStrokeColor("white");
    obj.rectangle93:setStrokeSize(1);
    obj.rectangle93:setXradius(10);
    obj.rectangle93:setYradius(10);
    obj.rectangle93:setCornerType("bevel");
    obj.rectangle93:setStrokeDash("dash");

    obj.textEditor8 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor8:setParent(obj.rectangle93);
    obj.textEditor8:setField("pokeAnnotations");
    obj.textEditor8:setAlign("client");
    obj.textEditor8:setTransparent(true);
    obj.textEditor8:setWidth(180);
    obj.textEditor8:setMargins({top=5, bottom=5, left=5, right=5});
    obj.textEditor8:setName("textEditor8");

    obj.rectangle94 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle94:setParent(obj.tab7);
    obj.rectangle94:setAlign("left");
    obj.rectangle94:setWidth(250);
    obj.rectangle94:setMargins({top=5, left=10, bottom=5});
    obj.rectangle94:setName("rectangle94");
    obj.rectangle94:setColor("transparent");
    obj.rectangle94:setStrokeColor("white");
    obj.rectangle94:setStrokeSize(1);
    obj.rectangle94:setXradius(10);
    obj.rectangle94:setYradius(10);
    obj.rectangle94:setCornerType("bevel");
    obj.rectangle94:setStrokeDash("dash");

    obj.textEditor9 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor9:setParent(obj.rectangle94);
    obj.textEditor9:setField("pokeAnnotations2");
    obj.textEditor9:setAlign("client");
    obj.textEditor9:setTransparent(true);
    obj.textEditor9:setWidth(180);
    obj.textEditor9:setMargins({top=5, bottom=5, left=5, right=5});
    obj.textEditor9:setName("textEditor9");

    obj.tab8 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab8:setParent(obj.tabControl1);
    obj.tab8:setTitle("Calculations");
    obj.tab8:setVisible(false);
    obj.tab8:setName("tab8");

    obj.label125 = gui.fromHandle(_obj_newObject("label"));
    obj.label125:setParent(obj.tab8);
    obj.label125:setField("fullPV");
    obj.label125:setAlign("client");
    obj.label125:setName("label125");
    obj.label125:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label125, "fontStyle",  "bold");

    obj.label126 = gui.fromHandle(_obj_newObject("label"));
    obj.label126:setParent(obj.tab8);
    obj.label126:setField("pokeCmbtStgHPVlr");
    obj.label126:setAlign("client");
    obj.label126:setName("label126");
    obj.label126:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label126, "fontStyle",  "bold");

    obj.label127 = gui.fromHandle(_obj_newObject("label"));
    obj.label127:setParent(obj.tab8);
    obj.label127:setField("pokeCmbtStgSpdVlr");
    obj.label127:setAlign("client");
    obj.label127:setName("label127");
    obj.label127:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label127, "fontStyle",  "bold");

    obj.label128 = gui.fromHandle(_obj_newObject("label"));
    obj.label128:setParent(obj.tab8);
    obj.label128:setField("pokeCmbtStgAtkVlr");
    obj.label128:setAlign("client");
    obj.label128:setName("label128");
    obj.label128:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label128, "fontStyle",  "bold");

    obj.label129 = gui.fromHandle(_obj_newObject("label"));
    obj.label129:setParent(obj.tab8);
    obj.label129:setField("pokeCmbtStgDefVlr");
    obj.label129:setAlign("client");
    obj.label129:setName("label129");
    obj.label129:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label129, "fontStyle",  "bold");

    obj.label130 = gui.fromHandle(_obj_newObject("label"));
    obj.label130:setParent(obj.tab8);
    obj.label130:setField("pokeCmbtStgSpAtkVlr");
    obj.label130:setAlign("client");
    obj.label130:setName("label130");
    obj.label130:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label130, "fontStyle",  "bold");

    obj.label131 = gui.fromHandle(_obj_newObject("label"));
    obj.label131:setParent(obj.tab8);
    obj.label131:setField("pokeCmbtStgSpDefVlr");
    obj.label131:setAlign("client");
    obj.label131:setName("label131");
    obj.label131:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label131, "fontStyle",  "bold");

    obj.textEditor10 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor10:setParent(obj.tab8);
    obj.textEditor10:setField("pokePowers");
    obj.textEditor10:setAlign("client");
    obj.textEditor10:setWidth(200);
    obj.textEditor10:setLeft(25);
    obj.textEditor10:setTop(10);
    obj.textEditor10:setName("textEditor10");

    obj.tab9 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab9:setParent(obj.tabControl1);
    obj.tab9:setTitle("Plugin");
    obj.tab9:setName("tab9");

    obj.rectangle95 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle95:setParent(obj.tab9);
    obj.rectangle95:setAlign("client");
    obj.rectangle95:setWidth(100);
    obj.rectangle95:setMargins({top=5, bottom=5, left=5, right=5});
    obj.rectangle95:setName("rectangle95");
    obj.rectangle95:setColor("transparent");
    obj.rectangle95:setStrokeColor("white");
    obj.rectangle95:setStrokeSize(1);
    obj.rectangle95:setXradius(10);
    obj.rectangle95:setYradius(10);
    obj.rectangle95:setCornerType("bevel");
    obj.rectangle95:setStrokeDash("dash");

    obj.layout88 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout88:setParent(obj.rectangle95);
    obj.layout88:setAlign("top");
    obj.layout88:setHeight(40);
    obj.layout88:setMargins({top=10});
    obj.layout88:setName("layout88");

    obj.label132 = gui.fromHandle(_obj_newObject("label"));
    obj.label132:setParent(obj.layout88);
    obj.label132:setText("Versão");
    obj.label132:setAlign("left");
    obj.label132:setWidth(80);
    obj.label132:setHorzTextAlign("center");
    obj.label132:setName("label132");
    obj.label132:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label132, "fontStyle",  "bold");
    obj.label132:setFontSize(18);

    obj.rectangle96 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle96:setParent(obj.layout88);
    obj.rectangle96:setAlign("left");
    obj.rectangle96:setWidth(100);
    obj.rectangle96:setStrokeColor("orange");
    obj.rectangle96:setMargins({left=10});
    obj.rectangle96:setName("rectangle96");
    obj.rectangle96:setColor("transparent");
    obj.rectangle96:setStrokeSize(1);
    obj.rectangle96:setXradius(10);
    obj.rectangle96:setYradius(10);
    obj.rectangle96:setCornerType("bevel");
    obj.rectangle96:setStrokeDash("dash");

    obj.label133 = gui.fromHandle(_obj_newObject("label"));
    obj.label133:setParent(obj.rectangle96);
    obj.label133:setText("2.0");
    obj.label133:setAlign("client");
    obj.label133:setMargins({top=5, bottom=5, left=5, right=5});
    obj.label133:setHorzTextAlign("center");
    obj.label133:setName("label133");
    obj.label133:setFontColor("Orange");
    lfm_setPropAsString(obj.label133, "fontStyle",  "bold");

    obj.button13 = gui.fromHandle(_obj_newObject("button"));
    obj.button13:setParent(obj.layout88);
    obj.button13:setText("Baixar Plugin");
    obj.button13:setAlign("right");
    obj.button13:setWidth(180);
    obj.button13:setMargins({top=5, right=20});
    obj.button13:setName("button13");

    obj.label134 = gui.fromHandle(_obj_newObject("label"));
    obj.label134:setParent(obj.rectangle95);
    obj.label134:setText("Originalmente desenvolvido para a mesa District League");
    obj.label134:setAlign("top");
    obj.label134:setWidth(600);
    obj.label134:setHeight(40);
    obj.label134:setMargins({top=15});
    obj.label134:setHorzTextAlign("center");
    obj.label134:setName("label134");
    obj.label134:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label134, "fontStyle",  "bold");

    obj.layout89 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout89:setParent(obj.rectangle95);
    obj.layout89:setAlign("top");
    obj.layout89:setHeight(160);
    obj.layout89:setMargins({top=10});
    obj.layout89:setName("layout89");

    obj.layout90 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout90:setParent(obj.layout89);
    obj.layout90:setAlign("left");
    obj.layout90:setWidth(178);
    obj.layout90:setName("layout90");

    obj.rectangle97 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle97:setParent(obj.layout89);
    obj.rectangle97:setAlign("left");
    obj.rectangle97:setWidth(160);
    obj.rectangle97:setColor("white");
    obj.rectangle97:setStrokeColor("black");
    obj.rectangle97:setStrokeSize(1);
    obj.rectangle97:setCornerType("innerLine");
    obj.rectangle97:setStrokeDash("dash");
    obj.rectangle97:setName("rectangle97");

    obj.image2 = gui.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.rectangle97);
    obj.image2:setSRC("img/district_league_logo.png");
    obj.image2:setStyle("proportional");
    obj.image2:setCenter(true);
    obj.image2:setLeft(5);
    obj.image2:setTop(5);
    obj.image2:setWidth(150);
    obj.image2:setHeight(150);
    obj.image2:setName("image2");

    obj.button14 = gui.fromHandle(_obj_newObject("button"));
    obj.button14:setParent(obj.rectangle95);
    obj.button14:setText("Conheça a Mesa");
    obj.button14:setAlign("top");
    obj.button14:setWidth(50);
    obj.button14:setMargins({top=10, left=160, right=170});
    obj.button14:setName("button14");

    obj.label135 = gui.fromHandle(_obj_newObject("label"));
    obj.label135:setParent(obj.rectangle95);
    obj.label135:setText("Design e Programação por Shakerskj");
    obj.label135:setAlign("bottom");
    obj.label135:setWidth(600);
    obj.label135:setHeight(40);
    obj.label135:setMargins({top=10, left=25});
    obj.label135:setHorzTextAlign("leading");
    obj.label135:setName("label135");
    obj.label135:setFontColor("Moccasin");
    lfm_setPropAsString(obj.label135, "fontStyle",  "bold");

    obj.dataLink1 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj);
    obj.dataLink1:setField("pokeNature");
    obj.dataLink1:setName("dataLink1");

    obj.dataLink2 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj);
    obj.dataLink2:setFields({'pokeInjuriesQtd', 'pokeHPBase', 'pokeHPProg', 'pokeNatureHP', 'pokeLevel'});
    obj.dataLink2:setName("dataLink2");

    obj.dataLink3 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj);
    obj.dataLink3:setFields({'pokeCmbtStgSpd', 'pokeSpeedBase', 'pokeSpeedProg', 'pokeNatureSpd'});
    obj.dataLink3:setName("dataLink3");

    obj.dataLink4 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj);
    obj.dataLink4:setFields({'pokeCmbtStgAtk', 'pokeAttackBase', 'pokeAttackProg', 'pokeNatureAtk'});
    obj.dataLink4:setName("dataLink4");

    obj.dataLink5 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj);
    obj.dataLink5:setFields({'pokeCmbtStgDef', 'pokeDefenseBase', 'pokeDefenseProg', 'pokeNatureDef'});
    obj.dataLink5:setName("dataLink5");

    obj.dataLink6 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj);
    obj.dataLink6:setFields({'pokeCmbtStgSpAtk', 'pokeSpAttackBase', 'pokeSpAttackProg', 'pokeNatureSpAtk'});
    obj.dataLink6:setName("dataLink6");

    obj.dataLink7 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj);
    obj.dataLink7:setFields({'pokeCmbtStgSpDef', 'pokeSpDefenseBase', 'pokeSpDefenseProg', 'pokeNatureSpDef'});
    obj.dataLink7:setName("dataLink7");


		local function hideLoyalty()
			if sheet~= nil then
				local personagem = rrpg.getPersonagemDe(sheet);        
				local mesa = personagem.mesa;
				if mesa.meuJogador.isMestre then
					self.loyaltyBtn.enabled = true;
				else
					self.loyaltyBtn.enabled = false;
				end;
			end;
		end;
	


    obj._e_event0 = obj:addEventListener("onNodeReady",
        function (self)
            hideLoyalty();
        end, obj);

    obj._e_event1 = obj.button1:addEventListener("onClick",
        function (self)
            local pop = self:findControlByName("pokemonPopUp");
            								
            									if pop ~= nil then
            										pop:setNodeObject(self.sheet);
            										pop:showPopupEx("center", self.AtrBut);
            									else
            										showMessage("Ops, bug.. nao encontrei o popup do pokemon para exibir");
            									end;
        end, obj);

    obj._e_event2 = obj.button2:addEventListener("onClick",
        function (self)
            local pop = self:findControlByName("speciesPopUp");
            								
            									if pop ~= nil then
            										pop:setNodeObject(self.sheet);
            										pop:showPopupEx("center", self.AtrBut);
            									else
            										showMessage("Ops, bug.. nao encontrei o popup de especie para exibir");
            									end;
        end, obj);

    obj._e_event3 = obj.loyaltyBtn:addEventListener("onClick",
        function (self)
            local pop = self:findControlByName("loyaltyPopUp");
            							
            								if pop ~= nil then
            									pop:setNodeObject(self.sheet);
            									pop:showPopupEx("center", self.AtrBut);
            								else
            									showMessage("Ops, bug.. nao encontrei o popup de especie para exibir");
            								end;
        end, obj);

    obj._e_event4 = obj.progressBar1:addEventListener("onClick",
        function (self)
            local pop = self:findControlByName("xpPopUp");
            						
            							if pop ~= nil then
            								pop:setNodeObject(self.sheet);
            								pop:showPopupEx("center", self.AtrBut);
            							else
            								showMessage("Ops, bug.. nao encontrei o popup de XP para exibir");
            							end;
        end, obj);

    obj._e_event5 = obj.button3:addEventListener("onClick",
        function (self)
            local pop = self:findControlByName("hpPopUp");
            								
            									if pop ~= nil then
            										pop:setNodeObject(self.sheet);
            										pop:showPopupEx("center", self.AtrBut);
            									else
            										showMessage("Ops, bug.. nao encontrei o popup de atributos para exibir");
            									end;
        end, obj);

    obj._e_event6 = obj.button4:addEventListener("onClick",
        function (self)
            local pop = self:findControlByName("atkPopUp");
            								
            									if pop ~= nil then
            										pop:setNodeObject(self.sheet);
            										pop:showPopupEx("center", self.AtrBut);
            									else
            										showMessage("Ops, bug.. nao encontrei o popup de atributos para exibir");
            									end;
        end, obj);

    obj._e_event7 = obj.button5:addEventListener("onClick",
        function (self)
            local pop = self:findControlByName("spAtkPopUp");
            							
            								if pop ~= nil then
            									pop:setNodeObject(self.sheet);
            									pop:showPopupEx("center", self.AtrBut);
            								else
            									showMessage("Ops, bug.. nao encontrei o popup de atributos para exibir");
            								end;
        end, obj);

    obj._e_event8 = obj.button6:addEventListener("onClick",
        function (self)
            local pop = self:findControlByName("spdPopUp");
            									
            										if pop ~= nil then
            											pop:setNodeObject(self.sheet);
            											pop:showPopupEx("center", self.AtrBut);
            										else
            											showMessage("Ops, bug.. nao encontrei o popup de atributos para exibir");
            										end;
        end, obj);

    obj._e_event9 = obj.button7:addEventListener("onClick",
        function (self)
            local pop = self:findControlByName("defPopUp");
            									
            										if pop ~= nil then
            											pop:setNodeObject(self.sheet);
            											pop:showPopupEx("center", self.AtrBut);
            										else
            											showMessage("Ops, bug.. nao encontrei o popup de atributos para exibir");
            										end;
        end, obj);

    obj._e_event10 = obj.button8:addEventListener("onClick",
        function (self)
            local pop = self:findControlByName("spDefPopUp");
            									
            										if pop ~= nil then
            											pop:setNodeObject(self.sheet);
            											pop:showPopupEx("center", self.AtrBut);
            										else
            											showMessage("Ops, bug.. nao encontrei o popup de atributos para exibir");
            										end;
        end, obj);

    obj._e_event11 = obj.button9:addEventListener("onClick",
        function (self)
            self.rclSkills:append();
        end, obj);

    obj._e_event12 = obj.button10:addEventListener("onClick",
        function (self)
            self.rclAbilities:append();
        end, obj);

    obj._e_event13 = obj.button11:addEventListener("onClick",
        function (self)
            self.rclMoves:append();
        end, obj);

    obj._e_event14 = obj.button12:addEventListener("onClick",
        function (self)
            self.rclTutor:append();
        end, obj);

    obj._e_event15 = obj.button13:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/nv2vfm8si8pzm1h/PTU-PKMN-SKJ.rpk?dl=0');
        end, obj);

    obj._e_event16 = obj.button14:addEventListener("onClick",
        function (self)
            gui.openInBrowser('http://firecast.rrpg.com.br:90/a?a=pagRWEMesaInfo.actInfoMesa&mesaid=137661');
        end, obj);

    obj._e_event17 = obj.dataLink1:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if (sheet.pokeNature == "1") then
                sheet.pokeNatureHP = "+1";
                sheet.pokeNatureAtk = "-2";
                sheet.pokeNatureDef = "";
                sheet.pokeNatureSpAtk = "";
                sheet.pokeNatureSpDef = "";
                sheet.pokeNatureSpd = "";
            
                elseif (sheet.pokeNature == "2") then
                sheet.pokeNatureHP = "+1";
                sheet.pokeNatureAtk = "";
                sheet.pokeNatureDef = "-2";
                sheet.pokeNatureSpAtk = "";
                sheet.pokeNatureSpDef = "";
                sheet.pokeNatureSpd = "";
            
                elseif (sheet.pokeNature == "3") then
                sheet.pokeNatureHP = "+1";
                sheet.pokeNatureAtk = "";
                sheet.pokeNatureDef = "";
                sheet.pokeNatureSpAtk = "-2";
                sheet.pokeNatureSpDef = "";
                sheet.pokeNatureSpd = "";
            
                elseif (sheet.pokeNature == "4") then
                sheet.pokeNatureHP = "+1";
                sheet.pokeNatureAtk = "";
                sheet.pokeNatureDef = "";
                sheet.pokeNatureSpAtk = "";
                sheet.pokeNatureSpDef = "-2";
                sheet.pokeNatureSpd = "";
            
                elseif (sheet.pokeNature == "5") then
                sheet.pokeNatureHP = "+1";
                sheet.pokeNatureAtk = "";
                sheet.pokeNatureDef = "";
                sheet.pokeNatureSpAtk = "";
                sheet.pokeNatureSpDef = "";
                sheet.pokeNatureSpd = "-2";
            
                elseif (sheet.pokeNature == "6") then
                sheet.pokeNatureHP = "-1";
                sheet.pokeNatureAtk = "+2";
                sheet.pokeNatureDef = "";
                sheet.pokeNatureSpAtk = "";
                sheet.pokeNatureSpDef = "";
                sheet.pokeNatureSpd = "";
            
                elseif (sheet.pokeNature == "7") then
                sheet.pokeNatureHP = "";
                sheet.pokeNatureAtk = "+2";
                sheet.pokeNatureDef = "-2";
                sheet.pokeNatureSpAtk = "";
                sheet.pokeNatureSpDef = "";
                sheet.pokeNatureSpd = "";
            
                elseif (sheet.pokeNature == "8") then
                sheet.pokeNatureHP = "";
                sheet.pokeNatureAtk = "+2";
                sheet.pokeNatureDef = "";
                sheet.pokeNatureSpAtk = "-2";
                sheet.pokeNatureSpDef = "";
                sheet.pokeNatureSpd = "";
            
                elseif (sheet.pokeNature == "9") then
                sheet.pokeNatureHP = "";
                sheet.pokeNatureAtk = "+2";
                sheet.pokeNatureDef = "";
                sheet.pokeNatureSpAtk = "";
                sheet.pokeNatureSpDef = "-2";
                sheet.pokeNatureSpd = "";
            
                elseif (sheet.pokeNature == "10") then
                sheet.pokeNatureHP = "";
                sheet.pokeNatureAtk = "+2";
                sheet.pokeNatureDef = "";
                sheet.pokeNatureSpAtk = "";
                sheet.pokeNatureSpDef = "";
                sheet.pokeNatureSpd = "-2";
            
                elseif (sheet.pokeNature == "11") then
                sheet.pokeNatureHP = "";
                sheet.pokeNatureAtk = "";
                sheet.pokeNatureDef = "+2";
                sheet.pokeNatureSpAtk = "";
                sheet.pokeNatureSpDef = "";
                sheet.pokeNatureSpd = "";
            
                elseif (sheet.pokeNature == "12") then
                sheet.pokeNatureHP = "-1";
                sheet.pokeNatureAtk = "-2";
                sheet.pokeNatureDef = "+2";
                sheet.pokeNatureSpAtk = "";
                sheet.pokeNatureSpDef = "";
                sheet.pokeNatureSpd = "";
            
                elseif (sheet.pokeNature == "13") then
                sheet.pokeNatureHP = "";
                sheet.pokeNatureAtk = "";
                sheet.pokeNatureDef = "+2";
                sheet.pokeNatureSpAtk = "-2";
                sheet.pokeNatureSpDef = "";
                sheet.pokeNatureSpd = "";
            
                elseif (sheet.pokeNature == "14") then
                sheet.pokeNatureHP = "";
                sheet.pokeNatureAtk = "";
                sheet.pokeNatureDef = "+2";
                sheet.pokeNatureSpAtk = "";
                sheet.pokeNatureSpDef = "-2";
                sheet.pokeNatureSpd = "";
            
                elseif (sheet.pokeNature == "15") then
                sheet.pokeNatureHP = "";
                sheet.pokeNatureAtk = "";
                sheet.pokeNatureDef = "+2";
                sheet.pokeNatureSpAtk = "";
                sheet.pokeNatureSpDef = "";
                sheet.pokeNatureSpd = "-2";
            
                elseif (sheet.pokeNature == "16") then
                sheet.pokeNatureHP = "-1";
                sheet.pokeNatureAtk = "";
                sheet.pokeNatureDef = "";
                sheet.pokeNatureSpAtk = "+2";
                sheet.pokeNatureSpDef = "";
                sheet.pokeNatureSpd = "";
            
                elseif (sheet.pokeNature == "17") then
                sheet.pokeNatureHP = "";
                sheet.pokeNatureAtk = "-2";
                sheet.pokeNatureDef = "";
                sheet.pokeNatureSpAtk = "+2";
                sheet.pokeNatureSpDef = "";
                sheet.pokeNatureSpd = "";
            
                elseif (sheet.pokeNature == "18") then
                sheet.pokeNatureHP = "";
                sheet.pokeNatureAtk = "";
                sheet.pokeNatureDef = "-2";
                sheet.pokeNatureSpAtk = "+2";
                sheet.pokeNatureSpDef = "";
                sheet.pokeNatureSpd = "";
            
                elseif (sheet.pokeNature == "19") then
                sheet.pokeNatureHP = "";
                sheet.pokeNatureAtk = "";
                sheet.pokeNatureDef = "";
                sheet.pokeNatureSpAtk = "+2";
                sheet.pokeNatureSpDef = "-2";
                sheet.pokeNatureSpd = "";
            
                elseif (sheet.pokeNature == "2") then
                sheet.pokeNatureHP = "";
                sheet.pokeNatureAtk = "";
                sheet.pokeNatureDef = "";
                sheet.pokeNatureSpAtk = "+2";
                sheet.pokeNatureSpDef = "";
                sheet.pokeNatureSpd = "-2";
            
                elseif (sheet.pokeNature == "21") then
                sheet.pokeNatureHP = "-1";
                sheet.pokeNatureAtk = "";
                sheet.pokeNatureDef = "";
                sheet.pokeNatureSpAtk = "";
                sheet.pokeNatureSpDef = "+2";
                sheet.pokeNatureSpd = "";
            
                elseif (sheet.pokeNature == "22") then
                sheet.pokeNatureHP = "";
                sheet.pokeNatureAtk = "-2";
                sheet.pokeNatureDef = "";
                sheet.pokeNatureSpAtk = "";
                sheet.pokeNatureSpDef = "+2";
                sheet.pokeNatureSpd = "";
            
                elseif (sheet.pokeNature == "23") then
                sheet.pokeNatureHP = "";
                sheet.pokeNatureAtk = "";
                sheet.pokeNatureDef = "-2";
                sheet.pokeNatureSpAtk = "";
                sheet.pokeNatureSpDef = "+2";
                sheet.pokeNatureSpd = "";
            
                elseif (sheet.pokeNature == "24") then
                sheet.pokeNatureHP = "";
                sheet.pokeNatureAtk = "";
                sheet.pokeNatureDef = "";
                sheet.pokeNatureSpAtk = "-2";
                sheet.pokeNatureSpDef = "+2";
                sheet.pokeNatureSpd = "";
            
                elseif (sheet.pokeNature == "25") then
                sheet.pokeNatureHP = "";
                sheet.pokeNatureAtk = "";
                sheet.pokeNatureDef = "";
                sheet.pokeNatureSpAtk = "";
                sheet.pokeNatureSpDef = "+2";
                sheet.pokeNatureSpd = "-2";
            
            
                elseif (sheet.pokeNature == "26") then
                sheet.pokeNatureHP = "-1";
                sheet.pokeNatureAtk = "";
                sheet.pokeNatureDef = "";
                sheet.pokeNatureSpAtk = "";
                sheet.pokeNatureSpDef = "";
                sheet.pokeNatureSpd = "+2";
            
                elseif (sheet.pokeNature == "27") then
                sheet.pokeNatureHP = "";
                sheet.pokeNatureAtk = "-2";
                sheet.pokeNatureDef = "";
                sheet.pokeNatureSpAtk = "";
                sheet.pokeNatureSpDef = "";
                sheet.pokeNatureSpd = "+2";
            
                elseif (sheet.pokeNature == "28") then
                sheet.pokeNatureHP = "";
                sheet.pokeNatureAtk = "";
                sheet.pokeNatureDef = "-2";
                sheet.pokeNatureSpAtk = "";
                sheet.pokeNatureSpDef = "";
                sheet.pokeNatureSpd = "+2";
            
                elseif (sheet.pokeNature == "29") then
                sheet.pokeNatureHP = "";
                sheet.pokeNatureAtk = "";
                sheet.pokeNatureDef = "";
                sheet.pokeNatureSpAtk = "-2";
                sheet.pokeNatureSpDef = "";
                sheet.pokeNatureSpd = "+2";
            
                elseif (sheet.pokeNature == 30) then
                sheet.pokeNatureHP = "";
                sheet.pokeNatureAtk = "";
                sheet.pokeNatureDef = "";
                sheet.pokeNatureSpAtk = "";
                sheet.pokeNatureSpDef = "-2";
                sheet.pokeNatureSpd = "+2";
            
                else
                sheet.pokeNatureHP = "";
                sheet.pokeNatureAtk = "";
                sheet.pokeNatureDef = "";
                sheet.pokeNatureSpAtk = "";
                sheet.pokeNatureSpDef = "";
                sheet.pokeNatureSpd = "";
                end;
            
                sheet.pokePV = math.floor(((sheet.pokeHP or 1) *3) + (sheet.pokeLevel or 1) + (sheet.pokeNatureHP or 0) + 10);
                sheet.pokeEvasionPhysic = math.floor(((sheet.pokeDeffense or 0) + (sheet.pokeNatureDef or 0))/5);
                sheet.pokeEvasionSpecial = math.floor(((sheet.pokeSpecialDef or 0) + (sheet.pokeNatureSpDef or 0))/5);
                sheet.pokeEvasionSpeed = math.floor(((sheet.pokeSpeed or 0) + (sheet.pokeNatureSpd or 0))/5);
        end, obj);

    obj._e_event18 = obj.dataLink2:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if (sheet.pokeCmbtStgHP == "0") then
                sheet.pokeCmbtStgHPVlr = 0.4;
                elseif (sheet.pokeCmbtStgHP == "1") then
                sheet.pokeCmbtStgHPVlr = 0.5;
                elseif (sheet.pokeCmbtStgHP == "2") then
                sheet.pokeCmbtStgHPVlr = 0.6;
                elseif (sheet.pokeCmbtStgHP == "3") then
                sheet.pokeCmbtStgHPVlr = 0.7;
                elseif (sheet.pokeCmbtStgHP == "4") then
                sheet.pokeCmbtStgHPVlr = 0.8;
                elseif (sheet.pokeCmbtStgHP == "5") then
                sheet.pokeCmbtStgHPVlr = 0.9;
                elseif (sheet.pokeCmbtStgHP == "6") then
                sheet.pokeCmbtStgHPVlr = 1;
                elseif (sheet.pokeCmbtStgHP == "7") then
                sheet.pokeCmbtStgHPVlr = 1.2;
                elseif (sheet.pokeCmbtStgHP == "8") then
                sheet.pokeCmbtStgHPVlr = 1.4;
                elseif (sheet.pokeCmbtStgHP == "9") then
                sheet.pokeCmbtStgHPVlr = 1.6;
                elseif (sheet.pokeCmbtStgHP == "10") then
                sheet.pokeCmbtStgHPVlr = 1.8;
                elseif (sheet.pokeCmbtStgHP == "11") then
                sheet.pokeCmbtStgHPVlr = 2;
                elseif (sheet.pokeCmbtStgHP == "12") then
                sheet.pokeCmbtStgHPVlr = 2.2;
                end;
            	sheet.pokeHP = math.floor((sheet.pokeHPBase or 1) + (sheet.pokeHPProg or 0) + (sheet.pokeNatureHP or 0));
                sheet.fullPV = math.floor((((sheet.pokeHP or 1) *3) + (sheet.pokeLevel or 1) + 10));
            	sheet.pokePV = math.floor(sheet.fullPV - ((sheet.fullPV / 10 ) * (sheet.pokeInjuriesQtd or 0)));
        end, obj);

    obj._e_event19 = obj.dataLink3:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if (sheet.pokeCmbtStgSpd == "0") then
                sheet.pokeCmbtStgSpdVlr = 0.4;
                elseif (sheet.pokeCmbtStgSpd == "1") then
                sheet.pokeCmbtStgSpdVlr = 0.5;
                elseif (sheet.pokeCmbtStgSpd == "2") then
                sheet.pokeCmbtStgSpdVlr = 0.6;
                elseif (sheet.pokeCmbtStgSpd == "3") then
                sheet.pokeCmbtStgSpdVlr = 0.7;
                elseif (sheet.pokeCmbtStgSpd == "4") then
                sheet.pokeCmbtStgSpdVlr = 0.8;
                elseif (sheet.pokeCmbtStgSpd == "5") then
                sheet.pokeCmbtStgSpdVlr = 0.9;
                elseif (sheet.pokeCmbtStgSpd == "6") then
                sheet.pokeCmbtStgSpdVlr = 1;
                elseif (sheet.pokeCmbtStgSpd == "7") then
                sheet.pokeCmbtStgSpdVlr = 1.2;
                elseif (sheet.pokeCmbtStgSpd == "8") then
                sheet.pokeCmbtStgSpdVlr = 1.4;
                elseif (sheet.pokeCmbtStgSpd == "9") then
                sheet.pokeCmbtStgSpdVlr = 1.6;
                elseif (sheet.pokeCmbtStgSpd == "10") then
                sheet.pokeCmbtStgSpdVlr = 1.8;
                elseif (sheet.pokeCmbtStgSpd == "11") then
                sheet.pokeCmbtStgSpdVlr = 2;
                elseif (sheet.pokeCmbtStgSpd == "12") then
                sheet.pokeCmbtStgSpdVlr = 2.2;
                end;
            	sheet.pokeSpeed = math.floor(((sheet.pokeSpeedBase or 1) + (sheet.pokeSpeedProg or 0) + (sheet.pokeNatureSpd or 0)) * (sheet.pokeCmbtStgSpdVlr or 1));
                sheet.pokeEvasionSpeed = math.floor((sheet.pokeSpeed * (sheet.pokeCmbtStgSpdVlr or 1))/5);
                sheet.pokeInitiative = math.floor(sheet.pokeSpeed  * (sheet.pokeCmbtStgSpdVlr or 1));
        end, obj);

    obj._e_event20 = obj.dataLink4:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if (sheet.pokeCmbtStgAtk == "0") then
                sheet.pokeCmbtStgAtkVlr = 0.4;
                elseif (sheet.pokeCmbtStgAtk == "1") then
                sheet.pokeCmbtStgAtkVlr = 0.5;
                elseif (sheet.pokeCmbtStgAtk == "2") then
                sheet.pokeCmbtStgAtkVlr = 0.6;
                elseif (sheet.pokeCmbtStgAtk == "3") then
                sheet.pokeCmbtStgAtkVlr = 0.7;
                elseif (sheet.pokeCmbtStgAtk == "4") then
                sheet.pokeCmbtStgAtkVlr = 0.8;
                elseif (sheet.pokeCmbtStgAtk == "5") then
                sheet.pokeCmbtStgAtkVlr = 0.9;
                elseif (sheet.pokeCmbtStgAtk == "6") then
                sheet.pokeCmbtStgAtkVlr = 1;
                elseif (sheet.pokeCmbtStgAtk == "7") then
                sheet.pokeCmbtStgAtkVlr = 1.2;
                elseif (sheet.pokeCmbtStgAtk == "8") then
                sheet.pokeCmbtStgAtkVlr = 1.4;
                elseif (sheet.pokeCmbtStgAtk == "9") then
                sheet.pokeCmbtStgAtkVlr = 1.6;
                elseif (sheet.pokeCmbtStgAtk == "10") then
                sheet.pokeCmbtStgAtkVlr = 1.8;
                elseif (sheet.pokeCmbtStgAtk == "11") then
                sheet.pokeCmbtStgAtkVlr = 2;
                elseif (sheet.pokeCmbtStgAtk == "12") then
                sheet.pokeCmbtStgAtkVlr = 2.2;
                end;
            	sheet.pokeAttack = math.floor(((sheet.pokeAttackBase or 1) + (sheet.pokeAttackProg or 0) + (sheet.pokeNatureAtk or 0)) * (sheet.pokeCmbtStgAtkVlr or 1));
            	sheet.pokeDamagePhysical = sheet.pokeAttack;
        end, obj);

    obj._e_event21 = obj.dataLink5:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if (sheet.pokeCmbtStgDef == "0") then
                sheet.pokeCmbtStgDefVlr = 0.4;
                elseif (sheet.pokeCmbtStgDef == "1") then
                sheet.pokeCmbtStgDefVlr = 0.5;
                elseif (sheet.pokeCmbtStgDef == "2") then
                sheet.pokeCmbtStgDefVlr = 0.6;
                elseif (sheet.pokeCmbtStgDef == "3") then
                sheet.pokeCmbtStgDefVlr = 0.7;
                elseif (sheet.pokeCmbtStgDef == "4") then
                sheet.pokeCmbtStgDefVlr = 0.8;
                elseif (sheet.pokeCmbtStgDef == "5") then
                sheet.pokeCmbtStgDefVlr = 0.9;
                elseif (sheet.pokeCmbtStgDef == "6") then
                sheet.pokeCmbtStgDefVlr = 1;
                elseif (sheet.pokeCmbtStgDef == "7") then
                sheet.pokeCmbtStgDefVlr = 1.2;
                elseif (sheet.pokeCmbtStgDef == "8") then
                sheet.pokeCmbtStgDefVlr = 1.4;
                elseif (sheet.pokeCmbtStgDef == "9") then
                sheet.pokeCmbtStgDefVlr = 1.6;
                elseif (sheet.pokeCmbtStgDef == "10") then
                sheet.pokeCmbtStgDefVlr = 1.8;
                elseif (sheet.pokeCmbtStgDef == "11") then
                sheet.pokeCmbtStgDefVlr = 2;
                elseif (sheet.pokeCmbtStgDef == "12") then
                sheet.pokeCmbtStgDefVlr = 2.2;
                end;
            	sheet.pokeDefense = math.floor(((sheet.pokeDefenseBase or 1) + (sheet.pokeDefenseProg or 0) + (sheet.pokeNatureDef or 0)) * (sheet.pokeCmbtStgDefVlr or 1));
                sheet.pokeEvasionPhysic = math.floor((sheet.pokeDefense * (sheet.pokeCmbtStgDefVlr or 1))/5);
        end, obj);

    obj._e_event22 = obj.dataLink6:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if (sheet.pokeCmbtStgSpAtk == "0") then
                sheet.pokeCmbtStgSpAtkVlr = 0.4;
                elseif (sheet.pokeCmbtStgSpAtk == "1") then
                sheet.pokeCmbtStgSpAtkVlr = 0.5;
                elseif (sheet.pokeCmbtStgSpAtk == "2") then
                sheet.pokeCmbtStgSpAtkVlr = 0.6;
                elseif (sheet.pokeCmbtStgSpAtk == "3") then
                sheet.pokeCmbtStgSpAtkVlr = 0.7;
                elseif (sheet.pokeCmbtStgSpAtk == "4") then
                sheet.pokeCmbtStgSpAtkVlr = 0.8;
                elseif (sheet.pokeCmbtStgSpAtk == "5") then
                sheet.pokeCmbtStgSpAtkVlr = 0.9;
                elseif (sheet.pokeCmbtStgSpAtk == "6") then
                sheet.pokeCmbtStgSpAtkVlr = 1;
                elseif (sheet.pokeCmbtStgSpAtk == "7") then
                sheet.pokeCmbtStgSpAtkVlr = 1.2;
                elseif (sheet.pokeCmbtStgSpAtk == "8") then
                sheet.pokeCmbtStgSpAtkVlr = 1.4;
                elseif (sheet.pokeCmbtStgSpAtk == "9") then
                sheet.pokeCmbtStgSpAtkVlr = 1.6;
                elseif (sheet.pokeCmbtStgSpAtk == "10") then
                sheet.pokeCmbtStgSpAtkVlr = 1.8;
                elseif (sheet.pokeCmbtStgSpAtk == "11") then
                sheet.pokeCmbtStgSpAtkVlr = 2;
                elseif (sheet.pokeCmbtStgSpAtk == "12") then
                sheet.pokeCmbtStgSpAtkVlr = 2.2;
                end;
            	sheet.pokeSpAttack = math.floor(((sheet.pokeSpAttackBase or 1) + (sheet.pokeSpAttackProg or 0) + (sheet.pokeNatureSpAtk or 0)) * (sheet.pokeCmbtStgSpAtkVlr or 1));
            	sheet.pokeDamageSpecial = sheet.pokeSpAttack;
        end, obj);

    obj._e_event23 = obj.dataLink7:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if (sheet.pokeCmbtStgSpDef == "0") then
                sheet.pokeCmbtStgSpDefVlr = 0.4;
                elseif (sheet.pokeCmbtStgSpDef == "1") then
                sheet.pokeCmbtStgSpDefVlr = 0.5;
                elseif (sheet.pokeCmbtStgSpDef == "2") then
                sheet.pokeCmbtStgSpDefVlr = 0.6;
                elseif (sheet.pokeCmbtStgSpDef == "3") then
                sheet.pokeCmbtStgSpDefVlr = 0.7;
                elseif (sheet.pokeCmbtStgSpDef == "4") then
                sheet.pokeCmbtStgSpDefVlr = 0.8;
                elseif (sheet.pokeCmbtStgSpDef == "5") then
                sheet.pokeCmbtStgSpDefVlr = 0.9;
                elseif (sheet.pokeCmbtStgSpDef == "6") then
                sheet.pokeCmbtStgSpDefVlr = 1;
                elseif (sheet.pokeCmbtStgSpDef == "7") then
                sheet.pokeCmbtStgSpDefVlr = 1.2;
                elseif (sheet.pokeCmbtStgSpDef == "8") then
                sheet.pokeCmbtStgSpDefVlr = 1.4;
                elseif (sheet.pokeCmbtStgSpDef == "9") then
                sheet.pokeCmbtStgSpDefVlr = 1.6;
                elseif (sheet.pokeCmbtStgSpDef == "10") then
                sheet.pokeCmbtStgSpDefVlr = 1.8;
                elseif (sheet.pokeCmbtStgSpDef == "11") then
                sheet.pokeCmbtStgSpDefVlr = 2;
                elseif (sheet.pokeCmbtStgSpDef == "12") then
                sheet.pokeCmbtStgSpDefVlr = 2.2;
                end;
            	sheet.pokeSpDefense = math.floor(((sheet.pokeSpDefenseBase or 1) + (sheet.pokeSpDefenseProg or 0) + (sheet.pokeNatureSpDef or 0)) * (sheet.pokeCmbtStgSpDefVlr or 1));
                sheet.pokeEvasionSpecial = math.floor((sheet.pokeSpDefense * (sheet.pokeCmbtStgSpDefVlr or 1))/5);
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event23);
        __o_rrpgObjs.removeEventListenerById(self._e_event22);
        __o_rrpgObjs.removeEventListenerById(self._e_event21);
        __o_rrpgObjs.removeEventListenerById(self._e_event20);
        __o_rrpgObjs.removeEventListenerById(self._e_event19);
        __o_rrpgObjs.removeEventListenerById(self._e_event18);
        __o_rrpgObjs.removeEventListenerById(self._e_event17);
        __o_rrpgObjs.removeEventListenerById(self._e_event16);
        __o_rrpgObjs.removeEventListenerById(self._e_event15);
        __o_rrpgObjs.removeEventListenerById(self._e_event14);
        __o_rrpgObjs.removeEventListenerById(self._e_event13);
        __o_rrpgObjs.removeEventListenerById(self._e_event12);
        __o_rrpgObjs.removeEventListenerById(self._e_event11);
        __o_rrpgObjs.removeEventListenerById(self._e_event10);
        __o_rrpgObjs.removeEventListenerById(self._e_event9);
        __o_rrpgObjs.removeEventListenerById(self._e_event8);
        __o_rrpgObjs.removeEventListenerById(self._e_event7);
        __o_rrpgObjs.removeEventListenerById(self._e_event6);
        __o_rrpgObjs.removeEventListenerById(self._e_event5);
        __o_rrpgObjs.removeEventListenerById(self._e_event4);
        __o_rrpgObjs.removeEventListenerById(self._e_event3);
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

        if self.rectangle64 ~= nil then self.rectangle64:destroy(); self.rectangle64 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.layout83 ~= nil then self.layout83:destroy(); self.layout83 = nil; end;
        if self.label119 ~= nil then self.label119:destroy(); self.label119 = nil; end;
        if self.rclTutor ~= nil then self.rclTutor:destroy(); self.rclTutor = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.rectangle67 ~= nil then self.rectangle67:destroy(); self.rectangle67 = nil; end;
        if self.layout64 ~= nil then self.layout64:destroy(); self.layout64 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.label77 ~= nil then self.label77:destroy(); self.label77 = nil; end;
        if self.label97 ~= nil then self.label97:destroy(); self.label97 = nil; end;
        if self.rectangle35 ~= nil then self.rectangle35:destroy(); self.rectangle35 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.label128 ~= nil then self.label128:destroy(); self.label128 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.xpPopUp ~= nil then self.xpPopUp:destroy(); self.xpPopUp = nil; end;
        if self.label92 ~= nil then self.label92:destroy(); self.label92 = nil; end;
        if self.rectangle46 ~= nil then self.rectangle46:destroy(); self.rectangle46 = nil; end;
        if self.label96 ~= nil then self.label96:destroy(); self.label96 = nil; end;
        if self.flowLayout1 ~= nil then self.flowLayout1:destroy(); self.flowLayout1 = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.flowPart1 ~= nil then self.flowPart1:destroy(); self.flowPart1 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.rectangle47 ~= nil then self.rectangle47:destroy(); self.rectangle47 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.label122 ~= nil then self.label122:destroy(); self.label122 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.rectangle59 ~= nil then self.rectangle59:destroy(); self.rectangle59 = nil; end;
        if self.spAtkPopUp ~= nil then self.spAtkPopUp:destroy(); self.spAtkPopUp = nil; end;
        if self.layout62 ~= nil then self.layout62:destroy(); self.layout62 = nil; end;
        if self.layout89 ~= nil then self.layout89:destroy(); self.layout89 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label125 ~= nil then self.label125:destroy(); self.label125 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.layout88 ~= nil then self.layout88:destroy(); self.layout88 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.layout71 ~= nil then self.layout71:destroy(); self.layout71 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.label99 ~= nil then self.label99:destroy(); self.label99 = nil; end;
        if self.label107 ~= nil then self.label107:destroy(); self.label107 = nil; end;
        if self.spDefPopUp ~= nil then self.spDefPopUp:destroy(); self.spDefPopUp = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.comboBox10 ~= nil then self.comboBox10:destroy(); self.comboBox10 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.label82 ~= nil then self.label82:destroy(); self.label82 = nil; end;
        if self.rectangle33 ~= nil then self.rectangle33:destroy(); self.rectangle33 = nil; end;
        if self.rectangle51 ~= nil then self.rectangle51:destroy(); self.rectangle51 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.layout52 ~= nil then self.layout52:destroy(); self.layout52 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.pokemonPopUp ~= nil then self.pokemonPopUp:destroy(); self.pokemonPopUp = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.label76 ~= nil then self.label76:destroy(); self.label76 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.rectangle55 ~= nil then self.rectangle55:destroy(); self.rectangle55 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.layout61 ~= nil then self.layout61:destroy(); self.layout61 = nil; end;
        if self.label109 ~= nil then self.label109:destroy(); self.label109 = nil; end;
        if self.label106 ~= nil then self.label106:destroy(); self.label106 = nil; end;
        if self.label103 ~= nil then self.label103:destroy(); self.label103 = nil; end;
        if self.rectangle68 ~= nil then self.rectangle68:destroy(); self.rectangle68 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.rectangle48 ~= nil then self.rectangle48:destroy(); self.rectangle48 = nil; end;
        if self.label94 ~= nil then self.label94:destroy(); self.label94 = nil; end;
        if self.layout55 ~= nil then self.layout55:destroy(); self.layout55 = nil; end;
        if self.rectangle80 ~= nil then self.rectangle80:destroy(); self.rectangle80 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.speciesPopUp ~= nil then self.speciesPopUp:destroy(); self.speciesPopUp = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle23 ~= nil then self.rectangle23:destroy(); self.rectangle23 = nil; end;
        if self.layout78 ~= nil then self.layout78:destroy(); self.layout78 = nil; end;
        if self.label111 ~= nil then self.label111:destroy(); self.label111 = nil; end;
        if self.label91 ~= nil then self.label91:destroy(); self.label91 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.flowPart6 ~= nil then self.flowPart6:destroy(); self.flowPart6 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.rectangle61 ~= nil then self.rectangle61:destroy(); self.rectangle61 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.rectangle52 ~= nil then self.rectangle52:destroy(); self.rectangle52 = nil; end;
        if self.label116 ~= nil then self.label116:destroy(); self.label116 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.rectangle50 ~= nil then self.rectangle50:destroy(); self.rectangle50 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.rectangle58 ~= nil then self.rectangle58:destroy(); self.rectangle58 = nil; end;
        if self.secondSection ~= nil then self.secondSection:destroy(); self.secondSection = nil; end;
        if self.rectangle94 ~= nil then self.rectangle94:destroy(); self.rectangle94 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.rectangle88 ~= nil then self.rectangle88:destroy(); self.rectangle88 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.label89 ~= nil then self.label89:destroy(); self.label89 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.rectangle82 ~= nil then self.rectangle82:destroy(); self.rectangle82 = nil; end;
        if self.rectangle77 ~= nil then self.rectangle77:destroy(); self.rectangle77 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.rectangle42 ~= nil then self.rectangle42:destroy(); self.rectangle42 = nil; end;
        if self.label115 ~= nil then self.label115:destroy(); self.label115 = nil; end;
        if self.scrollBox5 ~= nil then self.scrollBox5:destroy(); self.scrollBox5 = nil; end;
        if self.layout51 ~= nil then self.layout51:destroy(); self.layout51 = nil; end;
        if self.spdPopUp ~= nil then self.spdPopUp:destroy(); self.spdPopUp = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.label127 ~= nil then self.label127:destroy(); self.label127 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.rectangle76 ~= nil then self.rectangle76:destroy(); self.rectangle76 = nil; end;
        if self.layout69 ~= nil then self.layout69:destroy(); self.layout69 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.defPopUp ~= nil then self.defPopUp:destroy(); self.defPopUp = nil; end;
        if self.textEditor9 ~= nil then self.textEditor9:destroy(); self.textEditor9 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.layout59 ~= nil then self.layout59:destroy(); self.layout59 = nil; end;
        if self.layout60 ~= nil then self.layout60:destroy(); self.layout60 = nil; end;
        if self.layout72 ~= nil then self.layout72:destroy(); self.layout72 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.rectangle66 ~= nil then self.rectangle66:destroy(); self.rectangle66 = nil; end;
        if self.label90 ~= nil then self.label90:destroy(); self.label90 = nil; end;
        if self.comboBox6 ~= nil then self.comboBox6:destroy(); self.comboBox6 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.layout90 ~= nil then self.layout90:destroy(); self.layout90 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.label93 ~= nil then self.label93:destroy(); self.label93 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.rectangle38 ~= nil then self.rectangle38:destroy(); self.rectangle38 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.label129 ~= nil then self.label129:destroy(); self.label129 = nil; end;
        if self.bodyLayout ~= nil then self.bodyLayout:destroy(); self.bodyLayout = nil; end;
        if self.button13 ~= nil then self.button13:destroy(); self.button13 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.rectangle45 ~= nil then self.rectangle45:destroy(); self.rectangle45 = nil; end;
        if self.rectangle97 ~= nil then self.rectangle97:destroy(); self.rectangle97 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.flowPart4 ~= nil then self.flowPart4:destroy(); self.flowPart4 = nil; end;
        if self.label86 ~= nil then self.label86:destroy(); self.label86 = nil; end;
        if self.topLayout ~= nil then self.topLayout:destroy(); self.topLayout = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.comboBox7 ~= nil then self.comboBox7:destroy(); self.comboBox7 = nil; end;
        if self.rectangle53 ~= nil then self.rectangle53:destroy(); self.rectangle53 = nil; end;
        if self.label133 ~= nil then self.label133:destroy(); self.label133 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.layout76 ~= nil then self.layout76:destroy(); self.layout76 = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.rectangle62 ~= nil then self.rectangle62:destroy(); self.rectangle62 = nil; end;
        if self.label102 ~= nil then self.label102:destroy(); self.label102 = nil; end;
        if self.flowLayout4 ~= nil then self.flowLayout4:destroy(); self.flowLayout4 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.label132 ~= nil then self.label132:destroy(); self.label132 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.hpPopUp ~= nil then self.hpPopUp:destroy(); self.hpPopUp = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.layout70 ~= nil then self.layout70:destroy(); self.layout70 = nil; end;
        if self.flowLayout2 ~= nil then self.flowLayout2:destroy(); self.flowLayout2 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.textEditor10 ~= nil then self.textEditor10:destroy(); self.textEditor10 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.rectangle30 ~= nil then self.rectangle30:destroy(); self.rectangle30 = nil; end;
        if self.layout67 ~= nil then self.layout67:destroy(); self.layout67 = nil; end;
        if self.rectangle78 ~= nil then self.rectangle78:destroy(); self.rectangle78 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.flowPart3 ~= nil then self.flowPart3:destroy(); self.flowPart3 = nil; end;
        if self.rectangle63 ~= nil then self.rectangle63:destroy(); self.rectangle63 = nil; end;
        if self.label79 ~= nil then self.label79:destroy(); self.label79 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.rectangle40 ~= nil then self.rectangle40:destroy(); self.rectangle40 = nil; end;
        if self.rectangle74 ~= nil then self.rectangle74:destroy(); self.rectangle74 = nil; end;
        if self.rectangle36 ~= nil then self.rectangle36:destroy(); self.rectangle36 = nil; end;
        if self.label108 ~= nil then self.label108:destroy(); self.label108 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.scrollBox4 ~= nil then self.scrollBox4:destroy(); self.scrollBox4 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.layout48 ~= nil then self.layout48:destroy(); self.layout48 = nil; end;
        if self.layout73 ~= nil then self.layout73:destroy(); self.layout73 = nil; end;
        if self.label124 ~= nil then self.label124:destroy(); self.label124 = nil; end;
        if self.label84 ~= nil then self.label84:destroy(); self.label84 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.layout75 ~= nil then self.layout75:destroy(); self.layout75 = nil; end;
        if self.rectangle34 ~= nil then self.rectangle34:destroy(); self.rectangle34 = nil; end;
        if self.label110 ~= nil then self.label110:destroy(); self.label110 = nil; end;
        if self.rectangle37 ~= nil then self.rectangle37:destroy(); self.rectangle37 = nil; end;
        if self.layout58 ~= nil then self.layout58:destroy(); self.layout58 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.rectangle91 ~= nil then self.rectangle91:destroy(); self.rectangle91 = nil; end;
        if self.layout63 ~= nil then self.layout63:destroy(); self.layout63 = nil; end;
        if self.rectangle93 ~= nil then self.rectangle93:destroy(); self.rectangle93 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.rectangle85 ~= nil then self.rectangle85:destroy(); self.rectangle85 = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.flowLayout5 ~= nil then self.flowLayout5:destroy(); self.flowLayout5 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.layout68 ~= nil then self.layout68:destroy(); self.layout68 = nil; end;
        if self.rectangle75 ~= nil then self.rectangle75:destroy(); self.rectangle75 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.comboBox3 ~= nil then self.comboBox3:destroy(); self.comboBox3 = nil; end;
        if self.rectangle57 ~= nil then self.rectangle57:destroy(); self.rectangle57 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.label69 ~= nil then self.label69:destroy(); self.label69 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.rectangle83 ~= nil then self.rectangle83:destroy(); self.rectangle83 = nil; end;
        if self.label105 ~= nil then self.label105:destroy(); self.label105 = nil; end;
        if self.tab8 ~= nil then self.tab8:destroy(); self.tab8 = nil; end;
        if self.rectangle70 ~= nil then self.rectangle70:destroy(); self.rectangle70 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.layout54 ~= nil then self.layout54:destroy(); self.layout54 = nil; end;
        if self.label126 ~= nil then self.label126:destroy(); self.label126 = nil; end;
        if self.layout50 ~= nil then self.layout50:destroy(); self.layout50 = nil; end;
        if self.firstSection ~= nil then self.firstSection:destroy(); self.firstSection = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.label72 ~= nil then self.label72:destroy(); self.label72 = nil; end;
        if self.label88 ~= nil then self.label88:destroy(); self.label88 = nil; end;
        if self.rectangle87 ~= nil then self.rectangle87:destroy(); self.rectangle87 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.tab5 ~= nil then self.tab5:destroy(); self.tab5 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.textEditor5 ~= nil then self.textEditor5:destroy(); self.textEditor5 = nil; end;
        if self.rectangle28 ~= nil then self.rectangle28:destroy(); self.rectangle28 = nil; end;
        if self.rectangle89 ~= nil then self.rectangle89:destroy(); self.rectangle89 = nil; end;
        if self.label131 ~= nil then self.label131:destroy(); self.label131 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.textEditor7 ~= nil then self.textEditor7:destroy(); self.textEditor7 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.rectangle26 ~= nil then self.rectangle26:destroy(); self.rectangle26 = nil; end;
        if self.rclMoves ~= nil then self.rclMoves:destroy(); self.rclMoves = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.label101 ~= nil then self.label101:destroy(); self.label101 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.rectangle65 ~= nil then self.rectangle65:destroy(); self.rectangle65 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.label114 ~= nil then self.label114:destroy(); self.label114 = nil; end;
        if self.flowPart5 ~= nil then self.flowPart5:destroy(); self.flowPart5 = nil; end;
        if self.rectangle44 ~= nil then self.rectangle44:destroy(); self.rectangle44 = nil; end;
        if self.label135 ~= nil then self.label135:destroy(); self.label135 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.tab7 ~= nil then self.tab7:destroy(); self.tab7 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.tab9 ~= nil then self.tab9:destroy(); self.tab9 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.rectangle81 ~= nil then self.rectangle81:destroy(); self.rectangle81 = nil; end;
        if self.label120 ~= nil then self.label120:destroy(); self.label120 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.textEditor6 ~= nil then self.textEditor6:destroy(); self.textEditor6 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.label130 ~= nil then self.label130:destroy(); self.label130 = nil; end;
        if self.layout49 ~= nil then self.layout49:destroy(); self.layout49 = nil; end;
        if self.rectangle90 ~= nil then self.rectangle90:destroy(); self.rectangle90 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.rclSkills ~= nil then self.rclSkills:destroy(); self.rclSkills = nil; end;
        if self.scrollBox3 ~= nil then self.scrollBox3:destroy(); self.scrollBox3 = nil; end;
        if self.rectangle92 ~= nil then self.rectangle92:destroy(); self.rectangle92 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.rectangle96 ~= nil then self.rectangle96:destroy(); self.rectangle96 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.rectangle60 ~= nil then self.rectangle60:destroy(); self.rectangle60 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.textEditor8 ~= nil then self.textEditor8:destroy(); self.textEditor8 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.rectangle32 ~= nil then self.rectangle32:destroy(); self.rectangle32 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.label117 ~= nil then self.label117:destroy(); self.label117 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.rectangle71 ~= nil then self.rectangle71:destroy(); self.rectangle71 = nil; end;
        if self.layout79 ~= nil then self.layout79:destroy(); self.layout79 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.atkPopUp ~= nil then self.atkPopUp:destroy(); self.atkPopUp = nil; end;
        if self.rectangle86 ~= nil then self.rectangle86:destroy(); self.rectangle86 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.tab6 ~= nil then self.tab6:destroy(); self.tab6 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.label95 ~= nil then self.label95:destroy(); self.label95 = nil; end;
        if self.label123 ~= nil then self.label123:destroy(); self.label123 = nil; end;
        if self.rectangle56 ~= nil then self.rectangle56:destroy(); self.rectangle56 = nil; end;
        if self.label83 ~= nil then self.label83:destroy(); self.label83 = nil; end;
        if self.loyaltyBtn ~= nil then self.loyaltyBtn:destroy(); self.loyaltyBtn = nil; end;
        if self.label98 ~= nil then self.label98:destroy(); self.label98 = nil; end;
        if self.flowLayout3 ~= nil then self.flowLayout3:destroy(); self.flowLayout3 = nil; end;
        if self.label113 ~= nil then self.label113:destroy(); self.label113 = nil; end;
        if self.layout80 ~= nil then self.layout80:destroy(); self.layout80 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.layout57 ~= nil then self.layout57:destroy(); self.layout57 = nil; end;
        if self.layout82 ~= nil then self.layout82:destroy(); self.layout82 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.rectangle21 ~= nil then self.rectangle21:destroy(); self.rectangle21 = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.rectangle79 ~= nil then self.rectangle79:destroy(); self.rectangle79 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.layout65 ~= nil then self.layout65:destroy(); self.layout65 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.thirdSection ~= nil then self.thirdSection:destroy(); self.thirdSection = nil; end;
        if self.comboBox4 ~= nil then self.comboBox4:destroy(); self.comboBox4 = nil; end;
        if self.label112 ~= nil then self.label112:destroy(); self.label112 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.flowPart2 ~= nil then self.flowPart2:destroy(); self.flowPart2 = nil; end;
        if self.label121 ~= nil then self.label121:destroy(); self.label121 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.rectangle22 ~= nil then self.rectangle22:destroy(); self.rectangle22 = nil; end;
        if self.rectangle29 ~= nil then self.rectangle29:destroy(); self.rectangle29 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.layout81 ~= nil then self.layout81:destroy(); self.layout81 = nil; end;
        if self.imageSection ~= nil then self.imageSection:destroy(); self.imageSection = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.layout77 ~= nil then self.layout77:destroy(); self.layout77 = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.layout56 ~= nil then self.layout56:destroy(); self.layout56 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.layout66 ~= nil then self.layout66:destroy(); self.layout66 = nil; end;
        if self.rectangle54 ~= nil then self.rectangle54:destroy(); self.rectangle54 = nil; end;
        if self.rectangle25 ~= nil then self.rectangle25:destroy(); self.rectangle25 = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.rectangle43 ~= nil then self.rectangle43:destroy(); self.rectangle43 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.layout74 ~= nil then self.layout74:destroy(); self.layout74 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.tab4 ~= nil then self.tab4:destroy(); self.tab4 = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
        if self.comboBox5 ~= nil then self.comboBox5:destroy(); self.comboBox5 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.label118 ~= nil then self.label118:destroy(); self.label118 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.loyaltyPopUp ~= nil then self.loyaltyPopUp:destroy(); self.loyaltyPopUp = nil; end;
        if self.label100 ~= nil then self.label100:destroy(); self.label100 = nil; end;
        if self.layout53 ~= nil then self.layout53:destroy(); self.layout53 = nil; end;
        if self.rectangle49 ~= nil then self.rectangle49:destroy(); self.rectangle49 = nil; end;
        if self.rectangle69 ~= nil then self.rectangle69:destroy(); self.rectangle69 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.rclAbilities ~= nil then self.rclAbilities:destroy(); self.rclAbilities = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.rectangle27 ~= nil then self.rectangle27:destroy(); self.rectangle27 = nil; end;
        if self.rectangle73 ~= nil then self.rectangle73:destroy(); self.rectangle73 = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.comboBox9 ~= nil then self.comboBox9:destroy(); self.comboBox9 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.comboBox8 ~= nil then self.comboBox8:destroy(); self.comboBox8 = nil; end;
        if self.rectangle95 ~= nil then self.rectangle95:destroy(); self.rectangle95 = nil; end;
        if self.label85 ~= nil then self.label85:destroy(); self.label85 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.rectangle31 ~= nil then self.rectangle31:destroy(); self.rectangle31 = nil; end;
        if self.layout84 ~= nil then self.layout84:destroy(); self.layout84 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.layout87 ~= nil then self.layout87:destroy(); self.layout87 = nil; end;
        if self.label87 ~= nil then self.label87:destroy(); self.label87 = nil; end;
        if self.label104 ~= nil then self.label104:destroy(); self.label104 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.rectangle84 ~= nil then self.rectangle84:destroy(); self.rectangle84 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.rectangle72 ~= nil then self.rectangle72:destroy(); self.rectangle72 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.progressBar1 ~= nil then self.progressBar1:destroy(); self.progressBar1 = nil; end;
        if self.rectangle39 ~= nil then self.rectangle39:destroy(); self.rectangle39 = nil; end;
        if self.rectangle41 ~= nil then self.rectangle41:destroy(); self.rectangle41 = nil; end;
        if self.button14 ~= nil then self.button14:destroy(); self.button14 = nil; end;
        if self.layout86 ~= nil then self.layout86:destroy(); self.layout86 = nil; end;
        if self.layout85 ~= nil then self.layout85:destroy(); self.layout85 = nil; end;
        if self.label134 ~= nil then self.label134:destroy(); self.label134 = nil; end;
        if self.rectangle24 ~= nil then self.rectangle24:destroy(); self.rectangle24 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmPtuPoke = {
    newEditor = newfrmPtuPoke, 
    new = newfrmPtuPoke, 
    name = "frmPtuPoke", 
    dataType = "br.com.shakerskj.ptu_pkm", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "PTU Pokemon Sheet", 
    description=""};

frmPtuPoke = _frmPtuPoke;
rrpg.registrarForm(_frmPtuPoke);
rrpg.registrarDataType(_frmPtuPoke);

return _frmPtuPoke;
