Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795502719;
	b=0zbC8LyxpcLSeBy8lj+rHW+qr8kujAzlfAcWrB1Rdykym+Ae4abnjKiMCA9A4OnfUmao
	 kt7Q7iUkHTfVUh5Hc5334S/mrjL1yaWsZjxMR4c/upkynLfwl34GqVyyVNe1fW8UioT2P
	 x82VvaKyLus6AXawhX3YsVQgWyKpOZGWnKstIZyfib1Of9orCpjsIhMhyEeOmZoea+n+b
	 GTKqRTaeNs2arFrixdWrLZpdlDIv9s4cWjUey+5oky3BamiQhPZrwWoA6oJM3cky9oOX/
	 VROrVhKK8d78i5Gs+G8fr+kzWZnJckEPuhnNW7amwYpjRIj3bWfRFdxguqR6fOO4AzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795502719;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=QxQZFmB27u19xPJOcDby+VahrpbkBndJt0jS714G38Y=;
	b=4w4bT9h0JCDsiBykJPS4Z3ui461bUGfQPLIjiX3awckMXZXw31gKEOBayH/sbqPWUBFf
	 v0S4k2QP2NXxRksk0pwDqa3anD80Q4GVwEsynxwncxOYOFjnLDQ6DPVsMDnWwtS/qsUOV
	 VLkLaiooUciZt4Q1mfD7UQVOREec00HVEER+fB42w4ZtebrOI4lwWUq+Gz3cxs1oRD6KM
	 nst/09Quv0gv8yKJ9SSIELJreRpclOemzqjNXeI98kj6iZLqRHX6lgB+HcSl2NNxlQfh7
	 gHuVeXteESpn+Bk67xFX/K/uMKm1rWfygYttW3AeBlJaHk7uHUBbRVpT2H9DHw2ViIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=glC+5utF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ahpOhUkg;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124E0606A31E
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 06:45:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 124E0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=glC+5utF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ahpOhUkg
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO2kBSr196998
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 06:45:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QxQZFmB27u19xPJOcDby+VahrpbkBndJt0jS714G38Y=; b=glC+5utFAAfP+RiH
	DqtqWwtiNMh0XxyGNuGdb9poiIxWUwQTH+mMkphnJKng9J3veaMo8Bi0zizzIxZG
	HhL1mG4O/82k0g9KYmyq/Ra29pgDpQwHMQQzD0Z3pP2+OCdgHgqfsD+0QfXZuUEh
	SMUwK/QyOTeCQLE94KPParUWrG395cbGMYAt0Abbz17350nXyOTW94m+iUKLJ9Ma
	YWyN7nabhVBcmb60aBlfyOUVYVhDRRz+m3Bz8PEPdZowGfmVa/qUhVZnifLum5F8
	scTNtBCrKPMIVtdjcFoND/Mz6rTlcdmp4bhTYoBXtgp56grDjZ/vf74a26vQmktT
	KBucQQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukra766-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 06:45:18 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3869db50548so254766eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 22:45:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795502718; x=1796107518; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QxQZFmB27u19xPJOcDby+VahrpbkBndJt0jS714G38Y=;
        b=ahpOhUkgsAXgANO/y5ETvwq2oIJMofrRw4pQ0H9mwpHturwDxledObxv4TtmNlIIBN
         Q9eiYsZSxGwr65yq9X+PaI+4Dq2pTEZFuNhvqlWwZH6Y3qElFt+6vnr5vYqm1mfQVN45
         WA9ZYPgHKc7TAuQxrnSGntFwJHihlV1eOk0SJJm9ZtwSHsQTu6q3QInGcPLcNUgkIT6N
         sKxrorYn6K8+6nVqHvePaYrm9zJYnUQG1BkmydyIthzC+Oxt8+3jpQJCbOxggkaRuucx
         IXc0aqRq/bbDQ0vr2RqBUIbJ6Zj4e0xIAZrc7ASI9WQIFQqBW+ePWA0f4ok7mBr1UaeJ
         7+Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795502718; x=1796107518;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QxQZFmB27u19xPJOcDby+VahrpbkBndJt0jS714G38Y=;
        b=r3EbdFEttCjC4qB/4Lj+8vs5YKHUM826eVvZiawlhwhHTDP0BF6pl/DKGLzPoMe5VT
         3pLlzfMFAhb+nDQp55XfgIRtNOgyNKB7J1hQYmgnoZFR3Xx6qIkfnzZKXeffgH9cTZSV
         pGUwDdztaAg5QftRvGeZYHeCGAioeKGnA4K+NUoFYTVKJvxF4ZvbRWsfnn/fLfS3v5qY
         8i6k2sqcziYrW47HG14irX7AmmDf30qflWjFYEtusEKLfcQItaaL4KfjC7Zk4ewwGJxe
         rd/xIVOpf4GR9MM2lFAgT8yj3sXcFwuEi+RMrmzYUX7Vp7YHhY88BieRJ3C0T7grV0ve
         VpGA==
X-Forwarded-Encrypted: i=1; AL+hErFipiIm5fSFJePgRBQXFGgj9zmcQ5yrcDA++0EUYaIEHBh+Aq35I9dmwVMSFFA/WJBagMjt7WvrzpFGIBNX@vger.kernel.org
X-Gm-Message-State: APuU4Z+B8uOFkH4UQ+LK49V1Z6hIlXEBpae108/4Dn5JQo4hLtRn/XIl
	3M5RsiO3TVfyXU5zMhZgpvQF8AhHtp9EXjPIg31tDi9vqdn6MfrfdFKbjPyLGsRiuOxSL5UqJxD
	u9LNREPCp2frSCDtoMC55JN2fttALFNDYs0bQgSskhgmi8vLTXAMz/uZuZAZadgdgW+8a
X-Gm-Gg: AZFdTZfD6AIhNhyuWE5HfN4UqQsouBEaUe9cz9fmiPydhxa3ERR6adxiK1hycCNQnCS
	/985xUj0h5lMSxiPCTeRna0SkIztNZqDVOSvijOjrACE8vqpho2bV5nB6bkIiOBga1yvjIgqfqm
	IGS4O/eUdQahWeD61e70CbeTi7SINcM6t4J8jIdqALTFBmY53r0Y5qyszf/qqwMcWvrVHIhxl/0
	R2ojLur8lCh+TYahAZD5QpJh8RD4UOm32u7+pXfdVYWEi/HqECR9TZyxpmIwlOwPHmcAmdn+GPU
	R04Ln6p3GtVaOZJiGFKw+wHyLUPs9bqVBmu26Cn1dTk96Z1ADgvfYcji9Zp1ObmRk/3U6nWSX8i
	VGJx8745jHKJ1qSMytKJtQwm83/TGPXqL5LsxiQQ8PqRc9AxlMNvApunm4mYRSUj1s2cD9CRlg5
	GA2bPYwSl1gQ==
X-Received: by 2002:a05:693c:8211:b0:35f:ea17:d171 with SMTP id 5a478bee46e88-3856e74909fmr21864241eec.2.1795502717269;
        Mon, 23 Nov 2026 22:45:17 -0800 (PST)
X-Received: by 2002:a05:693c:8211:b0:35f:ea17:d171 with SMTP id 5a478bee46e88-3856e74909fmr21864189eec.2.1795502716612;
        Mon, 23 Nov 2026 22:45:16 -0800 (PST)
Received: from [192.168.1.210] ([76.33.11.15])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567daaf70sm43667754eec.28.2026.11.23.22.45.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 22:45:16 -0800 (PST)
Message-ID: <da2003ac-c6da-46e0-ad1c-fba61cd42bb0@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 22:45:13 -0800
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
Subject: Re: [PATCH 1/3] dt-bindings: media: qcom,mahua-iris: Add Mahua video
 codec
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261113-mahua_iris_enable-v1-0-b7107e1cbcaa@oss.qualcomm.com>
 <20261113-mahua_iris_enable-v1-1-b7107e1cbcaa@oss.qualcomm.com>
 <e693b076-39b9-46d5-468b-800159a47f76@oss.qualcomm.com>
Content-Language: en-US
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
In-Reply-To: <e693b076-39b9-46d5-468b-800159a47f76@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAyNiBTYWx0ZWRfX5wVGqkcFbLkI
 /GjbAFOKvBkU46oEUXUQ682kb/rVAiI9EpQpv0nuP/hRIXoi0x+5atXtfZBeSh7PIiIshcobbfj
 xNBp+WyBQ+K5jHnQ5q3W0O/u/c95aUg=
X-Proofpoint-ORIG-GUID: 3zMaWKznnp-SmfB-UN6CBa8m0KJ84Rk4
X-Authority-Analysis: v=2.4 cv=M+rYuCws c=1 sm=1 tr=0 ts=6b05327e cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=yYUYPLL3N79xqptAUcuwSw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QW4WLnT8hVGh5wgcaSQA:9
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAyNiBTYWx0ZWRfX9fud4VxDcC1H
 8QlA5Pa0XXqxWmERhzPmS5eFRtnSFZqBMHjaCdKrXbZESxVy9IOZnSwYxqs+piJNS4kjj2Ok8Nd
 GIaSJD0fmiNq6NHfVOABwqUnbt1+G/6NHvATHVk2hvTrmuymm2Qf0+2eZF/DofqE64WCzAf2hsu
 Z33tVR3zdO3o+YZHInebTLBPdfeWYDlv5z1oIE35p6AkZNmDBX5FVOQs2hiLfd1sJ15Q9ozpG4e
 //HF81XJ1GVUwEQP0WKWywIAIzvRHjEYTRWJWXdRiTvFWrhqjL+X4r9gAzG6fww0hbU3F/yM3vI
 pMkqIWIzXM0fRuMNhVDvNNkNjyl8o+xW9t2jXxK39XIns+TriX+lusc1SMJPf18tA0B/nTE2WMY
 y1LwpQNa33nnRJV+Lya7nkphMvZ91ShY2fWJDRlCNZdE26k/kC25iLiNc2I7u044VxgHHoftdQN
 u923J7vprUmiCFHwKZA==
X-Proofpoint-GUID: 3zMaWKznnp-SmfB-UN6CBa8m0KJ84Rk4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240026


On 11/17/2026 2:42 AM, Vishnu Reddy wrote:
> On 11/14/2026 8:39 AM, Deepa Guthyappa Madivalara wrote:
>> Add a devicetree binding for the Iris3.9 video encoder and decoder block
>> found on the Qualcomm Mahua SoC. This is a single core derivative,
>> leveraging most of Glymur data with the clks, resets present only
>> for vcodec0 core.
>>
>> Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/media/qcom,mahua-iris.yaml | 243 +++++++++++++++++++++
>>   1 file changed, 243 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,mahua-iris.yaml b/Documentation/devicetree/bindings/media/qcom,mahua-iris.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..cbae6bddf7fd4b67330ce47033874f3d349e5a3d
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/qcom,mahua-iris.yaml
>> @@ -0,0 +1,243 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/media/qcom,mahua-iris.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Mahua SoC Iris video encoder and decoder
>> +
>> +maintainers:
>> +  - Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> +
>> +description:
>> +  The Iris video processing unit on Qualcomm Mahua SoC is a video encode and
>> +  decode accelerator.
>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - items:
>> +          - const: qcom,mahua-iris
>> +          - const: qcom,glymur-iris
>> +      - const: qcom,mahua-iris
>> +
>> +  clocks:
>> +    maxItems: 6
>> +
>> +  clock-names:
>> +    items:
>> +      - const: core_iface
>> +      - const: core
>> +      - const: vcodec0_core
>> +      - const: vcodec0_iface
>> +      - const: core_freerun
>> +      - const: vcodec0_core_freerun
>> +
>> +  dma-coherent: true
>> +
>> +  interconnects:
>> +    maxItems: 2
>> +
>> +  interconnect-names:
>> +    items:
>> +      - const: cpu-cfg
>> +      - const: video-mem
>> +
>> +  '#address-cells':
>> +    const: 2
>> +
>> +  '#size-cells':
>> +    const: 2
>> +
>> +  non-pixel:
>> +    type: object
>> +    description:
>> +      Context bank for VPU non-pixel buffers, including compressed and internal buffers.
>> +    properties:
>> +      iommus:
>> +        maxItems: 3
>> +      memory-region:
>> +        maxItems: 1
> The use of memory-region for specifying carveout regions was discussed
> previously and was not considered the preferred approach [1].
>
> There is also an active series introducing iommu-ranges support for this use
> case [2]. Please consider using iommu-ranges instead of relying on memory-region
> here.
>
> [1] https://lore.kernel.org/all/662f7093-fb0a-4564-9ca0-98e03e68ba9a@kernel.org
>
> [2]
> https://lore.kernel.org/all/20261103-vpu_iommu_iova_handling-v6-0-e4b6ad864f8f@oss.qualcomm.com
Updated in v2.
>> +    required:
>> +      - iommus
>> +      - memory-region
>> +    additionalProperties: false
>> +
>> +  pixel:
>> +    type: object
>> +    description:
>> +      Context bank for VPU pixel buffers containing uncompressed video data.
>> +    properties:
>> +      iommus:
>> +        maxItems: 1
>> +    required:
>> +      - iommus
>> +    additionalProperties: false
>> +
>> +  video-firmware:
>> +    type: object
>> +    description:
>> +      Context bank for the VPU firmware processing domain.
>> +    properties:
>> +      iommus:
>> +        maxItems: 1
>> +    required:
>> +      - iommus
>> +    additionalProperties: false
>> +
>> +  operating-points-v2: true
>> +  opp-table:
>> +    type: object
>> +
>> +  power-domains:
>> +    maxItems: 5
>> +
>> +  power-domain-names:
>> +    items:
>> +      - const: venus
>> +      - const: vcodec0
>> +      - const: mxc
>> +      - const: mmcx
>> +
>> +  resets:
>> +    maxItems: 4
>> +
>> +  reset-names:
>> +    items:
>> +      - const: core_bus
>> +      - const: vcodec0_bus
>> +      - const: core
>> +      - const: vcodec0_core
>> +
>> +required:
>> +  - clocks
>> +  - clock-names
>> +  - compatible
>> +  - dma-coherent
>> +  - interconnects
>> +  - interconnect-names
>> +  - non-pixel
>> +  - pixel
>> +  - power-domains
>> +  - power-domain-names
>> +  - resets
>> +  - reset-names
>> +
>> +allOf:
>> +  - $ref: qcom,venus-common.yaml#
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/power/qcom,rpmhpd.h>
>> +
>> +    video-codec@aa00000 {
>> +        compatible = "qcom,mahua-iris";
>> +        reg = <0x0aa00000 0xf0000>;
>> +
>> +        clocks = <&gcc_video_axi0c_clk>,
>> +                 <&videocc_mvs0c_clk>,
>> +                 <&videocc_mvs0_clk>,
>> +                 <&gcc_video_axi0_clk>,
>> +                 <&videocc_mvs0c_freerun_clk>,
>> +                 <&videocc_mvs0_freerun_clk>,
>> +
>> +        clock-names = "core_iface",
>> +                      "core",
>> +                      "vcodec0_core",
>> +                      "vcodec0_iface",
>> +                      "core_freerun",
>> +                      "vcodec0_core_freerun",
>> +
>> +        dma-coherent;
>> +
>> +        interconnects = <&hsc_noc_master_appss_proc &config_noc_slave_venus_cfg>,
>> +                        <&mmss_noc_master_video &mc_virt_slave_ebi1>;
>> +        interconnect-names = "cpu-cfg",
>> +                             "video-mem";
>> +
>> +        interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
>> +
>> +        memory-region = <&video_mem>;
>> +
>> +        operating-points-v2 = <&iris_opp_table>;
>> +
>> +        power-domains = <&videocc_mvs0c_gdsc>,
>> +                        <&videocc_mvs0_gdsc>,
>> +                        <&rpmhpd RPMHPD_MXC>,
>> +                        <&rpmhpd RPMHPD_MMCX>,
>> +
>> +        power-domain-names = "venus",
>> +                             "vcodec0",
>> +                             "mxc",
>> +                             "mmcx";
>> +
>> +        resets = <&gcc_video_axi0c_clk_ares>,
>> +                 <&gcc_video_axi0_clk_ares>,
>> +                 <&videocc_mvs0c_freerun_clk_ares>,
>> +                 <&videocc_mvs0_freerun_clk_ares>;
>> +        reset-names = "core_bus",
>> +                      "vcodec0_bus",
>> +                      "core",
>> +                      "vcodec0_core";
>> +
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +
>> +        non-pixel {
>> +            iommus = <&apps_smmu 0x1940 0x0000>,
>> +                     <&apps_smmu 0x1944 0x0000>,
>> +                     <&apps_smmu 0x19e0 0x0000>;
>> +            memory-region = <&iris_resv>;
>> +        };
>> +
>> +        pixel {
>> +            iommus = <&apps_smmu 0x1943 0x0000>;
>> +        };
>> +
>> +        firmware {
>> +            iommus = <&apps_smmu 0x19e2 0x0000>;
>> +        };
>> +
>> +        iris_opp_table: opp-table {
>> +            compatible = "operating-points-v2";
>> +
>> +            opp-240000000 {
>> +                opp-hz = /bits/ 64 <240000000 360000000>;
>> +                required-opps = <&rpmhpd_opp_svs>,
>> +                                <&rpmhpd_opp_low_svs>;
>> +            };
>> +
>> +            opp-338000000 {
>> +                opp-hz = /bits/ 64 <338000000 507000000>;
>> +                required-opps = <&rpmhpd_opp_svs>,
>> +                                <&rpmhpd_opp_svs>;
>> +            };
>> +
>> +            opp-366000000 {
>> +                opp-hz = /bits/ 64 <366000000 549000000>;
>> +                required-opps = <&rpmhpd_opp_svs_l1>,
>> +                                <&rpmhpd_opp_svs_l1>;
>> +            };
>> +
>> +            opp-444000000 {
>> +                opp-hz = /bits/ 64 <444000000 666000000>;
>> +                required-opps = <&rpmhpd_opp_svs_l1>,
>> +                                <&rpmhpd_opp_nom>;
>> +            };
>> +
>> +            opp-533333334 {
>> +                opp-hz = /bits/ 64 <533333334 800000000>;
>> +                required-opps = <&rpmhpd_opp_svs_l1>,
>> +                                <&rpmhpd_opp_turbo>;
>> +            };
>> +
>> +            opp-655000000 {
>> +                opp-hz = /bits/ 64 <655000000 982000000>;
>> +                required-opps = <&rpmhpd_opp_nom>,
>> +                                <&rpmhpd_opp_turbo_l1>;
>> +            };
>> +        };
>> +    };
>>
