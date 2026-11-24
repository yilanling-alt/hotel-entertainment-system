unit Unit9;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, system.JSON, system.IOUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, system.dateutils,
  Vcl.ExtCtrls, Vcl.VirtualImage, Vcl.BaseImageCollection, Vcl.ImageCollection, XPStyleActnCtrls,
  System.ImageList, Vcl.ImgList, Vcl.ToolWin, Vcl.ActnMan, Vcl.ActnCtrls;

type
  TFormentertainment = class(TForm)
    hotel: TPageControl;
    Tabgym: TTabSheet;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    ImageCollection1: TImageCollection;
    VirtualImage1: TVirtualImage;
    Tabrelax: TTabSheet;
    RadioGroup1: TRadioGroup;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    VirtualImage2: TVirtualImage;
    VirtualImage3: TVirtualImage;
    VirtualImage4: TVirtualImage;
    ComboBox1: TComboBox;
    TabBar: TTabSheet;
    ListBox1: TListBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    whiskey: TCheckBox;
    ListBox2: TListBox;
    CheckBox9: TCheckBox;
    Button1: TButton;
    CheckBox10: TCheckBox;
    CheckBox11: TCheckBox;
    CheckBox12: TCheckBox;
    CheckBox13: TCheckBox;
    ListBox3: TListBox;
    CheckBox14: TCheckBox;
    CheckBox15: TCheckBox;
    CheckBox16: TCheckBox;
    CheckBox17: TCheckBox;
    VirtualImage5: TVirtualImage;
    Button2: TButton;
    ColorBox1: TColorBox;
    RichEdit1: TRichEdit;
    ComboBox2: TComboBox;
    TabSheet1: TTabSheet;
    ComboBox3: TComboBox;
    DateTimePicker1: TDateTimePicker;
    ComboBox4: TComboBox;
    RadioGroup2: TRadioGroup;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    CheckBox18: TCheckBox;
    CheckBox19: TCheckBox;
    CheckBox20: TCheckBox;
    CheckBox21: TCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    ListBox4: TListBox;
    Button3: TButton;
    TrackBar1: TTrackBar;
    Label3: TLabel;
    ProgressBartemp: TProgressBar;
    Timerheat: TTimer;
    Label4: TLabel;
    Buttonheat: TButton;
    StatusBar1: TStatusBar;
    TreeView1: TTreeView;
    ToolBar1: TToolBar;
    ImageList1: TImageList;
    ActionToolBar1: TActionToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    Button4: TButton;
    procedure TabgymContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure TabrelaxContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RichEdit1Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure ButtonheatClick(Sender: TObject);
    procedure TimerheatTimer(Sender: TObject);
    procedure CheckBox18Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
    procedure TreeView1CustomDrawItem(Sender: TCustomTreeView; Node: TTreeNode;
      State: TCustomDrawState; var DefaultDraw: Boolean);



  private
    { Private declarations }
    ClickCount: Integer;
    FCurrentRoom:string;
    procedure DiscountClick;
    procedure LoadRoomState(const RoomNo: string);
    procedure SaveRoomState(const RoomNo: string);
  public
    { Public declarations }
  end;

var
  Formentertainment: TFormentertainment;

implementation

{$R *.dfm}

procedure TFormentertainment.Button1Click(Sender: TObject);
begin
 showmessage('please add to the bill');
 Inc(ClickCount);

  if ClickCount >= 10 then
  begin
    // 触发彩蛋！
    ShowMessage(' 警告：客人，您的手速太快了！' + #13#10 +
                '系统已自动为您点了一份“松鼠特供三文鱼刺身配椰奶”，账单+100欧！');



    ClickCount := 0; // 彩蛋触发后，计数器重置，免得一直弹窗
  end;
end;


procedure TFormentertainment.Button2Click(Sender: TObject);
begin
 RichEdit1.Clear;
end;

procedure TFormentertainment.Button3Click(Sender: TObject);
begin

  ListBox4.Items.Add('1. Autumn Leaves - Ed Sheeran');
  ListBox4.Items.Add('2. Sweater Weather - The Neighbourhood');

  ListBox4.Items.Add('3. 枫 - 周杰伦');

end;

procedure TFormentertainment.Button4Click(Sender: TObject);
begin
  discountclick;
end;

procedure  TFormentertainment.DiscountClick;
const
 PRICE_FRUIT=3.50;//水果拼盘
 PRICE_BEER=3.00;//啤酒
 PRICE_POPCORN=2.50;//爆米花
 PRICE_CANDY=2.00;//润喉糖
var
  FinalTotal: Currency;
  Total:currency;
begin
  total:=0;
    if Checkbox18.Checked then Total := Total + PRICE_FRUIT;
  if Checkbox19.Checked then Total := Total + PRICE_BEER;
  if Checkbox20.Checked then Total := Total + PRICE_POPCORN;
  if Checkbox21.Checked then Total := Total + PRICE_CANDY;
  // 前提：你的总价变量 Total 是全局变量，或者先算一遍
  // 假设你已经算出了 Total（没打折前）
  FinalTotal := Total * 0.9;

  // 把结果格式化输出，注意用了 %.2f，保留两位小数
  ShowMessage(Format('原价: $%.2f, 打折后: $%.2f', [Total, FinalTotal]));
end;

procedure TFormentertainment.ButtonheatClick(Sender: TObject);
begin
 ProgressBarTemp.Position := 15; // 重置到初始温度 15℃
  Label4.Caption := '15 ℃';
  TimerHeat.Enabled := True; // 开启定时器，锅炉开始烧！
end;

// 1. 保存当前勾选状态（比如放在 CheckBox 的 OnClick 或“保存”按钮里）
procedure TFormentertainment.SaveRoomState(const RoomNo: string);
var
  JSONObj: TJSONObject;
begin
  JSONObj := TJSONObject.Create;
  try
    // 把界面上的打勾状态打包进 JSON
    JSONObj.AddPair('fruit_platter', TJSONBool.Create(checkbox18.Checked));
    JSONObj.AddPair('beer_package', TJSONBool.Create(checkbox19.Checked));
    JSONObj.AddPair('popcorn', TJSONBool.Create(checkbox20.Checked));
    JSONObj.AddPair('throat_lozenge', TJSONBool.Create(checkbox21.Checked));
    JSONObj.AddPair('sake',TJSONBool.Create(checkbox5.checked));
    JSONObj.AddPair('whiskey',TJSONBool.Create(whiskey.checked));
    JSONObj.AddPair('Guinness',TJSONBool.Create(checkbox6.checked));
    JSONObj.AddPair('red wine',TJSONBool.Create(checkbox7.checked));
    JSONObj.AddPair('white wine',TJSONBool.Create(checkbox8.checked));

    // 按房间号存成独立文件，比如 101.json
    TFile.WriteAllText(RoomNo + '.json', JSONObj.ToString, TEncoding.UTF8);
  finally
    JSONObj.Free;
  end;
end;

// 2. 读取状态恢复界面（工作人员上完厕所回来 / 切换房间时调用）
procedure TFormentertainment.LoadRoomState(const RoomNo: string);
var
  JSONStr: string;
  JSONObj: TJSONObject;
  B: Boolean;
begin
  if not TFile.Exists(RoomNo + '.json') then Exit;

  JSONStr := TFile.ReadAllText(RoomNo + '.json', TEncoding.UTF8);
  JSONObj := TJSONObject.ParseJSONValue(JSONStr) as TJSONObject;
  if Assigned(JSONObj) then
  try
    // 把 JSON 里的 true/false 还原回界面打勾状态
    checkbox18.Checked:= JSONObj.GetValue<Boolean>('fruit_platter', False);
    checkbox19.Checked:= JSONObj.GetValue<Boolean>('beer_package', False);
    checkbox20.Checked:= JSONObj.GetValue<Boolean>('popcorn', False);
    checkbox21.Checked:= JSONObj.GetValue<Boolean>('throat_lozenge', False);
      if JSONObj.TryGetValue<Boolean>('sake', B) then CheckBox5.Checked := B;
      if JSONObj.TryGetValue<Boolean>('whiskey', B) then whiskey.Checked := B;
      if JSONObj.TryGetValue<Boolean>('Guinness', B) then CheckBox6.Checked := B;
      if JSONObj.TryGetValue<Boolean>('red_wine', B) then CheckBox7.Checked := B;
      if JSONObj.TryGetValue<Boolean>('white_wine', B) then CheckBox8.Checked := B;
  finally
    JSONObj.Free;
  end;
end;


procedure TFormentertainment.CheckBox18Click(Sender: TObject);
begin
   SaveRoomState('102');

end;

procedure TFormentertainment.ComboBox2Change(Sender: TObject);
begin
 RichEdit1.SelAttributes.Name := ComboBox1.Text;
end;

procedure TFormentertainment.FormCreate(Sender: TObject);
var
  CurrentMonth:Integer;
  begin
  CurrentMonth:=Monthof(now);
 case CurrentMonth of
    3..5: colorbox1.selected:=clOlive;
    6..8: colorbox1.selected:=clSkyBlue;
    9..11:Colorbox1.selected:=clwebBurlywood;
    1,2,12:colorbox1.selected:=clWhite;
 end;
 self.color:=colorbox1.selected;
 StatusBar1.SimpleText := 'welcome to hotel entertainment system';
 ClickCount := 0;
 FCurrentRoom:='';
 Treeview1.FullExpand;
end;






procedure TFormentertainment.RichEdit1Change(Sender: TObject);
begin
 // 之前测试RichEdit的代码，暂时不用
 //RichEdit1.SelAttributes.Color := clRed;
 //RichEdit1.SelAttributes.Style := [fsBold];
end;

procedure TFormentertainment.TabgymContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
begin
   tabgym.caption:='gym';
end;

procedure TFormentertainment.TabrelaxContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
begin
  tabrelax.caption:='relax area';
  showmessage('those have heat sensitivity or skin condition should consider carefully.');
end;

procedure TFormentertainment.TimerheatTimer(Sender: TObject);
begin
 // 如果当前温度还没到 70℃
  if ProgressBarTemp.Position < ProgressBarTemp.Max then
  begin
    ProgressBarTemp.Position := ProgressBarTemp.Position + 1; // 温度上升1度
    Label4.Caption := IntToStr(ProgressBarTemp.Position) + ' ℃';
  end
  else
  begin
    TimerHeat.Enabled := False; // 到了 70度，自动停止加热
    ShowMessage('叮！桑拿房已达到 ' + IntToStr(ProgressBarTemp.Max) + '℃，请客人入内！');
end;
end;

procedure TFormentertainment.TrackBar1Change(Sender: TObject);
begin
  Label3.Caption := 'Vol: ' + IntToStr(TrackBar1.Position);
end;

procedure TFormentertainment.TreeView1Change(Sender: TObject; Node: TTreeNode);
begin
   // 1. 忽略最顶层的标题节点（比如“KTV 房间列表”，只响应具体的房间子节点）
  if (Node = nil) or (Node.Level = 0) then Exit;

  // 2. 离开上一个房间前，自动把上一个房间的账单存进 JSON
  if FCurrentRoom <> '' then
    SaveRoomState(FCurrentRoom);

  // 3. 记录新点中的房间号（比如 '101' 或 '102'）
  FCurrentRoom := Node.Text;

  // 4. 加载新房间的 JSON 账单（如果该房间还没生成过 JSON，就先把界面复选框全清空）
  if TFile.Exists(TPath.Combine(ExtractFilePath(ParamStr(0)), FCurrentRoom + '.json')) then
    LoadRoomState(FCurrentRoom)
  else
  begin
    // 新房间默认全不勾选（把你界面上的 CheckBox 设为 False）
    CheckBox18.Checked :=False;
    CheckBox19.Checked := False;
    CheckBox20.Checked := False;
    CheckBox21.Checked := False;
end;
end;
procedure TFormentertainment.TreeView1CustomDrawItem(Sender: TCustomTreeView;
  Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
if Node.Selected then
  Sender.Canvas.Brush.color:=clNavy;

end;

end.
