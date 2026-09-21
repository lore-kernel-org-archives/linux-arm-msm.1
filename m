Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3763145349C
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 08:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789977863; cv=none; b=a3j7l6i1peraTOyHNuqC3KRICLV2/KBAIgSA3uD6Ts+YBiTkJ5DeASTNZA1wueR8r4QXwLwG/5VmxD95bAksb/4iVwo4qOOp3wpBQ8YEhBgQNGZFIoTFLTmDbkNwu2Mmf2SV6xWt8XGTn6Dd2w7WcdbAqNFLGTT5uS5ZW3wjMAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789977863; c=relaxed/simple;
	bh=b/XfElmrg0PZz/9GmZOtZ6MsUFfU44t+Ljf1eSJeiyQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A72O5sQMU3f6pKvuEfjsYVR0rrpGXv9xlHd9Z79BXjaJ013ntuDUqzHhnnr3XUQFoQCXb6eVzhGxGNwIJYMPrhT/zcUkVeQskSUvsGx2gpbnkkydIB3TzWRoL0IrFLPXx1Hi4cgM2mWDcAb59zUKs/LIcktcfavvs1NsI0fdpN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VB57gxky; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fv67QSBM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VB57gxky";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fv67QSBM"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L79kIM4143058
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 08:04:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pc/Gagg8gfQKPvLUu6IsK89H4wLrEEXFNiyIxsT21Qg=; b=VB57gxkyymWJ6a/n
	n7EOThVu6Z9wDailqRDUPT2W6NZdbGH+2A2pDAUx6HHcEevrB1hx9CRE9FcnC5ZH
	3eEYmpGAMgNrRPvD+Yg9/5KfmLLlCPrcIysg09CcMsFduPwQBLzj4h5RZx1SR9rT
	ZlY85en97ofEeZUxUVx25O3X7Zys1JN/rQVKGVsOzDbsrvyiJFnCPe0MItWah43Y
	acpjzdG1pxH7ZPtzPjFmBny7AqeSNIeq0iZmqqRJC/WVV7O4btGIUFRNNdzUdh38
	wc/BNtxyc5kSGfa1lF68iMTpuIFUgPUezdRCi/u21+aUdSs2SWGl0Prd8XTlfNX+
	IgLEug==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtyxq872g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 08:04:19 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9392788b3f8so81791985a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 01:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789977859; x=1790582659; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pc/Gagg8gfQKPvLUu6IsK89H4wLrEEXFNiyIxsT21Qg=;
        b=fv67QSBM99G26sRQU+4JBsr5YkbmVBYOj4CsGLJwR2W1o1n0bgOfg1FYmF7dqnqg5u
         AJFnZiLRxL4urEod2VZTQWRu3Zn/RP8WM1zgi83vp3BawdXHarHvlJ3kBHls3gPvV4gM
         xprfpCGNEa+RA/mm7iI/67WhIvBVH0EyihfkZ3VG0LyTTsnw5Oh6y3nbVKtvToIhJ1Li
         qL8Sc/vFipcxRYn3iIlfmtK0goiOadlRtP9+3xSI27oK7Aqi1V2d2yyqifJs1vlTeXZE
         o86OY0zewh4MWbYI21D7I3d/4+tl0QTOMO93isUEhWzZFitwTKIDjnI55gbx/zWaEW4g
         f/SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789977859; x=1790582659;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pc/Gagg8gfQKPvLUu6IsK89H4wLrEEXFNiyIxsT21Qg=;
        b=ZcV2rwW6HB2nZwxzb2F3X8ir5uzFFi8TRe8hzMzo7fxrZ8J60PNUZ6CeB39XHBFBoB
         1l6+4vnf/ktoH2Vo+vh6Ws7vzDP9c7T1K6JHyeS/6y+joBGQ8ED7Z4eq9K902+rULhSa
         hrc6elrCcc8PIiRpKgHfqc0PD52PKbm+aJwGsX3mgJqoUt8aMKZFikpvB7qujS18Y4DS
         /onEpIy3oJ5D9fvzR12pdFGFF3+MLV+btS/YRG00VXqfPv2P3ABkO0TlYGORR4kNscoI
         oDMLOOjPcG7tvEWo/B9QMrXPMWyDZWmjd6mFAGQRHpa5YPvld/JwhW6eBMw2jDZF3hHw
         6HoQ==
X-Forwarded-Encrypted: i=1; AKwUvBzpqzgS+J7NjdMnZj9vzVQ3ASUsYoKUfY50Umz4VuCkuSo2nQrIuWT8AiDX4q86+QXA9Hy0gZwnJGFoxi9K@vger.kernel.org
X-Gm-Message-State: AFuF++m/3D4y54XoqUSeSZQWuJBg+4IskYf+D9zuhTsRhpj1dfNS/S2z
	UV8OQykQzm3GHVBCf60RJVAufDoF7F+Urw97abf64So04WN3eaGyDlpH7RXEEGASF4xMyQcIWJC
	1t6ytXsYhTWmtZEFyEHAKFIUz34eAwkGhGv+TQ8/N3LOD6S3ljXYVcDDZr4oQmaIsqDmV
X-Gm-Gg: AYBFou37YwqPofvEp5IO/vlqZXcpv1AZHC8tEVT3PiwxxpEbdrsoj+j8HODk5SAAlRc
	UUbZE1fxaDixjISaVnOXUMsR8EkfB+sSpIGZEwhfgVztDVhCa3W2ThX6SCIRaFpvfRZEJKVaHoU
	DzHAhG+CtcnH4tO2jniJEZ5zt/8eBOOaDOKaUmFR/Wh4xp/+EfgIwJoY48Odpowx234tOHjBiBo
	Tj7ikxPh2GvG+URthl7KlV3pTQf056rO6nTyW1Cd9G4q0qxBflZ4caO/s1LPMPWFM9wTWVymWn1
	I5yUg6tBqAizWeMbkbuHXNNoyXWPmg8vEsiU0YhfHO2IycIi3etRQ1QNnZaVpunQHMJWkw1/AjY
	lSe98WQjRPIUjJ6soPQ41Dw==
X-Received: by 2002:a05:620a:6499:b0:939:8bc:8826 with SMTP id af79cd13be357-93bf5568447mr909257085a.2.1789977858897;
        Mon, 21 Sep 2026 01:04:18 -0700 (PDT)
X-Received: by 2002:a05:620a:6499:b0:939:8bc:8826 with SMTP id af79cd13be357-93bf5568447mr909254385a.2.1789977858424;
        Mon, 21 Sep 2026 01:04:18 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa67e11071sm3732647a12.23.2026.09.21.01.04.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 01:04:17 -0700 (PDT)
Message-ID: <27b70cf0-3c99-4e1f-b1ca-69a228f92e66@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 10:04:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: use assign_bit() where applicable
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
        linux-arm-msm@vger.kernel.org
References: <20260918141833.3023124-1-peng.fan@oss.nxp.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260918141833.3023124-1-peng.fan@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: w3NSbyhjmLHAzKn5JDSC77XuBN_-f20t
X-Proofpoint-ORIG-GUID: w3NSbyhjmLHAzKn5JDSC77XuBN_-f20t
X-Authority-Analysis: v=2.4 cv=OtraWC/t c=1 sm=1 tr=0 ts=6ab0e503 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=nSpsjYtsPra2AegJnUsA:9 a=QEXdDO2ut3YA:10
 a=3Sv76qktopEA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDExNSBTYWx0ZWRfXzgB/APvS44N1
 apFGQrJx8sHEz32F40UEd8UBHwM7uxBRe6/zEdMdidGqmthl/+6GukVaFCkKdcxKT8auQ9aoAd9
 ZG72elteavPPwSREgEi7BBvwO+WosaM8oxc4A8rwnvHp4e5YHuUBklTaM+9KtR16X/Jy/TC+qqG
 N156b5N0QD0cHjpEEbUTrW1WBi2PvCbYZO0quTxyQLtPslOVeO7avhQTWH2jn2eLyWysKapiqMh
 7okXt5gCbR9cgYonje3pIX3NcTGXVHsJ6MjTjHXlhldy98CyewJyp7RKuS0V+Oeohcu8zLZ6D7m
 Uas/sKIUYBtIL6d9l+Z/uP4t1CWBm7pgQctM/zkQRHOyzNnubttBYvHrZ5eeCuPR36/7WqKDqpp
 mWd2nt57Pyu3T7KwOlyCfzFD9xbh00rEakiJ2EdK80lG8PbZkGDwXy/DF7oYjh4zsmBQl0zak69
 jSoKqsNMSNIRx26nk0w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDExNSBTYWx0ZWRfX397lKnJgCYTt
 9jl1ffesZ1lKo5wb8w5WVm9qtMwzsmMy2hFLzqQcsarHz1UOHq6erVNVZZBBbmJ+ql+Z6iO9ZKY
 DCzHSwOPcb/u4jvjrKhq14FhiY9VrMg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210115

On 9/18/26 4:18 PM, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Convert open-coded if/else with set_bit/clear_bit and their
> non-atomic __set_bit/__clear_bit variants to the assign_bit/__assign_bit
> API.


Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
