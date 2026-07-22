Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E99B37A487
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 01:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784685175; cv=none; b=mNz8vCS/8WxP3MSBWvUDb8nbLK5vPwkjXAiLN9V3pKllD2J3kXLHNlyIHagQyiazJkaF8NRYodDQfDD8WnDgS5XQrINqpFDx8JajNfOgu4IuvOWuBeGzOClSiJQ+xq62A0BAEXz6b8vq/a0Oi1aq8CdfekJqPCsV9B7VitRrICI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784685175; c=relaxed/simple;
	bh=wg4z4iYMd+KftkmIWByX2zZcL5mVsOnxvpqtNuh3aKY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kyZ/vWRJb8R45cwCEC3r7zdixDwoEj+YhJ9NBoyIGOpCwyIsTh8N5zPRcxfD0ch47WDlb5pm7pEWbVZNYMgUGJf46f94OYdstlm47cxFk0kFzLn7uwlz5+tVVwVGEoFuzpB7tmPoIJ4/G+t4MZhGYRZ6fqaa2XUUDnHoxOfX9EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NYqhXvL9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gpLlYoP/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NYqhXvL9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gpLlYoP/"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M1CJng334847
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 01:52:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CnE+UVT5W4QGFtLWhJ3bXaatQBvSFK8Z4xsF4Cr6siE=; b=NYqhXvL9pn0EynC3
	Q538fZ4MiKYbTuvSIyyHNEnepP9qUKYhVjX2ct/efNBJ9k8eQoBwvGMznC4AglD5
	qwRKH6oLhWAtPEDeFLAXYEBf3ELt0+ncwIrqTSJqcfbbfrmiD6WnBOp4ByJRHHJx
	6FmYbrf+McG1JJWW9WBFlHimCSVnEz+l6qZ3rKaHtgHSmnLUMgTye2xsYepbEez1
	r7G++GGtbXGFyHnRCGgz3zFBv4FnDdl8M50ccT7pMGHrTs1afm4hj6wYBv39WtpW
	Ys2xxYg/iIHwsYgnxzPbAslvPIj/VteznTM2TM8VEymweoL4CJo0hYwCtjPpoypZ
	cH+yeg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6nsuud9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 01:52:53 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cca5e0a0c9so235158275ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 18:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784685173; x=1785289973; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CnE+UVT5W4QGFtLWhJ3bXaatQBvSFK8Z4xsF4Cr6siE=;
        b=gpLlYoP/Q6cf+nFHd2cw0KCsno5qE8f2iD1CjjgRBkjv7EQ2X+3pXeg9g8CqFI8LLf
         mqAZEWSfcoND8P1du0Ms4x43CAkLc4pjHvAU0zboERsuyNzhhOtq7qriwZQw4qxBTS9r
         HMvAxo1KdBoA00nGAEj6u3zVR5jlxBh/lYGcT9tWbKSj4kH4DLomrKvnc+m6Ruh6BWB9
         MoQdhWCeoq6Mpk94kmFQfRN/Xi60teGfD3ECDXkERx/53oDP4bbYHC80kZWo/vLQTjQ+
         1hAfSl7vU9xFtk29MsoD/7rtNR2cLwr2QCEQ7q4xuKXGS5t7kwtz5uEbM9EfDQxPCIMk
         EKAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784685173; x=1785289973;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CnE+UVT5W4QGFtLWhJ3bXaatQBvSFK8Z4xsF4Cr6siE=;
        b=G7MkbUuL0u/R2gfm1KBCO/EAcaR/KV2uUVCdf8M6LoPzAkBs6FJyODQ8k/j946IgSE
         /8JydWfqvt6ovfOQyvXh07jEgsBFX8qILvssVXVdEqr2wNs84NKPoGsCXOTwACutzrX3
         5cTaK8uSlhRyswVyYjnqhw2zou8oobTdakxWBJxHcboI3r+XD58nMEscjrMjsH9+XCiH
         raBz6/EaLea3iuqI3oV+Jfa6l2FmP7kPf0v9WClk5gjH2eUuznVwq+mmwrcFMNxFlNxF
         LPNzS0+7+0GriF3KctUtPeqE22dZTxGTBPgCywz4waKQZedN4LkFtyup7RhTL0Xb8Tw8
         UntA==
X-Forwarded-Encrypted: i=1; AHgh+Rq/G+fpo7lS05YKjvdsTw4y14ZyhSUry8D7sYrCnWtJJhMgzSwI/WZwCfIwWiS4xBBOx+23QR48q0Tv7+wJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx92Azpq5bywLBCEfOvJqgfaaspHYqIYn+jkxqo4gpTSl8KIsEw
	yFzj8AD2G1FkD5MM8iAse6nISmxMy10udeCB8lkqyCl0iG7PMDaJd9f0ppq79qk0Tl7WMGDizqL
	oz1F+37shH6DKr1Ab8dU1+j6xqng9VS0YMCwLYdbwftg24pxFaEBUPPkTfhh8yyMTHS8P
X-Gm-Gg: AR+sD13QdQ+uid5FwYSyTU5KsQRgfqeUTIEzYX++0ViHsgJWGhusTcJldcl9qxZ2W05
	2ob86XswnVv6gtQhim6U2ZlF6lamzxiPOtLH/bHqVBkFoTsi3mqwZHeFoO6R/AR20CzlMg4AjiU
	nc2X3N4B2Qc+6gBe9l3qbAjXq/IksYut8UaiEjus6K2n1ehaS42cBkswaOdZfiYjdesXLFjLrvh
	+/wNeOCKeEj+Fgxk1cIkoR07Y309WhG6/TeO7hXlmk3fLp267sjbpG9WZ4gMXxt9OVok9p1Mi89
	86XgSWGr2kkX5UNKivFXdsfUVjVo/LfDcDboaCBL1UA6qxeF22OYfrLzAazEbPy+xb9wdJ0nLPz
	8N30baik3mf3UfG5KwYitufCtb3uW/FABYeO97y4auNQzKav/P2Vi0jc7+iIba1/Lz6Q5
X-Received: by 2002:a17:902:e944:b0:2cc:f7c6:8320 with SMTP id d9443c01a7336-2cf34a28988mr205660965ad.46.1784685173080;
        Tue, 21 Jul 2026 18:52:53 -0700 (PDT)
X-Received: by 2002:a17:902:e944:b0:2cc:f7c6:8320 with SMTP id d9443c01a7336-2cf34a28988mr205660825ad.46.1784685172668;
        Tue, 21 Jul 2026 18:52:52 -0700 (PDT)
Received: from [192.168.1.9] ([122.177.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efa39e9sm5675715ad.10.2026.07.21.18.52.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 18:52:51 -0700 (PDT)
Message-ID: <842b4369-3167-4247-a170-e62d5c78fce5@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 07:22:47 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] arm64: dts: qcom: Enable USB controllers on Shikra
 CQS platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260721-usb-shikra-dt-v4-v4-0-2e7a092d7f27@oss.qualcomm.com>
 <20260721-usb-shikra-dt-v4-v4-2-2e7a092d7f27@oss.qualcomm.com>
 <mh63jqjocq2mm6h5dpqck6okfmsugjg7frrehmd5t6f3mynojc@tpfnitctm6ye>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <mh63jqjocq2mm6h5dpqck6okfmsugjg7frrehmd5t6f3mynojc@tpfnitctm6ye>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Oyh7l4Lkd-WhmhKJ3k0ew7aJ0HC_i7d7
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDAxNSBTYWx0ZWRfXxwKnig1I673t
 H1YAp0mLLimXj/N+ZZo2gLzQ04rj0VDXoa6KWM7t0V9wWYb0Y4Qs3mie7fP5TYcMQl2voX7eZ/4
 UWFj5kj3NWa38J6Oraw+ZzxaMozwfFk=
X-Authority-Analysis: v=2.4 cv=ZJjnX37b c=1 sm=1 tr=0 ts=6a602275 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=cpTteeFDdnDplrLS3ufPgA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=idhYNPoMciAbT-xd-_EA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: Oyh7l4Lkd-WhmhKJ3k0ew7aJ0HC_i7d7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDAxNSBTYWx0ZWRfX0MQE0B7XF6FD
 u7UMvJzsp2/k0DJe8jYuvJogSzCeJeWlsrpXclWbpRsHiw9q0YYJ/NzBaeVkWQ+HJ4BoHiJ0zH6
 N7mMEb2pvXGZY6OX41QmLGAPFWQ8HudAj5RCQnh88p9C/20IybAwL531nPubk3JkkLE1/RQHf4p
 oibwKRrIt1pxR06ftiQD1AYae1ST5WQ5/GSrlbeLmzV6ID9lD8sx0SUyIdWvRqsSyzEZs+1Rx8k
 olA/RwSFhk5USdohiH+aDgzfup4OXCPrUup0AjSFhQYWqi3iD8T93ReasDC4NM2XxRe4wWvGqGR
 k03O8VvFRKIh34v/DwZWGQrHrQVb52lm/3GUxyeAaa5X/iSCiew0Yq/TkDBciXufGxDIWGyDFUl
 lrwt/2vWAQICP7hWhOjZ6lCBbvEGuXaelK78RzEsAeBvaL0X9ZQooj25Hw9n1W9cLDqzejGsuK+
 qHsGtlyzK5n2x0bNRDg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_01,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220015



On 7/22/2026 3:07 AM, Dmitry Baryshkov wrote:
> On Tue, Jul 21, 2026 at 03:23:46PM +0530, Krishna Kurapati wrote:
>> Enable both USB controllers in device mode on Shikra CQS platform.
>>
>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 35 +++++++++++++++++++++++++++++
>>   1 file changed, 35 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
>> index b3f19a64d7ae..006e24a62f5c 100644
>> --- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
>> +++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
>> @@ -38,3 +38,38 @@ &sdhc_1 {
>>   
>>   	status = "okay";
>>   };
>> +
>> +&usb_1 {
>> +	dr_mode = "peripheral";
> 
> Why is peripheral-only?
> 

On First controller of CQS/CQM platforms, usb-role-swtich is controller 
by PM4125 and on second controller of CQS/CQM platforms, and both 
controllers of IQS, its controller by Cypress PD controller. I will push 
out the PM4125 changes in a different patch set since couple of issues 
are under debug. And the cypress pd controller changes are still under 
development. Hence enabled both controllers in device mode for now.

>> +
>> +	status = "okay";
>> +};
>> +
> 

