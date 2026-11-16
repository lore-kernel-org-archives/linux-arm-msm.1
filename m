Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794852162;
	b=aacTdhsHNgLGnEvXPd8Srhz5raEL8AnHahWt/VPwhDqErx12jNkZN5Aor4Gr/HrwXIzT
	 f/lAcIecDZHQWuRG0k4Yvf/uayYsnlreg2U6gHJnKG1LY43y9vIDjppmaIkNGR2/wwEdq
	 t5048iQUljyIAv6M4e9AZFvNTcoWH/M0wKhvdLZiEuy99+9kV0k0P0Wywuvy1pKFwDeR8
	 6AR5q/2+6lfb6y9DMZM6ac/CrTjdn81zM0UwSqNtm9Kq2utOOKa6xF/tlU3EF59e6ETsh
	 r0jI8j59ib8tjWKhtyTZCYqIG2N75xzjqZbWkZQr/dv/yWsyhPtoqPqRKMcZLSYD6Eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794852162;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7H5gZDQnZLUnQwufsW/B7B2I+KRZ29ox1TdgnxIuLws=;
	b=ek7YGn8nJpvXBpqhFSLWNaHbMiDu5PJXbfVLbzfNKfRY9fHm81ZjzmmtV0FymKRDMI5T
	 qAA0JmKD/StXEfAbijIM0rDe9Iyn1Jn97fkYTL3gCEurdX6d8boUhlLU/avEZaLztKXAE
	 AjyqhhBvTHLXZtgL8Hck0vfKOP8tHq+vnZdWagYgswd/Qpb2TAdQ7prp3smhxvWYrMHKZ
	 EteQzZ0yryr+I8FGABRm/c1OcPEV/Zuo/M8CaxUkqIDqKOxyWboyCCGgxu02IEr0r69Df
	 pwlMCnY870k+l75XSLzuABidRXLgiQiocruYGCQFtfZxavs6dfu+O5I6yVd45tDr4aA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RboJqHis;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Vhd4b2+7;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B96F606A883
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 18:02:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B96F606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RboJqHis;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Vhd4b2+7
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGGK6RF3692958
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 18:02:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7H5gZDQnZLUnQwufsW/B7B2I
	+KRZ29ox1TdgnxIuLws=; b=RboJqHisBqVUiZ1AvmU46OU4UNBEEi6vareCc3oK
	elkrdUEaR+XsNuP5qbqSZsF3AezTZV3v1qcEMub5GnGMfWfWRTjSGztuQkUrCkWD
	8UYuula+I+Kl48mWQJAtCynHFFB9Ze8r1dLoRG2a5yusU5FNeCQczlViqJKEBHzC
	GAjYKzUX2+uSrV4l+DqbXUyMCdujkkXoIbsHhVC+4JPCCSeh6sDyidshWfAjlqmC
	h15fKEUp+LPjux+pAl7++1pLZQp0KyVB0Ug5yJFSqpICRsgEimodo0GDvYIIPiP8
	9iEzmOqCm5VKwCJ2P+yC6dWLCMew/6PxYXPt6AMTIAeivg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j01f81d3e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 18:02:35 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36ecd5db581so4425145eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 10:02:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794852154; x=1795456954; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7H5gZDQnZLUnQwufsW/B7B2I+KRZ29ox1TdgnxIuLws=;
        b=Vhd4b2+7dPOc18AQpBiC6F+VnXFRarszxmc+AbR8QXOpYswfotunWZHJLBMmHrQb7m
         QBSyRBwxStThYGs0xIwd/T94+LWJmBYakpEI7aTDwmaE8HSZMYTJv3WAMUp6gETRm3nY
         Xsd12ON26OsTme1f2Gkb4vmLYleEYmBZPu2RnhlxLzTu5ijBhfhLuys/2PiaSEMw83fj
         KzDLgBzFFABAmOPY6UjXAGXzc6pNyAnx5Z2S1ijxc54hsYYprzMXhEIXCwOylqW9lCEm
         YWyrJO2kQFoS+4myFOpfaxPe2pwBw0GJkOyfr4u3TmCZ2I/tuebifi3Lg9TlZITM7ai/
         LvKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794852154; x=1795456954;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7H5gZDQnZLUnQwufsW/B7B2I+KRZ29ox1TdgnxIuLws=;
        b=xAyZycY6bh36kRQ1wd5km67b0Vy3PH+AkUG5J9PmBgt8VNUx1zC3eC+gOZaeqB0DrA
         bPnrh+hY9MvgbEanOQwgCja8Mwco5wTiNjuqZlHZMDYZdAIE5VlSoanj7aafPVgI+O5a
         9lleWp9I2AwtVYXPoFRV9rKXnnOroQFhZHorg0FpmSkOu5dCZbz5KLNy0RxxqibN7X/W
         Uu4q94oC3YOcLhxlZY8ZDuPv9T9luVHuUctAihmlE8ccCijf+s/pY5r3d5Q04sSLn+MG
         koP901S7kU8/MVy+Yn/zUZMQHDq8VXjVphEdiIsyZf3NVDuajNIKbqriPXe4ZHVOnJWX
         Pl2Q==
X-Forwarded-Encrypted: i=1; AL+hErFPZ+0e6W88lRZeU4/X7L35k4jRLhsGpXprIYMsTUp/uKTLpVnLeVv5IE60ToR1afLayNyyBrUy1BSNChYL@vger.kernel.org
X-Gm-Message-State: APuU4Z+XjjdVWDVfsXdX6Lai6dSuXB9KlfqOj0hcUyHLFq85U8WpfNob
	chPYuK5MVb87dyOHEKF7hhwVr/10qVB9m03OipYcKMFcwTymxBZj8clclTTuRgmudLvZmP3I+HA
	+jVwkkKNS4DI9Cw0Z9sHZdiJ6t1fVWVeVbopelbHBdj2vVYH/f9QHbcSSOLK91C1lFupZ
X-Gm-Gg: AZFdTZfrRFSQ0q+/YjjPLr4YQK0zngd5LnaFeExeHtHM4sEA5ftHu4+2PaVgQbh7lHK
	8S1HoqvGQ0mu6Hal+MjAQf8HTgBqCDg5g+1JWMn+oFN74iwdTkQ0MCmM9KCezQEnjY+w+IwkA3k
	nASfz5R4rE3uK7X2vQEC0feEZvmHv9rPWYIftSu/PaKN3eXQqIV5b8IqyaMWYsjfVPjpVsht+w1
	rj3bSVZ9E2shAMBLL8+F3+2a1DP6leCGj44vxvkhWS9x99SQMfczOE4CcfIRZbeJBHJD0FdCcza
	C2NWXfGCF6UlBpLwQEHyvjCzznF9Y22gaddJTu63LaE3f5IvUcox4Ya1C/+gnt9hmLlOcM4f+Es
	1ZB5kaCd2FE4YPdjXTbHiniYajUpCxOGAPmixEZYgKhKjgd9SlcbTlF2pgvhqyqBiWupUnk3tY2
	+l
X-Received: by 2002:a05:7301:5086:b0:36a:5042:85b1 with SMTP id 5a478bee46e88-37963376ef2mr11357652eec.2.1794852153930;
        Mon, 16 Nov 2026 10:02:33 -0800 (PST)
X-Received: by 2002:a05:7301:5086:b0:36a:5042:85b1 with SMTP id 5a478bee46e88-37963376ef2mr11357595eec.2.1794852152910;
        Mon, 16 Nov 2026 10:02:32 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795533170csm36470150eec.7.2026.11.16.10.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 10:02:31 -0800 (PST)
Date: Mon, 16 Nov 2026 23:32:23 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: remoteproc: qcom: Add Glymur OOBMSS
 PAS
Message-ID: <20261116180223.qk2k4zabk6tp6ihx@hu-mojha-hyd.qualcomm.com>
References: <20261015-oob-support-glymur-v2-0-715435f52dd7@oss.qualcomm.com>
 <20261015-oob-support-glymur-v2-1-715435f52dd7@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015-oob-support-glymur-v2-1-715435f52dd7@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA3MSBTYWx0ZWRfX4ZK9DOy61O9u
 4iePb++BBNrfr8S3CMlUk+1RIBGMwpAC+9pvlfdLDlXk5grrwwLmf2H+8ZgsgQOoB9ItjBBmnAc
 WxHSSVYH/p7fHgKWfJ3yrFxQF8n2E+U9I1tXfjLhMdvve9+iM5R24PdcjnBKXfPdnDvdscEEW7J
 PBk19t3SASwz43M+N1yuUwJLJgOn4swKl95XhyUJRYpmHYkkdsJukhMqIylu4nKyo8hlepBRXeV
 5Jf0CgNhbkBuHzWtFHNRl3Mdmv214g9TL5WjUHRhMxCxR5a0laxr9wD5VG9YMxMZFGfhlWlUhlg
 /y+2yCkX8m1Q4gnXu+PnOu8WPRCzkRH0x8IgzAWdiQMWclW1DpMlP/a5WA2B73Plna0RvB1QuTh
 3Wivm1av466XqIJbePnjKItnjxRJnZwcY0sL+YpBp3UvTNFRuVVZectMvFBydJ8g7NTLW0GVGGl
 mBShuF4aVHQMHlnmrDA==
X-Proofpoint-GUID: yRcAiUavr3jrwsUan60-c6JRWsB0jch_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA3MSBTYWx0ZWRfX0wPTNflAuYt7
 1B4wDS/eU6haJ0xGS/JHPBs2SbR1ZBbqaIq1IY6T2TWyk0rK2ySsTJIOIjiCOw3bWpIQ6h/e89o
 LU4j+eXsYWsJSnZ53GK0zJ+9vo9fT+o=
X-Proofpoint-ORIG-GUID: yRcAiUavr3jrwsUan60-c6JRWsB0jch_
X-Authority-Analysis: v=2.4 cv=VMpIDNPX c=1 sm=1 tr=0 ts=6afb453b cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=ZE97AlTrE_lL4XMxLYgA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160071

On Thu, Oct 15, 2026 at 11:25:49AM +0530, Anvesh Jain P wrote:
> Document the Glymur OOBMSS PAS node with its secure GLink edge,
> shared-memory signaling, firmware carveouts, and power resources.
> 
> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> ---
>  .../remoteproc/qcom,glymur-oobmss-pas.yaml         | 154 +++++++++++++++++++++
>  1 file changed, 154 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,glymur-oobmss-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,glymur-oobmss-pas.yaml
> new file mode 100644
> index 000000000000..3aa96d2262f1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,glymur-oobmss-pas.yaml
> @@ -0,0 +1,154 @@
> +# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/remoteproc/qcom,glymur-oobmss-pas.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Glymur Out-of-Band Management Subsystem (OOBMSS) PAS
> +
> +maintainers:
> +  - Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> +
> +description: |
> +  Qualcomm Glymur Out-of-Band Management Subsystem (OOBMSS) contains two
> +  processors running Zephyr, managed together as one remoteproc instance.
> +  The Out-of-Band Trusted Execution Environment (OOB-TEE) is the primary
> +  processor. The OOB-Non-Secure processor is an auxiliary processor that
> +  depends on the primary processor and cannot function independently.
> +
> +  The primary processor runs the primary image, while the auxiliary
> +  processor runs the secondary image. Each processor has its own DTB.
> +  The two images and their DTBs have separate PAS identifiers for
> +  authentication and dedicated reserved-memory carveouts.
> +
> +  OOBMSS is booted by earlier-stage firmware and uses an XO clock and the
> +  CX and MX power domains. Shared Memory Point-to-Point (SMP2P) provides
> +  boot, shutdown, handover and ping/pong signaling, as well as fatal error
> +  notifications. The subsystem exposes a secure GLink edge to the host,
> +  with doorbell interrupts provided by the Inter-Processor Communication
> +  Controller (IPCC).
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,glymur-oobmss-pas
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    items:
> +      - description: Watchdog interrupt
> +      - description: Fatal interrupt
> +      - description: Ready interrupt
> +      - description: Handover interrupt
> +      - description: Stop acknowledge interrupt
> +      - description: Pong interrupt
> +
> +  interrupt-names:
> +    items:
> +      - const: wdog
> +      - const: fatal
> +      - const: ready
> +      - const: handover
> +      - const: stop-ack
> +      - const: pong
> +
> +  clocks:
> +    items:
> +      - description: XO clock
> +
> +  clock-names:
> +    items:
> +      - const: xo
> +
> +  power-domains:
> +    items:
> +      - description: CX power domain
> +      - description: MX power domain
> +
> +  power-domain-names:
> +    items:
> +      - const: cx
> +      - const: mx
> +
> +  memory-region:
> +    items:
> +      - description: Secure firmware carveout
> +      - description: Secure device tree carveout
> +      - description: Non-secure firmware carveout
> +      - description: Non-secure device tree carveout
> +
> +  firmware-name:
> +    items:
> +      - description: Secure firmware
> +      - description: Secure device tree firmware
> +      - description: Non-secure firmware
> +      - description: Non-secure device tree firmware
> +
> +  qcom,smem-states:
> +    minItems: 2
> +    description: States used by the AP to signal OOBMSS
> +
> +  qcom,smem-state-names:
> +    minItems: 2
> +    description: The names of the state bits used for SMP2P output
> +
> +required:
> +  - compatible
> +  - reg
> +  - power-domains
> +  - power-domain-names
> +  - memory-region
> +
> +allOf:
> +  - $ref: /schemas/remoteproc/qcom,pas-common.yaml#
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
> +
> +    remoteproc@1f000000 {
> +        compatible = "qcom,glymur-oobmss-pas";
> +        reg = <0x1f000000 0x30000>;
> +
> +        interrupts-extended = <&intc GIC_SPI 86 IRQ_TYPE_EDGE_RISING>,
> +                              <&smp2p_oobmss_in 0 IRQ_TYPE_EDGE_RISING>,
> +                              <&smp2p_oobmss_in 1 IRQ_TYPE_EDGE_RISING>,
> +                              <&smp2p_oobmss_in 2 IRQ_TYPE_EDGE_RISING>,
> +                              <&smp2p_oobmss_in 3 IRQ_TYPE_EDGE_RISING>,
> +                              <&smp2p_oobmss_in 9 IRQ_TYPE_EDGE_RISING>;
> +        interrupt-names = "wdog", "fatal", "ready", "handover", "stop-ack", "pong";
> +
> +        clocks = <&rpmhcc RPMH_CXO_CLK>;
> +        clock-names = "xo";
> +        power-domains = <&rpmhpd RPMHPD_CX>,
> +                        <&rpmhpd RPMHPD_MX>;
> +        power-domain-names = "cx", "mx";
> +
> +        memory-region = <&oob_secure_mem>, <&oobdtbqc_mem>,
> +                        <&oob_nonsecure_mem>, <&oobdtboem_mem>;
> +        firmware-name = "qcom/glymur/oobmss_tee.mbn",
> +                        "qcom/glymur/oobmss_qc_dtb.mbn",
> +                        "qcom/glymur/oobmss_ns.mbn",
> +                        "qcom/glymur/oobmss_oem_dtb.mbn";
> +        qcom,smem-states = <&smp2p_oobmss_out 1>,
                                                 ^
Normally, it is                                  0 ?

is it different here ?

> +                           <&smp2p_oobmss_out 8>;
> +        qcom,smem-state-names = "stop", "ping";
> +
> +        glink-edge {
> +            interrupts-extended = <&ipcc 56
> +                                         IPCC_MPROC_SIGNAL_GLINK_QMP
> +                                         IRQ_TYPE_EDGE_RISING>;
> +            mboxes = <&ipcc 56 IPCC_MPROC_SIGNAL_GLINK_QMP>;
> +            label = "oobmss";
> +            qcom,remote-pid = <20>;
> +        };
> +
> +    };
> 


-Mukesh

-- 
-Mukesh Ojha
