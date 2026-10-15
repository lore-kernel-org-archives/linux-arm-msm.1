Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F0A527589
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 13:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792070502; cv=none; b=d31W74bB/jRTO0Qd5GXZz3zcMbu/gCc0GPk4au95mHRWGzoph4MUiIvd4rzG3BMV7siY5pl2717/U0qdjy1VR3dC8vgot7SbSl9+PHQO97SwoSQrg+gKzOWDaVefHZrxPAvBok/2U+OpSKIxGnfZhW1vO3E5sVmDpAw0DuwQfJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792070502; c=relaxed/simple;
	bh=r1cDUK4n4vsOkir84Mzgh88NYpQXfnFBKPDVl4FY7Wo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sH/enhniC4Vl1p8kROlaHS3ky8obrlNloRP9D5CFlEhMRC5okiuUcgxokFB2rWbdgciKqH+rnxqukJ/RjmAcXtBJeT89w+BdfZgFHgyGsFwoUjVlsTcIRJ0QSye1epytHqXJ+8Nq3Sl5LQgV6ehC7PLM0Xdx4KdgFDK1zyLY4Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KjKxcA58; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NYeP1fhC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KjKxcA58";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NYeP1fhC"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FAPdbg4100196
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 13:21:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pB4Vm9muqHjsBGpjHRKxj8v/lRoKTmIfKwt7EToa49E=; b=KjKxcA58C7U60Ql5
	0ocYGUoqGG6KIGic2UcwFm5pe1gVXsfpBEw4kbbl33+zH+hafjwnY92JxhXRS/Vi
	XlqcVQ2SWs9JSKdNFz8yPRRELbuAoRTXoSVEa5MSyDLnmyc9j2c6GT6aG8L8Rj29
	8gdg1Tevy/LFTE62JO+T5hZDnNRe+enSVDHkHzCwIJeTu97gCYZCQzoGhnHl2Iok
	G51QSyHVq6BrUaS6Tx4IZVk323JFUsj2RXo6z9ImTGBaODMHWhDFhfgv4L53N8H6
	3aNHi51HP816TJp0phFB2StMeCW3DbGQtq2tX1AEJ3kbOmfyVJRolBFo0ZkN1SBP
	nYvhHw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haw2r8mct-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 13:21:39 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c65b0280a2so71327e0c.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 06:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792070499; x=1792675299; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pB4Vm9muqHjsBGpjHRKxj8v/lRoKTmIfKwt7EToa49E=;
        b=NYeP1fhCeiZ4SsC2IIJeQxZLW/hqD9ui3rh9BCWAdNsQfJsMPmME2lygYulr/QcRgo
         0xk5v6SAXk/jM0u8532jS4p6J6nz0BdQqjnyFYpgJYaiAE7lYXr8oGWBXfYKiADxhNP3
         smbtAqCoBMiDc0mNfpc7FQJjO89Ois8qU8FE+i3ZRnM1jce7a/7vuIJqsdXMi8lLvMwH
         fm1K1t4oNodUlrOEv+2e/6+gtOSImrYGTI6mCCmDPAfZhPEb3nsT+DqJ/zaeyx0s4Q5X
         YuHMKCVTanEIxy17UrdMnPpLvsYeOpA407/LHJRgmL0A9bKHr6alO2w1TbDMjWH92QW2
         QmIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792070499; x=1792675299;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pB4Vm9muqHjsBGpjHRKxj8v/lRoKTmIfKwt7EToa49E=;
        b=FOWQ2PbPFjNa8JPjbL+ssWzVJMRVMrzTCdYYK82QSGhtnD1mP8/hmSFFOF4cZET6B1
         VagB9EjC7GCt/35Nr1bHXLF2y26MBpu+5zQfiM4PvCWALstXy+j1i7+0DZfUbpwXLPHi
         Waa2GLEYBfoPjvEM2szYF3sA9ULayPytfddaQf4Hw5B2ehaVpRUJZUGVZ20m7PYiMq82
         BvDsLmaeO4vZyWt/5yAvmmdushGrA1IH6fU3OVy54M1GSCEXWmft3/xyk/nbIEWujBk3
         Uw6XfkWyIlcPOf/siJDiFvXz5UXtQOErJfQPByPiOs/BPl9sMIBHpOv/KHszGF2dBAe1
         MJaA==
X-Forwarded-Encrypted: i=1; AKwUvBwitXkjtxi8KRJoA/RgI7qz7yoEMmEw9mnG1dOK2XZLvidnWca7d1x4iSwIKOjIxtoAV3eWfJ53/5Vsyj99@vger.kernel.org
X-Gm-Message-State: AFq9FYLNk60cImHz3hkzKGf1PbFwlegEp3xZc7GMQJJmzdYKEirRNP+2
	qvvmcYucwe14+7+QyLYHnMpHOcKDkTOq9TiI/Unxp1lPh9ajUPPlfrtdtuSWT5P+siEP5gau+NH
	k80GupGBN0pVauRTgv2sKVztHYolYkNiEynG7hYjn53IzGKgvx9pBfEfeXIsCD3P7HiE6
X-Gm-Gg: AYBFou21n3bRShrwSYW5HzQcY5zDI5keDyALPTjLvKnwd5mAwWCtUYR8u59FSH9Jkcs
	nTmYrVVdoG94cH/JvZnfOIrtzv0YceLJcKefntHgJJLT0c4yXZjNImiDQ5mO33Og+RQmC+9aXhn
	b3kCReSlTKqNNJv4VDxeHNZfPbBGHqsG2GCbF3WXXDU/9ySq52DHyg3vDTnRKgp3tTHzXz3CHUJ
	VzRgd9arFYQe+HIk57U0LdJneVecm0knXlsPC8CEB1SM6v5yzIGOpN14pZ7QGW9AbBxtnqaKAib
	GZ/y0xiQVs1ATtjZ+CpjFQ1M16JSRltbtD4cv4t3e83X5+huTyD4GLnmeRvl8wUqnOsXq+72WwT
	CHWuOPmcPrJ4FUoan+HxyCg==
X-Received: by 2002:a05:6122:2c09:b0:5ea:8fce:8a45 with SMTP id 71dfb90a1353d-5ea8fce8d42mr259250e0c.5.1792070498693;
        Thu, 15 Oct 2026 06:21:38 -0700 (PDT)
X-Received: by 2002:a05:6122:2c09:b0:5ea:8fce:8a45 with SMTP id 71dfb90a1353d-5ea8fce8d42mr259228e0c.5.1792070498112;
        Thu, 15 Oct 2026 06:21:38 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b2038ac6c1sm2560431a12.35.2026.10.15.06.21.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 06:21:36 -0700 (PDT)
Message-ID: <44878919-4835-4790-ae85-f865d0522391@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 15:21:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: talos-lyra-evk: Add CYPD6129 Type-C
 support
To: Akash Kumar <akash.kumar@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261012131518.858396-1-akash.kumar@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261012131518.858396-1-akash.kumar@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1MyBTYWx0ZWRfX3hKngQlJ4l4Z
 kpV0C6pSvlPKD5WL66JFA6uxhwr+sMwMPR7MelpNnnntV7WUl4Jj0qKNCoQm4l3jzJ7zbu1W5wP
 YAaWkc3sxnArqa5QaRquPF5oYsDcABU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1MyBTYWx0ZWRfX+IiC8kKvcFAj
 r9JFTNdztM3wA9X5vktWbuYWlHTkZV0CAgykDWk6xiyxTAcAnfVw8aLK6syqdi86T5huP+2D20L
 k/z24leF7yTN/qIU0crnx91plFPgaMAViBYW6ZHzszoVgI2/s9P67WeLnBnsM8sKl14FBjo/vbM
 0OjeJn+/WcAiGRmDt8nhX3BZ0y98I+1ux5F5G5HvL/6QI4i2P6Gi6XxlK1N+bPfgLpqEfaPmiv8
 7L4HSBT29x6s0jLOCPqzjr4GVWy20ZTTVWOVy0NMEppuVVOKH4r6qxss7CqAJ7DEToyMuzzsDsg
 UFc47tv14fBs2VovGCqg4Zf6y2Q2W5aj18Z/A+cQha+K+7KHOTmbT+KOqBstllPCVvlsCfu4CvZ
 Fno04nDSHwnH8YL/+tH+JoOxAcIErYXb0CIbQS4mkgdrVu+9h87+6sZFlnMTcrQecfYFlhV8sJC
 AhaqDcbGy98suayItjQ==
X-Authority-Analysis: v=2.4 cv=BNMmP1QG c=1 sm=1 tr=0 ts=6ad0d363 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=nSxbz2b1ZoL0s5JVDngA:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: lEgC_bYf-G1z6H9XjFxS8TxhY7AaFC_h
X-Proofpoint-ORIG-GUID: lEgC_bYf-G1z6H9XjFxS8TxhY7AaFC_h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150053

On 10/12/26 3:11 PM, Akash Kumar wrote:
> Add support for the Cypress CYPD6129 dual Type-C PD controller on the
> Talos Lyra EVK.

[...]

> +	regulator-usb1-vbus {
> +		compatible = "regulator-fixed";
> +		regulator-name = "USB1_VBUS";
> +		gpio = <&pm8150_gpios 10 GPIO_ACTIVE_HIGH>;
> +		pinctrl-0 = <&usb1_en>;
> +		pinctrl-names = "default";
> +		enable-active-high;
> +		regulator-always-on;
> +	};
> +
>  };

Stray \n

>  
>  &i2c5 {
> @@ -59,6 +73,68 @@ expander3: gpio@3c {
>  		#gpio-cells = <2>;
>  		gpio-controller;
>  	};
> +
> +	typec@40 {
> +		compatible = "cypress,cypd6129";
> +		reg = <0x40>;
> +		interrupt-parent = <&tlmm>;
> +		interrupts = <86 IRQ_TYPE_LEVEL_LOW>;

interrupts-extended = <&tlmm 86 IRQ..>;

> +		pinctrl-0 = <&usb0_intr_state>;
> +		pinctrl-names = "default";
> +		wakeup-source;
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		status = "okay";

Nodes are enabled by deafult

> +
> +		/*
> +		 * connector@0 is the USB0 Type-C port with SuperSpeed support,
> +		 * routed to usb_1. connector@1 is the USB1 Type-C port with
> +		 * USB 2.0 HS-only support, routed to usb_2.
> +		 */

We can read this from the of_graph below, please drop this comment

[...]

>  &usb_1 {
> -	dr_mode = "peripheral";
> +	dr_mode = "otg";

This is the default

> +	usb-role-switch;

This belongs in the SoC DTSI

[...]

>  &usb_2 {
> -	dr_mode = "host";
> +	dr_mode = "otg";
> +	usb-role-switch;
>  
>  	status = "okay";
> +
> +	port {
> +		usb_2_dwc3_hs: endpoint {
> +			remote-endpoint = <&ucsi_ccg_port_1_hs>;
> +		};
> +	};

Likewise

Konrad
