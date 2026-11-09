Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794229378;
	b=NfoSgP6z8kcsCG3jtg+G5y0k8BXs+dzpZL07u7bPEv7B7+/1EVPjlMhbmCHqN3IH2wb5
	 fZeQYzU0g4vQ+OmnB1kcmO7jS7Ye6CT1cYxzyT+J9/xKeliR3Zgzz0jatuEjB64OLM07t
	 MYWXSWvvansMN6u3/3Te0rvwf/nxv8qOtJEazIG6ModcAEZjmm/S+qhxj6XuJ/MNUz4R7
	 MqoBx1/26Cg9fIL+bQcUBPkOIzUusman/o6Nrl2w0ITFf0zXltWGz/ZGVRuCexlorlLmw
	 jt4BRyTwwO180NIBFfRa0UFOMHR3plW/8fBCYrj1oMwySd5r2iIrZnInxXDWdgwGR4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794229378;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=2pqezEh1l4R7qbedrIHueLpYvtHBQ5vBsWVh1r02B6E=;
	b=IzdEOiqEk7MtAnyDEhBKFvrQaLVglJG8AcMpGeqU4EKXG3eZP1fTSdttvFkKgsbU5ckj
	 zsK8g5tCDX62+Uy0Q7KNIiKZLmuVQbA2W5AjFbxrEFXbnfK3cA8PBIYXSgpOIlzsM6rjv
	 nHco+Hb+hUbsWWaQYs+vvqIkfGQQEgCQofzU/0d41DYCV6yzAB4/n5KMmuK8juVlfseSd
	 lqtznjDkNbDJwOnvzypJGt8WSzIZ491Kq4kdNZdJaKbr9/vsMTWfnlffHwfTXMolwUJY0
	 UmUBV2AQyNzd5TxLXZyhQNK6NfCHCTYrzn3uFstdyVwbSqgAQvexPcC6z1/Nf5nmt/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=nHbFPI7G;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03D0606A321
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 13:02:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F03D0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=nHbFPI7G
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c3f8d72d7ceso120778666b.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 05:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794229376; x=1794834176; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2pqezEh1l4R7qbedrIHueLpYvtHBQ5vBsWVh1r02B6E=;
        b=nHbFPI7G9w9b2UfLy/acyio+uPB5UJSDX/5bVckxSXib6jXBEuPesS3SMK1LaDgf5d
         axhOQtlHfwRVCW8Q51qgy980+Ph1R0t2RI4HdGB7N7JxPvlcQGAhxBubTSOD3sOEuNbu
         6KTzDmJwQEBj3FtB2LY6HBL7zH3xJSTRnmBYd09yEyMbI0VX79Sm99DRwtRomBsoAU2g
         LAE87/ILTx2slpSx24TJ2eJq6JOee5TzZlsNQHqQTiqrH73nlPaFJhI7ATokG6L5IvgK
         DvgiZ6/M57ekmz44YLk6G+UPXe6hRmrXtrH0Bj5hgQE51a95RCX3gLN9Y3yx5gAy0WpV
         HrEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794229376; x=1794834176;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2pqezEh1l4R7qbedrIHueLpYvtHBQ5vBsWVh1r02B6E=;
        b=XneTOFvz0UQNpju+T3kIDlYHoFw9jeBzfqK/4JeKWu1MifnpZ8qj0H83YMvg7Rll1W
         oqVAxNo8HcT9oC19muMjDyejbCE6UmLMZSPlMuiNyD7o9OCxPKOEV95f8RmKf7GMCJUe
         zR8/5HNHHlJ0WH5YHM+OQnOLJo5CFMzbEP/0JpqQJlRZfhGApYFuMqJaQuKp0LumqUzo
         w39lydUiWnZknEYVfFNWvuTuR40R4nsCQl8Up9xpJNR33NWLcMlWZaHXKh8aa5+Em4Al
         wWsSiPYJ0mnn4ags6UybsyKBTRh9et5vSN9xhBsYeS2ahI5m3QIxIEmzAtGj2wHkN+pV
         MDuw==
X-Forwarded-Encrypted: i=1; AL+hErEBz3byJ3mUWp09Q8uwMcxU5AhRpss0LwV3I9m75YWk69YoubpNRZrEisUssLWzRw3Z2+aQg0TISxwA4Cgd@vger.kernel.org
X-Gm-Message-State: APuU4Z8NKrlmvLwGbpw5cOzi31W7GbBeU+56Zy+1q7yWVPmgrL1Do3hW
	OkTcNXZ9+feBpeIw2Kt4trDJyFbonrj+2ApJVKGBFU85loao5yeTkcOCgkqbLv2tyzo=
X-Gm-Gg: AYBFou0tONu5J+KaJAP1F8Z1uA/8BMeTsj1aSpeb3TzVTaamy39l5CmC7DyGridG5UW
	HQD0H+pCvZVsQgOsHopAZDQOOthOZYZtyAfBLBtv0biMR/Q1Z1CPJGEOSmgw1lXMgE1dcCXLcxg
	bN9IUYGcv+7rXUFq0nCriGFgT35bp5Yjq7/kNAY5cJD/wG7UvSMJoXQbqyHm1dMwCjGLLxxCGrJ
	Xmx/JaQo0QkPkcoNzMPgvcR8zLeElStrbry7On+F+hfXOVEc0aOJal9g1ISDLxNpFU6UJ/xZkjA
	rWl/UwU/13Ep4Buy901ufZDItUjVONm0j881ipCimfT5Pskt4h6MMLNRyRT3YaBEuuBVdg7RkAT
	PpQtbAOIXD45wy7nECXt6h+qlMIJGKmzmSHEgB9Q/CJLiqDZv/9fNYIWbGtOox9haySkRWikaqr
	FFJrdBIZC9vYin0GXDnOj0slrL8zzydwknPSPNdCMqyTGK4nPjqsKC9XYmjrtMgg1OVoj80sTtW
	SisPZSy0q8nnYkiNNd4mJW4XpYaXsqhMdt/5wrDMBG0l9ZDJk6mrLKeMotd7xCM8wMjQO0noXuw
	71DD75Q7GOdiLqIUAT1dUEhLGvbMUu2qSip8JC8=
X-Received: by 2002:a17:907:6e88:b0:c49:bc1f:fe2d with SMTP id a640c23a62f3a-c4d6d4fa5eamr275959166b.28.1794229376222;
        Mon, 09 Nov 2026 05:02:56 -0800 (PST)
Received: from [192.168.0.167] ([109.76.74.9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d69f9483esm163287866b.19.2026.11.09.05.02.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 05:02:51 -0800 (PST)
Message-ID: <919e9806-5e1b-49ee-a88a-7b6dd6d93c18@linaro.org>
Date: Mon, 9 Nov 2026 13:02:48 +0000
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
Subject: Re: [PATCH v2 3/4] media: qcom: camss: always stop the pipeline in
 stop_streaming
To: Allan Siriani <allan@fatecpompeia.edu.br>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Todor Tomov <todor.too@gmail.com>, Hans Verkuil <hverkuil@kernel.org>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261109112611.94010-1-allan@fatecpompeia.edu.br>
 <20261109112611.94010-4-allan@fatecpompeia.edu.br>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261109112611.94010-4-allan@fatecpompeia.edu.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/11/2026 11:26, Allan Siriani wrote:
> Fixes: 89013969e232 ("media: camss: sm8250: Pipeline starting and stopping for multiple virtual channels")
> Reviewed-by: Bryan O'Donoghue<bryan.odonoghue@linaro.org>
> Signed-off-by: Allan Siriani<allan@fatecpompeia.edu.br>
> ---
>   drivers/media/platform/qcom/camss/camss-video.c | 14 +++++++++-----
>   1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
> index 5de6ff5ec..8341666f9 100644
> --- a/drivers/media/platform/qcom/camss/camss-video.c
> +++ b/drivers/media/platform/qcom/camss/camss-video.c
> @@ -313,12 +313,16 @@ static void video_stop_streaming(struct vb2_queue *q)
>   		entity = pad->entity;
>   		subdev = media_entity_to_v4l2_subdev(entity);
>   
> +		/*
> +		 * Subdevs without .s_stream(), such as a sensor pixel array
> +		 * entity, return -ENOIOCTLCMD, as at stream on. On a real error
> +		 * keep going: the pipeline must be stopped and the buffers
> +		 * returned to vb2 in any case.
> +		 */

this comment is completely redundant - it looks like LLM word-salad.

Please drop.

>   		ret = v4l2_subdev_call(subdev, video, s_stream, 0);
> -
> -		if (ret) {
> -			dev_err(video->camss->dev, "Video pipeline stop failed: %d\n", ret);
> -			return;
> -		}
> +		if (ret && ret != -ENOIOCTLCMD)
> +			dev_err(video->camss->dev,
> +				"Failed to stop %s: %d\n", entity->name, ret);
>   	}
>   
>   	video_device_pipeline_stop(vdev);
> -- 2.43.0

