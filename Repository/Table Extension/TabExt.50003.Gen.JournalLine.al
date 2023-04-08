TableExtension 50003 tabExtgenJournalLine extends "Gen. Journal Line"
{
    LookupPageId = "General Journal Lines";
    DrillDownPageId = "General Journal Lines";

    fields
    {
        field(50005; Narration; Text[250])
        {
            Description = '//GTFSDF-Biswajit-10.05.11';
        }
    }
    keys
    {
        key(Key1001; "Posting Date", "Account No.")
        {
        }
        key(Key1002; "Salespers./Purch. Code", "Account No.")
        {
        }
        key(Key1003; "Journal Template Name", "Journal Batch Name", "Account Type", "Account No.", "Document Type", "Reason Code")
        {
            SumIndexFields = "Credit Amount", "Debit Amount";
        }
    }
}

