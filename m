Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A7C48820B
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Oct 2026 13:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790946218; cv=none; b=SQL1gAeFta0kIKrL/TRUmZkXfJSsizAj9iaOuvlfbHWjL89HN4P9W3oGq8k5wanu7JTOg2+fsGbrHL0fwITdp/RvtgNLsTu+736kNboX2dpWfmOmPk4QD+0tHw9AM7Jbsrp8dvtuG6TLKm/hYW5+USGQXsxlTd6lWlVJrPvO/pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790946218; c=relaxed/simple;
	bh=b+ZrbszRlr9tKDb3C0bvlN7LI2Y6k08QRyYRWjJKahE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KUD5dde2/3xyuIgtgS9rr6Bs13h3iMxpwJ2VsEer4SVaptLIru/c6GefH3Z0ySygDaz07lsRBTMrt2a0AUK0Z56aCAES9Zox9c1fLdtnQWLNAP29wNwmsC9qrVGnVZUPQbHSp6vFGOd1GSbD7WGs9QYlnIBfypejiYakj4Lafwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eGX981xa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W9/fdkCA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eGX981xa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W9/fdkCA"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6929naK8960661
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 Oct 2026 13:03:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6z5IuxgZF+4qKvUvtMUrTZperd+qzTCulZgwTnrNmnI=; b=eGX981xa8ZqWDeFI
	gQfPrPzvO4ore6ZoNNVAKhkn5z+eMUGja22OrluJxt+SmqOP9Ha+Z7Z3ytgOW33j
	9x9xe83J7RKEBh3PpVoo3b/zeg6WL17WhVrZ8daJ2ZxenwvzASAxb3uqqijdVj5+
	LQM63y6IpdH+aOSV1UuF7dlKCTvGOlwRYVeAdc3jEGr2VYO3hDyCy9ck6OncZxd0
	mowN20rep8hkGWmAWZ1LhP+pgjgzkpyVwNU1oDjpV2BdeuCyhXSNokvX5NEQh7Hn
	n5a9XEz3uzUskjczJcMDXLcnqnu6YumVO2LrFyt5vMbrRSrxsmTZRlst9gij7PH4
	AujSSg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1sdcmh1p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 13:03:31 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so15512028a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 06:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790946210; x=1791551010; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6z5IuxgZF+4qKvUvtMUrTZperd+qzTCulZgwTnrNmnI=;
        b=W9/fdkCAtTTfH04z5oCjwUEi6tHWC2xw8IB7Nx3uLTJyI2S+PbOJBPgLRi+rHaoWKU
         pqF2dyBAO4eVo7QKodsSdY+HQPYZTD2P0yDcVzIRIroaFRN9t6K/Co9ZNamZ+/xXzGiX
         be3dFsrERsBlrz2rhhT/vn3hfUYlaT4zgczoB2AHRPFGRc9HdzTvXShv4TJxegSrYk4D
         hgVZK5O2M0+JGbG67pNxx4q9r+mzuDzNx8TfehJkQUd3Lk5gNMU4wX3XZZuisDhjn7M8
         8h7nR2e5fChvwrlmUMBxoCss1J8lXUdvBpwkJgYGAod13TPUBzAkJt4t/p0wVCsD9q2o
         ncEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790946210; x=1791551010;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6z5IuxgZF+4qKvUvtMUrTZperd+qzTCulZgwTnrNmnI=;
        b=HcO04InAf/7Qrhvpmk//WGFfwQ5hZ07fWAOMuRCJCXaFrUACVb/5oABRWpVXI6NB57
         vClisILbp6nIdZ4y0BnQ/jP/PrnIjg1w9oKhs61RgSEKl7ZkKaIxnDoAGRBGeqxuXdAU
         /YokO/mRQq5enLfGFiIUMrJe+UKnH9wH6meIvXqyC4RBgnWXUyZpOAsMbvt9Q2Nnr6cY
         nV2ygV6VE7sC/k6WN+VS2zqH8dJqIboVdh2nyxyKsIY0ug7G8BJFjq2iBmfUthAmdoZs
         aawNLeHC5X/hIX32G6wXjl6hioQuTZfNBtcsadmtc4/0MysCEcXiPeOFl5U7jOvAOBNy
         im+w==
X-Forwarded-Encrypted: i=1; AKwUvBxvlM9gxYbJnF8MbGNKE1uy9I9FRv53Py3dhpXjgitv2HWmzm373Wv/I/13fcN9hTdAg45LEmj+2+oQT1rw@vger.kernel.org
X-Gm-Message-State: AFq9FYJp9FTk2kUs3isCcsqohp0ZfA+yqx3eR8T/JBOyvYFu3ChV7vrU
	x+/H4QqQbnGRVvcW49nMiXVmVQc3uV2dHBpN2p3J2GRu3rcVorL/Lc9KB/+17z2TqPPE/KoIoTT
	cAQCLnAn0ej5mGK0BcsaBVZJWeFZoZoBAu+H8JyWCOzqVjSMTfFZV7Tw7Jw2FMjy/jmrt
X-Gm-Gg: AYBFou0XpIy6vZZp6A4UTYMMDEPBnCmclxECZ6PbdUMa8HnUQoVUyEgCcPZQQSv6xiV
	Pgcde0dvYScoapmLO6GxnvKEy66GRVvCewHb5JCC1/nXi98J46lxWNg5aCagDrjYtCa6zw8jkgy
	JtYyI1AV+Qj5zgW+zCl9TVP7Yxjy0ke8oNPT2JbcSKJMAuMT3Pks58tNQqwpGtReGfXaKWZO9f5
	eapQbB0ZPAuEUYLUtkPxeYxrHm4P39yAnK8tvcNui32LYIF7wpA6GSLBuSd1lOF7Z5oTzE4USun
	phAxQ5qhxwjaupBmb3iBAYAKgN91h3SdinOQHBLVk3RNcr45O2c698yz/c5FmW+Qi2qadoiqsLR
	grATwlbR2voiPJLLRRjpcx5yvZasw+HANoMNurDeIs+c=
X-Received: by 2002:a17:90b:58c5:b0:39e:6c6a:657f with SMTP id 98e67ed59e1d1-3a6ceec796bmr2429027a91.66.1790946210444;
        Fri, 02 Oct 2026 06:03:30 -0700 (PDT)
X-Received: by 2002:a17:90b:58c5:b0:39e:6c6a:657f with SMTP id 98e67ed59e1d1-3a6ceec796bmr2428878a91.66.1790946208517;
        Fri, 02 Oct 2026 06:03:28 -0700 (PDT)
Received: from [192.168.1.5] ([122.164.87.104])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6dd3962f0sm1302687a91.3.2026.10.02.06.03.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 06:03:27 -0700 (PDT)
Message-ID: <9d024cf5-1a5f-4cdb-9ebb-1c3d7c6eb049@oss.qualcomm.com>
Date: Fri, 2 Oct 2026 18:33:21 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: sram: Document IMEM found in Qualcomm's
 IPQ9574 and IPQ5332
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20261001-imem_restart_reason-v1-0-79f516906010@oss.qualcomm.com>
 <20261001-imem_restart_reason-v1-1-79f516906010@oss.qualcomm.com>
 <20261002-expensive-boisterous-nyala-4d8bad@quoll>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20261002-expensive-boisterous-nyala-4d8bad@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: h-2nvh48Zn2-MrgWUHs7wA6daQ7iM2rP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA1MSBTYWx0ZWRfXwxOsnoPjDZsr
 C+uSbcjAIRJpsWQnJkjx0djnBa1NeWIHNk3sIrNNk+RPq4J3TTZjsT3UeFf0n5XSNBjB7BehMLq
 k9AwkSYs9r4Z76cGYFM9noRF4LBC9oc=
X-Proofpoint-GUID: h-2nvh48Zn2-MrgWUHs7wA6daQ7iM2rP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA1MSBTYWx0ZWRfX3LRmiRqzJ059
 rhElYj+qw9E50BJtJRheg9+f3fz8El6lvZpGMB9JV3e3fnNOb3lHgwVgsfEeZUO547l0wBDwIk0
 rLav55U8toRumxLuuN5rtJ/b8EokbrhOr1Yf/gSbh1yDtk4H8NcHmbbUrbsL4N59ukoDxD1DiaL
 on0WUFW/FBqGHbArXQPHNxxRbB/Tl2/4KmD5C4PoFUjWMjgshzSiHlb9Rvdy1GRTQ4NnXWPb7vC
 bonWBvmUztIm3jPstqrS8aZdO2+PPPhmrSjh15JEDq0sndMg19OOlsPo6FKSriv1RXuuopa+LdD
 Pk64XXVbNN1+yrh84JKBMyQAOmPLvn0fgs2RJZKAFFGNQjJ8VaCEH7SRV8/VU/EnM9trKanFJ0z
 E4jmIt221a3tkZtrxVathBjuwIPb4Ate39MROHRFT+yQ+WSQKLnXMocQVP7wG3kNSuw+wryKTQk
 /Lj8+klSrlePQjRJldg==
X-Authority-Analysis: v=2.4 cv=D87SufRj c=1 sm=1 tr=0 ts=6abfaba3 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=h//ISAYwLoXuQW9fHTCWYA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=PDAiVhL2AEIrZ4fXd3IA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_03,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 adultscore=0 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610020051


On 10/2/2026 3:11 PM, Krzysztof Kozlowski wrote:
> On Thu, Oct 01, 2026 at 08:41:11PM +0530, Kathiravan Thirumoorthy wrote:
>> Document the compatibles for the IMEM found in the Qualcomm's IPQ9574
>> and IPQ5332 SoCs.
>>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/sram/sram.yaml | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documentation/devicetree/bindings/sram/sram.yaml
>> index 6ee0b1464722..d65696885e6a 100644
>> --- a/Documentation/devicetree/bindings/sram/sram.yaml
>> +++ b/Documentation/devicetree/bindings/sram/sram.yaml
>> @@ -37,6 +37,8 @@ properties:
>>           - qcom,eliza-imem
>>           - qcom,glymur-imem
>>           - qcom,hawi-imem
>> +        - qcom,ipq9574-imem
> Why reversed order?

My bad! Fixed it in v2.

>
>> +        - qcom,ipq5332-imem
> Best regards,
> Krzysztof
>
