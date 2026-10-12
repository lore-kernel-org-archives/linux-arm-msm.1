Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253A848FF9A
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818557; cv=none; b=FUbfVb7Yc5Ih0RUNhiPoiAUpXIGsRl1wGJdxQcbsC6utcsON3FJxwkwhbAnjvGCGmKWMhsqaIrKvKdrXe6lStvwOwaRA6zcqZ3wpdmplgENAqX+FfIj0Npg5tKAhaIKjCToOHQEblB5nVj4AMKAmD08GWW2hH29smiyxRAKgPeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818557; c=relaxed/simple;
	bh=IJRoYw6sJZ0+0l+od7X0+0OrpYFWPVf9diA5uu82KIE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k8cefKAl53oNhWyzZYJRKku16FPqD4AEA1pgWjAmBuqJOFQxH+nAVt3hFmYVprjNHNMj8bZVWMF/+m9T5uhzCZOZXQ0MVLbAIOc4x8V6efw64Dp6qZoj3XJXeCnCYe3H8evH/WFZb+9T37LPhzJGEAwUq5YzjhSjDgSWbpuD0gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EnWCosfu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TrtXqv26; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EnWCosfu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TrtXqv26"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC08Ac3292283
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:22:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2GOYKBkBIe5rfJaEIMD6Cqv63TqMggSTQREHcWWPJLc=; b=EnWCosfu6+nUWUPy
	QD2VB5TCDmHoXtxAxBzaN8iPhIqe+T/ov/ezfWbNVjk186VpXldNJBWJNktH6Wd2
	DI0etNFUP9fsLR4oB4yY8dad1Mc8+Q2tRXES5Jk5gehApPwsa6jGsyLOvpT1a/6m
	QcYBdsFD8l7WrbP2WbhmiUFsm5Wmxp8qye0nhxBMpgbvppzXkQWuYorlmdIRib8w
	UbPcgHCzKan0KGeie/g8wzjvGOn3ydXMqyCld55ZWEhvWiAI2pLu0poYCzvMxP6u
	0LESE6CEu2qZypwrn2eB4pshtxgJj+RlwxSLTIa3V5T8V48G/T7K1SbXgyXOGwlI
	y66/hw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8uh3j1c5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:22:35 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5caeeb345c7so40877e0c.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 08:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791818554; x=1792423354; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2GOYKBkBIe5rfJaEIMD6Cqv63TqMggSTQREHcWWPJLc=;
        b=TrtXqv26iFJLS5ZSwK/wPd5wFHRiBawc7rxALykRUakjBGcHr4etZC4gcTXrkyu+er
         Xyvj5nMoJRMsUcW0DqXqcidE+gOx5TnhszYeVpK5iV1pSPKaQg/XBmIrqvKWaMs6oFON
         OFaA6ydwkahXNytotxhBCkm7KSxKRfY977nQ5ZVhibEjfkAqisz5yY/SHtYlW99CAB8H
         t94X0hrujqDnIUm4EH4ZSVstsrUjhcMBsG+czf9H9Dp52lBs/r1yb6TbAnYO5cge3+fH
         f2+jsFndc8XeSyOrsptMv1dK0qiReLnRP7/7O78dd5I2xG9Wj3ClfEwcLMV+FRVSdTxw
         /MKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818554; x=1792423354;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2GOYKBkBIe5rfJaEIMD6Cqv63TqMggSTQREHcWWPJLc=;
        b=kMMc5dC4YwFDupmOGpBj3O4g8seJYSV6nMs97ztrDKGQJ+X+GEpuuDJnIbkatxajN8
         AmvlLQPjyK4JlSyjRBnzHqOUtbiTTnQUc+VvSMpwXV8jMVNcNy172Q50mOeBCKZ5BeQH
         Tx9vMf6ChklnFfFrhnSZuQZJ80fmGbywGbhXUW/RtpkNWH4V28FQYDohmkOPAfsEcQ3R
         wPDFbzc2n99wSBvWKNa3uZXmuB9B+v99RYoRb/0Up95nxqIXNYgKjQD0Of5L8SSVocBg
         Z83bk+YDr2KST2IU5KDSkO1z0j6o0lcqeU1AhT1NFEysuMHmdJNHKceT1NJx/zRvHhrV
         t63A==
X-Forwarded-Encrypted: i=1; AKwUvBwrCsMHCe/AH4ZahSevNuUnWg7pSH7+zsjX1ov7SG204qG57xY6FoKK8xBI3jVdYDRvxdHf+rQQicBAGKQ7@vger.kernel.org
X-Gm-Message-State: AFq9FYJy0k70C9KJghQSwGxRjvsolmdQ4g2b9/iDV7w9tWkC2UkQ5dHd
	yhrLke6Fj/7x7l1CGMEONUOkyis7lN0oKFHx4wyciKUrj0lyLNT0u9AXi5ocodKoNBAh7INBRlC
	edIwyKJwZV0+DtYXt1BnvMfNdWXR4Rjb5O/ZwIcjMAtBP7wa9EB+t4iBmXDXH0Bc+647X
X-Gm-Gg: AYBFou3p9NAHR92T1IAtQXhgPT+zWss+H7+PAAimEpgMDpBuvl+WaL60BjkfvZ7EM/j
	xMcvsLNiPqoiEgM0mDFJ3homplVMJCD6izjzh5ASXcMjFyoxF6YluGYY1cxvpGpwDuximp4CaHc
	L3mpw9rLrpgd1Zca5nwK4weWZ5w94evBKemNFIS1u3xTYOoDp0dF3zwEVMdTSOUZ4mWNcQvhQMu
	u/q6lgyVCKJgX1rxlH8dpqRZna5v1Vhrg+w5Sqle5ZF3CHPNQmQDvXERqvnWnx8TmH5vcoq4Sw/
	LS3kaTM2cUdvcMGzIpUm7vzITMS5/D0NwD/yuzo7e52UbIQRK7XJz8G0YTxzQaCOKf1UH+GqFvj
	+NsR34o0pgQ55oipa2Z9jKg==
X-Received: by 2002:ac5:c5d3:0:b0:5e9:426f:33ed with SMTP id 71dfb90a1353d-5e9426f4394mr982837e0c.2.1791818554522;
        Mon, 12 Oct 2026 08:22:34 -0700 (PDT)
X-Received: by 2002:ac5:c5d3:0:b0:5e9:426f:33ed with SMTP id 71dfb90a1353d-5e9426f4394mr982825e0c.2.1791818554124;
        Mon, 12 Oct 2026 08:22:34 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a9f776sm472745066b.48.2026.10.12.08.22.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:22:33 -0700 (PDT)
Message-ID: <af06bbb1-0068-4d8e-ae90-a1097ce6cf05@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:22:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/38] arm: dts: qcom: apq8026: Add newline between
 subnodes
To: Waqar Hameed <waqar.hameed@axis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@axis.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <9484f72d6da11bd98bcb4f93e24c44b6ce2b8035.1790892852.git.waqar.hameed@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <9484f72d6da11bd98bcb4f93e24c44b6ce2b8035.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfXzRY2fCOdi2FY
 HpBEFreiyArEduCd8Zq/DI/cW4R8XpcOEdvhRxLWMlRZnHuVBF4jTjnthngwyp+uusZk7eR6mDZ
 n4fvjdCBVO8C+aD4BetJ3TBTX5Jk0VJ8GMhA13ziVk2KwXVBOTa98RFwCUqZdCW8pMqAaHTMnVn
 sfnjb7fElBRQA3HaWPvuFHyEoiGq8SjCPbRHmIDTfmSKxZk9u6p+6QV9S2ACDICSRG+gPCMHaSN
 GHRBkOcVvXPImFALzScg8El7qfx289tSi7U6syOB8O5Rry9yB5h4KJqBAjbb2nn+tiMAhqXjU+U
 42VFF5pSqgCSzD1VcAEAcrbgjHhRHfiob2ao4FqnH8a45sv7fdfcdqTx1kpR6Cieu9DsVynUbH/
 s4WmP+8fvQ5VWSHF8rD5WIY1l++NupeUzkbXTWNX8W6dNK8/f6PORY/UuIeOuaYnKMLl43Y9iR5
 9mZEPJNGCZrkMqvBO2w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX+yU1TEyBP6qb
 rTgomP7XxZFy/m0KG4UYbKDKgwd9qmQgymwEdL6xFxM+Vx+fnhB8VGSpXa3zAh54r6056zq4g3z
 NYyPJ2QoDfeqBRKOnkP4phaxwMiu13g=
X-Authority-Analysis: v=2.4 cv=QO391QLL c=1 sm=1 tr=0 ts=6accfb3b cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=3-RhneuVAAAA:8 a=EUspDBNiAAAA:8 a=WWQFUNGd85j635JlVwcA:9 a=QEXdDO2ut3YA:10
 a=hTkh0tvSPVsA:10 a=XD7yVLdPMpWraOa8Un9W:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-ORIG-GUID: sv__48s0XtEEjep49xgd1HsOVOhxWLAf
X-Proofpoint-GUID: sv__48s0XtEEjep49xgd1HsOVOhxWLAf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120061

On 10/2/26 12:36 AM, Waqar Hameed wrote:
> There should be a newline between subnodes. Found/fixed with
> dtfmt (Devicetree Source formatter).
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
