m.rtsp2mp4()
{
	rtsp_url=$1
	mp4_file=$2
	m.log.v ffmpeg -y -i ${rtsp_url} -vcodec copy -acodec copy -f mp4 ${mp4_file}
}
