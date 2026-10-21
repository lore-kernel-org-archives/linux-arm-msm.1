Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792582771;
	b=YeFYd/m3LyYTJZ++3MkjRqn4puvY5iW7dnQSFXVeQnAhmiihV3t4Z8Y5RU75jXjAk1DD
	 IIG/TXMYdFGwkDXRX4UJAKrHLIFl+LDt+h981ypcTNztiXMUL1UUSdTNLNWrQPuKqfpNK
	 CU1Z9VHz3iX8sKbCP/G3qLIaBGHT7MCcAFra7gh/SW/AMNHLU2f2TXO3i3tMxB1jB/C6B
	 PZb5xzHDMbm9gBkZng59EJWo4OUwLInLlbfulmlk4a/PkstvLWPVFCGYiXKp76dAaQlMG
	 om7RHEv5uUtCxixQzIKDqI8rzZs/fAzFgqaK97MnuaCGDLX/y7CE1/km1tqEXNkktvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792582771;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 X-Google-Original-From:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bGXJfjCCrUH5RZmEcReSeM7EPT2qwuvFA/PK6PwffXI=;
	b=lrpkxjH7ezA01Cp+Wy6IOd+7OVk8cewKYwSRZ7gfAtHAfx+9hoj/QXdDVH++bY9ArHog
	 /B7rrrKm/ciLfOX4mmtRCbA+r01XZIgaV/agTuTdvNm8DAVIey1k4BE0M/Zb6C2AZVKTw
	 te+SXjj40rIuN3lO8CUFVFlWgeSzVndHFx6HyuCcddXVmFKvSpXsVaa8T9aQ4aXH3WAuw
	 5P7B7HGaESIwpbFeaQI2GoHqGxJTb0qshOeo6anj0alZoR8IBiBzcxuNTfwnc1ioxcSRq
	 da/V6lBd+J43laFPUiGdazlRmjEX2u4i+AONCd0FqRH/HSv87xvo80A2FyLTSoDlrPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T9VRn1QL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HnOGRBnv;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF53606A321
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 11:39:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FF53606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T9VRn1QL;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HnOGRBnv
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA69FU117883
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 11:39:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bGXJfjCCrUH5RZmEcReSeM7EPT2qwuvFA/PK6PwffXI=; b=T9VRn1QLoZ3qsW1g
	7n1m07aEUz0lY+4t+8Oe1+aBdXw9JEmYIQnw6ZkxlTM4byCoWqImniHAyYrLeGHz
	8nrooNDQ0kSJvUSTpw3Pv1i38317ZFO1LJ6BYSzejBh59oEGQgCKptPeIWL3Znlc
	WD2Vw0Fqb16vKs+6YDgQwN0DfK4HnT6Z5uWYUvCaq9kFuuiw7MPh8+Ovc6j2HcM2
	GCn0bRvkJVmP186Zn7rL82ZhDfmZ6LTxyHJeKWRelnS5ADJISfORmV9o23G04RCC
	ai93GFgIIN22kofHu3LBpjMkloNAPsWhUVek8QWEM0fk0kPuenN+WRZqMKWbyOmY
	qHxjcQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9v3re8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 11:39:29 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd652c0385bso352474a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 04:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792582768; x=1793187568; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bGXJfjCCrUH5RZmEcReSeM7EPT2qwuvFA/PK6PwffXI=;
        b=HnOGRBnvJsKgrR45CSTnp2NkHUf3lcYfG1DI6rFx6wDDUIiqxcUtBX2XGoAAAInPKF
         wQD/UCeOw79sW96yI6ztVPwMRb0UdeUyMS47n/7A3Ay0monkRjmxXfwaKceDO3wz9D5f
         LfhgZ/8E0D2AWRd7kJzaFNBP1mMMOipH6zfvVViHTb52iVTEA39CAoCud+N7kB41k7eA
         wdpoKT4B7Nvj2MvD2bVqSfhq0/gLEpc1ZQ5SlWlrig4tiTH2DnVVIIzr+D6LS74vqXw9
         UsvhBelgQcvX3wQ+1zbg2WMsLDCOSXoUlCB8UOPZdjOuggSdIgeybLGAETxsAgsofNao
         5K0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792582768; x=1793187568;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bGXJfjCCrUH5RZmEcReSeM7EPT2qwuvFA/PK6PwffXI=;
        b=snHXSivoQyZbRR5m3E4N4Hex6BwPA2xNcvb1SbqRLaiE5++CAonwqBs9bFr5Zdi9FE
         Q1hUQ7seN2zxPnGVQQ5TgGfUMp0GlNXK0PSHrI4vNmASjT0wU8XwUfbzeuCb4i7+apmh
         W69eOQMX5s70oDYp8QtF681UFrgZPhFP1BF17G6Tz/ZPfzd99plvWh8n2gGi+yp9Q1nN
         aq1kvrnYLYKTd/DbtxkSG84Dhjn1IbU6Ym0d/Cifxb+uu8Pkn4jmU3zjx5v8sR7WiLyz
         RPBKTnVieDHgQm/9T9Ryunqkxwjs7uFNVeUjSpY68K+ltYGfWAQWTgf/g54M93Gpv2sP
         DIlA==
X-Forwarded-Encrypted: i=1; AKwUvBzZml4iVhcYsv+87oKQ5lMzjUCSMllguUAfoEMiW0JEACR+2iqWDAuvrUXwnJWLHHgPr2D/ykieYl6tkA4F@vger.kernel.org
X-Gm-Message-State: AFq9FYK3w3ZxCWlatalL5jZ4VimAJJd8HG0VHK1Vbn2pWCpXUA4EIiEm
	WG29ZEYuQgUzgEInWAGlwOb6yFExEF5HbATpIpSflXr/DteRbbzKMAbu5VfeFETvkjiosbQ/4OJ
	hXXTFoNKA9rFw7iWTgzxI6WRz936MjTj4ZF2XhPqrmCNEsxYvyTboZL5gd39+eF5olzhv
X-Gm-Gg: AYBFou0DYpkLlCUtQUNGQSrWacbgoepAQg36D1xINL4euaNWhTnZzUuaPbYuadFyu8D
	m7QGk34/xngLPWroezYjeu6T//ES7l/ch1vFW3yK9RkwpJvD1GAdgfyso0zbGN59a0KarDciNoY
	yD+hinOLzwbWfJ9WY8UL2LyKTInmiZlDxGy/DwIxj1vc08dDsmm4pWtSpxVCWdAESTCEamoAIOk
	Azg07BNyEn61fWolIFG3x/VLI8wvVecz4DeM/CI9ENyw+l9gwI0uQYLyeb6E2G3i/uIRnQ5z49z
	xOh5YnNX1LMebxEcI1ayOwdXaZFqkGQqpg3BA+4lE+x74xzCk9tmDwGHKeyVMYGqXQfomPDKHPa
	5LBMvpYLWdKtjfM7ptZpugtc1Flc++fJbpA==
X-Received: by 2002:a05:6a20:6a1b:b0:3de:46cc:b63c with SMTP id adf61e73a8af0-3e287d53782mr1589278637.11.1792582768152;
        Wed, 21 Oct 2026 04:39:28 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a1b:b0:3de:46cc:b63c with SMTP id adf61e73a8af0-3e287d53782mr1589233637.11.1792582767612;
        Wed, 21 Oct 2026 04:39:27 -0700 (PDT)
Received: from [10.204.79.28] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd6a85a32b2sm712484a12.8.2026.10.21.04.39.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 04:39:27 -0700 (PDT)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
X-Google-Original-From: Jayant Shekhar <jshekhar.shekhar@oss.qualcomm.com>
Message-ID: <f7926ef7-1edf-4d74-9758-2ee0c8a795bc@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 17:09:15 +0530
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
Subject: Re: [PATCH 01/13] dt-bindings: display: msm: Add Qualcomm DCP
 bindings
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        iommu@lists.linux.dev
References: <20261015-jshekhar-drm-msm-dcp-v1-v1-0-48aad0fe4f72@oss.qualcomm.com>
 <20261015-jshekhar-drm-msm-dcp-v1-v1-1-48aad0fe4f72@oss.qualcomm.com>
 <hprf3vrsveovq3hwcgjrfj6uhmlxlq5u5bx4lkbswgxe476qwz@pacalsdgrjx7>
 <ea81fcc1-c7e4-4b80-b65e-f483487bd1a1@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <ea81fcc1-c7e4-4b80-b65e-f483487bd1a1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0NiBTYWx0ZWRfX8f9eQgrql55e
 sZTdengTe9pgex1XrqZiBhcJHJPPOX9gaZqByNiJpxf4HTJtZcdcbBKMsPPZqUM2Px9BBEL3YjA
 RoHcbtv3f8EcncKfJeLeb/wjSwnPV3A=
X-Proofpoint-ORIG-GUID: fy5XVloWmUGdpZJb4en7oqEc6RYxen8r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0NiBTYWx0ZWRfX3FJNPyBS9fIv
 GQxxFFXHhYqkT5EdAIAdlpE2/IaGUe+EGSf4gxrgIdzKBELc7fF9HexmUPHggbdBvJSfffNlRQI
 GuQMY7rvnXBhaioIx7nEu+Rn8192PtQoP5szn/eb151yIFdZgUn1PTyo3c9jkfPVa8luWx4OwDs
 A7fXN2FBjr+3YmQkT+pg30UNjXW5jxC6ZAbwo9CUFvDaPwrNs9GveSAxvZC1j7PgEUJWX0RR+7X
 27ZJxZiUm8bx2moqe8qGDGmSRdLFyLMmsG7mcn1uVOhps4ekUvxEyKc+N0XRDdDndTNVhGdSZGi
 4vGUnKzfNyOXdJrn1M7MAHDX+MmtAOL3xtxhdirRb9TWC7L0OU7wOfFJPL/J1v/gtgd76esldIP
 hgdkcoRvc1acywMZmUSXHpSRUdIYqkmR1n8nAqNoi5KHaxegYko+vUrT2T1fo+XV0r70+T5gkOq
 q9YvZ+0WbFcURi6iMcA==
X-Authority-Analysis: v=2.4 cv=I6zw19gg c=1 sm=1 tr=0 ts=6ad8a471 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=kn4dWm41NmOkgBkIVkoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: fy5XVloWmUGdpZJb4en7oqEc6RYxen8r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210046


On 21-10-2026 14:15, Jayant Shekhar wrote:
>
> On 15-10-2026 17:47, Dmitry Baryshkov wrote:
>> On Thu, Oct 15, 2026 at 01:08:21PM +0530, Jayant Shekhar wrote:
>>> DCP platforms place the display pipeline under firmware control, so 
>>> Linux
>>> cannot discover display resources through direct register access. 
>>> The DRM
>>> driver therefore needs device-tree descriptions of the firmware 
>>> transport,
>>> display topology, IOMMU contexts, and panel connections.
>>>
>>> Add bindings for the Qualcomm DCP VirtIO display function, including 
>>> the
>>> INTF graph and DSI host outputs. Document the framebuffer IOMMU 
>>> context,
>>> IPCC power-notify mailbox and interrupts, firmware display topology, 
>>> and
>>> firmware-visible IOVA window supplied by the parent VirtIO-MMIO 
>>> transport.
>>>
>>> Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
>>> Assisted-by: LLM
>>> ---
>>>   .../bindings/display/msm/qcom,dcp-dsi.yaml         |  75 
>>> +++++++++++++
>>>   .../bindings/display/msm/qcom,dcp-virtio.yaml      | 113 
>>> +++++++++++++++++++
>>>   .../devicetree/bindings/display/msm/qcom,dcp.yaml  | 119 
>>> +++++++++++++++++++++
>>>   3 files changed, 307 insertions(+)
>>>
>>> diff --git 
>>> a/Documentation/devicetree/bindings/display/msm/qcom,dcp-dsi.yaml 
>>> b/Documentation/devicetree/bindings/display/msm/qcom,dcp-dsi.yaml
>>> new file mode 100644
>>> index 000000000000..f7178c66c09e
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/display/msm/qcom,dcp-dsi.yaml
>>> @@ -0,0 +1,75 @@
>>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/display/msm/qcom,dcp-dsi.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Qualcomm DCP DSI host
>>> +
>>> +maintainers:
>>> +  - Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
>>> +
>>> +description: |
>>> +  A MIPI DSI host exposed by the Qualcomm DCP VirtIO device (see
>>> +  qcom,dcp.yaml). DCP is a firmware protocol shared across multiple
>>> +  Qualcomm SoCs, not specific to any one of them; Hawi is its first
>>> +  platform. The DSI host and its connection to a panel are described
>>> +  using the standard DSI controller and OF graph properties.
>>> +
>>> +allOf:
>>> +  - $ref: /schemas/display/dsi-controller.yaml#
>>> +
>>> +properties:
>>> +  reg:
>>> +    maxItems: 1
>>> +    description: Index of this DSI host among its siblings.
>>> +
>>> +  status: true
>>> +
>>> +  ports:
>>> +    $ref: /schemas/graph.yaml#/properties/ports
>>> +    description: |
>>> +      port@0: Input from the DCP virtio device's DPU INTF output port.
>>> +      port@1: Output to the attached panel.
>>> +    properties:
>>> +      port@0:
>>> +        $ref: /schemas/graph.yaml#/properties/port
>>> +      port@1:
>>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>>> +        unevaluatedProperties: false
>>> +        properties:
>>> +          endpoint:
>>> +            $ref: /schemas/media/video-interfaces.yaml#
>>> +            unevaluatedProperties: false
>> Why do we need OF graph here? Would it be enough to link one of the
>> ports of the root node with the panel's input?
>>
>>> +
>>> +required:
>>> +  - reg
>>> +  - ports
>>> +
>>> +unevaluatedProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    dcp-subsystem {
>>> +        #address-cells = <1>;
>>> +        #size-cells = <0>;
>>> +
>>> +        dsi@0 {
>>> +            reg = <0>;
>>> +            #address-cells = <1>;
>>> +            #size-cells = <0>;
>>> +
>>> +            ports {
>>> +                #address-cells = <1>;
>>> +                #size-cells = <0>;
>>> +
>>> +                port@0 {
>>> +                    reg = <0>;
>>> +                    dcp_dsi0_in: endpoint {
>>> +                        remote-endpoint = <&dcp_intf1_out>;
>>> +                    };
>>> +                };
>>> +
>>> +            };
>>> +        };
>>> +    };
>>> diff --git 
>>> a/Documentation/devicetree/bindings/display/msm/qcom,dcp-virtio.yaml 
>>> b/Documentation/devicetree/bindings/display/msm/qcom,dcp-virtio.yaml
>>> new file mode 100644
>>> index 000000000000..018694310dfb
>>> --- /dev/null
>>> +++ 
>>> b/Documentation/devicetree/bindings/display/msm/qcom,dcp-virtio.yaml
>>> @@ -0,0 +1,113 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/display/msm/qcom,dcp-virtio.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Qualcomm DCP VirtIO host
>>> +
>>> +maintainers:
>>> +  - Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
>>> +
>>> +description: |
>>> +  Qualcomm's DCP VirtIO host provides the generic VirtIO-MMIO 
>>> transport and
>>> +  the host-side IPCC channel used to wake the DCP firmware.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    contains:
>>> +      const: qcom,dcp-virtio
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  iommus:
>>> +    maxItems: 1
>>> +
>>> +  iommu-ranges:
>>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>>> +
>>> +  interrupts-extended:
>>> +    minItems: 2
>>> +
>>> +  interrupt-names:
>>> +    items:
>>> +      - const: virtio
>>> +      - const: dcp_power_notify_irq
>>> +
>>> +  dma-coherent: true
>>> +
>>> +  mboxes:
>>> +    maxItems: 1
>>> +
>>> +  mbox-names:
>>> +    const: dcp-power-tx
>>> +
>>> +  dcp-subsystem:
>>> +    $ref: qcom,dcp.yaml#
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +  - interrupts-extended
>>> +  - interrupt-names
>>> +  - iommus
>>> +  - dcp-subsystem
>>> +
>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>>> +    #include <dt-bindings/mailbox/qcom-ipcc.h>
>>> +
>>> +    virtio@9be8000 {
>>> +        compatible = "qcom,dcp-virtio", "virtio,mmio";
>> Is it really compatible with virtio,mmio? Can it be handled completely
>> by virtio,mmio?
>
>
> There are two possible approaches:
>
> Option 1 — Use the standard VirtIO-MMIO parent (preferred)
>
> Keep the parent as:
>
> compatible = "virtio,mmio";
> reg = <...>;
> interrupts = <...>;
> iommus = <...>;
> iommu-ranges = <...>;
> dma-coherent;
>
> The generic virtio/mmio.yaml binding would be extended only to 
> document the generic iommu-ranges property.
>
> The DCP-specific resources would be placed on the virtio,deviceXX child:
>
> dcp-subsystem {
>     compatible = "virtio,deviceXX";
>     iommus = <...>;
>     interrupts-extended = <&ipcc ...>;
>     mboxes = <&ipcc ...>;
>     mbox-names = "dcp-power-tx";
> };
>
> The parent uses the standard VirtIO-MMIO interrupts property. The 
> child has one DCP-specific interrupt, so interrupt-names is 
> unnecessary and the driver uses interrupt index 0.
>
> Option 2 — Add a Qualcomm-specific VirtIO-MMIO parent binding
>
> Keep a Qualcomm-specific compatible such as:
>
> compatible = "qcom,dcp-virtio", "virtio,mmio";
>
> and extend the parent binding to describe iommu-ranges, the additional 
> IPCC interrupt, mailbox, and related DCP resources.
>
> However, this approach duplicates the generic VirtIO-MMIO binding and 
> is only justified if the transport requires Qualcomm-specific 
> handling. Since the DCP transport is handled completely by the 
> standard VirtIO-MMIO driver.
>
> Which one do you prefer?
>
> I will be addressing other comments in v2.
>
>
> Thanks
>
> Jayant
>
>

I think Option 1 is not suitable because the IPCC power-notify sequence 
is required before the first VirtIO-MMIO register access. The standard 
VirtIO-MMIO driver would otherwise probe the DT node directly and access 
the registers before Qualcomm-specific initialization is complete.

   Would the following Qualcomm-specific transport approach be acceptable?

   - qcom,dcp-virtio is the DT-compatible Qualcomm wrapper. It 
initializes IPCC and sends the required power notification before 
creating a synthetic virtio-mmio platform device.
   - The unchanged generic VirtIO-MMIO driver probes the synthetic 
child, accesses the MMIO registers, creates the VirtIO queues, and 
registers the VirtIO device.
   - The DCP VirtIO driver binds to the resulting VirtIO device through 
its VirtIO device/vendor ID table and initializes HFI, firmware 
capabilities, and DRM/KMS.
   - The virtio,deviceXX DT child is discovered by the VirtIO core and 
describes the DCP-specific IOMMU context, DSI hosts, display graph, and 
panels.

   The flow is:

   qcom,dcp-virtio
       → IPCC power-up
       → synthetic virtio-mmio device
       → generic VirtIO-MMIO driver
       → virtio,deviceXX DT child
       → DCP HFI/DRM driver

   Since the Qualcomm wrapper creates and owns the synthetic VirtIO-MMIO 
device, the parent node uses only:

   compatible = "qcom,dcp-virtio";

   It should not also advertise "virtio,mmio", because the generic 
driver must not probe the parent directly before IPCC initialization.


>>> +        reg = <0x09be8000 0x1000>;
>>> +        interrupts-extended = <&intc GIC_ESPI 956 
>>> IRQ_TYPE_LEVEL_HIGH>,
>>> +                              <&ipcc 13 5 IRQ_TYPE_EDGE_RISING>;
>>> +        interrupt-names = "virtio", "dcp_power_notify_irq";
>> Why do you need names? Can they be dropped in favour of using indices?
>>
>>> +        iommus = <&apps_smmu 0x15a3 0x0>;
>>> +        iommu-ranges = <0x0 0x84000000 0x0 0x04000000>;
>>> +        dma-coherent;
>>> +        mboxes = <&ipcc 13 5>;
>>> +        mbox-names = "dcp-power-tx";
>>> +
>>> +        dcp-subsystem {
>>> +            compatible = "virtio,device34";
>>> +            iommus = <&apps_smmu 0x400 0x2>;
>>> +
>>> +            #address-cells = <1>;
>>> +            #size-cells = <0>;
>>> +
>>> +            ports {
>>> +                #address-cells = <1>;
>>> +                #size-cells = <0>;
>>> +
>>> +                port@1 {
>>> +                    reg = <1>;
>>> +                    dcp_intf1_out: endpoint {
>>> +                        remote-endpoint = <&dcp_dsi0_in>;
>> Can this point directly to the panel_in? What's the point of describing
>> internal paths in the DT?
>>
>>> +                    };
>>> +                };
>>> +            };
>>> +
>>> +            dsi@0 {
>>> +                reg = <0>;
>>> +                #address-cells = <1>;
>>> +                #size-cells = <0>;
>>> +
>>> +                ports {
>>> +                    #address-cells = <1>;
>>> +                    #size-cells = <0>;
>>> +
>>> +                    port@0 {
>>> +                        reg = <0>;
>>> +                        dcp_dsi0_in: endpoint {
>>> +                            remote-endpoint = <&dcp_intf1_out>;
>>> +                        };
>>> +                    };
>>> +                };
>>> +            };
>>> +        };
>>> +    };
