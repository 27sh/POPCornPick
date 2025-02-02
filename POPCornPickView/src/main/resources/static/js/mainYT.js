var player;
var selectedVideoId;

function initializePlayer() {
    // 두 개의 동영상 ID 중 하나를 랜덤으로 선택
    var videoIds = ['vWFq0iaoaAg', 'EiCmnIaj4u8'];
    selectedVideoId = videoIds[Math.floor(Math.random() * videoIds.length)];

    // 동영상 정보 업데이트
    updateMovieInfo(selectedVideoId);

    if (player && player.destroy) {
        player.destroy();
    }
    
    player = new YT.Player('ytplayer', {
        videoId: selectedVideoId, // 랜덤으로 선택된 YouTube 동영상 ID
        playerVars: {
            'autoplay': 1,
            'mute': 1, // 무음으로 설정
            'controls': 0, // 제어 바 숨기기
            'modestbranding': 1, // YouTube 로고 최소화
            'rel': 0, // 관련 동영상 표시 안함
            'iv_load_policy': 3, // 자막 숨기기
            'playsinline': 1, // 인라인 재생
            'showinfo': 0 // 동영상 정보 숨기기
        },
        events: {
            'onReady': onPlayerReady,
            'onStateChange': onPlayerStateChange
        }
    });
}

// 동영상 정보 업데이트 함수
function updateMovieInfo(videoId) {
    var title = '';
    var content = '';

    if (videoId === 'vWFq0iaoaAg') {
        title = '탈주';
        content = '내일을 향한 질주<br>오늘을 위한 추격';
    } else if (videoId === 'EiCmnIaj4u8') {
        title = '인사이드 아웃 2';
        content = '디즈니·픽사의 대표작 <인사이드 아웃> <br>새로운 감정과 함께 돌아오다!';
    }

    document.getElementById('youtube-title').innerHTML = title;
    document.getElementById('youtube-content').innerHTML = content;
}

// YouTube IFrame API가 로드되면 호출되는 함수
function onYouTubeIframeAPIReady() {
    initializePlayer();
}

// 페이지 로드 시 초기화
$(document).ready(function() {
    // 유튜브 IFrame API 로드
    var tag = document.createElement('script');
    tag.src = "https://www.youtube.com/iframe_api";
    var firstScriptTag = document.getElementsByTagName('script')[0];
    firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

    // 사용자가 클릭 시 음소거 해제
    $('#ytplayer').on('click', function() {
        player.unMute();
    });

    // 상세보기 버튼 클릭 시 이동
    $('#youtube-go-detail').on('click', function() {
        if (selectedVideoId === 'vWFq0iaoaAg') {
            window.location.href = '/film/movieDetail/20212932';
        } else if (selectedVideoId === 'EiCmnIaj4u8') {
	        window.location.href = '/film/movieDetail/20235974';
	    }
    });
});

// 플레이어가 준비되면 호출되는 함수
function onPlayerReady(event) {
    event.target.playVideo(); // 동영상 자동 재생
}

// 플레이어 상태 변경 시 호출되는 함수
function onPlayerStateChange(event) {
    if (event.data === YT.PlayerState.ENDED) {
        player.playVideo(); // 동영상 반복 재생
    }
}

document.addEventListener('DOMContentLoaded', function() {
    onYouTubeIframeAPIReady();
});