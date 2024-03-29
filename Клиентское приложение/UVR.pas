unit UVR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, ComCtrls, jpeg, DBCtrls;

type
  TRAVR = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    Image1: TImage;
    Image2: TImage;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label2: TLabel;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    BitBtn1: TBitBtn;
    DateTimePicker1: TDateTimePicker;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RAVR: TRAVR;

implementation

uses UDM, UMenu, DB;

{$R *.dfm}

procedure TRAVR.BitBtn1Click(Sender: TObject);

begin
 // �_���, ���� ���������� - �������� �� ���� ������.

  if Length(Trim(LabeledEdit2.Text)) = 0 then
   begin
     MessageDlg('�� �� ������� �������������!',mtError,[mbOk],0);
     Exit     //�����
  end;

  if Length(Trim(LabeledEdit2.Text)) = 0 then
   begin
     MessageDlg('�� �� ������� ���������!',mtError,[mbOk],0);
     Exit     //�����
  end;

  if Length(Trim(LabeledEdit3.Text)) = 0 then
   begin
     MessageDlg('�� �� ������� ����� �������!',mtError,[mbOk],0);
     Exit     //�����
  end;

RADM.ADOStoredProcVvod_Reklamac.Parameters.ParamByName('@DataReklam').Value:=DateToStr(DateTimePicker1.Date);
RADM.ADOStoredProcVvod_Reklamac.Parameters.ParamByName('@N_Dog').Value:=RADM.ADOQueryDog.FieldByName('N_Dog').Value;
RADM.ADOStoredProcVvod_Reklamac.Parameters.ParamByName('@Neisprav').Value:=(LabeledEdit1.Text);
RADM.ADOStoredProcVvod_Reklamac.Parameters.ParamByName('@Rezult').Value:=(LabeledEdit2.Text);
RADM.ADOStoredProcVvod_Reklamac.Parameters.ParamByName('@SummaUbit').Value:=StrToInt(LabeledEdit3.Text);
RADM.ADOStoredProcVvod_Reklamac.ExecProc;

ShowMessage('����� ���������� ������� ���������.'); // ���������� ����.

RADM.ADOQueryReklamac.Close;
RADM.ADOQueryReklamac.Open;
 DBGrid1.Columns.Items[0].Title.Caption :='� ������';
  DBGrid1.Columns.Items[1].Title.Caption :='����������';
   DBGrid1.Columns.Items[2].Title.Caption :='� ���';
    DBGrid1.Columns.Items[3].Title.Caption :='�������������';
     DBGrid1.Columns.Items[4].Title.Caption :='���������';
      DBGrid1.Columns.Items[5].Title.Caption :='���������';
end;

procedure TRAVR.BitBtn4Click(Sender: TObject);   // ���������� ���� - �������� ����� ���������.
begin
if MessageDlg('��������� ������ ��������� ?', mtConfirmation,[mbOk, mbCancel], 0) = mrOk then
begin
Close;
Application.Terminate;
end;
end;

procedure TRAVR.BitBtn5Click(Sender: TObject);  // ���������� ���� - ����� �� ���������.
begin
if MessageDlg('��������� � ������� ���� ?', mtConfirmation,[mbOk, mbCancel], 0) = mrOk then
begin
RAVR.Close;
end;
end;

procedure TRAVR.FormActivate(Sender: TObject);
begin
DateTimePicker1.Date:=date();
RADM.ADOQueryReklamac.Active:=True;
RADM.ADOQueryReklamac.Open;
RADM.ADOQueryDog.Open;
 DBGrid1.Columns.Items[0].Title.Caption :='� ������';
  DBGrid1.Columns.Items[1].Title.Caption :='����������';
   DBGrid1.Columns.Items[2].Title.Caption :='� ���';
    DBGrid1.Columns.Items[3].Title.Caption :='�������������';
     DBGrid1.Columns.Items[4].Title.Caption :='���������';
      DBGrid1.Columns.Items[5].Title.Caption :='���������';
end;

end.
