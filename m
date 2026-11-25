Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795608511;
	b=4aTlGtMeBzXIBK9sPBliGIOkKBEhsnEze2Greunswph3A6hGhYYNt97qaW5VZnvP2DVr
	 xtjlJmq8vfd8SeG49iuRLmzs+QoS5PT1ATIbzIA4h99RsQy0IymsHanpwnkRHxrB8iTTM
	 IaH3NGF/lYfOEMHeXTbv8csiUw2IYeP8nUnE6VTTPbxpHFtGx1P1bwdX5bsKCDeNxvF3F
	 5jXVK3W4IKGfhBGPxgZnxEWE1EFJkyVTelPRurpWzMiAs+vNYqReu+1kHL6uQVDWbFgoB
	 I4iSLmTBeJUjsA8ENTUJZqn1kggeaSxmmbKFXtE4XMCC75Bqa4iLSkfC/Dl3Ih6b0uQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795608511;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:
	 Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=A52KNemyd1lh3piMmkcLWrwLaiXp9XsA8b/MHTMptd4=;
	b=XrhLW+ixYj3Ztn1m0qRLoTJTW7e5H7DX8lqk6ar4lOKl0iuImsAROP8pO2ckG+JbHt8n
	 E4ldBkYlBsur9IAiULZxwNNZN0FF6dTW+bpwbKgivZUe/A3fsKbhA8XtVK6rAI2vkZ+rU
	 DhR7WdmuxJDyB85ep5I5jpiydYUc79RfRYJT9laYpbkPpI9g2FtK6vvDNeQOlWFfB838a
	 heABV4/YpjkTJRCRzW65trESilzL1x1huFNAptn+PZpTNBo8W6Ztfhb4jAuznCzOVPC3Q
	 Djl2CF3uNqt1ydWJePdqfvtf5OOXnGls6QaTEuFJEI/icMfdS7MetjoQufen8oPvTZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ivfm1BHV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QGS1tGjg;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828F0606A31E
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 12:08:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 828F0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ivfm1BHV;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QGS1tGjg
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9ml8j3611447
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 12:08:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A52KNemyd1lh3piMmkcLWrwLaiXp9XsA8b/MHTMptd4=; b=Ivfm1BHVPxURJ6yV
	Orc5orEenCkxgRcTQcovJR3CPHAujhR+fg5bRYSrk5NgPFw+fhoUN+ZHlSiaGUeV
	PbGqgQG9CacghHgQ3AY2HAx4jS2sFs/o3/NRnn8AU4+l8bx99T0O9l+yYvE8Ltka
	c3k7Nun3bxfcCbP4lq8Ycly/Yd86R6L++NcYjphAfZG+eXUTKPQAvHirrAw2WktJ
	ByKG5ViYXYzxp3j4h6bVSQ8VQDjUXiikOCGyf07M+a1LfRGcdYFu24K8l9WYy4jJ
	OfIc2cYsS1WRLCKW2dzt1DBFTZBDp9gUrnEcT6bFObMUXr17ss9oP9gB0pT45h0S
	8vxELA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5gnsbhex-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 12:08:30 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f26dd2165so1406445385a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 04:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795608509; x=1796213309; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A52KNemyd1lh3piMmkcLWrwLaiXp9XsA8b/MHTMptd4=;
        b=QGS1tGjgF8DnFVcBnFE37ko8j9xxWSnV5svzUKRxUZsnTBvHoIcU6763YZm28m2xgm
         g66scvjCL5lfBptRmrBH3vfMu44mIfXSKpp3pqEutI7bUkl6sb+rfg6ZX5V6Ex5qbsEO
         RIPUWie2QfvQ2VNDHgXcTRqP32P8Hl8d1U7CUhWs6yEXjsCRMcyPm6QDTm8sZgKhwny5
         YLf60YFnZcSH9CKw9BYa3IQ5Cnni/zKj3CCPEJofERFOMM8YzxUI0UfZjs6vNSZP9j+r
         JH1NSK9Qvk69AuctKTym9Guql2bGGa7lsgJ/tTUpQbf8ab6SkNjaRJscP/IZWcSwBJLv
         +s5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795608509; x=1796213309;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A52KNemyd1lh3piMmkcLWrwLaiXp9XsA8b/MHTMptd4=;
        b=PQcObs4EdcblQ13Kf8pGTMU180TY0Fu+cNQypT8CJbgzyn8WNi9LWD5LiKMDTrijod
         VjWZfWv/QZtW2LIbAb8eh/vORbSIaZ/nJn/BETiOcRLLtUNHRilrQ89EoYqFo04TVFjq
         fmxK6FAHCDSjbnvHnbleuRkl4UheHAzb5wtQaP//RH3kpEI6ZgKCXhNzcVC/CHeVQpCD
         fYawiRkYxjZxWhrxgg/uTyGdWkX8neSm5SUWx7nGZwCbU5zpBWM9EmHLwupsKN/uKgk7
         DqoyfBzheN0DjC0z1GsYyiV1m6peRAnGdkdjBcZQV/VUmxlZi7QAwAU/AxUCLZTrcCQq
         LYJA==
X-Forwarded-Encrypted: i=1; AL+hErHxksDUzKuUo0Fu7xxva3GMvquYxEGXiPTS+rpaW6cAuwx/RR+Ix0Gl2TwLAkHPqcdOyKXzbxOFNwwPhIEE@vger.kernel.org
X-Gm-Message-State: APuU4Z8riSOvR1PpoX1TKk9cYmRgRxfdCZ9U0Cj/+jWNR/MqZ+eocQon
	D+jGWH+JE4YW0IoLG6r0HONCYBxohIkTubH11yp1yYWIRKsvk20Bi3ZrdU1zJcqtSpKZ8Si0h4i
	SlWCj1HP311USfcBW0reBoBRpBQxRZXk86T9c0YG9iUWGd5BU3LB/+ozCajovjbapMtRV
X-Gm-Gg: AZFdTZcGq62XlUY/6cXqtOmeP4jtrZRZQ9JFMbmIhRYpxQsoiy9+fObtUbMIulp8hJj
	q+zWYJ1bCYtWuK8hiIPvw5qTJ3/DaKNvRNAm+w8qLJQeA+W1iCUvX7f8rydGhyBFJrAIT8GBIN+
	AWGGrw3UniQweC2mJ35U1FLZdYgiMJ/gtVVND4qc07FvAS7N5W9wtmS0CY6k6XDUA4yLTTRr1V+
	uHsK1K2Rv3h3Air1jrDQeSgu87acICQJ2KZ+WmorFJVTJwYP6+656F7EDGnwEJV5SZZzSbInKkq
	vgSteoaxsmJiNor/5kU/QA2TjoTkYpRa58y77erc+TL8sT35gxeml66Pf5VlbKf54j4yBLAb664
	JbEqhsaay1O9PFc0quFBFAFAY1+1w0k5gm/MUtKQbVA/8vn7KfbP/xGFvfOHi4lizLBK6h8wPd7
	EHH82vtuJvnw==
X-Received: by 2002:a05:690c:4d02:b0:8b0:97f5:a858 with SMTP id 00721157ae682-8b520500410mr60654377b3.59.1795608073443;
        Wed, 25 Nov 2026 04:01:13 -0800 (PST)
X-Received: by 2002:a05:690c:4d02:b0:8b0:97f5:a858 with SMTP id 00721157ae682-8b520500410mr60653907b3.59.1795608072387;
        Wed, 25 Nov 2026 04:01:12 -0800 (PST)
Received: from localhost ([120.244.9.31])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b52030df7bsm72480227b3.31.2026.11.25.04.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:01:12 -0800 (PST)
Date: Wed, 25 Nov 2026 07:01:06 -0500
Message-ID: <0daf9fd673e2e4e148a8205c752763c0.guodong.xu@oss.qualcomm.com>
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
To: Ian Rogers <irogers@google.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>
Subject: Re: [PATCH] drm/msm/dp: Return MODE_BAD instead of -EINVAL from
 mode_valid callbacks
In-Reply-To: <20261119171046.1536673-1-irogers@google.com>
References: <20261119171046.1536673-1-irogers@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Proofpoint-GUID: gjj1qQLkISyDWPo5-HKAouVAa34SpaNO
X-Authority-Analysis: v=2.4 cv=G+SJgNk5 c=1 sm=1 tr=0 ts=6b06cfbe cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=r1R2P697X4eI0gH+iewh9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=1XWaLZrsAAAA:8 a=Grc5UNRC2ANbGX2BYm4A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0OCBTYWx0ZWRfX3lOuVm7q8rKX
 fOQMP8hSBOmlaMhcgwim3auMpls1QT5dRgSEjhfIrYyTmuSU5yqXi69xR1IgFJ/apJRRrlAa674
 AxAEnMi8h9e5gfL02TB//7JstHRsLRY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0OCBTYWx0ZWRfX4OvnoLW+NkNU
 N3uNVHYgDd14utSXriM7rmxfOd8vv0C803JgYa6jJZOw/0HUeJ8InvXLjEeCUVobYLZfr9Rg2I0
 BMm2LXArFsD/8aqY/HQL2q6eOu8rjY2wS/xv5S7UepJ7i+yzU0YB/M/uT2zL1wrfmkQoDcVO1HO
 sWaP09Kk72ngeTQJaHcMzcAQFI84AS0Z0Sod4u0p32+uWtlYXnC9zRFFHdlKaWggEw6gUIFvHxg
 SWT9R0aXchV9/J18DwOxoXaxqOSD0RqY17DUJARO0z0Te3H6WjyU13hHEikWESVEWLJKO9nQXYY
 YoAY3Vfu6LcNnkAxvIB1QspC/ZSEcuwlx+hVZkuJg/Sd1nwQ47xnVIxqdKvG+sl62fVDfqpKF4I
 Ic5RXRIkr2apTjjB2U5OzrwyPSnRsuQWbgQNz2XQ9jwioEsBU72DcwzIAc1p2Ok6nZq8J/t5HOM
 u1Qknrv20H3za7YFO+A==
X-Proofpoint-ORIG-GUID: gjj1qQLkISyDWPo5-HKAouVAa34SpaNO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1011 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250048

Hi Ian,

On Thu, 19 Nov 2026 09:10:46 -0800, Ian Rogers wrote:
> msm_dp_display_mode_valid() and msm_edp_bridge_mode_valid() have
> return type enum drm_mode_status, but return -EINVAL (-22) when dp,
> dp->connector, or mode->clock is zero/NULL. If a mode with zero pixel
> clock is validated and pruned, passing -22 to
> drm_get_mode_status_name() computes a negative array index and fires
> WARN_ON().

Thanks for the patch. At this moment, both checks are dead code:
drm_mode_validate_basic() rejects clock == 0 before any bridge
.mode_valid() runs, and dp and dp->connector are set up before a
mode can be validated.

>
> Return MODE_BAD instead of -EINVAL in both callbacks.
>
> Found via Clang -Wassign-enum on an x86_64 allyesconfig build.
> Verified by building drivers/gpu/drm/msm/dp/dp_display.o and dp_drm.o
> with LLVM=1 W=1 (-Werror) and -Wassign-enum; not runtime-tested on
> Qualcomm Snapdragon DP/eDP hardware.
>
> Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
> Fixes: 05d001352733 ("drm/msm/dp: use the eDP bridge ops to validate eDP modes")
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
>  drivers/gpu/drm/msm/dp/dp_drm.c     | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index c0c150e2c575..51649b584573 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -759,7 +759,7 @@ enum drm_mode_status msm_dp_display_mode_valid(struct msm_dp *dp,
>
>  	if (!dp || !mode_pclk_khz || !dp->connector) {

msm_dp_display_mode_valid() is a helper shared across files. None of
the three conditions can be true today, but it may get more callers
in the future, so keeping the check there looks fine to me.

>  		DRM_ERROR("invalid params\n");
> -		return -EINVAL;
> +		return MODE_BAD;

Why not MODE_ERROR? It matches "invalid params" better.

>  	}
>
>  	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
> index c1e4147bfef1..dd4e8426cfe0 100644
> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
> @@ -251,7 +251,7 @@ static enum drm_mode_status msm_edp_bridge_mode_valid(struct drm_bridge *bridge,

This one is a static bridge callback.

>
>  	if (!dp || !mode_pclk_khz || !dp->connector) {

As explained above, none of the three conditions can be true here.
It is dead code.

>  		DRM_ERROR("invalid params\n");
> -		return -EINVAL;
> +		return MODE_BAD;
>  	}

My suggestion is to drop the entire if() check block.

BR,
Guodong

>
>  	if (msm_dp_wide_bus_available(dp))
> -- 
> 2.56.1.708.g77570a6a1d-goog
