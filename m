Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795775792;
	b=Ccmw131jNJcPXpjF/k0z4TD8GEK1OgSCz2EcFoUGv9agRKxisLRH9OTl0w1GMypod/sk
	 AQbKd1xizgtA0aZuaD+Weq6FUbgE87gDdmfcqfe8GpXffKESYkOSzslw6MqfErMwSkz4P
	 mkHkyGvTb3XecMfsyXUWw+ZuP+V3oIx6e3sRr96hra1Z1QZLxr06NktJn/dxzBd41N5vH
	 MFCk1SMnCBL0z7p1HCcr3zNkiaIoaiQx7mle8fI6tQOh3niexskvcOYjgex7vlRSvi2wE
	 UsMZB/M0+X20JPupkujqTJOjurjKVlXP6uvqtF56pZQPGMrO4zwlJKlXgEWegFCAlMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795775792;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:Content-Language:To:Cc:
	 References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=AxT6ErZcxtbn4jfQ1enHPgny/7wYHTfvzRYz44rVvFc=;
	b=pfCTypZkhQfYcbAOFZPaGLRYhpCICTV00RkHKRgi7VIPb06MYyHm03MUcj/iU/+m65X5
	 kx72GAw+0x19XtPiP0SWVHD4KTeXFHCKxSPfYKu2DfNXocZmVlqTZ9BYNzYV6mh8wTWpN
	 pWPCLRy6Qd1vKOp7Ly+T2sjy3F4YOxPYUc6f0/a/uw2jPDRA+pf51iJXiFwX/CJ0FdC/m
	 h7iU3bogIcqS9mLf5i9JRLlOnrLGUTE4Bb5YEtPEO7dXof8INS6WcEJbUzWj0/33B//Gv
	 mgKxqxpASq0kgoh7dVp4NRhohlSOmtIy2Q5v6TU+Zuxdr3W9tCQfCfGhVBikNW7yFyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Zr6JrZ8w;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GeFm1eD4;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6866A606A32D
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 10:36:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6866A606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Zr6JrZ8w;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GeFm1eD4
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7GInt1779838
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 10:36:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AxT6ErZcxtbn4jfQ1enHPgny/7wYHTfvzRYz44rVvFc=; b=Zr6JrZ8wY3roZmwe
	s4W71jwJW3R480YYLmwc69i0L73xBVVP4F9RfmmAYRFeTLZs5kGd0p4FCZFKp2O0
	GWvhGbbbqHUBrwb2vsZjKFhATCbRRU8AViNQLPNbV8p6DPqFJ4H3qy9nlO79JN8H
	EeT2nWktbC+GBD4QZJwLgTkqcUOfrpjXzoc3G6imrVNuYyzL5iWht9LxcuY+SpUT
	GkzqTIT0zy1JFwLF0uVsmYdJL8kpRVy0WNRlxxfLBtFuE9u+rikWE5LrL056RdUJ
	qOwkv8dDFZ1qc3ejIWWtCGzVtvNm6YbM1TMz04LjPKUPJaT9/0tXho4T/w+ptxPa
	G70mpQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j73uhh6wd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 10:36:31 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1b55f4f3bb8so4747516c88.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 02:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795775791; x=1796380591; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AxT6ErZcxtbn4jfQ1enHPgny/7wYHTfvzRYz44rVvFc=;
        b=GeFm1eD4sroM/I8MtibdlGPCZn07QWhXaZQ5rGWyhW898HhZfupAGQglX62QqkDgvK
         Fq/VdSD+oxXk/aavL1jx5xEr9YcOmL+uMldST/kZXy6sotTdhIKKG+6aICSrRIa1rxAi
         l7yQajt0xggL98q1hIiVPD59LVZ/dJCx04x2HiQjmnGp9F0Y2CECbvKLRJUqDvASPJyB
         k3INmt6SJ9TVd+g46hpwTkk42q06KtH8NutLGFqUP1zN4nErv1LE5BVmr89LsQmLKEP+
         dS3AE554gwDKYtFi9OcLGuJz0AYHJ29ScVvh5yOB/BApmbtCKyveGrmOQZpZ1MzLOYOc
         3DMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795775791; x=1796380591;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AxT6ErZcxtbn4jfQ1enHPgny/7wYHTfvzRYz44rVvFc=;
        b=GgezV+dYSSxEpjaGZc+YrinmXXJ2u3YnLbAQQnVRXVf8VkxMqNKOnKVxyTfYZ2JVtW
         592vvCEp65cwCD3x69wWGvBLVRIHC5XDTRj1hOa0jyvOF8LCTASTRJG1KVjpdnYSo5GS
         h3nt8jI1yXYH4pezdviZf9tKHF/osES6NMgmffgTWv4wPqbgpoisX6nl/+3jw/i/eHuZ
         5zTtQJVxlKDJbvKtoUrvRaalnrZOKWpFOlmiDJ60hfJAcC/2kq/BhqiRqInfaZBEdWUl
         BLYTpckwmBnsV2o7pLruUwp372Xo4oOsk2v580beq1cuGoII/tNg2TsHH9Bx2ip0InKt
         6zTw==
X-Forwarded-Encrypted: i=1; AL+hErGZwCwDxyFKRFU7DFExXvQWlDzcaj9y38Yb8rHn2b+NOfza7JUBxpf+l2MOzzEOVNNdW+4M+A8dWO6AmHav@vger.kernel.org
X-Gm-Message-State: APuU4Z8foJ2ibG4ZNOZNzqVRaFz0mZ0Yb5CSe9nP12fkPnvui9G9NkBv
	1cCwm1lxOckWAMZ655DrGo5xGdESFxEGmz+5rWKt3a0w9Hg+VwnSVPrY68t9G1pv5gaKHs8Vr5k
	JmVL+9HBTGDJ9PUNzsWXmN3Ws6vC2vgnowkaRNpW4YDhyJGi+k/0SaWaQWUrrdzdz9Xcb
X-Gm-Gg: AZFdTZc0lf7qe9Y8OY+AoZm5JV0czLIUDdMzpoQ5Gnadq0ZG8NQbZ1V1UdfhfWb3kZw
	IXsaLaYZaPjx94TElVeYCdTuAyZBVzIAlUWGsQ0/ZmRtWdSw5ZeHUpzC0QCD6dw5rCJXNh5IlpP
	ukmES8B1fNvLFf989QmGyxyvl76mp4R1OCJoappaKw26Zt+ON1KBW8We9UBcm3FeuwzNt7OlpKi
	yYIcFXsGtWycaDFGq2Sr+NqJ+2cjeR6mYvFd/9PLfMTWrRXa93UjXKcfkhrb0gFevRcFf1fcMYm
	kqC3wvzHQyxHmfO5JPo5jsQPmdnuZWQRfjKNxYcJZhb3R6vJWA/L0VkHF/ZzETroc4Nk0wCp708
	DDZ7O1IAW03M0lR3LMDr1PdDjqtxTrbdFkoXkBuznfUoU/qAhCPkFfZTr4BTuTwTcGCSz5gKNDp
	FSzX5p
X-Received: by 2002:a05:701b:42c4:20b0:1b3:aa92:b183 with SMTP id a92af1059eb24-1b556898c1bmr24211413c88.15.1795775790768;
        Fri, 27 Nov 2026 02:36:30 -0800 (PST)
X-Received: by 2002:a05:701b:42c4:20b0:1b3:aa92:b183 with SMTP id a92af1059eb24-1b556898c1bmr24211376c88.15.1795775790126;
        Fri, 27 Nov 2026 02:36:30 -0800 (PST)
Received: from [10.204.100.41] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556829d31sm92427615c88.9.2026.11.27.02.36.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 02:36:29 -0800 (PST)
Message-ID: <ef6b1405-8354-a6a6-2c5f-344449fd4492@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 16:06:23 +0530
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 1/3] dt-bindings: media: qcom,mahua-iris: Add Mahua
 video codec
Content-Language: en-US
To: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
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
References: <20261123-mahua_iris_enable-v2-0-b1a16b16afca@oss.qualcomm.com>
 <20261123-mahua_iris_enable-v2-1-b1a16b16afca@oss.qualcomm.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20261123-mahua_iris_enable-v2-1-b1a16b16afca@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0MiBTYWx0ZWRfXxyFZFi4uKuAC
 jvKruektKDOV++Fm9gmLp0hL67ThVjRrnXPfTyeyrxonTYkQwEk6K/cWjbMmx67o/PRQRjK0m85
 zNYDMxWaxTvkc8KqJh3y7JGdKSGnBb0=
X-Proofpoint-ORIG-GUID: 4M3LLCAxmdsOjp_B6Ms46PgPwSlkIeJ2
X-Proofpoint-GUID: 4M3LLCAxmdsOjp_B6Ms46PgPwSlkIeJ2
X-Authority-Analysis: v=2.4 cv=BbBNQbt2 c=1 sm=1 tr=0 ts=6b095d2f cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=9jCxr5-6HRLit5GijAoA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0MiBTYWx0ZWRfX9EwZ6gvhRjOS
 NeNtyEqh279azOSSQAIX8xOWghKm9gRDhYGkksx8LwqkPVWI1fMUSq6BpBIMKyoMvJ9PLuyUwmF
 3M0qqN88fuvfEc+NVKoiYKsUYcw0tA+a9z3aXTN9zqMl7PV3Z1R9F9vlEu9vYyeSMuI4AbnPgKd
 2DJw7V52arQ4QblVIUkXEvDrfix1jqCs6VHgDmPYymv4rvqyLKpRpf7XWqdkdLR5B5a/qcazjN7
 ypCSjgPEsUM0Hurd7YS6Ty5v6RLkMC+p/1fYJ80tGNMZs1mHCC0/ODRs+VY7WlkrZt77SCFGllG
 FBrvyMF1cGMsnsM/iuepNsM787on5D9t/fn1YFWh9mMCTvffsTEkhMV20/Zspj8RO8Fry0makrt
 mUrIhoW0axBALJRIXBj8UqjvBhuKxvmfp6gQiM/Ip0GbHk+m8IzyqHkewfS2odQy048uzbW/Sc/
 pJxhfX/LluxtC0p+cIw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270042


On 11/24/2026 12:14 PM, Deepa Guthyappa Madivalara wrote:
> Add a devicetree binding for the Iris3.9 video encoder and decoder block
> found on the Qualcomm Mahua SoC. This is a single core derivative,
> leveraging most of Glymur data with the clks, resets present only
> for vcodec0 core.
>
> Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/media/qcom,mahua-iris.yaml | 200 +++++++++++++++++++++
>  1 file changed, 200 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/media/qcom,mahua-iris.yaml b/Documentation/devicetree/bindings/media/qcom,mahua-iris.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..5a96fd4ea08422daf3eb0fa832a75a4994e86ffa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,mahua-iris.yaml
> @@ -0,0 +1,200 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,mahua-iris.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Mahua SoC Iris video encoder and decoder
> +
> +maintainers:
> +  - Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> +
> +description:
> +  The Iris video processing unit on Qualcomm Mahua SoC is a video encode and
> +  decode accelerator.
> +
> +properties:
> +  compatible:
> +    const: qcom,mahua-iris
> +
> +  clocks:
> +    maxItems: 6
> +
> +  clock-names:
> +    items:
> +      - const: core_iface
> +      - const: core
> +      - const: vcodec0_core
> +      - const: vcodec0_iface
> +      - const: core_freerun
> +      - const: vcodec0_core_freerun
> +
> +  dma-coherent: true
> +
> +  interconnects:
> +    maxItems: 2
> +
> +  interconnect-names:
> +    items:
> +      - const: cpu-cfg
> +      - const: video-mem
> +
> +  non-pixel:
> +    type: object
> +    properties:
> +      iommus:
> +        maxItems: 3
> +
> +  operating-points-v2: true
> +  opp-table:
> +    type: object
> +
> +  power-domains:
> +    maxItems: 4
> +
> +  power-domain-names:
> +    items:
> +      - const: venus
> +      - const: vcodec0
> +      - const: mxc
> +      - const: mmcx
> +
> +  resets:
> +    maxItems: 4
> +
> +  reset-names:
> +    items:
> +      - const: core_bus
> +      - const: vcodec0_bus
> +      - const: core
> +      - const: vcodec0_core
> +
> +required:
> +  - clocks
> +  - clock-names
> +  - compatible
> +  - dma-coherent
> +  - interconnects
> +  - interconnect-names
> +  - power-domains
> +  - power-domain-names
> +  - resets
> +  - reset-names

clocks, clock-names and power-domain can be dropped from required list as
this can be already present in required list in qcom,venus-common.yaml which
this schema is $ref.

> +
> +allOf:
> +  - $ref: qcom,venus-common.yaml#
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/qcom,rpmhpd.h>
> +
> +    video-codec@aa00000 {
> +        compatible = "qcom,mahua-iris";
> +        reg = <0x0aa00000 0xf0000>;
> +
> +        clocks = <&gcc_video_axi0c_clk>,
> +                 <&videocc_mvs0c_clk>,
> +                 <&videocc_mvs0_clk>,
> +                 <&gcc_video_axi0_clk>,
> +                 <&videocc_mvs0c_freerun_clk>,
> +                 <&videocc_mvs0_freerun_clk>;
> +        clock-names = "core_iface",
> +                      "core",
> +                      "vcodec0_core",
> +                      "vcodec0_iface",
> +                      "core_freerun",
> +                      "vcodec0_core_freerun";
> +
> +        dma-coherent;
> +
> +        interconnects = <&hsc_noc_master_appss_proc &config_noc_slave_venus_cfg>,
> +                        <&mmss_noc_master_video &mc_virt_slave_ebi1>;
> +        interconnect-names = "cpu-cfg",
> +                             "video-mem";
> +
> +        interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> +
> +        memory-region = <&video_mem>;
> +
> +        operating-points-v2 = <&iris_opp_table>;
> +
> +        power-domains = <&videocc_mvs0c_gdsc>,
> +                        <&videocc_mvs0_gdsc>,
> +                        <&rpmhpd RPMHPD_MXC>,
> +                        <&rpmhpd RPMHPD_MMCX>;
> +        power-domain-names = "venus",
> +                             "vcodec0",
> +                             "mxc",
> +                             "mmcx";
> +
> +        resets = <&gcc_video_axi0c_clk_ares>,
> +                 <&gcc_video_axi0_clk_ares>,
> +                 <&videocc_mvs0c_freerun_clk_ares>,
> +                 <&videocc_mvs0_freerun_clk_ares>;
> +        reset-names = "core_bus",
> +                      "vcodec0_bus",
> +                      "core",
> +                      "vcodec0_core";
> +
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        dma-ranges = <0x0 0x0 0xffe00000>;
> +
> +        non-pixel {
> +            iommus = <&apps_smmu 0x1940 0x0000>,
> +                     <&apps_smmu 0x1944 0x0000>,
> +                     <&apps_smmu 0x19e0 0x0000>;
> +            iommu-ranges = <0x25800000 0xda600000>;
> +        };
> +
> +        pixel {
> +            iommus = <&apps_smmu 0x1943 0x0000>;
> +        };
> +
> +        video-firmware {
> +            iommus = <&apps_smmu 0x19e2 0x0000>;
> +        };
> +
> +        iris_opp_table: opp-table {
> +            compatible = "operating-points-v2";
> +
> +            opp-240000000 {
> +                opp-hz = /bits/ 64 <240000000 360000000>;
> +                required-opps = <&rpmhpd_opp_svs>,
> +                                <&rpmhpd_opp_low_svs>;
> +            };
> +
> +            opp-338000000 {
> +                opp-hz = /bits/ 64 <338000000 507000000>;
> +                required-opps = <&rpmhpd_opp_svs>,
> +                                <&rpmhpd_opp_svs>;
> +            };
> +
> +            opp-366000000 {
> +                opp-hz = /bits/ 64 <366000000 549000000>;
> +                required-opps = <&rpmhpd_opp_svs_l1>,
> +                                <&rpmhpd_opp_svs_l1>;
> +            };
> +
> +            opp-444000000 {
> +                opp-hz = /bits/ 64 <444000000 666000000>;
> +                required-opps = <&rpmhpd_opp_svs_l1>,
> +                                <&rpmhpd_opp_nom>;
> +            };
> +
> +            opp-533333334 {
> +                opp-hz = /bits/ 64 <533333334 800000000>;
> +                required-opps = <&rpmhpd_opp_svs_l1>,
> +                                <&rpmhpd_opp_turbo>;
> +            };
> +
> +            opp-655000000 {
> +                opp-hz = /bits/ 64 <655000000 982000000>;
> +                required-opps = <&rpmhpd_opp_nom>,
> +                                <&rpmhpd_opp_turbo_l1>;
> +            };
> +        };
> +    };
>
