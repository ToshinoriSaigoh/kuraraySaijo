package 
{

import mx.resources.ResourceBundle;

[ExcludeClass]

public class ja_JP$core_properties extends ResourceBundle
{

    public function ja_JP$core_properties()
    {
		 super("ja_JP", "core");
    }

    override protected function getContent():Object
    {
        var content:Object =
        {
            "multipleChildSets_ClassAndInstance": "このコンポーネント (コンポーネント定義とコンポーネントインスタンス) に対して、可視の子のセットが複数指定されています。",
            "truncationIndicator": "...",
            "notExecuting": "Repeater は実行されていません。",
            "remoteClassMemoryLeak": "警告 : クラス {0} は、{2} の net.registerClassAlias() への呼び出しで使用されています。この結果、{1} でメモリリークが発生します。メモリリークを回避するには、トップレベルのアプリケーションで {0} を定義します。   ",
            "nullParameter": "パラメーター {0} には null 以外の値を指定する必要があります。",
            "versionAlreadyRead": "互換性のあるバージョンが既に読み込まれています。",
            "multipleChildSets_ClassAndSubclass": "このコンポーネント (基本の core.properties) に対して、可視の子のセットが複数指定されています。",
            "fontIncompatible": "警告 : 互換性のない埋め込みフォント \"{0}\" が {1} で指定されています。このコンポーネントでは、embedAsCff={2} を使用して埋め込みフォントを宣言する必要があります。",
            "badParameter": "パラメーター {0} は指定可能な値のいずれかである必要があります。",
            "notImplementedInFTETextField": "FTETextField で \"{0}\" が実装されていません。",
            "viewSource": "ソースの表示",
            "unsupportedTypeInFTETextField": "FTETextField で、タイプを \"input\" に設定することはできません。",
            "badFile": "ファイルが存在しません。",
            "stateUndefined": "未定義のステート '{0}'",
            "badIndex": "指定したインデックスは範囲外です。",
            "versionAlreadySet": "互換性のあるバージョンが既に設定されています。"
        };
        return content;
    }
}



}
