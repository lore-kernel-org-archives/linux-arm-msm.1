Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C402E4477E3
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 09:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787047037; cv=none; b=oMDsrB4OX39EZMlDELr0VQxmnDwrpaxyf7Te9Xv4W+7BxUY2+k8w2UAHK0EER489uVRchdjpYD5rZMnL5H8OHuNzh5arCw/+n7CG6pJyhgSfIPs2A2e+8ZsBnc8xLdCcSRBAv2Kz5Z8t4uVOPKjLYXzy983Nm2ITbwWkHvUOBW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787047037; c=relaxed/simple;
	bh=9L3FrRvXQdWYs531pX5xZozuFPeO/mTA8z2sqTPlZo0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uzTW7St6Dej9CoYvNU3FMj/RjEyF6AnoQVxbYPtWrKM9mQ1E93CQiFPqze97GmRGehENtzA3wBa3hTsNzlR4N5QwuQv0kgGX54zOC19f7Fv3O9QtmnPa5v906/74c3f458FBmdURwLpaW/ltrKSvHmiidv8Ue2XXXOglAU1gX9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fm30JKro; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=acDxmSSs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fm30JKro";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="acDxmSSs"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I8BJ0d243062
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 09:57:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	StVit9BC+22sE9IEMOGQ8OH6qcU6UJJMBrq8fRn7njg=; b=fm30JKro9bJpSYu+
	sGJN1fKuNHUGn82cvjkrCwrQXLZZJV4BQ7Nu1eUWoFvpmZbWIAIbEgKWEVki2J1Q
	BHTaqzeCvqUjiXGX1nY1HKL1sDf4t0dAAdPrhfvtiX/Mtp8ILSrckoJ3QdS/7cEy
	jbUwIdHRPCjCDXJvXBYsS+oJk+/p285+QtE3fbXF1xpA6EAkseAbTEXvdHLOVVcv
	EXryEvbgLy41sJiw0VxMb4djKd7ZL/dXGMdsF0yIyY++/3CvlnEt7w/Z4KbqjL8U
	oATpYVeOUTlJUqzRRT191gtTsXBIva4VZBVX5zJMcgvHOwJ7GWMLQcXUojrcLgo1
	IIF6UQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4ea2hw56-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 09:57:13 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52d57d17d6cso6169051cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 02:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787047032; x=1787651832; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=StVit9BC+22sE9IEMOGQ8OH6qcU6UJJMBrq8fRn7njg=;
        b=acDxmSSseM2QhoZdmHANQ7sY7nVHRIeGHBTQK2ANcjPmzTVmp+QvGDQ/VNSOwVF0Gq
         JgOS3BqUSrOpXftoO98CGvMvoPQ3jGR7NaPC1t09oZVU3aqdrrf8Gtr8bIPkY9IcJUdB
         jRNfyaWH1uHkfU7U1iSdZZovi90XLZgWqzaFtF+OETMFCgjTrLCMXaePWwY0eByFMOpE
         86RttydxW7sXdCzmPuv8quBfAIqxGYrMM0P2AhgWyYOfDSHG8TLHqxktHi3L/+VhQlvY
         k87rDfD8zU8JH81Yg4bYOCB4VIAEPaFFhGMT1gIy6zolKPLXduv8KwsvjK86mqjRRT5Q
         DkMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787047032; x=1787651832;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=StVit9BC+22sE9IEMOGQ8OH6qcU6UJJMBrq8fRn7njg=;
        b=ByKOGFQ9uXRtuzTkVrvHSfdTVoqEzsSeWZXk8a3nYesIK+L0FcUOppdjI+hDlMblib
         njG1yuAHzStROlg9S+7Mh/9RuPKsvbUI/HGIsQ9vQSweq0FfFcsirmE5BNmXUHj6vN8o
         zcCJZYXmEm2l/h/+iUFoSgePWpUzAAwjMAqrSwzrceIucZHdnXiBgMZSp82GICELs4my
         FUK7teKMQdPNUYCa1UO+xDYFnL2wpBbA0/Wx3+5snJvSJfylCpnFOGA/0x+6R0NlAJN+
         9oD+hu9cSu5zzJzOoGu9jDmUNMW6hcrF4NWZLv5DFzhsN0/9FG+mAPLjIx0Kwou3Xe6j
         Vx8A==
X-Forwarded-Encrypted: i=1; AHgh+RoRp2sqnvhTd7YkZ18sKHkbfUNyky9cxrW9KoRKtHb4tF/9uMajHDWwn2c3aq6qbS1K7RCYKmHV4o7qrBwq@vger.kernel.org
X-Gm-Message-State: AOJu0YyZfYn0VbUxicclMMuSPzvvhiLWfu1UlIV9VG1fu2R6Ku+zjDkc
	OoK5NYctsw/Y3Nlj2MmovOoloU5fnkJGH9lPOCY3pJIn8WTRFpSAkMbLEsnLimKL3V0h0sD/FH7
	G6r66aaYAW5KeHqiOHMgMkXlBcvHT8GcfnvqMLNTH+bBFzmEW9MjifIUnF00uizLFYdSQ
X-Gm-Gg: AR+sD10K01CzBETm7ud/JoQb5KpsRi6B4/a8919idYR8wHPn/0yq02wzndWVY9rKf42
	GY8mjVts60xrYHDTsBSXFUY1DtfWFmLyA8Eurv0ZymjyANPXYPmXaaZ0Mr3Vg6UV+Sv/idNJo35
	6YF8TJKYu9VeSZE3NGWbNIcG2pD/DOdYQWkNU8VPKwEo1q+Yond/WwCkdNnFyU73TLYU1P/NYLC
	GX20QsVtfS96EPXLwCWKJNA+DU7TgsnTH8iPjPqOSO0J9IEinDKQyjEfk3qUiEpERUB1lT1r0+4
	r1d36334B9v2ilEFKDOfMIcchTbvDMbKTg0elCCxme753oxZJ8epulCKatvuMouG7Q/pkID+BaE
	1oyv55xqcR+WRIRVEEMq97ryI
X-Received: by 2002:ac8:5fd1:0:b0:51b:f40b:2fa2 with SMTP id d75a77b69052e-52d852d4f3dmr228656121cf.1.1787047032603;
        Tue, 18 Aug 2026 02:57:12 -0700 (PDT)
X-Received: by 2002:ac8:5fd1:0:b0:51b:f40b:2fa2 with SMTP id d75a77b69052e-52d852d4f3dmr228655901cf.1.1787047032035;
        Tue, 18 Aug 2026 02:57:12 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2185bab858sm129104866b.53.2026.08.18.02.57.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 02:57:11 -0700 (PDT)
Message-ID: <398f2270-9d7f-4e23-bf4f-ef02186a2be7@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 11:57:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/10] phy: qcom-usb-hsic: engage HSIC mode from
 phy_calibrate()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Xu Yang
 <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Peter Chen <peter.chen@kernel.org>,
        Pavankumar Kondeti <quic_pkondeti@quicinc.com>,
        Stephen Boyd <stephen.boyd@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-phy@lists.infradead.org, Greg Kroah-Hartman <gregkh@suse.de>,
        Peter Chen <peter.chen@nxp.com>
References: <20260810-msm8974-usb-hsic-v1-0-e5f93ea76ffa@oss.qualcomm.com>
 <20260810-msm8974-usb-hsic-v1-4-e5f93ea76ffa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260810-msm8974-usb-hsic-v1-4-e5f93ea76ffa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA3MyBTYWx0ZWRfX8bCrhJo/6KmR
 O7NuoTZvKlY/lb7+ValB1qx6rFDFpmSaB2VBzhY2IvDZIcAviVdGoOmoC8bkoycwlsv/DB5mTL8
 nAWZgOG+Teg9LprThSFTGJCus3oO78kdO4AQqUIb3cfjAAI/lqBZmcuDBX8qLkfCrorWgggjF0Q
 0KSwT7xsWTWyoIPp6gX0PunokDO2eSxRXqSmG+AkvRJjv7QWDZUd5ERE18BQzw+e6wlY+QbVSK0
 HKevjbTsPrgF1l2159iaMqQ5jxPL/JTA7onaktxQdFfE2NIsEPzH3P8Unt4sNC9a5KpGiwzBZNW
 vjKzwxhVi5EVvkkrqiBqqU6/rKk2j2eutovdxkrfuVjsSrCi4RzwEuYQjhtZ5MJIKgUACZlCdC3
 I2mox81bs6JJzflY/jNDzDInskstIqttytU8aeXXnsa9IAQQDf0cU/QV+E/QYCXUv1sQOUcl7Vs
 i9dsMQ0pmOUfxnCLqcA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA3MyBTYWx0ZWRfX1B2XhiUy2FCJ
 E6mHdP72m1xnjbrOJkwOqasCB4MVqd6fTopUTUmGQsQwzn3nRsDk5xRCtHB/pOiOOQYPBiLm6t+
 o2+VSVZEyclDIvR3RuoFlyRllM7Sgd0=
X-Authority-Analysis: v=2.4 cv=XtfK/1F9 c=1 sm=1 tr=0 ts=6a842c79 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=pCBiGHpxg2lVr5E8ZqwA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: r0ho3vAVkmGpA8J3vqaMLElF0OOSO-YN
X-Proofpoint-GUID: r0ho3vAVkmGpA8J3vqaMLElF0OOSO-YN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180073

On 8/10/26 5:42 PM, Dmitry Baryshkov wrote:
> The PHY power-on sequence ends by engaging HSIC mode. With chipidea,
> power-on runs before the host is started, and the HSIC connect of an
> already-present device is latched at the moment HSIC mode is engaged:
> performed before the host runs (and before an onboard hub is taken out
> of reset), the connect is lost and the device is never seen. This is
> why the APQ8074 dragonboard USB4604 hub never enumerated on mainline
> while the vendor kernel - which performs the whole PHY sequence after
> usb_add_hcd() - sees it on every boot.
> 
> Keep the calibration setup and the pad mux in power-on, and move the
> HSIC mode enable (and the auto-resume disable) into the calibrate op,
> which the chipidea host now invokes after the host is up and the
> onboard device reset has been released.
> 
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
