Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3CA04F472F
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 16:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790697919; cv=none; b=r4R/r+cvYrtTkZxf6v+wkZccF985tFL08YvYIQZljIbmlz/S+3o1WXDecdYQ5KahDN02Shk2lh/DwQ/CMd2oaIVMo9F5NgYmAuGD5fmyn4bO7WA/7d2x/K5Ag784iH0OQgJ3P9oMvlCiY8gjtcdXoqqQvdKzQKbFaFid2jNLw0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790697919; c=relaxed/simple;
	bh=VRbaTYq0LDvYFPXlaWJ6IR/NPIy2iu3IDxznvtKDrsc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g+H/k4NFW/Yetr/tv+Y0Cb8a6WmShKeLebPhrqRTrudWc372ixWFgAg7PRDMydrEKNcLYGyZFtOTet8lI0PSAm0cuAolOPhfVH0MF8B9T+TGoRw0QFWU5i79GZMiVS7G66/j9A+7R+0l2AQx8sBn0bdLt5fwx0eLnbuYFgMsPhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fah6eOVG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gZYUJumQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fah6eOVG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gZYUJumQ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TE6Qbw130030
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 16:05:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+11nj4pCyBkvkRwYq3yMNaOm
	dTpCQu0BySHcZO9yZcI=; b=Fah6eOVGotweigw9NjDr8Gz12aIenYAuxGzEm9JF
	xOYAXosQHU+xW+snygKr5MRMy28GeKd4BkBz0+vS0lmClIVEGvIKg8uFPlG3CLvr
	FPXMparGnbgIKSaw47Ry5NyQBzsvzK0hbH9QmdSyff5oJCnSjMA17iXl6mPZu3/f
	yjAdCX1/z8HJO2Ml+hsh5zstaEGLrpTFhftoE7SGvUVmRuB6AC4uoPuuwE7cD1NO
	bkZ/PJTAdX143lYiShkD0gH7QRfwmULxB1GB8XAina1MLyGnO/pSO8pn85/QqBJC
	faQKsPPzAt1Gh5fiAt/rFe0Y+jMK3lWFmLl8HYEwgsgFKQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0eswgj86-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 16:05:14 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-98331b577e4so3351835241.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 09:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790697913; x=1791302713; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+11nj4pCyBkvkRwYq3yMNaOmdTpCQu0BySHcZO9yZcI=;
        b=gZYUJumQmBOd5UApELWZCKtJzcz9kK9p3inrJv6Ua75UeDC9MuUmdHTs2vV1EpGz7r
         5yRl2g2argAjRkczQQ5l/8MSk8TQqvvcneVrsY6JLirko28lu/Dhf4f2JnUNpfzu2Y/r
         N8Mt5cE9aTR0HBNYmLyGg3KRe4KXEJiaUVRQ98WstKRd9OsRNldSw4FZAOz921nv71G5
         CuAr/S0vkkE6vyYXqIXJVBqPE92E+yR3YCrczANUpzDQp69maUAKLVLGxgOiqnwmz3zf
         oMT3nJ6rUzPG3Pmavbr6LWNaLFDYjkexe9TuX1aesnyffWIksnEjpjtEMuOnYItWOmt/
         ssNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790697913; x=1791302713;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+11nj4pCyBkvkRwYq3yMNaOmdTpCQu0BySHcZO9yZcI=;
        b=b2oNZYiG5t0E4JjvrVm2oWNmMcMv5bIW5y/XS84kQS2Ob07I3RmWDaxnn7T5gYSF3W
         wIEAx585BA2bniFtDHIcpqB6ULxzUIUaVyuBzrH/oxfpvyDrC1QkCvJJMCosk9S5xytU
         ZpUH0tZOCXQjyPNTdeHgPNEIk30xbQx8SmhK7gstnYClvJA/ikT4wMXeiNIIHyF/Zgh+
         K0TlmQNPmlQpi2lhws6+TPzC/Cxjd/hcOUbTdep2A2R5o7FBgrMogBt5NV+rV/Uy1jHQ
         T/MRFmNjxjgh6uSAgXmqPqnEiRLuKquspjWotMgKffIGeVQgVxIwnNy8Oo8ZvaTFeIf/
         JD/A==
X-Forwarded-Encrypted: i=1; AKwUvBy5i41XmClVcZla2AzMqlwYW88ZJkaYlrY4l7JWwU+m4n1pJyVn/zg+xwvam40gWIjn3NXyQ5O29IK8c3x6@vger.kernel.org
X-Gm-Message-State: AFq9FYLL1qD8EUFZEi0qK6tgYjeAL+TLQwyIuEILB7L6HB/0SLsPpMQs
	KiQx8hINnR6NsuA4LHg/J6a947s9YIDyEOUIR0qBm8rqx1GNGC2OjRwCP0ho3uuHfK9UkyO4Hz5
	c0RIf4+7c0DIB8qtEEqEkgIXtQgMhBS5vFwvBWg8yNfUAAxouDStLAbQpybNgHIWT5C/2
X-Gm-Gg: AYBFou0z7Z3t/Cd/+kZ8bs1H/edChkDwvhPvcqtOrDOkOUc/eHAp3XzGM8V8Cc5rS5S
	Tb2ZuY8peG/3zayryTzS74LKOxe6FL8Q9m9oQ2SVCPn8Ptqh/R+B2AW2hract5xtc02YSGO8ypu
	00HmsEQhXQLWfvS9fyXXwWZ7w3qlFvc01yfw3nF3ZzteVL5npwKrgMyE7A8S6A8Hwclk6crzKMY
	wKtLX5ji8fMSEm6wFVYPjSsVUjb6TvlPKIFEijWXP7wkdOefEkb5dVlZ/aIW8JFEkC1ISQ6k3tA
	4xCqWc51n3FPRoNzIV+rgLDMSzBbQLoXgBU8clniefUb2yAEzyhP9YpLLKLA8sXVUtFLQ7llRGE
	ic2yz0YzJjW8dBeT+lxkmGK6JoLdoYimZCCplJ44fHHhFtScIzMZWlo5SvNU4SPiFAgS4eyxq7m
	lQIc8POOmJHwE4
X-Received: by 2002:a05:6102:f97:b0:7b5:8fd9:27e2 with SMTP id ada2fe7eead31-7b58fd945d2mr2639558137.12.1790697913131;
        Tue, 29 Sep 2026 09:05:13 -0700 (PDT)
X-Received: by 2002:a05:6102:f97:b0:7b5:8fd9:27e2 with SMTP id ada2fe7eead31-7b58fd945d2mr2639538137.12.1790697912513;
        Tue, 29 Sep 2026 09:05:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba3b470ab2sm22486e87.33.2026.09.29.09.05.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 09:05:10 -0700 (PDT)
Date: Tue, 29 Sep 2026 19:05:09 +0300
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
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 3/6] drm/mipi-dsi: Add flag to support dual-panel
 configurations
Message-ID: <gu22hz3dnttzyu2eewpalgzxtocmlbfvnpwore36ufmyr3xtag@r5bbhafsn562>
References: <20260727-sm8650-7-1-bonded-dsi-v5-0-c042266b9eeb@linaro.org>
 <20260727-sm8650-7-1-bonded-dsi-v5-3-c042266b9eeb@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727-sm8650-7-1-bonded-dsi-v5-3-c042266b9eeb@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA2NCBTYWx0ZWRfXzghn9xQ7SgFr
 PEbGj7/V/2mE1P9Ao3x4P2ESx0L0G5/t7CzTppBlvokQXZF6iKFP3hchvv9BHHD6Ga3YcmFD+Se
 dHnM0Ww/GKRlBEWEvIIlGJJjcHedrdd7GXyt3/9gXvY3mV0tB/UwGI98eNTsRs9hkwY+4yDGAUm
 nSbb2K51kE4gLAmdMiu1vlewv5QqBAup25Vi5FTQv336djLRAEeHWf1cmON8rOUoMEE9JPrphtZ
 K1Q4cLOPT1/+TdxMNmQ6kGMvek00VEuzNze8bdfMDnXAlp63nJzklXoE5v33kLTvF0yeopeq44g
 1Dg+DGBh0Qu3++Lo7jPspbu4kxacZxTOK3KoJcFqn+64jF5aqv/Ig0EyCyqvkg+mVkf2gVyzKw6
 AHGxwty/DakCRc7BYqDhPuA05xRF8ybPwRuJmBhMtdFYZizliqAx6vtwSZhytzBqhJgIddY60L7
 xCOVjhEhvwDdfGCHmtw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA2NCBTYWx0ZWRfX8sVgqG75IVVZ
 GZrG4DSO5yw5x65zCgKZzQXYpiA/p/uJ9Qzkx0w9Ar8TMaEjybsj41SFgnygxagE4MV0aH2uo/f
 k1tUYh88WDAdkZ7acgqfrE6w9y9ZNIw=
X-Authority-Analysis: v=2.4 cv=LaWpeTfi c=1 sm=1 tr=0 ts=6abbe1ba cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=KKAkSRfTAAAA:8
 a=JmB1tVOSonE3mgEak7wA:9 a=CjuIK1q_8ugA:10 a=TOPH6uDL9cOC6tEoww4z:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: h9_spdQ8_pT9Pkj4peszGscF_zIGDSGF
X-Proofpoint-ORIG-GUID: h9_spdQ8_pT9Pkj4peszGscF_zIGDSGF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 impostorscore=0 clxscore=1015 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290064

On Mon, Jul 27, 2026 at 04:08:42PM +0800, Jun Nie wrote:
> Some devices treat two independent physical DSI panels as a single
> logical panel from the CRTC's perspective. However, two separate DSI
> hosts are still required to drive the panels individually.
> 
> Introduce a `dual_panel` flag to the `mipi_dsi_device` struct. This
> allows a panel driver to inform the DSI host that it is part of a
> dual-panel setup, enabling the host to coordinate both physical
> displays as one.
> 
> This change does not force individual panel driver to manage
> system-level display topology if the driver does not intended to
> support dual panel topology. Only the driver that set the flag to
> true need to take care of panel topology.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  include/drm/drm_mipi_dsi.h | 2 ++
>  1 file changed, 2 insertions(+)

Do you have a single MIPI DSI device, or are there two independent MIPI
DSI devices? In the latter case, the flag is wrongly placed.

> 
> diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
> index 2ab651a36115d..889ef1421207a 100644
> --- a/include/drm/drm_mipi_dsi.h
> +++ b/include/drm/drm_mipi_dsi.h
> @@ -169,6 +169,7 @@ struct mipi_dsi_device_info {
>   * @host: DSI host for this peripheral
>   * @dev: driver model device node for this peripheral
>   * @attached: the DSI device has been successfully attached
> + * @dual_panel: the DSI device is one instance of dual panel
>   * @name: DSI peripheral chip type
>   * @channel: virtual channel assigned to the peripheral
>   * @format: pixel format for video mode
> @@ -186,6 +187,7 @@ struct mipi_dsi_device {
>  	struct mipi_dsi_host *host;
>  	struct device dev;
>  	bool attached;
> +	bool dual_panel;
>  
>  	char name[DSI_DEV_NAME_SIZE];
>  	unsigned int channel;
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
