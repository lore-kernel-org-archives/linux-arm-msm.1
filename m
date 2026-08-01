Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1E9276028
	for <linux-arm-msm@vger.kernel.org>; Sat,  1 Aug 2026 19:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785613718; cv=pass; b=aZ0ZLjl76kFnkGfWklEUwsY36Ggve6B7aStWyOv/6RdcIn7G68clB6kKzyH4+CMbnMYR7X2lNXi9otOM36OuiniXBmlNk7SpfoEvawYt/2xp7H3bZGhlottI/u8cdhGj27tqBTdQAbvLJ8gJA8mGocP7Mn2OIEriDjKyHF5Tv3w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785613718; c=relaxed/simple;
	bh=CtK2LPEkkpVeYvUtnix4WDcNTGo8MqVUPafXyQdwKxg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YP47Kz3++aqrZ7x78oP7o8u6tA1ryXAr6oGAZ9VoaKwkDgdI1JTFWOMKFAtzFYOjcNDhnGhsX1i8f7U8O8PMJLBtjzAeBTGSue9kbmv+mJWhWTH5N6D9dkvoTLzuulhKVuG6YthWkVkv2OdUvvcBMsdJPm9tZiwY2m3eWJWGb8w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VU7/25S3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZI0wF4Jv; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VU7/25S3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZI0wF4Jv"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671J0Vj84034468
	for <linux-arm-msm@vger.kernel.org>; Sat, 1 Aug 2026 19:48:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	opJd8ruhXEy2bVaSHYGW23oK07jIF79PnN2+eurwy9k=; b=VU7/25S3nlgxliGm
	nufuAl0xAkAjmysuEtCdfRev7J0kauvZctMEA9BigH54oRhu8ysfb1W+r4pHNyKR
	AV/pOC1TGleeLLOoZakV9DgoR+EMvvd1y6NkWZ+iGhrYbmhSyLxrB89V1BD0MR9n
	T3qICQPCTcGp7H5s1Jv/+oCegbBnsRraFQB6UziaVcIvpQbQlt+Ov7SO4rFt9iR+
	8TecEDMBAL1s0mHHAhG18XIPmhJLC7d+BBuqAjtKawsr9PaqECOXTiCuG7QvkWn9
	/MLGOy7+cx27hI/i3NklaX3sYo+Re6ZnvOzANUurl7U+I5H75Sv/4ytcFi6fXrul
	kY0asA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8q51mdw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 01 Aug 2026 19:48:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-933023a5980so346958085a.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Aug 2026 12:48:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785613715; cv=none;
        d=google.com; s=arc-20260327;
        b=r/UwJeZbmM5XSVJb1bnX5nQNNMuNbe9d4B/emaYtfIcNc+ROszWdL326hy+wOsgFEr
         6kFUiYJT8vZpgTyMXWbN2vsdIRINCfLkAlvT9dRRe4DkBGQP5tI4KdwWFPU4w33kX7Dp
         NftxSUrUiBWceshjuaiG19YeEKWCYguJxO5Wi2y1W8MfQc4Qu4pamFNbFokjqwmu/8XD
         sna5rFW4BiVCqeFgw/RjAprWROnIQNc4mvqBjILFlEqbXpc0c9a07CfpKLRd9TfVl/m9
         kTSGsJ7n9EblzPtYBDCIs0KUGXdvjDkvT0cCMpbnPYlPAkZrmqHkqPNTOK/0uaPN8YMs
         2gtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=opJd8ruhXEy2bVaSHYGW23oK07jIF79PnN2+eurwy9k=;
        fh=0DudZ955vyd278r6OuRFC5srXHKM+eOFSwwkhHLyNq4=;
        b=fR9NBiBRAjE9uD3EPEpegUz2Xwx2/iKhNMbMC5Fln3E6zLBA8JfnYtlKTLHbjylJ48
         MqrpIu2y/3Oa57c2CqumNSgrbQUe+CZ6GWQSFXodaxeZgWn3s8lO86BWP7Ml2wppCNAS
         srMzVYR9sR/rJoY0tefiUyidIBRRr2TmPyGHu6vrLIT2gZTnA8iYpVQUPLTTwDS8fFt/
         RNcl2CwnjzQ2ncNVB3lFgGCI47RVul/rjb1kGYXBUtxSJ3jjgymkYHyM7tPfvENC53oO
         ccehRD7aQyiXCMS3r5iT74tPap0SPE5VmqWnOmKa1iFUIelgLLZ1BlJOP1e/AnO7lTg+
         XtlQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785613715; x=1786218515; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=opJd8ruhXEy2bVaSHYGW23oK07jIF79PnN2+eurwy9k=;
        b=ZI0wF4JvTLrBU+o4vPuOXphWvKowf6jTQxp7oBplx7J0UlwpKcwlIChNHZsgQ8/B61
         dtz5jYGvu389oEzSsCftGiwTMfKfna5Je+tT83/+fjw5SN6IHzKOqKKUK4k7ZLtn8FvY
         zP0stHDqWgs7NpNlQHglgkStfIt2fEj89PjZ0ceVKiCk7lzlfGkKQ82COJ3dpHYU7vTA
         nBIbvk5ds+I1X6SNfvnH5iqk4o/EMFaeE3HuO4UU6k9ja2sG4oj3ANzsNAle0fADuI0p
         HzzLMLu1I3Nq9iQLFmp07SI5clwjW6ChbCAOELfYF5BtcVCyy7U+EFQyWVbzAvdxW639
         lUjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785613715; x=1786218515;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=opJd8ruhXEy2bVaSHYGW23oK07jIF79PnN2+eurwy9k=;
        b=LH/05QLFN7u3QHRlGeZI2x3TFy/Y4e7OZuvg4Jy4+kWjpm0yqG0vmOfEsZnk8XtdtO
         y+yp4qrtbmr813HuNKg8Ycpgdh1yLmclvi2Xf/DlJjb75fvlbggsMmGQQpy5OfDyu98k
         w/QxFTNoQqqMgpQccDJhNWo4+OX0MdcQYkYGt2WG7epZCrOj8RXiE1BprCZqHtmfWDxH
         SHNjHtuXpikgP1nNI9Tan86VQbD44j1lVQu5iP7mm6at38ZiplAjURd471mSLMfEesA6
         6LW3laPHnAa1SEzzIvjy4LPSibLXpxqREHG3eMLwZmrYhp96ymABM4p/d5qNbp8zFWmg
         GWRg==
X-Forwarded-Encrypted: i=1; AHgh+RrRQW55KBi9+QQ4DjSRW39e/H5iNceLIGjl+9byApiQqfuc1Hku3TvpL73qz1q7XPwv39BntfVU/IEQhgGs@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8tgU6lEtAmWt11bICi4qFE2Ge4F9R7yiub7PBFMAyBu9TdVQX
	L4LNpzUNUEyaTL5DvVE2xvPw+wC3KaDmCA+L5Q7LGh7+OwdAFaVIvLuy2PyFldMSsRR5tOFloo0
	IaEMJDFD3wMPBwPWnN2OPVY4fg3o2t9EGtinw5d+hf1cQfsAwijjHO9Swu4k5HT6gsAjcIcoWT+
	KTD68k3y6ByATLYBB/SORtw6bY/lHW8RmBPCdVpF0ur2W+7Icg8Y8=
X-Gm-Gg: AR+sD12qNz9nTpSsw3L3ogYyzHkgQFeNMgOOIm5Lk/lmX58x1BytMwAJjrQNBxSqTa9
	fOGTUwMaqjTkhiAq4gyiYFVLQVk6/ZxJI//Phv+8x0REd2TAnA/Qltnl4wv6IeucVstcIi3KMwT
	cDoRWV3ar+Z5I5AoN4fpk+4zakiCePh5g4fVZCzcm5DESSq9I33kOoq1UqmBpJvmujNcicNdET8
	IkQOG/U9YuQu/UWlmjkePHyJvCoITCVz81Gr8s3I2HlCS8jiXxKYeoBrx3owW3glcWvZ0DbfNer
	PSz0jnJPOd+e4B9/xuy1X0aJ4d/Z
X-Received: by 2002:a05:620a:5627:b0:932:dd83:c58 with SMTP id af79cd13be357-934a07b750cmr710307885a.20.1785613715254;
        Sat, 01 Aug 2026 12:48:35 -0700 (PDT)
X-Received: by 2002:a05:620a:5627:b0:932:dd83:c58 with SMTP id
 af79cd13be357-934a07b750cmr710305485a.20.1785613714707; Sat, 01 Aug 2026
 12:48:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260730150524.2659577-1-atanas.filipov@oss.qualcomm.com>
 <20260730150524.2659577-2-atanas.filipov@oss.qualcomm.com>
 <3cbnmjmit4gsldga5nzct4odg6hpixzlwxbj72elnogyevr2tg@6esyjj2mvyom>
 <deee4b5e-167a-4f37-b2fa-84f06ec33721@oss.qualcomm.com> <fcc464a8-3d1c-4b6e-ab2d-ef61c4b18b2e@oss.qualcomm.com>
In-Reply-To: <fcc464a8-3d1c-4b6e-ab2d-ef61c4b18b2e@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Sat, 1 Aug 2026 21:48:23 +0200
X-Gm-Features: AUfX_mxmbfT1Z1eR_Kf3y3rx1cnQUqbuj9deYL3i4uDZpn5ilpTTYV2FZHV-wWk
Message-ID: <CAFEp6-3vecjDQE1DBwQXHoj5ez5ALUVq_iwS5UB4YxaW7YGckA@mail.gmail.com>
Subject: Re: [PATCH v6 1/3] dt-bindings: media: qcom: Add JPEG encoder binding
To: "Gjorgji Rosikopulos (Consultant)" <gjorgji.rosikopulos@oss.qualcomm.com>
Cc: Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-media@vger.kernel.org, bod@kernel.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, loic.poulain@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDE1OSBTYWx0ZWRfX/89EvhsOW3yq
 teHY0bC/OURj6TrwIAVQZDWSci/KDFxsvKKTOtQpreypeitSMMTM/K3mvpEXsrRLh0W+i+1pgM+
 dnzjKA+9UKq1r8pqdF81e9H0a8YVBOc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDE1OSBTYWx0ZWRfX14qs13VYcy1D
 RpoGdnhYUaqIRQZosqntGv2gmO0H/9tLdt/F7+s8G9ITgeYUxpRZOn1sJYliSzNfyqlLHc7m9Pu
 y//d9qcNx3h0XzDUdBUn/DGomzgC8MSihpPP8Qqh2tdAw+oTZNww7WGZAj1dhwBI6Tq98KQ8dhy
 Fa7tSPAyfV50vAq4/60BMzUAV5Ux1LHQHVcAaomxnsv1u+kPUGYRxHaYmZvPgUVXZHug/ZBslFJ
 0zOkHN29rZ5pkPuoGiiAXDje4KBpI7rr/Jg8L74K/EpeI6kYX+y28h2jQgljSbnFXNRP8/jhI5h
 zsuyHGyJrScpVGojE/dGo1gzlc7o4nLkeJTaR79mWDwXy3suUEXKifajmvQ0fcbccKuGmq1LcF8
 MScC6Y3dQI8zNBXVC+qb2yxsYnqRCrgwbafURo9UlVlQUm35rQW+BzliwyEtHewUTaamdxInmgM
 5Z9KM7JsldeKSkOqhqQ==
X-Proofpoint-GUID: zAIcDQS7uRhgCdlNgXPsteBoqGeCl31V
X-Authority-Analysis: v=2.4 cv=IYC3n2qa c=1 sm=1 tr=0 ts=6a6e4d93 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=gEfo2CItAAAA:8 a=D19gQVrFAAAA:8 a=EUspDBNiAAAA:8
 a=Hx90ccpqwVagkuezTpMA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=W4TVW4IDbPiebHqcZpNg:22
X-Proofpoint-ORIG-GUID: zAIcDQS7uRhgCdlNgXPsteBoqGeCl31V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608010159

On Fri, Jul 31, 2026 at 9:27=E2=80=AFPM Gjorgji Rosikopulos (Consultant)
<gjorgji.rosikopulos@oss.qualcomm.com> wrote:
>
> Hi Dmitry, Atanas,
>
> On 7/30/2026 7:24 PM, Atanas Filipov wrote:
> > On 7/30/2026 6:39 PM, Dmitry Baryshkov wrote:
> >> On Thu, Jul 30, 2026 at 06:05:22PM +0300, Atanas Filipov wrote:
> >>> Add device-tree binding for the Qualcomm JPEG encoder hardware block
> >>> present in SM8250 (Kona) SoCs.
> >>>
> >>> The JPEG encoder is a standalone hardware IP within the camera subsys=
tem
> >>> that performs JPEG compression in memory-to-memory fashion.  It is
> >>> separate from the CAMSS ISP pipeline and has its own register space,
> >>> interrupt, clocks, power domain, IOMMU streams, and interconnect path=
s.
> >>>
> >>> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> >>> ---
> >>>   .../bindings/media/qcom,sm8250-jpeg-enc.yaml  | 156 +++++++++++++++=
+++
> >>>   1 file changed, 156 insertions(+)
> >>>   create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8=
250-jpeg-enc.yaml
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-jpeg=
-enc.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.ya=
ml
> >>> new file mode 100644
> >>> index 000000000000..70f573100573
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.ya=
ml
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
> >>> +  Qualcomm JPEG Encoder is the JPEG encode hardware present in Qualc=
omm SoCs.
> >>> +  The encoder is a standalone hardware IP within the camera subsyste=
m that
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
> >>> +      SMMU stream ID for the JPEG hardware. The stream ID 0x2040 is =
used
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
> >>> +        compatible =3D "qcom,sm8250-jpeg-enc";
> >>> +        reg =3D <0x0ac53000 0x1000>;
> >>> +
> >>> +        interrupts =3D <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
> >>> +
> >>> +        power-domains =3D <&camcc TITAN_TOP_GDSC>,
> >>> +                        <&rpmhpd RPMHPD_MMCX>,
> >>> +                        <&rpmhpd RPMHPD_MX>;
> >>> +        power-domain-names =3D "titan_top", "mmcx", "mx";
> >>> +
> >>> +        clocks =3D <&gcc GCC_CAMERA_SF_AXI_CLK>,
> >>> +                 <&camcc CAM_CC_CORE_AHB_CLK>,
> >>> +                 <&camcc CAM_CC_CPAS_AHB_CLK>,
> >>> +                 <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> >>> +                 <&camcc CAM_CC_JPEG_CLK>;
> >>> +        clock-names =3D "sf_axi",
> >>> +                      "core_ahb",
> >>> +                      "cpas_ahb",
> >>> +                      "cnoc_axi",
> >>> +                      "jpeg";
> >>
> >> What are the pin input names for these clocks on the JPEG side? Can we
> >> use a better name?
>
> The name of the the clock on jpeg side(based on documentation we have) is
> cam_cc_jpeg_clk, There was comment from Krzysztof "https://lkml.org/lkml/=
2026/5/15/1112"
> to drop cam and clk, so it remains cc_jpeg or only jpeg.
>
> As i can see in ope patches ope_clk is named as "core", do we have some g=
eneral
> guidance how to name those clocks? or if you have any preference or propo=
sal it will
> be included in next patchset.

In ope series I named the clocks based on OPE block PoV ant its
function, so usually the main function clock (the one you named jpeg
above) is the 'core' clock, the AHB is usually for clocking the
'config' bus and the axi one is usually for the actual 'data' bus.
IMO, it's clearer like that.


> >>
> >
> > In my opinion, there is no such thing as a better name; the only
> > important thing is that it matches the HW documentation. As can be seen
> > from the clock names in the FW shown above. So, could you be more
> > specific about which names you would like to see used here?
> >
> > Regards,
> > Atanas
> >
> >>> +
> >>> +        interconnects =3D <&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACT=
IVE_ONLY
> >>> +                         &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_A=
CTIVE_ONLY>,
> >>> +                        <&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALW=
AYS
> >>> +                         &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>=
;
> >>> +        interconnect-names =3D "cpu-cfg",
> >>> +                             "sf-mnoc";
> >>> +
> >>> +        iommus =3D <&apps_smmu 0x2040 0x400>;
> >>> +
> >>> +        operating-points-v2 =3D <&jpeg_opp_table>;
> >>> +
> >>> +        jpeg_opp_table: opp-table {
> >>> +            compatible =3D "operating-points-v2";
> >>> +
> >>> +            opp-100000000 {
> >>> +                opp-hz =3D /bits/ 64 <400000000>,
> >>> +                         /bits/ 64 <100000000>;
> >>
> >> So, you've identified the issue earlier. The shared clocks need to be
> >> scaled, taking all users in account. Please come up with the solution
> >> too.
>
> One proposal is to have camnoc icc clock provider, there is implementatio=
n
> available and it will be posted, What is the preference to have different
> patchset or to have camnoc icc provider as part of this patchset new vers=
ion?
>
> Regards,
> ~Gjorgji
>
>
>
>
