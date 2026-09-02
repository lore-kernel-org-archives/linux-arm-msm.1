Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05F130F92D
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Sep 2026 06:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788329023; cv=none; b=pQHdMlHosiImQk4jxpUWKKSSEBBznY1tBrhFLZU7VBVbI2MsOJpo4dM8HYUQbdFKJWlxcWI7a4WCZj8zJ/XNNcU9Dzh8U/zfnP7JzazZAMl5ZhGACmmCOld4rTwsyJu8TNiieXjXnXltrE/daNWQSmjVdH5WBanLuTpoBmbHMQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788329023; c=relaxed/simple;
	bh=o97CWqIQFcEcZdUT86XmhToxk7DsnJcoxqWppEhsMBw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ViqIbmZmI6P3XCfco8SufUyJOwvkwzQgLbwp9MmzH/yeaVnSkzowcPNnquJ87TgMmVdV6+Mu3e4tLT7hwsYFWxB/1DMSVJYHmj8x0QPWYMAjIuOokum8hoZWeitBqQe1ynKAbM6sGJFBbHd0L51PmP8RQQBzj+gOGkx0Zgnow4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P3j2xj3d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SpyQRDyF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P3j2xj3d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SpyQRDyF"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6825YGvt564861
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Sep 2026 06:03:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pT9aAO/eBtnNkWcr6KE1/DU0x/sG2h0E/ZtJ//Xo5T8=; b=P3j2xj3dhal1GG8O
	ZW2h+1eZz7dqwt5vecp/mzjDW/sZpL7VbAH1Ci4mrHqF0ovJWdL6ItQQaFXLyWkB
	ko+3KmQcBFcFMNBgaqVE317y3wwGNGsE+nJP1ZYrRJHqPRxMmn49psxdELdruhFg
	j+AZIhXpstsah2ib2RowJRzBjce3numTN7spiXdqmdrvNggSUXXKGsvIK6SyE3uT
	/mWs+JG2gRMOLUCJljt2+FL2Z0/kE2z0A4TQzfT7gSIlJ6aGSEorZhX8Xh/jzECY
	dbwdayQa5/iZk5hlX2n2iBiGXUW4FYIOsSHJS1yNqO2d53YHGrsRC/glPFSG4kwJ
	FrcAgg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4geb560mfe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 06:03:36 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e7ff7b375so930917a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 23:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788329016; x=1788933816; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pT9aAO/eBtnNkWcr6KE1/DU0x/sG2h0E/ZtJ//Xo5T8=;
        b=SpyQRDyFtsNR93OEfxPD+rAEzB7SICo8eWjMdoedooO5oXg0oMlDBHajksuoaKrsem
         F14RKljUp9tTdbn9rkcP38A5oyWEe3taJvrJtBHgoPBLeuK2eVOuRN8Mfli1xTJm/7R7
         zefIzmS6tcU8wcRUdG7QDk/PQwSbLJmS2XkY7Aunvbw2GAhvlrGlc8vX5GQXNw1kGEtn
         6bA7h6GAuXRWRhheCDSqMCJcyA9MtPZm9pKEg7P4CR8FxuNPmuo/gHgMJHIYzL7GPJWl
         0fW7HBJMtAoss2XH1gcdKyNxNXp4r+A/eVg6C1/W7pFI6i9/m+YyF6/VEoTvibXiZLiP
         ekhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788329016; x=1788933816;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pT9aAO/eBtnNkWcr6KE1/DU0x/sG2h0E/ZtJ//Xo5T8=;
        b=e5PAYs07rqwFmk3qrNCRcYuegzKJBCSLF6/rxL4xaAKnFjSHPQV9hAM44HyZuBn1Ze
         bGtPuZrbQ/gklO3oUNYkz2PwKwuFKbdk4gQmtPW5zWZ6e41+G+FdvG8bEUVpJRvhNV4b
         NLhyppY1Ty2GDH6nzjbz2tTK69nVvC3hjiBqG6ghpfqLG42nB696CBzYKgstDNE0unNf
         qJHqb77rCgXfRuRVetGzVvfG3D67QrHsrC8shCqrHF17Th8qJXYk4UN7qQ11f+NBmlrU
         waJiCrrWTH5hmU0gfGaJLa9Cc0tAvIxlNWHJsEBtTZdLMNn8Uw6ncr0X6TPvFsNhNF26
         zu2A==
X-Forwarded-Encrypted: i=1; AKwUvBy4B0eEAADGg+bhGe18A4HpyCK3DcIAG+NrIocOuI8uKaNWzBRZrJeIXPX9xWKcKTathzPno91Yam+zSn+q@vger.kernel.org
X-Gm-Message-State: AFuF++kAfs0QYKYlRe8nXwWpWeIxrsUGVyWF+2fhOh3BmpGyFIHhFx33
	vdg64KmpKP3STUmXA+FDdjRCwrDYodZj8EsqizWBAnM2SppnYYCqLzDQM6tfNWcAVSLJa/RwUPP
	gVjJZyWc6WLqiuiYFREp4dCfNVVnyQmhFqdREJOoPUqowIM0Rz+jOWcCmgonc6WEqsDGh
X-Gm-Gg: AYBFou13hcx7FHknVMg95qkL/Smy8kY1D6tWvxclt1fcudtn3FxfIwZHZZyGyk/aVi5
	GfZCbmEQ4vB8l+ABGed7GAnUn7f9QkDmZWEwoz5xPFoL1tZzPvIzOYgM8Yad5rStCTvR4qllzIQ
	n/NhdwC8h387PdoZh6szSKqLVOya8VVt57vFzf44B8xS9igZs/hlsnd8OC3yEIwjHlfH8Z/WpjE
	zxpVPC8b4A1YDdYP83xxDj+c6nBVicyTlMB5+BZw6cZq8G6nf4IMQdhKxXManYogVhwByBxDg3C
	evxezd1yUc/nHPkP9a5zZjei0ucr0b1DE+gIBXFKhzXOnEMTNu7Oh9Ah/dRHftTs0FOsUve+ifA
	NgxM6v8OW4mDx+e8A9SChsJ3KeOiP
X-Received: by 2002:a17:90b:4b89:b0:398:c3ca:1ebc with SMTP id 98e67ed59e1d1-39aee105a46mr3196170a91.18.1788329015556;
        Tue, 01 Sep 2026 23:03:35 -0700 (PDT)
X-Received: by 2002:a17:90b:4b89:b0:398:c3ca:1ebc with SMTP id 98e67ed59e1d1-39aee105a46mr3196102a91.18.1788329015086;
        Tue, 01 Sep 2026 23:03:35 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32f077fad2dsm3447898eec.0.2026.09.01.23.03.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 23:03:34 -0700 (PDT)
Message-ID: <5dce0c9a-84b1-4041-b2d1-54cbb55c64ab@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 11:33:28 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: sound: qcom,q6apm-dai: add stage-2
 (SCM/VMID) access model
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260826-a2a-shikra-vmid-v5-v2-0-c3dc62354eee@oss.qualcomm.com>
 <20260826-a2a-shikra-vmid-v5-v2-1-c3dc62354eee@oss.qualcomm.com>
 <c7c29560-ff28-4321-989a-e081f2870555@sirena.org.uk>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <c7c29560-ff28-4321-989a-e081f2870555@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA1MSBTYWx0ZWRfXxry9Pu6p9bwJ
 XL+u42NrDxneabSr/WfS7Mwt+0cu3evm/706rdreCihAWg2K79RGLD/KnE0O9Vr9XbMft/ewztw
 tQhgn8lyagOH3c7A6N8xZGd8kqel6rb406FKwWCidmFO5JQFkIjSTkaUozJ9wO0Wdgpk+qCm3Oc
 MlHdXatKBc6AMvkl+vN4/oeJLgJdDE7Hg/AWRQplIEL6RVwGIafRqXxSbaxPA9sy/8c0c5xmxdo
 cA2g2WZenJDB4kKFDqm3pfnBraxp5Fd8Rk6SbEQgJx3HoVZlGYtCU+dL4JJlr8svqGLOo/C5jUA
 j9k5+XQE9werj7h+or06pOBCMzrL8DUquoezv6BiQZBMU72KhlOfc5KfIS8CF3lPY2NWZegYA8v
 ZUnyV4IyaiSPC0Tm503YkQt/sAdo3+UO8CvvnEGwrpOjtJDjbWKuTFY/l6S0rcA0judkyfhh+cI
 PyiGgzRxngxaGACDR1g==
X-Proofpoint-GUID: 57bABseBrLWjyrrMA6QSri8MYbHlkclI
X-Authority-Analysis: v=2.4 cv=D8N37PRj c=1 sm=1 tr=0 ts=6a97bc38 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=LkqdXz0YFAjP81C9FE8A:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: 57bABseBrLWjyrrMA6QSri8MYbHlkclI
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA1MSBTYWx0ZWRfX1YYf9mVJq/zf
 +zzX4bvfci8epxkSIhVjHGLUVDEcz34G+O7DYGJrpugQceuH3px4Go5LVve3WL3h6z6BYNSatvb
 LWQ/JHY4ybeff9yd/tznIzOMsJSd5cM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_06,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 adultscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020051

ACK, will follow in V3

On 8/27/2026 4:14 AM, Mark Brown wrote:
> On Wed, Aug 26, 2026 at 12:10:12AM +0530, Ajay Kumar Nandam wrote:
>> The APM DAIs expose PCM buffers that the backing DSP must be able to
>> reach. On existing targets the DSP runs in a stage-1 context and the
>> buffers are described to the SMMU via the iommus property.
> 
> Please submit patches using subject lines reflecting the style for the
> subsystem, this makes it easier for people to identify relevant patches.
> Look at what existing commits in the area you're changing are doing and
> make sure your subject lines visually resemble what they're doing.
> There's no need to resubmit to fix this alone.

