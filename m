Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794583984;
	b=kl1Z63BdKmPdVZ0W7ZZOOVSm2+cEbC5tY0HnfBO02OdiWwlsMt5rrC4Vy6jFa6otsYmu
	 Gh9Iiwm41hVxL8LzobWNzcLwN8z9b0FtqO25QD2Nsj4xSEqjXZW5hS5Ed9GzlvQHl23m9
	 RGU17PLnFfm1EfZCGtR5v7MXjfF2L4d4KravTLEbdUnpWTnimiXpapgmheKwF3w7HyfK3
	 73gXyJJ2QUhSTaz4J9KIZURyDydW0HWZ5DnJVDMbWhiUMb9igMqeCpi8qmHmsXpHhCHdd
	 cHyqRRGA5WgAO3W75SGNicU4Yth9TSNFBwwLIZF5A818T6ZBX3PFu5mWzKlQSg8Ypiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794583984;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=ZczA9sgPjaI7i0jiqSjl5uIsFc87U1KMYtOFZr38zvc=;
	b=BdSLQ4v0LijpM3u/30DvoSaXOqypIqCFbRf9UPbajCE/BvtO3VY8zW20g2dTi25PaRYS
	 +hq2ozhvV6ZKzfkBGerYtFIKd6DLVYEvS81j3UY2FvR2llz3XzWsfD3aYszSlTg+kH/VN
	 mShxcyrOzSR9wtNandteDgkMkAJwXDYAiNT1YwPjeP2U7b1mKjU8YC5dp4j4ZsJyHuASv
	 GUkdqrH4UwxE1Htj4cR1N39asG1vUp+U+4l2/yQG0yexGopYwFgz70cepCJX/pnIYf3V3
	 5MqZTewpJiHd/xhpaShfINRK/tkvlVU7BkhPa3xv9mJqA2PK7W+7zgdFexxHBeBAj8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=sxafsgr9;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6FE3606A327
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 15:33:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6FE3606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=sxafsgr9
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4b7252a32c8so17445905e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 07:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794583982; x=1795188782; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZczA9sgPjaI7i0jiqSjl5uIsFc87U1KMYtOFZr38zvc=;
        b=sxafsgr9q4WtgV5gGf+FAMXBcr0gPNBz6e4/ZPt9ERGdyxnXLNQbiJkzQVPb9lAp1i
         JKzzXnYbIiA5nGEtvpcTVc1YvAIKP4SjTDd5DqDmgg+i9rC2p3MFO1Hw8P0HZ3EvCzFM
         w5hKtMfXa4xdj1X8btbQyM9qIcJfWEPcS3e8QeojL1AoOON61oyIE3HGrOhTvnYHZrs7
         KZxCN52Lsol1nJNEtLmkxpX8y2Sj++ro04MxVbmcyUSV0xYNjOOnrZ5/tXSURA9fR+Gs
         wPpS+J91oUCjdmfGIksePGdlfiBAl9E2nvYDp5YcFaN2qfhumzat9z/4V/NxnwIMncgc
         M4wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794583982; x=1795188782;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZczA9sgPjaI7i0jiqSjl5uIsFc87U1KMYtOFZr38zvc=;
        b=Ck1Q0tUo5VEEWiIfUAqcqseLGPrJ924f1x0hupzX6D3VyCRS4C1v7Qw946w/KahQoJ
         sihVvPvvSxgicbNeQM1S+bMKZZMjOaeY63oCghkqB48SWO2Wi189o1qVesw//u9CwQeT
         Vmc3l+DAIpoqrgY79+mdl5NC1k8aXzY5in1IKD+ClgVsArvP/vRqUspcmwDqhYy4OLf+
         aTszdYoGMw6RVlPr0c8lpHkDVpVdAKMJn9slJNVvJUf8d+38gRGq0C/1fYsintYYP0TL
         yHl8aYWtbOHqMNOrKR3WNZIcx8H+4G6WNbH5YdEPSbE8oSu4sY5BxVr8WxeaKdRHiUIm
         73nQ==
X-Forwarded-Encrypted: i=1; AL+hErHS21Cv1BDW8mkqgzBEq0Rw8K1sl57T8q4TYJ98ZCDMtjocLxvf9ZJaMrsBUhAGxAbw4SEpdIkZ54qfex+e@vger.kernel.org
X-Gm-Message-State: APuU4Z/6LXJWx30Na+1s1cBFtUmQ/n0gVungyi4IP/7TyzZ8x3YnOiE4
	zgVszG49oRJoUmzDNd7+Fh2lY4vEbGmM7U77xIc1d7zqH3Q4ABesh7Gw/RGDeDya9qE=
X-Gm-Gg: AYBFou2LyWBTFlsGROMluA84GirTpcKoYt93WZY7AboPu2Dy6K0Dj+NLoPr4LAuA0od
	wxl/6R3cynLqRP0U17vxCmKDhSBkNyhrPwoHK7n1VCxqu07s/BXePEPeYrVeo6KugiekR6LC9cd
	O4fo56PIZo88snVvzvWiLz5ysUSAsWq5irM4aAh1rkvJkxv0Hsky015ghIBei9KQEZseURB7/mV
	jkjxl5yZ7LxX0+UgXzqzrUUnKBJPD2edm+SHMuKgrbZqHoHy6rBfZ16PGW/hmkvx745Pbf4jQii
	Oc5YBImT229Yo/GCbUxjFjYMdcOoamaNvSN4qr35iNK4gapNZFeMTS5VmqjdkYCLqNxZt97K3vl
	GLf3dRQ3sLg+bGlh0hTP84Kob9FHQWotnqb03JNIZfz2adu18rL2ahpR6MIeTH/eW0V4l8Wlm4L
	dZ1LdD9pPnUr/mjcTYLxldWT8JrthKppJ4CCNdECfU3t35fIGwRyk5j8YTKWHuYF15cjnTzBl1X
	Bd26J70EKbb5uRRgMbpeCr/gqsQYndH5fJ6u1DeD/8ujuDdS7jTb/t4S/sO7R6rmVhGuEdSq+XL
	OMIMDPs1HhDa+Y7wcDJK5XICOZpSNwIYOTqRRnA=
X-Received: by 2002:a05:600c:8509:b0:4a6:4d6b:a840 with SMTP id 5b1f17b1804b1-4bb55ab74fdmr55626085e9.31.1794583982026;
        Fri, 13 Nov 2026 07:33:02 -0800 (PST)
Received: from [192.168.0.167] ([51.37.10.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5b4a3fcdsm33490835e9.0.2026.11.13.07.33.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 07:33:00 -0800 (PST)
Message-ID: <2392b6bf-d1af-4fba-84d2-e8e60b7dcecf@linaro.org>
Date: Fri, 13 Nov 2026 15:33:00 +0000
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
Subject: Re: [PATCH 1/2] media: qcom: iris: venc: keep the crop rectangle in
 visible resolution space
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Wangao Wang <wangao.wang@oss.qualcomm.com>,
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261112-iris-fixes-v1-0-22b759c3c285@oss.qualcomm.com>
 <20261112-iris-fixes-v1-1-22b759c3c285@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261112-iris-fixes-v1-1-22b759c3c285@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/11/2026 16:15, Loic Poulain wrote:
> The encoder keeps two source resolutions. inst->fmt_src holds the padded
> buffer geometry handed to userspace, with width aligned to 128 and height
> to 32. enc_raw_width and enc_raw_height hold the visible resolution sent
> to the firmware as HFI_PROP_RAW_RESOLUTION.
> 
> inst->crop must use the visible resolution, because
> iris_hfi_gen2_set_crop_offsets() computes
> 
> 	bottom_offset = inst->enc_raw_height - inst->crop.height;
> 
> iris_venc_s_fmt_input() seeded inst->crop from the padded fmt_src instead,
> so any height that is not a multiple of 32 underflows. 

I think this explains the bug enough TBH.

<snip>For 1280x720,
> crop.height becomes 736 and bottom_offset becomes 0xfffffff0. The two
> offsets share one payload word, so the right offset is corrupted too.
> 
> iris_venc_s_fmt_output() compared the requested coded size against
> fmt_src, so a plain 1280x720 session looked like a 736 -> 720 downscale.
> Seed fmt_dst from the visible size. The encoder does not use fmt_dst for
> stride programming.
> 
> Seeding fmt_dst from the visible size also means the codec alignment has
> to be applied on every path and not only when scaling, so that the
> CAPTURE queue keeps reporting the coded size. For 1920x1080 that is 1088,
> and the firmware signals the visible 1080 with SPS frame cropping.
</snip>

> Report CROP_BOUNDS and CROP_DEFAULT from enc_raw_*, so the bounds match
> the real source frame.

> G_FMT is left as is. For contiguous NV12 pix_mp.height is the only way to
> report the vertical luma padding, and the hardware is programmed with
> scanline_y = ALIGN(h, 32).

>    v4l2-ctl -d /dev/video1 \
>        --set-fmt-video-out=width=1280,height=720,pixelformat=NV12 \
>        --get-selection-output=target=crop
> 
> Before:
> 
>    Selection Video Output: crop, Left 0, Top 0, Width 1280, Height 736
> 
> After:
> 
>    Selection Video Output: crop, Left 0, Top 0, Width 1280, Height 720

Nice.

> Fixes: d9967fa37ca9 ("media: qcom: iris: Improve format alignment for encoder")
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_venc.c | 20 ++++++++++++--------
>   drivers/media/platform/qcom/iris/iris_vidc.c |  4 ++--
>   2 files changed, 14 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
> index 2f2c56bf9122c73e10e86815b1aa5fad99b0fb42..b367367ac2ccf874a00606b8b1352fed37b37a57 100644
> --- a/drivers/media/platform/qcom/iris/iris_venc.c
> +++ b/drivers/media/platform/qcom/iris/iris_venc.c
> @@ -240,14 +240,18 @@ static int iris_venc_s_fmt_output(struct iris_inst *inst, struct v4l2_format *f)
>   	 * If output format size != input format size,
>   	 * it is considered a scaling case,
>   	 * and the scaled size needs to be saved.
> +	 * Compare against the visible source resolution.
>   	 */
> -	if (f->fmt.pix_mp.width != inst->fmt_src->fmt.pix_mp.width ||
> -	    f->fmt.pix_mp.height != inst->fmt_src->fmt.pix_mp.height) {
> +	if (f->fmt.pix_mp.width != inst->enc_raw_width ||
> +	    f->fmt.pix_mp.height != inst->enc_raw_height) {
>   		inst->enc_scale_width = f->fmt.pix_mp.width;
>   		inst->enc_scale_height = f->fmt.pix_mp.height;
> -		fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, codec_align);
> -		fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, codec_align);
>   	}
> +
> +	/* The CAPTURE queue reports the coded size, in whole macroblocks. */
> +	fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, codec_align);
> +	fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, codec_align);
> +
>   	fmt->fmt.pix_mp.num_planes = 1;
>   	fmt->fmt.pix_mp.plane_fmt[0].bytesperline = 0;
>   	fmt->fmt.pix_mp.plane_fmt[0].sizeimage = iris_get_buffer_size(inst, BUF_OUTPUT);
> @@ -293,8 +297,8 @@ static int iris_venc_s_fmt_input(struct iris_inst *inst, struct v4l2_format *f)
>   	fmt->fmt.pix_mp.quantization = f->fmt.pix_mp.quantization;
>   
>   	output_fmt = inst->fmt_dst;
> -	output_fmt->fmt.pix_mp.width = fmt->fmt.pix_mp.width;
> -	output_fmt->fmt.pix_mp.height = fmt->fmt.pix_mp.height;
> +	output_fmt->fmt.pix_mp.width = f->fmt.pix_mp.width;
> +	output_fmt->fmt.pix_mp.height = f->fmt.pix_mp.height;
>   	output_fmt->fmt.pix_mp.colorspace = fmt->fmt.pix_mp.colorspace;
>   	output_fmt->fmt.pix_mp.xfer_func = fmt->fmt.pix_mp.xfer_func;
>   	output_fmt->fmt.pix_mp.ycbcr_enc = fmt->fmt.pix_mp.ycbcr_enc;
> @@ -312,8 +316,8 @@ static int iris_venc_s_fmt_input(struct iris_inst *inst, struct v4l2_format *f)
>   	    f->fmt.pix_mp.height != inst->crop.height) {
>   		inst->crop.top = 0;
>   		inst->crop.left = 0;
> -		inst->crop.width = fmt->fmt.pix_mp.width;
> -		inst->crop.height = fmt->fmt.pix_mp.height;
> +		inst->crop.width = f->fmt.pix_mp.width;
> +		inst->crop.height = f->fmt.pix_mp.height;
>   
>   		iris_venc_s_fmt_output(inst, output_fmt);
>   	}
> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
> index 05aab6e3005d5c3788f5dfe5857f2d6b782e7a83..e3eaec1b7c2e30c065d8419ac3278756f70a8a97 100644
> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
> @@ -522,8 +522,8 @@ static int iris_g_selection(struct file *filp, void *fh, struct v4l2_selection *
>   		switch (s->target) {
>   		case V4L2_SEL_TGT_CROP_BOUNDS:
>   		case V4L2_SEL_TGT_CROP_DEFAULT:
> -			s->r.width = inst->fmt_src->fmt.pix_mp.width;
> -			s->r.height = inst->fmt_src->fmt.pix_mp.height;
> +			s->r.width = inst->enc_raw_width;
> +			s->r.height = inst->enc_raw_height;
>   			break;
>   		case V4L2_SEL_TGT_CROP:
>   			s->r.width = inst->crop.width;
> 

Could crop and scaling go into separate patches ? Feels like it could be 
made more granular.

---
bod
