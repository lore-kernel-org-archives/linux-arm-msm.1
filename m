Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5EC3C10B0
	for <linux-arm-msm@vger.kernel.org>; Sun, 26 Jul 2026 17:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785085737; cv=none; b=rz6e9AdjZlR3vRvfbNJoJNOstu8RnAda1S1iWQ95KpATe/ZeLgCh5zzuwiMFotZvsyvBXoESx+sdIT5qfozuKeC6r8IXCXzD55EaRUG4dl7yFkdr5rSvwPYScYElyXTGVgto4qY+cxTlPrI1K+8Eb8KlDOS22JsqfLn6CpKFP5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785085737; c=relaxed/simple;
	bh=3fweRvX7MMmIfm6fBBdLurF+STbGvyfWftLxuHCdRxI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GjRTT5hLz1rG65dD0or5txriaucKHJySEEsG/qmv5mWhCSWtW1WZXKrsestf6XMAUEgu36P3WO0ctaGSZp91FdOQn2FeoMmrqPYlhidlGFWREfvtZ9A/rJzFv/EXLT6SFJe84UNlkkGBTKpL7ngNjCWqrTO2qIxoryAe14w9WcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lq8foyBX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BSVlyMlQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lq8foyBX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BSVlyMlQ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66QH6tAW1190298
	for <linux-arm-msm@vger.kernel.org>; Sun, 26 Jul 2026 17:08:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wf5PgZtlT70Em21ycU9Ff2GtlKLobB73OXMoqmEXkMc=; b=lq8foyBX9L6drq12
	ZuDookkAaOfZkS5kKuhL3iugpv12GkKl2Y23VadUuboRqfqaEKH2v37Eo5PZBQnV
	szKo0Q1EAJeNWGr2yidPbBQD1y/kb2LUMd4ZAIYKujKQ9Hd8cD15OAlTfzV1qZPm
	BNBi1bfByifqcABh7vBKw+2rWVs1HXfKd6dhyuYX0PuO2tTrrWUxrOwp7rRB/NtK
	36aPa7UJpvqsKTMiW5Tm77HAmMtt7TIklU68meS+kSG9Z1kGJAMTbF1PxTkdCj0T
	tBNH9KM5C9Lfss2DpBR7iE6kLtOE5jCCgqNc4iifXuxtmfk6pp8yRGq/p5jDJrIo
	tm/7eg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmjgn3s9u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 26 Jul 2026 17:08:54 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cacf17c7e0so27273155ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Jul 2026 10:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785085733; x=1785690533; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wf5PgZtlT70Em21ycU9Ff2GtlKLobB73OXMoqmEXkMc=;
        b=BSVlyMlQYByqbta3Sfyz6OfK+dfq53H7UJqXq9ZDj1Or7R4cNsc0OIcH2PTW3n79gw
         YL61qEu59cT+idZb7ezSHZjMx5EaM8SR7HveXAJIOYSl0pAjcYitOIxEf2acXm41/k/x
         K4C7U5XWndSXZP26Rad/EP4j+FYyo6hPKehITneXCqv2exNYa9aXSQ0p5hN2MQPiJiau
         FIeYCU0kCNaxnDhNce9tmX982qjLq9j/fJoHxOU5/dSM0QxatDvNZyrbgcOkfK2saICm
         +xrUV1nEUCfCqLhjPk4hFeklbvM/kIOweB5W808aK+E5C9z7WwbXJ8pRXrm5gDD5ZCRe
         0RlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785085733; x=1785690533;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wf5PgZtlT70Em21ycU9Ff2GtlKLobB73OXMoqmEXkMc=;
        b=D6s37avkcCjGh10FRuFeYEfC7rODeGYDWgEFSXDix3hNN+SGUPV+KVOYbplLBuvAqL
         nCnfY6ax6hoV6pPOZ65TZl9NFYEjfAdqdLQqd4V0QUY5oAeI58cumfW/4DSfFKF9kDgI
         atHGbE0tH+fxUVqs9HptJUQ7f7GGa9IVmj9TI2q6Ot5ESEweakS0B6B1NhSAUVvP5HVv
         ffUpf/d660W8UtocSMLm9c9bR729PVhjXN7uWZLSCUZujjGctAZQbVXkTR8CY0xJ/rJ5
         GZLlMRsurZLx1PGnurnnt18uljBcoiFtWl+Y4F5y9H/n6lMqk7WM2706yXU7XQmopXJ0
         dk8A==
X-Forwarded-Encrypted: i=1; AHgh+RpVzLGgOKUb81Mr25Mm1TgUIZUY+4vLEfzmGiZVVfaX4JmtEe4QLOlez+jmyeVxlRSL0NDgDP0pH8oRcNyh@vger.kernel.org
X-Gm-Message-State: AOJu0YxCb3IlqA+311jtEBSqdj+EF70flqOi6cCrG+VCKHrEbwgqApzP
	07kfZfMiUpSNIBRDvsKSee8oavcH2d/gFMlAK2XgBlv1MTgTrtl+CFkmYo1X5jgb1sT+NQ+MFSp
	JX3Pgf61vA5Oi/UD4FEtJzTPf+vQHQztiBdcPfMBkZLM7fM5kmlwuBVhS+zlxj6bK968m
X-Gm-Gg: AR+sD11TTpyt4tGxU0XTRYZNB1+6c3S7cVfbIXO3W/HkSfYHiua2kAA9eAIth6AghUE
	Z0iwQQQvMmXrMjvif1i7NRYMxJlS4wkkEs/h/D1TgF/x5LfDmAXFApASOe3LpfOjfarJGNyCAHq
	dg23Filra9tiP7QvIUWSTwk6sLCXnwRgxOYQnzwb64fKNo2IXP8WEBZmsqPEFop22volsaPRnyG
	dsOlq15EpWx7dt/WpNK5QTdieGnJuoicSkwdneDB3adJ3cOsDK+iqfpuBrvCmhWDJR6x1r3N7+b
	7QQN99JkHXm+Qpr6ZVhDv7NDhk3kLFpbHF338nYxkeFUR1ZZPONubUAgqhB2HpCJhA0lQ5CKDHW
	UM0mqxUxSxck4UHHXEUBNvzOGVAnrs5vUmjVvKbgog80ZC70dO3OS2e0fA4/wcfnCkeQg
X-Received: by 2002:a17:902:ce83:b0:2cc:777f:d67c with SMTP id d9443c01a7336-2cfde795576mr52293865ad.13.1785085733529;
        Sun, 26 Jul 2026 10:08:53 -0700 (PDT)
X-Received: by 2002:a17:902:ce83:b0:2cc:777f:d67c with SMTP id d9443c01a7336-2cfde795576mr52293705ad.13.1785085733122;
        Sun, 26 Jul 2026 10:08:53 -0700 (PDT)
Received: from [192.168.1.9] ([122.177.243.104])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde7f442bsm21570895ad.65.2026.07.26.10.08.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2026 10:08:51 -0700 (PDT)
Message-ID: <49d0e412-4561-4f4f-b00b-b77dc9cf143b@oss.qualcomm.com>
Date: Sun, 26 Jul 2026 22:38:43 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] phy: snps-eusb2: Set phy type to EUSB2
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org
References: <20260723-eusb2-int-handling-v5-v5-0-f32ea6c1a318@oss.qualcomm.com>
 <20260723-eusb2-int-handling-v5-v5-3-f32ea6c1a318@oss.qualcomm.com>
 <amPdeL2GWkNhPoal@venus>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <amPdeL2GWkNhPoal@venus>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Sr-ckK09chXfWyyig0gTGgViKjzTwGvr
X-Authority-Analysis: v=2.4 cv=HMHz0Itv c=1 sm=1 tr=0 ts=6a663f26 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=SscvhSW7bbCibxPycpFs8Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=gCZJ6Er7C-9YbjHnqbwA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDE3NCBTYWx0ZWRfXyZcXcuj01HQq
 q0owVsvsSWMV5kvW9Jygm1s0k1Af0NBf+qToLdfZdXzNVw2OT1cxseTclI8f/TOaOoxaG5wnFVl
 Q1PAQ0dP6q7WxrC+w5MhbNTCFY2wr2HH2cQTc4rUyYuCUn54TOI3ymP3PVWpJD9iSUcA3pB0HuN
 CutL+QinZ2aqeBn2yfRQfA7vGThzUQRqFeCroq9jf7DzxnP/rEDUbkVYVxcyjT7rkIM94vOR2ei
 c2iBHBy92slS16Kb1JvSiv7YZ1qLQPW5vfWeKG+IJm7ZCDT7dlaiF6vff0dASL3eCnZexAyrIuZ
 VIVFBBWwRToJXeZ0O+bfhARQF1z047THi4/b+CmSsEm214V4uMTH9O0dIHQDK+LQXzB5KYkOuoV
 AcMBOXKS2J+biCvYqiFjq6+aQywjtiwOg1A4r8Wz0JgXwsPfIOU5hz41yWk7UpoalUlT2h8b7LA
 g/HtMKz3qOEBiaptSzA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDE3NCBTYWx0ZWRfX2GvWYM7tOTA/
 728k7lPI39MZtF+gXap17tGfyMR98kScTKnZTDrxT1wCZkZPpQ34dAgvSFa6ZZR6/4SZncenB1+
 KkGFfy6yQl/5XmMlDTrdxUXrRfd4E/4=
X-Proofpoint-ORIG-GUID: Sr-ckK09chXfWyyig0gTGgViKjzTwGvr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_05,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607260174



On 7/25/2026 3:21 AM, Sebastian Reichel wrote:
> Hi,
> 
> On Thu, Jul 23, 2026 at 04:09:06PM +0530, Krishna Kurapati wrote:
>> USB controllers like DWC3 are agnostic of the kind of phy (USB2/eUSB2)
>> connected to it. Set the phy type to EUSB2 to let the controller know
>> the phy type when queried during its probe.
>>
>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>> ---
>>   drivers/phy/phy-snps-eusb2.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
>> index f90bf7e95463..e139b17bcda5 100644
>> --- a/drivers/phy/phy-snps-eusb2.c
>> +++ b/drivers/phy/phy-snps-eusb2.c
>> @@ -13,6 +13,8 @@
>>   #include <linux/regulator/consumer.h>
>>   #include <linux/reset.h>
>>   
>> +#include <dt-bindings/phy/phy.h>
>> +
>>   #define EXYNOS_USB_PHY_HS_PHY_CTRL_RST	(0x0)
>>   #define USB_PHY_RST_MASK		GENMASK(1, 0)
>>   #define UTMI_PORT_RST_MASK		GENMASK(5, 4)
>> @@ -597,6 +599,8 @@ static int snps_eusb2_hsphy_probe(struct platform_device *pdev)
>>   		return PTR_ERR(generic_phy);
>>   	}
>>   
>> +	phy_set_type(generic_phy, PHY_TYPE_EUSB2);
> 
> Isn't there a potential race condition if it's handled in this way?
> 
> 1. phy-snps-eusb2 probe: PHY is registered
> 2. dwc3 probes
> 3. phy-snps-eusb2 probe: PHY type is set
> 

How about we do this get_type call after dwc3_probe call during 
dwc3_qcom_probe. That way we can ensure phy is up for sure since core 
init has to happen as part of dwc3_probe.

Regards,
Krishna,

> Greetings,
> 
> -- Sebastian
> 
>> +
>>   	dev_set_drvdata(dev, phy);
>>   	phy_set_drvdata(generic_phy, phy);
>>   
>>
>> -- 
>> 2.34.1
>>
>>

