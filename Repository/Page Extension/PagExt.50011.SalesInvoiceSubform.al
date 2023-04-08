PageExtension 50011 "Sales Invoice Subform Ext" extends "Sales Invoice Subform"
{
    Caption = 'Sales Invoice Subform';
    layout
    {
        modify("Unit Cost (LCY)")
        {
            Visible = true;
        }
        modify("Unit Price")
        {
            Visible = "Unit PriceVisible";
        }
        modify("Line Amount")
        {
            Visible = "Line AmountVisible";
        }

    }
    actions
    {

        modify("F&unctions")
        {
            Visible = false;
        }
        modify(GetPrice)
        {
            Visible = false;
        }
        modify(GetLineDiscount)
        {
            Visible = false;
        }
        modify("E&xplode BOM")
        {
            Visible = false;
        }
        modify(InsertExtTexts)
        {
            Visible = false;
        }
        modify(GetShipmentLines)
        {
            Visible = false;
        }
        modify("&Line")
        {
            Visible = false;
        }
        modify("Item Availability by")
        {
            Visible = false;
        }
        modify(Period)
        {
            Visible = false;
        }
        modify(Variant)
        {
            Visible = false;
        }
        modify(Location)
        {
            Visible = false;
        }
        modify(Dimensions)
        {
            Visible = false;
        }
        modify("Co&mments")
        {
            Visible = false;
        }
        modify("Item Charge &Assignment")
        {
            Visible = false;
        }
        modify("Item &Tracking Lines")
        {
            Visible = false;
        }
    }

    var
        UserSetup: Record "User Setup";

    var
        [InDataSet]
        "Unit PriceVisible": Boolean;
        [InDataSet]
        "Line AmountVisible": Boolean;



    trigger OnAfterGetRecord()
    begin

        //GTFS-Biswajit-31st March 2013-St
        IF UserSetup.GET(USERID) THEN BEGIN
            IF UserSetup."Sales Price Visible" THEN BEGIN
                "Unit PriceVisible" := TRUE;
                "Line AmountVisible" := TRUE;
            END
            ELSE BEGIN
                "Unit PriceVisible" := FALSE;
                "Line AmountVisible" := FALSE;
            END
        END;
        //GTFS-Biswajit-31st March 2013-En

    end;




    trigger OnNewRecord(BelowxRec: Boolean)

    begin

        "Line AmountVisible" := TRUE;
        "Unit PriceVisible" := TRUE;

    end;



    trigger OnOpenPage()
    begin

        //GTFS-Biswajit-31st March 2013-St
        IF UserSetup.GET(USERID) THEN BEGIN
            IF UserSetup."Sales Price Visible" THEN BEGIN
                "Unit PriceVisible" := TRUE;
                "Line AmountVisible" := TRUE;
            END
            ELSE BEGIN
                "Unit PriceVisible" := FALSE;
                "Line AmountVisible" := FALSE;
            END
        END;
        //GTFS-Biswajit-31st March 2013-En

    end;
}

