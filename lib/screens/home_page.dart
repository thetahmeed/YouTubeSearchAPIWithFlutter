      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollDetails) {
          if (!_isLoading &&
              scrollDetails.metrics.pixels ==
                  scrollDetails.metrics.maxScrollExtent) {
            _getMoreVideos();
          }
          return false;
        },
        child: _getVideos(),
  FutureBuilder _getVideos() {
    return FutureBuilder(
      future: APIService().fetchVideosFromPlaylist(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          _videoModel = snapshot.data;
          return _buildBody(_videoModel);
        }

        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
  _getMoreVideos() async {
    List<VideoModel> moreVideos =
        await APIService.instance.fetchVideosFromPlaylist();
    List<VideoModel> allVideos = _videoModel!..addAll(moreVideos);
    setState(() {
      _videoModel = allVideos;
    });
  }

  _buildBody(List<VideoModel>? videoModel) {
    return ListView.builder(
      itemCount: _videoModel!.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) =>
                  VideoScreen(id: _videoModel![index].id.toString()),
            ),
          ),
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(
                  videoModel![index].snippet.thumbnails.thumbnailsDefault.url),
            ),
          ),
        );
      },
    );
  }
