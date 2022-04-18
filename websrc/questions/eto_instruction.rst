============
課題の進め方
============

.. role:: raw-html(raw)
   :format: html

大雑把には，以下の名前のプロジェクト/ソリューションを作って，zipにまとめて提出する．

.. raw:: html 

   <pre><span class="metaname">学籍番号</span>_Q<span class="metaname">出題回</span></pre>

上記の「:raw-html:`<span class="metaname">学籍番号</span>_Q<span class="metaname">出題回</span>`」を以下では， *提出物ベース名* と呼ぶことにする．
たとえば，Z0TB9999さんの第5回課題の提出であれば，提出物ベース名は``Z0TB9999_Q5``である．

**公開の場所に解答を置かないようお願いします．**
githubやbitbucket等は使える人は使えばよいと思いますが，private レポジトリにするようにお願いします．

---------------------------------
プロジェクト/ソリューションの作成
---------------------------------

Visual Studioの場合
~~~~~~~~~~~~~~~~~~~

「新しいプロジェクトの作成」（Windows）や「新規」/「New」（Mac）から，C#の「Eto.Forms Application」あるいは「Eto Application」テンプレートを
選び，プロジェクト名とソリューション名を :raw-html:`<span class="metaname">提出物ベース名</span>` とする．
たとえば，Z0TB9999さんの第5回課題の提出であれば，プロジェクト名とソリューション名はともに``Z0TB9999_Q5``とする．
プロジェクト名とソリューション名以外の選択項目は（あれば）デフォルトのままとする．

コマンドラインの場合
~~~~~~~~~~~~~~~~~~~~

適当な場所に「:raw-html:`<span class="metaname">提出物ベース名</span>`」という名のディレクトリを作成した後に，そこに移動し

.. code::

   dotnet new etoapp

でプロジェクト（共通のもの，GTK用，Mac用，Wpf用）を作成する．自分の環境に不要なものも消さない（採点の際に困るので）．

----------
課題の実施
----------

.cs ファイルを問題文の指示の通りに作成する（``MainForm.cs``を変更すればよい）．``….Gtk``，``….Mac``，``….Wpf``の中に含まれているファイルは **変更しない．**
**作成した** .csファイルには先頭部分に **学籍番号と名前をコメントとして含める** こと．なので，たとえば学籍番号Z0TB9999の東北 大学さんの提出ファイルは

.. code:: cs

   // Z0TB9999
   // 東北 大学

という行から始まる． 

-----------------
提出するzipの準備
-----------------

Visual Studioでプロジェクト/ソリューションを作成した場合
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

1. まず，Visual Studio でソリューション「:raw-html:`<span class="metaname">提出物ベース名</span>.sln` 」を開いた後，ソリューション エクスプローラーから，4つのプロジェクト名（「:raw-html:`<span class="metaname">提出物ベース名</span>`」，「:raw-html:`<span class="metaname">提出物ベース名</span>.Gtk`」 ，「:raw-html:`<span class="metaname">提出物ベース名</span>.Mac`」 ，「:raw-html:`<span class="metaname">提出物ベース名</span>.Wpf`」 ）について，それぞれプロジェクト名を右クリックして出てくるコンテキストメニューから *「〜をクリーン」* を（選択できれば）選択する．あるいは，以下の手順を実行する前に``obj``フォルダと``bin``フォルダを消したのでもよい．

   - Macだと「:raw-html:`<span class="metaname">提出物ベース名</span>.Wpf`」については「〜をクリーン」が選択できないが，それでよい．

#. 当該ソリューションが含まれているフォルダは以下の構造をしている．
   

   .. class:: directorylist
   
   - :raw-html:`<span class="metaname">提出物ベース名</span>/` 
     - :raw-html:`<span class="metaname">提出物ベース名</span>.sln` 
     - :raw-html:`<span class="metaname">提出物ベース名</span>/` 
       - :raw-html:`<span class="metaname">提出物ベース名</span>/` 
         - :raw-html:`<span class="metaname">提出物ベース名</span>.csproj`
         - MainForm.cs
         - obj
       - :raw-html:`<span class="metaname">提出物ベース名</span>.Gtk`
         - … 
       - :raw-html:`<span class="metaname">提出物ベース名</span>.Mac`
         - … 
       - :raw-html:`<span class="metaname">提出物ベース名</span>.Wpf`
         - … 

   そこで，たとえば下記のようにして，一番外側のフォルダをzip形式で圧縮し，
   「:raw-html:`<span class="metaname">提出物ベース名</span>`.zip」というzipファイルを作成する．

   - Windowsの場合．まず，当該フォルダはデフォルトだと，ユーザフォルダの``source\repos``以下にある．
     なお，ユーザフォルダはデフォルトだと :raw-html:`<code>C:\Users\<span class="metaname">ユーザ名</span></code>` であり，
     エクスプローラーのアドレスバーに``%HOMEPATH``を入力すれば移動できる．
     また，Visual Studioの起動後の画面で *「ローカルフォルダを開く」* を選んだのでも場所がわかる．
     エクスプローラーにて当該フォルダを右クリックして *「送る」*  から  *「圧縮（zip形式）フォルダー」*  を選択する．
     すると，「:raw-html:`<span class="metaname">提出物ベース名</span>`.zip」というzipファイルが作成される．

   - Macの場合．当該フォルダの場所はデフォルトだと，``~/Projects/``以下にある．
     Finder.appで当該フォルダをCtrl + クリック（あるいは右クリック）し， *「"〜"を圧縮」* を選ぶ．
     すると，「:raw-html:`<span class="metaname">提出物ベース名</span>`.zip」というzipファイルが作成される．
     




コマンドラインでプロジェクトを作成した場合
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

1. `プロジェクト/ソリューションの作成`_ で作成したディレクトリの親ディレクトリに移動する．

#. 作成したディレクトリは以下のような構造になっている．

   .. class:: directorylist

   - :raw-html:`<span class="metaname">提出物ベース名</span>/` 
     - :raw-html:`<span class="metaname">提出物ベース名</span>/` 
       - :raw-html:`<span class="metaname">提出物ベース名</span>.csproj`
       - MainForm.cs
       - obj
     - :raw-html:`<span class="metaname">提出物ベース名</span>.Gtk`
       - … 
     - :raw-html:`<span class="metaname">提出物ベース名</span>.Mac`
       - … 
     - :raw-html:`<span class="metaname">提出物ベース名</span>.Wpf`
       - … 


#. 以下のそれぞれの行を順に実行する（``$``はプロンプトを表す）．

   .. raw:: html 
      
      <pre style="line-height: 1.3">
      <span class="with-prompt">cd <span class="metaname">提出物ベース名</span></span>
      <span class="with-prompt">dotnet clean <span class="metaname">提出物ベース名</span></span>
      <span class="with-prompt">dotnet clean <span class="metaname">提出物ベース名.Gtk</span></span>
      <span class="with-prompt">dotnet clean <span class="metaname">提出物ベース名.Mac</span></span>
      <span class="with-prompt">dotnet clean <span class="metaname">提出物ベース名.Wpf</span></span>
      <span class="with-prompt">cd ..</span>      
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
たとえば，Z0TB9999さんの第5回課題の提出であれば，提出するファイルの名前は``Z0TB9999_Q5.zip``になる．



   
