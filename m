Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795784083;
	b=1dh7WIsID+sHBzbwGCwI/ytnZBHUtDcu9S6MVy34U1SuwgAH1NvQ6vvkU45uvrMeOCpi
	 u4/92r8oBZpqJMTxRaFiSpbv1FtxGH4gkw60z8XS9qSIscYIRI4gTyZQIWC42gTPIMeLs
	 ei97SoX+1VE8buoeUOEUkBT4QiNyKeUtnYNoxws4X400uKL969moPMYq8Rgi2/pfx7Lqq
	 oh5GLcijkffP/KlEOcIiTts3SVk4+86aCC7JSOxaNvg0qLowAWaYxF916zP46U4NTdtUL
	 1mq7UC8VbZR4vYUG00eHP1qozugSBkQSWjHN8WefTn5brbBqOD9ONvs1qDl4Yoel3zA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795784083;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qyG7mz1+iqRSmDE+0/L6t1wuS6VVHsnCtrQ54KSfWOo=;
	b=r7PKLn8t4TyyuUZq/8XDevwuDG8jOuK9ssYbBOsO0JMldNvzt0RV/EZ7iySQoV7GKDRw
	 xsAPSrFJjaFRdLE4C+DYZ2pp0T/1ZDUSDpGgRXjugLYtl6XWzeAYobeHwOE5a93ZRzhU+
	 MHjqoyfXRvbmf00+jc0Ee78Jd3S2te1wxoWU2RJQSdRUO+EDdW0w3+XyMc1VsFqePsV1h
	 UVq9nl0s2PXuHvVPTBnRFRYkvoTzjgLJpBqQ+PeVuAvumxc8/uB490PS2Rkaf/c4lyz5r
	 985mhHMVyO27othbOgjqyaRHE8tZkEdIW8e0mBixdxMH+R+DAFwRMLJZyjv+0DQj9zQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="PIz1R/Qh";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="X/RJQl35";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AAC5606A333
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 12:54:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AAC5606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PIz1R/Qh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X/RJQl35
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARChBtE1929208
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 12:54:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qyG7mz1+iqRSmDE+0/L6t1wuS6VVHsnCtrQ54KSfWOo=; b=PIz1R/QhdUpCx97W
	tWM0/xr0ThcMO0YawZmNyMiHAyWJ/hBs5RDKuyLd8tkeQ7h4VbaqSsPs/sYmaSg3
	o2IFqUo5zOfS6w93MD3YB10yItDy7rejlWYWPARD/2o13K5dGoT+WATdk4wTHCRE
	SNeZfImpSbrUR2rg5UIZbyczLM8/N5Q26ZJTGY4s2VVaPE//3qaOSSFcD+xYnyht
	r+aInWF4BQw3KbHtC7a9NQiWO8/t3MgYvSN3i9HrzmTix1iW4hIRiKdi4QgmvVS4
	enCbsYffVPiHwa0tCDNXtigGVGMJnrgDr7iHVQlzmZVt+2yLXHd89FFHA+R+SmX2
	/v5/Ew==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j756k9afp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 12:54:41 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5ecdc7807f4so354794e0c.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 04:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795784081; x=1796388881; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qyG7mz1+iqRSmDE+0/L6t1wuS6VVHsnCtrQ54KSfWOo=;
        b=X/RJQl35OwXkpBuFVpiHbXoujn4OxURb244259C3upSvs+Kyb6up2BIgvRdaWjv/vs
         trrv6UHlc+xzYKBdRiCUwXDY2WfSasI66D0hVKLHMtgVe9MsNZtARLPpSEO3SSwl46VR
         lngISoaEjIqT1wodpCXnbX+uLzc+SyMop42tZm+9dMlYXeeNI4RMPEyO0FG4aRdNwXU3
         zxPLPvv8RlFeghWKTm7KoSS65Lsf1HYqN4jAItRYerIMgm6Xvlt3NtVxqrvTq4Cavuqj
         S7AMiYUxH5pza1X4uRNNfrlefwq2bfM66X4roc3zlUeJuwIE56SnfNR+NEKHSfudBhH2
         uDwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795784081; x=1796388881;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qyG7mz1+iqRSmDE+0/L6t1wuS6VVHsnCtrQ54KSfWOo=;
        b=W3mp/LZ/GolAm+nBrZ+pA8CwQTFwJrHiG6KkDOzHTkijHRQ06XuHCYssAWvQmqsrU0
         Eoqko2STFcv6Rrv6Svjiw3OWhkJTqPLGPI5x44PBQxFMH6FEgTV5TL8fV3EBV+oPRjyS
         d8aqtI7ndwdKZNCmXFGPBkDtYXJro1HzDB9by/gNzbcki3hz0dkcenNofOvnAYuCITIr
         TInRD5SqDnHQZ4euTqjxulfEFd57LnnTLP+fT9OWj9/T+z9Oz78/3yb9/uX8YT2RTT5U
         nqS2NBYdnsarRQY2+lMfVhu46pYe+DoBXy6M71z15KAPs5OErW8XglVXSBvxxbMe7Vw2
         /CHQ==
X-Forwarded-Encrypted: i=1; AL+hErGswRKuYMOXLpecU1Oww83iSCzMZnCUZJvVDd8zmaKIijoRxBlITEl2BFmJ9EB8V0iNcp5LRAR0TfWvPAb3@vger.kernel.org
X-Gm-Message-State: APuU4Z+omaVyXw4Hij4/rxDlKvCsKNffQTpPG7qrz/bMl3oqunRE8ilR
	hUrBv7cpXFvWgDe1GXt72kiH4bJwS6m8+J5D8CaGmtrHygolfuu1JI+edO86BaM5P5bfyh2DBA/
	Nn69JE1yTii7EqCjkC6GgIuvwvFB1F8Sgm/uFQNIULUXMndH5fLhkr0c0WtUeP2u5BMgr
X-Gm-Gg: AZFdTZevZy23MeDNeW0TVb22ba4dnR+cAfH44hbbY0Na5XPL1FNPN111wwUe5lNpt/L
	BeLTsdLka1yvRsVxGxtOR1qKbCvvwui53xApTXDtNyj0b4VSVx9CJdZH+MGSgNWG8TZOVuIWKzu
	WbSDyylSeLCNZl4/TY45aBHPHujiqEmJtQSptDbOOBvoD27a6MDBpjzTPhXbFyEZyEzhN95zkMW
	GslcOd4lRnYwP1/b/PrN0RSxTxS8eukAtvH4iSU5yIGTtaIvExU4GAtGg8Qbq0ExmQ6wDcWI4OQ
	sf6nHwX/FuBREKEd/KqhnzZvOVNeA3Yrm2pZ5zMAkL7GoDK5zo6ax2M8jvKSfcS7ueW5TY3hwOY
	imy4dcX1xhL3JrLxRKwbbhcwwOLryzV1N581qup/1JqezW+dokn0zkQcd+YhAZHtVYeTOU48=
X-Received: by 2002:ac5:cd3b:0:b0:5ec:e2a2:b70e with SMTP id 71dfb90a1353d-5ee8af4a71fmr16430672e0c.4.1795784080732;
        Fri, 27 Nov 2026 04:54:40 -0800 (PST)
X-Received: by 2002:ac5:cd3b:0:b0:5ec:e2a2:b70e with SMTP id 71dfb90a1353d-5ee8af4a71fmr16430642e0c.4.1795784080301;
        Fri, 27 Nov 2026 04:54:40 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba371072f6sm11126122a12.28.2026.11.27.04.54.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 04:54:39 -0800 (PST)
Message-ID: <bebd75e6-3d67-4f1f-8909-f7a9786ce3d6@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 13:54:36 +0100
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
Subject: Re: [PATCH v4] arm64: dts: qcom: sm8750-mtp: Set sufficient voltage
 for panel nt37801
To: Arpit Saini <arpit.saini@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Linus Walleij <linusw@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mahadevan.p@oss.qualcomm.com, rajeevny@qti.qualcomm.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Ayushi Makhija <ayushi.makhija@oss.qualcomm.com>
References: <20261117-resend-upstream-attention-v4-1-3f11ab312d2f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261117-resend-upstream-attention-v4-1-3f11ab312d2f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1MSBTYWx0ZWRfXzVYsbMrMwj+s
 6TPRISYqaYFrzjfc750Tq5yKtga6JqLIiP/gIwYKo7gSP6s7h3p5x+2OSSmsG/OlUAt6TN/LdM1
 vcAzy3mInhL5diqjjSi1HNCh3QTOXg+KEfCJv8jPRHsnb0yQZecsHSJd8WLYhan279ekhJApiE7
 GYsPVN3M84noIvd1Nz8S+b4jXlaVk4v8/aSKOkBrHy4ABNTr1tXVDOCtSeWAgV/n3/AqN9IpXZR
 c1wvHyWrxRoVam9fpWqGGApCnoH2nmYwATLTCayi/zIRpI7KoSoKPhn80dR4lJJ1iC9HM8yeHEe
 XulKgIbN/yWsKlOmnj7+3V27VTS0EUfunXv+Y3M5PzbC6En9jH7dS5ZcR2gCreRPrBTD4kanSOo
 iumLgAs9BiBR7KoCFxLPY2jplMG6aJH4CqAYeomLLPMq946cL2C4pvvaA7w+CDGVyiEUw4+sr77
 jOOrNWJNgOvRCdxFoMg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1MSBTYWx0ZWRfX4xjY/Ue24ebp
 OWSCQsIdlAUnnJkNXlrEc+azYHUws3Z49NqGSH/q125i4FuZ+kt16dXgIeVFMt6zCHnXesmPKYN
 pAYlJPr+hmXxVLbh2xRrIyQDTwQVDfk=
X-Authority-Analysis: v=2.4 cv=ebWo7LEH c=1 sm=1 tr=0 ts=6b097d91 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=MsdpSpnpVP8ozw9Nrd0A:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: nr6MKH6DHecqUSfCOYMIkSy4eZuAtZTI
X-Proofpoint-ORIG-GUID: nr6MKH6DHecqUSfCOYMIkSy4eZuAtZTI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270051

On 11/17/26 6:54 AM, Arpit Saini wrote:
> From: Ayushi Makhija <ayushi.makhija@oss.qualcomm.com>
> 
> The NT37801 Spec V1.0 chapter "5.7.1 Power On Sequence" states
> VDDI=1.65V~1.95V, so set sufficient voltage for panel nt37801.
> 
> While 1.65V is within the range accepted by the panel, the power grid
> documentation specifies L12B as a 1.8V rail, so set the minimum to 1.8V
> to match what the hardware is expected to use.
> 
> Fixes: 4fca6849864d ("drm/panel: Add Novatek NT37801 panel driver")
> Signed-off-by: Ayushi Makhija <ayushi.makhija@oss.qualcomm.com>
> Co-developed-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
> Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
