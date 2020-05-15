package model.plugin.report
{
	import controller.App;
	public class Chapter
	{
		public var myDataElement: XML;
		private var _caller: Report;
		public function Chapter(caller: Report)
		{
			_caller = caller;

			myDataElement = caller.myDataElement.elements("chapters")[0];
			if(myDataElement == null)
			{
				myDataElement = <chapters name={_caller.vcName}/>;
				_caller.myDataElement.appendChild(myDataElement);
			}
		}

		public function changeChapter(chapterID: String = null): void
		{
			if(chapterID == null) return;
			_caller.nowTime = int(chapterID);
			PostBox.send("actionMovie", {action: "cue", time: _caller.nowTime});
		}

		//チャプター追加
		public function addChapter(time: String): void
		{
			if(myDataElement.chapter.(attribute("name") == time).length() != 0) return;
			var newChapter: XML = <chapter name={time}/>;
			var chapterList: XMLList = myDataElement.chapter;
			if(chapterList.length() == 0)
			{
				myDataElement.appendChild(newChapter);
			}
			else
			{
				var beforeChapter: XML;
				var i: uint;
				for(i = 0; i < chapterList.length(); i++)
				{
					if(Number(chapterList[i].@name) < Number(time))
					{
						beforeChapter = chapterList[i];
					}
					else//nowTime以降のチャプターを削除する
					{
						delete myDataElement.chapter[i];
					}
				}
				myDataElement.insertChildAfter(beforeChapter, newChapter);
			}
		}

		//チャプター削除
		public function removeChapter(time: String): void
		{
			delete myDataElement.chapter.(attribute("name") == time)[0];
		}

		//指定フレーム番号以降のチャプター削除
		public function deleteChapterAfter(time: String): void
		{
			var chapterList: XMLList = myDataElement.chapter;
			var i: uint;
			for(i = 0; i < chapterList.length(); i++)
			{
				if(Number(chapterList[i].@name) > Number(time))
				{
					removeChapter(chapterList[i].@name);
				}
			}
		}

		//現在のチャプターXML取得
		public function getNowChapter(): XML
		{
			if(myDataElement.children().length() == 0) return new XML();
			var nowChapter: XML = myDataElement.chapter[0];
			var chapterList: XMLList = myDataElement.chapter;
			var i: uint;
			for(i = 0; i < chapterList.length(); i++)
			{
				if(Number(chapterList[i].@name) <= _caller.nowTime)
				{
					nowChapter = chapterList[i];
				}
			}
			return nowChapter;
		}

		//１つ前のチャプターXML取得
		public function getPrevChapter(): XML
		{
			var nowChapter: XML = getNowChapter();
			if(_caller.nowTime > int(nowChapter.@name))
			{
				return nowChapter;
			}
			else if(nowChapter.@name == null || nowChapter.childIndex() == 0)
			{
				return new XML();
			}
			else
			{
				var prevIndex: uint = nowChapter.childIndex() - 1;
				return myDataElement.children()[prevIndex];
			}
		}

		//次のチャプターXML取得
		public function getNextChapter(): XML
		{
			var nowChapter: XML = getNowChapter();
			if(nowChapter.@name == null || nowChapter.childIndex() + 1 >= myDataElement.children().length())
			{
				var lastTime: XML = <chapter name={String(_caller.lastTime)}/>;
				return lastTime;
			}
			else
			{
				var nextIndex: uint = nowChapter.childIndex() + 1;
				return myDataElement.children()[nextIndex];
			}
		}

		//最後のチャプターXML取得
		public function getLastChapter(): XML
		{
			if(myDataElement.children().length() == 0) return new XML();
			return myDataElement.children()[myDataElement.length() - 1];
		}
	}
}
