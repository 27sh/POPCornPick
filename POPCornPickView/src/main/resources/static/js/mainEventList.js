$(document).ready(function() {
    let currentPage = 1;
    const itemsPerPage = 2;
    let events = [];

    function renderEvents() {
        let eventRowContainer = $('#event-row-container');
        eventRowContainer.empty();
        
        let start = (currentPage - 1) * itemsPerPage;
        let end = start + itemsPerPage;

        let paginatedEvents = events.slice(start, end);

        paginatedEvents.forEach(function(event) {
            let startDate = new Date(event.startEvent).toLocaleDateString();
            let endDate = new Date(event.endEvent).toLocaleDateString();

            const eventContentBox = document.createElement('div');
            eventContentBox.className = 'event-content-box';
            eventContentBox.innerHTML = 
                '<img src="/img/' + event.eventImgNewName + '" class="event-img" alt="Event Image">'
                + '<p>' + event.eventTitle + '</p>'
                + '<p>' + startDate + ' - ' + endDate + '</p>';

            eventRowContainer.append(eventContentBox);
        });

        $('#event-prev-page').toggleClass('hidden', currentPage === 1);
        $('#event-next-page').toggleClass('hidden', end >= events.length);
    }

    function eventPrevPage() {
        if (currentPage > 1) {
            currentPage--;
            renderEvents();
        }
    }

    function eventNextPage() {
        if (currentPage * itemsPerPage < events.length) {
            currentPage++;
            renderEvents();
        }
    }

    $.ajax({
        url: 'http://localhost:9001/api/v1/main/events',
        type: 'GET',
        dataType: 'json',
        success: function(response) {
            if (Array.isArray(response)) {
                events = response;
                renderEvents();
            } else {
                console.error('Response is not an array');
            }
        },
        error: function(error) {
            console.error('Error fetching events:', error);
        }
    });

    // 이벤트 핸들러 등록
    $('#event-prev-page').on('click', eventPrevPage);
    $('#event-next-page').on('click', eventNextPage);
});