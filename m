Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795781535;
	b=WNW3IcmbKw12JVm+USmMn/Zd7ubWyTfsxHysGSyV8Jjfp7dyF9ilvwChxrs84kxTFnso
	 OcTtjeUekS+MHOaaKfXA/Eb6+AT+okG/enJlBYUr+rqyqCNqVkwLokqmPAR1SHEauipm7
	 lYyi+54TFT8wo1d/L4QMvxk5wTDwDVaNTP4vpr3z7aiwDCcdeZwIgrVTDJhW1Q5gANh5u
	 uoUAbh1GyiJif8554IJlu/YW8wgT+B0ZuSvGYhxWil84w8MQVsM/PJIJqvEEP2IHSHxN/
	 HqR2ZroYMrpBnT0Rw971CNS+6kOvWj8GQbimCYU3Gox4+Udd87WhcMq6HbVCIXN04lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781535;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JvrLVqvUYcg3weAzaVq9EsFMSELgwJlALoJuS2RMcms=;
	b=DWxC4jyfHeD43o4yQAMEXVO2DBbJzMEC8l5z3OGbd1XGHNrb/wpdxs01CkjyaNQjQqrX
	 A81PapExpSQHS9UvonCGMiGXu6ItEMgYwEwQBnrlRZ482yJU7CncVPY84L8/D0hpy7oHq
	 Raw/RfusJxMGNVy8LHPViZCYMyp39AxmYwjNhtvWo1hUDXxa5Nu1frgNIp3Y5rM0iwhiM
	 pb+Uop5k5sXae0z+m7P1WWqpLS0ssdWNvIL7lPkEZTsTdm2la69sI0IEHF8M7M3NgBIcE
	 wGIGguLn77h9RlZszdXhqS2bspPZ9zqqkyAVQEKtOHLd3hH9JO6xXJK9QTtLe7eMGvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O1pFbnPK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xx1ux0y6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D861606A31C
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 12:12:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D861606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O1pFbnPK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xx1ux0y6
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARApPFS273655
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 12:12:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JvrLVqvUYcg3weAzaVq9EsFMSELgwJlALoJuS2RMcms=; b=O1pFbnPKMw/99LPC
	VHlQ0iWwfS95+FHu6vdLLSlwCMqWLq/38ZcVeDFXEvf+CXayhW1YysxmL6dCSZHV
	k01JzIgUUUSj1PFnGlgwDVU4KHwQd9xAXMBLQX+P2qUvrGguRQ47RaFl6eBOvHD/
	x17ZkkKR2Vr0RPYthuEPe4BZZ56KhVBK4yChFnAOxwCMEh2D4b2ALvYiDZ1+gT7c
	LkC0yEbz3lX0Xpu2D3EM4RARb781XfuEmQ9N3oFMV+VHHIWdqKe6H4+r5Xww4bnO
	5R7UpcR9gMXYpiWpF2duZwB1QFmSmVaYfqtE2MzneVRPiJhafE8RHJ5rss8sdQ7M
	A/pHhw==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u49awqb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 12:12:14 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-71b7e312b5eso51227eaf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 04:12:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795781534; x=1796386334; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JvrLVqvUYcg3weAzaVq9EsFMSELgwJlALoJuS2RMcms=;
        b=Xx1ux0y6InN5Eylb4qauBKH41UZdZALBt6OrT4Ha9lZNwsBM+Tq21FuDe9WBo2zV9I
         gT6jwn9EYjr1QJyDBWg6a4M+umIwWCjyjXHS48cULG4XkfZ7QM+VmYGpHO4R3pOHzg3B
         HR6KmsrbzgmfwbRF8toR7KoSpQSDU/ZSE66nlmU/nCv3WLf+vXXXYqP1wwaju4NUA4pq
         Gok8V97p2UHr1UtMFYP0Ko8P2FOe+FyFc9M+FR0w323uL8haZT4afK/SpEHp61g3b2B9
         H+Cd6C11uMLHdhwum2vnVFdfhgyPpQgM0HbUzbVH+WLZDG0KFhHpiEguzCdoG6WHb0I0
         xaPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781534; x=1796386334;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JvrLVqvUYcg3weAzaVq9EsFMSELgwJlALoJuS2RMcms=;
        b=Aq4lF010dqRqeSOg0dgwWGxM7gJsvua9PYW9NzAiEeTcoVEWo8CfZ49MqJSGM5V/rI
         Xyzv7m4LFgG0rA4y91qO2wE1Z31afAamqgKQqrik2vRlhxH1slOXVlGcLWSzjxpkI4gD
         TsgcfrYITSlGGtks9m+5MGD8rkcdnVNtYp3VUTmeYoTsV7/2S2D1HHyuO7HEgVrcP2K0
         v45wEEjdiH/K/FzbFIgymq+jOKeX2HIODgnq205Er0eK8A0ho7LHP0RE1R2iQXNOPjYq
         Y+apdZrtNEtcBv8Muz6K66RGeaYYMEuIL86sqVeH0EmQjl2tubSA9cAr32nJ8jV5A9Bq
         KTnw==
X-Forwarded-Encrypted: i=1; AL+hErHjrm4m4Pj5hCt9P5jcSV4cDaHbhdgH+9o9il68KOL7rq3FYsadkURNSXinkrhIIAH8lce1iPenRY/gZeaY@vger.kernel.org
X-Gm-Message-State: APuU4Z91NiuNXo593Kf1TErEzLuBmvrxZSlLUskiRPY83XvJDy18iJHu
	rtj8Vw9lhOPSg8KmgwQf4HtRqBYPcb2WYlGfIsN+DH5B3DkEy7P9Dm5IRGnIR6FxdjxzfldzKu2
	8lX27pQOFl75yude6xXyYls6xoQmtzN816Fe/CrFRsGMmwe2WQgSST29uoU/teYOrFVIT
X-Gm-Gg: AZFdTZev49BdBhSxHTIRQ0uU2S26Gdh9fyiuRMVsuXQtEJ7MyATs4yWzhUNGAIS4QzJ
	YVw0C7DLPfF23rwc5yuAUgxylHdGR44qSeEc4pyQ+YwLCFEzb3xcaHM5Bs3C0mpktUpBftFrX6C
	ZO9Y+tKpJcW51pZC+prvmN8xFX2HylpnEHddNo84SbnBOKBeIq9utphVOQ72St9iuRRm0WR46Ag
	AIpOQqRwbrC62b0KC9ro/IocJCqeh6OquzgidxOq+ywWK32SzpuVs7KkEizs6LAqD69uYRgLXe6
	pvd2toD4r485n8Rnq3Ix2emeuUzsb/32xSaf33WWNHF5AE/PZzrnQKvaTOXxiP9whMpEkovRrLJ
	mJBXf89DFctzkY9IaTsXkEJprMWfwPHuD6P1o9tLKPaQtpjMaGdk2H6guM7qlbvb/kGMXFZY=
X-Received: by 2002:a05:6820:c2c9:10b0:70c:bf79:3e6e with SMTP id 006d021491bc7-71b39033ddbmr23495332eaf.0.1795781533946;
        Fri, 27 Nov 2026 04:12:13 -0800 (PST)
X-Received: by 2002:a05:6820:c2c9:10b0:70c:bf79:3e6e with SMTP id 006d021491bc7-71b39033ddbmr23495294eaf.0.1795781533468;
        Fri, 27 Nov 2026 04:12:13 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afed51asm843067866b.76.2026.11.27.04.12.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 04:12:12 -0800 (PST)
Message-ID: <dd4e15d2-5037-4610-9a80-5c330f436263@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 13:12:11 +0100
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
Subject: Re: [PATCH v5 2/2] arm64: dts: qcom: Add HP OmniBook X 16-cp1
To: Jeff Roach <jeff.roach0@gmail.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261114020509.632311-1-jeff.roach0@gmail.com>
 <20261114020509.632311-3-jeff.roach0@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261114020509.632311-3-jeff.roach0@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: RkQLLOMQOPTiHcrNb3L3HyC8Qdm5U-Ph
X-Proofpoint-ORIG-GUID: RkQLLOMQOPTiHcrNb3L3HyC8Qdm5U-Ph
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0OCBTYWx0ZWRfXy5oBvO3Tpltm
 T+KZq97Mklse4Avb44p143ljcevygrZ+n8QDlIWXoMKZXMoF5xjexslv58YDpgyGiqU59OsHPL/
 AFHbI2BDppXBYuidRi7VHc1nChYqx/s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0OCBTYWx0ZWRfX1cy7vuQAEmmH
 APlfbOi3uYBHCfsy7eVwkU1IejzWgo/o6Dzzj8uO/GPJRn2PuEA+90EdF1JkSmYEnG9g8mjzNls
 ZJc0RNRYIqZYOS7mla+tchLKwSalPrjnauqy8qXqfYwnjVYLT5ntBQmTh81vB6DA8zHfAGV3Ee4
 ICQ8jNM748ZEfSo8Np19z8SoIniUh0TgVVL+7wJa89KH9YdcmTTHM7NLHlLUg9S5OwUvG/mEkuU
 5bcpJrgdgIBUyljOvyFNYIpJkAcQ5F/AQJVb6FQx6NXLxoj/6xEWaIcvwgVT/+IRPUotRHEgVus
 tA0FlSPUhc/iwCSokwOnbNrmaqe+bkEwnZ/IuIlIh538ZSPIQxH487k1iHUaWdpx0X9caqPYyan
 pzcStWsLKMtqZxwRYBvnbs9SIj65Aec9rCpOlUuaL50KKameSQeNMFfWg75gobrtYwO4YMaK+4n
 RMxbGxwwC7lXQpM7/ZQ==
X-Authority-Analysis: v=2.4 cv=A875rKWG c=1 sm=1 tr=0 ts=6b09739e cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=xy8Gs_GerH8zsfeW4bcA:9 a=QEXdDO2ut3YA:10 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270048

On 11/14/26 3:05 AM, Jeff Roach wrote:
> Add a device tree for the HP OmniBook X 16-cp1 laptop, based on the
> Qualcomm Mahua (Snapdragon X2 Elite, 12 cores) SoC.
> 
> Supported and tested:
> - Keyboard, touchpad and touchscreen over I2C HID
> - Lid switch
> - NVMe SSD (PCIe 5)
> - Qualcomm QCC2072 Wi-Fi (PCIe 4, M.2 key E slot)
> - Two USB-C ports with orientation switching, USB PD and battery
>   reporting through pmic-glink
> - USB-A port (usb_2)

[...]

> +&usb_2_qmpphy {
> +	/delete-property/ mode-switch;
> +	/delete-property/ orientation-switch;
> +
> +	status = "okay";
> +
> +	ports {
> +		port@0 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			/delete-node/ endpoint;
> +
> +			usb_2_qmpphy_out_usb: endpoint@1 {
> +				reg = <1>;
> +
> +				data-lanes = <1 0>;
> +			};
> +		};
> +	};
> +};

Does simply leaving status=okay also work here? I think it should
simply never enter DP mode since there's no altmode notification

Konrad
