Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209C648AE1F
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 12:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791808811; cv=none; b=bfnDB+D96JfppDnSPStvizFZmL7Eppyk4OPphEv8NCeoJ9hGo7zmEullJ8hu3oT4LzH3PvLI2H/cSqceuGuWvuPNnB0Xu50uAWLu0h7PE1zpQ5+8zN+MwEqZauOis1HZXXOVeIY2REZrFxTjJ7ksyYeXuL2lywuhHQScBjqHcH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791808811; c=relaxed/simple;
	bh=Bsh7M2zUPNuGiyuSTf7nyrw460zsO4xhYjEIMRWMS3k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SNnPXpIi3nHMOmr1yuRVXCY0H6pQggtNlSYwAN3cBqSA5wOBZtoK/GJeDgQ/ncLIekf0BQUai45sB/OOlMgh8kbHe+h3hcPEs2KleLObqCHz3y3cPEeCubBg95rdRhjk5bv9flpPmThr3ZK6CgDOmcwBL78PKBslSwUJbtx2fp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ByZxy/6J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xb0Udkch; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ByZxy/6J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xb0Udkch"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0KPS3292500
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 12:40:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sxiNADN34Bn3hCov2PhV3feq
	5avacxCrZr/2GuhWpv0=; b=ByZxy/6Js4fHnxneBjxYjCUubPTr79h1A+yP9Pzg
	x8aFZntUDX7xs7KWuK222xsvzmdMQfW+qUbHbQ7CWDCsD1VH4BqX5WJCwW4xbRa9
	tzn64/nsBHpz5T+kfovaDhZhfWmnb992bOu5BpFDyZbKnhFVj8IJdefp+0Kcgqbe
	ffMAraZ80Ib8x+iVMtSeUsM2A8yi5PBa+TzUgUCvCku8Tyx9LeNck9+lHyAooxgq
	2+xteOC7CZgqVi2OYDRFgDASD1WeMIIunxutO27PxlL0FkDEKnruNp3WohNT0D1b
	YCSARZkUwmRC1pugGI3OSCp1uh5waA3k+EK7fw/7ENANUw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8uh3hb5a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 12:40:09 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-936aa34873bso388742585a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 05:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791808808; x=1792413608; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sxiNADN34Bn3hCov2PhV3feq5avacxCrZr/2GuhWpv0=;
        b=Xb0Udkchoma9xm4Ha1Z+xyLmZnsS+OzXAx61uuUKR10U4UnuAVmLtUkG2qNoqWBlaK
         3OmVXjEwGE4xwSEeHuM+ug6QKxufxr39Ynml5XgswEeryEzdWRpCrtEHnYF+Errqk5iH
         vEKUEOoHjnmXm7O8xbyq1zuO/ntlRmgYVmiYJFq8EBSB8JkJ0cGoWyTg9rjTrRX4KOdh
         APRJCuq27aTjnpOBqAakQX9ZZQuW28sOAdCwwY+RTwJH6wDQiSSvKr3LmayUZVha/5KL
         2DD5XcizmUPwUe7rafQ8hJ0xxgBJtqi5oP8prwfN9QpctIPN47CJtcTm/q8AMWjxc7/P
         yerQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791808808; x=1792413608;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sxiNADN34Bn3hCov2PhV3feq5avacxCrZr/2GuhWpv0=;
        b=FWehM23jXf24VU+hMCh3FamvTADeEV3+rMVnk5t3vtwb6z+/N9i85a/Cqxixq5G8pa
         ahjx/j79xONG2K8ZMVf59QWzURAACK+doBc0DPYGzqr/HCP4uwIGSBG/libO7kUI/nbD
         qNqUnVZMO3VNQsy7Q8/CZPxR9QFEjh0BB5ZtuyXpIzv0wN9cKHfrGKkGSBkKPF1C/gZZ
         rdUDv7FPWvkcYrwt/sL/JkoQVGBVcEdPtMRRUc3ZaDrIxUCYk8MhxfxDe8hnaCUJ9NDG
         vBRsqiKTguFZXJzcXUkwl/B7zF9RDUfdCars9Sek0rAD4aWwz987T0BU+RgOr9b6Ji6h
         Mg6g==
X-Forwarded-Encrypted: i=1; AKwUvByFpIaZctSqJfN22oLFaYepOdSwJmEWiEHCF15fsoFRRJIt/upygT/3GLXJAHBxCMlz1tHmbat0lZ8mllYK@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9kFUB6fMdBToST1XVRzcgPYN0gA2O1h6vfBNSEbg1kEnwk/O6
	dbsCXU1sotO6Rmpz4uBBz7BH71b7mPmRTEBt8u8aaN0Pwuo0l1D7gAQi/KpQT62ivAM95pYSTtr
	wS736zeqJ7G3i9lMSTExpwMWQtV0+U+ay1sV5QsS/Nff+2fVdrJ8WdgwaSzTedu8INyan
X-Gm-Gg: AYBFou1ogv7K8ox0MgBNblliT0915Ag8CtJa9ITWz228zY5SwS1FjzIISQlSqTxzuLw
	//I6q9yZ/2DPbmIR3iPmJvExGrtXDg4FR0pzTTQK2HSHGofRxRYkD93a4xjx7VwYzZUASfYW+Di
	X4u0YOzYZ7+JdRSfOBr76ow4ZfSC3+GQgCvMQ084NPU2Xk/CBiN9phEllm+cG86nzFbsTpEaMji
	AdBx2oFXtYACUBRQTut6JZm3SIPXBSL+Yuwm0VgCpNZCKqHFoq3W30GAEYxoFGaC5Fp9bY2udyF
	Dgemf1Pv89Rpbl+c18fZzUzq5FE7Jta1oURyUeFFi0s46dlU+ZqF7/PSVN9ryJwYLT5qMPiT25C
	LFO5QcfdxUhd/otFiqOAR9yJq3agYwUVjH6ujltX/Z7rVsZvU4dywd+0g/5nxM6UNIA7z0ZrF1z
	aZgHA3fKXFicRT
X-Received: by 2002:a05:620a:2719:b0:93e:c12c:9b6c with SMTP id af79cd13be357-93ec12c9f75mr1287535785a.71.1791808808154;
        Mon, 12 Oct 2026 05:40:08 -0700 (PDT)
X-Received: by 2002:a05:620a:2719:b0:93e:c12c:9b6c with SMTP id af79cd13be357-93ec12c9f75mr1287525785a.71.1791808806759;
        Mon, 12 Oct 2026 05:40:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcddeb5136sm2762212e87.61.2026.10.12.05.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 05:40:04 -0700 (PDT)
Date: Mon, 12 Oct 2026 15:40:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xilin Wu <sophon@radxa.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        dragon@radxa.com, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 03/20] drm/bridge-connector: Attach max bpc for
 non-HDMI bridges
Message-ID: <hh2nn5eazfxpulmtvrugkjujhsspf7wlr64a65smmzxtlb53ml@6wynyytdaued>
References: <20261009-msm-dp-hdr10-v2-0-1835d4966da3@radxa.com>
 <20261009-msm-dp-hdr10-v2-3-1835d4966da3@radxa.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009-msm-dp-hdr10-v2-3-1835d4966da3@radxa.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1MCBTYWx0ZWRfX9cYsCsPcijNl
 /I2UBIFFLjxTjKFtZAapC3iKqvkSp7Cn67ALrQpNry+rEtd8xmbV0RvXEmVgy6MEN6jZ16GyPKH
 /ULcziCBUgjjX5MzKJrockTVEIecWTN9/iXo6leoFEn8R7wrq3m/VA5SX0MCSXnxY7/fHoa/c79
 e9Fx712k33QmbhdyaW6rKRfmhlknWgooHRvft+VlusadrDrdr9unmEjAJ96Wq3xBSiVSET2m3Oc
 MP5agFoI++Vsxt7Bu1uIKQnl69bfGYP6KdgNqocsbP5mCSoJUauzqR8pUAT3NjUG1/OKV+qeb50
 0rzwuLtWyWXncfjWYEx8uvFXq04FW/LisY4MuaEB3jVRIzQhV9YXQlxcrc2Bij+A+Adc6+Fowyq
 kELRR61VsP+hSH/vxivriiEgejDmjpql/XnWuWZg3yeMHEO3C9nMSlBVJzRrl5jEwvYk4bNR6mW
 BqkcB09oBan3gqm11ug==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1MCBTYWx0ZWRfX3XLMau3BCshf
 qGrnCtsaqfSvh31EGdJ8C8W2lODPdt4jB8O0i6HsA83OxV7A14zXXfkUUJ+T6xHfXAKerVNJ68K
 uFAx3vs5f1QC/muIXlXqJ1IIWWAiiaM=
X-Authority-Analysis: v=2.4 cv=QO391QLL c=1 sm=1 tr=0 ts=6accd529 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=ksxQWNrZAAAA:8
 a=4AZdoXe02SclfKkZrKEA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-ORIG-GUID: v9nGLhERVCd7iLfzKMydTVFKEO84tqdP
X-Proofpoint-GUID: v9nGLhERVCd7iLfzKMydTVFKEO84tqdP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120050

On Fri, Oct 09, 2026 at 11:15:55AM +0800, Xilin Wu wrote:
> Allow non-HDMI bridges to advertise their output bit-depth limit through
> max_bpc. Attach the max bpc property when the lowest reported limit in the
> chain exceeds 8, ignoring bridges that do not report a limit. This lets
> DP drivers expose deep-color support without attaching the property in
> their connector initialization code.
> 
> Use a lower bound of 6 for DP and eDP, which support 6 bpc RGB output, and
> 8 for other connector types. Keep the existing HDMI registration path.
> The property can be attached before connector state allocation; the
> atomic state helper initializes its default when state is created.
> 
> Assisted-by: LLM
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---
>  drivers/gpu/drm/display/drm_bridge_connector.c | 18 ++++++++++++++++++
>  include/drm/drm_bridge.h                       | 11 ++++++++---
>  2 files changed, 26 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
> index 8b54069fa53a..be2e08a3694a 100644
> --- a/drivers/gpu/drm/display/drm_bridge_connector.c
> +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
> @@ -825,6 +825,7 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>  	struct drm_bridge *panel_bridge __free(drm_bridge_put) = NULL;
>  	unsigned int supported_formats = BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444);
>  	unsigned int max_bpc = 8;
> +	unsigned int chain_max_bpc = 0;

UINT_MAX?

>  	bool support_hdcp = false;
>  	int connector_type;
>  	int ret;
> @@ -985,6 +986,10 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>  			panel_bridge = drm_bridge_get(bridge);
>  		}
>  
> +		if (bridge->max_bpc)
> +			chain_max_bpc = chain_max_bpc ?
> +				min(chain_max_bpc, bridge->max_bpc) : bridge->max_bpc;
> +
>  		if (bridge->support_hdcp)
>  			support_hdcp = true;
>  	}
> @@ -1026,6 +1031,19 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>  					  connector_type, ddc);
>  		if (ret)
>  			return ERR_PTR(ret);
> +
> +		if (chain_max_bpc > 8) {
> +			unsigned int min_bpc = 8;
> +
> +			if (connector_type == DRM_MODE_CONNECTOR_DisplayPort ||
> +			    connector_type == DRM_MODE_CONNECTOR_eDP)
> +				min_bpc = 6;

This opens a can of worms. Consider having host -> DP -> HDMI chain of
bridges. DP would support 6bpc. HDMI would not output 6bpc, but would
the chain be able to negotiate 6bpc, feed that to HDMI and let it output
8bpc? What is the resulting bpc?

> +
> +			ret = drm_connector_attach_max_bpc_property(connector, min_bpc,
> +								    chain_max_bpc);
> +			if (ret)
> +				return ERR_PTR(ret);
> +		}
>  	}
>  
>  	if (bridge_connector->bridge_hdmi_audio ||

-- 
With best wishes
Dmitry
