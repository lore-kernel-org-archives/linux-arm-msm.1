Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793743061;
	b=GiMNF2vDPMH1v0Ou+1NOVs0BRapN1OQ3WMOysf+5bhtE7AK8hafbFq4JXMtoOaNtgi13
	 nXZUbqOVNFEku/jZM+YTs2Fn0rDURiB8TtOOcxCig4Mh8GMXdCNWmFknrlU2WAMz5e036
	 frFT4SiddTyNRaSzmEV8M8zRQ7KcB4l2afu0SjQOrZhu0458CjBoBjTnFE9kZpCaw+0Yt
	 ySdH1rDQ+urHzx7bYqFXHtt9e3lLgP5ulnIPaeE80RAs+qezJXTntt3G1eTPzSjJV8IBX
	 dRm1O/PUgMqwG76akR8VlexpoXdXtj4YQrlf/BW4dN5th8BXGGK+21u2bkIvrsiVv9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793743061;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=5qvu1xb+d/MUKril1XvEor90j8ZJr5uw9xfUutlGO2Q=;
	b=JwA9j3PZoP0Lm2j+Lk5FPKpxuub+Lbh7+HmP/01ZRtw2Mn0PRbkv9W4OBavvxLGLlrkk
	 EkdpEMWUYKFaoUSWEPZye9Nv7+FXxci6xrVRc5UrcKKFXLRa2tx0aupK+IgzXSxQgLMh9
	 QSXT8rDfICQom9dj5oZMZ1AJwcFTQCWQ9RUsOJHuTAHcnWzUUG9FnbHOMc80VGq2TEr+/
	 Oaf6HyHzF4t+Xcq5dWsX8+xXvlp/+sJqJw8FRi+5mLXh87xpO+9Y9NE5OVTTEKgG6md72
	 xHMtnrGFwRTfqaFPrFV+rTNQjrpSF62AF5Jmvzp55o2yVZ/CzjNb1i3CRaHS8BqIV/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ciTFYsnY;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804A6606A326
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 21:57:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 804A6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ciTFYsnY
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a5720b0a57so7543845e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 13:57:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793743059; x=1794347859; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5qvu1xb+d/MUKril1XvEor90j8ZJr5uw9xfUutlGO2Q=;
        b=ciTFYsnYA9egDET7TvFrF2gFIsn8N5r99Ihufh9hMGH/MSqIsMG7zT1HMTHRtrsQnF
         Nz7jLQlJhjyX5Vsl/QxKpzI+MagBOV8khk1v6z7f7vklp9aYtgrpiMlDm5yCWDK2QB6n
         882t41ioU366uXvudJLhXHKCu7SYSG6WnNXFqaQIX8yDfbWrhAy6/FvuTD7BsfLfIfpN
         09uvnZfOu5C4IVFYVsKhBZH25ftq9VSyyZfBTwuJ6WAyLSf7fckiL6gkD59ctvHFq+lV
         p4jNLAD2+LLxxETHDbvLRc9QqeYt91rfJzH3i6kZW3TR9FQ/aVTOyiu2qx2WKulyq2Vg
         4qew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793743059; x=1794347859;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5qvu1xb+d/MUKril1XvEor90j8ZJr5uw9xfUutlGO2Q=;
        b=o6t1AmCFkPs0os/y+a6TO4ZfyHL538ZJiLkiG3eOps5JUl0iLR7tzGTMP6TvbBV5Y3
         mmQGVdhD3oXaj+Nra7ZYPgXRWltXQQq38GiqSw2DtAd7mX/j743w0wXis1YKrKZuwE/S
         oqii7MJ3wcGjjXPphZKDZexsYJMXuuXGbeXCiVTrgUM1TGfS7nQVGyiGALL117a24ZmO
         ros/BMAUpSnH0GgRPc8huPnpMgjmuMeHapRMpZJ4U5EYQaKueHeaOzHuGizYbwsRWdyX
         Njq8YzKl4Xgxu4ZreazkdSyolHBrRWljLJX1ZVkmrnsk9GcP1hx0pAciTNM4u/FmARko
         aTRA==
X-Forwarded-Encrypted: i=1; AKwUvBzddnYcAPdt1sBBI4Q6r+MQoZc/GNz80dPpo0/J05clRmjdRWGausfCX/jsYPpR5VJPGqlhKrlU9SYKqxr5@vger.kernel.org
X-Gm-Message-State: APuU4Z/DjNrlrfO+KSDC/A/YV4+6QK0uSh6XHRvjYc2yj1SGUvs8qqL7
	AHpkEhtvMSvsxARDx1CsddI4t9jk4Pmy7ur1hzPmUr2tMorsxbTSc4s2p3hZo9n81go=
X-Gm-Gg: AYBFou330Eaj3OQ3IhhGJcmlLeS3wjCi7YdEOTK9zYPjodBufKRB7ovURxii9UreDCa
	R2xm2f3RCkzyaOuDJGqRNGilIJKV0UerCI6uqHzB3vRYMxxQPiEukxItCUwBPQx9yCzf0RKXtxb
	d9/YNNETgHwE6vXiIDv4pwzXOQlNqoSie7l+P8YTOXRwim2tbSi00gByKRfT0hVzCnpZklO/+cz
	c4Ije9ufcQJYRC3qT/NBQSyUIiRL6Gdgf1c40TSyL8kssX2EF7ubv+3JMeemwQVJibw6R2vfDCq
	geYufpnod/GFv0VAJndknuehqgc5WuvidX+5j2bmO63W/6bbXDL8XOYHLgqGQII8cJDbE/aCeTD
	bv5tVp3fQC95f0Ec4aLKdJ83CtqdO5aYIrRNgXyrN9znnRaXnPYcDYrE9pqF9pvVIJaGSh9qRKM
	+WSknhPbRrazgxMO+5yjbD2xs8+nCmgB+rypWR8JU0LReinJ5ngXXtoQD9X5f2gs855Ctjyel/4
	BKYSnpyVela55tlLP7dk73XwKGyB3AbfsrGNmn/XU/NQL6C4YiRlwart4K4I+Ywc7i4S6/57eGF
	JRNrDYHDaQfRn6M6L3rwjYg++nVjiAAY5lRl
X-Received: by 2002:a05:600c:1387:b0:4a1:88df:8a2a with SMTP id 5b1f17b1804b1-4ac1793e81cmr346452985e9.13.1793743058801;
        Tue, 03 Nov 2026 13:57:38 -0800 (PST)
Received: from [10.144.41.45] ([64.43.50.75])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b43d4cc2b0sm3571605e9.13.2026.11.03.13.57.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 13:57:38 -0800 (PST)
Message-ID: <fcdc09bb-7f70-443c-942c-81f50a695aee@linaro.org>
Date: Tue, 3 Nov 2026 22:57:35 +0100
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] media: iris: Preserve timestamps on error buffers
To: Xilin Wu <sophon@radxa.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 dragon@radxa.com, Chris Obbard <chris.obbard@oss.qualcomm.com>,
 Deepak Sikri <sikrid@qti.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Loic Minier <loic.minier@oss.qualcomm.com>,
 Jason Pettit <jason.pettit@oss.qualcomm.com>
References: <20261029-iris-va-fixes-v1-0-44a2783f782b@radxa.com>
 <9YPKYT3Qcls0jbUWdxOqIWNLjQSGexDoWWE3PUBiJS3UpxTN9rFeicV5aeaeTDyrXqw8emy9LBK0hkxmeEqthw==@protonmail.internalid>
 <20261029-iris-va-fixes-v1-4-44a2783f782b@radxa.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20261029-iris-va-fixes-v1-4-44a2783f782b@radxa.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/10/2026 04:58, Xilin Wu wrote:
> Clearing timestamps on error buffers prevents clients such as libva-v4l2
> from identifying the failed picture and can cause synchronization timeouts.
> 
> Preserve the firmware-provided timestamp when returning an error buffer.
> 
> Fixes: b791dcfcba3a ("media: iris: Add handling for corrupt and drop frames")
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---
>   drivers/media/platform/qcom/iris/iris_buffer.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
> index eb8de60c1177..f790483d13d4 100644
> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
> @@ -899,7 +899,8 @@ int iris_vb2_buffer_done(struct iris_inst *inst, struct iris_buffer *buf)
>   	if (buf->flags & V4L2_BUF_FLAG_ERROR) {
>   		state = VB2_BUF_STATE_ERROR;
>   		vb2_set_plane_payload(vb2, 0, 0);
> -		vb2->timestamp = 0;
> +		/* Allow userspace to associate the error with the input frame. */
> +		vb2->timestamp = buf->timestamp;
>   		v4l2_m2m_buf_done(vbuf, state);
>   		return 0;
>   	}
> 
> --
> 2.56.0
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
