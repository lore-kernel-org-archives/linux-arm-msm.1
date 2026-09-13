Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA2D757EA
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 23:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789343248; cv=none; b=WPD8XIGKovTf0QSgpLvgVGl0TwbaCihzTq6F1jCTLvEVCFwbdgNnKpbEnarlyA/a7I5Cbpg/FfppWWuzC0E7d7iGMHltbzIDatntRgYl10tW3XrEp09E5zTTqzmXatSz6u2qrfb/a1BK5t1w55m5SJ89ov6o2LIlzPUAjMsVxHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789343248; c=relaxed/simple;
	bh=zANzVCAprn9b4vOB7ZnqBQISuHyZ8f0zuVKXch8qKcI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZQ0lW9eX5IWN5bSGqktjMR4YoGxNd6b11IRxILEjuT9fS+WHzaoyf0OWDSQZvgsfcakkl6hf4f+Ww7lK+6rrJmjpgBWpYmbz+ChGPpn0kyQXb6xXuBXJ0WSqO6MIbjdmqBT0+kDrmjcZ4EpJyp21ohB9GZ7qQP1+c4ORSQK6UsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hx+8GYib; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VdaqPbiZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hx+8GYib";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VdaqPbiZ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DNYatk3122897
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 23:47:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cmOd/wtJBwDY+aB9upH1uIT8
	B7lNgLS/AKryTS4QZfQ=; b=hx+8GYib+ZSJR2XplPITMr2FMSVazDbcRgI1G5C0
	MZrAOyPg3Ub5sE3XWE/7QYp8XUCb65kofTRdd6UyY7xmGpOQNq+mtAXV406YoN8t
	sRAEub4enFRNX5Eqo0WoHPOUw7QAzSEJMoy6wJgvsmPjOVlq1GH0FsheffvcZO+y
	iMIFhMq/lahMqvzqGo/fdcgtsCxWOb3SAXMXxiHlsOjxJFH5IlMQX4bi79k6ERdu
	LGdxL0N4r3p8g3aUZzl5EWgg0Pv1y9z6UD/9Ta5dJ7HMEd23WlxWPOzcN4s42R5Y
	fc3RuWZIK1QdPn21WPFCWnPKGwipDY0JsOpSq1j6qSQaAw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9d4bmq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 23:47:25 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-97a4824dd83so2668552241.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 16:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789343245; x=1789948045; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cmOd/wtJBwDY+aB9upH1uIT8B7lNgLS/AKryTS4QZfQ=;
        b=VdaqPbiZIZZ3ZPB611qfKMvbVAEbqEVz3zIwPXR6e1v5g8WKnVXmZSdh1/4wB7z/GW
         Wao5wSZ9I5PrrUvZ6DE8kSM5tZ0kWg8Yawx5Nfd65hJCDuNXDwlqTJAtFG2hugA42ErQ
         KSTs0PBUSJZQRhRbZM6XHAIMh803ivcNDXUMVKxSauZFY7U2RIyrY0ulUU/C6mWsQPdG
         PIxpuPvS+nKk5WuvZLMiYLQMDSyCV1EmjHYbbgznCZbmEbHbKVuYcuRjPQ0w6rP3xrsn
         W7Qb9txwfa6NrqnL7m4/xGhuB0CEYW65NOLm3aVp5hF1iO6mP+AB6I/E43lckEa18cB4
         8E7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789343245; x=1789948045;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cmOd/wtJBwDY+aB9upH1uIT8B7lNgLS/AKryTS4QZfQ=;
        b=VODjEMZnSF0W/+bHcYq/KBKDxpyNKd79bu2J38cj4fIa87mfglgq65xDop9aqtVqEU
         aDU+XxEN1d7GbqL4iFqWYB6Y/we4w/m2ndu+k0Jx+JqUtrkpwqV6Hacidcf299h4ycBl
         F1OscCgLJWPyNIQpINuHfNAMI1sAbsV4Tu3+nGaySrsV5ySJ5g+cJdAXH8P+yFK4Q+ko
         FJA+IwNWgxwBSHA1ltzCtB22njMJEIeo3YPNSw2/BHUlKjhCoN7YMvzTwVOpn5JcvFG8
         r3pJPCZD0WGw4DADaPRCNaCxaoXzDpMwcraWxnXfFCjODSOyUtrUE+Tj753lBQJSAT0j
         wE8g==
X-Forwarded-Encrypted: i=1; AKwUvBweGQWtic6xEjOIijjO3kSPm+sx3rGa9wff0a2UhhtvwUWZR1c5LRQerhMNC5iBk2JBCwWMuiRT6NY4NXuq@vger.kernel.org
X-Gm-Message-State: AFuF++nQLAHgzSSXcEiAEZkquScNDt+8cTmwIpHrup9Mwpdr++jq/u+c
	Y8S37J1d5ZtqfoCvZkg+oTlFipAvtID3uzvmhemYSj2e/HZCZcv8XB1CDfrGcunzC/C48WsLl8f
	JbfmyWBcZcJYFr6kUawdYMVdJaN8CVg6WwiGCDVUHMM3OldKn33TzjWV3pnTUoWeucP6q
X-Gm-Gg: AYBFou3agT56VgEBsUd9FeiSX5Rt23KYHOeXCLFfU0v61IqdxhE6FAbOpwLxo1F2+Ds
	aOYq8MLqUpVFmHPds670l2cbz5JFPNV7J+uBIeuCr/4xi94xg4Du+TfHWn9sYwD1xG6xPrZXvcz
	COHTL2zBh9AheCmf7VaFWev3aGhw1khSSiFx/SEyL622CRpB7ffQvVgwvqOPTMYGsvZabi2KjBS
	Zm5+vXUEc1Zss1iGyu9y7BfQv9gdM2+9dwDG7OVBbQ3coBfWiFeAX7XxMlFXrFPMDqu64bqsQP4
	WN+PC5QiNTC7PG2j+EeShS2kBeKdWrAlnrcUI4gFd57/uP5XlJd9TxH44x2NfmYfZwSbj60Iped
	6Scsc13vTVfJnld8v2fnSJ+B4oChPtUqELYcXCd+/lt+wreVXA3084C5Vr3+qybNPxkP+GHRPt5
	TaOclmK08LZtmr
X-Received: by 2002:a05:6102:918:b0:786:dfa:c5ea with SMTP id ada2fe7eead31-79b57cb42f6mr40906137.5.1789343244865;
        Sun, 13 Sep 2026 16:47:24 -0700 (PDT)
X-Received: by 2002:a05:6102:918:b0:786:dfa:c5ea with SMTP id ada2fe7eead31-79b57cb42f6mr40887137.5.1789343244498;
        Sun, 13 Sep 2026 16:47:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5a33263e0sm21888431fa.15.2026.09.13.16.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 16:47:21 -0700 (PDT)
Date: Mon, 14 Sep 2026 02:47:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: Re: [PATCH 05/17] drm/msm: mdss: Add support for MDSS on Nord
Message-ID: <xmrrgh62hk4kdhfxt4xa5ngn7kc4f3p44dpvf2yfqdhkoxlis6@iftzpwpcc3qk>
References: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
 <20260911-nord-drv-dt-v1-5-e25c073cf1b6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-nord-drv-dt-v1-5-e25c073cf1b6@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDM0MSBTYWx0ZWRfX5YimCo/WOW0R
 ZVTj13L/pyZR+o22YgiV5FtHz3QSrTbbS8ALqkRhjbHcXdZ5enZqD+Y68Yc/nlHseG3ar1fpsg4
 ONXjG1nrDesp5kaly44z/fvxYBSzek4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDM0MSBTYWx0ZWRfXzVhbRhPDk9I/
 suvJkFR5F1G+u5+paGeOtBdWFW8wxrbdByXRLsdAvRiyn6rDkC8tIyxMXgSDMS6Cm3iqD28R3oC
 i/FMqvJAt9DqK+VibpLQhjPd/e5km07Jway3T2kW5CjNBgL41ayF+MYnIeCxlhlx3g0weWdvLzV
 wdAltCjxyJcspmRD7o5r6XTofWWIbtYzvd7aZDP2c6yPug0ZarEiWRomUFcffmO7M30CfkOu9GY
 ZMxlZHPILHNExrPbcyOaVlZEiTtmmUNSmpe6fAmhNco3yaK6OEGvCKO1Iv10lH+dC6HOpBdf7KI
 GuWUkeN0TbjG/hCyrsxUpCG1pfCUB4prd0pOv3iJE5CEmo8Iubx4uDmKbytOuSxt4IFN5yYfJRn
 U0xAHIJMHQpx7ObTeZrgTEOZhl1NDT3FBoReDfKW7jqRWSpot24Qsx7WM9oOaXbw6+0rQKaVBB+
 XjTLq0e9+EyjhWAlyxQ==
X-Authority-Analysis: v=2.4 cv=IOSXmQvG c=1 sm=1 tr=0 ts=6aa7360d cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=ReDZFTIDzEE4zWO0opkA:9 a=CjuIK1q_8ugA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: YV7NoO5dsMzNsXlu0mdXKg4bGJr9HDkp
X-Proofpoint-GUID: YV7NoO5dsMzNsXlu0mdXKg4bGJr9HDkp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_07,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609130341

On Fri, Sep 11, 2026 at 09:06:36PM +0530, Nabige Aala wrote:
> From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> 
> Add the MDSS compatible for the Qualcomm Nord SoC, reusing the 57 MBps
> register bus bandwidth setting shared with the other recent platforms.

Why?

> 
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index 9087c4b290db..90bcc8c28dc2 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -531,6 +531,7 @@ static const struct of_device_id mdss_dt_match[] = {
>  	{ .compatible = "qcom,kaanapali-mdss", .data = &data_57k },
>  	{ .compatible = "qcom,milos-mdss", .data = &data_14k },
>  	{ .compatible = "qcom,msm8998-mdss", .data = &data_76k8 },
> +	{ .compatible = "qcom,nord-mdss", .data = &data_57k },
>  	{ .compatible = "qcom,qcm2290-mdss", .data = &data_76k8 },
>  	{ .compatible = "qcom,qcs8300-mdss", .data = &data_74k },
>  	{ .compatible = "qcom,sa8775p-mdss", .data = &data_74k },
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
