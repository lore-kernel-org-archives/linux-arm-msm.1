Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08CA4CA767
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 13:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788789018; cv=none; b=dOBzCgZOexVp/n6rUV9XS/NW+1DzU3pT82s1HpTgAVmhFtdzwD/RMgOtueQBcQW/AUYx670M3ev4LA7oPhputB7LlwEjDbwdc5Poni7AtaGJRee5UHw+6iwy3sFcFZEcX4ATK/tcfow3ALV8vqgj28pamnoWfSHD36d3KqlKdJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788789018; c=relaxed/simple;
	bh=o9S1JfDAchq51Lt+nfMscQYFQmX7g9WFFdmCc4nhmQU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Oz3AxjDBiuReZNeHhGW7uUfiuM+Co+QwnhVQoPaxUdlbm6fukX0thKAp0GqYdmeHGiKg/+pUDEOb6ZDmNef8dCh3cuCvDQSVjx/x9GKx9T7K36xbXgg9KRrRkmMN6bZ9D2ovLvy4j6zi3gICMIGfzXqsfFWBcfHIy2/plluDDdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pki9vY6B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rvd/eKD5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pki9vY6B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rvd/eKD5"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687DdaFd051617
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 13:50:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+wM+eOxTc6jOlnbk+CByrbAH9tqADAGsO4vwBIVFrBM=; b=pki9vY6Bi/x7W2WN
	Mo32dCJkzGI7KUIqSgjzTQfqJCzdyeJkG1tzTk+YBpmTGPevcgf0IXUQsCVc1TTc
	//qcQCdXOQ6lonMtpsJ0vbMyN0/aNFyyZXTXMGPcJmOgDVcgGe2x69WnIAdV/fD9
	3YWAtsTDQqCH5iqpTOprK9df/1IWo2QHHk7THWe6a8PgBCrlKwaa4/kZZ9wqaaBH
	VBivDts2C457t1qNKtCVqn8ZYD7SGLJ/E7U355kS1SKJbg0hw0zPqgSAC99PfEgB
	DphXOyCOvLdQbLM+hrH6zwRZ6egd6KoT8o5JjQtVtMLS0cmBrNXxLb2e1DeYdQ6g
	5yr7Vg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghnmj292d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 13:50:15 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-385d2703b64so4663926a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 06:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788789015; x=1789393815; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+wM+eOxTc6jOlnbk+CByrbAH9tqADAGsO4vwBIVFrBM=;
        b=Rvd/eKD5jeJC1ciKkoaNPG/T3W5nW+L+NU7U0u11sc9ungL06JQm7iER8fFo2Kaiev
         yL7a4m7McyXHWuBiyaotuiQGYWnXj0R3mZPhu7VCvMq4EfkGUVBBUjSQoAsYNlri0Fx/
         uudPHWVXjiOXVAkx5mlLI7qryf6wKbCOtN4JhwtJtPRTk16225qYLxgUoIIDpp0Br2t1
         mMsioagrziCmAoFHREr1ejQnP5Yg3KF22y7r8RAWUd+q8enwz5IX2IQQTul8Gc/R0zrr
         G0oeJWy2jHW8pBYokzIfCsBmksG9NRnrAx3HlQEibuDWnd9VK6W0ssNVd0WQGBd92o+5
         U5Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788789015; x=1789393815;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+wM+eOxTc6jOlnbk+CByrbAH9tqADAGsO4vwBIVFrBM=;
        b=i4ILVWShTbM8i7hSlQZMeTilRUBj5MoklMSnd8xizkoaxjCeuhfb6v4yVWW9n/3e4z
         jQHoRgUgXpL2suWxXKqzHgx4atsRsUKsj8nD1oAjz8QvzE6bKJ/pX2ebBi78fcLXvx4Z
         vB5pSYk7TESAol3yRSWa+G0ltm+7zEzK0nBNKvxx6ZsFVM+Pr7V+aA3W8shwW4MhPcDt
         UnU3gxQEj9rbQNULorpoyCfiEp9QjtpUehweyLiQZN4VoeeeB+iwJLdwbUD9S9cX+Yj9
         Tktf+e2J2cbfPhudtPrOeiIxP8z0k408aOocEZL5pSuivMBizBCMOEsSd+Lhm4pYheY1
         NJ9Q==
X-Forwarded-Encrypted: i=1; AKwUvBxjoGxmIv03+cUR80tqU05xPZ93Ldw08LM1OIjxfpuWqlzjM0+GUqslvZvgdnYctdJ33QYxAt8/W26pl0Ws@vger.kernel.org
X-Gm-Message-State: AFuF++naD8vSKI9T5/pDU4tajVk2oxKl/A4GBjmXj6bBaZmTpbG9tEYi
	k4JzLYh3FRLyC5dDmV9T8x0afndB2RsDEaTrrUctRFshnTO1EDP5nYuO1ZgPdu2ZPBTlBZ0xTRJ
	//Eaw6vZPjYHiNe16T4/0Z96zkjZNySyfAble4causnptKVxWawefchz5aXwsr5Nerwuo
X-Gm-Gg: AYBFou1LKN+XL/viKYUzwlEkgc12ivwEzBNL/XW1v0AnSWu020JdA+c8PgvJiOcB2mF
	fNfI/BGhxuegpH6fNbrOUiqLpL69e8RK+zwO+lGWK2rSx++com071tK2SVNrKKa4qJ5ybvct8S3
	bLLPbVqZdIzfyacjAp79PQx8gDy/1xg+Ilq/9n3NnwZFa064059MrlDTatabN1rupkq1vjX7EVk
	Bre2OUI0FPI8TEHyqmmSmjjN6+YLAp6kSRjDWi0/dFhscz36nU4sR8vcDZNd+YOtT//RiJtrlIK
	3c3JfpKX5Z7Bn9ImMql1ao73ewjIfp2plyaxyKTdiowrzaYYvUwDDPSC8vRKFgMWUDbgfqpwayG
	/x3qL9gW6/hlRSObwR3r/i8BUbACu7K4KqA==
X-Received: by 2002:a17:90b:1d44:b0:38f:cab0:9aa9 with SMTP id 98e67ed59e1d1-39b0803b0efmr28973625a91.13.1788789014939;
        Mon, 07 Sep 2026 06:50:14 -0700 (PDT)
X-Received: by 2002:a17:90b:1d44:b0:38f:cab0:9aa9 with SMTP id 98e67ed59e1d1-39b0803b0efmr28973597a91.13.1788789014477;
        Mon, 07 Sep 2026 06:50:14 -0700 (PDT)
Received: from [192.168.31.154] ([49.43.222.50])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432424d27asm37879546c88.2.2026.09.07.06.50.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 06:50:13 -0700 (PDT)
Message-ID: <ed8157d9-d8c7-4bce-a7b7-4e14015b6019@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 19:20:07 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: shikra: Update rpm-stats
 compatible to SoC specific
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Maulik Shah <quic_mkshah@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260713-shikra_stats-v3-0-4be17121729d@oss.qualcomm.com>
 <20260713-shikra_stats-v3-3-4be17121729d@oss.qualcomm.com>
 <apl-vKnwHWFJ8Kru@baldur>
 <73411be1-7b7c-4b06-ad1c-f98af338c5ae@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <73411be1-7b7c-4b06-ad1c-f98af338c5ae@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE1MyBTYWx0ZWRfXzqtGJb7Hvjpj
 dTw+ut7O3uPEen7zzonQqaaaVlZqKJyw6Dmy4aEf+myaaqp44OsrAT9oEDLQrmtrZwTlTfAZKm4
 fV43QPMfQy/pUTDu+Ae6RlcpO6ZrbXmb86WsyqV/jFtFzwQv8Ljo1HRqH7mw9sWld75dH+ifKlA
 w5XEQ8nNMWlsrg27r6FdERp9DveXq7BV0PLkmKMGexVojvXu4cRki1hs5LCZOnhMH/o0eh3vGlu
 6h2NS4bF6N5MAd+Mi3X6X6EOrfFBfrWzxS2KWLIPgx/Qx4SEh8ZqYDHMzY6dK37cKG8qkOSyORb
 l+P5IbCoK4lsFng8VHFErizJyXjrcr2fpJyYaufa6rzbg/4n424idJpUBul7Ig9tGs6xkwcoMNc
 sYYSFJMjf0vq6H3MxzGfQB0Iufke+5dcQolKJgfmd0vd6hyX22l748kA/+mQsBdCFT4q+nQRevc
 9s+vy0pfDGHSkVm05Pg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE1MyBTYWx0ZWRfX8rddCtjxFHWc
 cLSnBjxqqspeCv5RMCqGdqDPAWNMvdIAK8AIaRJps9rv3MapKmGiRIX0EmambOL7hTxbz5COw6s
 tgRNkHhYr1Wt5xQi8nBTezFcIssC8mQ=
X-Proofpoint-ORIG-GUID: 2ejZiF0d_MyTSTq11nkHD1L2OM7MktxS
X-Proofpoint-GUID: 2ejZiF0d_MyTSTq11nkHD1L2OM7MktxS
X-Authority-Analysis: v=2.4 cv=LZYMLDfi c=1 sm=1 tr=0 ts=6a9ec117 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=zqSeLMjUMbmoh9kLUE0R/A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=TbQuDKBBEd7-K4y6meAA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_04,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070153



On 07-09-2026 17:28, Sneh Mankad wrote:
> 
> 
> On 03-09-2026 19:36, Bjorn Andersson wrote:
>> On Mon, Jul 13, 2026 at 01:46:56PM +0530, Sneh Mankad wrote:
>>> A generic "qcom,rpm-stats" compatible only reads stats for SoC level LPM
>>> stats like vmin and vlow.
>>>
>>> Shikra SoC specific compatible allows reading individual subsystem level
>>> LPM stats along with SoC level LPM stats. Change it.
>>>
>>> Keep "qcom,rpm-stats" as fallback compatible.
>>
>> So the fallback compatible works, but the more specific compatible gives
>> you additional stats?
>>
>> If that interpretation is correct then this patch is correct.
>>
>> But then you need to fix the binding.
> 
> I have already raised v4 with the option to keep fallback compatible
> in stats bindings.

Apologies, due to some other issue the send wasn't successful earlier. Have
raised v4 for this series now with the binding update.

Thanks,
Sneh

