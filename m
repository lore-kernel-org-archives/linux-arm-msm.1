Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7336366816
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 10:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784717822; cv=none; b=gdwsm0Tot/QpzQ++4wS3r49tYmUD2hX1lBrH5fmeB68mKnQ9zbUPBBX6muoYTvb3mwX0dhDjv0cXHGxHn1nnEsuMc8FSTCMi1E/K4OtgnSBgxeRcBHuQQqowmRdwt8ixjloeyx61O2nx+Hhr8jHs+hYgAG7nljsRCTXRuSzZGp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784717822; c=relaxed/simple;
	bh=HtBdW0k8163Z4bkF29Rb4GalgJUOap0bamAwc2qnmJQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mXgeIxJY9hie0Ra27X0CfORDyzkRhMnT17553sNGWuDgdGtak0+LQyK9G7aYgRrsN4XSoLqyHJXThFIGVxrUlW5DPlYgFkq2thfSNu2DNc+c7pCGf4RHQRqwlTZ54mcS/1LWuM/5CUTUycKbv0M6wlnBDD6jrRbwCQJQuqE98B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M5kizwTR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z3qX3gFT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M5kizwTR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z3qX3gFT"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M8x1Lv523794
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 10:56:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dn3Lp5g9fW+vOk8zds/Q5HKJwSHde/ykKUM3UgQO2/Q=; b=M5kizwTRKlP0HEaA
	vA5DdiU2TZqxaIj0ot5NdxHfHSItIYI2b3RPc10+STyr5HiUGHyaZB5qm5PWzTbG
	EMdBY7oiA8RtRJJAJ69nTGq5ftBWhd4j91Wp9ouKu9MeWoNtq2kWZqvBcvV6IsaF
	HzLCsov3iWnckNK6uN9y9P3+DO9m8hgrLicus93hakByASTlytmltxaBmSasgZ/O
	N4r+lbz4xa3tCBSRm3AK0Ha6zWjWxjTiDH53bjEdfkPrBzMfUM6+wt3Il2S15tpd
	fzzl26FhI6/OQfBvE87k3MlhAv1WyJX0UmU1hDmSUXp/wwR6NyRhl+wiOUvKreCI
	o5tG+w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjrtt11ce-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 10:56:57 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ce7dfd33ffso155766445ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 03:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784717816; x=1785322616; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dn3Lp5g9fW+vOk8zds/Q5HKJwSHde/ykKUM3UgQO2/Q=;
        b=Z3qX3gFT+uVV6z/jfI63F4QV9KZf35SzUkZzQGjUNHcMJCeOIjXwcXdhr0jHVQjUve
         SpuNiulZ8hmi3hohr72f7F+xF01NDGYAU7EEc+UWz/0KvYdvy9lID4JK4fSXm8svZUjP
         A0lKVvHu4eskpgXKzNR6NAU9Kz8mMT/aySm+rsllRqkEvSk1gyNqxDu75ZCFq5RjIYA/
         a1ESS+GFIl/DiHHbBFtAqVGThlpg/RE254MaHTMXINLAGy0/vjKX2v18oon+P9C7zrno
         KyN7YCS+wgFzv+pWWT+3AX+7HPT3bwbIyiyTqqhF2oTa590eDB7bnU7P4lAd7gv7tx6c
         SJNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784717816; x=1785322616;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dn3Lp5g9fW+vOk8zds/Q5HKJwSHde/ykKUM3UgQO2/Q=;
        b=m05fDX+Zt7t3y9EophJB6Fo3/4WY8pEV4u22feA9uqVKwDP0hs3URP+g1aGJwYy/qp
         jwrge+hqsaAe6DiTgCmZf6PD4iuDeNKVumIzXpR45aooCN3idQ1ya3xusO3/uCrdwqao
         MejUNwbcIxjmzkEtW4ppFQjYfLsamCHcGRUPAwMqanml4ucZKf6DKxWUTtk0H+gcbI03
         pFMUlp4m4GgaQZRbtxnQLQnGlfN/abr9Caggn1ieX10Py7y9N7DE/bMcEc7UkCXbdWG7
         cdm1IcrWagq41g+yhpw9kDPTdBJael7FP3RqGwG9mZvclBJrJ4c/y0hjfTn6aa2Y0baE
         9fbA==
X-Forwarded-Encrypted: i=1; AHgh+Rpj4hgk5xuC2rSlnsbT0zqhj4lO7YmsUAW2bHb9xY+K0yn/z9EVCF5pZLG4nzxt2EgO8wRJngF3DrpKW6+S@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf4B8Oud0CUS738vlVyUpUvRQ85rKMed0AG+FoyUcYjMy4t3wE
	5S+Rg8L3j7engcLb0GCZ1xvtg9iWqlgJx/EsbUKVQg0eQRlqUdncIgDgqklM5pU7W5gOgrwCJTh
	Rvhrvx8RmPbulFo7lLRSdONkUO2uSl9YXmFgCkYs8LHXs4FDO3WV+kFwFfJCTAw5sILeU
X-Gm-Gg: AR+sD10ledJ573/Ows7e6GRNtbSVLRIEmM0doV9llTTccpQtrenvVrU8Oe4qIbJzEUZ
	wEvpSw8gWs6tObULsHidClB+ocxT8LTWHfKuf/8QO/WMRd7ohFiiAFbJEt+cQXExnNEySBHkdDx
	zifnNdZJwRLHjrTiF8k2BBTvHsdCHZTG8/CB47na5m0ZsMmR0clFrliW/HJz1R5+naZue663Lhg
	68zA9WPycUq5VSscr9ANCXYsOVtBEcHnbegCUfgIVL8n4R3rfGomg1nDO2xKTGxfdjH2z9Luk9R
	e/yuSVmcjyRwUd0w39anRVSFuj+AxqyYTE14iwC0Vxlvrf2styLoqvDLXQ3QCIE2JjxIhNHk0+m
	HYTQ6I7rb0rELTZEmQ0gabmB8ZhVhhPDUGO0ZuiR1HZ2n9XxHFo3yUFw/9IXXRUjQ7A==
X-Received: by 2002:a17:902:f705:b0:2ca:304:f93e with SMTP id d9443c01a7336-2cf3495db8cmr244223055ad.22.1784717816408;
        Wed, 22 Jul 2026 03:56:56 -0700 (PDT)
X-Received: by 2002:a17:902:f705:b0:2ca:304:f93e with SMTP id d9443c01a7336-2cf3495db8cmr244222705ad.22.1784717815982;
        Wed, 22 Jul 2026 03:56:55 -0700 (PDT)
Received: from [10.133.33.177] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f2e65e6sm12700925ad.38.2026.07.22.03.56.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 03:56:55 -0700 (PDT)
Message-ID: <f958ce71-c8bf-4062-a814-aae3df80bcf8@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 18:56:47 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: coresight-ctcu: document CTCU
 device for shikra
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20260722-add-coresight-nodes-for-shikra-v3-0-1400a3454e9f@oss.qualcomm.com>
 <20260722-add-coresight-nodes-for-shikra-v3-1-1400a3454e9f@oss.qualcomm.com>
 <20260722-astonishing-loud-labradoodle-bb59ce@quoll>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260722-astonishing-loud-labradoodle-bb59ce@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: HPUqc_ouseksK-icdjBj6MbAsizH09vl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEwNiBTYWx0ZWRfX5r5DN2ksLJv2
 wGMYcUTtbuuA1AvIqoB3mESsq8CHcrTcnI1R3zrrKj0+/GsoNNTx3Ead0abGULK7oSsqnI2CvHw
 OUY/A9O9jlNG90UXaTGDQSIqnl4Q2YRBhjvtTQdDf61xSMZLX2aCmBqQtySpXTLRYfoIeA9V1wK
 0FqPoT4wZrNVWLk0rsmY1o4RrTxzWTrvOIVJ/t1v+ixQPFiQB3L5ty1MTHZ5lMnqbVr9x351PJ8
 q9az7lxjB62pXmK627yEcDY+SfZZvN50tH14f8O30wbc8KYboAqFohQ/kN/RY7TgDV1f4OS9VAf
 sinNtxdTieFnPdePQ3D/aswvA7lXarrhXW2/GdWAZMiLtapH6YGzSoqsWdev7f4QrBzLBQbOjcI
 NpBZUnUAPGC87wGaTxIUEgJythgTi20q/SXV8i0AdMzR6uqB6zQ7kicmJGMubiL4RzJ3E1jSSXR
 Gh3xznmoKJ4T+p5FNww==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEwNiBTYWx0ZWRfX4WCpBWvHC7iI
 HLGwkdK66qn7X6t7MM2bkb7R818JAHHPgpJCDcQ+tzG8CWI14TaiOiYKFy4fLqIqLmZhXawBmIA
 Disd+uH+k1cnUspB5RPBEBn+UgOFbgE=
X-Proofpoint-GUID: HPUqc_ouseksK-icdjBj6MbAsizH09vl
X-Authority-Analysis: v=2.4 cv=V8lNF+ni c=1 sm=1 tr=0 ts=6a60a1f9 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=PwRE6yEF67RGCJE-Z6kA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220106



On 7/22/2026 4:15 PM, Krzysztof Kozlowski wrote:
> On Wed, Jul 22, 2026 at 09:13:47AM +0800, Jie Gan wrote:
>> The CTCU device for shikra shares the same configurations as SA8775p.
>> Add a fallback to enable the CTCU for shikra to utilize the compatible
>> of the SA8775p.
>>
> 
> This is not arm,coresight-ctcu. This is qcom,coresight-ctcu, so the
> subject is:
> dt-bindings: arm: qcom,coresight-ctcu: add Shikra
> 
> I already pointed out this problem at v2. Nothing in your subject is
> telling this is Qualcomm! Not even mentioning such trivial mistakes as
> lowercase shikra everywhere.
> 
> I also do not understand why you add so much redundant information to
> subject. Subject space is precious.
> 
> No, at this point you should not make such mistakes.
> 
> Please take this feedback to your entire team, so I will not have to
> repeat the same exactly next time.

Thanks for comments. Will take care of it in future.

Jie

> 
> Best regards,
> Krzysztof
> 

