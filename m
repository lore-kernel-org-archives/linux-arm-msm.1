Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794420983;
	b=XK8bEf2g2c9X6rXHPv2ck8Z9rS/eHWLXMDPyyvEpqDo7Df8iyST1zMSTE2mTUQxTT0ve
	 ONJQBt7ILwNX47y3o3znfmq+z+tUfRoEqj3wlx0ynYzGzHkEhKfgWrwSO+hFnAfewBZVG
	 O/gbMByBdOrxsEaLMDzH4cw3qzfGs7Nd38EhcDr1ToEL7H9GCM20+mII3TLK6WCRYNyy/
	 X3I6h05RP7+7Fr1v4kQx5ExhlJekI1nxa7PNJNHrn8/+AmEUuKz0lXmKOiJahTCrNFPYz
	 BeQAdFNKn4k0552v/aVcsW41dUHWHniwqLIlnX7zIr5Cb8+8nhb3V01iDKhF5DM7RDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794420983;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=REvih3wAsG/3Y8nmSLavA6sFWJivHfgQW3aPqY6xVOc=;
	b=4RWnlj4nUkjuaCugDe77pEAZeO4ToqCTAknprv2t0u40Vtoy2Sum7KcfU5nEQVzzLuY5
	 CK4MOY+2oDohM9xc185iCWNVspLWuJoHStP/0r3jOkJYRqHgLfOepaBC8sw8BMRfn0E3f
	 VhVrpu+B0QnmyfJmZc6sSfMD6RGyo4rOcAkZR2jUNLIj/6pumFY4hKjz1vDA1jTKLr6W6
	 MTIbITilS0Rx2P0TPq4l7RYVH85oIQKbJUFV+jthDR8PDEXospz8k1thQHygotfTVZYZq
	 /X6RAGFLD8zou5EdcxU6ojkELn4xQMEXpCbSY/laRZkmZOWVWDPLIcSlQOIBFx1nljw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=glISu5jm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jxdoGSFM;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399ED606A9C4
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 18:16:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 399ED606A9C4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=glISu5jm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jxdoGSFM
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABHtEUl2052135
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 18:16:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=REvih3wAsG/3Y8nmSLavA6sF
	WJivHfgQW3aPqY6xVOc=; b=glISu5jmcoB4td6nZz5qG/2jm/qi4dD5Rm/9nSsa
	/I0Gl1GenJw0gJ0xFGG58LM2hwKHwHJYnsp1mOl7Imy5Wmr5+Sj3759L7ygtlwP1
	kKiIHi/sWbDtQz/DNgL9bnNJlOQWYwZQYUTix+NhFXbkDl5d7MLlNPku/BSlpKHw
	vvEvz8erB0bQP5V+CVfQIbrJ2ChUzhYDQE6SqVkGCRNGt3tQ577rEL1GABb3rc0u
	Y9OgQkxts7fON1oYYDRihHuGEGPb0E4ER1zYUCcXE+Lj027hU0I/ksXWRSH0XyCw
	8/DYX8de6VRdE7t1U0ztcqK+WKh8V2VGqOFG6HLzkXNJBg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvk7ptn9w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 18:16:22 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5ead18311ebso1055846e0c.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 10:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794420981; x=1795025781; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=REvih3wAsG/3Y8nmSLavA6sFWJivHfgQW3aPqY6xVOc=;
        b=jxdoGSFMo5dMG5F8OrpLY8cboUuWxPPH4IcP0j4Epbuuta1Y/xvD1wgVgoDK9nxaPU
         uAiTvKYB1Yze2W4Q3XzttzXt8civZCLL8uk7JhrcrxDSJPjufvx4nVLlby8SPusgEf7f
         m0t60DdPraE02MXfzj/WaI+hMiExc+fG+vR3ibokNBMV78wx77s2Zt/erX3xZEeleHX5
         XFPS4SzQiQuzqvAoU1wFiLnAy5AWgSctjwRJrW+khohjkKUQ2+KAujWnywVl/Tjxpp6b
         RszV92Sjz/AlNNe9fNLJOfCWODecy2GYqt3GZBB1LlVU4wvDu8Br60JrJXoEFO3PGCcB
         VnaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794420981; x=1795025781;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=REvih3wAsG/3Y8nmSLavA6sFWJivHfgQW3aPqY6xVOc=;
        b=QsiXcWAmbvwlhRl1DBSnm4p+b/McCM/cVGDtgTs8VLtMRzga3QLOBvF2Sq6ohBuN7O
         uuUpfkf2Dt1BLh82PrCbxrm+ZDA+bm++6u8dUkfF+w+Dv4B/dVPh0EylylHR54v+4rHY
         +Erv7NssDai/ru1nlL3ei2KRhkSG2I0BWCHRpnte063hOzHJnlfo9+co5Knsy+yxleFO
         +8ZzjlC+7z66LRqQ5vMYU7LIZUN5ioN3Nu61rCpVrDPPbLdkDFkk4iZd6KvF+DsjQsow
         wqXXH42fm1GDtBzabuAG8tmCB+rsgoBM55mE2XY5Ec8SCpQMgUvnl8jRThZGhcZK19X0
         872g==
X-Forwarded-Encrypted: i=1; AL+hErHMDdqZO846qd2Jd+29AraAqvGjnuYlgdAYrzVB4rLcAZ2igUDvlbZn0aFMiuCHoKAMaKapEX7eXkRe1c04@vger.kernel.org
X-Gm-Message-State: APuU4Z/dqqarXYYfK2dxw/bXp/eZf7g+C+OW+4l4b8GGig02EjRGzbYQ
	pALZ43sVpNTPMmDHrgYFggevbJnADMkfM71D+YbgzvtsNeCfBIDqybJ7bz4eVJKicKvUYA9hx4E
	sH1fv+yK3jEy+Y8KUGlc5h2VYNc6DS9n/s1LLbfE+5UPqErQXjNrEoLkGs2oQJaQnYaQo
X-Gm-Gg: AYBFou2/1GMdjOPFU4Zef/FrJ8IjvkV+uHlkCEFEs0drmn2nL1Fr5VlFS0LGx4r/qcE
	xDoS28vtsNZFoBmN0KNNp3XV91m+4jwoJVX5ltTzebFw1KAJVxuCAPDchTtvL+odywZ1fXYk6ek
	VmEVSuJtLvxBoyVJ4dFwXCEBb8OsD/45gNioIV6jeCwRUPfM60wq/KCRQOx5NzRd7y2vhbW8MFp
	xo0mm2sCCMGbsMeTTE+WylCzIhfCSjyRZWqTc1hbbZOHPIzwtXnCNzQfGfvNWhfC7umYUkw9FNG
	I2xLiUOHLV1jNB53+jGq9Ty+opzmCZXm2nHWyQlgMQxaS3RyqVxqqW8eCB+Xet3mbXJqvnsJ7Lb
	E7PG3RYsXk8azELb0oYc7A4UVphrt7dVMGOFAPhJi00p9jHBazcUxuUqiZCmq0BSZ1HNz8PJ1Mn
	nEaavphQaAFdFi7Iy1MtQ7a3OkXCmHwwRfF92qF/WebZ0DnoG+3TBAscthMdjcGg==
X-Received: by 2002:a05:6122:e253:b0:5e9:7a1a:5ad5 with SMTP id 71dfb90a1353d-5ee1c46bab6mr1148651e0c.20.1794420981160;
        Wed, 11 Nov 2026 10:16:21 -0800 (PST)
X-Received: by 2002:a05:6122:e253:b0:5e9:7a1a:5ad5 with SMTP id 71dfb90a1353d-5ee1c46bab6mr1148604e0c.20.1794420980694;
        Wed, 11 Nov 2026 10:16:20 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae1bdb2c94sm625101fa.26.2026.11.11.10.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 10:16:19 -0800 (PST)
Date: Wed, 11 Nov 2026 20:16:16 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Mahadevan <quic_mahap@quicinc.com>,
        Richard Acayan <mailingradian@gmail.com>,
        Danila Tikhonov <danila@mainlining.org>,
        Robert Foss <rfoss@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: msm8996-oneplus: Disable
 disconnected DSI
Message-ID: <7gqjjq7v5krgibjxqelyjwmrfygfnbsvyfubgbpkshkvgdftxr@dwm3rdpoqbnb>
References: <20261111-display-msm-of-graph-v2-0-fdf8fd97f49d@oss.qualcomm.com>
 <20261111-display-msm-of-graph-v2-2-fdf8fd97f49d@oss.qualcomm.com>
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
In-Reply-To: <20261111-display-msm-of-graph-v2-2-fdf8fd97f49d@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3MiBTYWx0ZWRfX+87q7hoN4aVZ
 bRiFbtFE4ZCJW50fJwLhFAuACqvapnV+ZSMIz5bcC3y9BRpAk0Rin/ywDm4S+URcvcbUF+zJ8M2
 aTVeOHQTGiCY16IQJkQ6zAEJXI8Wx+Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3MiBTYWx0ZWRfX+6mgAJQDIBMk
 Zroj2ay7h0vGuYHtRLmII+POyYpFa8JHU3d/el57h/k/vtkwrv2WFGPKxqD3zy7w/8xtGzaBuqP
 xC73BmOjsRwvLRWOmdFeMdv6KkCGEtnJ+prB8oqU9R5/2+uyTz8BjO9ENd/lc6GeiRgk8DXIwa/
 LnCmEjD4k0xVokoHky+llZnf+PxL+SSSIaog1KrTiJKv7oQeZNAnIGiPN0VB2x2b+ZnL7MoMIrr
 IM6tT6RZuXEHhb1FtEUUsDNMZCec4hWmmE1yA78Xs4YHPN6+NQ+UR9epI5oyBHOG7j8L35G3kNK
 ZKlDEzgtAtCrPnbWfHWhbfA4KArgxIYkZkPquONrP4PnLNvrEsunboGyKBLOfdOhUzi6A/2YGpu
 pkFYzcrhaSH5mYV3K7ooDUgJENFUuxP8zE3RVoeY5mWpxhRVQifwdU6mFad8VNp2pURmZZZdMZa
 98LTzmteQp4s6VMF4iA==
X-Proofpoint-GUID: LqYAtY1JEsgbKvDsKGcDaTMOC8OyUspK
X-Proofpoint-ORIG-GUID: LqYAtY1JEsgbKvDsKGcDaTMOC8OyUspK
X-Authority-Analysis: v=2.4 cv=BpcIUoX5 c=1 sm=1 tr=0 ts=6af4b0f6 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=PrdBiiE1VpZ4eXJVCeEA:9 a=CjuIK1q_8ugA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110072

On Wed, Nov 11, 2026 at 06:45:01PM +0100, Krzysztof Kozlowski wrote:
> MDSS DSI and DSI PHY are useless, when nothing is attached (no panel
> description in DTS), thus should be disabled in DTS.  Linux MSM DRM
> drivers will also fail the probe.

I don't think they will fail the probe. Nothing will be registered, no
bridge will be attached to the DSI host, which means that the component
device will not be constructed / bound.

> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi
> index 7a3f8afae22d..9c2cef11e7a9 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi
> @@ -189,7 +189,6 @@ &mdss {
>  &mdss_dsi0 {
>  	vdda-supply = <&vreg_l2a_1p25>;
>  	vcca-supply = <&vreg_l22a_3p0>;
> -	status = "okay";
>  };
>  
>  &mdss_dsi0_out {
> @@ -198,7 +197,6 @@ &mdss_dsi0_out {
>  
>  &mdss_dsi0_phy {
>  	vcca-supply = <&vreg_l28a_0p925>;
> -	status = "okay";
>  };
>  
>  &mmcc {
> 
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry
