Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF61C3E0C76
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 10:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787221060; cv=none; b=oh6UzHxY+g9N6FMhd8TeaZbgyKcFrZVfdWZ3RuQK/RE4oE0wmZzxVJ7KGZNJ8Pc9sFkZEfozf9fnr0bkEa6Bi5/QbLpkF+jESnr8HnI+Co2Y52UgjQJ/+K6+zrEmQJ6dwboGUmhaQN0wwqQGXZpJwloGhy02kJvs3SrS98mDaa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787221060; c=relaxed/simple;
	bh=Rt4KCNIC0bk4LE3kNjZBDI9ppI6hU368mOP8+6m3pu0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jWrG7sMMbQ2J4lHDO9Xvrbv4ZWYvkKqV79hUAaAgSO7pvZFGuWkUwH/YpT+r9+zEkQzBRRnt31pzUTpAuCCTCFztFyQZ6EmN5pES4cdRnVb6JxAo4aEetTqVtOdGWOHQMbL62V6f6gTfwjQY2DJHkAxftpECBeSpMjAiYJ4epBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MFv5c1Hi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=esdjtWs8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MFv5c1Hi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="esdjtWs8"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K8jd9D2529517
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 10:17:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VZ8bSWEjaxQsf5haBbDFpLTYwqaPZD3nOYIzf6zf4FU=; b=MFv5c1HisMjCcEdY
	P02LVDO0cNXReYCDtoEh66zz0umjXu6YAhOfS1iHv7HcB/MDQCB4xoWyT0kyvQQH
	ftVk4OU+7LiTlIUl0PUbJKe3HD/UX9JwYfVnvzvmFabV0ZNakNHuefiFshPCGym/
	KuZLqViSjyYpj/usGaTpIchsDsUUnFGa4Qo/tveI4237mNDl0riNDP4mR5rXYziw
	OjF/EXiGeOT8I46bqW6j5XWX+vrENwPT3bJ7RhQA8bNid1tQczoDEZQ2nFJFtt7X
	CBcJcE18VIBaXzl4Rsw8NJQgvX0xWR8uM7t06luSRuxr4yAFP7fdFviA57h44S7Y
	DCNTAg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5xbv8bnd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 10:17:20 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c9d953b71so742591cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 03:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787221040; x=1787825840; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VZ8bSWEjaxQsf5haBbDFpLTYwqaPZD3nOYIzf6zf4FU=;
        b=esdjtWs8ZiBtHoGo/1XzJTxVH/RcLNhIeR/suXgF8eCH0XmUobrQK5zSGisHRXBfsx
         DGgQT86gk1CVqXHRS6bA3dtQCYFC/FO83z9tlTQp+UcUg0kGEx0oRGavFYwNnwojA4QM
         RHigFxRBqxFoRHsanlRmciRNrzBFuSk6+nF6nejO5KnuNYzmW0musWbdn8v+/YeUcEu3
         YtGFYamzf9ZGcZL8dkQMF05BQhBxvxmfIcD1IKOl4CEhRzSUIH1TQV2atobZ3T41h7z2
         EgJyTaKMYXS+P7ijdaFcyRmSIavpeVPqxrU9h9zwDfHXia2AGd9aPR0ppy4bcs0DCU9H
         MyNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787221040; x=1787825840;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VZ8bSWEjaxQsf5haBbDFpLTYwqaPZD3nOYIzf6zf4FU=;
        b=OuFbG6LR4SsS0zcj+pbKztFSMKPX21rHr22gbTNnRCrRQkXfxQ+8T1xYqtQVPJYZq3
         Q7DLwKuTAbGRiQqZ0DugGd9+AJtPB0zZti29BB+JJqYz3T9biazpjYcg3a9zpQie6oKN
         baHgcu3N3+w1zYQnhwpA0+LbWvdXJxbLrjFrS9fhlGlbfrlNx2a6ptsgnVQG3BG+03ac
         7M9bdXSeulIpkHAsDM6Ax7PQ+64QMxme49YOe+hQhK1rbzQNLN4Y55wpBvMBdaRLWef9
         2LCafY4YCHp10+NSAYxET6H8kFe2bMxSoK7C8vBlrTvUUyEhTSQrGrAQwxNRJ3CVntYD
         4g+Q==
X-Gm-Message-State: AOJu0Yww+nc7tCofmxYBXCleCreINw/25Lk8+49P0+2ExHM9dj3YwAMQ
	yulMJZjb6ydPnB7En00IciJOVHfORx3DLy7dwTv6mUqA7fxErKxY0XMBh0ZaArRz4YECwnZDXzl
	wBLicrOW7AXit2zxIxwURllwDS7MxWUedyMnsJQBxbNuoBLS1cupxbWeIb63BQpLqVFqR
X-Gm-Gg: AR+sD125Galaqaia2y+GHdNe+XDN2eKizRIyGG8Fu1xvODEhFmKWKIN4sHzrsTxyR7V
	vsPv8xvucboKoTezjVCJuaPysj792ET1eDUIg8IhEdGnhIT5Jhlglwhx0ndUmSClTJisntbVLAD
	ZWFkZkYhFXIje4Ir3j9czSeeCU1Td9fpUHXUcB2e72saZnfcwakQiY5HevKD7Ncy9QqP3VgLXf1
	+0RT1GOc9Qy0KLKqX7x4Gtp2TnGtF2hRaCj+643RuWW+UjnwyByy/VvSCrNOjm7LASbJ7Jd4iCs
	5ajG/543arGx8UaoX4NtfmmJ+pmD1eY8pmB8RbTxP+xkOtiTJnO2DjICOLv6vIU316dr7dtNsQT
	9Ly0i60IKioCQCTW8Adv+whKx
X-Received: by 2002:a05:622a:130f:b0:51b:f40b:2fa2 with SMTP id d75a77b69052e-52dd574ad4bmr78013291cf.1.1787221040275;
        Thu, 20 Aug 2026 03:17:20 -0700 (PDT)
X-Received: by 2002:a05:622a:130f:b0:51b:f40b:2fa2 with SMTP id d75a77b69052e-52dd574ad4bmr78013001cf.1.1787221039762;
        Thu, 20 Aug 2026 03:17:19 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff0c30casm1866261a12.7.2026.08.20.03.17.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 03:17:19 -0700 (PDT)
Message-ID: <e16a7122-18c3-4bc5-80c5-1cda458fa2c6@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 12:17:16 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] arm64: dts: qcom: Add Motorola One
To: Adam Skladowski <a39.skl@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20260820-next-patches-v2-0-7130d68183d9@gmail.com>
 <20260820-next-patches-v2-3-7130d68183d9@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260820-next-patches-v2-3-7130d68183d9@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AMKAkK6n c=1 sm=1 tr=0 ts=6a86d430 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=RkJc_Q4fNhrpPokiRjQA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA3NSBTYWx0ZWRfX+Jd+7VoNARLK
 tx2DY7wO4ZKN4R/V2MTgnfDBEfs44mevA316RPp6D+m3oAAXjEi048JpWJTg55zTX+zRYIreD0L
 J5AcmjZb43dTcAt+bdYujYiIBigcX8yZo2g1FICRIAx/v8ZRQpoqot/1pfeC0tbMP7E7eoJJ2NO
 bZpfogRR/+LuYcCjySkRxOCZJ1OXSW56wKSMrTJrPKdde8mNY3DC2PWKZgf+hN+yMdYcifO9lId
 vkMTXyRiFb6XkjfBDSHKvN3gDvFbRf8mdiHgiw7S2++9B34wo0ZUuEx+M+QtbiExxQ0LlWuJU62
 PKi3q1aaa2sTxgx2ob2ekOlHOxz/hxeE0Vpmhbv9bJH9/FqW3ZrtbUvRxKQBSGhjnktL1fXS34L
 AfLdcTziSQDtSUaQoS6q/ixBeiicVjH+T7lj6fZhbVXUqJiNxQtcNcmHAi66VQ/bCun9H5zDogN
 iV5bQ68UhKfpzX4w0Vw==
X-Proofpoint-GUID: 2auy1kF2L1y_hr-oMcYJlnmYnuVB9K02
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA3NSBTYWx0ZWRfX1a5+H9T27MmC
 Yvq+1aVbfl0tuu3xIJaJzFCW4k+0N6/4Mt4ebLkt9sixW4cY7/D+JMBl/tjHZ/cdgPDxP0uv+SI
 90p13RUoXrl1dCs9ElDfKg3sTuWf8dU=
X-Proofpoint-ORIG-GUID: 2auy1kF2L1y_hr-oMcYJlnmYnuVB9K02
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 suspectscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200075

On 8/20/26 11:42 AM, Adam Skladowski wrote:
> Add a devicetree for the Motorola One smartphone, which is based
> on the Jacala/MSM8953 SoC.
> 
> Supported functionality as of this initial submission:
> * I2C peripherals (Touchscreen,NFC)
> * Power Button, Volume Keys
> * Regulators (PM8953)
> * Remoteprocs (ADSP, MPSS, WCNSS)
> * USB
> 
> Device tree also contains supply maps to other subsystems like MDSS
> but due to missing dependencies like panel those are disabled.
> 
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---



[...]

> +	typec-portc@22 {
> +		compatible = "fcs,fusb302";
> +		reg = <0x22>;
> +		interrupts-extended = <&tlmm 9 IRQ_TYPE_LEVEL_LOW>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&fusb302_int_default>;

nit: outlying sort


> +
> +		usb-role-switch = <&usb3>;
> +		vbus-supply = <&fusb302_vbus>;
> +
> +		connector {
> +			compatible = "usb-c-connector";
> +			label = "USB-C";
> +			power-role = "dual";
> +			data-role = "dual";
> +			try-power-role = "sink";
> +			typec-power-opmode = "default";
> +			source-pdos = <PDO_FIXED(5000, 500,
> +						 PDO_FIXED_DUAL_ROLE |
> +						 PDO_FIXED_DATA_SWAP |
> +						 PDO_FIXED_USB_COMM)>;
> +			sink-pdos = <PDO_FIXED(5000, 3000,
> +					       PDO_FIXED_DUAL_ROLE |
> +					       PDO_FIXED_DATA_SWAP |
> +					       PDO_FIXED_USB_COMM)>;
> +			op-sink-microwatt = <2000000>;

This is inconsistent with the sink-PDOs you defined (5 V 3 A vs 2 W)

Konrad
