Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCFBC48E0FF
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 10:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790331584; cv=none; b=qXglz7EyOMbhWzufXqgc10i9oRxZswt1d4bbnjaCZe4z7MyGWQQp+bvMU5NZlmAbTsvrlLpxY3afUenqwwYsoexNG52YtU1DeXj0cr0JixyHn0yv0w+91WU5bhu1uIEkdtQ2MrsiLCuUYhb3+x2AtfTYw+iUW611EKMQvw9QV1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790331584; c=relaxed/simple;
	bh=4wQz6q/WvEKet5IUg/SEtqhktT4UMJ3/CbjwvROmgAY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IdEtr58nuCOuFWNBGnPftKJ7sn0wdmxs7H4y+Q7XteXWFuksg/FtdyBnPYUjrf8gbcTZlcCwHpDXAgxXOvE6cVrdBx7Hp0JqtdTS9mLr6kYyTXxzaJvBKvcuCXqz4QZfdNdd4aYV7fOWIvbpxyEdFJplRwbVZSX4tyi6wzahc+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T7E0JYFA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FI9QhFEF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T7E0JYFA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FI9QhFEF"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YeKK1193864
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 10:19:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UKy4uRrDP1MEnH67izTbk5nL5p9jm1/EIV3ngV59HBg=; b=T7E0JYFA9ZEsW3NB
	r8i3NHnOoYNT+DaTyTzDHTa+z5SkzbhlHeX4vl2uVJ0b1IUwPZYBrLi2l939PMmH
	BubQuvmaUuRVQ3Y1kZOFoaHt2Wx/zTCggWfZ+6QzwEzrEiZ7pTtJoraZyWfMMJVE
	MfdaL1pV/RJJb8L36U71yPatOKO3jsAV3lp5uL7HBpVAHd5wNtwp0opG4ekWmdn4
	Hki4Az4YjO+aCFTeRXtqqCp7yGH3ZOjQG86HPcQOdxPEnNvLrhgl4nvjBzBvoU3p
	Al0NeN3wAALjPJIpD1AaSfDFhs4iZ+1qzjqt3PSZBPnMBHYIaaeNe3rP5z6kfLlh
	6WAvdQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw874k10e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 10:19:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-934a8cd3a8bso4809685a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 03:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790331581; x=1790936381; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UKy4uRrDP1MEnH67izTbk5nL5p9jm1/EIV3ngV59HBg=;
        b=FI9QhFEFimLnkxJb8PRoDp4dDCS15nLXRKM73l9hIJwOwCbLNS+BrJqTAmodXE4bZA
         ODNDmnzODpcrbgKQM8yX5H2JrInag5h/I4tamBOWKNzG37Dz+J4lTdadUMJY+fLOCdxG
         +eUfvd74HNCE1PfFTru2BEE7rmUGdNT8aAxgDTE4T7FF0xupBVm0SQbp3oj/K0MbJ66v
         S8isVA+9c1i3glSCd1j5D0SF95L41UITvV7/d9nESSuLJp6/M5RNfk1d2qTSqeJI6Cmz
         rGwZ/J9nvJP4aPcFq7Z8mURATyDfJLdwIc6bwLvMXLyWjkqq22E7wod9eQb7bcsAGlSq
         VIfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790331581; x=1790936381;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UKy4uRrDP1MEnH67izTbk5nL5p9jm1/EIV3ngV59HBg=;
        b=ARyVePWhRvgOl63AHkJQVg92SzITNZjUumVUCzdiYeExaRU46y/Icbr/PIgIidrbMU
         HfVqZEtlWjVlzIkvtwQCaDboF0nLiHtkBfJcibNjlzQiRvpYFxpU0/ZoCBcMyGxV2ulD
         /9/oPwoU6m8wY5acVFg0f0Mf7ixmBeBedFe3iYkDEAbSS7+CDXzCb1/0bPOLX2sCxVC8
         6U9PepNSqzxoMs3l7fLFuIsVzvkDMkUDc6geCIgl4ZIMsu4NpniNzpofVPgPKRLFrzud
         SOs+JnZKzq82GIue9kIH9ZhIfKYM7sNkLBdCPSo/2GG89xTQ6qOgzlOwY8bOAV4v0we1
         YqpA==
X-Forwarded-Encrypted: i=1; AKwUvBwLIRSJAWEqXcJGKKvtYzHcB+CNO6xN12SnsW+GWpNpT3l/NrClVdH9UFbSs9iIQ+7AfN3lDJuI383c22QO@vger.kernel.org
X-Gm-Message-State: AFuF++kWaBAlQaHc2PMLKC3ief8nQhrZtU8IJdqM6ivvdYRKBGAZD4aX
	SpW3APofva9enRD0DvXjdBsfsfISRXevmHa/OoGOnJMRKzyXyqvlAil4ISBioMrW2GrOlKiiiB1
	r5pdeJX/nkw0eOxmwuSYtZsR17e3yykbljpIwLsW9QdiBKtq60FjmO0kBfHpEMmCwVGcK
X-Gm-Gg: AYBFou0owJ26So/sUMC/KHHnN1ke8/fYezfsaO6QWhxxTZR9YDJ76xkfqDtbPOEqIU7
	/d24op2E8RkZeL5rtLeH+EAUtJCDcexdFmg1ZLCmEcyrHgk9DT7KA7PBxxutjPNFRmgfruBWqWi
	AMnUT6vfwk+lzBKGz5vIAYEYxS12wOuVGFGJbwSqCq0C6Dv4zGWG4yDAYwXRDc+mRw3ardfxG03
	rmE+I0muoRBwB/7A6C4goAUNLD93I0GgYwtFSb/Loc+NWAWkmcCi73Dk1bAtoERav7DJVuZPrpW
	0GufwkD8dcND6MEoUbMWnJj3bv9hBVv18jTodI7ttiXrgDBmWBO15rvUaCTJqmHX65rGp0Ye2rm
	lLZCUwfWVRV4FrLtTFwICTg==
X-Received: by 2002:a05:620a:2b8e:b0:936:2f59:dfe4 with SMTP id af79cd13be357-93c439dbd0dmr314998885a.0.1790331580865;
        Fri, 25 Sep 2026 03:19:40 -0700 (PDT)
X-Received: by 2002:a05:620a:2b8e:b0:936:2f59:dfe4 with SMTP id af79cd13be357-93c439dbd0dmr314994785a.0.1790331580324;
        Fri, 25 Sep 2026 03:19:40 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae74815easm93578766b.23.2026.09.25.03.19.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 03:19:39 -0700 (PDT)
Message-ID: <1736066d-b50e-4b3c-9db7-5752927978a5@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 12:19:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: dts: qcom: mahua: Support GPU and GMU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jie Zhang <jie.zhang@oss.qualcomm.com>
References: <20260925-mahua-gpu-v1-0-0fa0bfd8d315@oss.qualcomm.com>
 <20260925-mahua-gpu-v1-5-0fa0bfd8d315@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260925-mahua-gpu-v1-5-0fa0bfd8d315@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: REBxB86pgPSeZrzu0vCh9IDUOkQ6ddzi
X-Authority-Analysis: v=2.4 cv=MI71C8Zl c=1 sm=1 tr=0 ts=6ab64abd cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=QDjCMyA0A8yHJihhU1wA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA0MSBTYWx0ZWRfX6rQgeZqd/dgB
 1S0fM0hZyJxomaLRH2lc5O26NkUJ+4YXucYCfh36s7qwLcf3uIHtawkWli23cbe8bsOOqJo7N0V
 dk/Q4mx3U6p4JRe0v+BshysU+ESiDSHZd8mlDG/9qJJZVc2T9jU6HYEpoviKo1PZBtI6kOk1+5L
 C3AVRJdUptOxxCa/pL95wsahMrT4kIddJiLkWJDj2qNuCUUT/O68T0QYhVS0IX+BNW/UN6IYT0y
 yNqs1VW6utvZAsGV2Ru3mYtJsMnDVwNOy//NOofkgT++qQL6ro79hRjsy1BqTyANs6L7DT6l61C
 WRFJWZNccrVuiKlsuLZXO0bIKC5W/dDAgdMIv3f9IK69jBKpNKisa53vjWXmh1BDrm7irFQmx3/
 Ytl2zgesYvTkTAxl68YfFlcewD/2lh9HhzU7CEDW6DFPoBsNEnWfyPwZ71Ot4gczIjVA0lpyEL7
 xo/hiBEPF+vKOprF5cw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA0MSBTYWx0ZWRfX/oHbHpR3z3KK
 wt7BLJrF16EF8x6JBGPi2Ch8L2z2wqHYx/haB2KXNc7XO0ZjydTkvIt/n7YIsHZK75061b4fowD
 ql5vpvyRCuoIXPc80dajg2lyJHDpRMM=
X-Proofpoint-GUID: REBxB86pgPSeZrzu0vCh9IDUOkQ6ddzi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 spamscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250041

On 9/24/26 11:14 PM, Akhil P Oommen wrote:
> From: Jie Zhang <jie.zhang@oss.qualcomm.com>
> 
> Mahua SoC has a new GPU called Adreno X2-85, a slightly smaller variant
> of the Adreno X2-90 found on glymur. Override the compatible strings to
> correctly support it's GPU and GMU.
> 
> Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
