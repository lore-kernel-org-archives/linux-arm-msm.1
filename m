Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6570A3DB326
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 13:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788268361; cv=none; b=CiX4hXhus1zUfbk9AUxDDJBgEw6s7eBuH4uX7BALT/yXOdABy1kXqDfEk76j+xi+hHOA/2zLR2yEjp5B00O5RdkN8hX7vkMicjjlrTUAjN4dOkp5/tilx+ziB1CpGAxYRZchkS1/XwoyrSP8bb7h4WBaMpHkMCM/ixV6viZjWe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788268361; c=relaxed/simple;
	bh=zon7jp5adl5Y2eAG6oMwJian/v+Jmhd9AHSeiXrsZ6Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pn6ugAonQqtsr7+Ia2z44Ir4zd4UkmKm6CQkXSSx+q8AZsdG/U9P3k9fGPcvGHRqwAGlsa1dFNJc0D1I+RbFwcGD65xLFOMXU/zOFJ6uZBNnRcflIbf29E79evg5IGP2KS+RyPBuXcCDJibmGlP8W0Q9BHnpPkVSWoHCcFseTRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DcohuhmE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L+aGBt6v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DcohuhmE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L+aGBt6v"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJL8g2241957
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 13:12:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b4svtbf1ssYRglJJD6Szy4t0jDZQ1u+zIb5rrNp1VYo=; b=DcohuhmEjpLNEsP5
	+fXbY99VV61e7fZNptdUJbAuWi/YmvyDnnevc7K5Xkr7CEj5X4aJqdB88d1+mhW3
	HdYuZLQ+sG6fViTl6TYW0Qfrfc+FKq7PgQUA+0v++4qsHAHE+V4s1cKtMsCGi0Nb
	KjpAcNsSwoyJkpVO3bfvwSpPn5RcXNvzUxlwViTtydQwn5VFks6sv7jzeMm+P6r1
	hDpzD36D8r55NIWpK+RLS84IFhwrqSFhpPmyA4BgGwBk8Px4awb5XSi4XEFCVwa0
	o2uPwGAO215NpiTe/jaEKCqcjT8LzlCp/JM6HHRaV1/SPH3GY5IE50ol/ZH6Tfik
	ScrVFA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdvmm0q3b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 13:12:39 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c7a0e125a6so93365e0c.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 06:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788268358; x=1788873158; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b4svtbf1ssYRglJJD6Szy4t0jDZQ1u+zIb5rrNp1VYo=;
        b=L+aGBt6vJ12MxVnkGEFWFYMpAgeXiPowDxYiNzoThBJ3SUGX61PxoF5KDOIW0n0K3Y
         Xa+SKnnSoXPly/dZBPyrp6qMWwqA7YCVnhlYhUwee/fX9D4LT85EUoBN18aOX1t1DFJ3
         oYNcrIHd2moEYkBJP7KO3ZImwDXiAdThMhf1sW3FRRV5fAR4FCfO8YV2DY+uxTDgtXMf
         GsLmtAFwSzrfkdQqLtEQsw0FJLYuh7TDO6u8r4XOL6oG8t0cIyXvZiNskUrx9kMUNH9t
         IfSgfd8TWsKbadL5/QyZVgrwO/DUDgvIEL/wLaIiMQpZOgh4M7oqVUidnniHivRwyZoI
         dAOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788268358; x=1788873158;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b4svtbf1ssYRglJJD6Szy4t0jDZQ1u+zIb5rrNp1VYo=;
        b=sa4sLP8hZgER9T6NWS8Ra+bSqN8kx9ofzTO1zhVgoVHCiPFvNqC/NYAGFi3c/BlMKL
         sZta/ka3qtdGJTgj042oPZTEdgUUBHfofomNfKb6v74HLTz1/aKWXM2i1NAFNQCrhZ9Y
         7xmB6pxcANJtsAQUSZc4nWV4zynE2KN+2TLq3ERhP9ErGwYGD+D5Q06bWovfDWxWJIF7
         5Qo2qkdcOWV3nHpYLqA/oFYPT3b4R8Mu0KO54YtRhVuzK7GcSQAglD0QmHoh5utjyLQ9
         P0bUtVsuWbiB/Xa9DN4sJZm6UuYB1bZ/ZNoakl9LSpE7nJd8hL8UNn8KNdP2cpbcLnN3
         NPIg==
X-Gm-Message-State: AFuF++leYhiln5BSD6F65cb9Ysg2p8qU/nrierMEOOot/VsDv3khfW+G
	hlUGNjO59jahHtAM0GAEvd6Q+KzEsv9RR8zLpfu5fVaZ3RMkiHN96FfKV7cMd8l+Qt+P9chM270
	+O9aLJa4wXear4u4Qy8qSu3IR5fN8P2F8vhkHA9NKFHsXBxCgpp+ITjRquQh1Prra6Gof
X-Gm-Gg: AR+sD12Zq2pVfNg8sJ7gViGePbHpCOlZKtdsNlPRJsk5SYEL7yjrUUKrxNmIlPurXom
	ccqs3GytURVfjNfs4pMRyVQfSnar4nPZYEcZbmHBV48zL823hTl5au9mSOqAu0neWk9HdJp97Zg
	Q/lPDqE1UHq0Yv7FDJnMm+eEuKwysdQX5HFBFiRDbLx4rZpnrQhHb83pkI6aG64sUKePZu8XPsx
	9quPuV2xiqQ+qwgpGmJb6jUsDDM5i5S4KNn0z9/2uT5PZc4+b/l8pofpikcdKfYpDks616v3ThR
	qoHC6XBciHip9JM4pERVRdozlLUl+rlYubZM/D5QPkhMdxOEF160kdinHdatwCYgre26W+6Pm4Z
	urWxfgxUBPXuFoDkrVCgbNw==
X-Received: by 2002:a05:6102:5044:b0:780:6fc7:2181 with SMTP id ada2fe7eead31-7859956a0e9mr4248236137.2.1788268356865;
        Tue, 01 Sep 2026 06:12:36 -0700 (PDT)
X-Received: by 2002:a05:6102:5044:b0:780:6fc7:2181 with SMTP id ada2fe7eead31-7859956a0e9mr4248202137.2.1788268354886;
        Tue, 01 Sep 2026 06:12:34 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b605b1752csm32498e87.81.2026.09.01.06.12.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 06:12:33 -0700 (PDT)
Message-ID: <8651e227-5038-4684-ba87-df74b89bb903@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 15:12:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/12] phy: qualcomm: qcom-uniphy-pcie-28lp: Convert to
 PCIe/USB3 combo PHY driver
To: george.moussalem@outlook.com, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Praveenkumar I <praveenkumar.i@oss.qualcomm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Nitheesh Sekar <quic_nsekar@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
References: <20260825-ipq5018-usb3-v3-0-39be0955a6aa@outlook.com>
 <20260825-ipq5018-usb3-v3-3-39be0955a6aa@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260825-ipq5018-usb3-v3-3-39be0955a6aa@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: y6dd1V5Z1NCRORBWn94h5G9xWB33MCWY
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDExNyBTYWx0ZWRfXyffDrNSu+4Iw
 kp+o/99IzNKosikvscX9OJWoCIyISn5r4NqOqKZ8ocEyb5DmY0m3AcaCM5bzzQDwj8akGKcQZbi
 37ncZ6g4vT3i1b8EbOipwomiit3mUgo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDExNyBTYWx0ZWRfX1bvE33tA6aNy
 MGy0pRkeYtX+OHbXBAkUP+DC40Li5d9ffJQFkrwhqcCXBijVFSbBLBuJVR8ozLyQ0Q+9lbCC3w/
 rPpwh1aSk72SGsx2XCZ2nq3oc+kgi6sKoh1oU5tL4xYG0J9mYlI3Gs2YSTePw4toZfUSntxE/1A
 D6lpzszOe0FKHX9GMIZZ+LVWlnm7XpeK9JZj0a6Hxmw0wnaJofsV0uwZibdEILy0bX4KtMw7goz
 SeSOGPti2yoHutKRuoPF4E7xqm9nirUjW+jJ0vJ1hZNHksUXEpLQnXyRQ71dRj/wLs8meaLiAt5
 Pmq7t2QSfp17rrQdZpNeHtVVoLXfqOORF+3r92SdAZBTfHg+whHQvLEPEa/uLNh+umRBVh6ugYl
 5Zw2cc+hvVnLEHeHGyLtzmmjneJ3KkinF4DSyoOBHUWABkcmr3OKO5uPd6M4RYnHn696GSVxFnw
 FHUrYHfMP96FTKUEYlw==
X-Proofpoint-GUID: y6dd1V5Z1NCRORBWn94h5G9xWB33MCWY
X-Authority-Analysis: v=2.4 cv=GfwnWwXL c=1 sm=1 tr=0 ts=6a96cf47 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=1f8iOkyuOCog2pG1YhQA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010117

On 8/25/26 2:37 PM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> This PHY found in IPQ5332 and IPQ5018 SoCs is actually a multi-purpose
> PCIe/USB3 combo PHY. The driver was initially created for PCIe PHY
> support only. As such, rename the driver and generalize function and
> struct names to reflect that it is a PCIe and USB3 combo PHY driver so
> that USB3 support can be added in subsequent patches.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
