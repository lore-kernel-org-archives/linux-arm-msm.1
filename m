Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793781397;
	b=d3NLp4lJQSlCqcKKfmxO9WppHMDrTfVH6hgSvnBhbDYTQJiXZVx4dM4DHqxoO/erlSJJ
	 pHLIQhT57qsjKGYWnZuVDItY9qV6mJ9skejU7ji5714TiB4bAULPhqYmZZKKmnMsh6SeY
	 jfxYi65Kj8lvAmx2ykb34EOtzdeqnknwT0qcd8nJSVCZs040Q3TzLgjWofmNGFctlJTiW
	 rs/AIYE/kX7TcG3vtBBWoj+EkFbJv0s4qG3iQm78kjSHDZYVUBA3nxa2UXfWUqzCz4omp
	 NmEVoProEX/G7tfs6vsm2mShzaMuH4YoGnhivda+7et4ChFPjeaeG8PERkiLuNSIAmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793781397;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=PQ4LinK6QHDjKioOmPQ+jXCD4vkH5b3yBrfQAIAIVJg=;
	b=z147VJLXOoGdszSkBqJ7m88e2ube1sTz2hAx0zpl2qGGU0XAu3WZ4cr3AEgRudSsi/Ck
	 Z7iRTCldMuknQGiT2AOIEKU+brfUYP+yrOQo/QAgMlNstZ4VdK+lM8DD0wAVTMhooO3AM
	 g2LbdNXWsGzRlMMpSIx52L6rvtLlaJiIUBviBbb4gDsqkm+ukIXLPodfOwx/KTQ3P6aUv
	 ap+cGuIFwHYVMmQJBooHmhZ43VC+UhaunnQBTG3xnReEpqsDs6k/iPhloTZ4My8U+N761
	 6pRddK4L+QS7kF5sxPyRkzEzqq0/x9udwVLYH9KqnG7V5MmnRG3KQ4wnkm4xaBrjE7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gbhK8BM8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P1yVSKWu;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5621606A31B
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 08:36:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5621606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gbhK8BM8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P1yVSKWu
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A48KiEh175444
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Nov 2026 08:36:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PQ4LinK6QHDjKioOmPQ+jXCD4vkH5b3yBrfQAIAIVJg=; b=gbhK8BM8tMhhuj7k
	+5bSBMqQ3ZjaVWUje2lOUX0TsYEi9w/9QqWznoKL3Xkn3WkmMHiERtpA5mZUTvF1
	d2qksPWt6NNW9wQgQp5W59THeO9ULGUn7pZhP6+2CsX1GmpwMj52S3EhotynXLYp
	u6lDjkHiqcTW8Ha4RdJGaUi2rMQZVSGrEMUwbagcleLdiRwxS4TUuMigzje0cnc2
	ZgZAGt8G/Sg+e8TiDYMwGq3kBpLjW91MUFmi1dMdbeTAXNsCYcp6VztA3Q3icOyp
	6EALMXfDWHbzk/pLTYEtQrk/BILC+3GnlcqKLjFZ65FFeeHJsCqBW6cPmSePVun2
	K2UQhA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqmjbu2d9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 08:36:35 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5476f5bd009so1389231cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 00:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793781395; x=1794386195; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PQ4LinK6QHDjKioOmPQ+jXCD4vkH5b3yBrfQAIAIVJg=;
        b=P1yVSKWuHPn0I9HTe/wdzcKBD8CUwMCUAl57+2hUBxkFfMK6x76WWAh8AcrEmuusDM
         l7ER5iOb56Cb1mWOLllxFuAermXM70+FaCC3D8P06W9hS72yn+pkpqaJB8es+XXUa/kj
         qN1oLxM0zCd3ktcFjGVPZQQJisR04C9GVPaBKd+G/v3xjH36SHsiSScKQAkQMTh+LkWy
         MI5TDnut3RTn/n0lMa0brE0d2sPgKkHeE2AC85v0b2Eg72M0W37rZkTRlpO4UttTZqEy
         koqx7mXgdOXqVylKeipBKchZwCfIp9lDoLUuU17ZYu/Tv7L4CyZmselQ7fDvS2YMdU0+
         up4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793781395; x=1794386195;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PQ4LinK6QHDjKioOmPQ+jXCD4vkH5b3yBrfQAIAIVJg=;
        b=yQb0pzXApjNjDTgbG0p8zuhHPeE4f2iBybTjeJKdodZf9mrObhFypANO1IgBzgoHx0
         ByAwz5zCSjC49ewthrfndHsjGkeOrT4w+emoK95qDNZXLv4FfkkHKSmcKtHQw76ZGsNY
         wodN3Lyt1o/bJH+/75c4aodllvB4GJoCyrQGeWx23Bv9CFVwATqXrLHonFG/31W6FI2T
         QHbk8zdzIBSyeIzpY0tov53t63yk6MBo7oCD2lrLk+sdwYKfxtpqt4xmU4XPX7tM4YY8
         GMcwK4M2EH31gsjoL/7cr+pz3CKBPy9F/De11+Fug6qIHdqxZzd0JErcP+ErUh1qLG4A
         x57w==
X-Forwarded-Encrypted: i=1; AKwUvBwUJsLNBXUiRucPbvK7S22QdLzo0LzqUCSGsp4tBgYcY4ZawCI8l9ghX+D2h2E0a0IMhJKviQBWtRDCXUD7@vger.kernel.org
X-Gm-Message-State: APuU4Z/31XgpiTzZOoSDTWxWrRwxxdX1APSpJFg7dqnNjZisWClB7kCv
	OW6bp/yF5WQ+/PGGs4A1iGgi54XXbe1mrY9398gIHcm6mykHXjjuOEotHRKOIswaCjX6uqpefe5
	sYcEMZZlwvV9/S8xmXVs3CTbw4VVioZEKrpCqRLM84ZpVaGlB/UJEepkq775UYNUSIl/y
X-Gm-Gg: AYBFou1Y3QDc98Lt1zTJHlgn9xvDJPeNRzaDdZ3bvzS8/Epg71Y8voyOmLRi3sEggAn
	esFrzUq8RKnWFEEwC6KJ+cFDnMA4yEV3K4OLabkjAe7aWwBHvlzLUJ6Q9hqpPfxAxz8NsfBkmwp
	usZ3NzCj89FLnPucKKkinUSvWHKg88gLSGldwmLld37mcTE6XtXgFXGPL8tbF0yii1x9HMT1iWY
	BveIpmuOOS2J7EjXp0uOeunQUTftrFojDKEx3cg4bOqku5NHhIqcHIQxkqEVk1xNhkshEjWZRF6
	ZTpwNGe5xSdbkIECcgcIOp+0G/PvN/s5EeYhsF5KAii0B4bjRZZ/pdvsZYGtuAvk0ZP1DqwcyNV
	1fNcJnT7OX5UeLYluIWm/R+S+a1aA4+dgUig3obwIVJWW01SjRSLu1bc6DdhfmoMC73mq
X-Received: by 2002:a05:620a:2319:20b0:945:c5b3:6356 with SMTP id af79cd13be357-945c5b36c93mr785271785a.2.1793781395128;
        Wed, 04 Nov 2026 00:36:35 -0800 (PST)
X-Received: by 2002:a05:620a:2319:20b0:945:c5b3:6356 with SMTP id af79cd13be357-945c5b36c93mr785269385a.2.1793781394523;
        Wed, 04 Nov 2026 00:36:34 -0800 (PST)
Received: from [192.168.226.1] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e424c34sm46273066b.13.2026.11.04.00.36.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 00:36:33 -0800 (PST)
Message-ID: <ea308aa2-8a2d-468a-ae5d-ec9a8ccdb2d2@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 09:36:31 +0100
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
Subject: Re: [PATCH 2/5] arm64: dts: qcom: sc8180x: Add Microsoft Surface Pro
 X
To: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede
 <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
References: <20261104070441.74127-1-val@packett.cool>
 <20261104070441.74127-3-val@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261104070441.74127-3-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: jaZ99nPyRWlQrUJFpZ4uwT6pZPk0jonu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAzNCBTYWx0ZWRfX9x9XBf9Q8gqZ
 sqsvauN6Yt6zShBmz0Y1OzxDXWwmhEd6+ndN54boF0ZgDvG8dsdgalCmAseDWL5xIUZ8Yr9x/Nt
 8CLIekH+ULvJuqRjeaml8TU4LO34wAHM6EIZMuVHvoRjqNUfyFBxaZTPAPLwBHZXSh1PQS8bgDt
 SJC+QmG/0ipdrak/j+6dBhrMurp73wTZ74O8oV0Ok09v10p5XX/VTMZeNEC7BKcm/vVa0/yYqUx
 pWVY+lolL9EyctOOYSPVXi5I0/EKic6QI1UqFhPxFFYR9Qd8khxvGAmdxsVP4EtnFVHcfBn8TjZ
 y/j+L/vGryh9FwNm/Qx+0285g9CpcA4Y12vZF/4ZUl+HOY1H2CnwlliNtOGj07UeSYH9fVmOG+z
 G/FX3IsRvc2xiYJaHYpGP4m02WjzhATo25p7mk7Pe2pWnctttc0oighEJrHt9Bn+gIb4kRKhQXV
 0LQfjAazrYp0R30P4mw==
X-Proofpoint-ORIG-GUID: jaZ99nPyRWlQrUJFpZ4uwT6pZPk0jonu
X-Authority-Analysis: v=2.4 cv=NMhAaE6g c=1 sm=1 tr=0 ts=6aeaee93 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=S4lLRux2dGMH_Q5bArEA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAzNCBTYWx0ZWRfX7KpH5bsgfskX
 kEuDQ2lhGy1k41grDk0ABSl5nxin9hU5+dy1M5I/xlomOaqhVb8WMeYlwt1RiTLBbteyu3jxTR+
 RHF0yp4U2OVWj1Mh7Vpnkxs6v08i1DM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_02,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040034

On 11/4/26 8:04 AM, Val Packett wrote:
> From: Maximilian Luz <luzmaximilian@gmail.com>
> 
> Introduce a device tree for the Surface Pro X tablet in all 3 variants
> (SQ1 with cellular, SQ1 Wi-Fi only, SQ2 with cellular).
> 
> Currently working:
> 
> * Display, backlight (eDP panel)
> * USB 2.0
> * Wi-Fi and Bluetooth (WCN3998)
> * NVMe on PCIe2
> * Embedded controller (Surface SAM over UART)
> * All remoteprocs (ADSP, CDSP, MPSS, SLPI)
> * Volume and power buttons

[...]

This needs some sorting etc., but let's tackle the bigger prob first


> +&mdss_edp {
> +	pinctrl-0 = <&edp_hpd_active>;
> +	pinctrl-names = "default";
> +
> +	status = "okay";
> +
> +	aux-bus {
> +		panel {
> +			compatible = "edp-panel";
> +			enable-gpios = <&tlmm 130 GPIO_ACTIVE_HIGH>;
> +			no-hpd;

Is there really no HPD? The pinctrl above suggests otherwise

[...]

> +&pcie2 {
> +	// XXX: pcie1 and pcie2 are multi'd together, for now use just one
> +	num-lanes = <2>;

We should be using the new phy-qcom-qmp-pcie-multiphy.c driver I think,
I'll try chasing down the right magic values

> +
> +	pinctrl-0 = <&pcie1_default_state>;
> +	pinctrl-names = "default";
> +
> +	// HACK: Remove "global" interrupt

Why?

Konrad
