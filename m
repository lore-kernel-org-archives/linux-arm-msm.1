Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1439C3D1CCA
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 17:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784653366; cv=none; b=YguRLulruvqKpkR62wlQ7e8nVJPLKz5PndZnDMWMWxrg/aO42axthAKB+v/koRuANAlf5xssTSap2yYwMLHDBnG2TOJSIdrY2/QE/67rY3mwwBfuziUEYAqG0QNgO7vwSROEGTJdcR97SrHEyK+uUk55hKzd+7h4ZJOmjTqlBiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784653366; c=relaxed/simple;
	bh=CCLHL/9qXuOIxscGN994AkztuMhg3vqvjAApjxBs4es=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HzaGAJSpRjk9MIcKi8Jnbm4tQldSaRPEjAeCnzeUf6SLajVSQPwmEzyhi3UyX1WdposuwuXKyx34RlbLiOa25CI3qHacR3SABPrgP27FccFSCrIMo7WnHt6eCEi8vl8wRlGz5O9XikyQJaIF7Z06W5oyOjqMbElbfJunVZQMdqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nKw4hZvq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LWjkMv7h; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nKw4hZvq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LWjkMv7h"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LH2hcH2389222
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 17:02:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0quPAI0p/ihpRaYsyDrrGjjtcU8ulVk1wA2nTdZt+CE=; b=nKw4hZvqPKgHvaLO
	0PXZnPs1+YwMC7rKfK+6xIHlZP5+I0MoiDqX8w3/yLA4OPu0yE3oit58/iTF1rwW
	6n6TFtsWaLnazF3wYvoYZG/aYTFiLq3Lb4+vZ1MM3R2C4ha3qtCgkxI6qmvTdwwq
	wZQCOCD7v4wQmBGbbSw5Zp4VxOQ8v9p/lWL1Y2UNJ3ERXzHtpCe0H+6PkqUNXuPF
	Xi/jepIHPQWXhIms8iZk6EF8ZBc8tE1bhMxdqGOaE7lR+VgRvJGk3Ksljcvg7XjZ
	vra5jsRPhsqZ0n+HH/8H2svRZImAF+2ZKFfgxzraHof/BjgEy7i7WHIH+QhPuUZb
	22KAIA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1dukn8r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 17:02:43 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-744c091ec4fso328202137.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 10:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784653353; x=1785258153; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0quPAI0p/ihpRaYsyDrrGjjtcU8ulVk1wA2nTdZt+CE=;
        b=LWjkMv7hPhA6fNfvvhDIYxKs6YYtHXY+6g64yKKLACQiU6C9SPAK3opjxvYu/dG2Do
         Pq7kdmomqAHPvdfb1WSKAWsqxaEATLdATCmIUV4crlgGBFuBVvCCypkRHGNcBJwjLUw4
         FX04xJpXRUWAwwViG1OJvx9mtDI5tVrOM+Ps5XGXbMWICNZjmGFvKRdfUTkODkcI4EFp
         lHM2e0sNnQue1KD8K95V2Y38IZWNGKgjMCILMwzckxKMZLBtBzXvFJJeQ1BnvLpUTw1a
         g3gAZG6p7gYylKDa9dgkB3i2BKjahfrK7Wno+/THL7Y9182CizsCZgSeMxbo1n9wIjDu
         w4zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784653353; x=1785258153;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0quPAI0p/ihpRaYsyDrrGjjtcU8ulVk1wA2nTdZt+CE=;
        b=Rag/lCVkZ38PinULsUNlQwl24gwOZZMVE8ktdqQ6GdOjGHCIB1WkX4koE7gGi1WH0n
         E+16aAn3xZ0PD5DrZnCv3D1kqNmLzcM9vSeMG3TczKI6OcjbBJvUGp5bVee2pUgONNF9
         ZboX6bOU8XOf51hbDEGHYoDtFt3fgvzZGiijlmTT1VIMmeBiAy+RK0GF3ieAiX8EMyLS
         3VGEk5j5OX72XIcmUppRDMV71cRxTwfrRhpa3a9F2m19mlqM3Rsbh1gKm0NZX8zGUrkQ
         FJVqcQLA1kHo18shOdsj12wfN4taCQR+4s1SRbpBoKCpZEk13YAl/c5xofnzfs7+GWbt
         kERg==
X-Gm-Message-State: AOJu0YwTK0+S9U3RdzRRLHozbNKhCSo0xvhkZI5jtegMA6lwksxz8VmU
	tgU0mjPTxjJ9jlKDMfh0YzaaT/NIISRNdmb+Iw+s+aTK94KNMe4I8MiN67cHAH85kw/pZAikAs/
	gGS44dwW4ZkL5BX2stIMaRkjPqiFU0I+LEyOvKNUmab7PcDRVbmtCemNTKnnFwRC6VTBo
X-Gm-Gg: AR+sD13Jrnd6oFwnu3vjFV0TX/WS3lkQLdSvZYeVm1SYV0BLfxeVsWEhEMzyLpmCex5
	dayphjAhzkkDFuhq4ejJRmPUOjFCGlswzdsuAHsS1f5xUEEhL3M5grgs5WtknyiHw56beciYCu9
	imRLPprP7896piiSt2/ybwtsw4Cx8zjkjSLzGxyzsG0QVnmJmE22mYuege0XTL8NJSm5PFKutfV
	vj778r/536bM3pA7EziRg6q7m3KF35xVKdAAUBh5SHmok9oCdkM1JRzXlQeKguxe1HNYgJXNVU6
	yjvwBk06RtQM5TbpBNOJUcP8Lqc6VAbzEwLiwXyTUkxGJPSXbXFU3zPE+SHdaDzpl7/vQwDfhXW
	xZrb9zCS0KE73NBKFOIrYvD8Q
X-Received: by 2002:a05:6102:5486:b0:727:36b9:dee with SMTP id ada2fe7eead31-74abc95465cmr744381137.8.1784653353615;
        Tue, 21 Jul 2026 10:02:33 -0700 (PDT)
X-Received: by 2002:a05:6102:5486:b0:727:36b9:dee with SMTP id ada2fe7eead31-74abc95465cmr744339137.8.1784653353120;
        Tue, 21 Jul 2026 10:02:33 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32a78260sm1445266b.6.2026.07.21.10.02.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 10:02:32 -0700 (PDT)
Message-ID: <e32b2f59-4fc5-4c81-8a89-24ad132c10ac@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 19:02:30 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/5] arm64: dts: qcom: sm8650-hdk: add SPMI ADC
 channels and thermal nodes
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260721-topic-sm8x50-adc5-gen3-v6-0-a507f4a1e537@linaro.org>
 <20260721-topic-sm8x50-adc5-gen3-v6-5-a507f4a1e537@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260721-topic-sm8x50-adc5-gen3-v6-5-a507f4a1e537@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: IHbbQr9FPxbT0Mei-LglVOTsdLy5qNSM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE3OSBTYWx0ZWRfXy6FN9syVJIHt
 ocNSQIzfklU7zJd9WgISJMV4SXEfuB8hv24ke3HqHrGfFoSYDCFw+SBERwoGSsykZP301rxuKje
 NUVjElNkcUjLuCSv2qwUJNjAypgB1YhKASZzYF7ZyOvBz4Y7JHLE0HP44Fsw7/LSjomw6x0JhBn
 Gv8qPiWhxFjVqwFek0+P1hMEURRAL7FyYxnRh2bBqEfepGX6QcbZuGagpawwyftcax2UGnPeQyO
 RAW/5A0l+AqxL4wd8riWlWKVTnm7eTThpubOeU4jAvacqha/wV2AU1Q5jy7nrypi6k5xJ+f9HsP
 wS2oVjlqOjCerFCJbUJYFhBDO7P01PgGgGQtaaee6tz07lxoESo1vEiEAxCBW9t574te8VSo9tl
 9h4RXyumI8xjdw6Q7ox5qepw7AhsihPTc+tuUrzC/C50MS/TdekUAUfQ22HSjP+2KxrU/+x/pBs
 DfwExaafiC+0x86MNEQ==
X-Authority-Analysis: v=2.4 cv=I9JVgtgg c=1 sm=1 tr=0 ts=6a5fa633 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=zxsgVq_BHBy1SaPP9u4A:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: IHbbQr9FPxbT0Mei-LglVOTsdLy5qNSM
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE3OSBTYWx0ZWRfXxt2EVydA4+qF
 29RZdcxGGDLyXY0drXxSrjRvU+Bk43l1RaN+YLVSohLiZEt3EeuoIYYypGTm0TLv63o0+Q9ZyOF
 2eHZ5jd2LS+Ml5cR9wnKX74RG8oajz0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210179

On 7/21/26 5:31 PM, Neil Armstrong wrote:
> Add the SPMI ADC channels on the PMK8550 SPMI5 ADC3 for the
> other PMICS on the system.
> 
> The thermal nodes are sorted by the sensor channel to be
> coherent with the system thermal nodes ordering.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
