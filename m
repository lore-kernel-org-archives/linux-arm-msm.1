Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793712462;
	b=Hojr1uIbi7j70wIO99xJSup0NI6HUVmrW53dKz1/2RfLJhpEINiWpQXELwOX3VKtSvim
	 2IAdtjRUYvqfeXgPLWR8Bnxs1C9K+WcnA42HtvGsIEYf+nbYpyc9r0vDcHyGuZFBlXofM
	 jOeFMqJvOPnkwYwVrIypytAtir597Hky95vu/d6mZb3XQz1iSl2SPdc9I3xFfkdW8VrKi
	 tVh+1ixehDfQo5/Nd8GyBj4MiUrzxgiKL+DNLZaVbgeFltzWsZFWLZdJ6Cg3oUE28g2Aq
	 up2IZdV2FsqId4k28FaJ2nuLfbPQFH+jLAyyYtaGNRgq+bQTu8zEuoTogQmfjv3dcXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793712462;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=xRUzoMUosdglIXL7NO1Kr4njcuwduorg+AuPTQxBoIM=;
	b=yJCR8CpQCEo+wWjbXDTP/c1ZG3ZkNOeWc7/QlPB6FMCwVyUe2eWZJX9FRhmt8HHNEdN9
	 QPYLj2PtxDt6hWy/Ok4iA3TzsnNnbWl7+qQLcMsKv8iijGmDuOMQn909xrYIhANXRQlgg
	 INqt5k11R2rcyLC4ON3///s/f/0nrwDGg75PwXGbLMxV61tyS4hxliTVdOJoSTeVmwujp
	 bERs2FfEosubZvfREAFgCygjS+tJ6QVVgN/6c5r4SEBL35uVeVLbqaE5+rjX0dmKB5geZ
	 lhdrjy/G8TN5DZZI9jHXvGPkIdkvEgRXx2LsksLXbsoR/uRJFy3q4n3+OoPLBNHtvJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KNIK1R4T;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41CAF606A329
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 13:27:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41CAF606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KNIK1R4T
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c423b145922so574173066b.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 05:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793712461; x=1794317261; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xRUzoMUosdglIXL7NO1Kr4njcuwduorg+AuPTQxBoIM=;
        b=KNIK1R4TpC9twbF4BS7SuWvJSUuNrPx9iNsyETuyAuhGzECkUJLXcUlFxAIsrPrBHR
         P4zGRRB7PTCwU3QLPfzOmoLrA9OYtqelwcNNRzIItr4CJUoXSnfUvykAWpB3GHfa8xjV
         quuOYUXxTXhuFLQOS6BCHETjDMrXSNuQ5zeg0TipkGS709Nzbmjfkl2TF0KDisqtDwZv
         Qti+3JPEIKgggsxJjUDBzeNakf4Z1O6Z94sWbwAn1gPkuPTtRjg3ihHmyuGrQhs9gGOj
         bwZHjU1oVo03W3Y9aUaXo9B8zGyPSuOgwhDigNuCZtRp0pshfnB8q/0C6mrs0MXKu6cf
         vSgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793712461; x=1794317261;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xRUzoMUosdglIXL7NO1Kr4njcuwduorg+AuPTQxBoIM=;
        b=dQ1wGKMukzBq0A2WpljvgbnlXGVfXa2uXbrcND73156e3JkDTTw5ntPvj6kSu7k/P/
         IGff0YZ4JXh7/88nS/LpYqstQr1OtP4ncUsMxhzCs8KIQE3EXB39pqMT2bkP5s/8KYFY
         AEXa47Jv6UQZPyY6A3LN2igvd5vSYHuzYAB6j4SgwA9vTHLFSyF+JTl6qCh7mdYx1O4V
         spQzDHyekwbUXdoOJtl046vL5b7BbXMezcs5ubOld3kIbWYFlRfjijfG71uMv445LaFE
         iI7hFBPhN9Nh0U560slaFDXj0DII3nVo6h5i99CK5KmK0kZg3jJn5CC/Vbo0Fe2XC0cM
         cwkg==
X-Gm-Message-State: APuU4Z+Ew78OLoc/ncbk803KONOgL5qDWtUBRkvuOVo+1LRUh6VcUtsV
	sAlDwrt2ivx926/VCmbbyQ1YF3Pijq+QTaA2qSHMiHvyTHYJbF3Y8MQ=
X-Gm-Gg: AYBFou2qjL+mHPaS7FF5pXq8RO0VCTi18DDZxeK0d9jwabZH8WNkzK2DtuLTFkHbrQv
	nhh77tshXM8oRV010lZ06SriCPyFhMllzIVhLxQlGPn2TU3QAIe5vs6sMkz8znJxtu79hmzG4rc
	b7QPsKHVaOOmJy52ZPAYRzyseoL5KECgLVA2lFGAOVs+xjBvXXQsWjub19loyacPXBdQqLnTbJ/
	Nd0HMdWOlKHB1B4OlvsEJObDS5OZFv+aAnPfVCSXfSxkRITH7Rosl7NVLnEIKMBTfa0YQIfyf8F
	RFpW15/Z5WSdMWlPGuSqWKevpETAfznsVHAoSku8QVi1PJ5g2y1unJgWb6CSgSRsOCWUYKWbHGe
	zH9WORyxagerPNPVmGsAyNcT4rVWS58r3wQ1CvtPAX3n+YaCAhTHHo/9uyrEwwPTksqsYZmhuLz
	t34GseBAYkoJow7YOF8GgDERDlJPLTMN+v3F06ibFDDmG/gVFI64hlCTJSbuqSCJCZ1kbM5mGFG
	vU3MyTVaXfxcnat/dNleAnp840gznD/4IoJtrrdkz3ZQmcbngKVX8EuGpF4IByTUxEDghx4LCCM
	ys7g5UdwkqwtkRGYDYr3005snzrt4lprFT0WzW0DJyrtcxWbgxv/X0zPA6PT8PHoNs+M3JS/2hw
	TREVQxUGK
X-Received: by 2002:a17:907:3e9b:b0:c16:4e5:944a with SMTP id a640c23a62f3a-c4ca7a887c7mr1045052766b.21.1793712460530;
        Tue, 03 Nov 2026 05:27:40 -0800 (PST)
Received: from ?IPV6:2001:b07:2ec:601d:4b26:1672:75c7:805a? ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e7a1d9d71sm19668686f8f.48.2026.11.03.05.27.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 05:27:39 -0800 (PST)
Message-ID: <951eab35-75d5-49b2-8f82-984aa4864c71@gmail.com>
Date: Tue, 3 Nov 2026 14:27:37 +0100
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
Subject: Re: [PATCH v2 4/4] drm/msm: Inhibit IFPC for state snapshot
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Alexander Koskovich <akoskovich@pm.me>, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
References: <20261102190010.720443-1-robin.clark@oss.qualcomm.com>
 <20261102190010.720443-5-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
In-Reply-To: <20261102190010.720443-5-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/2/26 8:00 PM, Rob Clark wrote:
> We need the GPU to stay awake for this.
>
> Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/msm_debugfs.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
> index aa59b28a3392..29209c23fcfa 100644
> --- a/drivers/gpu/drm/msm/msm_debugfs.c
> +++ b/drivers/gpu/drm/msm/msm_debugfs.c
> @@ -81,6 +81,8 @@ static int msm_gpu_open(struct inode *inode, struct file *file)
>   		return -ENOMEM;
>   
>   	scoped_guard (pm_runtime_active, &gpu->pdev->dev) {
> +		guard(ifpc_disable)(gpu);
> +
>   		scoped_cond_guard (mutex_intr, return -EINTR, &gpu->lock) {
>   			msm_gpu_hw_init(gpu);
>   			show_priv->state = gpu->funcs->gpu_state_get(gpu);

Reviewed-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>

Best regards,
-- 
Anna Maniscalco <anna.maniscalco2000@gmail.com>

