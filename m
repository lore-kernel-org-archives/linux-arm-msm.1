Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F30D583ADA
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 14:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788963502; cv=pass; b=u3W9rOxfqEK2eyn+Lk2V7ad2zM3g9mn4M6L7cMjEDf5otafPxIlO3qvslVv9lF1Q9bggiLWD1kOCazRr9V62FUyJ9sl0uT1aflvn2s3m3/nN96A5nio+oFoZzQOtn+AL3EK4BCSVsRQrdE3LQElphV/toP/rrYrki1tlu9QU7/k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788963502; c=relaxed/simple;
	bh=72wFbPpMuGx15LH/m5cgHl7Zu8cKL7S6eHLd26lZQ2w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SUHQO27yRSjJXjNLiX9nk88YhKdIruKjwCj7wLehIOpdcbVHL0x+X/+CZiOuNViZZOhZlwKGRo/cAGNfSqVE1V0gAnp4mgdBH+0Qovt2H73Dtl/3DMemCmXsfGbtwdlLnIktkvXVzVhiKEtgdJ2LoB5xYarKGku37Yf6cHL67y0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y/J+12eK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aucAGEPs; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y/J+12eK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aucAGEPs"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BU7xY2375921
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Sep 2026 14:18:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ijz3qU9AqWAuODrFeJR7HLdMoz7Cv3StevXcIGLyJWM=; b=Y/J+12eKrVozqs4C
	HnJljqDlqmXV6Yxb3DzRrQXaBUUidRg8ZtB+2Ud8DkIaU1723WZAeSRojyDes+5S
	7lO4JcZI1Qb1faE86cSlbiQ/J6HSbD28LKekL3Opnr9mNI+fxAQV+EmHOi7cd9Mq
	YYLuEu0r3FCX8u8qwnyzKrjSiPLjKq6w0DTMvXKPiI0n+EkOZpYfHbucgDH43wg9
	GQGNMW4kezL8mfYWq26JR5VkurJriD9wMxe+sj90akccX5esHGizG62V/at55IXx
	BihoaMpINlvaWPjaaQ0+MSNfX7ZjEjbEyuKK0dwB1uArFbdgt9dShGgx7bByuNrB
	axahVQ==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk5ru0w7f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 14:18:18 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6b1b27d7ab2so8163085eaf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 07:18:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788963498; cv=none;
        d=google.com; s=arc-20260327;
        b=HvGbP28+27oQTt0+n59RdH91aheDsSmjxjzE5VyQ0vUnMVgm36k8ajkxlWYjMoze9h
         v72S4rKTMAbpRd90pqN8laJ5djTX1AQVzurHeIxffYPUjhxfKSebPIxv0Q7G/lTb+DRA
         dAohagSRCFRBXLOp311gEbwMSMqZHYXgdfbn2XqAypMft5AdKd/4RtWjSwYRsRtVPO6k
         XEbDkrpiYtczL1H1GkpjnbAXmlInA+wG4JtHD2ft1uvEVa0AzPpwdmYC0CRXVG4AXq3C
         wrFlsnFNtkBUgp6IJxtfEIwaZlKfSFQC7uPgkLnUidANi1+65+oD1E9OoOQipTB52j9R
         j0oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ijz3qU9AqWAuODrFeJR7HLdMoz7Cv3StevXcIGLyJWM=;
        fh=ABg+Hz7YmxrUqCTuneSDjcSjXqrX+ncBaxda637LN48=;
        b=ZN+WYNoumMXdAGcA3z/cLNg6VPJfKkv2kCT3D0v7H4n3NTawhA0wchADb72WjLMTNh
         j6371pAkquMNQKpYqzKNzBFewDX7VzI8PPL5Ti1iP6U5NLJ+Nqv9cn2jxKcVcUVCzvxG
         4ptzhBN8OAHAC3sd/N62RcISbiNE1L1xTz315Igzx9G/aUcmjSqzMEdrceG8RvfChKEL
         rTE0QUxFAPMjPnENvx7ZeVzncgvKorsvj2iKtR26Dr4arptZijQy5kuvOBFp2VW759bH
         OlIbH6Hhk/o0osnZW+9dFhUY9GZSdnwkklKuxNNl1z4TsHCX56X0b24tmG1bo/rvTqK7
         qqhg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788963498; x=1789568298; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ijz3qU9AqWAuODrFeJR7HLdMoz7Cv3StevXcIGLyJWM=;
        b=aucAGEPsnOtXAwzchxKu8I9ffBz8kvo2mRc5EMa7yurhxXAGZjrtAathG+qNOn4TzV
         sFB/n7gflvHe4ZpRqcGyW2fwKOgiexGWs9AOmnPQ38EWFMsFtdtIlqT6WSD1F6tvuaW6
         /iTkr1P1p8w6HjgxHHm8PZJ7U0CFXTJcek5QhiwEkAkoe5La/20lI+x1pufCAaO1Jyek
         vqVpwfcuqSn+jonqAm4JpJ/TCmlG3Lc1nZQsSUeDEaU/AwuqnaUG9yxdGBbuQDQTbA58
         ahW2r1zluSURFsB9DtYl7yHKiY8b9iexew6BXFcNeQLjJHXPRe2USu++2rP8wC9yCbIu
         cYvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788963498; x=1789568298;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ijz3qU9AqWAuODrFeJR7HLdMoz7Cv3StevXcIGLyJWM=;
        b=d1elZQN+aqkWLN+Z487l/RI1FYY/r0MdjSvFtHsYmfd7BahcOE0zVW48OjkIjOERK3
         3w0kH0Nec+QVWO0snShg4XuZk/sC+1Z0PquBHW8D6dVXra0fbPrVvg9dETVCFERPpF5w
         5g3xwbD/TIex29fm4ZMlq8Lq1LPfrYfbYR19V+EovrwZYkwzbLcUYVYUqWutFBbJ3Zxl
         5ALmDLB6M086fXZJvQEc9RWhIQ1hznjrcNmCfVs1EtupMrue8euhlYubja5aiUo5c6ak
         QN8f23mU1ayOu+9FBvw7QhadErzQHtrXO2IOn6YEn2jgcNY26BfFT00sJ7ni5/ycwNcb
         o2lg==
X-Forwarded-Encrypted: i=1; AKwUvBxQKRt5AvtRA6uCfHvp64ckXHJqu+i5XXfWH1AaWhO/lP9BitG6Qffa7oTP5Oyef1s2JGTkWzA6+iyrog7A@vger.kernel.org
X-Gm-Message-State: AFuF++k3Zx2TLhAaRJW/LtlZoMl9rA6iqAx5pKrnKQZnUjfotmxFSOr9
	t3Y11meDnBOUgylHlNH53aFjcxRrwwZGXTF3f0V5xWIQazTyEeqmvA6ANLkbEtkp7wATSQXT+QG
	f6/jqW9MX6mAx5sOwzfEpj0qKjNLEIsAVmBm/GsulvP6amb/8Z15PVam5S9/Ex/cUUal+BUtdIs
	o/nKXslDnxEw/8eCcFJoM7Zg9EnU2UMU+gEIbqxMtRBWE=
X-Gm-Gg: AYBFou0vJvTQxvsLFGf12yVbEeXCECxz2+Iq/RZvJFvXoaGfVeyC9Dm+PfIMn7HhYD6
	yLHgGyuOh+f6KNstgwl/+dT+pSleNryRTkeSUAtSMX8Fu4Yij8qkt6wOBoNGJwZs3m42NvU6zt9
	AeFSrmb0Q9cfnDygU9bIG7hz17wflHIsaCB7t9MYo7REh+4y8OYDba/gz9H9oGzA5G8d73wWM9D
	9Sn8QLYboD8viIl/ZxA9qYB3iDjojqCkoai+yt6g2neVjoXM56sIy/8RO2iFBoqXK9+1ln66DM=
X-Received: by 2002:a05:6820:f028:b0:6b7:46fa:1693 with SMTP id 006d021491bc7-6bee715a830mr787284eaf.40.1788963498132;
        Wed, 09 Sep 2026 07:18:18 -0700 (PDT)
X-Received: by 2002:a05:6820:f028:b0:6b7:46fa:1693 with SMTP id
 006d021491bc7-6bee715a830mr787232eaf.40.1788963497568; Wed, 09 Sep 2026
 07:18:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903-x1e-csi2-phy-v17-0-26606fa9a039@linaro.org> <20260903-x1e-csi2-phy-v17-1-26606fa9a039@linaro.org>
In-Reply-To: <20260903-x1e-csi2-phy-v17-1-26606fa9a039@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 16:18:06 +0200
X-Gm-Features: AcwNN1XeMPnSrK1BZl7UqBZ6XmAK9pb6YYlBOZlSZsTEkGUJatiu98s12aEsERY
Message-ID: <CAFEp6-1De_S+BwpDkH=Hkwc2YWe8m-cPBxkKCL86f=1fJ57xHg@mail.gmail.com>
Subject: Re: [PATCH v17 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=M+997Sws c=1 sm=1 tr=0 ts=6aa16aab cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=gEfo2CItAAAA:8 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8
 a=a1JshUc-Vb5zx_Q6SrkA:9 a=QEXdDO2ut3YA:10 a=k4UEASGLJojhI9HsvVT1:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: cDycWqbdKr-VFX3lT2SWeEqfHfaioXDf
X-Proofpoint-ORIG-GUID: cDycWqbdKr-VFX3lT2SWeEqfHfaioXDf
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE2MCBTYWx0ZWRfXxodlnX6SrQcR
 PtSZap9rPLCy00hMFEjcSJ+NJJlh+Dgnd7OEupqI3ohBbVUr8DXoTCbW/iemF77FxEGAtK2lhq+
 8H9zcdmem0z4SN0JmnP+VFstcGFRwGw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE2MCBTYWx0ZWRfXwNtuOQky/PeJ
 HY638QlzsnlQWWtctMjwMUuKJ6CkJ00eMI9aXyswBQx/7GM3Zs6//8kVWcwYWQnRu7jd6+HYkV3
 XUWXQ9Sd9EAV5v8HzNcxLCowNRTP6r1weGR+Qr/4LoWHMDvuzTPOJMjsDqJVjR7l6FIl9GPLWuS
 zroq6qqY7iyNqrBb3TEaUzZ2/r0h5fvyCkwA2k8Ho/zE5CuFVW6cwU+qnrEw81Cu6vjJhZz0nhR
 TY5RwJ8uRNIOF8PK6zvRELJYO9vRMVFyoA2HfT5LBhoVfl4565UIeeXxmBrogKs8y3Q9I3MQA7j
 nZrt5sXvC+aWE3yul3NjiFSKtmO2Ddifx+Gl0xL9IuwhBKGHlzyfRSX1YevWzj0KCZIzX0UCfIX
 uYK2Or7kqLfkwNM6bvKCQbtoBFVWKPcKho830vPJIWaO8SEhMzQu8VgqRvZi2vJNc3XRR3S8n77
 r8kiEnbqhDNR+d/oLyA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 spamscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609090160

Hi Byran,

On Thu, Sep 3, 2026 at 10:54=E2=80=AFPM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> Add a base schema for the MIPI CSI2 PHYs on Qualcomm SoCs. This PHY
> supports both DPHY and CPHY operation. A special mode of DPHY operation -
> called variously split-mode or combo-mode also allows for two sensors to =
be
> connected to one PHY.
>
> The schema supports both the D-PHY and C-PHY bus types.
>
> Suggested-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Checked, and some of the sashiko comments seem well-founded.

Regards,
Loic

> ---
>  .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       | 221 +++++++++++++++=
++++++
>  1 file changed, 221 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy=
.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> new file mode 100644
> index 0000000000000..993271c42fa06
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> @@ -0,0 +1,221 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/qcom,x1e80100-csi2-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm X1E80100 SoC CSI2 PHY
> +
> +maintainers:
> +  - Bryan O'Donoghue <bod@kernel.org>
> +
> +description:
> +  Qualcomm MIPI CSI2 C-PHY/D-PHY combination PHY. Connects MIPI CSI2 sen=
sors
> +  to Qualcomm's Camera CSI Decoder. The PHY supports both C-PHY and D-PH=
Y
> +  modes.
> +
> +properties:
> +  compatible:
> +    const: qcom,x1e80100-csi2-phy
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 3
> +
> +  clock-names:
> +    items:
> +      - const: core
> +      - const: timer
> +      - const: ahb
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  operating-points-v2: true
> +
> +  opp-table:
> +    type: object
> +
> +  power-domains:
> +    items:
> +      - description: Titan Top GDSC - Titan ISP Block, Global Distribute=
d Switch Controller.
> +      - description: MMCX voltage rail
> +      - description: MXC or MXA voltage rail
> +
> +  power-domain-names:
> +    items:
> +      - const: top
> +      - const: mmcx
> +      - const: mx
> +
> +  vdda-0p9-supply:
> +    description: Phandle to a 0.9V regulator supply to a PHY.
> +
> +  vdda-1p2-supply:
> +    description: Phandle to 1.2V regulator supply to a PHY.
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        description:
> +          Sensor input. Always present. A single sensor is described by =
a
> +          single endpoint with the D-PHY clock lane at position 0 and on=
e to
> +          four data lanes.
> +
> +          DPHY split mode, where two independent sensors share the same =
PHY,
> +          is described by two endpoints, each with its own clock lane po=
sition;
> +          endpoint@0 with clock-lanes =3D <0> and one or two data-lanes =
and
> +          endpoint@1 with clock-lanes =3D <3> and one data lane.
> +
> +        unevaluatedProperties: false
> +
> +        patternProperties:
> +          "^endpoint(@[01])?$":
> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
> +            properties:
> +              bus-type:
> +                enum:
> +                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
> +                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
> +                default: 4
> +
> +              clock-lanes:
> +                maxItems: 1
> +
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +                items:
> +                  minimum: 1
> +                  maximum: 4
> +                description:
> +                  Data lane positions following this endpoint's clock
> +                  lane. Positions are a per-port logical numbering, not
> +                  package pad or ball positions.
> +
> +            required:
> +              - data-lanes
> +              - remote-endpoint
> +
> +        allOf:
> +          - if:
> +              required:
> +                - endpoint@1
> +            then:
> +              properties:
> +                endpoint@0:
> +                  properties:
> +                    clock-lanes:
> +                      const: 0
> +                    data-lanes:
> +                      maxItems: 2
> +                endpoint@1:
> +                  properties:
> +                    clock-lanes:
> +                      const: 3
> +                    data-lanes:
> +                      items:
> +                        - const: 4
> +              required:
> +                - endpoint@0
> +            else:
> +              patternProperties:
> +                "^endpoint(@0)?$":
> +                  properties:
> +                    clock-lanes:
> +                      const: 0
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Output to the CAMSS CSID controller.
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - operating-points-v2
> +  - power-domains
> +  - power-domain-names
> +  - vdda-0p9-supply
> +  - vdda-1p2-supply
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,x1e80100-camcc.h>
> +    #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/media/video-interfaces.h>
> +    #include <dt-bindings/power/qcom,rpmhpd.h>
> +
> +    phy@ace4000 {
> +        compatible =3D "qcom,x1e80100-csi2-phy";
> +        reg =3D <0x0ace4000 0x2000>;
> +
> +        clocks =3D <&camcc CAM_CC_CSIPHY0_CLK>,
> +                 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
> +                 <&camcc CAM_CC_CORE_AHB_CLK>;
> +        clock-names =3D "core",
> +                      "timer",
> +                      "ahb";
> +
> +        interrupts =3D <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
> +
> +        operating-points-v2 =3D <&csiphy_opp_table>;
> +
> +        power-domains =3D <&camcc CAM_CC_TITAN_TOP_GDSC>,
> +                        <&rpmhpd RPMHPD_MMCX>,
> +                        <&rpmhpd RPMHPD_MX>;
> +        power-domain-names =3D "top",
> +                             "mmcx",
> +                             "mx";
> +
> +        vdda-0p9-supply =3D <&vreg_l2c_0p9>;
> +        vdda-1p2-supply =3D <&vreg_l1c_1p2>;
> +
> +        ports {
> +            #address-cells =3D <1>;
> +            #size-cells =3D <0>;
> +
> +            port@0 {
> +                reg =3D <0>;
> +                csiphy0_in: endpoint {
> +                    bus-type =3D <MEDIA_BUS_TYPE_CSI2_DPHY>;
> +                    clock-lanes =3D <0>;
> +                    data-lanes =3D <1 2 3 4>;
> +                    remote-endpoint =3D <&sensor_out>;
> +                };
> +            };
> +
> +            port@1 {
> +                reg =3D <1>;
> +                csiphy0_out: endpoint {
> +                    remote-endpoint =3D <&csid_in>;
> +                };
> +            };
> +        };
> +
> +        csiphy_opp_table: opp-table {
> +            compatible =3D "operating-points-v2";
> +
> +            opp-300000000 {
> +                opp-hz =3D /bits/ 64 <300000000>;
> +                required-opps =3D <&rpmhpd_opp_low_svs_d1>,
> +                                <&rpmhpd_opp_low_svs_d1>;
> +            };
> +        };
> +    };
>
> --
> 2.55.0
>
>
