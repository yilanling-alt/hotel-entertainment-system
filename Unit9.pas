unit Unit9;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, system.dateutils,
  Vcl.ExtCtrls, Vcl.VirtualImage, Vcl.BaseImageCollection, Vcl.ImageCollection;

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
    
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Formentertainment: TFormentertainment;

implementation

{$R *.dfm}

procedure TFormentertainment.Button1Click(Sender: TObject);
begin
 showmessage('please add to the bill')
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

procedure TFormentertainment.ButtonheatClick(Sender: TObject);
begin
 ProgressBarTemp.Position := 15; // 重置到初始温度 15℃
  Label4.Caption := '15 ℃';
  TimerHeat.Enabled := True; // 开启定时器，锅炉开始烧！
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
    9..11:Colorbox1.selected:=clwebcoral;
    1,2,12:colorbox1.selected:=clWhite;
 end;
 self.color:=colorbox1.selected;
 StatusBar1.SimpleText := 'welcome to hotel entertainment system';
end;





procedure TFormentertainment.RichEdit1Change(Sender: TObject);
begin
 RichEdit1.SelAttributes.Color := clRed;
 RichEdit1.SelAttributes.Style := [fsBold];
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

end.
