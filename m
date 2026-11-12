Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794472901;
	b=2jagHahF3X6R2nqkKdWAHCEvE7sHfxz/ONITDAhhC+pfuc6de4LHF3B7noPqCtxrOeD/
	 1RQIV68LmgXEFDCd0k87hcxdn8y9f2XtHkM0OA3gEM2KFLDt0xkT3CzC4vHg1Vyu5sof8
	 U9f1yiIM3+YZB3kYDSw0vE4GG2EM7xCOYIKIraHIxlERUyN4Sb1O6bxqYiHdepGgMsN78
	 eiuvnIEJubmUK8sUqVrj2UzBJS4V0ro5um5tR8ZmXMNVIiWiyAsGoPkeCt7GWVOb2o2Ie
	 LzSdVvvLVkofIDFZi9yTHbF83xkHSNZQMVGFaEKHnObxp318aYKkxN0xpjgj1mOUOcw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472901;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=/MOVCx9PdrviQB3rgdWVaSwH94I9OOZbBeSGMzFF5Ik=;
	b=m6r3Ed38wmC4nWQTHaBt+AcyMwfSYUrkXvGjgF0IHqVFRsTcYa7p2zNV9GCeCA9+q6UZ
	 lv6zTVSFmJXoMYMtS5+T21x4AW6oEcUX3PCqM36TBJV29SEk7N8uLjy7Nrkz5+oU6Ywul
	 gpzT1a53kaHlJ3j2oJvI4Iqtt3n+SRiobRWQ1CQ45hghZ1MfaoUO9AfJMxnSfkCbSYm3F
	 O1VB7ynvRPWxtvNAKqpzqv1zxgF48bqyTbYcLG9qZQmqiwO7AdM09htdc+cAQPixPIpta
	 G1gs5XKOw/C0tYgewY6/eik8M7bEa1jRZRl7kOaNz4J6e9O9FbxU3xiG/Ei0NUvo01A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z1EyHatP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QSbfauUd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90E6606A89D
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 08:41:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A90E6606A89D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z1EyHatP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QSbfauUd
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2ZQ9w4092474
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 08:41:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/MOVCx9PdrviQB3rgdWVaSwH94I9OOZbBeSGMzFF5Ik=; b=Z1EyHatPMaX6ot4M
	5BaelCJrRQBd+u2LVmN2dGGoww9GhSfxC4pxfVKHyIPiGpGwcf56oTe0MoOYljFd
	9wjeyMWjJl5zFsS3liVBRb88lub0WzOQO9pJ6IeQudSufKu+s2GkLStWKWG47JPx
	nxwW6BBEhyBWjQmURWa6VZLhM+9N+JHTP6RJhMinRXLST8AkykzcqyqtNsOrbWgn
	3TYJCMob73hywpYSs8OxcR6c3J3YaaKvnsMWhwb6pqocPZltWtz1/L9JQzup69S3
	rz3HqftfJ96lyRFyt4QE0C4aSmFJAwip11ItdLAT1yADCQwzhmP7aJkeUfkwCOsj
	hkHJyw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw0m8j0fd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 08:41:39 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f26dd2165so1060346485a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 00:41:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794472899; cv=none;
        d=google.com; s=arc-20260327;
        b=Nepp1xi3nD9KcxAaOFlGjwd5Ot5UE6mpPFEEqa704D/g33xTkyfM3dOQH/b4ldUGJ2
         lTry1Fw+vM6OHjF9TBYNrz9srCMONc7+sbMjqnw5NzwP/RNOIULn4H1GO5sWueo1TPo2
         0MhiGtskYaEU4Sz6vNy/dMEgLLA0vNH2EioJMDsqb5F1xzy/SDiX+IS18RyBKYk+6+F9
         i0IJf88E6X8XXkfO8aJnzr6hIyO72Je2jXBVZqGrNcJfK7+SRCPbZoMvIM8Q7gIg1yJF
         eI6p8YhosctpIJ7S/hBLfr7FdDw5z7ulVMyJbd4KVO+7F7rmqw4uFU/vAmETPHGn3Mf1
         0AzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/MOVCx9PdrviQB3rgdWVaSwH94I9OOZbBeSGMzFF5Ik=;
        fh=arOa1ks3Mf4nhMe/ixxGf0knSuBa25FbDBt+11DT+Dc=;
        b=UxQwFRuUwp9OcZB2OiAKAY3QbWtwbAjyIedoFs6Mo3mNNXAgrvfrZx/jyb6MjJ7u13
         WDIKhOEJv49G+zxGC1XpMR7+ceWoSr3BZChwH25/EDixMX2OJJYr+fTa58fXFoweWbQD
         eSba8YpubWnHHbm66+vT08bCDlAR27QR9wxLTg8j7KS28BHb5vc8ZYDkomR3VafTcFC7
         vqJ2NAEcQNabVZhH8P2Riuv3t9q2mSXUw9hInjdKcTexE1X0d255iJGCf52KvcowZ0r+
         rCXZ9hBcPiIefbJ/EwcOmaIJU6FFLz3KU4xKOEvkTZZow3rv6rIwSadq0WV19uAl22TZ
         g3EQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794472899; x=1795077699; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/MOVCx9PdrviQB3rgdWVaSwH94I9OOZbBeSGMzFF5Ik=;
        b=QSbfauUdtCbpBF2jI65s5xT7yk1VP9ijV/S86M6erAL2zONUDbkXm4+GtE+PhvCKwA
         IukOFMcWT2PyA3TRr6LJ3WRBqp2frNL1gfO7PHGNHRvjjtV6EVnus5qMdhGZtcYb9jzT
         udorb6Zihc7Q6sQRYJyMy7uu2eIO2Wa02l4kUgQeg45MN3GsS/TEZT8LHAcQstQaXq30
         vJ0f+zorzW2TwRncZVrFE8jZEbY7bkDJWgM8yfaiUjQjNJU/JNRlFD/3OLyGFCsmN3/v
         8tqvzD2IxPcr+onC3ZCwFA5WioPe1hcWy9FeeYsYqhaSzOnI35HYEtxYXXUVKZuWqXI0
         4Aag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794472899; x=1795077699;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/MOVCx9PdrviQB3rgdWVaSwH94I9OOZbBeSGMzFF5Ik=;
        b=Oy3FWbai97w4ECwNAIp+mXqlmpK0keYotiGwgw6pBQVKWxt6RjXgeb4qFkVrwJVF+5
         Cnp3blXVmj22fHbjLBIMDsVNhHhP8AqAn8GSiBRWIB7qyGHVtUs1zwn+fHuqn87slXoI
         swUi8g4UAeaP/Je6bEvIsRjXnpJ/fC/3CAVr+HDPrM7dr27E0reLbunAoVxyuRNz17D+
         cUSNsjXWKobfg5OHkt3LhOzSrrC4lWjF1G/yy/5aeRf+YxZ5RKgTOsy6RU3QkgQWONSB
         KkJz7Se5hraXLN1EP9qQRCBKpMf6tbiNFQKprw8stKEW6Y2ilzdpTw/jBkAHCXML5C2X
         yrFg==
X-Forwarded-Encrypted: i=1; AL+hErE+zKkwyd6MOVqGzIseuMXecNts6sYwDSVPpRtLNHZhWKWfEXYtR43/ShiY0BZr5QxJiYPo1/L7A2NIupfw@vger.kernel.org
X-Gm-Message-State: APuU4Z/BUcFm1V+DM5loIR+ehebX5ChujaMAU1TwlKHfI6P35MLGRwRA
	rWE0m7ZTpDNxpszm8G47koZ4OSE01kGUPkIQPaqCg1HGKy7K3zsotxlwnSTZqckz5zdCON2JOep
	eLJ7IucNsyv6in/8JBqU8e+dGD+n6h86A2dWRkYdiI+8Pp9dTMJLMjYUqI2KlW29AreZRM1+jNY
	esrC9ymkPMIT6CUh7i/HVW+04LLvgwEzkX3KLAtWJteCo=
X-Gm-Gg: AYBFou2ZPWqhCt3iP1KER3/jH+1sXVNuA0siPmC2kXQFD1QXfXbaggrt9gHwfAOS+1y
	lfpEQQlzOK6ptzK59WzpYlYaEclnJAT70A/Jz9Jh73r+JNDmYAm5vA4FOlny8+PWh5tyu2Q1ccE
	HmSXHqm+ol/BbdjLoh0MRYQMWJqbfSDcCK49fGeQvBkE9sJbGmgZGvovKhtR06EVdyTEzSa7Mps
	Jb8wv9lgQlVLt/Bc0/fVLQMVsUZah1v20YLKbPVMsldy9u+wIMfchtFf1JZW6V0+AnEGtjffho=
X-Received: by 2002:a05:620a:29c9:b0:93e:7dfa:2f3f with SMTP id af79cd13be357-947b00201a2mr849199885a.62.1794472898723;
        Thu, 12 Nov 2026 00:41:38 -0800 (PST)
X-Received: by 2002:a05:620a:29c9:b0:93e:7dfa:2f3f with SMTP id
 af79cd13be357-947b00201a2mr849197285a.62.1794472898061; Thu, 12 Nov 2026
 00:41:38 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110163909.78085-1-atanas.filipov@oss.qualcomm.com> <20261110163909.78085-2-atanas.filipov@oss.qualcomm.com>
In-Reply-To: <20261110163909.78085-2-atanas.filipov@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 09:41:27 +0100
X-Gm-Features: AclHuK_y_fjpiV6obT_WtVqv7QGfmoWmqqnBvzPuhgwLPzV3bZAbPmW-Fiags_M
Message-ID: <CAFEp6-1dryYHtVme6M7opGHUen3vC+DyLJM8J1WKqVp6zwMWWQ@mail.gmail.com>
Subject: Re: [PATCH v8 1/8] dt-bindings: media: qcom: Add JPEG encoder binding
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, bod@kernel.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, loic.poulain@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com,
        gjorgji.rosikopulos@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzNCBTYWx0ZWRfX0+VcRf4p/8Hj
 oaYyth9OVGvYj3fQnEvc+O8Nyb0VHqBJT1MLaBoTrHrdRL93SzLT778t7Jx4itdzlWhkwW41Gob
 UuAG+rlkYh76hdvkxE3YQt4Fi4lSZ40=
X-Proofpoint-GUID: Ox3JRFfpkJoMEvyZ9RXvT7BHQR69BMkw
X-Proofpoint-ORIG-GUID: Ox3JRFfpkJoMEvyZ9RXvT7BHQR69BMkw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzNCBTYWx0ZWRfX0lRlvBWDC8/U
 czBW8WG7mxYoiktzz4XDkBzEP24IXEo/mOF52RjBEp2sFuFb1McTpSInPQlvl487GpcKoAFT33l
 r29SI4xJbFADhTmwwmPr3TEcyMxt8Fxau/+Zf5gb0KbQKATuw1dEhhDXazVXoZPxBY+HbULXpuM
 HWHTKnxrjNnoe0+tSrgRSExq4PSY2QehAKA9Ny8LW4DJqDwvADMQVozh5oPDs54m2jiwJxJd+pI
 N2+VB5++bMyxqsxzMfjK20PVJ/S3/qbj+N67ndZbr2DVdY5YuOq9I8TgxT+Gj6TWZpYzIfHBPDn
 Lyc75STqVQnhbAERP6lIAyoZ29+j0umjpgNRdIU1IFawfprNeATrO1A5bUFnXgQdZZsH5J7XsdS
 2ctcQwv3dXxW5BAkp3eJKVxdISnUVmVRVwNv2+NRBAgQp0P72fi6n+sOZ7AiX49d3brO+Ff86jr
 yWubA7Op2Pr2tYdb5cQ==
X-Authority-Analysis: v=2.4 cv=Q9dHcI2a c=1 sm=1 tr=0 ts=6af57bc3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=C43g6bSQiVhdG0YezvUA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120034

Hi Atanas,

On Tue, Nov 10, 2026 at 6:16=E2=80=AFPM Atanas Filipov
<atanas.filipov@oss.qualcomm.com> wrote:
>
> Add device-tree binding for the Qualcomm JPEG encoder hardware block
> present in SM8250 (Kona) and SC7280 (Kodiak) SoCs.
>
> The JPEG encoder is a standalone hardware IP within the camera subsystem
> that performs JPEG compression in memory-to-memory fashion.  It is
> separate from the CAMSS ISP pipeline and has its own register space,
> interrupt, clocks, power domains, IOMMU stream, and interconnect path.
>
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> ---
>  .../bindings/media/qcom,sm8250-jpeg-enc.yaml  | 190 ++++++++++++++++++
>  1 file changed, 190 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8250-j=
peg-enc.yaml
>
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc=
.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml
> new file mode 100644
> index 0000000000000..112580f3df10b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml
> @@ -0,0 +1,190 @@
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
> +  Qualcomm JPEG Encoder is the JPEG encode hardware present in Qualcomm =
SoCs.
> +  The encoder is a standalone hardware IP within the camera subsystem th=
at
> +  performs JPEG compression in memory-to-memory fashion.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,sc7280-jpeg-enc
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
> +      - const: core
> +      - const: bus
> +      - const: config
> +      - const: cpas
> +      - const: camnoc_axi
> +
> +  power-domains:
> +    minItems: 2
> +    maxItems: 3
> +
> +  power-domain-names:
> +    minItems: 2
> +    maxItems: 3
> +
> +  interconnects:
> +    maxItems: 1
> +
> +  interconnect-names:
> +    items:
> +      - const: camnoc
> +
> +  iommus:
> +    description:
> +      SMMU stream ID for the JPEG hardware.
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
> +  - operating-points-v2
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,sc7280-jpeg-enc
> +    then:
> +      properties:
> +        power-domains:
> +          items:
> +            - description: Titan top GDSC
> +            - description: CX power domain
> +        power-domain-names:
> +          items:
> +            - const: titan_top
> +            - const: cx
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,sm8250-jpeg-enc
> +    then:
> +      properties:
> +        power-domains:
> +          items:
> +            - description: Titan top GDSC
> +            - description: MX power domain
> +            - description: MMCX power domain
> +        power-domain-names:
> +          items:
> +            - const: titan_top
> +            - const: mx
> +            - const: mmcx
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,camcc-sm8250.h>
> +    #include <dt-bindings/clock/qcom,gcc-sm8250.h>
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
> +        power-domains =3D <&camcc TITAN_TOP_GDSC>,
> +                        <&rpmhpd RPMHPD_MX>,
> +                        <&rpmhpd RPMHPD_MMCX>;
> +        power-domain-names =3D "titan_top", "mx", "mmcx";
> +
> +        clocks =3D <&camcc CAM_CC_JPEG_CLK>,
> +                 <&gcc GCC_CAMERA_SF_AXI_CLK>,
> +                 <&camcc CAM_CC_CORE_AHB_CLK>,
> +                 <&camcc CAM_CC_CPAS_AHB_CLK>,
> +                 <&camcc CAM_CC_CAMNOC_AXI_CLK>;
> +        clock-names =3D "core",
> +                      "bus",
> +                      "config",
> +                      "cpas",
> +                      "camnoc_axi";

I find the clock names a bit inconsistent. For example, camnoc_axi
explicitly refers to an AXI clock, whereas bus is much more generic
and does not follow the same naming convention.

I don't have a strong preference, but perhaps 'bus' could be renamed
to 'data' or 'nrt_data' (SF path is associated with non-real-time
resources).

Similarly, for camnoc_axi, maybe something like 'camnoc' or 'camnoc_data'.

> +
> +        interconnects =3D <&mmss_noc MASTER_CAMNOC_SF 0 &mc_virt SLAVE_E=
BI_CH0 0>;
> +        interconnect-names =3D "camnoc";
> +
> +        iommus =3D <&apps_smmu 0x2040 0x400>;
> +
> +        operating-points-v2 =3D <&jpeg_opp_table>;
> +
> +        jpeg_opp_table: opp-table {
> +            compatible =3D "operating-points-v2";
> +
> +            opp-100000000 {
> +                opp-hz =3D /bits/ 64 <100000000>;
> +                opp-peak-kBps =3D <262560>;
> +                required-opps =3D <&rpmhpd_opp_svs_l1>,
> +                                <&rpmhpd_opp_low_svs>;
> +            };
> +
> +            opp-200000000 {
> +                opp-hz =3D /bits/ 64 <200000000>;
> +                opp-peak-kBps =3D <524760>;
> +                required-opps =3D <&rpmhpd_opp_svs_l1>,
> +                                <&rpmhpd_opp_svs>;
> +            };
> +
> +            opp-400000000 {
> +                opp-hz =3D /bits/ 64 <400000000>;
> +                opp-peak-kBps =3D <978600>;
> +                required-opps =3D <&rpmhpd_opp_svs_l1>,
> +                                <&rpmhpd_opp_svs_l1>;
> +            };
> +
> +            opp-480000000 {
> +                opp-hz =3D /bits/ 64 <480000000>;
> +                opp-peak-kBps =3D <1095600>;
> +                required-opps =3D <&rpmhpd_opp_svs_l1>,
> +                                <&rpmhpd_opp_nom>;
> +            };
> +
> +            opp-600000000 {
> +                opp-hz =3D /bits/ 64 <600000000>;
> +                opp-peak-kBps =3D <1095600>;
> +                required-opps =3D <&rpmhpd_opp_svs_l1>,
> +                                <&rpmhpd_opp_turbo>;
> +            };
> +        };
> +    };
> --
> 2.34.1
>
>
