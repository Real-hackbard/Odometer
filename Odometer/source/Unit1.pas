unit Unit1;

interface

uses
   Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
   System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
   Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Samples.Spin,
   Odometer;

type
  TForm1 = class(TForm)
    RadioGroupBase: TRadioGroup;
    RadioGroupAni: TRadioGroup;
    RadioGroupDir: TRadioGroup;
    Timer1: TTimer;
    GroupBox1: TGroupBox;
    ScrollBar2: TScrollBar;
    Button1: TButton;
    ButtonInc: TButton;
    ButtonDec: TButton;
    Label2: TLabel;
    GroupBox2: TGroupBox;
    Edit1: TEdit;
    ButtonSet: TButton;
    GroupBox3: TGroupBox;
    ScrollBar1: TScrollBar;
    Label1: TLabel;
    Button2: TButton;
    Bevel1: TBevel;
    Button3: TButton;
    StatusBar1: TStatusBar;
    ssOdometer1: TssOdometer;
    GroupBox4: TGroupBox;
    Label3: TLabel;
    SpinEdit1: TSpinEdit;
    SpinEdit2: TSpinEdit;
    Label4: TLabel;
    Button4: TButton;
    procedure RadioGroupBaseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RadioGroupAniClick(Sender: TObject);
    procedure ButtonIncClick(Sender: TObject);
    procedure ButtonDecClick(Sender: TObject);
    procedure ButtonSetClick(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
    procedure RadioGroupDirClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ScrollBar2Change(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure SpinEdit1Change(Sender: TObject);
    procedure SpinEdit2Change(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Button4Click(Sender: TObject);
  private
  public
  end;
var
  Form1: TForm1;
implementation
{$R *.DFM}
procedure TForm1.RadioGroupBaseClick(Sender: TObject);
begin
  case TRadioGroup(Sender).ItemIndex of
    0: ssOdometer1.BaseType := btBinary;
    1: ssOdometer1.BaseType := btDecimal;
    2: ssOdometer1.BaseType := btHexadecimal;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  RadioGroupBase.ItemIndex := 1;
  RadioGroupAni.ItemIndex := 2;
  RadioGroupDir.ItemIndex := 1;
  ScrollBar1.Position := ssOdometer1.FrameInterval;
end;

procedure TForm1.RadioGroupAniClick(Sender: TObject);
begin
  case TRadioGroup(Sender).ItemIndex of
    0: ssOdometer1.AnimationType := atNone;
    1: ssOdometer1.AnimationType := atSynchronous;
    2: ssOdometer1.AnimationType := atAsynchronous;
  end;
end;

procedure TForm1.ButtonIncClick(Sender: TObject);
begin
  ssOdometer1.Increase;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  StatusBar1.Panels[1].Text := 'up';
  Timer1.Enabled := true;
  ButtonInc.Enabled := false;
  ButtonDec.Enabled := false;
  RadioGroupAni.Enabled := false;
  RadioGroupDir.Enabled := false;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  StatusBar1.Panels[1].Text := 'down';
  Timer1.Enabled := true;
  ButtonInc.Enabled := false;
  ButtonDec.Enabled := false;
  RadioGroupAni.Enabled := false;
  RadioGroupDir.Enabled := false;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Timer1.Enabled := false;
  StatusBar1.Panels[1].Text := 'stop';
  ButtonInc.Enabled := true;
  ButtonDec.Enabled := true;
  RadioGroupAni.Enabled := true;
  RadioGroupDir.Enabled := true;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  ssOdometer1.Value := 0;
end;

procedure TForm1.ButtonDecClick(Sender: TObject);
begin
  ssOdometer1.Decrease;
end;

procedure TForm1.ButtonSetClick(Sender: TObject);
begin
  if Edit1.Text = '' then
  begin
    Beep;
    ShowMessage('Type value in the box!');
    Exit;
  end;

  ssOdometer1.Value := StrToInt(Edit1.Text);
end;

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if NOT (Key in [#08, '0'..'9']) then
    Key := #0;
end;

procedure TForm1.ScrollBar1Change(Sender: TObject);
begin
  ssOdometer1.FrameInterval := TScrollBar(Sender).Position;
end;

procedure TForm1.ScrollBar2Change(Sender: TObject);
begin
  Timer1.Interval := ScrollBar2.Position;
  Label2.Caption := IntToStr(Scrollbar2.Position) + ' ms';
end;

procedure TForm1.SpinEdit1Change(Sender: TObject);
begin
  ssOdometer1.DigitCount := SpinEdit1.Value;
end;

procedure TForm1.SpinEdit2Change(Sender: TObject);
begin
  ssOdometer1.RedDigitCount := SpinEdit2.Value;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  ssOdometer1.IsLightStyleColor(clBlue);



  if StatusBar1.Panels[1].Text = 'up' then
  begin
    ssOdometer1.Increase;
  end;

  if StatusBar1.Panels[1].Text = 'down' then
  begin
    ssOdometer1.Decrease;
  end;
end;

procedure TForm1.RadioGroupDirClick(Sender: TObject);
begin
  case TRadioGroup(Sender).ItemIndex of
    0: ssOdometer1.IncTopToBottom := True;
    1: ssOdometer1.IncTopToBottom := False;
  end;
end;
end.

