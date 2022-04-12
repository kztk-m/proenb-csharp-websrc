============
課題の進め方
============

.. role:: raw-html(raw)
   :format: html

大雑把には，以下の名前のプロジェクト/ソリューションを作って，zipにまとめて提出する．

.. raw:: html 

   <pre><span class="metaname">学籍番号</span>_Q<span class="metaname">出題回</span></pre>

上記の「:raw-html:`<span class="metaname">学籍番号</span>_Q<span class="metaname">出題回</span>`」を以下では， *提出物ベース名* と呼ぶことにする．
たとえば，Z0TB9999さんの第3回課題の提出であれば，提出物ベース名は``Z0TB9999_Q3``である．

**公開の場所に解答を置かないようお願いします．**
githubやbitbucket等は使える人は使えばよいと思いますが，private レポジトリにするようにお願いします．


---------------------------------
プロジェクト/ソリューションの作成
---------------------------------

Visual Studioの場合
~~~~~~~~~~~~~~~~~~~


「新しいプロジェクトの作成」（Windows）や「新規」/「New」（Mac）から，C#の「コンソール アプリケーション」テンプレートを
選び，プロジェクト名とソリューション名を :raw-html:`<span class="metaname">提出物ベース名</span>` とする．
たとえば，Z0TB9999さんの第3回課題の提出であれば，プロジェクト名とソリューション名はともに``Z0TB9999_Q3``とする．
プロジェクト名とソリューション名以外の選択項目は（あれば）デフォルトのままとする．
 

コマンドラインの場合
~~~~~~~~~~~~~~~~~~~~

適当な場所で

.. raw:: html 

   <pre>dotnet new console -o <span class="metaname">提出物ベース名</span></pre>

を実行する．たとえば，Z0TB9999さんの第3回課題の提出であれば，``dotnet new console -o Z0TB9999_Q3``とする．この場合はソリューションは作成されないがそれで問題はない．

----------
課題の実施
----------

.cs ファイルを問題文の指示の通りに作成する（``Program.cs``を編集すればよい）．作成した.csファイルには先頭部分に **学籍番号と名前をコメントとして含める** こと．なので，たとえば学籍番号Z0TB9999の東北 大学さんの提出ファイルは

.. code:: cs

   // Z0TB9999
   // 東北 大学

という行から始まる． 

-----------------
提出するzipの準備
-----------------

Visual Studioでプロジェクト/ソリューションを作成した場合
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


1. まず，Visual Studio でソリューション「:raw-html:`<span class="metaname">提出物ベース名</span>.sln` 」を開いた後，ソリューション エクスプローラーから，同名のプロジェクトを右クリックして出てくるコンテキストメニューから *「〜をクリーン」* を（選択できれば）選択する．あるいは，以下の手順を実行する前に``obj``フォルダと``bin``フォルダを消したのでもよい．

#. 当該ソリューションが含まれているフォルダは以下の構造をしている．

   .. class:: directorylist

   - :raw-html:`<span class="metaname">提出物ベース名</span>/` 
     - :raw-html:`<span class="metaname">提出物ベース名</span>.sln` 
     - :raw-html:`<span class="metaname">提出物ベース名</span>/` 
       - :raw-html:`<span class="metaname">提出物ベース名</span>.csproj`
       - MainForm.cs
       - obj

   そこで，たとえば下記のようにして，一番外側のフォルダをzip形式で圧縮し，
   「:raw-html:`<span class="metaname">提出物ベース名</span>`.zip」というzipファイルを作成する．

   - Windowsの場合．まず，当該フォルダはデフォルトだと ``%HOMEPATH%\source\repos`` 以下にある．
     Visual Studioの起動後の画面で *「ローカルフォルダを開く」* を選んだのでも場所がわかる．
     エクスプローラーにて当該フォルダを右クリックして *「送る」*  から  *「圧縮（zip形式）フォルダー」*  を選択する．
     すると，「:raw-html:`<span class="metaname">提出物ベース名</span>`.zip」というzipファイルが作成される．

   - Macの場合．当該フォルダの場所はデフォルトだと，``~/Projects/``以下にある．
     Finder.appで当該フォルダをCtrl + クリック（あるいは右クリック）し， *「"〜"を圧縮」* を選ぶ．
     すると，「:raw-html:`<span class="metaname">提出物ベース名</span>`.zip」というzipファイルが作成される．
   
コマンドラインでプロジェクトを作成した場合
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

1. `プロジェクト/ソリューションの作成`_ で作成したディレクトリの親ディレクトリ（すなわち``dotnet new``を実行した場所）に移動する．
   
#. 作成したディレクトリは以下のような構造になっている．

   .. class:: directorylist


   - :raw-html:`<span class="metaname">提出物ベース名</span>/` 
     - :raw-html:`<span class="metaname">提出物ベース名</span>.csproj`
     - MainForm.cs
     - obj


#. 以下を実行する．

   .. raw:: html 
      
      <pre style="line-height: 1.3">
      dotnet clean <span class="metaname">提出物ベース名</span>
      </pre>

#. 「:raw-html:`<span class="metaname">提出物ベース名</span>`.zip」 を作成する．エクスプローラーやFinder.app経由で作成してもよいし，
   コマンドラインから以下を実行してもよい．

   .. raw:: html

      <pre>
      zip -r <span class="metaname">提出物ベース名</span>.zip  <span class="metaname">提出物ベース名</span>/
      </pre>

   
----
提出
----

できあがった「:raw-html:`<span class="metaname">提出物ベース名</span>`.zip」をClassroom内の当該回の「課題」より提出する．
たとえば，Z0TB9999さんの第3回課題の提出であれば，提出するファイルの名前は``Z0TB9999_Q3.zip``になる．

