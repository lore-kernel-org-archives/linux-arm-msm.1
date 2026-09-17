Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436A548C3E3
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 10:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789641578; cv=none; b=pA0kWEccoDkbRQJLN6iJeetBP5WZEuwRZgCq2BCWvrifNSTvGBf1qZ/mF7yevjQ3UBWMjQJ6u6F0TB0bTYy891K4BjbwFNK4TjcSuPwgm6374fsC7qMPnm0nmyVdw6JWQQ250v+5SFaBoVQjNoR//mbCt+JhVow48fJZ4Vzj30E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789641578; c=relaxed/simple;
	bh=ofwXWJWBXMr3tmKuOZyLyGNqmZJNvgOJaDeOa13forM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MUBW6gZRfeP7eOhilFgClc81WxgwEvfGmvAXai5pz/gbTOJ/VEWZh6SLRJA26vcgXnEjdJgisH47ie4mNqv8aqOO01njIgn0CbJXbFY9SKofKqPPZhJR7ZKKit7r1sEIiXo6lBiDyjkC/Jhs6UH74/6qBdeFvHwoTp15Bud9+40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F/z+JypH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RU6nw+yN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F/z+JypH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RU6nw+yN"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZXkU576867
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 10:39:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d9OY8rG8gt4nvi+fBrJ5jn/PKlAD8DibY7OqcJSVZtU=; b=F/z+JypHZbiBUNH+
	7xM5PWPBSNeUAKSretbcx6AcqbWQfotx//f+rJTQThwcVzOROL7HKJ/Wy+MmRWhO
	VfdnEF0aJKtht5sVY4oaV5DFdM3a7oRNR4xo7QCdmIbR4yK+UvtOlAsl2k5oJWW4
	ZGcQFuvcB+6QxLs+CicYNen3c3ikU9r35hDjCJbEms5BAK49Zlipb30JkUTsUF1K
	57PVbZx7btPTepeoytCqI3Wy+9QmDnyu2EXIrxDfkRrnegA9GruiYh3nnN074Em3
	0TszsOAo5fcAw/MG0mhuBjILWs7L4b3Kqp9kZ3lDHAYk8phdyU8UrpL6F/BUGVex
	3da00Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gr8uw1g61-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 10:39:24 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39e3dad7ab3so705792a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 03:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789641564; x=1790246364; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d9OY8rG8gt4nvi+fBrJ5jn/PKlAD8DibY7OqcJSVZtU=;
        b=RU6nw+yNFNCEYO5H7dBdN0299ZEpy2CymJpp0wV+pOzGAZUNZI9UheJTLLShDL9325
         d/GeNoiWpnysitRELxiKXeNPYSkF2zSfv3gOBBvqdnQJiI45h1jyF/C3TLgT8eMteHOT
         t3R+TqsykHCRjP4x/uyZdYICasUDXJNetYPlOwbz1D0hG0T45oAZEuXgmyRdow9+HLtm
         Pu8AwSFJ6DWMtw8GJQFO3JgsE+vQQDljIvs2JEccx+OnSJNm68Ktl+zAsAm4nJS8URiR
         sLUFHMjn6c00bjPFPHYc+UEHP/nDeWj2QsyqdDHONB9v6ObjM38isrWOnHd1ZPahr8Za
         WefA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789641564; x=1790246364;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d9OY8rG8gt4nvi+fBrJ5jn/PKlAD8DibY7OqcJSVZtU=;
        b=KimQHARowXrAYgVXaPZiefxVfRvnnRKjJyqQDjbC0xZk88/VyxuPQ1VoHHYyN7sXEo
         FBFV5AHfLaQ5iu29jibCUInxH9KGmdLxZmZR45/ikVwAohFQuQ1d2ELUoupjm0vP8bFc
         IqxaxJow9gpDYMgANPTzJEhbwfIa1K1N+sXaONwhIfpt13t8jX9OlkbjzPH5tIVDkEyJ
         2q99sH5WrFBCaRKDuBIvJM0F5f5ZXjS13OcsWjVAgiC46rstQR/bMjdqJGeHVm9OVS+m
         ztGuhInCxLY0vfyeaoyJ53s82JL91vj5E8CqmBJ+fBOdMZ4AXmcCwqTBdCxzeqkOOhZl
         jsSQ==
X-Gm-Message-State: AFuF++lqCNsZMiIjh5Zg6lldv5z2Zv9b5X2ws2mqc9a7qZG/YXtXyUAX
	xVKXVNnuaV2LGs5gwx9ey9argx+jMinqlqVs0mCHejOe1/aQWAm4kOTRvJigpEInJK0v68QBdwv
	ZlmYHhCOpxWJjo2Ea6Ef+gE9772dAQKmfRG0b0xPf8ngC9gEO5s1R0MegCMMJSIaS0nIb
X-Gm-Gg: AYBFou0Nb1DHCqYwYLA98oiUEm5TnOx/ypKI/5CSFSGoYBhXmgi/7sN1fAQkCWMa4kA
	kDGtY2+kPeUVLEJFHC0QGu3hwszt8m6S/yS2HbFhPOg53mRiNxxl5puVbcPVR8ybnw2DIcuiijq
	qgyaBSkLvgE4HhyqWsU3vBj+Py34jEgEzczZj5/w+wmIzpjV2xSo/KI3xNz7W+RPbRu5zBNb8Kt
	/Q8J18qV18nZI8EqiOWEY8wh7QCqmj+ZCTX4g0//wbzOGDlYuyzvMUxhpjLWdhnIClTH/XOxzWZ
	k2/oAnlAWAqot8LMKOyP/pnOCMqp0jf98JnESowc/HeD+WhiYhfGBeKwsFphM2rlbY6JxwXLm8/
	C6si4n4kdygRU4xL8SPYKBv2QVn/LT6s+mfg=
X-Received: by 2002:a17:90b:4c88:b0:39d:fd82:de0c with SMTP id 98e67ed59e1d1-39e1e278ae9mr13850772a91.2.1789641563769;
        Thu, 17 Sep 2026 03:39:23 -0700 (PDT)
X-Received: by 2002:a17:90b:4c88:b0:39d:fd82:de0c with SMTP id 98e67ed59e1d1-39e1e278ae9mr13850676a91.2.1789641563112;
        Thu, 17 Sep 2026 03:39:23 -0700 (PDT)
Received: from [192.168.0.173] ([183.83.137.165])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14395d3a31asm11898175c88.9.2026.09.17.03.39.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 03:39:22 -0700 (PDT)
Message-ID: <1e68976b-67a0-45f4-a846-0b07964e6434@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 16:09:15 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/4] media: qcom: Add support for the iris codec on
 shikra
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260722-shikra_vpu-v5-0-3d80babd4672@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260722-shikra_vpu-v5-0-3d80babd4672@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ZeMfVK8d9WZx0mRZAdavJUF6bsMnTP4i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE0NyBTYWx0ZWRfX2McLAueo7tiD
 y4LOidju8ScPK3IEcHW4P1XAT/tO//bbMaXxRiPaQWjy5sOf22sSl2eEVVP5yoCTKkQ5UFBuykp
 7oBHmv1QPFnTjf2UE4A0tM8nmiZsT23kpuEAMwOYzi7fNIfjFKUejHuY5VwfarMEjOElQwFoKZh
 HsxQB0gwf0NkgO1d4k90e9Cg5TanvObuiXSYF3eTSol7G0yu1Fuw5Ly6n66+ERw9xCdYJWP0rLg
 CV/TZtIxaGSbpV1E6MuJAXeRxpb25PZ/gehRvgdpCDR0fb1B3CcSr32Yo01qeaIzcovitBxxeyO
 qgsqDJ6Ohiddal3wju00fo+32afgOPex6RoEfRsobw84zZ3mk1N1HWfamHLrFHy7GJGTYbgUA1B
 GMe/6f09NZsAbomTowd/V39T4QjuA4F/wlJRoldwf6cPEJjZJHEQUZEORr+hnA8urc+MlIuGuDh
 YELRTO8SXpchPvCqIow==
X-Proofpoint-GUID: ZeMfVK8d9WZx0mRZAdavJUF6bsMnTP4i
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE0NyBTYWx0ZWRfX9UII2CBXJQl8
 e7B32dM3WjY7+n8gyp4WNr66xqbjAfYttlRjdwYF/Mtkfd90n7a0bBT3WR6wzTiZ9oQK0/jd4O/
 Owjgzw/ArkfdPy19RamYKIuHS09RJoI=
X-Authority-Analysis: v=2.4 cv=dMUzC+Zb c=1 sm=1 tr=0 ts=6aabc35c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=/MhRiX8TZM4BB34AAREmLw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=Q6wxVgh2rZIxxIaB2AUA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0 suspectscore=0
 spamscore=0 phishscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170147


On 7/22/2026 7:11 PM, Vikash Garodia wrote:
> Vikash Garodia (4):
>        dt-bindings: media: qcom,venus-common: Add IOMMU IOVA reservation region
>        dt-bindings: media: qcom,qcm2290-venus: document shikra venus compatible
>        arm64: dts: qcom: shikra: Add Iris video codec node
>        arm64: dts: qcom: shikra-evk: Enable Iris core
> 
>   .../bindings/media/qcom,qcm2290-venus.yaml         | 26 +++++---
>   .../bindings/media/qcom,venus-common.yaml          |  5 +-
>   arch/arm64/boot/dts/qcom/shikra-evk.dtsi           |  6 ++
>   arch/arm64/boot/dts/qcom/shikra.dtsi               | 71 ++++++++++++++++++++++
>   4 files changed, 100 insertions(+), 8 deletions(-)

Hello Bryan,
Could you please update when we can expect the binding patch to be applied ?

#1 patch in this series can be dropped once you apply the 600MB iova fix 
in iris/venus driver.

Once the #2 binding is applied, i will reach out to DT maintainers to 
apply the DTS.

Regards,
Vikash
