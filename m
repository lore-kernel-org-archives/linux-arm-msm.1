Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279373DFC8C
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 07:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783496955; cv=none; b=luhJ3OofHDMbtVRmk5kPH1OhcBtUY/YL/cKTjEmolBNoemKveJgP+pnPmvmHRGtclaT8SS71u/uFzRpghJNLKZu/8cmIXDEbojIIgZpJjrAgFM31ljSqNb0Z7nBk1REFO8ux73vArdi4G5lE4knzYGnQ6SZpQi6bry+SEoqxpb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783496955; c=relaxed/simple;
	bh=iD6EbhdjTImQiP7DV3hDp8W9DVyZurMh8iMlgLBN7b8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X3iTaAglxT5hGRXhex0FnYEcKQF+p/g7taEb7a0BDpUw7uF9arBEa1am0iqem2n3TDFmYiwpDsgVYELw0o9OCWjvdUf6vVFnW7yrELotf01ZcHWe1RJyNjleDqxlt3ywqForyQgyq4CUGenDPHGUJIvzRSjWfNdYt1Y2QKIBZts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hV7Iasce; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hV7Iasce"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5aeb7ccb9f0so50362e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 00:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783496947; x=1784101747; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MCt+qXqsFWK3xJYzpIGst74sX1gCmnXNutx6uCCcmyQ=;
        b=hV7IasceItoym4w5w+gkoaoMsDxU1xyqcknRkmSWh5KG8nxoz3qHHGl81LZmy0mI4N
         ZCE22YM9n7UX0anPoPi9dG/TrEwVL4xdtH7+0HMHjrs4ZMcitOPCam4QK+WA0pZF4Zqc
         7rKGLAkIW4O9qIl2X4hSCtsNSt/EYzy8Fk5N3wET/AG5ZS87ib/9Jgj0EPFY2J/EHjGo
         Yh1OhzDXDNuIYkQacpiYRtwbngCF/wyn7QAyUf827rtg9cbHB54Zhv6AFqrgrbIWkkCT
         5QpYlt+cZw7djIp2IguktTVLtRk7vGtNd6ieFWYlzigOJkFp/7YDFS1AiA+N7djjhGGg
         OsMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783496947; x=1784101747;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MCt+qXqsFWK3xJYzpIGst74sX1gCmnXNutx6uCCcmyQ=;
        b=bVu2234IzeumjoGLHHgt6YkqukywlHTyG30kwj46LE0qEOqXFGR+vhAf7es6jpj6o2
         VU1IAiH8rpxZW+brCsphniBTru3P3Cj80UZ8E5Zs4i3axILKP4wve6AZasBqeKUrBPNW
         qRnhRPWqTDQDecesr9CY9UCRbL6P1gxd7SMd1CR8yttz83+EW+EN16HHjQWR1D+Cnf4W
         /EYrkXMiVIN2xO4NSRhnHznP8xu7K4GBS7UPKND9W2SqAKyJU6TNkSSxboPSPn1DuSF8
         eRsNPajiz1QTx6nuMJo5/5fQL3XtH0F9byo7NLKn7iSYrZOLL2rmdeGDzMgpV5t8fE54
         EC7Q==
X-Gm-Message-State: AOJu0Yyp4evMgo9/IdGGKsTRm0N0y2femphvDHJe6eV9H5JD+frYdUgC
	RMi17o542Xh0uVsMEkxUAAnPcMwf3sH6GfgGuwOFHbBG04UaaypX0O3fp3x97aWsG7w=
X-Gm-Gg: AfdE7ckYRW+Z4wHuYCnRyYWbW1dym62Tr/GuDEaLg1R/xXybv14lzU3sPZpz9RUS2Dp
	orkGHpCf7F7CsdNJ66BQKObxvEcV6pT5WQQXT6v80hmf0ZQQzzEdVLcRzSqrtJqabSrq8Kt84nt
	I0tPOZU1MFck36NXA0JC4U1snAz+1pmaHAMBthM+/0VCvwT2xIL9KhkwExicGTjwGirpBMKauGK
	Ze+wogl43jlrCA9B5gm8MpOPKPj6Ul3qMJvVGn4wLom/qlUe/MvfCZa+Xrk1OvPSmcJqqxaGp+w
	ru+vCptXZ7WOQHGyc9jJOAEdJAurhTAFJxJeHjUD+NXTvulM/m7Jup06y7SdAwjLaGA6rxGy4Iz
	gpHFWYuLKIznpOXgvbcucO6OmHOmkZmOeVM+MdsMdmr0aOr71IpFbGvOHvHGlDmOMd3TyRFYkJ1
	+aS8IMft+VXjCSeTAOrujG28V+mbJyq/S2gpfixFy0muQ/IpMP3fM8LASe+1Tw8y5wwhc=
X-Received: by 2002:a05:6512:3a87:b0:5ad:2e00:c596 with SMTP id 2adb3069b0e04-5b0113dae7emr226711e87.0.1783496946656;
        Wed, 08 Jul 2026 00:49:06 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b007f68765sm1417696e87.10.2026.07.08.00.49.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 00:49:06 -0700 (PDT)
Message-ID: <6520f340-c219-47a3-99e0-b48007896164@linaro.org>
Date: Wed, 8 Jul 2026 10:49:05 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 1/6] dt-bindings: media: qcom,x1e80100-camss: Add
 optional PHY handle definitions
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Bryan O'Donoghue <bod@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-0-f8588da41f16@linaro.org>
 <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-1-f8588da41f16@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-1-f8588da41f16@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/8/26 03:06, Bryan O'Donoghue wrote:
> Add optional PHY handle definitions. This will allow for supporting both
> legacy PHY definitions as well as supporting the optional new handle based
> approach.
> 
> Drop the legacy high-level 0p8 and 1p2 supplies as required, each PHY has
> its own individual rails. The old binding is still valid but with
> individual nodes we define the rails in the CSIPHY sub-nodes.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   .../bindings/media/qcom,x1e80100-camss.yaml        | 33 ++++++++++++++++++++--
>   1 file changed, 31 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> index 2d1662ef522b7..c17b9757b2c86 100644
> --- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> @@ -39,6 +39,14 @@ properties:
>         - const: vfe_lite0
>         - const: vfe_lite1
>   
> +  '#address-cells':
> +    const: 2
> +
> +  '#size-cells':
> +    const: 2
> +
> +  ranges: true
> +
>     clocks:
>       maxItems: 29
>   
> @@ -126,6 +134,16 @@ properties:
>       description:
>         1.2V supply to a PHY.
>   
> +  phys:
> +    maxItems: 4
> +
> +  phy-names:
> +    items:
> +      - const: csiphy0
> +      - const: csiphy1
> +      - const: csiphy2
> +      - const: csiphy4
> +
>     ports:
>       $ref: /schemas/graph.yaml#/properties/ports
>   
> @@ -158,6 +176,14 @@ properties:
>               required:
>                 - data-lanes
>   
> +patternProperties:
> +  "^phy@[0-9a-f]+$":

This is too wide regexp mask for 4 children CSIPHYs.

> +    $ref: /schemas/phy/qcom,x1e80100-csi2-phy.yaml
> +    unevaluatedProperties: false
> +
> +  "^opp-table(-.*)?$":
> +    type: object
> +
>   required:
>     - compatible
>     - reg
> @@ -171,8 +197,6 @@ required:
>     - iommus
>     - power-domains
>     - power-domain-names
> -  - vdd-csiphy-0p8-supply
> -  - vdd-csiphy-1p2-supply
>     - ports
>   
>   additionalProperties: false
> @@ -184,6 +208,7 @@ examples:
>       #include <dt-bindings/clock/qcom,x1e80100-camcc.h>
>       #include <dt-bindings/interconnect/qcom,icc.h>
>       #include <dt-bindings/interconnect/qcom,x1e80100-rpmh.h>
> +    #include <dt-bindings/phy/phy.h>

The inclusion of this header is not needed.

>       #include <dt-bindings/power/qcom-rpmpd.h>
>   
>       soc {
> @@ -229,6 +254,10 @@ examples:
>                           "vfe_lite0",
>                           "vfe_lite1";
>   
> +            #address-cells = <2>;
> +            #size-cells = <2>;
> +            ranges;
> +
>               clocks = <&camcc CAM_CC_CAMNOC_AXI_NRT_CLK>,
>                        <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
>                        <&camcc CAM_CC_CORE_AHB_CLK>,
> 

-- 
Best wishes,
Vladimir
