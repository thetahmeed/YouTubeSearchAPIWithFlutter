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
