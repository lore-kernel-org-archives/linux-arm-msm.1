Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793928573;
	b=2sMEonPdKrh1flJfTCtJuH9YPD+ClyxCc5n7D+pdBpT05xvBkFuo8lXSl6FlMokGaBS0
	 O0JdODn3IHaLakF5bQt4aOFpAhr6ske1pR4mGpdBFZSOKHRvQaUEGXxbTCY9K5pGge57W
	 G3pZRSMw7WKXkJFw5tMpR2nTrp6JZ5jghNNJ/MnhXQ6NTodaNOpkR4LyPFvrSasSo+Yzx
	 sA6da77CX0Be1MFY/KghWSXl9pTjTN5peJQRG4/jj8HuOhSPxWVlXK+tXpzZXuO42Ji4t
	 X2/e/L/rxwnpHSadD4hz/lzeq5FkcPUim2FbUUo4aSGGNFJszb0zzUYS9gXxPZQHJlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793928573;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=3KxWjpfaqo8SQM/vpTeTV3YkdjdLNFU73Mw7ehoYbPY=;
	b=pTkZoi1hqEs42V3jeLEknhDZmUAB6s3rf4h8TWUcw29LRs6zWscLcRRoxnXR2mfdADCu
	 nES5r4vmHmVpOzSj8H1vRZLgjT8ftLPwSdy2nf1aGUJu/pbW4evCdgmhymFvUj7oSDnQy
	 qjqWcLw5DC//Z0Fc1aad2VT7iXDA4kQPVsM4VK2nDotWKeUHxi/NSURkOXjVZR0jXw2I5
	 PKTM0nizvC6w+2Sc/sGNMlu6PxQlnEEdI0eObv/eWg9am+02YNnrGQ0UIuGlY13wayKU7
	 6BjmTA8RU8uwrZMsxusy1wYsWSQWmojFBMaHTr+9R+/JUe1Wtnw0VDvJAgwMmxvH5Zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=andrewgigena.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.167.54
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD19B606A332
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 01:29:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD19B606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=andrewgigena.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5be42ae8eb1so77115e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 17:29:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793928570; x=1794533370;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3KxWjpfaqo8SQM/vpTeTV3YkdjdLNFU73Mw7ehoYbPY=;
        b=VsMMH3oehMBXZm8+rAbty/B4rFwUBjqq8c1DxbsE5yN5t/Bh+gLe7tP9wUaXvbTAxs
         FK+5IVCHmbmJf0EcyfqTZ2ccL9wtE4ePZv/NbQ2cR1Joe6qIjnsqw/Y9kAAvVD4sdYn9
         UPJUYE28wVcr436vK6Iu4+E+6VWeMoU2NMfx2L+mt58GWLz3o8w6EWcWm2LjeFGX13a0
         GDXSvEsew17k0SGvOWr4OGGWxXnCFdzcTgVh4DRBH5gXUHOOrxG01XyzlkKcgmWpmF/g
         CZW4nf38fsU9HklpefEaVT7kmo5O16f67tfylfr0E/yLnTG8RtzVJ/j9EMqXO+g81WsQ
         hLBQ==
X-Forwarded-Encrypted: i=1; AKwUvBz0XAX4/00xcUnOVbdAxqghjzEx9aZU/RPl5BlGWRDcF8IgOe6iDcqzUrAIJTu6ID5I7ZiVoflqo+5u5VwE@vger.kernel.org
X-Gm-Message-State: APuU4Z/W3lKx+XHOZEktdpuAb09lOuUBlC0FWm8Uteey+sWfh3LE/2v0
	aUgyo6UemHDtW3OK0uilul0nVyovlvyIK5ci7uvWChZ+CP3rssftm1zRJ1labJxWZE8NFw==
X-Gm-Gg: AYBFou1AnNX4Jeee8/tAIhY8kmBWIXTErkfxtv/zFbuC2PpstYUqqppzHYkoxEqiAqp
	QVBwBiKecMHyYDZANluw2egCge8u4YPW9IXln6dGginLt21LHorftCvS6F8UAz5+K41es395QBA
	Cgx6FvrEUAmENn6AQpVYqBj/zjeMzFDxz1O36f7Nw7BAPCX1F23F8PuF0XxyTYNfDhSO65gehus
	n3NXUZAHB0R2oS8MeVDTCgwxfOg6zelmcQGYmJTGEikmG+wUhGykraltQXmy+UW9Qx0A/fn26zX
	l7tbi+I83SWCHAiw36yu7Yf5JMxlyk4yQHnhWcg2hp7OqsOb4yZJKeLVxIAFd9UHKqlFzMFeItJ
	qhQSzkhJw/GQhX47uxuX6rN1foQV3qQ2fUS59CY7km1v551eV0YJ2+/pAVIE12nt+HGqXDkBG4m
	s/pdJtYH/4cyKjhUa18U3ZCLSq7PX32Y2yfQKvktfT0eQ5oatIGl9YwL9ByW34bfoAVZHhgrTRs
	I/HJpxIvV/Z+2UUX8j6/y8t4WdN4seCZN/WtlHTdX2xZiKb0HuaymkIJAKxUyUjzzPOA3iOZl2B
	oncZl2ClnefRMabvNwqKvs9AuHJ5ZktBHejXpOLPEffMTYbMJ/7EtZDQYlgAv/jBeTrbp6U=
X-Received: by 2002:a05:6512:234a:b0:5b8:997b:c606 with SMTP id 2adb3069b0e04-5c003c2455amr220499e87.41.1793928570193;
        Thu, 05 Nov 2026 17:29:30 -0800 (PST)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com. [209.85.208.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c00306f07fsm120014e87.47.2026.11.05.17.29.28
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 17:29:29 -0800 (PST)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3ab30b3212aso548751fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 17:29:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxzpGdvlKKuv80vemLxniJc/Q5mzgKNgQqcRZymEhFdj12p0folq5qJJBzOgXyoeEwAygS/u9K3GsvYvdZy@vger.kernel.org
X-Received: by 2002:a05:651c:986:b0:3ac:dda0:efbb with SMTP id
 38308e7fff4ca-3acf3a25338mr1661661fa.13.1793928568094; Thu, 05 Nov 2026
 17:29:28 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sm8150-v7-4-rc1-camss-v1-0-7a9534a9a22f@andrewgigena.dev>
 <20261104-sm8150-v7-4-rc1-camss-v1-2-7a9534a9a22f@andrewgigena.dev> <427eb0e0-5e10-4f24-8686-4d06c26cdd13@linaro.org>
In-Reply-To: <427eb0e0-5e10-4f24-8686-4d06c26cdd13@linaro.org>
From: Andrew Gigena <mail@andrewgigena.dev>
Date: Thu, 5 Nov 2026 22:29:00 -0300
X-Gmail-Original-Message-ID: <CANn8UmeQ6xZrAhh2vZjQrE8T-7fuXGmit3mWZEk84jXr5swrZA@mail.gmail.com>
X-Gm-Features: AclHuK8NOfvUAyvAvt9Js3wdnmHbN8KjHpgXufQfg3Uwb9Zb3MCa1-UVWRBODBY
Message-ID: <CANn8UmeQ6xZrAhh2vZjQrE8T-7fuXGmit3mWZEk84jXr5swrZA@mail.gmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: media: qcom,sm8150-camss: Add SM8150 CAMSS
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: mail@andrewgigena.dev, Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"Bryan O'Donoghue" <bod@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bryan,

Agreed on the *_src clocks. They are internal CAMCC RCGs, and the leaf
branch clocks already propagate rate and enablement through
CLK_SET_RATE_PARENT, so v2 drops all of them (42 -> 27 clocks) in the
binding, the example and the DTS.

The other binding nits from Sashiko's review are fixed as well:
clock-lanes is gone and the example uses an unnumbered endpoint, and the
vdda-phy-supply and vdda-pll-supply descriptions now say 0.88 V and
1.2 V.

Thanks,
Andrew

El mi=C3=A9, 4 nov 2026 a la(s) 7:44=E2=80=AFp.m., Bryan O'Donoghue
(bryan.odonoghue@linaro.org) escribi=C3=B3:
>
> On 04/11/2026 20:54, Andrew Gigena via B4 Relay wrote:
> > From: Andrew Gigena <mail@andrewgigena.dev>
> >
> > Document the Qualcomm SM8150 Camera Subsystem. The IP integrates four
> > CSIPHY, four CSID (two full and two lite), two VFE and two VFE-Lite
> > instances, with 42 clocks, 12 interrupts, eight IOMMU streams, four
> > interconnect paths and three power domains.
> >
> > SM8150 has a different register layout, clock tree and power domain
> > topology from SM8250, so describe it in a dedicated schema instead of
> > using qcom,sm8250-camss as a fallback.
> >
> > Signed-off-by: Andrew Gigena <mail@andrewgigena.dev>
> > ---
> >   .../bindings/media/qcom,sm8150-camss.yaml          | 477 ++++++++++++=
+++++++++
> >   1 file changed, 477 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/media/qcom,sm8150-camss.=
yaml b/Documentation/devicetree/bindings/media/qcom,sm8150-camss.yaml
> > new file mode 100644
> > index 000000000000..a65067352b58
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/qcom,sm8150-camss.yaml
> > @@ -0,0 +1,477 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/qcom,sm8150-camss.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Qualcomm SM8150 Camera Subsystem (CAMSS)
> > +
> > +maintainers:
> > +  - Andrew Gigena <mail@andrewgigena.dev>
> > +
> > +description: |
> > +  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
> > +
> > +properties:
> > +  compatible:
> > +    const: qcom,sm8150-camss
> > +
> > +  clocks:
> > +    minItems: 42
> > +    maxItems: 42
> > +
> > +  clock-names:
> > +    items:
> > +      - const: camnoc_axi
> > +      - const: camnoc_axi_src
> > +      - const: cpas_ahb
> > +      - const: cphy_rx_src
> > +      - const: csiphy0
> > +      - const: csiphy0_timer
> > +      - const: csiphy0_timer_src
> > +      - const: csiphy1
> > +      - const: csiphy1_timer
> > +      - const: csiphy1_timer_src
> > +      - const: csiphy2
> > +      - const: csiphy2_timer
> > +      - const: csiphy2_timer_src
> > +      - const: csiphy3
> > +      - const: csiphy3_timer
> > +      - const: csiphy3_timer_src
> > +      - const: vfe0_axi
> > +      - const: vfe0
> > +      - const: vfe0_src
> > +      - const: vfe0_cphy_rx
> > +      - const: vfe0_csid
> > +      - const: vfe0_csid_src
> > +      - const: vfe1_axi
> > +      - const: vfe1
> > +      - const: vfe1_src
> > +      - const: vfe1_cphy_rx
> > +      - const: vfe1_csid
> > +      - const: vfe1_csid_src
> > +      - const: vfe_lite0
> > +      - const: vfe_lite0_src
> > +      - const: vfe_lite0_cphy_rx
> > +      - const: vfe_lite0_csid
> > +      - const: vfe_lite0_csid_src
> > +      - const: vfe_lite1
> > +      - const: vfe_lite1_src
> > +      - const: vfe_lite1_cphy_rx
> > +      - const: vfe_lite1_csid
> > +      - const: vfe_lite1_csid_src
> > +      - const: slow_ahb_src
> > +      - const: gcc_ahb
> > +      - const: gcc_axi_hf
> > +      - const: gcc_axi_sf
> > +
> > +  interrupts:
> > +    minItems: 12
> > +    maxItems: 12
> > +
> > +  interrupt-names:
> > +    items:
> > +      - const: csiphy0
> > +      - const: csiphy1
> > +      - const: csiphy2
> > +      - const: csiphy3
> > +      - const: vfe0
> > +      - const: csid0
> > +      - const: vfe1
> > +      - const: csid1
> > +      - const: vfe_lite0
> > +      - const: csid_lite0
> > +      - const: vfe_lite1
> > +      - const: csid_lite1
> > +
> > +  iommus:
> > +    maxItems: 8
> > +
> > +  interconnects:
> > +    maxItems: 4
> > +
> > +  interconnect-names:
> > +    items:
> > +      - const: cam_ahb
> > +      - const: cam_hf_0_mnoc
> > +      - const: cam_hf_1_mnoc
> > +      - const: cam_sf_0_mnoc
> > +
> > +  power-domains:
> > +    items:
> > +      - description: IFE0 GDSC - Image Front End, Global Distributed S=
witch Controller.
> > +      - description: IFE1 GDSC - Image Front End, Global Distributed S=
witch Controller.
> > +      - description: Titan Top GDSC - Titan ISP Block, Global Distribu=
ted Switch Controller.
> > +
> > +  power-domain-names:
> > +    items:
> > +      - const: ife0
> > +      - const: ife1
> > +      - const: top
> > +
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +
> > +    description:
> > +      CSI input ports.
> > +
> > +    properties:
> > +      port@0:
> > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > +        unevaluatedProperties: false
> > +        description:
> > +          Input port for receiving CSI data from CSIPHY0.
> > +
> > +        properties:
> > +          endpoint:
> > +            $ref: video-interfaces.yaml#
> > +            unevaluatedProperties: false
> > +
> > +            properties:
> > +              clock-lanes:
> > +                maxItems: 1
> > +
> > +              data-lanes:
> > +                minItems: 1
> > +                maxItems: 4
> > +
> > +              bus-type:
> > +                enum:
> > +                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
> > +                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
> > +
> > +            required:
> > +              - clock-lanes
> > +              - data-lanes
> > +
> > +      port@1:
> > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > +        unevaluatedProperties: false
> > +        description:
> > +          Input port for receiving CSI data from CSIPHY1.
> > +
> > +        properties:
> > +          endpoint:
> > +            $ref: video-interfaces.yaml#
> > +            unevaluatedProperties: false
> > +
> > +            properties:
> > +              clock-lanes:
> > +                maxItems: 1
> > +
> > +              data-lanes:
> > +                minItems: 1
> > +                maxItems: 4
> > +
> > +              bus-type:
> > +                enum:
> > +                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
> > +                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
> > +
> > +            required:
> > +              - clock-lanes
> > +              - data-lanes
> > +
> > +      port@2:
> > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > +        unevaluatedProperties: false
> > +        description:
> > +          Input port for receiving CSI data from CSIPHY2.
> > +
> > +        properties:
> > +          endpoint:
> > +            $ref: video-interfaces.yaml#
> > +            unevaluatedProperties: false
> > +
> > +            properties:
> > +              clock-lanes:
> > +                maxItems: 1
> > +
> > +              data-lanes:
> > +                minItems: 1
> > +                maxItems: 4
> > +
> > +              bus-type:
> > +                enum:
> > +                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
> > +                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
> > +
> > +            required:
> > +              - clock-lanes
> > +              - data-lanes
> > +
> > +      port@3:
> > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > +        unevaluatedProperties: false
> > +        description:
> > +          Input port for receiving CSI data from CSIPHY3.
> > +
> > +        properties:
> > +          endpoint:
> > +            $ref: video-interfaces.yaml#
> > +            unevaluatedProperties: false
> > +
> > +            properties:
> > +              clock-lanes:
> > +                maxItems: 1
> > +
> > +              data-lanes:
> > +                minItems: 1
> > +                maxItems: 4
> > +
> > +              bus-type:
> > +                enum:
> > +                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
> > +                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
> > +
> > +            required:
> > +              - clock-lanes
> > +              - data-lanes
> > +
> > +  reg:
> > +    minItems: 12
> > +    maxItems: 12
> > +
> > +  reg-names:
> > +    items:
> > +      - const: csiphy0
> > +      - const: csiphy1
> > +      - const: csiphy2
> > +      - const: csiphy3
> > +      - const: vfe0
> > +      - const: csid0
> > +      - const: vfe1
> > +      - const: csid1
> > +      - const: vfe_lite0
> > +      - const: csid_lite0
> > +      - const: vfe_lite1
> > +      - const: csid_lite1
> > +
> > +  vdda-phy-supply:
> > +    description:
> > +      Phandle to a regulator supply to PHY core block.
> > +
> > +  vdda-pll-supply:
> > +    description:
> > +      Phandle to 1.8V regulator supply to PHY refclk pll block.
> > +
> > +required:
> > +  - clock-names
> > +  - clocks
> > +  - compatible
> > +  - interconnects
> > +  - interconnect-names
> > +  - interrupts
> > +  - interrupt-names
> > +  - iommus
> > +  - power-domains
> > +  - power-domain-names
> > +  - reg
> > +  - reg-names
> > +  - vdda-phy-supply
> > +  - vdda-pll-supply
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/clock/qcom,gcc-sm8150.h>
> > +    #include <dt-bindings/clock/qcom,sm8150-camcc.h>
> > +    #include <dt-bindings/interconnect/qcom,sm8150.h>
> > +    #include <dt-bindings/power/qcom-rpmpd.h>
> > +
> > +    soc {
> > +        #address-cells =3D <2>;
> > +        #size-cells =3D <2>;
> > +
> > +        camss: camss@ac65000 {
> > +            compatible =3D "qcom,sm8150-camss";
> > +
> > +            reg =3D <0 0xac65000 0 0x1000>,
> > +              <0 0xac66000 0 0x1000>,
> > +              <0 0xac67000 0 0x1000>,
> > +              <0 0xac68000 0 0x1000>,
> > +              <0 0xacaf000 0 0x4000>,
> > +              <0 0xacb3000 0 0x1000>,
> > +              <0 0xacb6000 0 0x4000>,
> > +              <0 0xacba000 0 0x1000>,
> > +              <0 0xacc4000 0 0x4000>,
> > +              <0 0xacc8000 0 0x1000>,
> > +              <0 0xaccb000 0 0x4000>,
> > +              <0 0xaccf000 0 0x1000>;
> > +
> > +            reg-names =3D "csiphy0",
> > +              "csiphy1",
> > +              "csiphy2",
> > +              "csiphy3",
> > +              "vfe0",
> > +              "csid0",
> > +              "vfe1",
> > +              "csid1",
> > +              "vfe_lite0",
> > +              "csid_lite0",
> > +              "vfe_lite1",
> > +              "csid_lite1";
> > +
> > +            interrupts =3D <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
> > +              <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
> > +              <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
> > +              <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
> > +              <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
> > +              <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
> > +              <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
> > +              <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
> > +              <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
> > +              <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
> > +              <GIC_SPI 360 IRQ_TYPE_EDGE_RISING>,
> > +              <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>;
> > +
> > +            interrupt-names =3D "csiphy0",
> > +              "csiphy1",
> > +              "csiphy2",
> > +              "csiphy3",
> > +              "vfe0",
> > +              "csid0",
> > +              "vfe1",
> > +              "csid1",
> > +              "vfe_lite0",
> > +              "csid_lite0",
> > +              "vfe_lite1",
> > +              "csid_lite1";
> > +
> > +            power-domains =3D <&camcc IFE_0_GDSC>,
> > +              <&camcc IFE_1_GDSC>,
> > +              <&camcc TITAN_TOP_GDSC>;
> > +
> > +            power-domain-names =3D "ife0",
> > +              "ife1",
> > +              "top";
> > +
> > +            clocks =3D <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> > +              <&camcc CAM_CC_CAMNOC_AXI_CLK_SRC>,
> > +              <&camcc CAM_CC_CPAS_AHB_CLK>,
> > +              <&camcc CAM_CC_CPHY_RX_CLK_SRC>,
> > +              <&camcc CAM_CC_CSIPHY0_CLK>,
> > +              <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
> > +              <&camcc CAM_CC_CSI0PHYTIMER_CLK_SRC>,
> > +              <&camcc CAM_CC_CSIPHY1_CLK>,
> > +              <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
> > +              <&camcc CAM_CC_CSI1PHYTIMER_CLK_SRC>,
> > +              <&camcc CAM_CC_CSIPHY2_CLK>,
> > +              <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
> > +              <&camcc CAM_CC_CSI2PHYTIMER_CLK_SRC>,
> > +              <&camcc CAM_CC_CSIPHY3_CLK>,
> > +              <&camcc CAM_CC_CSI3PHYTIMER_CLK>,
> > +              <&camcc CAM_CC_CSI3PHYTIMER_CLK_SRC>,
> > +              <&camcc CAM_CC_IFE_0_AXI_CLK>,
> > +              <&camcc CAM_CC_IFE_0_CLK>,
> > +              <&camcc CAM_CC_IFE_0_CLK_SRC>,
> > +              <&camcc CAM_CC_IFE_0_CPHY_RX_CLK>,
> > +              <&camcc CAM_CC_IFE_0_CSID_CLK>,
> > +              <&camcc CAM_CC_IFE_0_CSID_CLK_SRC>,
> > +              <&camcc CAM_CC_IFE_1_AXI_CLK>,
> > +              <&camcc CAM_CC_IFE_1_CLK>,
> > +              <&camcc CAM_CC_IFE_1_CLK_SRC>,
> > +              <&camcc CAM_CC_IFE_1_CPHY_RX_CLK>,
> > +              <&camcc CAM_CC_IFE_1_CSID_CLK>,
> > +              <&camcc CAM_CC_IFE_1_CSID_CLK_SRC>,
> > +              <&camcc CAM_CC_IFE_LITE_0_CLK>,
> > +              <&camcc CAM_CC_IFE_LITE_0_CLK_SRC>,
> > +              <&camcc CAM_CC_IFE_LITE_0_CPHY_RX_CLK>,
> > +              <&camcc CAM_CC_IFE_LITE_0_CSID_CLK>,
> > +              <&camcc CAM_CC_IFE_LITE_0_CSID_CLK_SRC>,
> > +              <&camcc CAM_CC_IFE_LITE_1_CLK>,
> > +              <&camcc CAM_CC_IFE_LITE_1_CLK_SRC>,
> > +              <&camcc CAM_CC_IFE_LITE_1_CPHY_RX_CLK>,
> > +              <&camcc CAM_CC_IFE_LITE_1_CSID_CLK>,
> > +              <&camcc CAM_CC_IFE_LITE_1_CSID_CLK_SRC>,
> > +              <&camcc CAM_CC_SLOW_AHB_CLK_SRC>,
> > +              <&gcc GCC_CAMERA_AHB_CLK>,
> > +              <&gcc GCC_CAMERA_HF_AXI_CLK>,
> > +              <&gcc GCC_CAMERA_SF_AXI_CLK>;
> > +
> > +            clock-names =3D "camnoc_axi",
> > +              "camnoc_axi_src",
> > +              "cpas_ahb",
> > +              "cphy_rx_src",
> > +              "csiphy0",
> > +              "csiphy0_timer",
> > +              "csiphy0_timer_src",
> > +              "csiphy1",
> > +              "csiphy1_timer",
> > +              "csiphy1_timer_src",
> > +              "csiphy2",
> > +              "csiphy2_timer",
> > +              "csiphy2_timer_src",
> > +              "csiphy3",
> > +              "csiphy3_timer",
> > +              "csiphy3_timer_src",
> > +              "vfe0_axi",
> > +              "vfe0",
> > +              "vfe0_src",
> > +              "vfe0_cphy_rx",
> > +              "vfe0_csid",
> > +              "vfe0_csid_src",
> > +              "vfe1_axi",
> > +              "vfe1",
> > +              "vfe1_src",
> > +              "vfe1_cphy_rx",
> > +              "vfe1_csid",
> > +              "vfe1_csid_src",
> > +              "vfe_lite0",
> > +              "vfe_lite0_src",
> > +              "vfe_lite0_cphy_rx",
> > +              "vfe_lite0_csid",
> > +              "vfe_lite0_csid_src",
> > +              "vfe_lite1",
> > +              "vfe_lite1_src",
> > +              "vfe_lite1_cphy_rx",
> > +              "vfe_lite1_csid",
> > +              "vfe_lite1_csid_src",
> > +              "slow_ahb_src",
> > +              "gcc_ahb",
> > +              "gcc_axi_hf",
> > +              "gcc_axi_sf";
>
> 42 is ofc a sacred number so its a pity BUT you almost certainly don't
> need the _src clocks here.
>
> > +
> > +            iommus =3D <&apps_smmu 0x840 0x620>,
> > +              <&apps_smmu 0x860 0x620>,
> > +              <&apps_smmu 0xA40 0x620>,
> > +              <&apps_smmu 0xA60 0x620>,
> > +              <&apps_smmu 0xC40 0x620>,
> > +              <&apps_smmu 0xC60 0x620>,
> > +              <&apps_smmu 0xE40 0x620>,
> > +              <&apps_smmu 0xE60 0x620>;
> > +
> > +            interconnects =3D <&gem_noc MASTER_AMPSS_M0 0 &config_noc =
SLAVE_CAMERA_CFG 0>,
> > +                <&mmss_noc MASTER_CAMNOC_HF0 0 &mc_virt SLAVE_EBI_CH0 =
0>,
> > +                <&mmss_noc MASTER_CAMNOC_HF1 0 &mc_virt SLAVE_EBI_CH0 =
0>,
> > +                <&mmss_noc MASTER_CAMNOC_SF 0 &mc_virt SLAVE_EBI_CH0 0=
>;
> > +
> > +            interconnect-names =3D "cam_ahb",
> > +              "cam_hf_0_mnoc",
> > +              "cam_hf_1_mnoc",
> > +              "cam_sf_0_mnoc";
> > +
> > +            vdda-phy-supply =3D <&vreg_l5a_0p88>;
> > +            vdda-pll-supply =3D <&vreg_l3c_1p2>;
> > +
> > +            ports {
> > +                #address-cells =3D <1>;
> > +                #size-cells =3D <0>;
> > +
> > +                port@0 {
> > +                    reg =3D <0>;
> > +                    #address-cells =3D <1>;
> > +                    #size-cells =3D <0>;
> > +
> > +                    csiphy_ep0: endpoint@0 {
> > +                        reg =3D <0>;
> > +                        clock-lanes =3D <7>;
> > +                        data-lanes =3D <0 1 2 3>;
> > +                        remote-endpoint =3D <&sensor_ep>;
> > +                    };
> > +                };
> > +            };
> > +        };
> > +    };
> >
>
>
