Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9AF42CAF8
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 12:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785240175; cv=none; b=iYCpFJPFPBLtDaKq3HJtILqpckKX8qoHOktzdGn4C+fEen5kecA3A3PdyM7hID9SkWucGI9Ng833j7DCXnw/7FoRh0CibxP/soIdw5Q1D4bVcUli+jWWQcyFjbMK1k3RgczbusmcSBry3bSK0pZXfOiEsy7cTtjEKry3OldOJLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785240175; c=relaxed/simple;
	bh=nUyz00awLRGhrVunRlQ29wlNX6AGiLgybArIIn6clCY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ILaD5oW8+akuItU1LG8MkQiEE4ZnKJe8gX68kKHx+qGTKf2tAsBTcKzcjyUdbeLXPhRRwZejxButmGsvVGibTukDtpYkiQAYBzx2LMK4ZzHScN5HQF8Tz9wNosb6e7stq6vj8oG5Hw9XP5RhDN2I4Dr0ev+Mg01hSb1+uOqSApc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HHEUrjFx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dt9Cj54A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HHEUrjFx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dt9Cj54A"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SBH7Bh3751210
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 12:02:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bBmtCwPzeopBDjzlubUcQYKBGcpC+oOoizUjQr1Zgjo=; b=HHEUrjFxJQUSajza
	isCApsQWvwlHnXqtzcEl/VGL0fzf8p9h8p/kj9vNEO2orl5DrytzzWHbLgeVTin+
	vT/xIzT/lIEedjL4DwTeDYgyKpMgNrU17XZ7euAKJ5C2WhDP6lxmcRtmpTHtZ03q
	MmMDliHZNJngvUd2ZSS+YAmKZve+fpkrfoeDvamtWlliNl8Z+6jV4qVjR/hW05Gr
	YY7z/dlSDdZSfzDNGFvjYsZCXfGE/idfv6BYviMdcgYvnTw2EpxUDl7K0q0k/vbP
	adg8hCXXfuNk3SgaSrG5wFjZc3er7C9z1as1akEpCGNng26IyW4cPpGluPb9urgo
	YjcIhA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpbp5m5vc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 12:02:53 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d001671a54so34880225ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 05:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785240173; x=1785844973; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bBmtCwPzeopBDjzlubUcQYKBGcpC+oOoizUjQr1Zgjo=;
        b=dt9Cj54A7OBZMZ/r3P+A+TrFctEKJXtwepGLN4p+GBiH8beNsXhMs/G+OTU6sqFdG3
         CHc2enPgBMbQ0GgMGdtizCkbY70d5L06DOsRxSNZvLHDSsoUXNv7FZA4c0kZGKqOVQHO
         5l3VIsLHtnzwSOLjM/IupFGqnEZdX8UzAgG0LscYVSI/uK3tg1YFBjZRVa/pKrGeW1d9
         effhiC/aAEX36D56wTnHlWrfpQql/oCcbtgqsIy3DlNNgrfVitjfLGg1WLGpcLBt1arn
         6NA83qgM0r889eOc1hSoqq4Z4jePLllNqagRu2O4WLJeMJ0snuojZbH0zBf7eAfEDGnh
         9GFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785240173; x=1785844973;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bBmtCwPzeopBDjzlubUcQYKBGcpC+oOoizUjQr1Zgjo=;
        b=V/6Y9vAPqVCQaWjWiSxmul5WiqzSfjciErAutqIT/uKgZnvFv+O4rTYh1ZEnzw7fTA
         CAM8upxUnBi8Wnqoz+8EJURI7t0KIH7/h5DaGQkr2QYGiekue49jb8RtqP3dIdZk9qS5
         vqXIDgyGKbriaUT3fYewp5195uCMjivvB3cLRSIvULTylkRvZ89aYQ6biQmPakdW8amq
         1ztR4tT7neA/CrSfWg+eX1utbgL+PXNB3s//H2rfZf/eM7I20ByX5wO7sxqssxWiiHoK
         h8U+/E60fNNwIDsfnhgtGu3sEyYTMj5/318c0hA/lJLGHRdzMARUGKoJl+qWN8w/HVm2
         UlHg==
X-Forwarded-Encrypted: i=1; AHgh+RoSZlWslLrFsWOYd3L6UrOp1I+jAB5+msg86sP9J5hP0EIWem5XCvwwp2iPajKTTqFz3+ouNJsphgMOTsnS@vger.kernel.org
X-Gm-Message-State: AOJu0Yyg/i2GpNFCphCSGw2EHpQD4mxfLXGKoF3+8k1JzKFT+9P5MxB3
	PVnyIkIR+VqBQki4KIOFuWwOVwJMdjT7eCIGBK2nOu/lht0sMgn49V38k1vMh40c20xju0Fh5im
	QBMGWMblqJqsuLh4m/ncHTbdUdXXoDJm5gRocYyZ0RMyVs1GTw0OC0OSC2+UxwjvhSea4
X-Gm-Gg: AR+sD13INSqG805Lhkq+Nz6mhVy7QqXl2KyeiA8WTLdMn81C0mcF9gT7wxIC80wvWjf
	Iexewylr1RtAFM6y2SE5Z+zePa+3PDCcU39BQqMWmq3kdzAQahbGOVUxIqfc1SWKfdfUVAjza1a
	gbw/OjJpFsbnYVoNts/NGZZNGJxQ7/9i53SfDDrf50bZuM5aNwkWbpgxnZN/wsn5tf9KV/mRGrI
	V/DFT5TnJz6FT8Ct8vj26fK0g1JTMh0m1J+kUgdU7q/uotocu6TM816v7LiC7FjXFyWoaP+T+RJ
	lQPlagM5EIvALIjEdunLzyggIptXKBBGKWz7utRrYeyJPXpLqouP1AIlIqafO0JfPKhqflVrzAE
	IezvOqHhb4HlL/g5UWuGSP4M+8tgxjVin
X-Received: by 2002:a17:902:ce8f:b0:2cc:84e7:73bc with SMTP id d9443c01a7336-2d015d83dc9mr27168095ad.32.1785240173237;
        Tue, 28 Jul 2026 05:02:53 -0700 (PDT)
X-Received: by 2002:a17:902:ce8f:b0:2cc:84e7:73bc with SMTP id d9443c01a7336-2d015d83dc9mr27167625ad.32.1785240172747;
        Tue, 28 Jul 2026 05:02:52 -0700 (PDT)
Received: from [10.217.217.72] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde5eecf5sm51384495ad.36.2026.07.28.05.02.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 05:02:52 -0700 (PDT)
Message-ID: <c99f89c1-fcae-41df-8426-9bdb3e8e9b5e@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 17:32:47 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 2/4] dt-bindings: mmc: sdhci-msm: Document the Glymur
 compatible
To: Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sachin Rathore <sachin.rathore@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260722142342.990384-1-mchunara@oss.qualcomm.com>
 <20260722142342.990384-3-mchunara@oss.qualcomm.com>
 <20260723195417.GA2688724-robh@kernel.org>
Content-Language: en-US
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
In-Reply-To: <20260723195417.GA2688724-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDEwNiBTYWx0ZWRfX0xAvRoxGlZcd
 NAlnIglIHf+k4TTAimsfLWCgiLAIrioevj85JH6EoWyG24HJexNDLYK0fLWi+jNHNWKT7OjXOWz
 grsamNTVaIHup15nbINQPf6Y+Ot5dF0=
X-Authority-Analysis: v=2.4 cv=XuDK/1F9 c=1 sm=1 tr=0 ts=6a689a6d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=RJy-eKN6XEuLipikQ6kA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDEwNiBTYWx0ZWRfX7O6mywQ5yI4P
 Nx4h6IEoyAUOYTrJIhoEoYFuk68UtxoFQuiZt3s3wPO2H35GgI3fB1g3npmSL7/9KK3+prTgZ1E
 bN+4i7LX+ptOIByvbbygOy9EBNDV6nEYdjMvyn5vZJ4ZbmF82d2EOaidB407VQWnhVQIJO0aT0G
 xSWTMKuLt7ZllIAJiamMRDgLkfaxNut/bQiFTKRhQ7uYsIas7+SpzEeIx4F5DDA0bo/JCwswfNT
 y/hpy2Z0nuPsk7bvAhd3N6M1+vUFOLW6koUWttQJXGMAyLXsekWMsRZd87uIKHhkOueVLwNglVt
 quyGbl+duT6juVEy3pTNuUbqA1fWZe5wlgM7NWnpKyZipMDa1RvLHIWi4oX7innWylAHL2WyIpg
 P1v08RVcassUIHQXFFTChuxEAF+CuJ2LnmIYE/z57QAxNyn2WLZINRvOjz23lkpd8O5Dwa21vlX
 BxDsc51OCL39499tDrA==
X-Proofpoint-ORIG-GUID: -D9gJL-8h2M6sG82RZ0olO3BjUZfJKQk
X-Proofpoint-GUID: -D9gJL-8h2M6sG82RZ0olO3BjUZfJKQk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_03,2026-07-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280106



On 7/24/2026 1:24 AM, Rob Herring wrote:
> On Wed, Jul 22, 2026 at 07:53:40PM +0530, Monish Chunara wrote:
>> From: Monish Chunara <monish.chunara@oss.qualcomm.com>
>>
>> Document the SDHCI controller on Qualcomm Glymur SoC, fully compatible
>> with existing MSM SDHCI v5.
>>
>> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
> 
> Missing krzk's ack.
> 
> Rob

I wasn't sure whether to carry over the Acked-by tag since the commit 
message changed, so I left it out and queried on the previous series.

I'll make sure to retain it appropriately in future patches.

@Rob, does this need to be respun to restore the Acked-by tag?

Regards,
Monish
