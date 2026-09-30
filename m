Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8102048424A
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 10:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790764391; cv=none; b=AkFOenVUl1JB+UdrZQ6m+13tSyTa2en3KGebMt1ZD/CAzGwewF2iOWpFcMyki1kQ7yPHqOaHqnscrG9j9v2gOOFvNe1yqd/VW9f/avixk7ohfkaE7QeRQgYNVet2gFIeAvg9VA9QUQOz9ob1b5MEozUgE5S/el/xs8BkQcnVPZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790764391; c=relaxed/simple;
	bh=p0rtOpqJgYOdzRogUQx4C72rBJ6MZuOxyLFNm8hD7RI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YdnEYZ1wdnOx64hH16e6xo9CDP4V0J3iZQPZp/mFaZuYSSCsB/uortIi5bKDsTFh5N14XVZkAEgTdCjyvN5lfev0/W1E7rYazFaYq6mIRBrh8Wy93u1V0KeZQE1H/pksGeYkYr+jZq3dGTBQhTz9wU6mbxE2BCpfhqL5kWiwKO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TMQRCHii; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kQGeLJ5t; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TMQRCHii";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kQGeLJ5t"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U7dWeJ3489199
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 10:33:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ekqw08WhSNuzNavRYsHvqJW6DtR1r0AaDDdoOSLKqQU=; b=TMQRCHiiRvFiOdpJ
	7BSVgWtkH48nMNyYnmNAfpeGzU0zQqZurkIl6xRlU6uxU8NAQoTX4YiO237LP+3x
	jZ0THO5zSq/bQ9WtqpSWtCzLPCo0cbKiiW2jwG539bmITFukFb+jcs/78VRASBcx
	FtZEUqKaQIws7RIZD2hkL2X8NZK91pCZFq2QveLVm/j+VrTwHvtorAVXNWfuv5OY
	+aRtK2JADuv3CaHnLZalsJq5ieeIhKsSgpOUkD7QMM8/XQwBtQdkmtqSrVdCBxHr
	0etWsOK6685L4ZGtzYqfoct0iy4vVw6lU9f8AH33IUgqkHLfOApzS0b11fPpl2IN
	NsUIdw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0j97us44-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 10:33:08 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-530db5af1dcso13440981cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 03:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790764388; x=1791369188; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ekqw08WhSNuzNavRYsHvqJW6DtR1r0AaDDdoOSLKqQU=;
        b=kQGeLJ5tBSUqxWm7MBDB6bNfPSh507Q7fXZA1RIRHNeH305BEzRSR32JB7hWJ9yuhy
         55bQW/WQ56UlfQYsvkCRIDF+gKnFOY31k3t/CS00oYqmH9uwV5ypQORO6RR4y9Qdg1be
         RhlpZQmpTeO+AkKNoI1S0RVAv8QtgnIn9uCdf/7NRkzF2D6YPuvTxHEeknxS/18oP+oJ
         2ZWcrsNai/gyFT4lKr0bVhWjadtzAPT2YLz3GJtFSDa6d8CVrbTe3vBwQoisCTvbcuGs
         czfD5jtnT47DIJEnUF0ojRaesgRgUibuRekmt6qaFhib5DBpGbaCQeNxKwWHrWAlWC8l
         q1dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790764388; x=1791369188;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ekqw08WhSNuzNavRYsHvqJW6DtR1r0AaDDdoOSLKqQU=;
        b=KfSPk0hs2ccxJiO9f9DX7efEjmV6urcjD3OGHp6nTiwWvqAGdf1qH5m8I9I8WsZejE
         7luTy0hKz4erskPfZF6gdQHdtUWEwYLSSdBuNX+aTN9x1Yojlg64hqNzANEw42iRtb0E
         QUqTvNlZ8ItFXdICLi5+LAvk9VeiimGljWTVrBjSKK+XrLLO97MYSUDE28EUQud+38Ex
         jvuzoAOsaRZe+qXqURzQOXVfOfpccW5NuHLyQD3588Zk10oRA1q2VVQjeC0FsrhFt9bf
         rRHm4E/bm7GadgWR3YX2oSxmzAXbicsvQiO87HxONJXZUW9vznkmAZCMhETFi3yaD7ny
         +Gmw==
X-Forwarded-Encrypted: i=1; AKwUvBzw6fbZXR5oplr5+cNYG51SoUkFOsySj1orw6wFo68f09iQ3vYO2rcP55MXROn6WPYeoIYO+GlMYLkycOAD@vger.kernel.org
X-Gm-Message-State: AFuF++mNn4H6CmNp3zb3dq855Its4Oz5bMI/y44JCwiZ87Z+hDRB803Q
	qOSj0bgZU1bYbmciHP1XXR6zvo9WZ9vsbQXzUONo6Py+/03P997FHTzUNR1BhVoAJ5g6y4JwHj9
	rfDJEpzIbc8bKMUUNjoKvnHSoggJ8czs1vb4JHgrH5iwNZs572Q7UqaCsGEgsvyiTp8Xa
X-Gm-Gg: AYBFou1/Yj5u+Xgs6vYTD3O8tWX7NBV1Qlwml7KMYdLFqe9cFFN3Oaay+oX83NTIPBh
	PQ66L9DZ30TIsbrcVK4mrGLFL1RsAEimFHNm0yQ/xx+6vJOmJOfo7EYFKXfwN2ahjMAAKS9zyCy
	wTqNTDFeLHxeEtRPPfOBTRdgVv4YUFYIGz4IRjmP7S2K/cWB8VbhKdHup03rkmIYIaAUQhY3dJS
	0FjB1q5Fe7CzMlOQ6lOThVMJ/ihAih+9Pkr5PTZTGtVM9XJedPnq+VN5o3IwHT6nmumXFZQwrf3
	ZjKvUvfWjhVyV2GxyWUXu+KO9lLjcHfQ+potdzJrqOCCB90YrVimjStylnkHLIIkOSsyv15tP9N
	jpkMeqMsieprGSrsfctQi7Q==
X-Received: by 2002:a05:620a:4116:b0:939:5924:e319 with SMTP id af79cd13be357-93ca934902fmr130585185a.0.1790764387745;
        Wed, 30 Sep 2026 03:33:07 -0700 (PDT)
X-Received: by 2002:a05:620a:4116:b0:939:5924:e319 with SMTP id af79cd13be357-93ca934902fmr130579285a.0.1790764387153;
        Wed, 30 Sep 2026 03:33:07 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e22f7f26asm44710266b.42.2026.09.30.03.33.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 03:33:06 -0700 (PDT)
Message-ID: <cb246048-cb92-4fd5-937c-3f285c67ea80@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 12:33:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/13] arm64: dts: qcom: lemans: Add Iris context bank
 subnodes
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>, iommu@lists.linux.dev,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
 <20260926-vpu_iommu_iova_handling-v5-10-0322ca5dc10c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260926-vpu_iommu_iova_handling-v5-10-0322ca5dc10c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: zic4s1ANBXUmO-fPG4E1pS4cJEesbmmh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA0MSBTYWx0ZWRfX4ekSsOIkaH1u
 qIL/2ZuuV+rLXCmfZqPDTCPictOoypPvvlZtm1647uQU/QBVQJzSYzvY1Gdq2tBfU749oN+yNmb
 zoTL0N9pN0ItBC67/UFmdGkTYzEzV52Kekm23W6LYWIEW9vxtdts1F0iQpoK0DZ8L4EE33W08n2
 JJwtSJt33nR/ZkbggUrn05Bks61k6hCunroR45zVfSAlSvMFt0JW7TLte+IzItzBwl00QNwVp/i
 Z63JvOzG7Te3czHw1dU+sHabgjdzDk1S9oJmIw+b+9q49GYwnI8AI5/ne+j1qjSzYyMa+F9XfF8
 UsXe0Up9J97Ih+Jk9ocCjLT+9f2u/H2vh60aZm6OZSivOdqda1Z9wkyIXk55myX4wuKrSwtqsXU
 MMmw10GFpG7pvvsdLrxOKUE3iuNiQJyIDbQ4HK0HMNLBfb7j+tFkvzHtO33QLugMWc4TiTDrnBz
 86ulS/hkfKlATsKef+Q==
X-Proofpoint-ORIG-GUID: zic4s1ANBXUmO-fPG4E1pS4cJEesbmmh
X-Authority-Analysis: v=2.4 cv=BPImP1QG c=1 sm=1 tr=0 ts=6abce564 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=4BULcDCo1EIeXDFKsSoA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA0MSBTYWx0ZWRfXzBcPEk4aUz2H
 NEOw9qk/H7AeA0VE9uRpUQJHhihzDVNxekQaQNt+KobpdTYBRZ8NaMD9kK4RPvvyjNgH61KDjbf
 7XQMaz4eRjRqDQCX+s6mNmhIpo5RE9o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300041

On 9/26/26 8:34 AM, Vikash Garodia wrote:
> The VPU issues DMA through several SMMU streams, and the hardware does
> not give every stream the same addressable range. The non-pixel stream
> cannot address the low 600MB of IOVA space, while the pixel stream can
> address the full range:
>     +-----------------------------------------------------------+
>     | non-pixel stream addressable range (600 MB - 3.5 GB)      |
>     | 0x25800000 - 0xe0000000                                   |
>     +-----------------------------------------------------------+
>     | pixel stream addressable range (0 - 3.5 GB)               |
>     | 0x00000000 - 0xe0000000                                   |
>     +-----------------------------------------------------------+

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
