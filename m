Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C473CBE6D
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 20:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785182612; cv=none; b=TuZ3j9HfzN1wB5HpL7hcT+ZgHjcL1/tEeHSqwfLGb43mAsDQSZTbh3t0Issz//TA1UDkVvRg7naQ+LA//5bbOTPVvM/jQQWEUlRUZlMItQPS4WTsbU9M7j9GrM/wMHt0E8AUqSyAqiItGmpVRdgdk1S+JV2dUcTgZn5RMfZWyNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785182612; c=relaxed/simple;
	bh=d0iUYQW5lagdp9O0uq3YsaEfuKSw1aijjKKgnN1yAME=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PtjgUAjyfY9lky5C1whzE9gR4eXkFB5FTzlace7Ln4a3maKtWZ5Yf9APjDlVnN6x+3jaeWpy9z6/nRbrWQBvblDmOOV2mEL2CCbxegJVqqTckx9J27PF3nGqsiIJ7UyjoZEHtjMvcCMDosNMv0DXqrp3g4a2/DuLJpLpl5ykU9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uiZ4fL9r; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uiZ4fL9r"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5b2a73d5fc3so213964e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 13:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785182608; x=1785787408; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=e06HUI85J7qEibvlYFhV0EnRMDOk7ZPREkdwrntmP6k=;
        b=uiZ4fL9runDzSl1a+Gcwaw+kuJ2lohu+Yu7P64eQ9wk+lTWsZtUaKwTpTjoY444HUl
         ymt+rqfdV2tMFA+HDEJ+HeV5o7w+UGv50uFiVhMsBFSQu/BiRdMayc7J7qaitTc3gEvN
         dllIqAKr37xY4HrP33VdReL/xbqDlko2IWedEo808vmGU9ZFY0FmITH/dr5+f0dfbr37
         ILFe9z6HcUkg/yZfmvpCEu4iN2r03Gs4PWWIrp37Y40UFS3Px1RgWb57sED6iS07AKW2
         ztb4DjD6tVH5NnS2N8Fve5sL6h2zx+X+Wju7EiF10Ol4IlsFwQDkCKsOdTIVvj1QJE/X
         zRPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785182608; x=1785787408;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e06HUI85J7qEibvlYFhV0EnRMDOk7ZPREkdwrntmP6k=;
        b=hJnzeR9T1id3OaC3PYAuag03jD54F3BWvBG0NcuF/R8v1Fai8UwQGTQpYjcE5rf/iU
         nbeAyZAjYsT7UnBfMbwYGGNhgRme0lQNmoxlO6v5+/FQVqDdxbQ7vmRz+gGbC94dTzNZ
         YgylFzOwgGED1NiW/WOd6irfTuci5c0NYhY9EovuOyNcAyasae1ZVbVOrrmBbekoDiZw
         BY0h12OI/78yQXFxHymzT3tj+65C8vyMseyS50NYY12ed8yYseB6AO1GN2PJ2DvfmNMk
         S2dZtScYn+PvrDzCLe9D4hefTdRqsmNTX6e9PTjsr5cQLHC1fhVOh1VE2JIhdlRS781i
         hNUg==
X-Forwarded-Encrypted: i=1; AHgh+RqXSKszHhGXTkln7EXq6hiRA1NJz5zJcRsNodGquF1jlhts5uypcjfDFOpVrFhKGijeDFOfrhX5HvEW3TSb@vger.kernel.org
X-Gm-Message-State: AOJu0YyWYWvZTe7RjYb8h9+Qdd+fywcU3mDP0bnPQ/WmR6YwBRtONC4s
	C7S154BC9Wq4Izf7ygl1THwrpFDmQAyAxdsb9zL+8ZlPkERW5vzkW/vkTf7eTAL9Nl6s+DTXOXL
	BNNatjsBp/w==
X-Gm-Gg: AR+sD13S9SX9QIPl1fk6EKDx82AOoMvTzryGBBP9hYVWQkhMLfKycMVfHsTSaFzB74f
	NmW3iZmiFYWL3fqQphAS/uNwNgRd18Rji45sZm5FqqGfVlszGUKNTOxneJZtTkDDnvuHjTGnOlY
	viEuesjFPslKRd/DdNrm4YdLhBZTnSYtFzq11Swel4GyMoCEAhMbvs8wnMxsbqaGDgIsj3dh+ee
	GnBhyNLywTKj2Qm9SuXi73+jtZW9yP5xmCbL8jpq1X2qZGm6+2+FWY1YFwy1YUFFfdSmy4R5KYP
	EjiAjvCXYMqiYhcudRkNi4siOopiZdW/lsDYJ+idklKRSEdD6V2xfsw1OUH6SoKZ4yHLk6bW5sm
	4MEEv40U+i9FwR9ydvZtdMr/FJojvK+mOzIzN87Bm954TCpwMqk4DHl8gIjPYjBmyuYV+LU+coM
	ywhgDkez4ohdAlRoXGw3nI7dHbwIewQudycThDOcu/6gxuhBqzfTtbJFyj
X-Received: by 2002:a05:6512:3c94:b0:5b1:4fde:61a with SMTP id 2adb3069b0e04-5b2cd8064fbmr193340e87.2.1785182608171;
        Mon, 27 Jul 2026 13:03:28 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2be077b9asm1643146e87.2.2026.07.27.13.03.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 13:03:27 -0700 (PDT)
Message-ID: <1e1bc17a-4c7a-4c08-b0c8-2a2ff31fe870@linaro.org>
Date: Mon, 27 Jul 2026 23:03:26 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY
 schema
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260727-x1e-csi2-phy-v14-0-27d1bf477593@linaro.org>
 <20260727-x1e-csi2-phy-v14-1-27d1bf477593@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260727-x1e-csi2-phy-v14-1-27d1bf477593@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/27/26 22:16, Bryan O'Donoghue wrote:
> Add a base schema for the MIPI CSI2 PHYs on Qualcomm SoCs. This PHY
> supports both DPHY and CPHY operation. A special mode of DPHY operation -
> called variously split-mode or combo-mode also allows for two sensors to be
> connected to one PHY.
> 
> The submitted binding here describes the DPHY modes of operation only. CPHY
> is left to future work.

C-PHY bus type is also well described by this version of the bindings.

> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       | 198 +++++++++++++++++++++
>   1 file changed, 198 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> new file mode 100644
> index 0000000000000..7d0363812aa89
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> @@ -0,0 +1,198 @@
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

I believe it might be possible to set combo mode with two single data lane
sensors, but I can not be certain in it.

> +          endpoint@1 with exactly one data-lane.
> +        unevaluatedProperties: false
> +
> +        patternProperties:
> +          "^endpoint(@[0-9a-f]+)?$":

The review comment to a few previous versions of the series including v13
about too wide regexp mask has not been addressed so far, please fix this
issue in the next revision of the series.

> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
> +            properties:
> +              bus-type:
> +                enum:
> +                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
> +                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
> +
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +                description:
> +                  Logical lane indices 0-3, not physical pad positions.

In hardware description it's physical data lane indexes, the same is said in
video-interfaces.yaml documentation, the numeration starting from zero is
selected to follow even bits in CSI_COMMON_CTRL5 register (D-PHY mode):

* https://lore.kernel.org/all/59331aa7-8430-4754-861c-4ba6a4810ccd@oss.qualcomm.com/

> +
> +            required:
> +              - bus-type

'bus-type' property could be optional, if it's not present, it can
be assumed D-PHY mode.

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
> +    #include <dt-bindings/media/video-interfaces.h>
> +    #include <dt-bindings/power/qcom,rpmhpd.h>

Please sort the list of headers in alphabetical order.

> +
> +    phy@ace4000 {
> +        compatible = "qcom,x1e80100-csi2-phy";
> +        reg = <0x0ace4000 0x2000>;
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
> +                    bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
> +                    data-lanes = <0 1 2 3>;
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

That's a great improvement, thank you.

-- 
Best wishes,
Vladimir
