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
