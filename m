Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793623372;
	b=Uz91qX0YD2iCfS7a5ybadGF8rsFLfjNU9dFTMdTMWTSTD+iHNzdGDSJQbojYrEb+YEdM
	 GjpcC64DfhchxJ1eE4ws3ZSM1seHssaunT2TNdvtN46GzaSe6RERZUUQ0y/7PT4P27dBl
	 BOzYKjwEhnenNnd3auyhWI8nTSf6/yMPElm8i4b12NFK4REXburGOJuK5qHRs52waENJt
	 sSK5xDi3ZPKKSMQ3tGji7wo50RQVoNddlK8hqac1CFNpB/c017i73cittuotKGCo+4niy
	 joMQSttTChY0ijaQZ8BkRfrS0n3qqySoVnmPQP8G3cipYMCqis6QRCMxz2JKpFYM26Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793623372;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=SfJHL+LnVRB1R76oNOPPOaL+uw2rvGjVXvhT2Xe2FZo=;
	b=g3qACxzE2nWF7YpF1PXZH2C1JMQWWgb/Q36+13kKx5ncojOoIgU3BYyVX9WXc+hg7nqP
	 4VBnpVeoLbUOwQe+gPVpG9mHeZzs7vfddmukD2pbAVl4TqUfzRPbCl4wAH+octRknEmWD
	 XbBAaTXRx3hFr0FDvR/uLUU4BrI4JpznAN+Yw3eyoidgtsDBEX6bGiMCEv5cnAMyIM3bw
	 xtHxt77ID2u0zm3YDy9aMjC5TogTJ35xDkKFdMj+5rvCTe2Nr+Wa1cBG08SJparA/6NJ9
	 2pqCUww/xgHrdHfriXd8T4iWCGgpCIm8D8cIIpeaVaR/QgX+dNjevwQHs8uzaq6vEbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=imzn9mgE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aCXAe2dL;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346BD60A2607
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 12:42:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 346BD60A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=imzn9mgE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aCXAe2dL
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AIKJ2880814
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 12:42:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SfJHL+LnVRB1R76oNOPPOaL+uw2rvGjVXvhT2Xe2FZo=; b=imzn9mgE7jpQF7UJ
	l5NhN9P2tCVnLxb4TdTBR2FOSNJYdj8wTOT26//AF1GPF5PuPIQFSP5ViGDCvCa2
	4mmGrgG3D6wFmc0KCDipUueSrm3NRhQkBzh3GoNpLwmwC9BYu7cq7Ua57vaYcUdl
	7YgM3f7Fj1J108Q1ZgoO2WvAuWPIwY2sapviVFR5lXCi3+SLKGXIo/izg2gXY3oL
	7iTbK1ENuliAtSaY73WLoFYMb56uptzP5XHbepiephZGbLxaLYsO/JhzEU4QKGII
	YlJK7qieMGwQeYo3B/Q8gJ8RC+Ywd4G10lvOIH5zpCYXkTkGoH1cH/FMvobYmo0l
	TdgZ3g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqfrgusb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 12:42:46 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91c82e9d68fso8514126d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 04:42:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793623365; x=1794228165; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SfJHL+LnVRB1R76oNOPPOaL+uw2rvGjVXvhT2Xe2FZo=;
        b=aCXAe2dLx6AvaA3Ui7ABcy+OyV6uebqnuOlRF+vCG7XQ5sOZCJbjH38nn86tQ/NYsD
         YYHpQ0CWi+7ui8DF6l2AjxJdeI6Y4UvnZQtB3GAlb77QbHRCih8R5vYiiSauBZvOExKP
         2jH92wiR69s8RF7UfIU5k9ufPo9HtEVpRpWX/lgyVyGo900JuD1Cjp70VmCU7/praxrP
         nx/03JbllRjZT+mXWgHKTTSPJkgJMS+itfhFm2n5jS2MEg+B1iTjWmpNXUw3TM2TKK0b
         pVUNtw3RqR4FaHbd1o9f4BfO+pCy/y87D+jgBkDHMhZCAy4S+DB9OKwpg33wHyV8FkaV
         mvpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793623365; x=1794228165;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SfJHL+LnVRB1R76oNOPPOaL+uw2rvGjVXvhT2Xe2FZo=;
        b=LfFbHvE1RINsP6WSRQuG/pe8upMoEmWbV6sVEzUhoEr060RF1rOEkJpw+fknJ6gqk8
         qZJJm5M7ypaSFMyb5ZEIG4/d0GiwTG8Z93KO+wYm9lbw2hjVL+W08/mmK234KDU/1OFi
         MQP7w+AdGk6Zx7HEPrTwRm8SqGVGvvWmhPB7MJOdjOVWS/ZvJCLzA2UgkLltYSs5a1qb
         HXripyvJDFUCLaQNsvGghLP7XhDolO+rYS52/qBBhycj+uFA9Tcx+WSZiM5C82DKpwyV
         mKjDsqrFxwRbsFDNlEQFZaSEPD+yeYnEDuQQlcFPgZmbwVi0Sfp3Kjrl64K7s+lhUNXA
         soKg==
X-Forwarded-Encrypted: i=1; AKwUvByw7/+XrsMf4ynBLq/1cweltIvtdJmLVtqakE5LTxy7YUehdrwZ4oiA1IfEFkLiUfivBKJeHcgES8WldBna@vger.kernel.org
X-Gm-Message-State: AFq9FYIZWBB9X7o0OJayv4sSM29XnnmevjmGjrNoDfAvqrng+P69Y4b8
	xrOAkTlpFM9Ze6oD0MoWcLQrojmGPdD/8e8UpfOxbfn5gbbmHIc3GiUeOOHc0pWf1cvVErvyABp
	cGQjQrWzdvDymBLFu/4BY60kFX0zTB+Vr5Y+E9Il0I0dGBHYr4RqsEg6iZkVNNIZfIBpp
X-Gm-Gg: AYBFou2ZL6U/Gtc/QsUku6osZdruYOxEl+gkP6VdZLgFNXs7fjnq1KOzxpRUcqKnJzS
	gtsIWeZgolnKsK5pTY99KtaSThce8iiHBU+f0tqNAZUSlFqCnLutnnI1M6tnYQzkcwkBNtW/wzE
	S7Zzqu2FyMyJ6S1EXghOjcisgvS1yddiHQW1opTvUvFl30T4T5tvWwAWnMVBFWuJDSXo7f4HrJc
	k0ZPbBMCPrhaGolllGKF6Y+MP49tFJ8Zubgdfu29kS+dqE8gWy37QxoKBf7m3Oh+CTz3U2TPhI1
	93GnBrAuoNVqiCUcxyAX2WqiSff29JNUaWI0/FSolCBQbiLiBu6InDbifUlapNrNoDWpcnjtPWf
	Di8F/zVSm2Q779eFFV1IprbKrGJrAEpKWtDy7DwEujBH7lPUk9lKhpxMrV3ICuel8bPi3utM=
X-Received: by 2002:a05:620a:2246:20b0:93f:1fc5:f07b with SMTP id af79cd13be357-9442151da69mr1608067785a.2.1793623365418;
        Mon, 02 Nov 2026 04:42:45 -0800 (PST)
X-Received: by 2002:a05:620a:2246:20b0:93f:1fc5:f07b with SMTP id af79cd13be357-9442151da69mr1608063585a.2.1793623364967;
        Mon, 02 Nov 2026 04:42:44 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabc18e78sm399183066b.9.2026.11.02.04.42.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 04:42:44 -0800 (PST)
Message-ID: <99023059-0d9f-4ad4-a861-299006ae32a3@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 13:42:40 +0100
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
Subject: Re: [PATCH v7 09/11] arm64: dts: qcom: Add initial support for
 MSM8952
To: muzafferkadir@mainlining.org, Srinivas Kandagatla <srini@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Jassi Brar
 <jassisinghbrar@gmail.com>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-watchdog@vger.kernel.org, linux-clk@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-remoteproc@vger.kernel.org, linux-input@vger.kernel.org
References: <20261030-msm8952-initial-support-v7-0-ad748ace375d@mainlining.org>
 <20261030-msm8952-initial-support-v7-9-ad748ace375d@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261030-msm8952-initial-support-v7-9-ad748ace375d@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HMJWhYtv c=1 sm=1 tr=0 ts=6ae88546 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=OuZLqq7tAAAA:8 a=pjH4mUHWGEoP9p1cUU8A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: Z-irtQoU8yIvb4sMjWw44Qd9p2BjccOu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1MCBTYWx0ZWRfXwYazHh4ewEeO
 MAyUDnrU7ZU89IR5+LUfFe5bElxM+dft0wwXSPab1wMRfou0yIGCP80UCifSdswxgGD0jRE7d1P
 suEbXrMhhkqfxEZYPjxftB8G3+L5GHg=
X-Proofpoint-ORIG-GUID: Z-irtQoU8yIvb4sMjWw44Qd9p2BjccOu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1MCBTYWx0ZWRfXwAz4EgqUZPNZ
 R67zb5HGREM/jsx/N9PaBqnoSvYF32Zye10KmfaqH3rRf7nSSd4MdCXW4vhfjB7l18ABB9sMeO1
 J+uWgKchpfk0MOGgePGlggYNE+Rj194z3Efuh5ZlTjCM+SvlyBuxwAal/zAtJbFE8Yn5BfMpIEv
 8mGcVXOeXJNLYJCAfkQULO5k9zWgOumH5EC4q/012IpRZ2rnecrwGIZRYqdgOzkgSAsPBjYyOGw
 RDEvG/cu6Fad8gjDD45zi4sQJK+55AoVKVOo/liTTsl5qGCt3FFIxOc6HS5AP3Z2ceuWZHTINGK
 Ty7hK4JOhDInEJVxFNVjKQ+Tnz5ZXAkwbWTQ5zvO1+7O7UZnygEHKalZHs9w6+DbqH6mqBRe8MY
 TKwWv1ySu41gw1S3nFzXuK7vcmlj+11vcHNZTyAe3OocC2xu1lW2+OR4jXlPhH6NAjBvQtIp5/a
 qGcorqF1IZT9XeLcTtA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020050

On 10/29/26 10:02 PM, Muzaffer Kadir via B4 Relay wrote:
> From: Muzaffer Kadir <muzafferkadir@mainlining.org>
> 
> Add initial support for MSM8952 SoC.
[...]

> +		mpm: interrupt-controller {
> +			compatible = "qcom,mpm";
> +
> +			interrupts = <GIC_SPI 171 IRQ_TYPE_EDGE_RISING>;
> +
> +			mboxes = <&apcs1 1>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +			#power-domain-cells = <0>;
> +			interrupt-parent = <&intc>;
> +			qcom,rpm-msg-ram = <&apss_mpm>;
> +			qcom,mpm-pin-count = <64>;
> +			qcom,mpm-pin-map = <2 184>, /* TSENS UPLOW */
> +					   <49 140>, /* USB ASYNC */

USB DP> +					   <53 72>, /* MDSS */
> +					   <58 134>, /* USB */

USB DM

> +					   <62 190>; /* SPMI */



Konrad
