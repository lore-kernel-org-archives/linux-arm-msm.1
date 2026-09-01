Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B57478E27
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 11:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788261201; cv=none; b=YZO3r4ACRBcxthPTslivWtrQJEd/bN+faR09VZ7cVgnXvvv5QUey8AXTC7d9at7wsHR/wgkS91nb86NuNVr3nTG4G6Usi7NcY4F1m+KRGG6UvXn5bJKHw/vPdklNj4mhPT1CLe73m+ktGMpU6tb2X2lKCPEaB8PkLQNoz4ctzdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788261201; c=relaxed/simple;
	bh=AaNe9MZxIXYGjk5dI2N/PB1VsZK8MLeqo4GjD+3C6zQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=huv6Bl7JVYlO7aSIP0WYodR9CoAYgOfLEkD4OZHVbhgw/FhTue8f68fU/97O986qpThXRdSbHVEg2UrNJigfhSDMF0SAAibqYSHzdMkziVS6JAC7BzjeiZaIh37vIOddJxNmBksoS04ZVZ98VpLOvuK7GqD4bAlzRJutUV5YBVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jx4l6QhH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UyiXSM7g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jx4l6QhH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UyiXSM7g"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJf0J2494605
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 11:13:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cFbUjQY2bH6iNRxhmkr0nuklvoLwMw+Tg0iNHcY5+yQ=; b=jx4l6QhHhLbxYgAf
	6XtVh53cT9TJsLneRXO5vUc86AD85+D27LVpMw0+fwLH/C5L/hBw24lsZWdvhs5x
	cyPH1xtHq8F1cIJma/61wA9QNXRd/KflxXPIiuD1989lTmjf2lEb9xWJCrtAkQwv
	MAjcwtK9oVs7FhRs02fCfnrgZYEBEOir7n1wbMRls7ZiyHhT9pvuBF4WefjGXF4L
	W8m3e/471Gc6tdhCm+N4m3JRW0QvIQqmRUJARhoqDDu2Gt1SaZvWlMuRc4HsZ9qk
	TWQUprJBuSquq2xL/8cs3f04+W6BS08/8e9CdNxF/gYguOBb6fk7kWfI/5VjzeVJ
	ObXp0g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdqbh1rc9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 11:13:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9392788b3f8so76202985a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 04:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788261198; x=1788865998; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cFbUjQY2bH6iNRxhmkr0nuklvoLwMw+Tg0iNHcY5+yQ=;
        b=UyiXSM7gtMpSSR8EU+F7TKJIu58o0+p5xy9qCOoL2DQFcFmp4I5EKrgzAlfprBLu+1
         A2mMf/GzRVubgEC5NAfXL3S1Vt72hljjIK7g1x4KQ6JR1Yv5R9Qs1MhQhQbu5ohQJzIa
         Oy/5Vzl1vK6lb67TIHwSiOgoMTTIgmTiP6a6YESROxaf3/Q8cX4a9TMWYiOE56eQHZFP
         CGx3oxtPZN1C/cCZL1kC7UyeuyY9UIeYz94wZ7JdkC3KwLwZJHxKhr2Is1lCLTOg+jCT
         LuWagsp5AOYzBj8wxIvFJX6+JwVODOynYzmGbJuwPzqK3zM2gmQpw4Qe/6qW3m3TrCeo
         uzxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788261198; x=1788865998;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cFbUjQY2bH6iNRxhmkr0nuklvoLwMw+Tg0iNHcY5+yQ=;
        b=PKWlRFJUD/WKFr95njxLa54cLJSP8f0JTxIFVQsBDjLmZJLMwg/mFpNyoI1yhLyztR
         NcgiZSholjrgewP7roj2gKU25E9MyJPSkIZ295a86ncWHAD9mC6vYOAIwjwHtZLVGunx
         DT0vt8rwirnGq8RCyXSideEmOh9AtoaSrI3mX/ccY0vnLErs+mxX4O9P4qByoeqhHNC3
         2gLH5czhizluLT2UqnDVM6AvzHpwEEO7QfjpDm/vfHDgSpxCiY6MWM4OJsKuTULcdib2
         dzlx8h2NzJFroj/CwDo+6B37VGCM5+kpIwipbVEFVUH8QGl2rflXPaaYcjIuKiKunIPo
         hUPQ==
X-Forwarded-Encrypted: i=1; AHgh+RrunbYcBYHMdErA1sVCdDqMgBXES2gspaJrKRWWAvjoQjEhreUAkPxb4ApZalyeNV7SAjqkxgRzbsWn6mP4@vger.kernel.org
X-Gm-Message-State: AFuF++lJgLy77MFVjmOmiVTxTfumioM2MKdImGZx7lobNdR+cttwNNNM
	GFX5EUiEyR+Sk4I4LPeSZPA6tRoOKJlJwoUHy/LCCcKYtqhxe6qG8USWUs/czCAnc+ze6da9VTT
	hGcOuzKDWFkx9/KlLdXXZ/e0zmOkL3zNZP12idQdS2f33TTeJ3/pveC96Lp+kfu+dDyIT
X-Gm-Gg: AR+sD12bUrWtq04+tZW3pUMNf+sE9SyZEyizULWTJkOzKbxwhRaI4ZIbQ0Tfxwt/wCR
	qqAZKVJ4rkSSCQUOXEqlB0DoNeGEJZnRdCevY0PGcBJycMSw7x9+JmCTwqFixHun5Xn6rFzOU0m
	I0YdlrvyCSTMZ31afMzMlJpIuO5xGWOvdrF5E6JR0YBT05qFNml8wDKV8Dt5zmEJoSMC3f0sNH9
	Q0CIgGeuge3hO2m51aVgK0YqDkH8/lg7jqlIH4Za32l4OhNqE99O1qs5pFwc+cKzZQ0xIeAdyeQ
	ilF+c6ZDEcVeRi4ryd2NNRfW4iZYethBYhX9GALRIHp/LhRN+7UsMQqurcP4d4lYGveSkqx8Xa4
	OgiHiL/shlisBJz/My82ndQ==
X-Received: by 2002:a05:620a:462b:b0:937:6f83:e80f with SMTP id af79cd13be357-9392868735cmr1512936285a.1.1788261198166;
        Tue, 01 Sep 2026 04:13:18 -0700 (PDT)
X-Received: by 2002:a05:620a:462b:b0:937:6f83:e80f with SMTP id af79cd13be357-9392868735cmr1512928885a.1.1788261197404;
        Tue, 01 Sep 2026 04:13:17 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255f1b1443sm558216766b.41.2026.09.01.04.13.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 04:13:16 -0700 (PDT)
Message-ID: <abe65e67-1523-4b6f-be17-a86b7b1b4d02@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 13:13:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: add HP OmniBook Ultra 14-kg0xxx
To: Jason Pettit <jason.pettit@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260830-x2-hp-omnibook-ship-v1-0-9feada71dc79@oss.qualcomm.com>
 <20260830-x2-hp-omnibook-ship-v1-2-9feada71dc79@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260830-x2-hp-omnibook-ship-v1-2-9feada71dc79@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA5OSBTYWx0ZWRfXzqyh01sCwiaa
 TasHvuhyfinbnzwgPnZmNiR9hoM8z5h6Or3VWpj9RBdQ6LA/gp6U+EdDHzxt9nYVUYLpcjc3FOF
 y+99LnkKQS0U34po7GxRfMAVFAaH19w=
X-Authority-Analysis: v=2.4 cv=R9wz39RX c=1 sm=1 tr=0 ts=6a96b34e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=fwwh0Dj8_06do4mu6XIA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: Ck85Kzp_YZqliz-X92_MYOioCHotkYyd
X-Proofpoint-ORIG-GUID: Ck85Kzp_YZqliz-X92_MYOioCHotkYyd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA5OSBTYWx0ZWRfXwLOyodGOjzVB
 NLeJO326rlBOM/A03YNpeO7oeSgmpHYR24r1z895Z3ihlaPD4XHuZex+soifzJbbjnd58/C6OP/
 TDV5iIN2MAvYd3U+5Kfcpgk3+Y5JAV3eQuAumn5iEIUIDmmR4BA2saSoLxFfmp67/PGD3uGfeXJ
 oohSQbdwTpmgpBVY+nmrrNTJxy0EB97BQVmwn6o87WyjpH0uypZQAkxR1OVv+VDLtweqxXOl5s7
 2O2tAqvpVopBTBHNam4yj/GtEWkqUS7Py1/Os5dznVy1l2OgMggdh0VHoGnhWq3DmFu06FLI1aj
 h8LnXHgxgcEqqpekICsCjWej5BP6wFjIuFL5zW/d+86ZovhMqrt0yXLMlaUZ45wtrDsoVfgY70F
 iuMPZEtpCTVbKQed4Tgp2T6g+HQ78MZR3/fng73wyUSXGlIdeFTZc3zIJMqdoMydoH9vuGZnPpc
 a2I8YLo3kySuOV880Jw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010099

On 8/30/26 11:56 PM, Jason Pettit wrote:
> Add board support for HP OmniBook Ultra 14" Next Gen AI PC
> (product SKU D29KLAS#ABA, board 8F03), a Snapdragon X2 Elite (Glymur)
> laptop, using the "hp,omnibook-ultra-kg0xxx" / "qcom,glymur" compatible.

[...]


> +	sound {
> +		compatible = "qcom,glymur-sndcard";
> +		/* This board reuses GLYMUR-CRD-tplg.bin from linux-firmware */
> +		model = "GLYMUR-CRD";

This should have its own model name, the topology repo has some
existing infra to make reuse easy (aliases in the CMake file)

[...]

> +&gmu {
> +	status = "okay";
> +};

This is already enabled in glymur.dtsi


> +
> +&gpu {
> +	status = "okay";
> +};
> +
> +/* keyboard: HID-over-I2C on i2c0 */

I think we can drop this comment (also a similar one near vreg_l2h_e0_0p88)

[...]

> +&tlmm {
> +	gpio-reserved-ranges = <4 4>,
> +			       <10 2>,
> +			       <44 4>,
> +			       <65 1>,
> +			       <90 1>;

Do we know what these are used for?

[...]

> +/* usb_0: 2nd USB-C port (host + DP alt-mode) */

These comments I also find a little unnecesasry

Konrad
