Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792568268;
	b=yweAyVlW0OLHg4XqN9NDvBSl1fxDDBEHvCYOxrvLgK3qbhYi33ff0uUESzzOvzAqFWph
	 MDUKlkvAvzu0Xuo2VvDr5S90M1UuaTbcgrgxzO7BG79qv/3xveEvq99JNz2komApY6aSd
	 yNe1636+laIqnjXYtEs6M/8YnAkIO3VQH16/JYb5i43WDusgHbCCnTpE2s0BAMxSK7fET
	 Biwq4HxC3VKd264kpcuPprE5IGIbpkhxvZ4jrvEPeYDPyxq7pddSnCOSOMORwzZJa6utV
	 Y3HSaNannBCt+YsVpQzvyjAkDJQuWHr3yrpRzWNzlBZNIdlG5BWYx79kgphzP3uP9JQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792568268;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Yj8rVsDjCVNiGCvcwswscnlJkXJL5LG6WgdMkVptoVU=;
	b=ZQJwy3+IQEMKQNay7fgQzhlfZLalm2GmYVUMuO33xyxnCzuS3fDUvCfZJ1S3I5ueW6DR
	 cHYITuuHWJMQBRSPI6lDoLG7ZNDa9JE6+w4+pyxbAoghEkcR0RFJEhca7pFaGla4JI5Wv
	 GmXFwXHuIdJwXKJ3g67DOCypJCKtU94E+A+gMUxnqG1v1s5hT4++PcXNgN11wssEeL3cj
	 uaaRT0Fyt145s7+yuOqSE3v4NuvZ6cC1erSHlX11DfHMn4dJY8cFeG2ekiPdAeECHmEJ0
	 NU3CJb102FTrn7E2XycgchGCz0QniB7pYwdNHiPr5dYKBuXsREV6tfH2zQYQFafje1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MP0raHv9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hHODPjjq;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA62606A319
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 07:37:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEA62606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MP0raHv9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hHODPjjq
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5j2Uf165261
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 07:37:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yj8rVsDjCVNiGCvcwswscnlJkXJL5LG6WgdMkVptoVU=; b=MP0raHv9b8S31GAn
	jp3bKYWlCYFqovUnPW57bgfCzGz5va4oaDRTrIYDErm0zDT1wSYwv4Z/JiV6NGJO
	8cwYtoQ2E6VJ8LlKWf6IVjwQm9wUom+x99276PoxJV4YmTYOfZpzbSQDb+s0mf8U
	J+jeygXaSd/i0lCcs94b/VFCbI+GmKYpcnwNpQfG1Y+ruW0hngRubVVK1p1ECeqK
	36iaI9F4gbMNpiPkz4OUA8WQaFp6X88AujF1dccJM8HmK9JdE9QOYSeHUvPEuscF
	LUC2ajh5OWMJd1NYUwPZQSlsD62AgNMzJk/Co72qVzytRKzYVWoXvUSlBS3fOAoh
	j/X15A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hegs01srr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 07:37:46 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-533962f6bc9so1291141cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 00:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792568266; x=1793173066; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yj8rVsDjCVNiGCvcwswscnlJkXJL5LG6WgdMkVptoVU=;
        b=hHODPjjqheC01XUqsBbjgwzsbU8/xLMnVoQvNAcvMti61le6CdKpl0nG2l1tKKsrzj
         nzIFwlUkr0ejh0XxJRhe73uMP+k41SIf3amM69OYUrvTlXdv8qiOfOa9VG9jE042+7ff
         0h27KdydTeU3MtaaCiKcHqsFOF6gmOg/RhNLaOm4CbtghOpfjYfmpOzXMXNHIb8TqZ5R
         cnrSf+lRDQy7juZD68VQ25NjZQ4tkeLaeER0oIBMLz8wVJHESqK9Y5orVHK8H7YBGr/r
         nCVux/vlJG+ekxzP6ANZlez5DSFQzOoKl9Uh6pt24gXjnPX47wfP0S+cDvf3cPs3AL/K
         m3dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792568266; x=1793173066;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yj8rVsDjCVNiGCvcwswscnlJkXJL5LG6WgdMkVptoVU=;
        b=eHUxLynASqxJTNRO6F+/qoXfLW253p/goN9S3N/c5XDQo4vrNMFu1jqSWmuoHb8Lzq
         oVTZ/85Hcvjtolsa9nrppZf4+V95JqVKu2meoiPygSwXJHxf/8tyJW9cLq7pqu/fLrjH
         veUsNNGVQoI3WbhZ8nrWe0B066W/myaePMqPNRipkh6xq1jao1PRY3rDXs3G5XFe/M91
         /QHij72OLsudomMbxk43ULXW7DJ2UKEIqkdiQg48QDxhbsE/Oaa4aLLE7SwQoyFoep00
         AUf4h8tqkruOB/s9zx1DTQr4JSXzMLDKKL8NLFaCh6vyoK6W0hYuW4dmCFfCQ/gCg2Uv
         ynQQ==
X-Gm-Message-State: AFq9FYJMZ6AwNZ92NeCmY5yrbpVrw4aRSPn7wTb6Lh0/SRxUG/AMwct1
	u4FXvsMK6jVxbbUiSTWr6ZPeLYohy1sxB55HyUH7NeHX7R59alyWQkQ1GflBDMmKN02mhAPlQJs
	ZbuMMkTS+26ARhtwMTHBUFvwE5YQF2PMjIAZBc4tht7utRPUPs7WiPljiyXe6KxfIVYjA
X-Gm-Gg: AYBFou3EXphjtcxL03RU4QLwwF7jLmuhjFuWBS5dFHvpO0LkwrSaxB653dBjCf7IxGh
	Bv4101zXXbtUgYnUO6g20MzExp0UFuuYWZpXPqDjg8Wj7y79WnTE1XkfIvq5dx8AWkQzcFej74r
	tQ9juO36EfGcu8AmW6E81Hd/k/RMNqv3HnRo98f3jiUHgWmwF2CWCz9BS/V7gHEAiaRcu6Qcx6a
	E1Lpv0lVRQnX3eOk9hB5aE82vBWpk3CZUAP7bzn6SCJl7Z9X1wUPoSqJN3DZm1V8dWzg154ck5C
	oJCNlhj6RBX25RN6Xv/CrS9hPxT0SaRjy0e2o6gMB3V+bOE6His7xXFmRfiFDcVtSl967womRm8
	fBraLQ/6KA8b9ZEAaN32V6Q==
X-Received: by 2002:a05:622a:1b8e:b0:535:84e7:5a86 with SMTP id d75a77b69052e-5369b15f2c6mr25454601cf.0.1792568266119;
        Wed, 21 Oct 2026 00:37:46 -0700 (PDT)
X-Received: by 2002:a05:622a:1b8e:b0:535:84e7:5a86 with SMTP id d75a77b69052e-5369b15f2c6mr25454351cf.0.1792568265726;
        Wed, 21 Oct 2026 00:37:45 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4678fa9bb1sm47891466b.36.2026.10.21.00.37.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 00:37:44 -0700 (PDT)
Message-ID: <63c8f014-0410-45ee-8315-0b646ff78d2a@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 09:37:42 +0200
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] soc: qcom: llcc-qcom: Fix whitespace in slice config
 arrays
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261020-lower_case_hex-v1-0-bfac89824646@oss.qualcomm.com>
 <20261020-lower_case_hex-v1-2-bfac89824646@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261020-lower_case_hex-v1-2-bfac89824646@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=S/NMU4sP c=1 sm=1 tr=0 ts=6ad86bca cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=SbMn-8PG_jNgW46L1lQA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzMCBTYWx0ZWRfX6ZWAjK5NfoP0
 aE8nvmlHVyzHLKiYXJf7QZPAKBLflJTIeIvDG4PUXUmSb6pFGnFPNjVPeeSRbcUZLWzzvq7dAcf
 hodF6Kr3uwdOiVGjdvxuA9RDnUVZ+fq4oJQyS5uu6T64DXH5KvRyWEzN9mIoCO4+dhOif7H7fh9
 ni+MELBkcKtYmf+Vq2CJNBoSYs628Dwfa7H5HZI438HvhKVuXst2jBlwr+teUbGjFY3PwTj1rQy
 F8u5rpdvhyf7YpRoeU3C02V/AVO1KxsNfWtUbNPdoBXTfyx6dlHtOcYL9hkKRgSotMFD/szVowm
 VIYP866NyVgqzwB+nAQDkLlsCpmRweCuQQM8qi0U2BScZoBF648BnadyW3r/P7k6a9546DP66BT
 CZ5XSh0diuGFXQxWkB+criVS4nvItgHh08u83S0cmHu4msc1xJ+fVrm0dOCHfzGaEbOb2XEtrwW
 Z2zrRKnWTA66v40/hUw==
X-Proofpoint-ORIG-GUID: UGufa2nZ3SwRGpFwntRWeoVeeKPqW1GZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzMCBTYWx0ZWRfX+4txsaqTvDoP
 eA4B0AZeD3X5cZKs7rUfztMpDt94D6rBab0P7OmGud/QbUqQOhnGdLgQt8fGcRLdJvwlRv+vENm
 X7hXLHoFI2WyfRcjTECwjOCr4IqO01M=
X-Proofpoint-GUID: UGufa2nZ3SwRGpFwntRWeoVeeKPqW1GZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210030

On 10/20/26 6:54 PM, Kathiravan Thirumoorthy wrote:
> Some slice configuration arrays use two spaces before the opening brace.
> Also, sdm845_data has the first element's opening brace on the same line
> as the array declaration.
> 
> Use a single space before the opening brace and move the first element's
> opening brace to a new line to match the rest of the driver.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
