Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794893325;
	b=kJDEw2z4jyJOZTjWAM8su3/xnc2OEHaAfjuPIk3jpYOVfDQr9NdlBNfQCjSC23oArcIf
	 e8jo6pUFIxFM2W49wNFyfyc77xOvhQ8Qdj2w82OQmcmpqauWJ2yCqo6iCElyeBFqlidGY
	 5qN3WOAei/5Y6/ae9d+QdoD9o/6cd0NNn79ZIHBHfLv4IQC4VFwBklFiIMlC1F+Eg+2El
	 XN/LI/Hi7UIAuqnCfEw6dM20di1b/N3j8Pqjtcaj8nIQieImwHFalvv7Ilzy9z0aSzS2S
	 iJjSuq4XomSvGLo+fEpp827xPiO7mpYcPG2SB5zJ4zojRwq1db76/d9P1Io6dDJ/+Eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794893325;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=NiXyMdzo/anqEnQBYGUdLPU8J41tqXReCV4OWaoYlKw=;
	b=Wy+Yf7rS3+9gB6gJ0CXw3KiBmdnb1Ymb59lCbME8ZI0e0TtRYoeIyQV5ndfeSENorjvH
	 qvo8mPw0Q/kEHraXqB2fzlgBPYLVPc37StZ0lqPtomjveFTNKU5zq4kaNweT/RLeJmicp
	 jQ1ORUE4HanEkITcz1j/YhSlge0Ws2yYuYXuSpGl6uwVktfTDJuO+yPGMMtF/dZxnD26y
	 TgD5DSUwgj3xX7lZxE0FQGLBz4+3V5kTNrVmWje+OcyuhxbP83ccqQLZ1ljkC+Y1K09fm
	 /Q9pnfJNhV8xtff5v7AgzkXAFNB/QT3o0u5JZc02xKFmoGUm0EGFvEismxZHLrYG1Hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=a4G1VUPB;
	arc=none smtp.remote-ip=209.85.222.176
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55441606A32C
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 05:28:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55441606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=a4G1VUPB
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-9495f083657so409579485a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 21:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794893324; x=1795498124; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NiXyMdzo/anqEnQBYGUdLPU8J41tqXReCV4OWaoYlKw=;
        b=a4G1VUPBwFozVSJ9pZWtGGe3P/BSlrTS0JxuehOk1p5N92O6uUy2HhIQLfi8OMbDT9
         601KjjSoxgZUiRERjHSID+ipaeVN68+bUPDXh0T2G4805BfyH1woCTFu1AHWJ54ot9of
         7u2+6Jr1E4kz37l92De7sZNn7sCjNUG8AMAHO4/eb4oy/xhI685YrCMCkeblQ18J0jGi
         4gd4cjI42FTMsjAQe03j5f1RLup0iDZPCuGMmhX6ZLn/7p7Bffss1N1WPYmWwiR7/5gj
         lcUDPF9vBTOI2umX2D/m0BlejKGR4uHOBkZBB6fyxcFkmzRUzkuN3vtnPbuh3H8p9VI2
         Rreg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794893324; x=1795498124;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NiXyMdzo/anqEnQBYGUdLPU8J41tqXReCV4OWaoYlKw=;
        b=ozacU4o8jAt0+XYRMVaQAja/JOufFkgdf0J/nG+4d43AQ2Zmd3ebZ4E2te6CT/W9ds
         EPBmX+VVEAeA8t3XO/zuCT3f/mt9gfdb/vQGeKaaZIHRwsw15Z50pJS09rJZuFp3mAo9
         DhGH4LJFIQ1i2Cr+gCpsQ72LbB3UnsMOmvKMJLyC2+ICFWJeTkSx7jbE4lZBSO0M9ms7
         +gPzIFckgjmPFbh034KFNQZVOTt4bVGJEuPHopksScsdAkvrchP+lPmfUiRl2jVOIgiO
         MMT0U69w9Bem6yFfn7HIf0jHzFETYZhNScdbZfriCZqm75SooSNHXFSBoeEPH0gUYa5r
         im0g==
X-Forwarded-Encrypted: i=1; AL+hErEsFe5XW3yh8ZNRjN86hVkPbWl8ydo3aEMn/UK/YrTq5GayzB/UYFDuFiNREtwRR56Jha5ABJ/Ub+cOzJCg@vger.kernel.org
X-Gm-Message-State: APuU4Z/9idmgkwLakxYBLlNmiGQ7GDWd1XrsZvq0uycbRhP3gA6qafDy
	n7Aa4YKmN3N5CjDOEYVKYsC4NGh8OawnzvRJr5QoPA+BxR1ljzD5ZOQ3CRPPc+xc6Y/eXxTtxUM
	TFzo3
X-Gm-Gg: AYBFou0rx+elgqoGAkvLv2Vwa0dhl6wFUEiB06ZZz90SbH3bfusqTZXzQrCUXJbaMAA
	UbGTgKyNWpOkrwl7yPdDNo7zikTA5U5bf+03d6g5BTmh6i1QnA/aPQJ8L++eaAKNw/Q5TgqBfBs
	w+tcK4Wns2JQLSy7eCmPzvyfsTn/5fL8eI5O6uGbFvIeBF2gpTW3pgsr2BpR5z4GIbenTs9ew9O
	jWIpBbIRNzOEFlVKGxADS1lQfdtJQ6RkMipTl3o7N2wGrJ0uDyOpUfUIRskKJlmMpZ5h2SeGqC6
	SUPTd8eG6C29DEoiY6j45Awf9agvk+CbEP+l9cY9xzyrIl2MXgAGy/5Op1L+lz55X4xvDCEh2nh
	8+TaaVaRoL8wswpjCMrpyzQ35JQh4lXkKiUYXzO7ohPmndjjKLYe6BYbBCTBvzKvZQjHDH1K5Lw
	sdIX0ZwoWFHNlnwy1xqhovqE1r4WYeBSbSQhVSKIdWIt+rPuVXxeYaCUeQ5Cm9Q0TGGxvTlCoVf
	zSJUeV7y6npLprWOesSz7n0zebvd5Yd3RjCMQKaFQ6Rnozzb8PCCnbW68KJ1aIqq1VbyoF59M63
	rtYlq/KGriEZbKCbjqlnAIb9GQUH6g==
X-Received: by 2002:a05:693c:88db:10b0:381:93eb:9529 with SMTP id 5a478bee46e88-38193eb98e5mr451811eec.19.1794892841137;
        Mon, 16 Nov 2026 21:20:41 -0800 (PST)
Received: from localhost ([122.172.83.36])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955a1c5c2sm39990857eec.14.2026.11.16.21.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 21:20:40 -0800 (PST)
Date: Tue, 17 Nov 2026 10:50:37 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Ilia Lin <ilia.lin@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: Re: [PATCH] dt-bindings: cpufreq: qcom-cpufreq-nvmem: Simplify
 bindings
Message-ID: <avvkJSN9zh8tnS2x@vireshk-B250M-D3H>
References: <20261105194606.772346-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105194606.772346-2-krzysztof.kozlowski@oss.qualcomm.com>

On 05-11-26, 20:46, Krzysztof Kozlowski wrote:
> This binding selects a few top-level compatible machines, but since
> commit 389de9c5a677 ("dt-bindings: cpufreq: qcom-cpufreq-nvmem: make cpr
> bindings optional") only qcom,qcs404 is present in  "if:then:" clause
> which enforces specific OPP properties.
> 
> For all other machines, this is a no-op, because there is no schema here
> enforcing a specific compatible for OPP nodes or any of OPP table
> properties: one can switch to standard OPP table (operating-points-v2)
> and this binding will not complain.
> 
> OTOH, this binding has complicated "if:then:" blocks so is not easy to
> maintain and causes false positives when regular OPP table is
> encountered in matched machines.
> 
> Drop all machines except QCS404 and move the subschema to top-level.
> 
> Cc: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../bindings/cpufreq/qcom-cpufreq-nvmem.yaml  | 78 ++++++-------------
>  1 file changed, 24 insertions(+), 54 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml b/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml
> index 547265b8b118..dfc7a27a7bdd 100644
> --- a/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml
> +++ b/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml
> @@ -25,22 +25,30 @@ select:
>      compatible:
>        contains:
>          enum:
> -          - qcom,apq8064
> -          - qcom,apq8096
> -          - qcom,ipq5332
> -          - qcom,ipq6018
> -          - qcom,ipq8064
> -          - qcom,ipq8074
> -          - qcom,ipq9574
> -          - qcom,msm8909
> -          - qcom,msm8939
> -          - qcom,msm8960
> -          - qcom,msm8974
> -          - qcom,msm8996
>            - qcom,qcs404
>    required:
>      - compatible
>  
> +properties:
> +  cpus:
> +    type: object
> +
> +    patternProperties:
> +      '^cpu@[0-9a-f]+$':
> +        type: object
> +
> +        properties:
> +          power-domains:
> +            maxItems: 1
> +
> +          power-domain-names:
> +            items:
> +              - const: cpr
> +
> +        required:
> +          - power-domains
> +          - power-domain-names
> +
>  patternProperties:
>    '^opp-table(-[a-z0-9]+)?$':
>      allOf:
> @@ -48,10 +56,13 @@ patternProperties:
>            properties:
>              compatible:
>                enum:
> -                - operating-points-v2-krait-cpu
>                  - operating-points-v2-kryo-cpu
>          then:
>            $ref: /schemas/opp/opp-v2-kryo-cpu.yaml#
> +          patternProperties:
> +            '^opp-?[0-9]+$':
> +              required:
> +                - required-opps
>  
>        - if:
>            properties:
> @@ -62,47 +73,6 @@ patternProperties:
>  
>      unevaluatedProperties: false
>  
> -allOf:
> -  - if:
> -      properties:
> -        compatible:
> -          contains:
> -            enum:
> -              - qcom,qcs404
> -
> -    then:
> -      properties:
> -        cpus:
> -          type: object
> -
> -          patternProperties:
> -            '^cpu@[0-9a-f]+$':
> -              type: object
> -
> -              properties:
> -                power-domains:
> -                  maxItems: 1
> -
> -                power-domain-names:
> -                  items:
> -                    - const: cpr
> -
> -              required:
> -                - power-domains
> -                - power-domain-names
> -
> -      patternProperties:
> -        '^opp-table(-[a-z0-9]+)?$':
> -          if:
> -            properties:
> -              compatible:
> -                const: operating-points-v2-kryo-cpu
> -          then:
> -            patternProperties:
> -              '^opp-?[0-9]+$':
> -                required:
> -                  - required-opps
> -
>  additionalProperties: true
>  
>  examples:

Applied. Thanks.

-- 
viresh
