Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFFDD42EEAA
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Aug 2026 18:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785781002; cv=none; b=dGXJvK9BAa/bOYTbKCVgAc7nSVqBz90jHIDuDpLqjvsWkpm66XZjH583BXkR1ZJKMCtHEOUfhueuFvNoqJppgj6xsphFs7hpUM5TaD741+NnNCysdXvD/9Q91zf1YSQ7blJz5QCRVEFCYHddnSFMc9GXhW9jc90T2xa3QhjddyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785781002; c=relaxed/simple;
	bh=HS8j2i7sifMhJB8NAVwNS8iuPnEqGxDkk6jqxz4X4Wc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DQS6LA+bqyk6EXzobk1JWncbZn1VpySAnS9jJ6yas7EIT59ZiBbc+NnXtuibdbTDc2rWtIq9vpsHFyDe6wEGUbuz6tJhoMk+lN3kNud/JMuzPkNtduXSMLLyjxbzJW4rXF1d9jbPg1EWFBp1GYtW6tjsYYfamwuC87QjSUBC9Is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gw25o4hb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QqUeWIbg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gw25o4hb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QqUeWIbg"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673Gw5K41017680
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Aug 2026 18:16:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SNivGOtiPPNvM4tKxFpUbUYz
	kj+CK53ku9pQAQ7QUP8=; b=gw25o4hbi2V7AE5vaxzFKpCKxgmlWePiGReqsJbv
	e3/1yJJ2ZIxX6jfeQP4xn9W1gijC55iX5Fl/0yIqYY45hdwlwwmlRqf6AG1iPP5q
	ON4FxaDD2dKsoHnrMoq+L9xsVKVqD+dCyfw0mP4IvOFZV88Qtd3kJVuwlwoMyop+
	vGSM+xFvUr29EO5IUqUzcC6gYHtD4XwRBhTZnOi6uqMnKjqNeTYN/0FIgSCyvIuZ
	0I8U3WyBEVH1GULKDb8oqUt+c/TJtlsNzC6VIrO+miCaxT/t/fpryYOxewY2LR/G
	6CDziTzvb8OhYSb+jUu3C1amFfKzPW0Pox5bad80+FtGIw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftp4r2x0n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 18:16:39 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52b4f6ac06aso59904091cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 11:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785780996; x=1786385796; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SNivGOtiPPNvM4tKxFpUbUYzkj+CK53ku9pQAQ7QUP8=;
        b=QqUeWIbgwkLABi9hnKSVvl6wvdAqGmH6k59ZwbC8AX6ovpGl5067XalaMMTQVfD2pK
         IwVWGhSDmbQQLm8F7VASb+wgFjEm9RePIJZ3f6GZwl0Go9oZXY5MZD/w03GyF2FtMKkf
         z+MvDSpa08vbpVIAv69eWrfYDp0wVhDUPwaS9lHx5+hv0fxB34vxvo+4J2Yi4mKbKwKy
         ghXCAs8eKhOcKcoDUxKv+ugHNkFW3xbvHg4qCsMmoydahigpCGDJj2zkHwHpe8TLoD5p
         K1ePOG+6Lvb4YJHxmXTqUqmLCvOkhz+cGoxTzRJvnx/Vqj6o4FFmJneM3JDULd7Ug7/J
         xfZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785780996; x=1786385796;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SNivGOtiPPNvM4tKxFpUbUYzkj+CK53ku9pQAQ7QUP8=;
        b=b699RXBZ0pEUxdteDCDYJYqQ+MS6gbYRMdN2TyBwpWTohuyiraDC73j1gOX/FW3Qau
         D1t3YiuWUL4owC+concm9HUVnX4zF84+SWyN9CFZNLolUaqBYq+tsFLshTi8UOG6byPv
         N7yykaQvaPypOMLmcOxD/ByLeEJ6rYBSHEdpjReCjhjdLMI08TvieQaZE4CPu/D14mgS
         eaSihh4hZVWFYN+RkuWWz3flq007cDIIhx7usm03WKaWximHN4vEqcGFPrvV/lElVcyF
         V9jazAFMHTK1J8ClUs3DbZu5tQ/m6RDipnJ8WiXC+VtnCVYNBe1+nY/hChNR5yCHmhUg
         thOA==
X-Forwarded-Encrypted: i=1; AHgh+Rojae8PR9WZ1B7y/KwhPbQq7VxEuGI08BtanEFqbWcFQP/c7etA6HBUpPIR+ME6r7iL0XyzAjmmFcyLPuB2@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj/YPUg2Yt8m7sRuFoYPQVMz5T5Ss5mhJXZd2/ZfKFQedQH654
	iayf7aanBvEvYsnEf2nYcj31OsjPgJMoldB1uwAJiwq4suGnQMF9f/6h7I6ulZ/57DV1zoXKFf0
	AIk3YErPgTAQ902UIzKIoAjUAQ79NL11XDvX579Yo6ZqGRqxuikL5yiqrj1L0eCRx+jQ/
X-Gm-Gg: AR+sD13XCPczCG6ZeLtEJj3shSueV8nL6qJSNVZniWDUkSXjuzHL9E1sAbO8WOB84Tg
	DTdLTMlgWgqteH4JZLs1OTH69kkiiiaWJ10H8FIJGkMlr8caIRp4RZhZETdCmVWqDYq1Eyj4BGh
	QWtJcjb9wy4dTYJtBYPyGVOhIYJDGbxg/588QKOTribNlO8Ua0RA9J2Nr0f9ZgjvPZ7ZpWTiV3K
	b226ncX6eHLgb/bomqOd/m6XHA7KuL1zeJ7gNyEMbjT/Pd/ccZCM/nm6TMDlxZCNPHhhs4qFdgi
	iniUsBtsE3gu2tKpjrGjXdB8vukVy5DNIThSsUdP1pHSAh5cOicof0rcu31FzEQ49IgFviIZ3XQ
	c4qqWWmWvldMibZ82M+/7JBLCD1aGMHpg0+6AWKe68vbU4Ua417572mwCCYSSevSotFWqz+vm5r
	rHRNVxmXi4Tbd2Xg==
X-Received: by 2002:a05:622a:4d4b:b0:51c:2230:7efb with SMTP id d75a77b69052e-52b5674b9eamr232280691cf.23.1785780995854;
        Mon, 03 Aug 2026 11:16:35 -0700 (PDT)
X-Received: by 2002:a05:622a:4d4b:b0:51c:2230:7efb with SMTP id d75a77b69052e-52b5674b9eamr232279991cf.23.1785780995327;
        Mon, 03 Aug 2026 11:16:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2e23c46ebsm2268617e87.10.2026.08.03.11.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 11:16:34 -0700 (PDT)
Date: Mon, 3 Aug 2026 21:16:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "Gjorgji Rosikopulos (Consultant)" <gjorgji.rosikopulos@oss.qualcomm.com>
Cc: Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        linux-media@vger.kernel.org, bod@kernel.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, loic.poulain@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/3] dt-bindings: media: qcom: Add JPEG encoder binding
Message-ID: <wmac2yl5i2psdld7pnj67bnpjx65q5recfw5zi3mbxko2inpgm@5g2kzyr5xx57>
References: <20260730150524.2659577-1-atanas.filipov@oss.qualcomm.com>
 <20260730150524.2659577-2-atanas.filipov@oss.qualcomm.com>
 <3cbnmjmit4gsldga5nzct4odg6hpixzlwxbj72elnogyevr2tg@6esyjj2mvyom>
 <deee4b5e-167a-4f37-b2fa-84f06ec33721@oss.qualcomm.com>
 <fcc464a8-3d1c-4b6e-ab2d-ef61c4b18b2e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fcc464a8-3d1c-4b6e-ab2d-ef61c4b18b2e@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=X9Ri7mTe c=1 sm=1 tr=0 ts=6a70db07 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=gEfo2CItAAAA:8
 a=D19gQVrFAAAA:8 a=EUspDBNiAAAA:8 a=QlglhKDgx5FSEnKno2IA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=sptkURWiP4Gy88Gu7hUp:22 a=W4TVW4IDbPiebHqcZpNg:22
X-Proofpoint-ORIG-GUID: OETKPfGu4eRZox6n2WB8kDHeVG5A8Ram
X-Proofpoint-GUID: OETKPfGu4eRZox6n2WB8kDHeVG5A8Ram
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDE2MiBTYWx0ZWRfX5h3tlm+9Wznt
 KucJOwwV24+QQCH0kaR7nRC1sDFsdnMWLUDfOi0SDfzm/Z51jkYjRKcDA8IOF89wpvHp/fca2Sz
 hfYhRyTi96EL7OJFcL50khR4Z+bSH+c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDE2MiBTYWx0ZWRfX7fG9hLyhHbq9
 HJu0uPfQkja/1YlYUkvvHuoS+w5Z/3tJTQYGeEFXQcx+0tk5WsAHiNWQymxWpNFKFlOunzNxcAB
 jWndI6P7MkcgTbhA1nIg+8rC2XMpFoC0sx20YBSAd11Bo7+d9iL90Y73Jh+nUl22aicDILJUe1I
 LhVb8j2jQ8Bw+B+Zm0ibCcSIIK+P5+fCUpp7vASvQOkMZqrGwZ0oBHyViL2ifdDq9YrJ23Be5bn
 ej73tlkNT64QOEL9FSMNgcMSL810xcCxnIjuPG/pBWnaMw1mnEUVg9xE2fi8TcluAc+IM3jvxDF
 rcDPWe1b4lV7RGKk70p9Im9Z/xj8UcW1i/bow/hxSfaTmSt+jkEiElLUQSNnt3hqfCwgZX9/6Mo
 5UaRMrGA8OkXazHsLPCa2umu8xuCCirXBY38ojbUPSCN19nVAwdfwdBbsPtuLIRVfdOz/640e//
 bXDJkrkMf1zGC4ESpRQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_04,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030162

On Fri, Jul 31, 2026 at 10:26:39PM +0300, Gjorgji Rosikopulos (Consultant) wrote:
> Hi Dmitry, Atanas,
> 
> On 7/30/2026 7:24 PM, Atanas Filipov wrote:
> > On 7/30/2026 6:39 PM, Dmitry Baryshkov wrote:
> >> On Thu, Jul 30, 2026 at 06:05:22PM +0300, Atanas Filipov wrote:
> >>> Add device-tree binding for the Qualcomm JPEG encoder hardware block
> >>> present in SM8250 (Kona) SoCs.
> >>>
> >>> The JPEG encoder is a standalone hardware IP within the camera subsystem
> >>> that performs JPEG compression in memory-to-memory fashion.  It is
> >>> separate from the CAMSS ISP pipeline and has its own register space,
> >>> interrupt, clocks, power domain, IOMMU streams, and interconnect paths.
> >>>
> >>> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> >>> ---
> >>>   .../bindings/media/qcom,sm8250-jpeg-enc.yaml  | 156 ++++++++++++++++++
> >>>   1 file changed, 156 insertions(+)
> >>>   create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml
> >>> new file mode 100644
> >>> index 000000000000..70f573100573
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml
> >>> @@ -0,0 +1,156 @@
> >>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> >>> +%YAML 1.2
> >>> +---
> >>> +$id: http://devicetree.org/schemas/media/qcom,sm8250-jpeg-enc.yaml#
> >>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>> +
> >>> +title: Qualcomm JPEG Encoder
> >>> +
> >>> +maintainers:
> >>> +  - Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> >>> +
> >>> +description:
> >>> +  Qualcomm JPEG Encoder is the JPEG encode hardware present in Qualcomm SoCs.
> >>> +  The encoder is a standalone hardware IP within the camera subsystem that
> >>> +  performs JPEG compression in memory-to-memory fashion.
> >>> +
> >>> +properties:
> >>> +  compatible:
> >>> +    enum:
> >>> +      - qcom,sm8250-jpeg-enc
> >>> +
> >>> +  reg:
> >>> +    maxItems: 1
> >>> +
> >>> +  interrupts:
> >>> +    maxItems: 1
> >>> +
> >>> +  clocks:
> >>> +    maxItems: 5
> >>> +
> >>> +  clock-names:
> >>> +    items:
> >>> +      - const: sf_axi
> >>> +      - const: core_ahb
> >>> +      - const: cpas_ahb
> >>> +      - const: cnoc_axi
> >>> +      - const: jpeg
> >>> +
> >>> +  power-domains:
> >>> +    maxItems: 3
> >>> +
> >>> +  power-domain-names:
> >>> +    items:
> >>> +      - const: titan_top
> >>> +      - const: mmcx
> >>> +      - const: mx
> >>> +
> >>> +  interconnects:
> >>> +    maxItems: 2
> >>> +
> >>> +  interconnect-names:
> >>> +    items:
> >>> +      - const: cpu-cfg
> >>> +      - const: sf-mnoc
> >>> +
> >>> +  iommus:
> >>> +    description:
> >>> +      SMMU stream ID for the JPEG hardware. The stream ID 0x2040 is used
> >>> +      for the JPEG core engine on SM8250.
> >>> +    maxItems: 1
> >>> +
> >>> +  operating-points-v2: true
> >>> +
> >>> +  opp-table:
> >>> +    type: object
> >>> +
> >>> +required:
> >>> +  - compatible
> >>> +  - reg
> >>> +  - clocks
> >>> +  - clock-names
> >>> +  - interrupts
> >>> +  - power-domains
> >>> +  - power-domain-names
> >>> +  - interconnects
> >>> +  - interconnect-names
> >>> +  - iommus
> >>> +
> >>> +additionalProperties: false
> >>> +
> >>> +examples:
> >>> +  - |
> >>> +    #include <dt-bindings/clock/qcom,camcc-sm8250.h>
> >>> +    #include <dt-bindings/clock/qcom,gcc-sm8250.h>
> >>> +    #include <dt-bindings/interconnect/qcom,icc.h>
> >>> +    #include <dt-bindings/interconnect/qcom,sm8250.h>
> >>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> >>> +    #include <dt-bindings/power/qcom,rpmhpd.h>
> >>> +
> >>> +    jpeg-encoder@ac53000 {
> >>> +        compatible = "qcom,sm8250-jpeg-enc";
> >>> +        reg = <0x0ac53000 0x1000>;
> >>> +
> >>> +        interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
> >>> +
> >>> +        power-domains = <&camcc TITAN_TOP_GDSC>,
> >>> +                        <&rpmhpd RPMHPD_MMCX>,
> >>> +                        <&rpmhpd RPMHPD_MX>;
> >>> +        power-domain-names = "titan_top", "mmcx", "mx";
> >>> +
> >>> +        clocks = <&gcc GCC_CAMERA_SF_AXI_CLK>,
> >>> +                 <&camcc CAM_CC_CORE_AHB_CLK>,
> >>> +                 <&camcc CAM_CC_CPAS_AHB_CLK>,
> >>> +                 <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> >>> +                 <&camcc CAM_CC_JPEG_CLK>;
> >>> +        clock-names = "sf_axi",
> >>> +                      "core_ahb",
> >>> +                      "cpas_ahb",
> >>> +                      "cnoc_axi",
> >>> +                      "jpeg";
> >>
> >> What are the pin input names for these clocks on the JPEG side? Can we
> >> use a better name?
> 
> The name of the the clock on jpeg side(based on documentation we have) is 
> cam_cc_jpeg_clk, There was comment from Krzysztof "https://lkml.org/lkml/2026/5/15/1112"
> to drop cam and clk, so it remains cc_jpeg or only jpeg. 
> 
> As i can see in ope patches ope_clk is named as "core", do we have some general
> guidance how to name those clocks? or if you have any preference or proposal it will
> be included in next patchset.

"core" is better. It defines the purpose. They problem with clamping the
"cam_cc_foo_clk" names is that they change from time to time, while the
IP core doesn't actually change.

> >>> +
> >>> +        jpeg_opp_table: opp-table {
> >>> +            compatible = "operating-points-v2";
> >>> +
> >>> +            opp-100000000 {
> >>> +                opp-hz = /bits/ 64 <400000000>,
> >>> +                         /bits/ 64 <100000000>;
> >>
> >> So, you've identified the issue earlier. The shared clocks need to be
> >> scaled, taking all users in account. Please come up with the solution
> >> too.
> 
> One proposal is to have camnoc icc clock provider, there is implementation
> available and it will be posted, What is the preference to have different
> patchset or to have camnoc icc provider as part of this patchset new version?

It definitely can't come _after_ this patch. We already have CAMSS
voting on those clocks, so adding JPEG shoudn't disrupt its
functionality.

> 
> Regards,
> ~Gjorgji
> 
> 
> 

-- 
With best wishes
Dmitry
