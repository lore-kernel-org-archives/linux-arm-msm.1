Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F02400991
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 14:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789397901; cv=none; b=FCANemqDrCTZn1/oyHDOlSKS+MXkMWFvq4d2GSC4m7JvT5QkMZh9PUV8G3TxOSzrlBTGAooJA+zGLS8lqmCATVSjfTTgc6WDLUigYr+aaQOGPZmJETN9/XBPDjJpE5AHsun5Yg10MfeBzpPp3+ErxitlD46KpEJf46iSGnN6WAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789397901; c=relaxed/simple;
	bh=+R50Qul5QGxIeK419WGh4KgQ41iGif+NkbPt0+DrHOE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oTGskZO0yVq4HLbfEHAII0iblpygk+QJABcjpqSvfkGOj/VflSj2tvmiW2BW3YYKxOm0OM7kJ9FrqiPADLlLP2uNnifcdLkALPjcweq7XIylsFkpMh5DfAaTthdqBZp7bgf4zy9r46scQIGWUXOId5jESx9NYYnAhk8g9LYidck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b8roN0jw; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b8roN0jw"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c2940ff2313so164377166b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789397896; x=1790002696; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QMqjc6OnYhMckLvcmBs/G72i4roiVsy91Dx1vcsxCuo=;
        b=b8roN0jwOM4qUVtGdlbXcw2kkLO9FK8nx/O5KorUestnt6N/+NTST4RQlbn8S9R0TB
         li9gU68VG5NMhApB44VwLYm7H3QARGDd2U19td3Oae3Uxqz66QZG/eXX6ESLiMkIZISf
         YR2aNvr4JIuhy2YXBtIzRDbx6OCPvYHKvI2eGCM3oq3lYpa4t2YNWkf0sg9AMQaW6zP6
         rs0ndCMeDeTRlDf2aWTqc6C6Zot49j/mg5CIW+8rVJKq85oqSzIdNaD0MnEYMein7YXr
         N5mDYHd5NU44DYCp6A4/vJF//viIgXJt4Kf1W8/V4q9a7Qb/BKNc3LPmii91G9wkyXRu
         jMvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789397896; x=1790002696;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QMqjc6OnYhMckLvcmBs/G72i4roiVsy91Dx1vcsxCuo=;
        b=jK/9kFEAXDEyVnTXDJou5rmnM6KmHC8fuTeVbzpwhryZBudkdaDDyL1YhC+tOCXoQ1
         g6K6WoGB8qV/9so/zhJB/YOM0b4kfd5c/8PXhXecNmzVfKgEDUZ4mnLr7XcwSjCCgp+j
         TEp7EqNTj4o6WxNXJKM1tsQSNyVrjZfZH+P2Im+gxzPt63jyR72gKl3XXOBbJDUmNFMf
         HmoIOoZarKQr//0rSAjQAiFeGg1XkP2WGYjmiKGk5dsJPkV2jfOZoGSXoRNzUhSq7OiD
         2aMP7U5w8a8YmIcydDfi/JmMzXmeWDon6XvlLqBExRXvCBG+qkNuVO8bobG1XPmqE/Vq
         BYnA==
X-Forwarded-Encrypted: i=1; AKwUvBwcrfLnR5sq/HQFQZ2MVJnx+amfxrz9hDkDAmAqRaekLgl1vA+cTs4muXWMVNGD0ozI3SGzemUPYXipVZjO@vger.kernel.org
X-Gm-Message-State: AFuF++nRSCQTvh/7F7/nud2rVH45UYTxOLaeHGe3xYpGnhvC86j7nfSe
	xum75PorC7ppJlYo1BQBNFsKJAT+kTSIv55YWNEL/Mxt0iXLWkmmZ0XFy7okRIvLaYE=
X-Gm-Gg: AYBFou3vpXqVtUc4w9WY10tXQ8ECWQWXsEsvEdUxLJtQnCE9DIlajxyDn/gVtLFiBqB
	8xj3ZPHvdVR5XyopH7dzlnTkbN4nbiVRW9EG0CfZ/Cc3C4sLE2BYh/DGqv+IGFVTdIVLVSb51+S
	YccDyo8AX0fKWm5o0DuD/IDS3/aytkIcNWobIhwANebdTVUZjgfHtbbDjfc4vI0z/LmY19eufeL
	UZ9mPiv1dd0tiRhb17ygn1gzMJ+14EC2TEMTjt+HTV2/yl/iXdOvHWr8yRPjwK5MBrZV3dsmUHd
	3s/OqygUZTNP9ejjdh9K4Qrn4YA4jSND4+p7B0QuIZJM+EJm8LKuNZImfeutpPRjyxVeQwk2Yi8
	aPlatFcOcTnsNroixZl2nikkvF5ysFId07nDP8Kxm5aSLy9Eq128xPqlAxS+U9sC1IB0SnwzH+A
	Cyf0C2dZYtIdZ/g45RxNt9cqdQXxtn/FInZzl035i2GhHmRfMop+YWgSKsFH0BfHI29XRKbHzW4
	JpBBnBYwdY=
X-Received: by 2002:a17:906:6a09:b0:c25:4ba1:594f with SMTP id a640c23a62f3a-c29b8fa1885mr178052466b.0.1789397896437;
        Mon, 14 Sep 2026 07:58:16 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.248.34])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2966066123sm456254466b.31.2026.09.14.07.58.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 07:58:15 -0700 (PDT)
Message-ID: <bd3fa7ab-9c60-4697-a0bc-92877e8a2885@linaro.org>
Date: Mon, 14 Sep 2026 15:58:13 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] media: qcom: camss: take the link frequency from the
 CSI-2 transmitter
To: Hitesh Patel <hitesh@ebytelogic.com>, linux-media@vger.kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, ravi@ebytelogic.com
References: <20260914133416.1030231-1-hitesh@ebytelogic.com>
 <20260914133416.1030231-2-hitesh@ebytelogic.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260914133416.1030231-2-hitesh@ebytelogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/09/2026 14:34, Hitesh Patel wrote:
> camss_get_link_freq() walks the pipeline to an entity whose function
> is MEDIA_ENT_F_CAM_SENSOR and reads the link frequency from there, to
> derive the CSIPHY settle count and the CSID clock.
> 
> The rate the receiver has to be programmed for is the rate on the
> CSI-2 bus, which is a property of whatever drives that bus, not of
> the sensor at the far end of the pipeline. The two coincide only when
> the sensor is wired directly to the CSIPHY. With a CSI-2 to CSI-2
> bridge in between, a GMSL or FPD-Link deserializer for instance, the
> bridge re-times the stream onto its own output: it may aggregate
> several sensors onto one link, forward a single sensor at a different
> rate, or generate a test pattern with no sensor involved at all. The
> sensor's rate is then simply not what arrives at the SoC, and the
> PHY does not lock.
> 
> Walking to a MEDIA_ENT_F_CAM_SENSOR also fails outright on a
> deserializer that has one sink pad per serial link: the walk follows
> pad 0, while the sensor may be attached to any of the other sink
> pads, and streaming is refused with "Cannot get CSI2 transmitter's
> link frequency".
> 
> Stop the walk at the first entity that is not a CAMSS receiver, i.e.
> at the external subdev feeding the CSIPHY, and query that pad with
> v4l2_get_link_freq(). This is what the helper is for: it asks the
> transmitter through .get_mbus_config first and falls back to its
> V4L2_CID_LINK_FREQ, then V4L2_CID_PIXEL_RATE controls.
> 
> For a sensor connected straight to a CSIPHY the transmitter is the
> sensor itself, so the pad found and the value returned are the same
> as before.
> 
> camss_find_sensor_pad() keeps walking to the sensor: its other users,
> camss_get_pixel_clock() and the frame skip query, do want the sensor.
> 
> Signed-off-by: Hitesh Patel <hitesh@ebytelogic.com>
> ---
>   .../media/platform/qcom/camss/camss-csid.c    |  2 +-
>   .../media/platform/qcom/camss/camss-csiphy.c  |  6 +-
>   drivers/media/platform/qcom/camss/camss.c     | 74 +++++++++++++++++--
>   drivers/media/platform/qcom/camss/camss.h     |  4 +-
>   4 files changed, 73 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
> index 48459b46a..c631119e2 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> @@ -546,7 +546,7 @@ static int csid_set_clock_rates(struct csid_device *csid)
>   
>   	fmt = csid_get_fmt_entry(csid->res->formats->formats, csid->res->formats->nformats,
>   				 csid->fmt[MSM_CSIPHY_PAD_SINK].code);
> -	link_freq = camss_get_link_freq(&csid->subdev.entity, fmt->bpp,
> +	link_freq = camss_get_link_freq(csid->camss, &csid->subdev.entity, fmt->bpp,
>   					csid->phy.lane_cnt);
>   	if (link_freq < 0)
>   		link_freq = 0;
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
> index 539ac4888..000fde129 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
> @@ -145,7 +145,8 @@ static int csiphy_set_clock_rates(struct csiphy_device *csiphy)
>   				csiphy->fmt[MSM_CSIPHY_PAD_SINK].code);
>   	u8 num_lanes = csiphy->cfg.csi2->lane_cfg.num_data;
>   
> -	link_freq = camss_get_link_freq(&csiphy->subdev.entity, bpp, num_lanes);
> +	link_freq = camss_get_link_freq(csiphy->camss, &csiphy->subdev.entity,
> +					bpp, num_lanes);
>   	if (link_freq < 0)
>   		link_freq  = 0;
>   
> @@ -272,7 +273,8 @@ static int csiphy_stream_on(struct csiphy_device *csiphy)
>   	u8 num_lanes = csiphy->cfg.csi2->lane_cfg.num_data;
>   	u8 val;
>   
> -	link_freq = camss_get_link_freq(&csiphy->subdev.entity, bpp, num_lanes);
> +	link_freq = camss_get_link_freq(csiphy->camss, &csiphy->subdev.entity,

Its redundant to pass csiphy->camss and &csiphy->subdev.entity

Just pass struct camss_csiphy *csiphy once and then extract the pointers 
you need in the routine.

In fact if you line that particular change up as a first patch in this 
series, the overall structure will be neater.

> +					bpp, num_lanes);
>   
>   	if (link_freq < 0) {
>   		dev_err(csiphy->camss->dev,
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 2123f6388..16ad1c26c 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4619,24 +4619,82 @@ struct media_pad *camss_find_sensor_pad(struct media_entity *entity)
>   	}
>   }
>   
> +/*
> + * camss_is_receiver_subdev - Test whether a subdev is a CAMSS CSI-2 receiver
> + * @camss: CAMSS device
> + * @sd: Subdevice to test
> + *
> + * Return true for a CSIPHY or CSID belonging to @camss, false for anything
> + * else, in particular for the external subdev transmitting to them.
> + */
> +static bool camss_is_receiver_subdev(struct camss *camss,
> +				     struct v4l2_subdev *sd)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < camss->res->csiphy_num; i++)
> +		if (sd == &camss->csiphy[i].subdev)
> +			return true;
> +
> +	for (i = 0; i < camss->res->csid_num; i++)
> +		if (sd == &camss->csid[i].subdev)
> +			return true;
> +
> +	return false;
> +}

This seems fine. I wonder how it works with the TPG, probably fine, 
needs testing.

> +/*
> + * camss_find_transmitter_pad - Find the pad of the CSI-2 transmitter
> + * @camss: CAMSS device
> + * @entity: Media entity in the current pipeline
> + *
> + * Walk the pipeline upstream through the CAMSS receiver subdevs and return the
> + * source pad of the first entity that is not one of them: the CSI-2
> + * transmitter driving the SoC.
> + *
> + * Return a pointer to the transmitter media pad or NULL if not found
> + */
> +static struct media_pad *camss_find_transmitter_pad(struct camss *camss,
> +						    struct media_entity *entity)
> +{
> +	struct media_pad *pad;
> +
> +	while (1) {
> +		pad = &entity->pads[0];
> +		if (!(pad->flags & MEDIA_PAD_FL_SINK))
> +			return NULL;
> +
> +		pad = media_pad_remote_pad_first(pad);
> +		if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
> +			return NULL;
> +
> +		entity = pad->entity;
> +
> +		if (!camss_is_receiver_subdev(camss,
> +					      media_entity_to_v4l2_subdev(entity)))

Please fix up that clause a bit so its not spralling multi-line get the 
media_entity one line previous and pass.

> +			return pad;
> +	}
> +}
> +
>   /**
> - * camss_get_link_freq - Get link frequency from sensor
> + * camss_get_link_freq - Get link frequency from the CSI-2 transmitter
> + * @camss: CAMSS device
>    * @entity: Media entity in the current pipeline
>    * @bpp: Number of bits per pixel for the current format
> - * @lanes: Number of lanes in the link to the sensor
> + * @lanes: Number of lanes in the link to the transmitter
>    *
>    * Return link frequency on success or a negative error code otherwise
>    */
> -s64 camss_get_link_freq(struct media_entity *entity, unsigned int bpp,
> -			unsigned int lanes)
> +s64 camss_get_link_freq(struct camss *camss, struct media_entity *entity,
> +			unsigned int bpp, unsigned int lanes)
>   {
> -	struct media_pad *sensor_pad;
> +	struct media_pad *tx_pad;
>   
> -	sensor_pad = camss_find_sensor_pad(entity);
> -	if (!sensor_pad)
> +	tx_pad = camss_find_transmitter_pad(camss, entity);
> +	if (!tx_pad)
>   		return -ENODEV;
>   
> -	return v4l2_get_link_freq(sensor_pad, bpp, 2 * lanes);
> +	return v4l2_get_link_freq(tx_pad, bpp, 2 * lanes);
>   }
>   
>   /*
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
> index 93d691c8a..39ea33e61 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -168,8 +168,8 @@ int camss_enable_clocks(int nclocks, struct camss_clock *clock,
>   			struct device *dev);
>   void camss_disable_clocks(int nclocks, struct camss_clock *clock);
>   struct media_pad *camss_find_sensor_pad(struct media_entity *entity);
> -s64 camss_get_link_freq(struct media_entity *entity, unsigned int bpp,
> -			unsigned int lanes);
> +s64 camss_get_link_freq(struct camss *camss, struct media_entity *entity,
> +			unsigned int bpp, unsigned int lanes);
>   int camss_get_pixel_clock(struct media_entity *entity, u64 *pixel_clock);
>   int camss_pm_domain_on(struct camss *camss, int id);
>   void camss_pm_domain_off(struct camss *camss, int id);

