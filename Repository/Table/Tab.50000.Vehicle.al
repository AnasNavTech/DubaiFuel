Table 50000 Vehicle
{

    DrillDownPageId = "Vehicle List";
    LookupPageId = "Vehicle List";

    fields
    {
        field(1; "No."; Code[20])
        {

            trigger OnValidate()
            begin
                if "No." <> xRec."No." then begin
                    GetInvtSetup;
                    NoSeriesMgt.TestManual(InvtSetup."Vehicle Nos.");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; Name; Text[30])
        {
        }
        field(3; "Registration No."; Code[20])
        {
        }
        field(4; "No. Series"; Code[20])
        {
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "No." = '' then begin
            GetInvtSetup;
            InvtSetup.TestField("Vehicle Nos.");
            NoSeriesMgt.InitSeries(InvtSetup."Vehicle Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        end;
    end;

    var
        HasInvtSetup: Boolean;
        InvtSetup: Record "Inventory Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;

    procedure AssistEdit(): Boolean
    begin
        GetInvtSetup;
        InvtSetup.TestField("Vehicle Nos.");
        if NoSeriesMgt.SelectSeries(InvtSetup."Vehicle Nos.", xRec."No. Series", "No. Series") then begin
            NoSeriesMgt.SetSeries("No.");
            exit(true);
        end;
    end;

    procedure GetInvtSetup()
    begin
        if not HasInvtSetup then begin
            InvtSetup.Get;
            HasInvtSetup := true;
        end;
    end;
}

