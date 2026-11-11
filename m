Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794411559;
	b=AvyPdGJ4+oLzRceAdT8u3FjKzvbTc1SKhf6KNVLa/PcebLTxX8ymVDCSDpcSZZ66BmJf
	 N6Rvp8mXQqkJ1YnG6GutaWF+Q3Z/R9TyLDt3WieAyCXri713ERLEt25PvKzLZu1Mhlqwo
	 SOa+G7AWb/5kYLAndsjhoL3j7/jDzRMcvcmB0mkFaX61XgHDBJgzZjp57XXGteJEuF2L6
	 QMdiGTXC2An5AFhFzN5gds8rRRFDgVKQBfeKtuMSaxiujMKQvcfAh4Z0UMpaMoMkilg5+
	 0n1AbLkzwM08UppkxIFcHzBtv7e2DbD+O8w7bdNKw0hGBf5fGTzS4P0bhBgzRzxgl8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794411559;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Cttqldc4K8HVD1wbRQk87+5y4p5x85/EZZq9nMZ5e98=;
	b=EILX5IMzv4r5EPwj1EItInaN7CbbQPA9fvJON3woVA9eTNp/R/E8QGOIKej/g1pYmhrl
	 LXS2d0jUHVKlcYdgptnx7hoaMbyg2kZ6v2gZ3qx7c7JN5d1zUaRUrl/5w1qWB9KO4XKSB
	 +VnBulaC754/z5vgLVEVCG6mThFeJ7N/aTI+N6DyT/CvPqC4i/QTSxdRPzM/6qXYM1q8A
	 jNEejusrJur0/NG1uexRcS2GdqmonD6wzT8O0BLcBD5/oi0tr/uFpvCZtaBRYyiXfwW7r
	 H+kUHJggEFMIldRspdn/rNZffLVslegrd/VdwLjBHmMuYjl7J1x5NnnhChmnox7FMkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="T/zu0/Tc";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PVUiuliB;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15AD606A324
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 15:39:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C15AD606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T/zu0/Tc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PVUiuliB
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF04U41665571
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 15:39:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Cttqldc4K8HVD1wbRQk87+5y
	4p5x85/EZZq9nMZ5e98=; b=T/zu0/TcsbdQZMVbAApJmyZ17eSXG9ZjSSnv66lO
	mSNFQh9T5HlenITk1F64T8nKjKCK80zlnXjyaj4lXXEuBxTQg9SM/ZE777hno8z4
	7Zvkq2y/oo8VxQLk8WiT5OmZE4XYjWtK0Q6MAZ0GNIRQusfEWIBQDFhCfIK7lXWh
	9hRUYYa8gALDaXY+5+RSCxbx9+OxhI4Bl4qiKf/WgHY6kwQdnN3L6GhPR1l0cvWm
	zJuDM42zdnQwM2nFvz5/QpauMPAEq8INQb0hJQPs17nMe7Ll1EjNEhxNwGc72svT
	ExEY9dUYV7mSr8DU7ua9Q/glhmgIPxpWAza+w5a21XSxqg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvk7pt014-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 15:39:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f62934ef6so750385685a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 07:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794411557; x=1795016357; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Cttqldc4K8HVD1wbRQk87+5y4p5x85/EZZq9nMZ5e98=;
        b=PVUiuliBadUZgtrOLHKVTruWHyS28n8e37ML0T8bURNvgq87M/zcMmibG4E6poxwLX
         d71HGHPS6hrQKzVwiRI+3R2H/ZipYWwTcAcOzYvh7+2iWrcHO8fTnj7I2TuewjogmBLo
         lmgTTw1FVlWKECPMDP98U2oyCJK8AGrlgc4xgeMbGNhpMhv8nk+FgZ1N4KQcd2sMJJuK
         JsDWHAeZuev90b/WhHIF45uTjpsLb/B/+eLubNjNqmKt/WzcPxk5l8NAZvhEttRQeBLu
         /KI39lBDqF6kMe3FoPer5nA+XHfzroFxSronITYIa09QAO9JkrsAKscNZ8BTK7yLCTzz
         xirw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794411557; x=1795016357;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cttqldc4K8HVD1wbRQk87+5y4p5x85/EZZq9nMZ5e98=;
        b=Qewmrdpq8nUELv7KsfjUHjM9WZLzNz2LIDUrm7ZKUXYnrUO4RckeevhjRiMs+eUbZb
         M2s8fW6/1JKN8MckeFZtERC94+/GzpvrAKN1EpRRiY/jWyMQmVs8GhwtwJe5BNFYVtgR
         FzFD+1WWEIU74YzMQj206mR6KoEvqj/U6n8NiRKzsM8Rt/T+24QTPxA9SIjqbzQO3Ard
         gbIDE0RbQ6LympBrUGRWJkzkQfXEBhNxQMR1JYp3KqEntWRvLOT9otYFbJUpix+EiYYT
         r+SagtMDh4DTcU8iO1R1cE0gSWmYnqV4stdD6ClIuf7S2a0qkelZCgo9tuj+b014FkWq
         1Cfg==
X-Forwarded-Encrypted: i=1; AL+hErFNYmFSFFDbTcEs1p0ACEwYYwoJueMtYLhEuD5BaeK7LP4pCY7Jqyn+oCJHo59Ry7+cVnbB3Mh6iI3xduYr@vger.kernel.org
X-Gm-Message-State: APuU4Z+P7R+eBXU07k9284ATk7xJY66IPdNO6FB7lB/CS7PFhI7NNUur
	hGYfuNmwZ90RAZuvm0uI900rrMEjbZF038HJrzRh2OtWrXooVi3qQOaa7UHHYnSofIqsrsp0cAy
	dFUFYRrCcjaCfai9riNwSQiV2JaADSfTZTuuVhgF2uWv2IMfLa71UofmM44gVMLpEaQJx
X-Gm-Gg: AYBFou2lK+Kjwz/dxi/xZi2kCttV9fTrytU0N5DCmOynakWKoXtU8sfA12qLGRjp8eN
	G6N9tX5z2QQNEL+WcqO19bM/zy4FD7ov0aEanhxyVGaxA6YUuVM5wTtohiU4lmlkZ00n+7oKaUS
	nxAhNk8xi21ny4uzFBVvusPEOy3D//+x7+oJFeblBdt0OZf6ui5n41YOJYGkC/TmEVrwUKhdv+7
	3fkrifClbYP4poCmqv/8i8SJWCe+ath68QFFOvdEhWGq+HguN9RXIFNc6g+SlOvW1I1LgCrfSoq
	rzlJ+kHwIbsS85DbxZ5IghFtlhLYgl49+WHEPJKvfteTbYBBOd20rhGE+jHQY9wHSQHPk1b9QuY
	Mh5H1DHsgV/gB+jTfTnOkaZN7ousYIb2q/kmnkX7OOSCgYYRzGaYUeoaWKlRJJQBM6Cz0Gmp1vH
	pbhujH/r18lP0ng9VYJwYIbPkfJsS78Md5ujpDzdfyjiwL2qDti59aLybHjMzgFg==
X-Received: by 2002:a05:620a:2852:b0:93e:d1d0:67f with SMTP id af79cd13be357-947b0075f66mr381266685a.51.1794411556861;
        Wed, 11 Nov 2026 07:39:16 -0800 (PST)
X-Received: by 2002:a05:620a:2852:b0:93e:d1d0:67f with SMTP id af79cd13be357-947b0075f66mr381261685a.51.1794411556305;
        Wed, 11 Nov 2026 07:39:16 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae091739edsm11782131fa.1.2026.11.11.07.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 07:39:15 -0800 (PST)
Date: Wed, 11 Nov 2026 17:39:13 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Michael McAllister <me@michaelmcallister.org>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm: avoid an unmatched fbdev IOVA pin
Message-ID: <isnqaepemtnbo7lejjsuk46wkfentboedqk5tb6lhe6ju5anrx@2qrdrgd5tb7b>
References: <179424371125.96483.2462884435294600442.msm-fbdev-pin-leak@michaelmcallister.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179424371125.96483.2462884435294600442.msm-fbdev-pin-leak@michaelmcallister.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2MiBTYWx0ZWRfXyJoORbNH3Xqg
 nFjAZZ5hKA/Fg2TZpbP/IVzLmTfoC/h6GFXafnUk9ntkIl3ICZU4phvbIjvPc93ABdBS02J0oKk
 PgENkV2OWAF0T2NgHCgm2u/PIjuWzHk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2MiBTYWx0ZWRfX3SsLXJLhS+8I
 2cU5l83riST+yq5HA0dYC0eVSx4qATEKeBq9dy5kkIJigN7R0MCSJTf0oI4BpOvpATHGIOCPSJW
 ID8WIGieIrXEvGSOeNK2fOE0FJj20tNIFPlpv8mFtjYnlUSu9t14nwhrxEZSFNrrFFmoslTwdL7
 aO5XJG9Qjuuu1STZLPgffhwbquGwisksIJrZMiBse9xOLf2vKdTKJZ7Yn++smSV8bGMfk5lwuhc
 zA7AAi14KpTDRw8hArtlPJ5v05xI4rZBK4ZQR6qEJ4hxRoqFQabVKC1wDpJqtecmAk3mnIrwO0s
 BvrKxrIHAVgk/hQhMDGjRGNe0m6Q/5aEoSnp8FlxkbsS7c+W4Mo5Io1sLZLLFGe4p6YH3TTp85i
 nrrYmiI0MfMll10Msmo844l64XWk3wzPj8nXH69/PYaALIj+ugJoBs6NpqyWSmDcMDPs9rGrTPn
 VZ8PZeaAMuG+9dI9giQ==
X-Proofpoint-GUID: LXf6N_ODYOlUfazx7GtBL6uY_7Ekr7ep
X-Proofpoint-ORIG-GUID: LXf6N_ODYOlUfazx7GtBL6uY_7Ekr7ep
X-Authority-Analysis: v=2.4 cv=BpcIUoX5 c=1 sm=1 tr=0 ts=6af48c25 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=JwJ85b4fAAAA:8
 a=9Vp39pDZEKLU9gGmolAA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=qg2vb7sgHZQYDKbllo_a:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110062

On Mon, Nov 09, 2026 at 05:01:51PM +0000, Michael McAllister wrote:
> Unbinding the display on the Moto G10 produces a pin-count warning when
> the console framebuffer is freed. The fbdev probe takes an IOVA pin,
> but normal teardown never drops it.
> 

I'd say, it suggests that the teardown path must be fixed instead.

> Use msm_gem_get_iova() to reserve the address without taking that extra
> pin. Scanout already pins the buffer while it is in use, and the CPU
> mapping holds its own pin. Drop the matching unpin from the error path.
> 
> Fixes: 7ad0e8cf6317 ("drm/msm: Count how many times iova memory is pinned")
> Signed-off-by: Michael McAllister <me@michaelmcallister.org>
> ---
> Hi,
> 
> I found another pin-count warning while testing display teardown on the
> Moto G10. This one is in fbdev: it takes a pin when creating the console
> framebuffer, but doesn't drop it when the framebuffer is freed.
> 
> I tested this alongside the other display fixes on 7.2.9, including
> unbind/rebind with the compositor stopped. It is independent of the DSI
> command-buffer fix I sent earlier.
> 
> Thanks,
> Michael
> 
>  drivers/gpu/drm/msm/msm_fbdev.c | 13 ++++---------
>  1 file changed, 4 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_fbdev.c b/drivers/gpu/drm/msm/msm_fbdev.c
> index dd6d6c507d..c3bec6719c 100644
> --- a/drivers/gpu/drm/msm/msm_fbdev.c
> +++ b/drivers/gpu/drm/msm/msm_fbdev.c
> @@ -137,12 +137,8 @@ int msm_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
>  		goto err_drm_gem_handle_delete;
>  	}
>  
> -	/*
> -	 * NOTE: if we can be guaranteed to be able to map buffer
> -	 * in panic (ie. lock-safe, etc) we could avoid pinning the
> -	 * buffer now:
> -	 */
> -	ret = msm_gem_get_and_pin_iova(bo, priv->kms->vm, &paddr);
> +	/* Scanout pins the buffer; only reserve its address here. */
> +	ret = msm_gem_get_iova(bo, priv->kms->vm, &paddr);
>  	if (ret) {
>  		drm_err(dev, "failed to get buffer obj iova: %d\n", ret);
>  		goto err_drm_client_buffer_delete;
> @@ -162,7 +158,7 @@ int msm_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
>  	fbi->screen_buffer = msm_gem_get_vaddr(bo);
>  	if (IS_ERR(fbi->screen_buffer)) {
>  		ret = PTR_ERR(fbi->screen_buffer);
> -		goto err_msm_gem_unpin;
> +		goto err_msm_gem_vma_put;
>  	}
>  	fbi->screen_size = bo->size;
>  	fbi->fix.smem_start = paddr;
> @@ -179,8 +175,7 @@ int msm_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
>  
>  	return 0;
>  
> -err_msm_gem_unpin:
> -	msm_gem_unpin_iova(bo, priv->kms->vm);
> +err_msm_gem_vma_put:
>  	msm_gem_vma_put(bo);
>  err_drm_client_buffer_delete:
>  	drm_client_buffer_delete(buffer);
> 
> base-commit: 1e59855738454b14021b64115f0090eafc7526ae
> -- 
> 2.39.5
> 

-- 
With best wishes
Dmitry
