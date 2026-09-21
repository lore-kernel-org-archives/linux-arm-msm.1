Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0EA4921A6
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 15:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790004476; cv=none; b=Ind6yszqQnwCtQjySPKUCSzt4IducOh8Xkfusn5tYooHKJwJJ/cS/P0smN9JIYHO2dEKSyGGK55+x/mACJKwx7XaDEXcw6Kt8IiQSCs8CK8uzLC3/D7CsHUQz3ZIg2tFUahirsI9aqYgg10uowLLQZX+RU46HGcMdK2syHVONh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790004476; c=relaxed/simple;
	bh=b/RrYFb52+NN31KVA4CU7JSurMY1CDQm1wHwE+xJGDc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=t2ik2If8Nmo9vwxhMoPc6QQKQRT17oN63oxrRfh7mByV9lHqx470R1hIigj6KqT9GCcx/R+yHxOpJX4wRBEEOmygB28iQEiIn0Nas54Pq4dg/pqh8SH7oUOZNgkN2vEqaFRhenHEAm8fYxZuqmYgfU6PMBLYr7n6uhrf1RWCzvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TtQbCU94; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TJtKv5cf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TtQbCU94";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TJtKv5cf"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LFA4nP2690728
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 15:27:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9T9nmSNz+lGc2TpGZ+uOXDjvim3gmJy7ieWolSYHfGA=; b=TtQbCU940JDHIoya
	0GFpaaLovwxdUWrEikuSgG0/v1VEPivczA0ZXckRwPnjRX/9cGQYM40/1ZbSciqi
	64dxPTkyAlIvx6kMGEu3MPHyjSe1moaSbNozv5ELxM5Sy5iAtBu6j0iVmrk5JjIP
	YdUGkn0HH2IzMtmgj+ql/VltmQ9Sruuggft6/nhd1a/EOUEgO/psA9rA16gqeo9G
	KmdrWIpPIVCfaIfimwLHWGivmnVHR8VczJSEQhn/pHGl69P3VTeW+bn7NkqBZjOF
	Fu2yNzgaPAKJmjA3OO4snwsNouqRHsjFZDLB+2qLQTEJj/Qy2q53KUAbD6UVlnAi
	GZ1hVw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtt3wu41t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 15:27:54 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d02df2bf09so30628545ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 08:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790004473; x=1790609273; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9T9nmSNz+lGc2TpGZ+uOXDjvim3gmJy7ieWolSYHfGA=;
        b=TJtKv5cfzmRlIYeKno+lUM2ZazAH/P6isEkDP0HNiz3Dst2OA7RVbfYbQOeVZrDLmn
         jcsrDPplsF2l2sci0yztsmq/HpH77TxJWa6Jzm1fsMSVgMm68n54wzk1WIlbNxLOhAJs
         +cLlWZUkkW2f3zt1NU5xnzgTkU1r12xDP0kkEprHycovfIlXhw3R01xG8LrzmV2Q+A33
         2gYcXOeb1r0FzPnu1y1v1QvpdvdqZDC/cw2n0rtaUyRF5Zb9RsYUZY/dt9AbAdj05Rcf
         H6+f9kD7BHP7dkIUJVKTS1le7KBcBkNM4DdeP/4ATdZQ0MrXBMR1QGXoyBsy5+wjhE2u
         Bckw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790004473; x=1790609273;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9T9nmSNz+lGc2TpGZ+uOXDjvim3gmJy7ieWolSYHfGA=;
        b=q7YChZHirRu1UZ+0xAfHTTUzvL3PGA+WSv762AunaPaLVriE8O3MDWspGTpjcR6H0q
         UrOGwugPnM4leY4exWIBm9kTKWqWYSP2St+LFDHGlR0wN19jCQbKRoogMok7sQRujrJT
         YfJHe2U2SFj5m2B9Zd5kb9tuR5Dylp/vatTwSJ+Ezsg5JspyUczYkcjkdGOM4bDXe+Jy
         7frLYY52TWp40PO4Cl5urRufSHLLRGddgikPrZ8d2Mp1bTmtQAvSVvE/E0IdbyAxkV8G
         lT09190raTT7biMRbSvfAf+rnmgGsma0aCgeTZ1IACY3ra+yL3JP9+nEbTL6vvqyhoel
         9O1Q==
X-Gm-Message-State: AFuF++ktYdm4IP7I8i76WdO6Jw6gsBLRaIzQiOa1Gl7aCELq33AgW4cb
	KwGRlzInYLDEppPLo831Y4mGf2DWMUZ3oj2wY0MbE0NHieirW/wG1pW/X6aA2NOLyxyq/KOqe4e
	l8JUXQQLVqX9rn3sXdj+1H7I2CD9lQ1iDm2r9QaPyL+q6G4QQqkcHeutuINH4rOWT94tg
X-Gm-Gg: AYBFou3AG0wWlGrAAPK0+kpfSTh6GOuz2orGRglnmGUvL+Q0z2QVqYMXEe5/C203vmL
	N2L5FpU0rfRlgSJRNLTVAdAcEEhgFTzlgeFe1dkxmbBRJsTu0NyyY5c8u7WiL48p4M4+dVEjxQF
	zvE7UE8t60Bg88Ngw2iN7ZuePCTAXzc4pb3bSH4hJs8Ip6VM6lxixDzJabIi2H06HGEYzrmdtyv
	ImnanORfARERpLn2O6oOxAcmAW3gb8P0iNMI+i5bSo6fDpfe1+V1L/SnIWFlBbwrV91l2I5T0RZ
	SU2C9FvGZB3tTc0ygB0fb++GO93iufvRpQtZHy2HjfcDofdeIXDn340Xd5rkF8nzeq6bx/RbAg9
	EXwuQ5uaZvKIvqcdKokfjqrmYfquh6vCgBqBZ5uEsQ8yS/+u/EVxccyI6SUht/4AHSxdJQYVzu7
	lwv+g+PHrVA9KT1A==
X-Received: by 2002:a17:903:4687:b0:2dd:ad73:c983 with SMTP id d9443c01a7336-2ddb1ba30a3mr162452285ad.27.1790004473408;
        Mon, 21 Sep 2026 08:27:53 -0700 (PDT)
X-Received: by 2002:a17:903:4687:b0:2dd:ad73:c983 with SMTP id d9443c01a7336-2ddb1ba30a3mr162451965ad.27.1790004472847;
        Mon, 21 Sep 2026 08:27:52 -0700 (PDT)
Received: from [10.50.54.45] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17888a8sm37128495ad.26.2026.09.21.08.27.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 08:27:52 -0700 (PDT)
Message-ID: <2cfbbff5-fd79-42f1-bd7e-a72067f54fbe@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 20:57:49 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Subject: Re: [PATCH] soc: qcom: qcom_stats: Add support for NSP subsystem
 stats
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Navya Malempati <navya.malempati@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260908-nord_stats-v1-1-a55adb083d65@oss.qualcomm.com>
 <4f518cb0-ed7b-4c2c-9a79-8d1549b26428@oss.qualcomm.com>
 <208b9e11-d36e-4376-9836-ce9ed3c81486@oss.qualcomm.com>
 <e66bb3f1-5dbd-4857-863c-99c22367bfe3@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <e66bb3f1-5dbd-4857-863c-99c22367bfe3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDIyNSBTYWx0ZWRfXzXt01KEzS73c
 FF9EGB/1iZUxi9k60EiQDO+zODxVjERLmgAtjuQXi+rXIZVtpiylfRQWpPT+AX5P+s2z4/uCg4W
 GSRjmC54qgf1gFKTMG9L1ea3mXqTZs/ebb0jlS9cT1/xStBqc2cCqsYIuJ2N2vc/Vqk2vkz+nyr
 s2+d0TZ64VlmdOhX2r8OJiiRYgoUxXJlrsbTciP4102pkNr1QbFqeNY8xKXYtL25FS7U/PtOX+Q
 p7qSJL3qQlPViCidmQwsiKVLtn/STJBfYver1WKRYwaIvGMvVm/3P+dfJwmLXw7NnMAJTkfObQu
 /nIw/kFb075pp/DgDqAyrMkv4cdshed7/Mh7SRn9siD6oxlEHUH/pSw9ABY9oK4BWv99EYb5PVz
 43hTfOPBpp1ShJWRKnw+paf+CNtl2IBC4w0th3rY3Zd68z1Pigb363H6q2MJqgk094JPBk5p4Vu
 jqZP9jQTafFouyxJVqA==
X-Proofpoint-ORIG-GUID: XrkFC4XnmkWpBzOc1hNqjMugpTEV-CUu
X-Proofpoint-GUID: XrkFC4XnmkWpBzOc1hNqjMugpTEV-CUu
X-Authority-Analysis: v=2.4 cv=dakVTnXe c=1 sm=1 tr=0 ts=6ab14cfa cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=STkuWaXuNg38iv387h0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDIyNSBTYWx0ZWRfX66zbcg8A2l2u
 akfARUhBAIU02XtZN9ov5Yi0eq4SOEDlu0OKS56thsrun92/V0R2zPD2n7naeOVEnjYlRaeyrji
 nO3kJzAmMJz2G5/SsgW6+UR+dgmVuFw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210225

On 9/18/2026 2:04 PM, Konrad Dybcio wrote:
> On 9/15/26 6:09 AM, Navya Malempati wrote:
>>
>>
>> On 9/8/2026 3:33 PM, Pankaj Patil wrote:
>>> On 9/8/2026 1:43 PM, Navya Malempati wrote:
>>>> Add SMEM items for four NSP subsystems stats which are present in Nord
>>>> SoC. Rename CDSP stats as CDSP_NSP as both use same PID and SMEM item
>>>> id. Add new entries for NSP1/2/3.
>>>
>>> For other targets as well is the same applicable? NSP and CDSP are interchangeable?
>>>
>> From the stats point of view, they are the same, we used the name NSP in downstream, it looks like Nord SoC remoteproc is using the name CDSP [1]
>>
>> [1] https://lore.kernel.org/linux-arm-msm/20260904081619.593602-2-shengchao.guo@oss.qualcomm.com/
>>

Downstream conventions can't be added upstream, if upstream dt entries
are not named the same way. Please revert this

>>>>
>>>> Signed-off-by: Navya Malempati <navya.malempati@oss.qualcomm.com>
>>>> ---
>>>>   drivers/soc/qcom/qcom_stats.c | 5 ++++-
>>>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/soc/qcom/qcom_stats.c b/drivers/soc/qcom/qcom_stats.c
>>>> index 06923408bfce..91f2d1293124 100644
>>>> --- a/drivers/soc/qcom/qcom_stats.c
>>>> +++ b/drivers/soc/qcom/qcom_stats.c
>>>> @@ -43,8 +43,11 @@ static const struct subsystem_data subsystems[] = {
>>>>       { "modem", 605, 1 },
>>>>       { "wpss", 605, 13 },
>>>>       { "adsp", 606, 2 },
>>>> -    { "cdsp", 607, 5 },
>>>> +    { "cdsp_nsp", 607, 5 },
>>>>       { "cdsp1", 607, 12 },
>>>
>>> Is cdsp1 not the same as nsp1?
>>
>> No, cdsp1 is not the same as nsp1.

Please explain if the dt entries are named as remoteproc_cdspx then what
does cdsp_nspx correspond to? Subsystems are common across all soc's

> 
> It would make sense to explain the difference here!
> 
> Konrad

