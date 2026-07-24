Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9EF37204A
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 12:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784895567; cv=none; b=bDBHavmNicVU0LKFqVIokDWBdAn8AMwiy7csiBe8/jBd/eDLzoLHWsZIJxwMuA/qAwtZyEM06fBWW8TRSS2gO71XXBKKW2/nZaukNUwmzIYlMFqmAiN9lUz3cuq12bdH8XIh84swXK8BHC8llNC7MzMSvA5qq4DCN6yFwMFJhZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784895567; c=relaxed/simple;
	bh=hdOPs4e+5gEq2NTHhTotVnUSWG0HZXdm18O6hz1wWQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DS8Wlmk4glBUcFDJrZ81+FARkz1wKDr4I5sEaYwBzJUFl1a8rg0+nSM0MdhcNd+5jOB77hFGcqhfU/ADCmbFPGzZesIxYl+/K4srexr7oONptzJ8MDvFxxuNxSP4YU5yEfDQMNncKB6c0m5Me8RnrwIpqnGaEy7g1Qgc0UHI59c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BQpqW4t3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F1z2VO1R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BQpqW4t3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F1z2VO1R"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OADrvI2742614
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 12:19:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=B7KdEphz0j0cMMYZkSRPqY7M
	aSr6YFxDvjx2kGx481A=; b=BQpqW4t3MZKyXVmNVh3f9UNpfhOk3BHnv4rkYaSt
	LLLx3QkU3+k8tmRV8c6+q3zphB1Ol91xhq6BnBujJLkxzEbWQRkiZEI7f4+NJdS4
	2u0hPSrhIXFapAJhYqc123gCk6eLa3Z/SufOX4IBEijzgr5KEaChuzJJOd2dSXjx
	CxQ5rlPwJ9FOn6Pwvtxt1/PcPi30f42D/ieaTwOJafg5ZemJh0Kjn4CN5bSPRzYl
	pWyHn9tE8tGJ4ony9R42mkaG/3kZyBVXk/dnoYXY24ndBuPrtuD47YDrIlsmxIQ8
	YvvydMmKd7QZiGfrwybgTATZApU7015XTkmmcMe9Nh2ImA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm0p51q9m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 12:19:24 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc6dd43737so7564935ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 05:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784895563; x=1785500363; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B7KdEphz0j0cMMYZkSRPqY7MaSr6YFxDvjx2kGx481A=;
        b=F1z2VO1RJn4tmMEvE3qBzYgmayL98VfQRn3aEYKEp1ZDxjNpGThwfENcqahd7J2A0q
         jOQYhUkOxToCz/hWPeo9oD36u4LrY3Xp+KVfsKb47eTDUtPLZLsgzaG5jQL/nbWERseI
         IYjFsNjSQAQ3perk2DAO0EzbuoHTxY0k1Vl4xIeLxweCu7EEm+LjYbfXZKx96ySZ8TwE
         ThZNiMrNxXYnz5uJ2sn5CHm++TPAlZ49nADStX77048dLBhc452KPEm+NVT32iZUaJav
         ZOSgj2DJZZoXLXRokSAh+kNdg8/Ibj8hvma7/EiHlaKETRIsWVhKGgrEzN/t8OiWTEKP
         aiEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784895563; x=1785500363;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B7KdEphz0j0cMMYZkSRPqY7MaSr6YFxDvjx2kGx481A=;
        b=VG88jHaz/WQLeu3en+duegeFVH172lCB5pjcU3JZAb46Iwdnox+TP86oo7pgtnySoi
         8uAbGiyoOp60ZZtFXtI6d3lJal5B3Jpoe0ua8660+Bq0mazabPOja5Hp1mXZMzUR2iVl
         LeBvybI5o5vXF2PjII3zBauSz4O5YuHpiuTSOEOLQl1LzqoEWUAdugq4FCXWwKdbZT3h
         BapU+8brs7z3kN9C0PbRpl5vocEFXjWXMh44E+W5ts66TZ+ksaJQN06WF8r3Pci9Z2r2
         m15tpLWI2eWDzbgFDQ18v/79CNUctcxltVTkmaf3ljkUJxtCYjm/xFopYi+rgu4OxGZZ
         Q7bQ==
X-Forwarded-Encrypted: i=1; AHgh+RrGSWrfuKzH1QNh9/tOMyR2Da5EgdvT+mepaG7cVZZmexUpSTFnLfnhYGygERiHcDYimXL1n9VYXNzqLPnh@vger.kernel.org
X-Gm-Message-State: AOJu0YyfCoWTUmc7L6u3R8qIOknyES+urhvx8M7Q07oYbbvLX1HlYIYQ
	kMCCpbiypT9Y3UY3KKwA9IEkYIXsUbuoijDWF4EV/IzQ1W8xuiw24cubGuoVq9KYKVPFr9WlcR3
	igSrxVTANFRECl35WSrn8iQiJnlu8jPnXjDkFrCcz7rISroMe1D6ibLhfS4xvFowjw4Cq
X-Gm-Gg: AR+sD11TvsCp5to0gx2koDMYrGSp++oQ4OZgkWPMhq6T8QwlK41soI4bp0Su6JRmKHq
	fz9AeE3g/B+W4JMvw657XdicaLt0F3KrF9L9cAAacizlj+udZS8ijVHqu6PfIjWoyOHxTNtCpdK
	n7HIQAO43IONH29Yax51FMT8cQWuxfjzQneWWpj4GYu0jeh5rkkycTZiKPP/knOrohJxegUDkp4
	8WsN6rmFhetmeV4H5TlMOaXhfE/63Y81GVpdery0zX04utyznY+DS87+l27nwvq+CyPqTewm11v
	sxd8DbpPt8WmrIRkalh6HJb69jV9UIqX7gTYrngVl25KGF54w8cb8HH2s3jdY/UG1vxfcSzAdpR
	tgb0l9JyJDTlS6hVozNK60FOY2hx6y4eJrVTQ8XhOX5Y=
X-Received: by 2002:a17:90b:586c:b0:38e:7446:d2b8 with SMTP id 98e67ed59e1d1-38ec6890685mr7895015a91.41.1784895563180;
        Fri, 24 Jul 2026 05:19:23 -0700 (PDT)
X-Received: by 2002:a17:90b:586c:b0:38e:7446:d2b8 with SMTP id 98e67ed59e1d1-38ec6890685mr7894978a91.41.1784895562731;
        Fri, 24 Jul 2026 05:19:22 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d13014d27sm26626295c88.4.2026.07.24.05.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 05:19:22 -0700 (PDT)
Date: Fri, 24 Jul 2026 20:19:16 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: remoteproc: qcom,nord-pas: Document
 Nord PAS
Message-ID: <amNYRMIkmf2hfYXV@QCOM-aGQu4IUr3Y>
References: <20260724103848.233804-1-shengchao.guo@oss.qualcomm.com>
 <20260724103848.233804-3-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260724103848.233804-3-shengchao.guo@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Pq6jqQM3 c=1 sm=1 tr=0 ts=6a63584c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=PhCFR9l94pDFD3z7aeYA:9 a=CjuIK1q_8ugA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: WkDlf2am6wVXotXk43952OXGplPX2lGS
X-Proofpoint-ORIG-GUID: WkDlf2am6wVXotXk43952OXGplPX2lGS
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDExMSBTYWx0ZWRfX7eTKpRhmw+FC
 SjAMF9GqJ4+0dsX0FteWTc0P9P+z79V1o1xI1fmbe4gocbRPpmpQa1OmW9Lzx48qHSrzQlyD4nx
 z2EFkbwaqm5f0KzZ39fpdAqt2diFRrY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDExMSBTYWx0ZWRfX9wXoqscCoaEh
 0s60eEsMYcnGWsrHCtzMpLC6jNGfTz8bkwvbO3ZfcWbS3rMXfz/taG+ILJAA/qHrw5mkZr/721/
 ZX2HU3hFiFE9lPECYTCkgd4Wq8f1JQo5Scu7inwHSO+6i5+kPrwLxskfIVCnHHPvhNY1ZMpcFze
 pmK+2t1e3HtJXroqor7DMcnjKXV9IgM4iUUAd5Smy8w95CkundO95IdG5Um9GPafHP8SB1XkQz5
 /UP4Bu6+zD1BU7SOs2tcAbdDZoMxqJS9l1hZnphkGo8ecASt+K+S+uPvvu9BL+QwZvJLYWdz+1A
 qV4PQ2LEjLvUaRVI6Q/tC9Yckq/0X7KT7+EI/2/1Kbs4e6Ty6dWR+srZ8wmJpqK55vaFaCJRZc0
 QMu78qIA056X/G9ESOaqmtXhp5ucbmtm+2ybY3kMiXMmzSYLCNMrkr2sdNhOkd0Phvsf7h3Aqnt
 UKZBbjylVE7aGerCPpA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240111

On Fri, Jul 24, 2026 at 06:38:47PM +0800, Shawn Guo wrote:
> Add a dedicated binding for the Qualcomm Nord SoC PAS devices: ADSP
> and CDSPs. Nord ADSP uses CX and MX power domains while the CDSPs
> add an NSP domain on top of that.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  .../bindings/remoteproc/qcom,nord-pas.yaml    | 167 ++++++++++++++++++
>  1 file changed, 167 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,nord-pas.yaml
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,nord-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,nord-pas.yaml
> new file mode 100644
> index 000000000000..c1d60ca6c63c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,nord-pas.yaml
> @@ -0,0 +1,167 @@
> +# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/remoteproc/qcom,nord-pas.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Nord SoC Peripheral Authentication Service
> +
> +maintainers:
> +  - Shawn Guo <shengchao.guo@oss.qualcomm.com>
> +
> +description:
> +  Qualcomm Nord SoC Peripheral Authentication Service loads and boots firmware
> +  on the Qualcomm DSP Hexagon cores.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,nord-adsp-pas
> +      - qcom,nord-cdsp0-pas
> +      - qcom,nord-cdsp1-pas
> +      - qcom,nord-cdsp2-pas
> +      - qcom,nord-cdsp3-pas
> +
> +  power-domains:
> +    minItems: 2
> +    items:
> +      - description: CX power domain
> +      - description: MX power domain
> +      - description: NSP power domain
> +
> +  power-domain-names:
> +    minItems: 2
> +    items:
> +      - const: cx
> +      - const: mx
> +      - const: nsp
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: XO clock
> +
> +  clock-names:
> +    items:
> +      - const: xo
> +
> +  qcom,qmp:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: Reference to the AOSS side-channel message RAM.
> +
> +  smd-edge: false
> +
> +  firmware-name:
> +    items:
> +      - description: Firmware name of the Hexagon core
> +      - description: Firmware name of the Hexagon Devicetree
> +
> +  memory-region:
> +    items:
> +      - description: Memory region for main Firmware authentication
> +      - description: Memory region for Devicetree Firmware authentication
> +
> +  interrupts:
> +    items:
> +      - description: Watchdog interrupt
> +      - description: Fatal interrupt
> +      - description: Ready interrupt
> +      - description: Handover interrupt
> +      - description: Stop acknowledge interrupt
> +      - description: Shutdown acknowledge interrupt
> +
> +  interrupt-names:
> +    items:
> +      - const: wdog
> +      - const: fatal
> +      - const: ready
> +      - const: handover
> +      - const: stop-ack
> +      - const: shutdown-ack
> +
> +  qcom,smem-states:
> +    maxItems: 1
> +    description: States used by the AP to signal the Hexagon core
> +
> +  qcom,smem-state-names:
> +    maxItems: 1
> +    description: The names of the state bits used for SMP2P output
> +
> +required:
> +  - compatible
> +  - reg
> +  - memory-region
> +
> +allOf:
> +  - $ref: /schemas/remoteproc/qcom,pas-common.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - qcom,nord-adsp-pas
> +    then:
> +      properties:
> +        power-domains:
> +          maxItems: 2
> +        power-domain-names:
> +          maxItems: 2

Sashiko had a valid comment on this.  Since the global power-domains
property defines minItems: 2, this will allow CDSP variants to incorrectly
pass schema validation if they omit the NSP power domain.

I will fix it.

Shawn

> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,rpmh.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/mailbox/qcom-ipcc.h>
> +    #include <dt-bindings/power/qcom,rpmhpd.h>
> +    #define IPCC_MPROC_ADSP0
> +
> +    remoteproc@4c00000 {
> +        compatible = "qcom,nord-adsp-pas";
> +        reg = <0x04c00000 0x10000>;
> +
> +        clocks = <&rpmhcc RPMH_CXO_CLK>;
> +        clock-names = "xo";
> +
> +        interrupts-extended = <&intc GIC_SPI 159 IRQ_TYPE_EDGE_RISING>,
> +                              <&smp2p_adsp_in 0 IRQ_TYPE_EDGE_RISING>,
> +                              <&smp2p_adsp_in 1 IRQ_TYPE_EDGE_RISING>,
> +                              <&smp2p_adsp_in 2 IRQ_TYPE_EDGE_RISING>,
> +                              <&smp2p_adsp_in 3 IRQ_TYPE_EDGE_RISING>,
> +                              <&smp2p_adsp_in 7 IRQ_TYPE_EDGE_RISING>;
> +        interrupt-names = "wdog",
> +                          "fatal",
> +                          "ready",
> +                          "handover",
> +                          "stop-ack",
> +                          "shutdown-ack";
> +
> +        memory-region = <&hpass_dsp0_mem>, <&hpass_dsp0_dtb_mem>;
> +
> +        firmware-name = "qcom/nord/adsp.mbn",
> +                        "qcom/nord/adsp_dtb.mbn";
> +
> +        power-domains = <&rpmhpd RPMHPD_CX>,
> +                        <&rpmhpd RPMHPD_MX>;
> +        power-domain-names = "cx",
> +                             "mx";
> +
> +        qcom,qmp = <&aoss_qmp>;
> +        qcom,smem-states = <&smp2p_adsp_out 0>;
> +        qcom,smem-state-names = "stop";
> +
> +        glink-edge {
> +            interrupts-extended = <&ipcc IPCC_MPROC_ADSP0
> +                                         IPCC_MPROC_SIGNAL_GLINK_QMP
> +                                         IRQ_TYPE_EDGE_RISING>;
> +            mboxes = <&ipcc IPCC_MPROC_ADSP0 IPCC_MPROC_SIGNAL_GLINK_QMP>;
> +
> +            label = "adsp";
> +            qcom,remote-pid = <2>;
> +
> +            /* ... */
> +        };
> +    };
> -- 
> 2.43.0
> 
