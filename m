Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A40B493639
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 16:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787329779; cv=none; b=N58HJqCfG1X9od3vCFkQUVk5QIwCG+fgihVLDhpDCDLzfegjLTY0+SXZ21ss3V5yR4Gp/jn6vNG8jCp5Fqyngo1fX0OJjgUtLFioES2IUlEW42bBWdyQFmpxig2PNITuoTaTbdUxZrDP/to2XrE5RptDSzKKjbM82Mct4KOXw/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787329779; c=relaxed/simple;
	bh=vXZYcqQZ9G9e42lPAVUa4zO9S++Ew89E3Yen0oSCoIs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FW04/jrk/idQaAKrxbwVcwZk6Rcqn1T++XyYmBIV+CilTCrFUT9pEDjRGWYtHBvEOS00UCbmpp257IEFRpWxdXrIzACd3nI1d2CG4yD1WYfTtxzuvUl6KsQ7NxHm1DVCMhda5ydI+i7NGgl6npbZYjMVI5MJYFMZKTnYcwZy+AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DnVFdtSW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jEfW0KoR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DnVFdtSW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jEfW0KoR"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67LFmBFO2832761
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 16:29:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DFhFJP/IVjFFdhwkyRYn3nHcZ9DDbQ4DU++GQypzBxc=; b=DnVFdtSWrIC5Rfut
	N+aZ9krtfc7J5XCZZThi1NTJzZ04Q6hGJWFZSgAhV2EBfJGJY49ptTfOEnwc5ifi
	OQiTqMc/FdaHgScsptGPd2oHTVcgIKmmRWYBnw8QcEmycGSQ0EB6rOLb4vIHvTgx
	E9R1metkVKVlDDZ7/o44EiNi1nFGpf1rrvXOdYe30yqUQKordhGNOhj8O1h1XZ6C
	REiaXEKL28pCk7fmy3R9gHCT55Yv+Gz3/pJYnESWnKQW5PMBoy71IST/8rXLmo0o
	vpgBDmbmAhTeaLsent2m9+yOJT+UzEG6WB4obSQchFFgoTxjpkEpJEz+LB6h9R/f
	gvX3sQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6cdsk87g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 16:29:37 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bf321d786so11185811cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 09:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787329776; x=1787934576; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DFhFJP/IVjFFdhwkyRYn3nHcZ9DDbQ4DU++GQypzBxc=;
        b=jEfW0KoRftKx6GZI3xWFHAHG1dQS51bR8NtXK6fM4DAlx7HdC4oOoNWKcUuA1fRdPt
         50OZ8WxiQ3xlGvUqVMwgc1ZKIlarOCS3ucfX3nC6AZqQ48OehGCg2+S8iOc1lgRZNTtP
         zaacijHyQ0V1UpJsz2acv8hg8itfyswhWq2LNRmUGB3ul5yR6ZQkAhe3Xs1orj29rxVn
         bCB4CteP75P1Fu1l9YA+Jqrjns1NqwhoIrA3TcdUOyNmgmGsLtUiDWmyz/QTREhGOgUE
         1xqVTkHCNqL1361nCxYwJ0pe9x2/SkVFXvC9p2WZN2LeTslAgfv5YCSN6dsiseG0uN60
         7VMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787329776; x=1787934576;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DFhFJP/IVjFFdhwkyRYn3nHcZ9DDbQ4DU++GQypzBxc=;
        b=MYqhX2Z5DvzHafsYNHugFtGbzVUEeh8tvZDDA7qU6tRvS9feToOKtVciFTJi9JiUiU
         sUUXqLl7p1SObb3S+dDeN/cxOkjk5E/l20jKjbxeZicsseDc+X51BvFNRFCC7ASSsCXI
         c5NL7oDEzwd5TrTH7BL6YKnoHgjCwW5N6XoitkYe6BN0LJyKYWno9X47P8b7Ztk/8Fsx
         X3B83AaTJD55vjbynH6SvRNZc1sCu1GUV0DW0GFCPmriqfmHk1wqUZvaGQqc92GVUn7E
         LPlz1NUSJ232lHt0JGz0BxgqELjFD1ZY/pAcEcgSf9fqw5yfPIJKrzdKJoWkV+I2nauz
         uESQ==
X-Forwarded-Encrypted: i=1; AHgh+RoVSyviF1a7lfMT67Mdm3L/oRONBL6tYcEevg8lcHRr6v3gNFz8wcOl1QpDDCO8ZwtUUsogGy9om3QtVA0P@vger.kernel.org
X-Gm-Message-State: AOJu0Yw47nmXBgHoMgXbq9BGVyt22HWQ8KzWNV1IIbaQqpLiypVr+Lf4
	5yt3haoNvwIVUuk5GbNlfIm5Qw0A++cTXi2sc/FGxvWY7unwM8SWCNmz6gfj5h/my715hISO+Tf
	VmwVScmVxBqWn00fvzA5VrYIHx2W2Jby7zQLclzulrI3bVw2UEPepCL1ptRNeH9WIa7wx
X-Gm-Gg: AR+sD12+c9TDevuVgtgqEVSqyUHSnB2DppP4DeiOAIdW3uqJ5CnywYFmqzcdMlVqwfl
	lCI59bq11AzBSvG9YWlAZfg5rvm0SShjw53S6CrFPixm4XiwvnX6EuOjmkRghzjtkbuYv0QhXu4
	1IIw0vaddLA4O4v+5WUsRIalkOJ6vEhEBjtc0+QJa14TD75An38zARiRyrKdPv8wk9gmB6uLIyZ
	m+rj9e6WsX8uh8Th6m+UAcDHiQkKrZKq4OmFeqiKiu0xZXdurtGGAnrcz25xTdBZ+rL+SlHasfL
	/3ExpwrI3+aQ+FeGso+TIBrsAZAYewDlw9X0MqKKjd/akMi9sy/30Qi8/TSREtB+vElc6MkN7Bv
	MV09zkeQCvnzEQNeDpmHlIUfYe9HRU84m
X-Received: by 2002:ac8:5805:0:b0:52d:9c92:d558 with SMTP id d75a77b69052e-52df5a07540mr72188521cf.23.1787329776274;
        Fri, 21 Aug 2026 09:29:36 -0700 (PDT)
X-Received: by 2002:ac8:5805:0:b0:52d:9c92:d558 with SMTP id d75a77b69052e-52df5a07540mr72188021cf.23.1787329775827;
        Fri, 21 Aug 2026 09:29:35 -0700 (PDT)
Received: from [192.168.1.2] ([122.171.20.211])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c5eec1f31sm66561536d6.13.2026.08.21.09.29.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2026 09:29:35 -0700 (PDT)
Message-ID: <3f92d72a-9f3e-4149-b37b-e138bdd86050@oss.qualcomm.com>
Date: Fri, 21 Aug 2026 21:59:24 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/15] dt-bindings: interconnect: Add Qualcomm Kuno NoC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
 <20260814-kuno-soc-support-v2-6-3079794f0f73@oss.qualcomm.com>
 <20260817-benevolent-nyala-from-valhalla-46cbbc@quoll>
Content-Language: en-US
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
In-Reply-To: <20260817-benevolent-nyala-from-valhalla-46cbbc@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Les1gy5VVQi_EvskiDG85SiMp4tGt4Y3
X-Proofpoint-GUID: Les1gy5VVQi_EvskiDG85SiMp4tGt4Y3
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDEyOSBTYWx0ZWRfX8K0h2g18Ryzv
 inMEct7a0BUfVDKzUwOaSIOJipKPck5lYjDXc/BuvetOIS9xg/ETDljpxWwApSQHhSgaP1eM3d9
 gF6ZBNuNSuAC2u9834MKRLeMea6f0FU=
X-Authority-Analysis: v=2.4 cv=RN2D2Yi+ c=1 sm=1 tr=0 ts=6a887cf1 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=+KmVXPE0btiop/5qwQKk0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=acOcqc2iJ3WRxsWVYcEA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDEyOSBTYWx0ZWRfX1gJ334uDs1AB
 IyKlSd7UM48yyBRQ3jyZsSOzHOA9DTeYc4MoGi9TnBHdh6VQh1L3j5IBHBX4/DwhXS7or8XMcFU
 cjxEltjKwm4FSv1zLIkX5rCt7aZidfieWUwvqVH5lCpvHlHhs1R3qvQJG+YZiqaws2KHQMGcdDK
 Pq629KpIkp/y1mbO1Muz3Ndi0QRhzGK9SfpmyKv50pEj8aoNsSq2eiJdzib5te9rfMcf79drjzD
 8GJMzE9c0Bpe9kpnuLMNmWeKNNE80QXO92gFANuA3WJhD/i07gb0mXMgC3LYNTHV20QDwyQngWo
 fz1a+MSHbgCUd3wiIR5cB5HWVKZ1LO2qknrujHNbBjtEg+MgX8euVUhPodc0GU2XsjkvBabWLEW
 oB13mlct7SJBBZ5x3JI5QuEaGEC4ebBHdejd8/vvuYvqO2WKMjbFnxEwT/8JP0l5BH9PC7SKQB2
 P4Iw2WX6IwRdDiuw33A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_05,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210129


On 8/17/2026 12:58 PM, Krzysztof Kozlowski wrote:
> On Fri, Aug 14, 2026 at 01:01:37PM +0530, Hardeep Sharma wrote:
>> Document the RPMh-based Network-on-Chip interconnect providers and
>> associated node-ID definitions for the Qualcomm Kuno SoC.
>>
>> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
>> ---
>>   .../bindings/interconnect/qcom,kuno-rpmh.yaml      | 82 ++++++++++++++++++++
>>   include/dt-bindings/interconnect/qcom,kuno.h       | 89 ++++++++++++++++++++++
>>   2 files changed, 171 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/interconnect/qcom,kuno-rpmh.yaml b/Documentation/devicetree/bindings/interconnect/qcom,kuno-rpmh.yaml
>> new file mode 100644
>> index 000000000000..ffbf14356f12
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/interconnect/qcom,kuno-rpmh.yaml
>> @@ -0,0 +1,82 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/interconnect/qcom,kuno-rpmh.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm RPMh Network-On-Chip Interconnect on Kuno SoC
>> +
>> +maintainers:
>> +  - Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
>> +
>> +description: |
>> +  RPMh interconnect providers support system bandwidth requirements through
>> +  RPMh hardware accelerators known as Bus Clock Manager (BCM). The provider is
>> +  able to communicate with the BCM through the Resource State Coordinator (RSC)
>> +  associated with each execution environment. Provider nodes must point to at
>> +  least one RPMh device child node pertaining to their RSC and each provider
>> +  can map to multiple RPMh resources.
>> +
>> +  See also: include/dt-bindings/interconnect/qcom,kuno.h
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,kuno-aggre-noc
>> +      - qcom,kuno-clk-virt
>> +      - qcom,kuno-cnoc-main
>> +      - qcom,kuno-dc-noc
>> +      - qcom,kuno-mc-virt
>> +      - qcom,kuno-mem-noc
>> +      - qcom,kuno-pcie-anoc
>> +      - qcom,kuno-system-noc
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    minItems: 1
>> +    maxItems: 4
>> +
>> +  clock-names:
>> +    minItems: 1
>> +    maxItems: 4
> Why are these flexible?
>
> Look at other bindings how this is done.
>
> Best regards,
> Krzysztof

Thanks for review.

You're right.

In v3 I've made the clocks fixed per compatible rather than a flexible 
range, following the sdx75/glymur interconnect bindings.

v3 : 
https://lore.kernel.org/all/20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com/

Best Wishes

Hardeep Sharma

