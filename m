Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C946B424646
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 09:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785230320; cv=pass; b=eezrMVxtP9J/fAf9XbCdYFpIZTbSOVnhqPpl/Ah6ljFEHNhG7CdSpueTmfrPHlveq64hcnojTX8DAE4HcwoP7po/3sadtTmSJc2bwEyOR11MNeSKOZPPFj0Rr6DF6Q6Ga+2xpyTEAU4jUyLqvxKUGEA4Wk9YPm2vcnv3Yc0I7pQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785230320; c=relaxed/simple;
	bh=XR1FChwM4ZOFz+4JHw+XDyagB+TIvP8IDqOk9CzMqdI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QM3BnHdXubH8LvAbbXF6OnChTU/CDxFeC5oy5grDktd/TGiivSbDSvNk+y7xx37lzU2aIf/UFt5N6ZcHaUQLtMrJm89KlO9lrNhOjlmfGapR4pB7HVkd4+SHS/HeOLw/aOEpuvp0viWW+9kClsoiLMHde1bRMHVNCZvjexhXhZA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e60NFy6Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xf8xNHqe; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e60NFy6Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xf8xNHqe"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S82TGP2027078
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 09:18:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vLA9m/fSPfwlI/OacwG/q4Oex7qAyLSMc5Ky0H8tInM=; b=e60NFy6QGXuHb3gB
	tvIrVrjSpMLXIKMPRKCbi3SrcuyYPeP7C8it+rCdiFe17dMRjuFSu0alLPGpBEBD
	CUeu6o8rDBUvai/HM1sMF7gYjD8/p6iZ3iGykQjjm8uxeaVu9xa4pf3yAPY3G0VV
	0RLP7lrtVQ1bvIf6K2HOsc2vngCBS4ekn9K2DuceftSuCv7XXyTBANOwW2A20UkV
	LkuCOfLww+47XPx0Fb2TW6CHAIT9C+vMizWRw4hc8+Tp+gxl9rspmn6W7SIA2Kgz
	VdTf9zBCQTJvH1UuxcRs6Y2yGU+5qLVaG1CD3Ga1lqzEcWBLisMIu7IqCh6HQ8Vl
	hB64LA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpq9hgn7j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 09:18:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e53b8a302so413061085a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 02:18:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785230317; cv=none;
        d=google.com; s=arc-20260327;
        b=JVy4BOyBfuaPLgu3IBdi5YPI6LRiJQ+esrKEud6EwBq8SKc4nSlk2+IskQenBnVgvi
         wfsGJvnCVBGK8p1tvCwXCA0UzZJjnTgpmVuczeKokZ4Lpz91+TjCx3oEaoHBw+1xCt8R
         IL3Xip1xgzdZiPIY2OiRjwblCdvhQ7aylHIxSgKHsSkKo+xh7aevs8AwJ23202E55n/Y
         PlpOpJjPxE/1gf5tyfv1rs900ODiE94ydgzxtKBzEiiZBUs/+HxuCjRClfLkX/Z2bh/E
         gzMvgxQBtt6sj6CxEOjUOQl6niFZRM/UX6jTKyxKHYBFUsjmpHKRZd1/Gd1VfhEmkLgW
         XBxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vLA9m/fSPfwlI/OacwG/q4Oex7qAyLSMc5Ky0H8tInM=;
        fh=vlkQcr02gb6ZRyoyyQP3aLGbJYWDiHJYGlDpntNvq5U=;
        b=Lc7iVjxxCeCq6xYqQNYpfnTUbXVDB2EInBjaRLAT101Nhwzd2tnUIGkGUQftLn3WVq
         DCCuEtEAOlNjfOkuXbq3A+lD7fgxQxZaIKhI7F36uPnmywVqW17CpqbqmSaG7IueO/WY
         WaWhrVUx7JHLsTpjmp5995n4+wf7cyVtk8P9GlLh+YTJhgn0oa/4//wMvq4bE6VPy+rQ
         tI+i0NUZ/sHnnQ0xwVbGPaKt72Lh5kWossxWqGiguwmNwXwbb76erFClmwSse5Vf8H4Z
         9acdEbMT8US1C4cLpOFpAk3f4Ct0crO+kbKMvvBmANfvwiPO4QPCcvK+LlSULg+BBjhM
         Y4pg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785230317; x=1785835117; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vLA9m/fSPfwlI/OacwG/q4Oex7qAyLSMc5Ky0H8tInM=;
        b=Xf8xNHqeozqjO0ajVWcZjdrazpFOiPw03cg289WedWZ4UkKO74gHuITMr6f7q8Ya1U
         mu+T+uR7oOIWJafUGwsrNnke/zH64IeK0uvgZCTuBaZRJ6kCUFu5/TOaJ/41ztnML0fV
         mX2K8kBjPuFH8T49Ve7Xsn9kKR8rv4bg9+IQf+wQo1xNcT8KIy+vqJSntG/IAIBkE+P8
         8YewKkt5pUtudJDB5C+xGTnPobejxLc4ceamKKhJPXZZH3D9S8dvl6hTNs+pmHJG6tn/
         BXpnvhA+vnvvDXGjNVWt/dPJZuS2e1/XXilmru6QRUgQAJOYfPB9cixS1hbBJojtZSSY
         sUfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785230317; x=1785835117;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vLA9m/fSPfwlI/OacwG/q4Oex7qAyLSMc5Ky0H8tInM=;
        b=YwUiuGr1mHAoNxGPS4PDDsCnPOnidgNiYnU9bs9ga9ijzZhXRYO6NIIriNr0TA1SpB
         ngSsFu8Lv1E/B5IBLW1fezXrt0xc7o7ANlvDMFOjyGjNX8oYWhFu/jwCzfKZdoE+uITa
         +4lsYiwmn64X6DVvFEIUzWWnNzA7WELC9ldhNyBEABp7fjPrNBB0xgBQXeJVq19q8PT7
         oCZmj/xnT4VhuiKnunEaESSxEAH5KUGcWByRq06S3twCAH7YMowV57EGzB6eu7ns40UQ
         tbE0I3Q+ebJGSm4CoqiWExncpytwXtmvX9SIkxFIZJU4XZ8HT/+pBldmQrheA/KoynAU
         CRXw==
X-Forwarded-Encrypted: i=1; AHgh+RqbHuaBkgj54fPR/mSWKAqxRbligzmtBR/FqfhXxfBs9+AJdXhjxUeA80OH65f+IQZZIa3vcgJYOFsLCGuJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzI5cyAqxoXr6w2GnEESAzbYgbytd07sgU5Ni8nky+UFuYo5lj7
	X38/wZsE1FtG1xEfC0zPq9ksHdYq+g8V0g3EOY74Q0KtnYbZG/r6A92wSNQAsJNagaa6NtRs7wP
	T6qgsBXDrVD4fhEnmJbAi3ygdtNFx5jAusoUyxnT2E51mMRwLTmle9K5rBjD5kjNro/LedV/tSV
	7wNX/J1keiUpsG9giXnEv7ZcZuYImjjoq7volwURgR5hM=
X-Gm-Gg: AR+sD10P87taAWImOY8H2k0WwP8ngcNwXeqyyAXL1AyGB2dnbWOxa133L8n0zRyY2F4
	rsgDjqs8dare0kI4fOxICgUc9cIwt4LkLWcAdMp5o0XAjUXAjqZWewM56QsJ9r9FJ2nxiX5NWoE
	o8P2XJwtQp/m2OtSKeU33HeKPCjHLbbUtL2/7/MmAnTQiEiH1c6VeTmwXesjvjaGXDIchw/9f0z
	EsLSu6JaB46i/WRm5Lr1x2T7RZN2DXK+tJApuuaucBC4gwk8hT2K8hkvecohaSl1Jgzb8TE3Qr/
	95UlqrEOKy6ce9oNFYMJV0+uMJPr
X-Received: by 2002:a05:620a:394b:b0:915:9125:e652 with SMTP id af79cd13be357-9330277364cmr133020385a.48.1785230316889;
        Tue, 28 Jul 2026 02:18:36 -0700 (PDT)
X-Received: by 2002:a05:620a:394b:b0:915:9125:e652 with SMTP id
 af79cd13be357-9330277364cmr133017085a.48.1785230316312; Tue, 28 Jul 2026
 02:18:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260728082548.2511694-1-atanas.filipov@oss.qualcomm.com> <20260728082548.2511694-2-atanas.filipov@oss.qualcomm.com>
In-Reply-To: <20260728082548.2511694-2-atanas.filipov@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 11:18:24 +0200
X-Gm-Features: AUfX_mxVFTXpTlKt2oSdD9NtNkOzWaKQHcgbH-eTXM2rJKQmFn1y8VrplOf4xK8
Message-ID: <CAFEp6-0mjXJhk+n29COc19zUgC-a_ZRT=9Kt9DBaexYcff1Vjg@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: media: qcom: Add JPEG encoder binding
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, mchehab@kernel.org,
        bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA4MCBTYWx0ZWRfX800cUZh4N2bW
 XFUl05lQeFtMYgK9JnNsvO8VYU91IRyWIF230nbCSoeH4quN41CR9M1ISCAh60k3tHg+ILhNqgc
 lYaeQXJ96cPV98vT/1Hv4HyeuBY4Lgw=
X-Proofpoint-GUID: BSoQEEV3oeAFTThIGQfOkICP_2ig70E3
X-Proofpoint-ORIG-GUID: BSoQEEV3oeAFTThIGQfOkICP_2ig70E3
X-Authority-Analysis: v=2.4 cv=Aa6B2XXG c=1 sm=1 tr=0 ts=6a6873ed cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=chD5afejWsUDTP9WW8EA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA4MCBTYWx0ZWRfX8dKDiwm+WMdw
 5RRtpoMzbWFNZXuaLCd0m1pzCRJ60LNP2xtt71GyPxXqwXS56pzyCOcitDTr6wQ9ViaJWCTCKj9
 lwZALF5PlO3F8jWmAtuG1fsIMTeSGHklZd6Kd/haHEViFv2lB2WDr9EwSe+nIrGV8iu1Oe7TbPo
 jVJfGFetrF7FbL4L5xncPnZdogbx5IwwxbrydjwEwQWGe09enn2ci6Fw6oi5LSV8r5x2svdbBUA
 /1SDsxtCrjhc5pZsU9WX9NSCUJQ1mwF1C5gLrN0dgK6Ahtu4EP4YMlrzzK5nw04K2/SSCeIN2Wv
 lc6uT6hpHjbGa5FO6KHa80AB9YTnEPzDsC+elJTlhyfIumuhKT2+8DhXNDG6/H6Qpt4G1nEnAFd
 8YxD4YTlpVtFbawRQ9aXv6mM4SqhduVHh1EJC1qNif2NQB+gO3lvpZC0CR4IHQbOFSKL//YurdG
 n6pJLcdT3CtaoFmZ9mA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280080

On Tue, Jul 28, 2026 at 10:25=E2=80=AFAM Atanas Filipov
<atanas.filipov@oss.qualcomm.com> wrote:
>
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
>  .../bindings/media/qcom,sm8250-jpeg-enc.yaml  | 154 ++++++++++++++++++
>  1 file changed, 154 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8250-j=
peg-enc.yaml
>
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc=
.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml
> new file mode 100644
> index 000000000000..6aa2613bbf3b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml
> @@ -0,0 +1,154 @@
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
> +  - Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
> +
> +description:
> +  Qualcomm JPEG Encoder is the JPEG encode hardware present in Qualcomm =
SoCs.
> +  The encoder is a standalone hardware IP within the camera subsystem th=
at
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
> +    maxItems: 6
> +
> +  clock-names:
> +    items:
> +      - const: hf_axi
> +      - const: sf_axi
> +      - const: core_ahb
> +      - const: cpas_ahb
> +      - const: cnoc_axi
> +      - const: jpeg
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  interconnects:
> +    maxItems: 3
> +
> +  interconnect-names:
> +    items:
> +      - const: cpu-cfg
> +      - const: hf-mnoc
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
> +        compatible =3D "qcom,sm8250-jpeg-enc";
> +        reg =3D <0x0ac53000 0x1000>;
> +
> +        interrupts =3D <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
> +
> +        power-domains =3D <&camcc TITAN_TOP_GDSC>;
> +
> +        clocks =3D <&gcc GCC_CAMERA_HF_AXI_CLK>,
> +                 <&gcc GCC_CAMERA_SF_AXI_CLK>,
> +                 <&camcc CAM_CC_CORE_AHB_CLK>,
> +                 <&camcc CAM_CC_CPAS_AHB_CLK>,
> +                 <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> +                 <&camcc CAM_CC_JPEG_CLK>;
> +        clock-names =3D "hf_axi",
> +                      "sf_axi",
> +                      "core_ahb",
> +                      "cpas_ahb",
> +                      "cnoc_axi",
> +                      "jpeg";
> +
> +        interconnects =3D <&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_=
ONLY
> +                         &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIV=
E_ONLY>,
> +                        <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
> +                         &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>,
> +                        <&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
> +                         &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;

Do you really need both SF and HF? HF is usually for the real-time
hardware macros (capture).
 (same questions for axi clocks).


> +        interconnect-names =3D "cpu-cfg",
> +                             "hf-mnoc",
> +                             "sf-mnoc";
> +
> +        iommus =3D <&apps_smmu 0x2040 0x400>;
> +
> +        operating-points-v2 =3D <&jpeg_opp_table>;
> +
> +        jpeg_opp_table: opp-table {
> +            compatible =3D "operating-points-v2";
> +
> +            opp-100000000 {
> +                opp-hz =3D /bits/ 64 <400000000>,
> +                         /bits/ 64 <100000000>;
> +                required-opps =3D <&rpmhpd_opp_min_svs>;
> +            };
> +
> +            opp-200000000 {
> +                opp-hz =3D /bits/ 64 <400000000>,
> +                         /bits/ 64 <200000000>;
> +                required-opps =3D <&rpmhpd_opp_low_svs>;
> +            };
> +
> +            opp-400000000 {
> +                opp-hz =3D /bits/ 64 <400000000>,
> +                         /bits/ 64 <400000000>;
> +                required-opps =3D <&rpmhpd_opp_svs>;
> +            };
> +
> +            opp-480000000 {
> +                opp-hz =3D /bits/ 64 <400000000>,
> +                         /bits/ 64 <480000000>;
> +                required-opps =3D <&rpmhpd_opp_svs_l1>;
> +            };
> +
> +            opp-600000000 {
> +                opp-hz =3D /bits/ 64 <400000000>,
> +                         /bits/ 64 <600000000>;
> +                required-opps =3D <&rpmhpd_opp_nom>;
> +            };
> +        };
> +    };
> --
> 2.34.1
>
