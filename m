Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793712449;
	b=uvAkXBuOEWyk/mFims3kJoDTEW7FHDQEnpHQs8JoEaAG1/28z2DCwQjsdo8Pnuzx05/z
	 0coeUdK4sb8xX/iD9R7da5g6kYMJN6thK7auCNaMf1Q4Iw/TVStZ7XEWHZxdKZzQw8IxS
	 WDB5euGqjUpeMltX2NeR4RzJ+NzULzO06ugUwWj9N9kpSdOSKm7b3/EwrxBUboCTq2MWA
	 bu2AGujleeiWq4HKnagfSxc89cp/s1XouPUNn1omYi2rtG8yZ33rM56ijQKnKuoRpKfRf
	 vhJk0pICf/amB+K/yWaIC8+ySXfxd106XsWOHLFNS5CCvpATg171Pvg1jfzf7RjNadA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793712449;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=o7EFRwU3C9t44EpOq54u2QVurE4/iG5MM90/J7UPCIk=;
	b=YWASbSeHc5w/rnVFO1i9TrsZnmLqGoY5DwSGY2DlcXlpQiDu2YlSQPkiJFAGlr9ckPaW
	 wFqHSH6/Ec76Va8YWsJQvUedtZSlbeOARevyHgkeaufG4erttUXRi+h937ygsQE16lEx9
	 XIM1ZjQCYjR8yFbi6moApk5bC/FLPwOE0lzbW/cV68kCUe8QaClMSnpulQ1R3HIXxAidA
	 DzJnBDiFWMdPOh32WTRdygq+U3nA9jULNaVw5pUoA0mze39MQmVq8uxmMgt4EzUoXKb8d
	 wBxa3fmw5D4m43n1s+IMMTUTiPzlfRsTdYeSA0XO61lUazPzmWX0eO2Rj36zQnZPBaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=flzvY8jw;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98136606D819
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 13:27:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98136606D819
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=flzvY8jw
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so7137075e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 05:27:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793712447; x=1794317247; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o7EFRwU3C9t44EpOq54u2QVurE4/iG5MM90/J7UPCIk=;
        b=flzvY8jwVF2xozGbYU1fU/xiTUrC7dkQSeNvZXZEk/eGMzEJ+FklvJA1qgP9P+IYO6
         xm6dtC32I7L9+7t8OvQmWF6Sf5iK1t1b/juX9DXkmr5tk7C6gTRcGiQlQOk2+C+q9Anq
         rC15T5v9zFr4KqZTzb5YOCaxzsAZ0XQ10KbpNO8sFdjVhPFskjT7QvIhZDz2i114tMzv
         2NQSwZiz5UeVC0k4VorWpChWDQGrhLqUEK0c0XhbXW9fRJAIoj54izIvziD8ZseUy7/s
         OPtv1id7vn0Rzpb7TG6nzsJsuDc9IIzHehtMpkdzocLycLmd7m4x6V1FbOmt2okPONWq
         w7TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793712447; x=1794317247;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o7EFRwU3C9t44EpOq54u2QVurE4/iG5MM90/J7UPCIk=;
        b=kJms0yO5BuFQ9pwp3A0dA31SC64nyVhHpgKEsVsrT7zxSGiuWg5jAc9mstBIESS4MX
         dOwcFoFTZDwXrXaxtl8mCfJYvpIkEw2LPO08QoWW67Ue+UZsGfElbf9ZgWRYS4MB/UFg
         puXi9HrrpAQDCYImAA8dUUSvtx9JHLiOFhcgueLwzjMOxES1U8erUPdUTechx/GDEszZ
         RB7lR2pgxU3jeFqKP0HuslYrEWGQRdz2PEJ9mLgxbm2QI4O46C1+o6bCZ9VjVSEWIpfq
         VRVDwWEv4d2qV0hLc2u758rfJkPG9FeYQ3nMb87Tvffyeqooj/xhgMUg779K8btSemOS
         tcMQ==
X-Gm-Message-State: APuU4Z+V6jFmB3Z3zXQd96Q3Sr73kZMiSJNcoTIWBznXCYvDCV2Dl2xP
	mt1WqatltPcbW/XthlCdxxxnLhkPbbvPLQAxmDq6iXYvw2fWm24q34b/vIXb
X-Gm-Gg: AYBFou2VcZ7Ogps/DEua3PN3pJd50mioGogBjunzzhV/Nf+WmfrQwmbN6fLlAYH6+FW
	rkFyAMeHhBg16p9bKb/NzAa66Kv3evz5dlKmsF2I88kQaYXkhsSpya0iSAfYBl99utkf/s53+OX
	4LdBhzXvKg7QxgdFICAYEv63L2xVFG6J0uDJOD9v8OsDY+0HB6K/A8yDYyBnhrv8LlXEXF5EXKN
	Jby6DhakYtHQbU9AvscfhrJdYJuRIx6E07fY19qNT/CgXhBJJV8RiIFP8Juo4/RPLjJUYTcWPfi
	J8rjF17S9RmRxSJLiGCpRale8/ADfan9Ysv/bRe7LIbdvnzWQdcgYrnkvGVxbGPCQs1oUidoX3n
	GOObEIscnC4Dsfh/daRlps/gs7bnIym5I0x+I9Gd4eDisS64XB/Sd38l0Um2xgZc/BiW9s3+Kd2
	YXYjY3Z8BIXtJS76zSjsJ2pR4Znitpe2VBGrYGxNO4BfDmkW9rrcviGt91tXs/zFJ8dDfPqyAKi
	et5o3PJiREgq2QDRIt85WlFcRhvinM4Fimrv2JsUMC23qsu8e2vvvD7PMe4Uax4aA9al2//ZYiK
	BoXfFbGXuOST2+Bv+Q78314GhGA8jLbvje/XNSroe5PJwjaXSGrSgLW1bEjODNshYAIHzoLxsWl
	cCNiLMsQaww==
X-Received: by 2002:a05:600c:5246:b0:4a2:1960:6fa with SMTP id 5b1f17b1804b1-4ac16acd947mr312817415e9.4.1793712446545;
        Tue, 03 Nov 2026 05:27:26 -0800 (PST)
Received: from ?IPV6:2001:b07:2ec:601d:4b26:1672:75c7:805a? ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2ab010a66sm81672285e9.13.2026.11.03.05.27.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 05:27:24 -0800 (PST)
Message-ID: <40178c7a-8a2f-45e0-9afc-a54732082abd@gmail.com>
Date: Tue, 3 Nov 2026 14:27:22 +0100
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
Subject: Re: [PATCH v2 3/4] drm/msm/debugfs: Use cleanup.h for gpu state dump
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
References: <20261102190010.720443-1-robin.clark@oss.qualcomm.com>
 <20261102190010.720443-4-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
In-Reply-To: <20261102190010.720443-4-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/2/26 8:00 PM, Rob Clark wrote:
> We need to move the gpu lock around a bit for the next patch.  Use
> scoped_guard/etc so we don't have to make the error path handling more
> complicated.
>
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/msm_debugfs.c | 31 ++++++++++++-------------------
>   1 file changed, 12 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
> index f12701e286ec..aa59b28a3392 100644
> --- a/drivers/gpu/drm/msm/msm_debugfs.c
> +++ b/drivers/gpu/drm/msm/msm_debugfs.c
> @@ -70,43 +70,36 @@ static int msm_gpu_open(struct inode *inode, struct file *file)
>   	struct drm_device *dev = inode->i_private;
>   	struct msm_drm_private *priv = dev->dev_private;
>   	struct msm_gpu *gpu = priv->gpu;
> -	struct msm_gpu_show_priv *show_priv;
>   	int ret;
>   
>   	if (!gpu || !gpu->funcs->gpu_state_get)
>   		return -ENODEV;
>   
> -	show_priv = kmalloc_obj(*show_priv);
> +	struct msm_gpu_show_priv *show_priv __free(kfree)
> +		= kmalloc_obj(*show_priv);
>   	if (!show_priv)
>   		return -ENOMEM;
>   
> -	ret = mutex_lock_interruptible(&gpu->lock);
> -	if (ret)
> -		goto free_priv;
> -
> -	pm_runtime_get_sync(&gpu->pdev->dev);
> -	msm_gpu_hw_init(gpu);
> -	show_priv->state = gpu->funcs->gpu_state_get(gpu);
> -	pm_runtime_put_sync(&gpu->pdev->dev);
> -
> -	mutex_unlock(&gpu->lock);
> +	scoped_guard (pm_runtime_active, &gpu->pdev->dev) {
> +		scoped_cond_guard (mutex_intr, return -EINTR, &gpu->lock) {
> +			msm_gpu_hw_init(gpu);
> +			show_priv->state = gpu->funcs->gpu_state_get(gpu);
> +		}
> +	}
>   
>   	if (IS_ERR(show_priv->state)) {
> -		ret = PTR_ERR(show_priv->state);
> -		goto free_priv;
> +		return PTR_ERR(show_priv->state);
>   	}
>   
>   	show_priv->dev = dev;
>   
>   	ret = single_open(file, msm_gpu_show, show_priv);
>   	if (ret)
> -		goto free_priv;
> +		return ret;
>   
> -	return 0;
> +	retain_and_null_ptr(show_priv);
>   
> -free_priv:
> -	kfree(show_priv);
> -	return ret;
> +	return 0;
>   }
>   
>   static const struct file_operations msm_gpu_fops = {

Reviewed-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>

Best regards,
-- 
Anna Maniscalco <anna.maniscalco2000@gmail.com>

