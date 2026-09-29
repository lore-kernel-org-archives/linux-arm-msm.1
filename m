Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533383BCD0D
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 16:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790697816; cv=none; b=UlYvxQIYanOYq1ZHJ0bqMFdcV/FvKTjVshhUUY8J5Pyka6FIWkLo4ScmUhgNJ6oBRq1YKcnvLG/I8SuS7ECRdIy8AJX1Xh8CI2GnxjNvXFKpoaoLdDs8wq54pEBY+9vTOx2JYV8FC0gUql0Qf91AevS3CvyI3PPrL/Y7OXeKN6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790697816; c=relaxed/simple;
	bh=GlKKJQ3UYI5AuuEHYTsI0Idha0n9KGmGedO965R2R7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ONDaJvv8S5f7KIjVOANhuM+GmOWKT4tWrEtkQkJzvfK/Cee9iO3yO/r4Bka2ViZUZIzYU4dg5ZMqm0amhVj2VJjILGIKPBwSleabZjD+M8zZATUTk5UnugBTpxDrith4s//GNXhWgf7B/mTKC1WCx8j4WtulG8cIXMz4Wst+KFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OlyTRCL4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P2su0cXp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OlyTRCL4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P2su0cXp"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TE64Xg1649633
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 16:03:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EoSYHQeRQORq80QIQ9nw9GOz
	XyX4Kx5dEh//Fq2RPgs=; b=OlyTRCL49XlblzOllkE8PoSeXe3jS5SpBnpdlZRJ
	XwGGO8WSo+LXfr9Xuzscs77MI1y47R5zUpqFKshC90aMZVTSzi3GgVHk3HD1lC5A
	ZF05nuXV5nuNRMTdAqoEeFMXUCFUtq9x9o8MVCwefXpasBUtQ6L3MIjmYJ7zEPWC
	+AXPD/3Ry03CYE5aEC+DhpTl31qqoG45H/+SkkTPIpcIyX9FJC9jgjJQUq4I3EPV
	DxruumVOT9NALxy9CzSJDIdvSezc3uBjIcRD/nYWd1kITGab7Gg/jb4K+6xG578N
	cBjiOY1Bg8OiPbrgK8p/94yj8PKWbxqOd8depKggfoqufA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0et28hwk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 16:03:33 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c98e907506so1044607e0c.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 09:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790697812; x=1791302612; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EoSYHQeRQORq80QIQ9nw9GOzXyX4Kx5dEh//Fq2RPgs=;
        b=P2su0cXp4X3XPvtcJhftstTubHc3PIbsg+AZJs4XoPDLXCbg4fbbXrL84Slt22VzlS
         1tdVuSrB382SE3eSui96yD7q1IXZn7n48zTPFHgTEHBvMLVlwBSoWs1bcTEcM9l1yHFy
         u3ZxNXE2mOTLxKTFaWHM7wF2Bu0ochAGv+iHqUpSmcvo9Zvmyv1CM6cHLRaxRX58wGzP
         iLABTehO0bkPzyRWGk3N/yzO1V7mrpUy5VOAawGK0XaXMXF9WS4rXKw96Wdhb3HTO8+p
         WMTfnVGzLKIyYSByOdgJoHAhUgoJ31jYijFPLhcj/NJ/5lhLAiHIp+XTD4ZYfzuCdoXZ
         0d2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790697812; x=1791302612;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EoSYHQeRQORq80QIQ9nw9GOzXyX4Kx5dEh//Fq2RPgs=;
        b=QgpiwYYEtnWSPEWG68vOP/KK8aBupg0sWRVLyImrae5VSnBawQ5fMqa33lAoRJhksi
         lEntkYNuCJSXu7Zqtp5b3UB4YMfnbbm7dPiBKhV04DSWvQcrD+YTAK/PUuwAj/57TrY5
         VDQRA6H5Nx2lgyxYucVnrwwVBj8I7jRlCOgMITi4J4Anc5SFuAqfpObYYqdaVyTbjwLT
         TkxtnkTCLpC03/2cYu2dxsX6xE2Rtg/zlcov4iVB+jPySh02d3yIUd+dSKhcZaMi7t8z
         DMsNGM5ZLVw/RPFtMfAUiKO7aRLx75oFR/ZI0I/X9KE3aDvI6AxB1GYQrLZm5nIXMt2D
         OPgg==
X-Forwarded-Encrypted: i=1; AKwUvBzIqkxYF+9BC+PCaBCk7yDmnu7ksDAp+K94I1mIbsZ4G26L1OLTwB65laZ7umR23mUDyHimCQX9Dle5zVsG@vger.kernel.org
X-Gm-Message-State: AFq9FYLn4tf78+1YICk7LSZByvZSjyVNrEkHjo8nk8fFC+PA4ZcZ+3Jj
	CuafB51UkPiPmVpu6bpkALOME8M9cyMK6SxOAzOaVmK1QbmKcZjpjPEryxX5sk25311UXjM29MY
	LwnFWx2zoBALp54f4DNTc4D5AaaI8bJAQ/LaWFPltLY2oVLhmc4jnKWKQR7XU+SNK0Kg9
X-Gm-Gg: AYBFou3WPtLlesDZGUNuxRx11UpnK5j6PPSKnK+6wHRLSaXuQVA0Jmx6it7aFq6kSGR
	wTW96h+8vh+/zK+Dsg7W7uxxVNIwjCyOMCrlcR6rwl/vwpnXd3KFArwpKpIwzcJwm00BGkGmH5m
	MXMdNJrSm2VS/FYgnxjKBk3fWfkRkqGkg24+zPkYWpHCpERIZ+YRAzBJWW2xVvpsFPOSdmKbAJQ
	wT0TOX05+PQMZaNxKqjqVEr8MrfXRhN8QCVblLqsOBEWdGHHHO+GFlWcOuCHI3o8MfyFKxoFV5e
	oatiiYyXoXXbbWwlhWdZiXUXX7IxPprCmTD6GlOOk3VvFuypLQi1IYfewEjy389v2rGAk4TLbnJ
	KL22/q9l68q8JwjmuDv+9obTYL0PlJXdRdjG3upzLadZwq7eM8w0W3ub2UOY7yoFQHYFXwZrkrX
	mJo2353clZHdnh
X-Received: by 2002:a05:6102:2143:b0:7b4:9eba:69dd with SMTP id ada2fe7eead31-7b9514bea49mr650601137.45.1790697812166;
        Tue, 29 Sep 2026 09:03:32 -0700 (PDT)
X-Received: by 2002:a05:6102:2143:b0:7b4:9eba:69dd with SMTP id ada2fe7eead31-7b9514bea49mr650575137.45.1790697811357;
        Tue, 29 Sep 2026 09:03:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba3b30dd50sm31720e87.5.2026.09.29.09.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 09:03:29 -0700 (PDT)
Date: Tue, 29 Sep 2026 19:03:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jonathan Marek <jonathan@marek.ca>
Subject: Re: [PATCH v5 2/6] drm/msm/dsi: support DSC configurations with
 slice_per_pkt > 1
Message-ID: <5r6xd4iiwnv2v5ji7xeddihlqstmtajvw5ixmntlwxxmcvo7y6@zueqflvz3lr5>
References: <20260727-sm8650-7-1-bonded-dsi-v5-0-c042266b9eeb@linaro.org>
 <20260727-sm8650-7-1-bonded-dsi-v5-2-c042266b9eeb@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727-sm8650-7-1-bonded-dsi-v5-2-c042266b9eeb@linaro.org>
X-Proofpoint-GUID: L5VntT4JPaBw3NOpYV2DVbXVehRAo6sM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA2MyBTYWx0ZWRfX/3heoBgPn8Fx
 NzgOHaFduhBPuH46M0y+iackft9fBZhK+YYb/wMv9rITxI439J8C8FjTVfrTV7CXsWqzonAy3uk
 bfveGWds+9lrmDx5pCnQ+a4F0CgSdcn/TTApBgb9jvjOgsnVTALblFe39Picnh4mvYeAhWJClHs
 YS5mBUxtWnRXlE1tOthdRRe8VJwokHM5QiR1DXrP8XPwvysugmuNxHR/dA/7IbxfyOFImhNQHWx
 g7rnQQYbs4J0NqsCTAZJC9tHAFzS5X3TwwjMcLwfoLFGE6jWAtynj1I8q7A8y87BAKlsrQouh2J
 9CyxBAdB0HwVnRgkQN6WRy9r+/l/oUhSF2FkVXl+mZH/GFZ1Rj6kshmKIW8ISUBlMucIUejQ8bG
 e5f87ylYCrQ6sOGUKeYwa4luT3nB6s6UUoxxZJy3lRG43B2AQSWeiVS/e9xxRpLi0mvvAzVFwds
 /TSF/f0QJhlS4SxCpEQ==
X-Authority-Analysis: v=2.4 cv=cokOAF4i c=1 sm=1 tr=0 ts=6abbe155 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=RAbU-raeAAAA:8
 a=KKAkSRfTAAAA:8 a=732f6QRgeebKLVb_Er0A:9 a=CjuIK1q_8ugA:10
 a=tNoRWFLymzeba-QzToBc:22 a=JiizpSU_mAIq9zsZDqn2:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: L5VntT4JPaBw3NOpYV2DVbXVehRAo6sM
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA2MyBTYWx0ZWRfX2EhQlvT5zb0q
 wgnRW9TZo7kZmp5jUQ6vHIZxdXigdDu7mZ9M2ZRAxP2FlfshpBlCar29FUcZOV/snnzcJMuEkLK
 uSgy/d2SC2rZwcTHvAh2bPw1EjRRqls=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 adultscore=0
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290063

On Mon, Jul 27, 2026 at 04:08:41PM +0800, Jun Nie wrote:
> Some panels require multiple slice to be sent in a single DSC packet. And
> this feature is a must for specific panels, such as Sharp ls026b3sa06. Add
> a dsc_slice_per_pkt member into struct drm_dsc_config and support the
> feature in msm mdss driver.
> 
> Co-developed-by: Jonathan Marek <jonathan@marek.ca>
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 27 ++++++++++++---------------
>  include/drm/display/drm_dsc.h      |  7 +++++++
>  2 files changed, 19 insertions(+), 15 deletions(-)
> 
> @@ -1719,8 +1709,14 @@ static int dsi_host_attach(struct mipi_dsi_host *host,
>  	msm_host->lanes = dsi->lanes;
>  	msm_host->format = dsi->format;
>  	msm_host->mode_flags = dsi->mode_flags;
> -	if (dsi->dsc)
> +	if (dsi->dsc) {
>  		msm_host->dsc = dsi->dsc;
> +		/* for backwards compatibility, assume 1 if not set */
> +		msm_host->dsc_slice_per_pkt = dsi->dsc->dsc_slice_per_pkt ?: 1;
> +	} else {
> +		msm_host->dsc = NULL;
> +		msm_host->dsc_slice_per_pkt = 0;
> +	}

Why do you need the else branch? Isn't it already NULL / 0 by default?

>  
>  	if (msm_host->format == MIPI_DSI_FMT_RGB101010) {
>  		if (!msm_dsi_host_version_geq(msm_host, MSM_DSI_VER_MAJOR_6G,
> @@ -1757,6 +1753,7 @@ static int dsi_host_detach(struct mipi_dsi_host *host,
>  	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
>  
>  	dsi_dev_detach(msm_host->pdev);
> +	msm_host->dsc = NULL;

If you are fixing something, it should come as a separate commit.

>  
>  	DBG("id=%d", msm_host->id);
>  
> diff --git a/include/drm/display/drm_dsc.h b/include/drm/display/drm_dsc.h
> index bbbe7438473d3..c522ab3d71853 100644
> --- a/include/drm/display/drm_dsc.h
> +++ b/include/drm/display/drm_dsc.h
> @@ -267,6 +267,13 @@ struct drm_dsc_config {
>  	 * Offset adjustment for second line in Native 4:2:0 mode
>  	 */
>  	u16 second_line_offset_adj;
> +
> +	/**
> +	 * @dsc_slice_per_pkt:
> +	 * Number of DSC slices to be sent in a single packet. This is not
> +	 * part of DSC standard, and only used in some DSI panels so far.
> +	 */
> +	unsigned int dsc_slice_per_pkt;

If it's not a part of the standard, I think, it should not be a part of
drm_dsc_config. In the end, drm_dsc_config is also being used by other
parties, e.g. DP or HDMI. A year ago I saw a version of this patch,
having this field in the struct mipi_dsi_device. I think it's a more
correct place.

-- 
With best wishes
Dmitry
