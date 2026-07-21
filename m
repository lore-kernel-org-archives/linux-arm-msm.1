Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB573B0AD6
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 14:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784644248; cv=none; b=sUFDFaPN64eucRhtN6Ya6G+U0oXJ3meeTNasDnKA+Eh8hV2ezYa+JKe9uB5gcH+qwQX4yyxrZxzQB1sbmSymcstAcD77F0CjsWMD6eSN+WM+4NdK/q4Jkb6m+wxXFnYiZU4dRcPHlsVbLc6wjOxAlOmBpMB/tHFPhqpFfm8boTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784644248; c=relaxed/simple;
	bh=REMcgltEyMbcKiz6/Lve5nIYVDCo+a8ZwcCA2qtbFaA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ibxBLccRkZ3cuTo8BpcVDKsDrKod/P6ngrEJWdYA4L6geNHHmtcf8g0J0d5LptlIeNb8/qVt3McgASJZOnl2Z98S6c+cKmHiiXqTrIJkQUuKa4nfvBLhT6FTTQTMgt0pTYWJLcMisWpUjnB7LWnv/3eZ+RDkRvU2uEgYPXpxq8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LzKzpTOc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FBps4x7/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LzKzpTOc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FBps4x7/"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDg77H1958773
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 14:30:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/NL98qTFmAvv1r1F2Eh7jOtgF1RGRUhxYo05XKeDXl4=; b=LzKzpTOcsGbZWDLJ
	P0dDZmOexr5ujbn4mZdjs3kkrkHLBge+vz4gEuXnyTjvGh3A2v/b8vxOuC+Uzgz3
	8vd2rS/y6EksZuPorDef35+DxeWuVYVFvNvKYn4Ystdhld13S8NaplcNNj2Wq3zF
	JZgTrRyzw11p9ooJuGpFmO9ivNwLEyeJAGnVsut6hQd/DjG3P5zH6n9dMwdYBmm9
	4S3VSWM8sIl1V+dHKdovLoYicgu7oLh2TzqKqzGGC2dYSTnFULc71b1a+klP53p6
	TCpgCMxxSN5c/389uX6OuH9S28/crEjqAQtw+cvWSM+RqJGG0Vs/aPldms2o/RwX
	bGrXlg==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1bvtws5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 14:30:45 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-456cde91306so4023392fac.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 07:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784644244; x=1785249044; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/NL98qTFmAvv1r1F2Eh7jOtgF1RGRUhxYo05XKeDXl4=;
        b=FBps4x7/o6fuKOXyIyOGtHtuOd/4z+ZHcLf8E3tsYjXELUya9pOWvYmHKcAsXaVbeM
         BCTR7FAOi4o2TetHHO2YcrZZ2kd1IIbvODArjPKyD3ft4JPUIgOCg9VxNfzZgT9ePGp7
         OuAtT3n6TQjLXzDcY5lBRK2n985ajOydrxjL74UGIvHvY+qDHiHreK84ES80X6Nw/kZ7
         A1NLD7LD2hnw3FMZqcwcjl8/QiyuBjyQQHk+oeFMCKsARtYmXXE8Y3FvOGaU8jJz4bo9
         +uz5l4IJgcBE55G+6kqiqms0Wiw559mkYCVd6B/u5sI6suCVKcc5EiU0hqHytybaFXwJ
         YKSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784644244; x=1785249044;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/NL98qTFmAvv1r1F2Eh7jOtgF1RGRUhxYo05XKeDXl4=;
        b=BRq6k3q3V0x4LDQPE76DBZuS+SFhN6GTkuv/5trpqvMOzixFa1/V5GfstA01nWhByQ
         0Kmkp12MEAeuaLbFiaUpJ0pSlfkQQsOlNqz3yZjKb2tSNxGhAJpUWx37Hwex4wbAKUN0
         FiTehXc6LIdeA3Flh9WWbUUvzTltMfdlwXFg9r4ymmKeWe+yUOYvnWaqfUitWZqZy0d3
         bAVV4pTjb/zQy3A3VU8hcQLJYg3O0yPxmLt6Vv+leIKna+LRACkceaRbpufwaRY3Oi2q
         kvunei0SlIUBew+doEcy8HXHa70JgJCs35Lfm5Am9MPklsuq+FVEwZ0g43vLcRDXM03J
         yMyg==
X-Forwarded-Encrypted: i=1; AHgh+RppZSDPAi7hbyWisOMRp96bLRSwNWZwlV9NC705pj5ZG8NIlwjSLLpmyxrCIiZ54beXLlf9DhnnxGD7TW2m@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8V3opcL7tk24uvHgOav2UyZbGcI+JfuQYtX2gV9kfuVX+11l3
	7HBPbIr9mfmG4zboZ8K26cuxTJQvvQPxw7ikpoimpz3uUHaKc1yZlhoNcL0hZ/ob7Bojm5300Eq
	tuzJE+PweFFNP5+vNvDnBY4a8zKQ93W1ZX1nU+P9mcQA7X8t/IQddumZsa0dur8pxu6jv
X-Gm-Gg: AfdE7clkBwqlw1zmw8OUaZFSecNtCculQEkND9Yz3UrgJIn61sFVI6Z5TU6A17XxMag
	S7UTqHyfDCp44tv3MWY+kNdvA1XtvPAD3xS72ruklWi0kbz3okvM/N/oK0NOBCQYv2dn4YbmytX
	Y4GnfYbAs5D1LnzwEiA2gy4LT7CnV+xw9ITTQKZhOwssRnl3kMtssYO8Ox5g2i3ELduhfZtLK5S
	grDfI0k/D7r5kHUDt+caSx7jcAj93cxnfB0tdYgvkTEj5g+X/2uEmAA/MakRLkd1y9RXqY7GVSN
	sdu2GoqkOEwEm18GrVjbi1q5HSDINTnq7/TgfTgd5+XO3B7a8c27WYC+hL/V4vgP0isJMjRhCGG
	qcnm/mrbgB0C0HsH4lrN9sF4vRotUoKvQuw==
X-Received: by 2002:a05:6820:f028:b0:6a3:e297:2f14 with SMTP id 006d021491bc7-6a5367e184emr9521066eaf.8.1784644244584;
        Tue, 21 Jul 2026 07:30:44 -0700 (PDT)
X-Received: by 2002:a05:6820:f028:b0:6a3:e297:2f14 with SMTP id 006d021491bc7-6a5367e184emr9521053eaf.8.1784644244182;
        Tue, 21 Jul 2026 07:30:44 -0700 (PDT)
Received: from [10.217.217.176] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a51a25c857sm10599003eaf.14.2026.07.21.07.30.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 07:30:43 -0700 (PDT)
Message-ID: <afb0862a-04d0-4171-887b-7f32ee64163f@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 20:00:37 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 2/4] dt-bindings: mmc: sdhci-msm: Document the Glymur
 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sachin Rathore <sachin.rathore@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Sachin <ssachin@qti.qualcomm.com>
References: <20260706141346.4180348-1-mchunara@oss.qualcomm.com>
 <20260706141346.4180348-3-mchunara@oss.qualcomm.com>
 <20260708-purring-infallible-bullmastiff-8f6dea@quoll>
Content-Language: en-US
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
In-Reply-To: <20260708-purring-infallible-bullmastiff-8f6dea@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: PFEx6cZ6uKcTrj7Wl8ti1HsktSR29Q6t
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE1MyBTYWx0ZWRfXznMVhgDhC5D/
 XPwQ2S9P4D+t8LZq4v2WPIqm9n/8WqNeSboUEmwMeLnQBZR2Vsxgmrj5txzfq9AOD3jEHLPspOv
 ZTb+FVRErtmgoUQQQiwnQoR9byepAec=
X-Proofpoint-GUID: PFEx6cZ6uKcTrj7Wl8ti1HsktSR29Q6t
X-Authority-Analysis: v=2.4 cv=Sb7HsPRu c=1 sm=1 tr=0 ts=6a5f8295 cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=h9CbuXhIcreXGJZWFMcA:9 a=QEXdDO2ut3YA:10
 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE1MyBTYWx0ZWRfX4yUFqfjtsyqQ
 L6NttCjpPDpsVY/u6Twoyuv30wec2C196tYeQLXEFIoCMGt9NXvG7Aoabd9t2ztfSbN3bLt5KzS
 Ft43qPvmwDMzBDePjy/Bg+KxLK5XJX81c+5rC0fU0mV7xrjNNT8uq7Zy0AtMJA2+bUTxLZkYm3J
 DF7UW6HV2IQcFWRiNPSWfIhpxd8NELzzYziEwaSFny2ZGxfGXe5WQjFDIwHxs7uiv1uln7HerSi
 AFF0ynTiV2fQazsxJN/pRD8oK1KpebVEOWudPPoe+nX2hL172DuPOVYt3W83rDZnxq5dGIP2v7T
 i5apCfh85Mzu/1oR2PoCIDqZ/n+BUFYsenvUDcZa0a38phblvOo+U4cf563y8pZzYs6nf+6jSQI
 hamdR4pXL49AKzGBfZXrZ42X78xAyaPCIPUkErgDyF5H+iA2I7VTZEZrE19/RoI991xnt57Qihh
 rVWDnJBnDsZj0adqGEg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210153



On 7/8/2026 12:18 PM, Krzysztof Kozlowski wrote:
> On Mon, Jul 06, 2026 at 07:43:44PM +0530, Monish Chunara wrote:
>> From: Monish Chunara <monish.chunara@oss.qualcomm.com>
>>
>> Glymur integrates the MSM SDHCI v5 controller. Document the SoC-specific
>> 'qcom,glymur-sdhci' compatible as required by binding convention to
>> identify the hardware and reserve the namespace for future SoC-specific
>> quirks, with 'qcom,sdhci-msm-v5' as the fallback.
> 
> Drop half of above sentence.
> 
> "Document the SDHCI controller on Qualcomm Glymur soC, fully compatible
> with existing MSM SDHCI v5."
> 
> You do not need to say anything about some conventions or reserving
> namespaces. We do not reserve namespaces...
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> Best regards,
> Krzysztof
> 

Sure, thanks. will update in v4. 

Just for my understanding, though: how does the suggested wording capture the 
why behind the change? Per previous comments and understanding, the rationale 
for introducing the SoC-specific compatible is the reason we are making this 
change. For future submissions, this would help to avoid similar back-and-forth.

Thanks and Regards,
Monish
