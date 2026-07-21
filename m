Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088E3445ACE
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 08:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784621848; cv=none; b=aWP2Is17RiPgnCxtZiFEqAdwUcykruZdb3kR+pHUwLL9b7zCrlcljS+UNgD4WbpNeb25+XYiUs3KPDJrGjVL2ZaMwt5zRRJbljsvhcuRvy5IEv9L+ZTpxhL0pyYydXZ27L4xRn9J88n8dE+5l0Spz9o22Kqrp2+iWd2MUovlai4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784621848; c=relaxed/simple;
	bh=dpVwbMp9E2vKDgBuXrm9+r2iQvb25xCrAl3x2/DGoCk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yc4baVN6I6/2DTJLIJDmH7V3SXtKd7UnJ8C46CNwTNMPRX1Kzt9Ac7wY/1KVxTmhd09htds77+ElrKO8ZaAUXqLg0bS9VFyYO7zCAxu7mqXsllodzzk0WWUp7jdx+DJaH92RXIoBpc53net5lTUWY4ToQ1WbiF4iQmFSsVlRpVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fbDbdf1M; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fbDbdf1M"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5aeb72b0af1so1249936e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 01:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784621837; x=1785226637; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gKMYuSxpffkyrGpleNqSwP2E6RLfbUM1DxXqtJdN6kU=;
        b=fbDbdf1M3fFP9iwmagRMeWDkM5YPETFEQp2qxkJu6rWzR8h6RIzKIVnUOq8HK60bsU
         J9d5nRpjjKR/SaX4yTjIinY7mUM7DKZAshxaLyBcFQSDZMLm6iPVZ1ym8O5Vto8AvZRf
         flriLfknHFFU9MQTvNhngTchCSZgKrA3kTZyjKy5I5J8jmVJNpy3ehV3ocOuF68AGf9v
         7nttAtXS+q3Cy12A8hWnzBKu8Pm4xtFDVq7mssu5RVYek82NA5gixUPZ99KfoPd7q6YX
         3eyqPjX9rHP4UYK0Qos6OSrLO6x8CHIjmvM8mImF86tfvoTlOTKXvsITKTg8ChEPLqSa
         5XyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784621837; x=1785226637;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gKMYuSxpffkyrGpleNqSwP2E6RLfbUM1DxXqtJdN6kU=;
        b=MmMvuMCX5ponzp7NPPe+vuViRnpUs3dauF7sn8TP0cq2c5kM7PeQBEUshK4Sg3uHZY
         dDs5dK1qSyJP6CsO1xxVyU4NG9Gt3hAY/rkzwLGSPoLu33YLxzGXLsycSNunbw2gujZa
         cMgMF2rDGNr57AgZydBwxD7Qp4M8/Cs5WmR5y8k6P7LIr5JncvjLVgAUCBabDbM6P7Ar
         OPk1RDBy3iAvHuCjef7+99IehGrLTJ33YMH/jM+mQS9bRaFv3C72sWz2kdgTPTa0SIhB
         2AbaJZimnX/vSD+8+RJu03WzE8AORHCc2wzu0NKQvVEg7+k+vJs1QyuUy9qHvoWDwZQc
         5KcQ==
X-Forwarded-Encrypted: i=1; AHgh+Rotbkz701rJTN1OxPnTL1YhNkB68OYUAoHcm7iYBUN53FhkPgrjlbEMa4WQACniGdWy5724OtnmjSZYg+Ar@vger.kernel.org
X-Gm-Message-State: AOJu0YxxlnJbgSumzB20OZ+X1lZWoabciRKSF7JqzOFLnJt8hjLzl0e/
	ydAQkjn4M2TOOiw96o9gj0hqclm2fts66EXXn6POhJu/Rfw8p+RIqrpHl2WsDWLNaNc=
X-Gm-Gg: AR+sD10XbDIty8huoVrYnABDF9ugpg78WjtbtC6ngKydyxSkVBPolaTsW+eqhM9wLun
	11ERiYn5M+1zxTf6vZT6JRZg27NN+v+Y/94Yjwv49NiV3R8+vN/vO1NK6j2hgSQQxiEJSwes6ML
	zXOjBsnxKbKKHF1SfZQyPjol2l5bGnwCHw5MQKDPMkyZGLoDf7vvAF+nbivMNb1sbg+DJfa+Ypr
	PcUoixkG2IAl2UxIwa0i4rSffj3Hl5zZW/j9O0Ij1Aq3c07q9I3UhHENlnpeEx8eD6Tt6gtfXBv
	ZLA/7nMRgNlEEV0XXgq9JwoBrlqsAIA24NfAMlnHXry93zIyO1biGrBK1ShQfb3AuvC3V/hPwpq
	FEk85VslGx/SfC2aE4oKP5kDniOhIM8hXJI98rHB0hvIebJVLuwUs3EVqrifmFw6/aivKFC6zt0
	x/ZgVshqFREN2WPFFkaY3R+QOsF2ZiKVvAF1VXBmmjTPefoJtymdF02xVv
X-Received: by 2002:a05:6512:3e24:b0:5ae:c063:638c with SMTP id 2adb3069b0e04-5b2a4a87341mr290377e87.7.1784621837200;
        Tue, 21 Jul 2026 01:17:17 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b291e25e5bsm2736698e87.78.2026.07.21.01.17.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 01:17:16 -0700 (PDT)
Message-ID: <0da6d314-bfa9-493a-bcc6-8c3b75751d0c@linaro.org>
Date: Tue, 21 Jul 2026 11:17:16 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY
 schema
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260720-x1e-csi2-phy-v13-0-160c31958863@linaro.org>
 <20260720-x1e-csi2-phy-v13-1-160c31958863@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260720-x1e-csi2-phy-v13-1-160c31958863@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/20/26 04:11, Bryan O'Donoghue wrote:
> Add a base schema for the MIPI CSI2 PHYs on Qualcomm SoCs. This PHY
> supports both DPHY and CPHY operation. A special mode of DPHY operation -
> called variously split-mode or combo-mode also allows for two sensors to be
> connected to one PHY.
> 
> The submitted binding here describes the DPHY modes of operation only. CPHY
> is left to future work.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Since there is no changes in dt bindings from v12, all comments from here
are still applicable to this version of the changeset:

https://lore.kernel.org/linux-arm-msm/20260719-x1e-csi2-phy-v12-0-cc7311326d1b@linaro.org/

> ---
>   .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       | 195 +++++++++++++++++++++
>   1 file changed, 195 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> new file mode 100644
> index 0000000000000..880fe602945cb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> @@ -0,0 +1,195 @@
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
> +  Qualcomm MIPI CSI2 C-PHY/D-PHY combination PHY. Connects MIPI CSI2 sensors
> +  to Qualcomm's Camera CSI Decoder. The PHY supports both C-PHY and D-PHY
> +  modes.
> +
> +properties:
> +  compatible:
> +    const: qcom,x1e80100-csi2-phy
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#phy-cells":
> +    const: 1
> +    description:
> +      The single cell specifies the PHY operating mode.

This has been reported before, #phy-cells shall be 0, the operation
mode is selected by bus-type of endpoints as it is described in
video-interfaces.yaml

Two competing values are redundant and it opens a door to a wrong
hardware description, the technical discussion has not been started yet.

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
> +      - description: Titan Top GDSC - Titan ISP Block, Global Distributed Switch Controller.
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
> +          Sensor input. Always present. A single sensor is described by a
> +          single endpoint with one to four data lanes. DPHY split mode,
> +          where two independent sensors share the same PHY, is described
> +          by two endpoints; endpoint@0 with exactly two data-lanes and
> +          endpoint@1 with exactly one data-lane.
> +        unevaluatedProperties: false
> +
> +        patternProperties:
> +          "^endpoint(@[0-9a-f]+)?$":

endpoint suffix regexp is incorrected, this issue has been reported
previously, still it is not fixed.

> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
> +            properties:
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
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
> +                    data-lanes:
> +                      minItems: 2
> +                      maxItems: 2
> +                endpoint@1:
> +                  properties:
> +                    data-lanes:
> +                      maxItems: 1
> +              required:
> +                - endpoint@0
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
> +  - "#phy-cells"
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
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/qcom,x1e80100-camcc.h>
> +    #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
> +    #include <dt-bindings/power/qcom,rpmhpd.h>
> +
> +    phy@ace4000 {
> +        compatible = "qcom,x1e80100-csi2-phy";
> +        reg = <0x0ace4000 0x2000>;
> +        #phy-cells = <1>;
> +
> +        clocks = <&camcc CAM_CC_CSIPHY0_CLK>,
> +                 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
> +                 <&camcc CAM_CC_CORE_AHB_CLK>;
> +        clock-names = "core",
> +                      "timer",
> +                      "ahb";
> +
> +        interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
> +
> +        operating-points-v2 = <&csiphy_opp_table>;
> +
> +        power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
> +                        <&rpmhpd RPMHPD_MMCX>,
> +                        <&rpmhpd RPMHPD_MX>;
> +        power-domain-names = "top",
> +                             "mmcx",
> +                             "mx";
> +
> +        vdda-0p9-supply = <&vreg_l2c_0p9>;
> +        vdda-1p2-supply = <&vreg_l1c_1p2>;
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                reg = <0>;
> +                csiphy0_in: endpoint {
> +                    data-lanes = <0 1 2 3>;

data-lanes values has not been corrected in accordance to linux-media
requirements.

> +                    remote-endpoint = <&sensor_out>;
> +                };
> +            };
> +
> +            port@1 {
> +                reg = <1>;
> +                csiphy0_out: endpoint {
> +                    remote-endpoint = <&csid_in>;
> +                };
> +            };
> +        };
> +
> +        csiphy_opp_table: opp-table {
> +            compatible = "operating-points-v2";
> +
> +            opp-300000000 {
> +                opp-hz = /bits/ 64 <300000000>;
> +                required-opps = <&rpmhpd_opp_low_svs_d1>,
> +                                <&rpmhpd_opp_low_svs_d1>;
> +            };
> +        };
> +    };
> 

-- 
Best wishes,
Vladimir
