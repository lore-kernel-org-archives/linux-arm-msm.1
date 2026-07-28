Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01BF83D1A8F
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 07:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785225316; cv=none; b=ON4TzQDcxooXKKdEQJEAZ9droq97nZ81jy6modkQqm7RARqLw9QTfUCQXEBwu6e9H8k0/8qKzmJ2Ch1ae3EA/F1cwLy6MsePzzTzvvhmyUGml7dS7SjZ7XFze1tJiJ94uizPFMLO977hPWKZn8MpEcMqQ45CKMhVp+4emBziU1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785225316; c=relaxed/simple;
	bh=KwWIvH37nOyDzNjc38dog7JqR+o/hc6n47+w8BBdwh0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PK16kOr0Q/FrRrWYrk2epYh3+MIC4+pbzIYkjs7r9AR4yXfF48P2KA7Ej33yAnQ9wFJp9BZqRoOUtN0HL41m/oloEV7x/hA19HzXdlwbazPlomeTfS0G87AguyDkNs1MyshLjGQthK6PqVdRKUR0OTp3yXMcwpmGiMZ2+D2lB3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PygFA7ND; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BVMakUHi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PygFA7ND";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BVMakUHi"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S3adIw1303585
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 07:55:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/7+9Df1sNq1WR0vSAyOIo0NZWq/YPVHpaEUuLGtVx8M=; b=PygFA7NDIwUZvv3K
	FI0VV/JBzSmdNomRpXZaTx19L/Hb+17QIcsLgkBIaKe9f66CxNcS9amLAS2iXRss
	oao5vwIwGrR1d6iKeFzMfLGO3IjGJa4FKsIEvgROZ2M1e2axmaKtZ7gxfRIiJh+o
	V6nKsCxsHX+Kfu0iRXH3xOVRfg4XHMee6kKVwly4VKDVtQlEoP/VbrMi4MbvkyRx
	EO0mqfoa2slyzB4OiQNZ2ElQ15iEq6xFSbE5ckDc7Dj+LjUUaCC1VBvX2tzZAg9B
	QiAH1A5148aCu+7rA1htc+bXxqhE/0NnU57qAmwMOax7iS1QHP9BRWax/JqWlqG0
	EeFjoQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpbp8b6v9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 07:55:14 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c27616421so9359651cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 00:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785225313; x=1785830113; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/7+9Df1sNq1WR0vSAyOIo0NZWq/YPVHpaEUuLGtVx8M=;
        b=BVMakUHiOJ3nM8KIRIVB7+OnZfR0CMY+D7QGihT+WK8gg0ROgoye/8IGBoReYmRKYu
         5nlfO1EUDrO4olcWFBqrlLQOLWdmAomtLM4rYa13seP8J6oHNLizkz2CoVBtlEhvpX9D
         x0GCAeR94d6hxuw96pfoh8M341M7KpXwh0ZZ1jzlbTznvgvAjsqRnkV07o/kc5LoSO8v
         xWnJ3yYqBPyMb74r8lkKM/SK5EHtKmeYPpCUb8fZVV6GUGtVChW3fp8mEryhWpggxoKQ
         ISksLafRJm9StZxbDGdDQLr+/qvzLUlQsd9h4P9CC3lAFc1oiLAfaCBqxuhmVoiOxU7J
         OA6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785225313; x=1785830113;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/7+9Df1sNq1WR0vSAyOIo0NZWq/YPVHpaEUuLGtVx8M=;
        b=s6ZdhK0OPr1heiWsU5DShDygE1P3FA2umZ7hiWo3SIcE4hgJWrzh/YFK4JgqEuRjo9
         jbaPnvzbY9QyeL02QOJfBokQOoDH99h00UQE7f4AdyEUcbQlYJzsBnstPttZphb/Ku8l
         8EPYbpvq7vl1VzQRvhgMFF1wd2X9ZWDfjAbXPLa2hQ62ATRprXEjO8O2ZNLcqqrgKZ28
         CyBDaD5EgE2W8uX/MfRtVrgzjyfQWm2rgsPdDnFgFgFJOe6DpvhDtJkZYxC0sEMWYD8m
         XV1gwF/9oo3nb+/MgiSkqUjVTxiaQ1dHY/SuZT4rZNL1hpXdUJcFG7P0tFDBPcJMXWih
         KKPQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro5x3LrLEIknG4L0/vLGamjXkZAHX7Ty1HMXIbs8+5uHWFuXLmKtPXrvao+dTGN82M5nz4m9l2K7D4WZvHC@vger.kernel.org
X-Gm-Message-State: AOJu0YwiRVojC5jVmxtYDecrppZj0RT4vUskzEeTPqnBdFIlAfAXGRj4
	iXbNztcMASqwl39Aq3w9UnR7xVomcuq3sX7mG0WEop1hDzAh0CJ7VrR52BEioLU5Le9vS9ZD500
	H2IfUG1DDej37su1q6gWeQa4/U+An3smrrVd2D/kCAdSU5o7bNEZFd4/iJmpaEFONxvcsfhURoa
	v5
X-Gm-Gg: AR+sD13ntEeL68bIAsqBXSh1y5nAQmXfRiY7aBevHUJ8tjeb2QOQSQfDDbQRUQp1/j3
	b17jJeY5BMwIHAICgV6gHAhShuyDQvwDeKBw90T3A8/kY6Po7s+Pz9UTvm0k44CEmZ91aITqGzD
	gHtzsFggEY6im0vIGpqid65ejnHvwr8YrIElFThtYcd1ENsTCwxREkAbcWm8a6LGXzZiL8tNcK3
	R9ftNuNd5E2yfQk6SqBMQxbcJDWbaniU/qO8f8PixfmsEvNYxpodUQLvjIkFChoqdQzBUKaG3YS
	1wEi0ocucAk1R9TbugW1EXkcAdSw7eH1IqmelX1cxvGbfFri2H6Ufy9vzX6Yh97ie6EimCYzrG6
	XlvjRrWyjZRKffER4ez2nZVU6
X-Received: by 2002:a05:620a:4491:b0:915:7c1a:1388 with SMTP id af79cd13be357-93302694720mr88122085a.5.1785225313185;
        Tue, 28 Jul 2026 00:55:13 -0700 (PDT)
X-Received: by 2002:a05:620a:4491:b0:915:7c1a:1388 with SMTP id af79cd13be357-93302694720mr88119785a.5.1785225312637;
        Tue, 28 Jul 2026 00:55:12 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32ebb385sm724127666b.52.2026.07.28.00.55.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 00:55:11 -0700 (PDT)
Message-ID: <693aadb6-3f2e-48a1-a2e9-69b66e9ec500@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 09:55:10 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: defconfig: Drop redundant Qualcomm irqchip
 entries
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260727-irqchip-qcom-defaults-v2-0-466f3c407937@oss.qualcomm.com>
 <20260727-irqchip-qcom-defaults-v2-3-466f3c407937@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260727-irqchip-qcom-defaults-v2-3-466f3c407937@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA2NiBTYWx0ZWRfX9dnvlUtQSMln
 kDMK1hD+GbxV6zBCy0SEL7qsg26DWRZNQu4/rDHSEWWSZr6i70G/oaoj4vjo7NY3jaGAAG3TYqp
 qnYLpv3OELufNDx9M19XisHKm3Z/XDo=
X-Proofpoint-GUID: d6GIIlDjwjH7l__8aL33c1tf7zElsxEZ
X-Proofpoint-ORIG-GUID: d6GIIlDjwjH7l__8aL33c1tf7zElsxEZ
X-Authority-Analysis: v=2.4 cv=KLJqylFo c=1 sm=1 tr=0 ts=6a686062 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=WLFcmARD151mzZubfcsA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA2NiBTYWx0ZWRfX0VYf5QHVJ+er
 aegMhy5cU4Qqx92C5d9mWEm3GTaTXj1UDYsQIYHAnv+hfFZTND/LEB/NqmZGka2cs9a+6qz6Wxk
 MtEndivRDTKWKuSIk+Nfe2IppjtHinPm27o0HsxCcMxIvNHyPwkWiXjjVK9m1EB8+NxumIIcema
 VjMaGvEIEv7niA4MXuEZP/pm0+u16NVe8OEklB8HiyI1S1Jig/b6MLddT7EXUG2yK2VRgcevdaS
 dfRxHg7q/zEN7K06lGhLBzPaSVvCcRYBIhUC79F5kFGZ6rmqTLK9G5+W5Qi+zXZxSNrdt38qkwB
 R0NwvSOWvD2276Esx0SAGADa686btPr6FOjn68hhiNYCTtJ4vKH6jbYehc46pxkT6E33IWoWUnS
 cD6kesU+Sc3XdYhoRHjJgLvsONCMBjQTHSDndQZEisslugOK6vq1j9h+/sCFKSVH8I8rITX7vfH
 UukGFi3nnqaOfBA3YMA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_01,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280066

On 7/27/26 10:01 PM, Krzysztof Kozlowski wrote:
> QCOM_PDC and QCOM_MPM are enabled by default.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Depends on previous patch - this can wait a cycle and go via Qualcomm
> SoC tree later.
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
