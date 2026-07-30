Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE6533438F
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 15:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785425996; cv=none; b=MvHg4orwG/nlrW+Ee25g+L9vDiAQFJ/nZM0/wSB2kAHI9AZcz+CcfRJRlZqlYkHlQoa+buy1Fgu1T094TDcZbpCgf4wbEZv3SiD6Ajb1ORmPjIgkmbFlIUUAVwwSHJIsKoSai4JJUYDzqMeLnXnPXhsUO3d3aq+7Ou2sYUahBis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785425996; c=relaxed/simple;
	bh=gPtLqOdjJYrtxJtyBeb0+7ugCf09osdrZohv1qNSs7g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jrPDrmDk6YD56IS5R9sRfrY4tKHV5d9JqCE6Xt3LxSoS77WocD4+pHpm5SHfJyp3pWKoHUIYJ1u+4/A8o5cdpzr/gliD2QqNGSQFNVB2Iy8X3kE7qcG4i1N80wU48Iqul7RnocW8tRImrdS8c4kGfbwDkwB9zOFcriOXz8fg5zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T5J2q5xw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iRJa/j1q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T5J2q5xw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iRJa/j1q"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UFQjFP1414023
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 15:39:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3NATPyl9EF1MFAAgPEVj1qlE
	fNz3DMx7Yme+KQx5q1c=; b=T5J2q5xw44ld2jueITsqPaD6LQ6GECVfbFnr06aI
	+OSsA5GpPsYvosQHc6QQgVwhh1qZEFWbOHAh4YFDdYr8f6icVQeJFd3gT/HTAg8P
	y4uJtAC6SaEDrnPL51Sr3yQJS80TaKUUs6S4jXDKuIGPElaDazm017lFqwJq9SbJ
	YivGFgH883qMKuJb9t9tJqfe/J0+yW5l9UAoUcH8EEwCZPE6BwEpsaNtvFfbFTSO
	RtBMfbSAY4PsHDM8eterVvxBb3dFD96Dq/tYUnTiUVVYV3xBbQkFXT1LNMw1FexT
	LjThxI02YI63F7tORhX8MyqjaVL4+tB5L2Zt9gdh+Ml7lQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr891ger3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 15:39:54 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c01ff996dso25191381cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 08:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785425993; x=1786030793; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3NATPyl9EF1MFAAgPEVj1qlEfNz3DMx7Yme+KQx5q1c=;
        b=iRJa/j1qsfYYvJn4GmPlsn30lN7/DmhDIiMpYcD6NQo31WlxtvY7M8Poa+1P6A/TRe
         XJTmZTGB0lVcYlwya/2gflGLswpv4eZYQajsI5jihW1B/Da7olRaK/GT9XW8qW7m2a4V
         xL2+TAIUJutlN7ag3pb9UC7eqJd6/dh1G9o+GIDx+Zb8W9xv6KLJgDD4Ms61DBI3M5oS
         +iIwORV8UiLUxpHv16ULyR178OsdH7wWH8fG/+rroKYAlmRQmrZP9Szell/STifrCP5s
         Mvv36pr1mREc4mavgvUFryI8JjgCf9Nuf9zD1wTNpTvKXAJJK8HHHSv3fjQyTBhMpqwn
         G57A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785425993; x=1786030793;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3NATPyl9EF1MFAAgPEVj1qlEfNz3DMx7Yme+KQx5q1c=;
        b=fDP1XQrWW81BDMOBhl4VbOfKPk3oKpjOe/jyk9NR6pdlWmPZp5EKkvMm+TJZRB3qsK
         UGQ6Zz+WV3U3Tc1zYx8D/xE641OmnaXBX/z+rIj+SRnOSAF1DfWrp2QLCt2BtpJZ8+O7
         J731pzMeaUv9GVHhTW8N65hZ7V9FzklO2Ede/m2lVj1auwTEW0VmAkueaLBfmHK9k77C
         HbY5R7Ch24rxpoxKqFWStfV4EljvewKLuKZiuWBh9OQ2YQ56lfvbKWrq8S3LDoSX3Suu
         xBI6q7vXa7rMPLOakjvg392xoVMdOmBdzf5XsSM84mh+x2lZ1jn6ONFYFXvXFWqFz2er
         KLQg==
X-Forwarded-Encrypted: i=1; AHgh+RoD9PzIM4gTUcCrj5nDlWFeeoX3Rc0LnlgRPsTy0nqYf0Yu6CQr9ElgDe6DKkSsILA9DsSbxxpMkWHToCeu@vger.kernel.org
X-Gm-Message-State: AOJu0YyElj0eDgU1yznn5yhVA2gwJXNLnFUTyFcZJI1OHm8YOQcQGLfs
	GACxJQZDCh3gEKS3WPw8A+DicGFNAXRSisNhmYkNdeT/SVZR4H9EuCHrhgoODYfoEb3w/QgiWl4
	MslC9+iQ+DgQCYCl8BklU+ftrkwwpXUwyhe9akFSRzeKdyMR7Wn1pRdL1kAXotd0ZRaPZ
X-Gm-Gg: AR+sD13Yt7V4S+/v82BAzx16fuBJCXNMWIrCm50k9WkbHPWBX6Hf6sCIm6DuPJRoa8A
	iF4KhzPNsJ/xR3X1UUtQbRv06DtR0FJOnpikfrZ1QYW/pzaulOkXxA0h/L5i5cnf0exRMleA/n3
	SpwfT8nlGgxepc3FwKUidVirgHzIpHB5zWqnAvTBpWZbhAEd7UZlwHpBfpe42XuPLoaJZ3w4o5f
	xAzj9GsZcDWM+sjWogR8S0YJzIxmLSWxJToVKnkACc/izOm/lJL2QXQmr9siLNErl8GdxYBca7c
	ahocFzbRrPNXPhImhyud73c92ClDRLJJ3K1/3EIYBZL7f3STr7ZNoMb8FEM4NLalueFgIsd2C5f
	ArzqNa8iUJrA2STAbEz/fsiK7mdRNXCKXy7lLVlcI1I+S88Dm3m6hLj+NgGk/7z7BShYw6LogAN
	Jk+jMYvghHxEk1pQ==
X-Received: by 2002:ac8:5f07:0:b0:51c:7b12:1201 with SMTP id d75a77b69052e-52b386c7b4emr35206451cf.79.1785425993425;
        Thu, 30 Jul 2026 08:39:53 -0700 (PDT)
X-Received: by 2002:ac8:5f07:0:b0:51c:7b12:1201 with SMTP id d75a77b69052e-52b386c7b4emr35206031cf.79.1785425992901;
        Thu, 30 Jul 2026 08:39:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39f6ac80d6bsm3746191fa.29.2026.07.30.08.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 08:39:51 -0700 (PDT)
Date: Thu, 30 Jul 2026 18:39:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, bod@kernel.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, loic.poulain@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/3] dt-bindings: media: qcom: Add JPEG encoder binding
Message-ID: <3cbnmjmit4gsldga5nzct4odg6hpixzlwxbj72elnogyevr2tg@6esyjj2mvyom>
References: <20260730150524.2659577-1-atanas.filipov@oss.qualcomm.com>
 <20260730150524.2659577-2-atanas.filipov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730150524.2659577-2-atanas.filipov@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDExOSBTYWx0ZWRfXzUuWybxdKsjb
 Mvr9pqe3R46MohnaXwPoysZaNa5Qz+GenCxm4e0RPiyKFyzSmxAnQX0H+sYrJZF/Y8UN6RcjcJA
 /K7wEbGQ+Zw3CCKaRWqsj8W+BCPLymS9SSiL9AZUadFCI/2rxVfxByHnJCw1zvEaReg+xAdBzqK
 Sx+p9k0PP9D566zkSymGylyas9JCp7wa/vajPW3pYhywMbciOxZ/Z8Hthn6EuJqaw1VQF7p9eYe
 3SnLZOBJgIW+mYeRV3HWl+nsSnbBMXvKsc2bcZnpgSiWbOyfU+ho09Iloif8U5uqYOYKkp7Ocl1
 amKdbISQ9QQOllegr0XB35Qe/AxZcEtYvJ39IZBTvH9Z+UIHUOcsTEiEtROq6IwhY82NcMWkmcS
 sr/nj/aDHwQzzKZLkQQRMq2FGfEiheGpuPfQXyY0Ehe/hDhG2tjBb0sIXELfcQRDQn2TsLJrzfr
 eZ8x8VipJ+V3lShyAFw==
X-Proofpoint-ORIG-GUID: xGVE65nHfa3mwIVRJi4ehjapZ348UQTa
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDExOSBTYWx0ZWRfXxjKmcYrO2V0V
 4tTHGdYJA8aF/eq+R9Sh53m5yyfSV7JPCG9EHcUUTZzvBgJLW2e2WKujdhKGTTAogLCjsHkTH+P
 HpwHtPq1WHifE+x1mz6xIHk7xqq/IL4=
X-Authority-Analysis: v=2.4 cv=PdzPQChd c=1 sm=1 tr=0 ts=6a6b704a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=chD5afejWsUDTP9WW8EA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: xGVE65nHfa3mwIVRJi4ehjapZ348UQTa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 adultscore=0 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300119

On Thu, Jul 30, 2026 at 06:05:22PM +0300, Atanas Filipov wrote:
> Add device-tree binding for the Qualcomm JPEG encoder hardware block
> present in SM8250 (Kona) SoCs.
> 
> The JPEG encoder is a standalone hardware IP within the camera subsystem
> that performs JPEG compression in memory-to-memory fashion.  It is
> separate from the CAMSS ISP pipeline and has its own register space,
> interrupt, clocks, power domain, IOMMU streams, and interconnect paths.
> 
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> ---
>  .../bindings/media/qcom,sm8250-jpeg-enc.yaml  | 156 ++++++++++++++++++
>  1 file changed, 156 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml
> new file mode 100644
> index 000000000000..70f573100573
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml
> @@ -0,0 +1,156 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,sm8250-jpeg-enc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm JPEG Encoder
> +
> +maintainers:
> +  - Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> +
> +description:
> +  Qualcomm JPEG Encoder is the JPEG encode hardware present in Qualcomm SoCs.
> +  The encoder is a standalone hardware IP within the camera subsystem that
> +  performs JPEG compression in memory-to-memory fashion.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,sm8250-jpeg-enc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 5
> +
> +  clock-names:
> +    items:
> +      - const: sf_axi
> +      - const: core_ahb
> +      - const: cpas_ahb
> +      - const: cnoc_axi
> +      - const: jpeg
> +
> +  power-domains:
> +    maxItems: 3
> +
> +  power-domain-names:
> +    items:
> +      - const: titan_top
> +      - const: mmcx
> +      - const: mx
> +
> +  interconnects:
> +    maxItems: 2
> +
> +  interconnect-names:
> +    items:
> +      - const: cpu-cfg
> +      - const: sf-mnoc
> +
> +  iommus:
> +    description:
> +      SMMU stream ID for the JPEG hardware. The stream ID 0x2040 is used
> +      for the JPEG core engine on SM8250.
> +    maxItems: 1
> +
> +  operating-points-v2: true
> +
> +  opp-table:
> +    type: object
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - power-domains
> +  - power-domain-names
> +  - interconnects
> +  - interconnect-names
> +  - iommus
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,camcc-sm8250.h>
> +    #include <dt-bindings/clock/qcom,gcc-sm8250.h>
> +    #include <dt-bindings/interconnect/qcom,icc.h>
> +    #include <dt-bindings/interconnect/qcom,sm8250.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/qcom,rpmhpd.h>
> +
> +    jpeg-encoder@ac53000 {
> +        compatible = "qcom,sm8250-jpeg-enc";
> +        reg = <0x0ac53000 0x1000>;
> +
> +        interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
> +
> +        power-domains = <&camcc TITAN_TOP_GDSC>,
> +                        <&rpmhpd RPMHPD_MMCX>,
> +                        <&rpmhpd RPMHPD_MX>;
> +        power-domain-names = "titan_top", "mmcx", "mx";
> +
> +        clocks = <&gcc GCC_CAMERA_SF_AXI_CLK>,
> +                 <&camcc CAM_CC_CORE_AHB_CLK>,
> +                 <&camcc CAM_CC_CPAS_AHB_CLK>,
> +                 <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> +                 <&camcc CAM_CC_JPEG_CLK>;
> +        clock-names = "sf_axi",
> +                      "core_ahb",
> +                      "cpas_ahb",
> +                      "cnoc_axi",
> +                      "jpeg";

What are the pin input names for these clocks on the JPEG side? Can we
use a better name?

> +
> +        interconnects = <&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
> +                         &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
> +                        <&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
> +                         &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;
> +        interconnect-names = "cpu-cfg",
> +                             "sf-mnoc";
> +
> +        iommus = <&apps_smmu 0x2040 0x400>;
> +
> +        operating-points-v2 = <&jpeg_opp_table>;
> +
> +        jpeg_opp_table: opp-table {
> +            compatible = "operating-points-v2";
> +
> +            opp-100000000 {
> +                opp-hz = /bits/ 64 <400000000>,
> +                         /bits/ 64 <100000000>;

So, you've identified the issue earlier. The shared clocks need to be
scaled, taking all users in account. Please come up with the solution
too.

> +                required-opps = <&rpmhpd_opp_min_svs>;
> +            };
> +
> +            opp-200000000 {
> +                opp-hz = /bits/ 64 <400000000>,
> +                         /bits/ 64 <200000000>;
> +                required-opps = <&rpmhpd_opp_low_svs>;
> +            };
> +
> +            opp-400000000 {
> +                opp-hz = /bits/ 64 <400000000>,
> +                         /bits/ 64 <400000000>;
> +                required-opps = <&rpmhpd_opp_svs>;
> +            };
> +
> +            opp-480000000 {
> +                opp-hz = /bits/ 64 <400000000>,
> +                         /bits/ 64 <480000000>;
> +                required-opps = <&rpmhpd_opp_svs_l1>;
> +            };
> +
> +            opp-600000000 {
> +                opp-hz = /bits/ 64 <400000000>,
> +                         /bits/ 64 <600000000>;
> +                required-opps = <&rpmhpd_opp_nom>;
> +            };
> +        };
> +    };
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
