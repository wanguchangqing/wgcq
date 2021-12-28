const myRequest = (params) => {
    return new Promise((resolve,reject) => {
        $.ajax({
            url: baseUrl+params.url,
            type: params.type || 'get',
            dataType: 'json',
            headers: params.headers || {},
            success(res) {
                resolve(res);
            },
            error(err) {
                reject(err);
            }
        });
    });
}
