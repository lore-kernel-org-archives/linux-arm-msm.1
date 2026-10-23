Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792743041;
	b=I2MkCgSXr2eHB0aSx3psuB5y6EHSRWKcHIEbyK7MeoEi/GFzIzDkR9Z6wqVP0lBQNUEE
	 Aeg0N9EoRqigT+hQwhFYto68BsdR5a3/hjM6zbACslFAzZpflHgx48YMH8ykWkIo7hdxL
	 b+Y75o8Ce3OFvSvWO+B6ueBTC18K1vW8huN1ITlkC10+vwbk/cVWZuVp2YroJI87roTnn
	 fgrHqcqgX1duHW2ZHCiaa/bmgt85xCFLkvNSODZGBdAibZOVgQjIAkjQxO6ZjEyVToZK4
	 5pr4v0LHjalGbFYpO9kwf3oG7PhQGgifPB5oauayr6/4+i6zwZU6WXU93nJ7+FL0fow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792743041;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 X-Google-Original-From:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Qt1u1PGQnVLwLZKEH+hp9Dtkn1RKbERmxA8BWP6q4N8=;
	b=0STburZlDkwW7h+gxMjk4AqrgKneaUeQRlmhaFyWMkGgPbZl9rzY2cnjsbYaE6oHUGiT
	 MSVSl4k6Yh6bV6jZWwhjS+9VQXe0dWUrsEXby3FA4KXGqcD4YXQJs/+Mpyol8b3uT43tU
	 eZ5W0vA+t+cATEKgsaMN/Fk2joe72bMeU7ntqfpHfAENsyNZD+XoqdCE8sfFC5S1KPgKP
	 DffPZq5d/v97ixY7X1OfUkeAv6Jkjoy4fJwQehvuU7v79eGxI5MTAEdH5o2aDx+vXJVtj
	 uhFDlkdecsYnmIntPn9Uffg6MDwUQ6ZevWIt/q3cDH4uUaYY4B/PCFIMkHdgkN0qKig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U7fHBr2Z;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e45Izuit;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B171D606A331
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 08:10:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B171D606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U7fHBr2Z;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e45Izuit
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7F7CO3154001
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 08:10:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qt1u1PGQnVLwLZKEH+hp9Dtkn1RKbERmxA8BWP6q4N8=; b=U7fHBr2Zzr5BzR0l
	GZ4p+H51nKm9WVAQPxZtK5Fxkawu2eyIUw8uq1dLaEEiMmoXZzBSEOt1Ca9eoWJh
	Lmldut7xSV7XBgCfpN1LqCL+BlRp56ZaYaSsa4GwxE5GF1t7f/hD6UuuO/Nb3+Ie
	pzBPhe/0u5Dl7/AVXrCPWXw/OJQQoSxrCbRu2YwIGvD6Eh/ZW3w29qV+5Ex5n93u
	V0Ekb2Macw7YJI7/WfuTkPsM2grc2qboRWV1y9a+c6TX6khVSg8MVWZxO16ccf14
	DwWONyUX847Rs1JDb87TeUaYuMA/se/zirkPxWskU8S8qCLB8g+30G4DDdGoCCK/
	zHAsZw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmramy0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 08:10:38 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3aaf955db5fso1078169a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 01:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792743038; x=1793347838; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qt1u1PGQnVLwLZKEH+hp9Dtkn1RKbERmxA8BWP6q4N8=;
        b=e45IzuitG6Hw89f+NJpwhNPo7fkPr1mPDbK5eNSuPgeGFFPxZgTihpkaIE5kSnEpm2
         8eEz86Q+00rU62TzH/J89CW09JSQBz7m0+19upcVb4m9kUBJa+n3BFO/MLwkcGm7f9lR
         rG60NjoorCDNbBeaALnYfsrBabFXNiKFOuKXl3v27p9xU2xriQExjJbO2I/7QbQpwNRm
         Pf1H34Rqvvj9b82SyQVVmjbtEB0mosfLqp4v4+vOFwudUv6mXMFKnwOk1Wo+V1YwVn+/
         7rieHIvIXkzENGZXQo4DTI/SDgh40bjscMXXphHeU6/RK/ENh+6Nr4TcXYTVmdARCvBJ
         sJug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792743038; x=1793347838;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Qt1u1PGQnVLwLZKEH+hp9Dtkn1RKbERmxA8BWP6q4N8=;
        b=wlsSqXrTlS+MLfK8igR6nHG4qnDbD5WfnsZhjFCEyrFDC5SL4kD5sPqPaVx4LHlhga
         wswCx/YCfkNow9vb54SMMAPVwqptxvFr6U8pwEQUA8j2yOdTMl2qZSFmoI2L+SU05Tyk
         U9F3VcNI7Ydgtkn1gxe9wk1qNXSrXoDlOCvTRVTUx0Ye4pvt6oJpS0ZUX3kp2GkWDjz4
         90t3cDt0Us9p3/Lf96nk84k6cmjyRZ/OGgws/dcVTUpYvqQJOvfxFzoHLD62yQM8DVCX
         JohFiJjuDjYhKjt0Gd2ydHbV1kLAtWu0RJh/a892Ag3qPgaoDh/GXqWquz7W6QH05bAw
         g12A==
X-Forwarded-Encrypted: i=1; AKwUvBwvSVbGzCuuwdjxf4C79QNADhwSEdWvyY8jPT6cLzp5VoRd2qmeH/n8dus3ABt2rxDrFTgfENyC/qpfW1B8@vger.kernel.org
X-Gm-Message-State: AFq9FYI+KZ2jIKV+3bAvuJzI+TVwck7XJ566Q+w9U5i3awhOux212RoU
	+WmhR5a18Xue3y8Np7DDdWwpYO1IOSJZ1ilIba9s0rtAnOeS5FrXN3isGKrGW+A8AgP0IK2k+ZH
	qzstdbTM6uvT5T+5KIcVI4RH62BROP8lG7G7fnOXBuZi2R8zojvqMr4gjXXKUQy0z8cfq
X-Gm-Gg: AYBFou1t06TAo++o9MXBZ6gnDezrTAql5LV9yFXi5et4YVZCAIp3qQY5o/DP+AQQheW
	3tpdHqWyyr7R9Hlg1TqF36LEeWqSl2jXlZyZdbpUFQ7Ngr1Wa1ZK6w8Ov72qz0hOUrUYAgd41sP
	k0MhPSCz6vuRMFwHJKB/0Q29HPAlX1dYGmC5NWtCwMX0ZISAucA3JBkL6knIvH40ZpDclxa50Hv
	ulriQJEPJ5LGE6CdB868rBAQHZVtsbQ2XOfM8/tOFxeqntGBpHEmzNhqsMzXbFarcAhgoM0vauH
	GGZO2ZJ9MT4KWMv0QAbmbO7t1eogh7R9ACIMDz3aZbxj9TqYiD48gnIp+3aZzPelYa2IIqdf1x2
	OUf91RpNXI9QVDIpr7dgUS8lWanogajg0xQ==
X-Received: by 2002:a17:90a:dfc3:b0:3ac:97e3:7389 with SMTP id 98e67ed59e1d1-3adce072ca9mr1162570a91.44.1792743038017;
        Fri, 23 Oct 2026 01:10:38 -0700 (PDT)
X-Received: by 2002:a17:90a:dfc3:b0:3ac:97e3:7389 with SMTP id 98e67ed59e1d1-3adce072ca9mr1162541a91.44.1792743037308;
        Fri, 23 Oct 2026 01:10:37 -0700 (PDT)
Received: from [10.204.79.28] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adcb0a11fbsm2517749a91.4.2026.10.23.01.10.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 01:10:36 -0700 (PDT)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
X-Google-Original-From: Jayant Shekhar <jshekhar.shekhar@oss.qualcomm.com>
Message-ID: <ae967eb1-cc54-4733-9e89-bc375e1cbfd6@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 13:40:25 +0530
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
To: Krzysztof Kozlowski <krzk@kernel.org>,
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
 <20261015-heavy-clam-of-sunshine-8fe831@quoll>
Content-Language: en-US
In-Reply-To: <20261015-heavy-clam-of-sunshine-8fe831@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: vD9qsgD4u0kehTtHDmgSXBq8uxFYJq8j
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzMiBTYWx0ZWRfX832ECRymoQV9
 np7ijct1xO4z4ReUDyiyzi92kvSrXVUJJpFeLDq21GhQbmtI9Ig+m5RJ38qJnLN48lGSpBvCmxW
 l9u7JToz2zURWabyEpXqfqcTAwT0XDA=
X-Authority-Analysis: v=2.4 cv=VNZIDNPX c=1 sm=1 tr=0 ts=6adb167e cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=P-IC7800AAAA:8 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=CvYCOFMdU_owP9l6gQwA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzMiBTYWx0ZWRfX8OdF2patEyI1
 o00mMIE8DvMnRybUhM7eSiCzL5iEPBb8XdL7+q7l8HFbNuZ8z9FwJ6f9xujHHa0sGBiWts69bB4
 QYcUqU6xxsAKRuL0EUMadu/TgSnE/5RkQYtHl7wOJu5Ujl6UfI1u8zdGw4WG6QaM/+dXPDf6RGt
 G/jbUrdhWD8NqJMw5labz8IfIQrI+9/qEfB50K56L0Jhnvb6alawUkN5VCFx9jtTP4tfhoAKuAv
 v7axBwpFWXjKPcM8jpPoDN5w/LbJOBU7DLzGVr7nwh4R5l4+QgIjoKVgP2NqK15rR3+Pv4iC4o2
 ZYlzOFk93/eBpDdEYj1lbRSBIRJgUxGEkcOdWMnq/rfx5dkY6KWTE5RzS1zOmWzBcRKc3N/6AvA
 z6SxjIV9NXXbE10sjAYi5YtLWw/IWnPPfgwGQNEskE+X9BG684DxIgNxYGkZMFiv6VE/Y8CkUuR
 YbTgudjeIwc8x21WVAg==
X-Proofpoint-ORIG-GUID: vD9qsgD4u0kehTtHDmgSXBq8uxFYJq8j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230032


On 15-10-2026 16:20, Krzysztof Kozlowski wrote:
> On Thu, Oct 15, 2026 at 01:08:21PM +0530, Jayant Shekhar wrote:
>> DCP platforms place the display pipeline under firmware control, so Linux
>> cannot discover display resources through direct register access. The DRM
>> driver therefore needs device-tree descriptions of the firmware transport,
>> display topology, IOMMU contexts, and panel connections.
> Due to dependencies this cannot be tested, so limited review.
>
> A nit, subject: drop second/last, redundant "bindings". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v7.1-rc7/source/Documentation/devicetree/bindings/submitting-patches.rst#L23
>

Thanks, will fix this in v2.


>> Add bindings for the Qualcomm DCP VirtIO display function, including the
>> INTF graph and DSI host outputs. Document the framebuffer IOMMU context,
>> IPCC power-notify mailbox and interrupts, firmware display topology, and
>> firmware-visible IOVA window supplied by the parent VirtIO-MMIO transport.
>>
>> Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
>> Assisted-by: LLM
>> ---
>>   .../bindings/display/msm/qcom,dcp-dsi.yaml         |  75 +++++++++++++
>>   .../bindings/display/msm/qcom,dcp-virtio.yaml      | 113 +++++++++++++++++++
>>   .../devicetree/bindings/display/msm/qcom,dcp.yaml  | 119 +++++++++++++++++++++
>>   3 files changed, 307 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,dcp-dsi.yaml b/Documentation/devicetree/bindings/display/msm/qcom,dcp-dsi.yaml
>> new file mode 100644
>> index 000000000000..f7178c66c09e
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/msm/qcom,dcp-dsi.yaml
>> @@ -0,0 +1,75 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/msm/qcom,dcp-dsi.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm DCP DSI host
>> +
>> +maintainers:
>> +  - Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
>> +
>> +description: |
>> +  A MIPI DSI host exposed by the Qualcomm DCP VirtIO device (see
>> +  qcom,dcp.yaml). DCP is a firmware protocol shared across multiple
>> +  Qualcomm SoCs, not specific to any one of them; Hawi is its first
>> +  platform. The DSI host and its connection to a panel are described
>> +  using the standard DSI controller and OF graph properties.
>> +
>> +allOf:
>> +  - $ref: /schemas/display/dsi-controller.yaml#
>> +
>> +properties:
>> +  reg:
>> +    maxItems: 1
>> +    description: Index of this DSI host among its siblings.
>> +
>> +  status: true
> I see slop, I finished here. Mind this maintainers summit words - if you
> use AI, you must use good one, not the shloppy slop.


Will remove this in v2.

Thanks

Jayant


> Best regards,
> Krzysztof
