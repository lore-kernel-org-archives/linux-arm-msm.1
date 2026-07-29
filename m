Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8A12F3621
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 12:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785327670; cv=none; b=TdlrnFDUzrLRjieIalWQgWun8L4k8Deqemr8gcu7EJm4Y2BoWP8+q+sPYX0z6F0XXLvHF0fwNq2dhbZ9RBeng1bI4Zb725QVUJz3wAq/JXJjayoTvQqYW2yWiAWRekq+bOYHgy4qQq/IhjPzuXYAsw2Q5IZ4UlHhvUJtvR2N3Gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785327670; c=relaxed/simple;
	bh=ZtcaL6QuzTdO1mo/regAXILXVX98ZdiaHF6vmeAsTXM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z3Ck2kqFXbd20l1vLaYhGQJK9aR4fT4jLSYNZBn4x0an3Su3t0yb264rQpJM0LBxWk4wsjGJkiF55haIgo285xynNc+3xcHezj8PVi4fJbhBKrjsTPxezIbiugk/0czV5kdbGsUainitGtmS7RIN64z/RbiaNzZiEX3mp1RV4lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PGb1DLyq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jy6Hj1we; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PGb1DLyq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jy6Hj1we"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TBlstp1512066
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 12:21:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SeM2xcHhZitweZ+bwJX8AXEasPFrzj/T75so9QyUzag=; b=PGb1DLyqzrUhk4Un
	56irEINRb8qA3XKWJTWoJ4heXrwUxBcc3XZ78rnDiKJHXj1c9Ff5rxih3V7rPku2
	lxKtOdKUJ/ARrHsOoo+7DKW1BtsOWGqjZDLQ3TqChvihdN7P7VxqJpfqjH06LGK9
	N6zCHJt3N4k5EOwMPyKtPKGMvLJyQWWPGbHvCTx8apbaRHyqHRNVtknGxZEfK0f7
	J6Wl2B4qC0azD9QRzR/eiPoYoxARKzlSanLASq9wYx7Tvt/zuRxSHqj1VH9o5LR6
	q5VjUTgo6V4F4PQZx4j9ZWi24kNJK+8JDvh7qisYPheDUhOzf8Yvlzks9GNbB20q
	+Z6rSw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqgy903y9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 12:21:06 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-737a6ec882fso14970137.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 05:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785327665; x=1785932465; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SeM2xcHhZitweZ+bwJX8AXEasPFrzj/T75so9QyUzag=;
        b=jy6Hj1weowSGxNo5Z8KcVvQkP47q/QBcE3tB+oSjIAKWuO0NMAAIj/sg9ivMj4OoTy
         9R6QxqeNZguYyRzo94mwD6afRCQyPxFnrirlfSSuW/eYJeb/O1lrOxHDdIq4Offs1muZ
         MRMi/m5nRriJtGP32Ee3xM02HQr2Ygs58Qtu7OmzqIkuLpHnicae8CYUA/H/olUXNN4H
         EvTnj8L1Dx40x6KiL4rV5HLgxd3x6jzF+pFYPLT+F8hEC1WCMeDAVmvTajtVQ+FOguZP
         drsqc93qp8iUOkQcBYmrDFOD07OTy2KZw34ZAWCBm4a65QRK3rusZGirQX6ZPqFpaRvA
         JhPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785327665; x=1785932465;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SeM2xcHhZitweZ+bwJX8AXEasPFrzj/T75so9QyUzag=;
        b=f4jKpAWLOWHnU7lJo6ijq2ZU4M1t8renuyfF+jCUfnTBb4vBHuN3tjCE4klHYMGMJR
         3Agkt+moElibaW7KuL6uNJE6wHbqUzGjccNuUGhPDWy4c0XdvzOVJBg5SMaKu2U4jlXx
         AjvbRZIcs1gGi2jJ7IuBP3RXvS17opvVIpPMKyD0zOorbPaTPvMTpUu8mMWscPzTzHjN
         feteLfhT2FkpMZdIBtAi4DHDah+aVlwWMG38z/KjmbjryUjev+pUhLkzDhXEg7Gti8EV
         p8AR1mzNn1whMpeJQCGTtllVfgoir6fL6xBMbMneZLLD+uht8iL+McGni6TPtoaBKJ/w
         mXiw==
X-Gm-Message-State: AOJu0Yyp2kKcCH2QHlgkXHxVlXBkxd9cUAwaI6OoBOaFYX50ax6g5JAP
	OcwFno6hhyE4CbAz6DClBPCd94YfwqDu0Ms0Ujj8k0wthMCywJxWVRS0ZrFr1VRQ9Clpu4f8HDK
	G7pRt7OSBH1M61/bqlteSI/vylxIfVKcb0tvwhR2LrKNTiZHifqIF2UWOQ5HekGvItt9V
X-Gm-Gg: AR+sD120nc/g0sL3Ox/lMLL7lYzFxzf+tFHvpdgtyJ8Kug0K5uw54PSvHAj7XCREPO3
	RRfydJver3ClLCK7tDWuQJ8aoPTD7z7e9J9aW5OnOn87UYq2K/hPiDCo5KWgZwoOzAD09Toy97u
	zB3McquiCLHOTbMtoQED/B86p3SFdx5W0arWyJvO5qJMCrIdPZA8RZlyrTZEodcHdGK9YU9EFk4
	Zyf+FbC+WYlHANQaQdWBCNWgshquk1JEw33OmeybOvyemckPhtNR9XtyCwMq1ymUhryu48B9UTi
	XAkc/X3VzSxaQ0KBb7v5sKomzLnoUZ9lFuAP8Ae6ZPNPp1e52UQYXWCEOZyT/uG7LibeOAH6SoP
	Ex4U5ren4hUUc1N8g5rg6A8Sx
X-Received: by 2002:a05:6102:3591:b0:745:17b0:10d5 with SMTP id ada2fe7eead31-754a1ba976amr1346983137.3.1785327665401;
        Wed, 29 Jul 2026 05:21:05 -0700 (PDT)
X-Received: by 2002:a05:6102:3591:b0:745:17b0:10d5 with SMTP id ada2fe7eead31-754a1ba976amr1346972137.3.1785327664972;
        Wed, 29 Jul 2026 05:21:04 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1f8f981705sm53136666b.9.2026.07.29.05.21.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 05:21:04 -0700 (PDT)
Message-ID: <c3131fcd-c2ff-47e2-a8eb-858456b88ed9@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 14:21:01 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] dt-bindings: media: qcom,venus-common: Add IOMMU
 IOVA reservation region
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260722-shikra_vpu-v5-0-3d80babd4672@oss.qualcomm.com>
 <5nIoqMekE2B3CTU4TIlUJxoI3Exckc2sUM9RmZBqboEOvgmkdrhKlRX3-FiMOiYFCWXwzO5pii52NJ6epuy1Fw==@protonmail.internalid>
 <20260722-shikra_vpu-v5-1-3d80babd4672@oss.qualcomm.com>
 <557377b0-7a21-45b6-b62c-d3b34a6a29f4@linaro.org>
 <67c78d88-92b8-44b9-bbcc-6f53f6c60ef9@oss.qualcomm.com>
 <048506d0-7dac-43f1-a50b-f9f4c1d125a1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <048506d0-7dac-43f1-a50b-f9f4c1d125a1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEwMiBTYWx0ZWRfXyAAxEVGI+VJZ
 swHEcWzJopwLNc8GXVnVp8fwCCphgqcab1k6AdBMV6y6+1Oqaga6BNrjHZjauCl5bqmhdeTlj3C
 mim29Gh9KzW5G4pDrZ3jcdP2Ew6sMdI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEwMiBTYWx0ZWRfX0h1I6hN4ebkd
 wjqYgsNjzHlwweGFkRprAuS+gZPHqwBfoPbCStejDd8SKLmH5IXDuGIcuEWl8CvU+dQLyUUtUYx
 vud3z7Msyl7tX23QUJVxUbRRkLW3vjQplu8wrrGOcnTenLP+jD7RsUF6rMl4M0SGEHnrOyJVbKz
 zl6dJIq14p+gz9Qn7NBZP3i6GHNw9iNUlFqFJoKt2VohPryuLVgJEEbX7E9P81Vbgx0X31wUkPl
 NdA29fRs1+5NHTB8msB1GLxBBVAAYXyttNHOj5ClscM5Idggj0GflDNcSgD+7nuDn6CCcatrosq
 iBt0aWh01wU8hppqqbXZPNrN0g/92wE83iJa+0vDqBPn2mxwrWbgeDaWDT7R8EW55q7hRcvq/Jx
 uJes2UOfcY0RgtwfUzRBAgdlG8DnKCkOE8NeyTa3KGo2PZXL1LXyXK8uOkjM9V05P1fwrAA2I0c
 WbH8rzAm6CQ5ZyGYEng==
X-Authority-Analysis: v=2.4 cv=LtKiDHdc c=1 sm=1 tr=0 ts=6a69f032 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=ablQDHkhG-Ar-HdMcfIA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: RaxsBq5asMWOjPQxDC7r5T6Pkm0Ew7f7
X-Proofpoint-ORIG-GUID: RaxsBq5asMWOjPQxDC7r5T6Pkm0Ew7f7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_04,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290102

On 7/23/26 12:44 PM, Vikash Garodia wrote:
> 
> On 7/23/2026 2:36 PM, Konrad Dybcio wrote:
>> On 7/23/26 12:03 AM, Bryan O'Donoghue wrote:
>>> On 22/07/2026 14:41, Vikash Garodia wrote:
>>>> Update the memory-region property to support two regions:
>>>> 1. Firmware-loaded codec carveout (existing)
>>>> 2. IOMMU IOVA reservation region (new)
>>>>
>>>> The IOMMU IOVA reservation region is required to restrict usage of
>>>> specific IOVA memory range. For example, VPU restricts usage of 600MB
>>>> for specific streams, which could otherwise lead to device crash. This
>>>> change allows platforms to define separate memory regions for codec
>>>> carveout and IOVA restrictions.
>>>> This schema update supports existing DTS having single memory-region,
>>>> thereby allowing gradual migration of DTS to support two memory region.
>>>>
>>>> Signed-off-by: Vikash Garodia<vikash.garodia@oss.qualcomm.com>
>>>> ---
>>>
>>> I'm not mega-happy with this pattern being used - I prefer the pixel pixel_cb sub-node model you've proposed yourself.
>>>
>>> OTOH you're the maintainer so its really up to you how you want to arbitrate this - the 600MB constraint will work even if its not pretty or the best thing (tm).
>>>
>>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>
>> Doesn't this cause the same limitation that the initial patch
>> by Daniel (all HW contexts can't access 0-600MiB anymore)?
> 
> Yes, it does, but for cases, like Shikra, which have single streams (with SMRs), there is no additional benefit in going with sub nodes in such case.

Please note that somewhere, I was under the impression all venus
impls suffer from that

Konrad
