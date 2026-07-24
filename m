Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC05140097F
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 11:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784894229; cv=none; b=Vb4SSe3yFWFkp1HV1HELTF++UoJbGYrpbzXTh0Bm7W0KyEuPkp08gSU8U57ctSmcCz54/5n+ILavGq3XlpAw4IzN9p4RlXkWsMhvBn4KHu7OE5mxZj3mjY8K5FD+hfD90nhjneJCJIenBbivtBvLC5zzQJ2HwlO9j97qrggwCy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784894229; c=relaxed/simple;
	bh=kZ4DyWaacZcCwlweWQLa4Y4zB6FfjBFIuFHC9igNK+I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ESeiRQTmgOTRs6Zbwo7k8lxvc/IjWIABoDjthEl5XImodi4ov+QiYt/kVOx4Wzfhi7xSUB5foIqtgv4OjMx1a5bVwK9w3kkh+aYu51wsPOnXTwg4FJy5bhY9AG3cVkmSZ/efUzkXGiga0IVFdbTi284+UVkfcwjWdQ64ASsCzj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aJucg/rA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kf33GaH+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aJucg/rA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kf33GaH+"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OAEQne2853489
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 11:57:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w5wFJquxy7zq65wK3cwKV75ni0i9dU8zjqPfSGQuu2Y=; b=aJucg/rAa18XWXhH
	2YyJtYvCnEY+XWqHJPwtPegNavMkic4ioIc9gz99wQ7XampUN59kwvJVF93LZzjD
	IDjYJpDtUuoj9qE3jsUKPuQJDoYDCfB8kWZdC9UcWXINcmBCwCwKiG1O0C+r/M+4
	VPiJCgIqh74E9TAa8MZk5VqEZbC70/lSKtoce2YrFxMVVKtcKzHPxCHYV/0OMipm
	ffNAIWpwWwxmwX0rkHcxNIVwBUj5Tg/4wX1CWQQfJ5y7NTWgYqzGoYxTAKCQYvVM
	pYZZbm6qqBvJB0p7M1khL3YesgdAwNy8ZWrxjtkwpe9Q/awurEIliR0wQXZnXwpQ
	3/BndQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fktahtue4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 11:57:06 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51cab6f7517so584811cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 04:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784894226; x=1785499026; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w5wFJquxy7zq65wK3cwKV75ni0i9dU8zjqPfSGQuu2Y=;
        b=kf33GaH+aPSvuyd5PKKfm1zB1Z869iZAzyBNaIOXYzv8HjajLlTrDl1huUk05GNIVC
         V0El12Sszn9bYaDhieX+9qs+7X2TBOgKinCa7e2qGcbH0ok5EQ3pXiiAIcyDJxDT5Mn1
         TA7q3wAX5l8fxCfmLJKpKb9toGtTLtUod0ykXNyUQ3KbF0noMIDKwYHQRKUoBtUwPsUL
         xbtFyfILlUkbOZJSqCkoVsk4VNJO0UT+pVG2MWu33d6b1WqMygpHvyuVDVBb0aFGzevN
         AJV66a5vFo3RLXLv6HI3WQYloQ0TtYJiFcUQ0FDYB9NdQOcrPOJ4gxDtO1LcIdUFnUzr
         TH8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784894226; x=1785499026;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w5wFJquxy7zq65wK3cwKV75ni0i9dU8zjqPfSGQuu2Y=;
        b=BSqenpXb/Svs9K8M0VXD0Xd3J4RcD9Oea8NbF50Q/8upZjWzX6KYrUe97PS/BSBVLM
         GUa2Mc8DoRyffjIOrj57E5qgaxED4akpLcYE7mnEjAE+i8HRJ4/aw2RD0XDqKe+oDZCv
         lW3je/0qzi2z/VWIWZd0urwBbyFJzJyYu+QJVpNlxv10Y5yr+99BMJ9pDzdRMNkodi9b
         qysdkhl8jhaFu7RXL+As88/BPouF6pTLQtxwhcRNUIaFdbKqmqkvt9hpGw+otbshJTr/
         CyOoLeGu38LCpNafH0PQr4l4jvflqurfRHyRaxO3jm+dfpcrVBd9VrvX7X5PMQGegOpP
         i2nA==
X-Forwarded-Encrypted: i=1; AHgh+RoN6EqOgC3o6mrWHUQhFfZZu1tZz8pkp/VRBXolmDZ3cvWX1Ri4KvpYd5VLxTN2IwAcCQRZgwCg8e1pgRI9@vger.kernel.org
X-Gm-Message-State: AOJu0YyIe4HYFIz04nXe6K++DkwM29AwP/HnKy4kh508pX5wf8on8hLc
	fFaQ3WEQVyw+MqGsUoD4GcPtWXytKzGB1fR0EpgEyKo5n/vIHqcRqjveJgl2mi/FUvi9gBviC3M
	fe3TV8zP5gnwTfRem9wVKOoSYCRiMTmJQZk/h+lfVtiydxdZI60VlxFqUdqzTXtxXWykB
X-Gm-Gg: AR+sD12WNvBqssfTjjBU4Eyhr+ZvjT7nfPqCgbRVCEd11umxiwixJuHr+XyU06H/HoJ
	SFOXMf1fBz6sDkvZQhCCqe5+z6JrIJggNKHasrcRwAC4yAZYzrOLUyRIDrOel09YTZQz1cX5N8V
	cbyUUVl5P6LYWPmlbb9u2snH6lW9iOT8OsfZPmBQtQkoD+zmkw2TCBWjfDP1HJ9phECCyt9eoo4
	mpA1bFS+28NpQmCi0EDQOlgX0ADjYodSKZfDyDMMp0Nn00dqyCwyA/tXeg8rbE9O6TMnooi7re3
	PKkoNWJs+HnGTUwm0pMK418Y0MopFns4heGL2GwqtzRzGs4EHrsnxnMIfEjrr+3RsJFMyQyyyKS
	haXfMLWcZL+rO3BuKeqtOIoY6
X-Received: by 2002:ac8:58c6:0:b0:50e:6311:7380 with SMTP id d75a77b69052e-52849848177mr27015171cf.6.1784894225879;
        Fri, 24 Jul 2026 04:57:05 -0700 (PDT)
X-Received: by 2002:ac8:58c6:0:b0:50e:6311:7380 with SMTP id d75a77b69052e-52849848177mr27014991cf.6.1784894225496;
        Fri, 24 Jul 2026 04:57:05 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32af243fsm344516366b.26.2026.07.24.04.57.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 04:57:04 -0700 (PDT)
Message-ID: <b9499b67-ce3b-4493-a1aa-454d97de002f@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 13:57:02 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] regulator: qcom-rpmh: Add support for PM8350B
To: esteuwu@proton.me, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20260723-pm8350b-ldo-v1-0-42b5428a0d3f@proton.me>
 <20260723-pm8350b-ldo-v1-2-42b5428a0d3f@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260723-pm8350b-ldo-v1-2-42b5428a0d3f@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEwOCBTYWx0ZWRfX93g3UlkcdScW
 r7hEjoO1SevpTojXUyyRDfLofsXvYcw4O19bcHfivd9S6uN5Fb1JT57mIvpyaoYPG2RhmObvsO8
 BNzR9Tu4fxhkKfMqjxVUxrfpHTtZpwc=
X-Authority-Analysis: v=2.4 cv=TvrWQjXh c=1 sm=1 tr=0 ts=6a635312 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=C7i4eJ8IrRWg0_eoz1IA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: kGqK7EWwaFUpMPU__-csnLnXwmsipU9i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEwOCBTYWx0ZWRfXzlSXqOne65bn
 Q2lif5UQRvJI7bADQiTitQuX+3yejUUF3TmRwO77n0ULt+8WMLTZB/nrcsX/B9U9sf2HAKdbv9h
 BQF3ADkPcwVqLduZ3d59OvTBaeBJiEhs/tdGMuTVInBy4tmhcSxsmxLhvHRIJJIpKvoEko50PNt
 zO1YLWfqVZC/3WtKhUcYVQqTZEKjJ9bHd72jkcdTG74vyt7FLd6q9xOFF4nhU9KViliZ2Om59BV
 egr4uLGk0C0Va2WnMw8c/OU6LZTZ05xqr2d2pgHkQCn6854LOuJDxY+ajA2wxbOiSMtnHmlVMSk
 mYeKAvaZH6HbqjiGm38A7mhYQ88GJ7PXudxLUh5Z6LcX9DU+F7xpsn3HfWO9l7SoF+ZN1VLBWeT
 ZQDjppIINJyWzFS4E6ee4WIrE2cpiUPuWQjNKijMTXTqGIQjM5THBP4S5TllSLk3yVFNjXYMVQe
 xXcjb8eGcaDO3I0gy/w==
X-Proofpoint-ORIG-GUID: kGqK7EWwaFUpMPU__-csnLnXwmsipU9i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240108

On 7/23/26 4:53 PM, Esteban Urrutia via B4 Relay wrote:
> From: Esteban Urrutia <esteuwu@proton.me>
> 
> The PM8350B has only one LDO, which gets its power from a dedicated input.
> Add support for it.
> 
> Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
