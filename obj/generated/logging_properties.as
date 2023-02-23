package 
{

import mx.resources.ResourceBundle;

[ExcludeClass]

public class ja_JP$logging_properties extends ResourceBundle
{

    public function ja_JP$logging_properties()
    {
		 super("ja_JP", "logging");
    }

    override protected function getContent():Object
    {
        var content:Object =
        {
            "invalidTarget": "無効なターゲットが指定されました。",
            "charsInvalid": "フィルターのエラー '{0}' : 次の文字は有効ではありません : []~$^&/(){}<>+=_-`!@#%?,:;'\".",
            "charPlacement": "フィルターのエラー '{0}' : '*' は右端の文字である必要があります。",
            "levelLimit": "ログレベルは LogEventLevel.ALL に設定できません。",
            "invalidChars": "カテゴリには次の文字は使用できません : []`~,!@#$%*^&()]{}+=|';?><./\".",
            "invalidLen": "カテゴリは長さが最低 1 文字である必要があります。"
        };
        return content;
    }
}



}
