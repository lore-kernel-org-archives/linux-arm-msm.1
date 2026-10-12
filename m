Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC16748D87E
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 13:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791810211; cv=none; b=BFBucEYf3dKJ8e4Yi/awMQxOtZquDmTTDz+sKEWEqC2mlAeWcBSGOtN2fWr/pVGfx796dQs1J3e9mvNId4wqNGeOmvpCULZOE95JH2UKLVLZxd/p9OZNIYAkX9RL5ozrf9JP4MieuPQHzdK8J98yUdGug9nJht+CKaf2dwYRqlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791810211; c=relaxed/simple;
	bh=GfpGHxUnYZzyUwIu1z1KCFtH5RS06L2Mp71RQg6jZc4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uD4xzk9zxJSx+qifLyh3QuGtwS454gCi0jIQBdztV3NH0rFTqohT4qWbC928muehK0ryL19Ntm4dCUeL0knsZaZAwhGyi6gPKAzs8vlq3+PB9T1Z/JCUBIG4wdFKZbtnR56NdsC7t8ypyaqWtWASBAQWgFJZP1xpMGfHPaR7F+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NsuTBb3t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GCKi7h0Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NsuTBb3t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GCKi7h0Q"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC07fR1686076
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 13:03:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6J26DTKLvi2/zw10DXQ2WKfVPDze9T8UmQFrJqlSlLM=; b=NsuTBb3tlEpbtwnm
	i3sAMaRSnVD1YaEWyP06EiT9xdvlyDWWe0HcaFYxt01UUg52DDg6HQh9B+17nl5M
	3B05fe2qvYfz+Ni+l/pNuDixudtdeq0uLn+YHz1u5tt9idmb1UD0o2A8xHVAjxnk
	wQPAMIRhStJdhgR9oiosZKls2oPWLkmOywzqOAl82cpUeGOaV7RZxpU6AfIuULhj
	1SLP+YQ22hqjBBEsCJL9WBKux1YhRRA9dFNOqUp9qYrSw4QmGdjJ4UrVmiDkzLGj
	G390hqsZfHyrtBaNKqvjSc7+a9mpscyN8H6zpmsikEOGxrS4ap8tRWVOFOijRMog
	jyD1Kg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wbc0uqc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 13:03:28 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7c101b7f863so36303137.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 06:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791810207; x=1792415007; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6J26DTKLvi2/zw10DXQ2WKfVPDze9T8UmQFrJqlSlLM=;
        b=GCKi7h0QhgTtl1eRrzG4GzGEoXXNyGKXmIVL93oUkSg9DiuSTwNAJvQ9swCwtolrhF
         FUkQ9xXP1OItfVhG3ybM4pCXZIp8SIjOlOZqHGCK/7fgq0O31tdcUCeVn30VNLE0LStf
         phc6l/AVmT3gFCpgclTG/QCkgHmYL6rtlJWzsPmr+cQVB+eT0SkiKmOgn3mUTtYntwYW
         x+dszYWoZPCM75IhnElGwcL4HhhstPUYd0LuPtTPqD3H4ML5plvoaXfA9NCO492WQ5eN
         pIXZuILlcff4Jo23auzP/feGfaPDsz57KY32bN+S9GobmTllfD/tMYcPj0XqlcK/5dII
         w/yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791810207; x=1792415007;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6J26DTKLvi2/zw10DXQ2WKfVPDze9T8UmQFrJqlSlLM=;
        b=j1yU2q2XvvSzJqcxuEXCPLXzlsbhHxBp7QEmyADyJ586/l2dSQdG8sMxHIxwtxDdR4
         c9rVNi1nSNEY+z2rVx/AXjvKw3QFaFHUAh+wL52c5q6AUy1gP2Hs2hNjkTyn/nTszDbG
         81SKgcmt8nPTJVAbMDQu5tUtwpcLYe/LrPgc8Ub8tFieRktCfHLDZ1/rJKxFV7gg0354
         PjtDHEUlJXgl2A/5tvDedDkvsuImA8H3UYox3siBrEfAHUQ9jcccSuGmNVke+i8eFdIG
         c8QLfEIciHxxjhun+QxkKU0xdxZfH6I+hTJo0ogLax4P6liuNeFIO2zi6kBml/hYtlur
         IkGA==
X-Forwarded-Encrypted: i=1; AKwUvBx425SxnAeV8kOagi0+1KTHaW4pGHp8LbkI8XpZk8V9Iw3EBYyZopRJr7A6c3M++kA03j7+n1tv/30Lf/Ad@vger.kernel.org
X-Gm-Message-State: AFq9FYL0okcGyNZb8g+pyghNA1VKKxm5U0D3MlP5/yZMzkUYVTsPAxHZ
	7ckaHbyvBV21f0tnWjI/urI0dL2sCelJj8eJk+64Apw1fgvNYXy2PfQ8Chifn4AAHzdVQTxfBSx
	G+8mkse7DeSGgszYIkEWwsc7nzB06Q+WP73ckc+GEctYbZNV1rgKK7pzK9b8cidx3fTUn
X-Gm-Gg: AYBFou3Xu3W13lsNFqj2ZIXPxdWtRqQIlgkuiLbSb52kNOIBLKmwmykShfCOIkYId/n
	jhAKm2efepK8/ux0uzRevb20JIF50/JoYhLFKPOCaXyKdgRr3V0uYmmL87CAciW4vqhzybMJpuy
	OIZ3j91pmP94UT0h4bpcPwWi5S9FGLMKHRK0g9ofPU7HB9taGpjLxaRsWW2wL6Y244iSdtx905H
	vnvncAjWlMSQ4aDA72Bp50Yc/D9tp2Q6G32VbqmVlYYt8Te3WWfGb4zyKYfFF5alxKVyEJdr8S2
	7pob2FIAaQj7gunlX87ecZm1eVVsRwdux8BUDwr8+puMGvovKJ6NjnnzDEWoWqu+86kHkx/y0xa
	5fd6qkPqNSu0uKPijYLf0eA==
X-Received: by 2002:a05:6122:8704:b0:5e9:397d:b197 with SMTP id 71dfb90a1353d-5e9397db6b5mr1278949e0c.3.1791810206904;
        Mon, 12 Oct 2026 06:03:26 -0700 (PDT)
X-Received: by 2002:a05:6122:8704:b0:5e9:397d:b197 with SMTP id 71dfb90a1353d-5e9397db6b5mr1278916e0c.3.1791810206283;
        Mon, 12 Oct 2026 06:03:26 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3382b8953asm232387266b.21.2026.10.12.06.03.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 06:03:25 -0700 (PDT)
Message-ID: <996a5786-6f47-4afd-8dda-68a46b6a0623@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 15:03:23 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] arm64: dts: qcom: add CDSP FastRPC extended context
 bank
To: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261007-extended-mapping-dts-v1-0-b52eb8c3613d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261007-extended-mapping-dts-v1-0-b52eb8c3613d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1MSBTYWx0ZWRfX5T7pHfPAaJZ5
 FhRIP5wAUgWlnyDUpNhuqBBh0bMwWZUrez/dE353bBAZi8Wb/ovUj1tMxYw3MPswXJCNv5WeHKO
 3+TE1BBw8vcEUJJNM9LOEw3H9U4v7+E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1MSBTYWx0ZWRfX5FTrBZgS1UvS
 /x+VTuMuXV9fPmbqfxS1lbVbCAEtSdYIMqBRkQ9Y1oi+zUiEsODiICdDez2xNLL97aCh54F4qOR
 dtTT4zUfQu8xIbqejwZU2a8PEu5eVOTG16+F5EsDZVGzwlO6I+2MhgLFLx3cQZ5BO4ILuIvBT40
 Xtff5Co+p7W+kuSluY1tkaGF9/cYCMKs6ZmZWkjrwGQPpm3UxSp+ih91tpfq7VfkXZXduIjsSnN
 Iwp7cOGw2Iad2UCQtVvvSV5xmksr2Y8hymMCL/FkSG0OjTNte8i8pNEx4AbZI855j7owHUI6rrT
 L+QDLSxeapMj1stul61bC74Enpaqm3pw+0272GJhJGM3f/O6stRwLEmD3EZky/W1QjY53VGC7q+
 Jmgjx8OzuiAc+bAJexeI64/lVZpuFxPia3yivShVP/DHj4JUE1IAV1P6AXT3slzlGWBST2s49yY
 CwrXQIwu6yLMJL5FMbA==
X-Authority-Analysis: v=2.4 cv=C4p8WgP+ c=1 sm=1 tr=0 ts=6accdaa0 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Q05WB-lhHploSVLRvUAA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: M6fXVU3g1VF397jr8sFWkW8iC_SMxlq7
X-Proofpoint-GUID: M6fXVU3g1VF397jr8sFWkW8iC_SMxlq7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120051

On 10/7/26 5:54 PM, Vinayak Katoch wrote:
> Wire up the dedicated CDSP extended context bank on kaanapali and
> glymur, enabling buffer mappings beyond the standard 34-bit IOVA limit.
> 
> The FastRPC driver identifies an extended context bank by the presence
> of iommu-ranges on the compute-cb node. Each patch adds
> iommu-ranges = <0x4 0x0 0xfc 0x0> on the designated compute-cb,
> restricting IOVA allocations to the [16 GiB, ~1 TiB) window. The
> fastrpc and glink ancestor nodes are bumped to #address-cells = <2>
> and #size-cells = <2> to accommodate 64-bit iommu-ranges values, and
> all existing compute-cb reg entries are updated to the four-cell format.
> 
> Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
> ---
> Vinayak Katoch (2):
>       arm64: dts: qcom: kaanapali: add CDSP FastRPC extended context bank
>       arm64: dts: qcom: glymur: add CDSP FastRPC extended context bank
> 
>  arch/arm64/boot/dts/qcom/glymur.dtsi    | 31 ++++++++++++++++++-------------
>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 29 +++++++++++++++++------------
>  2 files changed, 35 insertions(+), 25 deletions(-)
> ---
> base-commit: 5c4d4169604b335c38bbc79bc1fc03042981fc6f
> change-id: 20261006-extended-mapping-dts-f60dbc6221aa
> prerequisite-change-id: 20260609-dup-sessions-ea2acaac1994:v5
> prerequisite-patch-id: 425dc9414848bbc3f2a053d067195d849898e2ae
> prerequisite-patch-id: 4fea14b47d11a5a3e18065d8cf3a461841ee2b86
> prerequisite-patch-id: da0a3d55397a522ea4b77769e387df9faea8e024
> prerequisite-change-id: 20260826-extended-mapping-9b08b0c3108d:v2
> prerequisite-patch-id: 7fe093060212472237ebfaf12413fa38d662e5b7
> prerequisite-patch-id: 86acb1e79d10600734d07152dbbc3010977b85f8
> prerequisite-patch-id: 08da00c4dcbf2e77ba217676bf93daee78c20e79
> prerequisite-patch-id: f6a649d7e73501312402b084adee4b5fb3d83a44

When you send a series claiming it has hundreds of prerequisites,
it can not be picked up

Konrad
