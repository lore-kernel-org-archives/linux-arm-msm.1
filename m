Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA2D51EDF2
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 13:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792071382; cv=none; b=msMyDMLvo1OqLmj8SOp38QdkubalxfNglwt8D4pcAx8vl0jLCrnC+wordv4Nq1PtoQcMZA/q6z52rqSq0WijoZC0s5X1kdRS9zacuQ2afQjkP9FAsn1VoJtn7AWS+MQjMV6ICOdKgiwCpr++ftaUnWRAy5LzGC0c8dEbOGvbv5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792071382; c=relaxed/simple;
	bh=+orYL4MYtYLUDMbwG2VQZeEovAixQhGy2YvJUA2lGIk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d/YtjoO4v9DFDZIncc5EiF0TQnl4nNF2viXxRbGV8tTEAgc9iv3trpzKT4omJOsOJtGYqYEfer3oGMRpt3QDMu0s3xQZs2cKC5kowe2EpVJzh6Djih3oPMu7cP/R/08VkFOHbeoVYJ3mjUQ2ovVQxufbjD/6qHJGqf8Y+tG0/ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tzi5pE4j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iPJHxLml; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tzi5pE4j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iPJHxLml"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jeDw1955639
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 13:36:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S6Qd4a8NqN7DWD9LPdV15oWruFRO9Nvhiys5+d07zYk=; b=Tzi5pE4j0MRX05D5
	WhR2HvtgeNRFQUMkXW8b0jcs87yRCIMaiuLRIvf16r+3yFaWpafgll45Jgfa0PIQ
	alOfACFEoittMnyA+b+PdjY7JZPxah2hOF71N/oHTdiyY3bHneWzrTGPqkqkQDik
	ZDSVM7yAzZjRcxBlxXj+Ei7SIFOql38s+RTGH9rcYXq7mVWhPESvXdToSsD3DNuj
	BTCn0sKlcQ8BR499Q73n6/S1L+ARXX6NwyHTH3XpUNQWFuYhygd4ARjZcuPz+TRB
	iuge8C997R+hkqPU/MTvWNArdlpEdLGgn+8GZiXUn4z7XYf3G2hSDvfLuoen++98
	lBOGFw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hakdeu4w9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 13:36:20 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91782d0a163so12245636d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 06:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792071380; x=1792676180; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S6Qd4a8NqN7DWD9LPdV15oWruFRO9Nvhiys5+d07zYk=;
        b=iPJHxLmlteINvSydCBDO+SbDSmYeG+5UHNpIIFX6ZXkg4HtnoeqMHDWNvXVTo3HkJa
         GMLm1xZRAdJTZeEWQrvMtGnVQ9DfynFfhK+bMvmZ3EckaCQoc1J8yz/5LngA2llV6kIE
         uXnUhgCckQFDhAtlCrfg+Yk5s0o/TBR98nKfG8O4XSS/ECcDBpvp8fmO3M5pD/gZM3v5
         uhEEX+v/J84EV2GbK660dCSO2OWJF/9R2J3MoW0tsQhoSLpGISkGCC1kgjuz5wRi4BNc
         cjIpCF/bKdXh+QH13evq5oo0FGCqhbuWnn1YvlBsSHDeW9nhZipNA9ttTr35b9EyliZM
         gVyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792071380; x=1792676180;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S6Qd4a8NqN7DWD9LPdV15oWruFRO9Nvhiys5+d07zYk=;
        b=Y2B0vG7Guj5BZuBA1l3Sn2In6B7SyFjJvSQXnaHq5rgapxCIoMukabuZWKqqlQcOfH
         fTs4uSfYZe9z6ew2RkHgiDMK4fkp3FbomSmxKqUCm3WfWB2LwZpUdgxdfzfntWx67iw5
         OzgPshM2Ej+cHk61ilFDuSci+3wIKLAac+XIaABP6w1Q1ayQ67T6JPGdfdL1IGnlE5DP
         4hTqlxXgCqmifheYAatt96dD/UJkr0UTbkzo06wZKCRIYESOnf1doQFb1zlv5E67V/Px
         RPqdaW5fmrwSeZq2sh4LA/bSVkRGH2kRQUczWrs2lSTrbbpRRuH3Z4xSNk1xMwrtRptq
         SNtg==
X-Gm-Message-State: AFq9FYJEJbdRbrGYBhNqEGtj2RUmQ4Uktwfspy2/aJ8CbSQSnjp8yiLs
	Oj5gE0QF8Krihec/dyjMRdEL3AWFHs3OKbX0jus5eWdLNl3YOGcpVwH7aMyuglvZbJqKNGX1v7l
	loqwCsb23rqvdlcDDUsuvCm8NaOlRTr8QyF5RYjLZmNFVmVPV+qEipJNqBFi5VkYyAvUaubO930
	RC
X-Gm-Gg: AYBFou1F8rCvoyDB967EQOOnZjbwS8s3EQPJ6iTIHj4FMu864rdwWSDqx1Qy4YHy1tE
	nMXW9rtHS5cioKrSE+tihY9jGtJR5IdiwPl0KjtfupW4rmnHEkUUOpptG3ZSC9PQv05OA0OKcMo
	rKlS+1SHZTfMmGIc82qhQ6KdwsgXOq0Lh20jx8iwsK1P+bSEwMAlncRG7SversejeU/APFKi/fW
	JIaBbZN96qD6PXp3Ql6EEztB+7EbbkEJquS/BctEGbqc9a2Vs1KV3bNS6bOKXpdfhH6VJJ537Rg
	DJfCNKR4cNHTQXUHt2GCoE+4CIOwrxssJjfcVom3+2xshD9S5Ta8k7Ij6mZiEdjfOO7CWAg4xUp
	EQJrhvOcGVG/ScPPR4M92Iw==
X-Received: by 2002:a05:620a:44d5:b0:93a:2bc8:61ba with SMTP id af79cd13be357-93ebd0c38a2mr3512777685a.1.1792071379653;
        Thu, 15 Oct 2026 06:36:19 -0700 (PDT)
X-Received: by 2002:a05:620a:44d5:b0:93a:2bc8:61ba with SMTP id af79cd13be357-93ebd0c38a2mr3512772785a.1.1792071379101;
        Thu, 15 Oct 2026 06:36:19 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3eda042e95sm123771966b.52.2026.10.15.06.36.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 06:36:16 -0700 (PDT)
Message-ID: <99fc9e58-0171-4840-b836-e66a0f3d10e9@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 15:36:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: sm8350: Add CPU capacities
To: me@fromdisposition.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261012-sm8350-cpu-capacity-v2-0-67ce449becf0@fromdisposition.org>
 <20261012-sm8350-cpu-capacity-v2-1-67ce449becf0@fromdisposition.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261012-sm8350-cpu-capacity-v2-1-67ce449becf0@fromdisposition.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OdENnRTY c=1 sm=1 tr=0 ts=6ad0d6d4 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=Tt5JBQAfAAAA:8 a=EUspDBNiAAAA:8 a=Qd5qHVKo_rp75_W9aWIA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=kpHMOrJS8sLNr5ru0mYA:22
X-Proofpoint-ORIG-GUID: JUa2esbyg0UdeGHzXbhRK7j1fWaCjw9Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1NCBTYWx0ZWRfX1bZQrCafyP12
 CCT/mD3k8RreSWyxTY1NZYYdho1Ff2ek5ft3DH7aJZwOcSP6YMBoR+RNT99ilYNHfyD9D8KvK02
 acJMAIxvH54/LN5O2ciuv/Wfg1Wv/tXREfZYe3Ky+GyvHa3sv23imKNvenm4so6TTaELjpKPBNq
 qDAvzH87nql5LQPZNe4HLwdUZRSVM5umGWUZgdd9iCyOQgn5HfTzyaQ67YtvQdcDz2qqLjs+9wM
 NHd2l2PQUYHA3HYGkcFc0MmfFEYoerqX/Tu7Bl4vKceJkFQq2fuKEem/ImXgtvLKRWKIZbpVSrK
 7ZUYrD3WoA4ej8A6TCQCxvpnkZF3/hmFjW7wczh27BPLivTnXUcUJWOQdQu62L3cQmxGXbnYcjZ
 ToZFwYevNaf0T6DTb1V0fxdu+UgcCv19Ullqippsm+McL9UPMmTKkt6nfHKGA0ozAxLvMlEBvnP
 7zZ59CuIzDgciLzMwzw==
X-Proofpoint-GUID: JUa2esbyg0UdeGHzXbhRK7j1fWaCjw9Q
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1NCBTYWx0ZWRfX7SMf1E4yrfs/
 uzaOl8p/kPL45NHWiaktmfL7ek3fRGTRJMmRDXx5gWgvmOGMdUF4MHZLxkvdz3gFPPo4xFa6F7k
 4aSmJZyu5fjv9e1qo1Wy4AkJv2YmOhY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150054

On 10/12/26 5:56 AM, Demeter Barna via B4 Relay wrote:
> From: Demeter Barna <me@fromdisposition.org>
> 
> Without capacity-dmips-mhz every CPU reports a capacity of 1024, so the
> scheduler treats the Cortex-A55, Cortex-A78 and Cortex-X1 cores as
> equal and sets up no asymmetric CPU capacity.
> 
> Take the values from Qualcomm's downstream device tree for SM8350
> (lahaina.dtsi in msm-5.4): 1024, 1946 and 2048, halved so that the X1 is
> 1024. Only their ratios matter, as the kernel normalizes them. The
> downstream overlay for v2 silicon (lahaina-v2.dtsi) keeps them.
> 
> Assisted-by: LLM
> Signed-off-by: Demeter Barna <me@fromdisposition.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
