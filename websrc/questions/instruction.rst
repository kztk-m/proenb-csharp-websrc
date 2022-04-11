============
課題の進め方
============

---------------------------------
プロジェクト/ソリューションの作成
---------------------------------



.. role:: raw-html(raw)
   :format: html

Visual Studio場合はの「新しいプロジェクトの作成」（Windows）や「新規」/「New」（Mac）から，C#の「コンソール アプリケーション」テンプレートを
選び，プロジェクト名とソリューション名を
 
.. raw:: html 

   <pre><span class="metaname">学籍番号</span>_Q<span class="metaname">出題回</span></pre>

とする．たとえば，Z0TB9999さんの第3回課題の提出であれば，プロジェクト名とソリューション名はともに``Z0TB9999_Q3``とする．

コマンドラインで行う場合は

.. raw:: html 

   <pre>dotnet new console -o <span class="metaname">学籍番号</span>_Q<span class="metaname">出題回</span></pre>

を実行し :raw-html:`<code><span class="metaname">学籍番号</span>_Q<span class="metaname">出題回</span></code>` プロジェクトを作成する．たとえば，Z0TB9999さんの第3回課題の提出であれば，``dotnet new console -o Z0TB9999_Q3``とする．
この場合はソリューションは作成されないがそれで問題はない．

----------
課題の実施
----------

.cs ファイルを問題文の指示の通りに作成する．提出する .csファイルには先頭部分に **学籍番号と名前をコメントとして含める** こと．なので，たとえば学籍番号Z0TB9999の仙台 青葉さんの提出ファイルは

.. code:: cs

   // Z0TB9999
   // 仙台 青葉

という行から始まる． 

----
提出
----

Visual Studioでプロジェクト/ソリューションを作成した場合は以下のような構造になっているので，「クリーン」を実施した後に一番外側のフォルダ（ソリューション名のフォルダ）をzipで圧縮して提出する．

.. raw:: html 

    <pre style="line-height: 1.3"><span class="metaname">学籍番号</span>_Q<span class="metaname">出題回</span>/
    ├── <span class="metaname">学籍番号</span>_Q<span class="metaname">出題回</span>.sln
    └── <span class="metaname">学籍番号</span>_Q<span class="metaname">出題回</span>/
        ├── <span class="metaname">学籍番号</span>_Q<span class="metaname">出題回</span>.csproj
        ├── Program.cs 
        └── obj </pre>

一方でコマンドラインで作成した場合は

.. raw:: html 

   <pre style="line-height: 1.3"><span class="metaname">学籍番号</span>_Q<span class="metaname">出題回</span>/
   ├── <span class="metaname">学籍番号</span>_Q<span class="metaname">出題回</span>.csproj
   ├── Program.cs 
   └── obj 
   </pre>

となっているので一番外側のフォルダ（プロジェクト名のフォルダ）をzipで圧縮して提出する． 


1. ``obj``フォルダや``bin``フォルダ以下に含まれている中間生成物や実行形式は提出しなくてよい（し，サイズが大きいので含まれていると御互いにアップロードやダウンロードに時間がかかって辛い）ので，提出前にプロジェクトをクリーン（生成物を削除すること）する．

   - Visual Studioを使用している場合はプロジェクト名を右クリックして出てくる *「〜をクリーン」* を実行する

   - コマンドラインの場合は当該フォルダに移動して``dotnet clean``する．

   - あるいは以下の手順を実行する前に ``obj`` と ``bin`` フォルダを消したのでよい．


2. 以下の手順によりプロジェクトが含まれているフォルダを.zipにまとめる．いずれも「プロジェクト名.zip」が手に入る．

   - WindowsでVisual Studioを使用している場合は，ソリューション（〜.sln）が含まれているフォルダ（Visual Studioのスタートアップ画面で *「ローカルフォルダーを開く」* を選ぶと場所がわかる．デフォルトは``%HOMEPATH%\source\repos``）をエクスプローラーで表示し，その下の :raw-html:`<code><span class="metaname">学籍番号</span>_Q<span class="metaname">出題回</span></code>` という名前のフォルダを右クリックして
     *「送る」* から *「圧縮（zip形式）フォルダー」* を選択する．

   - MacでVisual Studioを使用している場合は，ソリューション（〜.sln）が含まれているフォルダ（Visual Studioのデフォルトは``~/Projects/``）をFinder.appで表示し，その下の :raw-html:`<code><span class="metaname">学籍番号</span>_Q<span class="metaname">出題回</span></code>` という名前のフォルダをCtrl + クリック（あるいは二本指クリックか右クリック）して， *「"〜"を圧縮」* を選ぶ．

   - コマンドラインで実行している場合は，プロジェクト名のフォルダに対して同様のことをする．

   - ``git``で解答を管理しているのならば，

     .. raw:: html 
          
        <pre>git archive --prefix=<span class="metaname">学籍番号</span>_Q<span class="metaname">出題回</span>/ <span class="metaname">ブランチ名</span> -o <span class="metaname">学籍番号</span>_Q<span class="metaname">出題回</span>.zip</pre>
 
     などとすればレポジトリの内容を纏めた.zipファイルを作成できる．
  
     * **公開レポジトリに解答を決して置かないように．**

3. 得られた「:raw-html:`<code><span class="metaname">学籍番号</span>_Q<span class="metaname">出題回</span></code>`.zip」をClassroom内の当該回の「課題」より提出する．

   - たとえば，Z0TB9999さんの第3回課題の提出であれば，提出するファイルの名前は``Z0TB9999_Q3.zip``になる．





