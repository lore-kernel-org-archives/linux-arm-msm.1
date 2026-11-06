Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964021;
	b=Set9/1cIo6P1uYm5rtAkmiwBDDGCkKfm+e1uN0uTD/mfaI1kGCRN+1Ps794/407/QEbi
	 8eGNHYJ0uP7eyqDrMiDUYh/1+k1SzS2cvLFP82HD+z9scEcSROduPc2SUYmRzjKODNoL0
	 GtEMO6lcCK0ykUke7zHZzEalnzxga5hg2sd2AJk5qdwmWx1lI7VzIW+FT7atrttL8ZOB3
	 OU8omu6YYwtdNLyuhgsofI4/7btPBjV11CavKml1ilL5Fb3IouMmndTm8ca7wJ667tPGW
	 FB6/6745qYJUA/CVNtulZc2pAi6IArHyI/Y7od00OOJF2UxTMhnvGp2rc0GTz/A+cRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964021;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=QF85CmmgfQB0K98VDXkXqbQirpwlNX5Roqb9EMySWGw=;
	b=GD1wNYSfoIwNN11bEmavxyoD5Ct17gFNOY2A4h9tXQ2jKXPRCvjLBp8bQ2aNQ21gc/np
	 xev6+sLRCaSjty9p0uD83stfFDRMTmxigiHK56KFM1+mb/cPPy1z9My0xk8gwWNt9ws5Y
	 TWvSUrTUrOIJqIrHaPaWkkQZdYqFXFu0YDUODAOnMNePs8mtik3nUbtB2+XuSgLrAO2OC
	 sQ5F5r3NLTVYiL5IQ69q58nKNs6ZyFKuanAqIWl57UrAYtOwEbUDWTk3Ht1iPBu/Yzuqu
	 m4b0snKoy1goK1m9PCu/G1TlMtG4XAxjQ1OuAPxe9x74z1ZnOdKbvyVNM8k1zy8zpLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=DUFumtMK;
	arc=none smtp.remote-ip=209.85.208.181
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7819F606A329
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 11:20:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7819F606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=DUFumtMK
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3ab35a9d9ceso670081fa.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 03:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793964019; x=1794568819; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QF85CmmgfQB0K98VDXkXqbQirpwlNX5Roqb9EMySWGw=;
        b=DUFumtMK1phvIfSGAyjvBixjvVUbWj1LhChEW4qMThx2dH1KWLjydGDlGxwzpHi34F
         ydA4JtviInKqlL9MBEr4abhaPmqh35/Uak9OQijt/vKOoxpyIl7pLa4orHyfSO4vuI8h
         SglDNnGd8ZUztb4n0NY4SsyAZ9xEeS9rvIb8Uji0t3mFVucpO92chNyBayYeqhSZXz7f
         pju8gY1T4R95xWyHa0+c6Mq3d7+y2EYrsAokrF5RWngcDjic2+Aau7B9OAqIXzMIdHn4
         4rVW8y1o56QVlQPc1f89iBiWKmHxDUxq16YvDKR0r+xTHHx+sXdDVn4V3wvaoTs7a4WC
         gHvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964019; x=1794568819;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QF85CmmgfQB0K98VDXkXqbQirpwlNX5Roqb9EMySWGw=;
        b=ey01qRqsbs6JDQ47d+MproSzq7KuLukwR156+HH5dSId6kIeUNPLTcKcmatOaxLGAg
         zHFWhH8dVdYZi+4V1gecQ20tV5H5UOT8XnFnTjhO5MmcgQj8TcSR5OB94WO4KGg1YvTS
         RmOWYUKoPqUVKZDICWjSAjOvS3mQ5vhkE3pjzetlp8NUBYc+AXq2G3VUh5nIGwi5Aupd
         15uWd4odueP68IXbH8rqgwdRAlEiKaxWTUK9RFkeZF7MCuOCl4rxq0PAEorFBObXSQiN
         mO96E4BeIPWg+s3VwmLdZxf4JZ8X9q1uNXR8Sq5sYRWTEIFpD3fAulyIVjbXBT+Bn/ZM
         rbSQ==
X-Gm-Message-State: APuU4Z/UDxqWDSI4H1BiyxUTHRdTWqkPshSU0Y6MfDxmJKiFIAywCub+
	MdWQdxuM9cZANoeGMP6qjjeEdclB63QvCA1cdoULBC+f19MU8gUARJFpMyYuq9V/CRI=
X-Gm-Gg: AYBFou10fUdUS3sYCZdkHaZTIAKkrRVMT3cDusfGxOPj7JUzV0eBxQ76EFufB3VeHxd
	gkmiytjIha7m3jospQrMyehyF1HZNG2BDwOGO4KEWrbxJVGYB6cSTmEQyZMn0hfHvB06haP3+cy
	Iib1HViVC6hCxu+neonlZk4DPcYsaW8PR7nzgb2HisUG+GiaWtt3fidWiKeZg7RqlBYfJYgFi6U
	w7uVr8kH3BZhnx5QqBekWORuGPCwmho+Itzkvnx3Zn4RA1N0XkW5BkgjE1rrUIGc8wBC6EHpVaj
	mBNGbdGW3G66AP8ZoYnHX19kTQZLZCfAhGPC+1LAR4m/srsd/7hEH16oaHXNKJkbUKhpanN0TM+
	2eiII4L6A9mEx+nrWJangjMumKBFyZ4G4hc5B2Vo7BEEdT0gU8K2r1qnL2Qw94kaO7jugzLJmyw
	bubvfhyDkhWX8aHHROpGimJ30SpPmE590vkSN+VDilPmmOFEgcln29aJ6245MZesSDYc6Fif3i7
	Q/9fLHItt/GJ/OwpfxEGnmhZjspbPX/OBOSxtQeLlOF3lsO77WDxeljfvyY/P8mmGG0/Od0fYGM
	XVFOovcR1Cf+7ZXgdc/dAvqkciZso39laXzAvXlgWIyYMTlLG6xMDDQZ6JTVTnQ69cKfF7Lx801
	JavsrVQ==
X-Received: by 2002:a05:651c:a201:20b0:3ab:1864:5004 with SMTP id 38308e7fff4ca-3acf36dacb5mr4022961fa.0.1793964018157;
        Fri, 06 Nov 2026 03:20:18 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acf5facfe9sm2950231fa.21.2026.11.06.03.20.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 03:20:17 -0800 (PST)
Message-ID: <540014fb-d271-4e20-9a3c-3f2fb66723ce@linaro.org>
Date: Fri, 6 Nov 2026 13:20:16 +0200
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] dt-bindings: media: qcom,sm8150-camss: Add SM8150
 CAMSS
To: mail@andrewgigena.dev, Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20261106-sm8150-v7.4-rc1-camss-v2-0-39ee37787b00@andrewgigena.dev>
 <20261106-sm8150-v7.4-rc1-camss-v2-2-39ee37787b00@andrewgigena.dev>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20261106-sm8150-v7.4-rc1-camss-v2-2-39ee37787b00@andrewgigena.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andrew.

On 11/6/26 05:24, Andrew Gigena via B4 Relay wrote:
> From: Andrew Gigena <mail@andrewgigena.dev>
> 
> Document the Qualcomm SM8150 Camera Subsystem. The IP integrates four
> CSIPHY, four CSID (two full and two lite), two VFE and two VFE-Lite
> instances, with 27 clocks, 12 interrupts, eight IOMMU streams, four
> interconnect paths and three power domains.
> 
> SM8150 has a different register layout, clock tree and power domain
> topology from SM8250, so describe it in a dedicated schema instead of
> using qcom,sm8250-camss as a fallback.
> 
> Signed-off-by: Andrew Gigena <mail@andrewgigena.dev>
> ---
>   .../bindings/media/qcom,sm8150-camss.yaml          | 412 +++++++++++++++++++++
>   1 file changed, 412 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8150-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8150-camss.yaml
> new file mode 100644
> index 000000000000..26f8939001df
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8150-camss.yaml
> @@ -0,0 +1,412 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,sm8150-camss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SM8150 Camera Subsystem (CAMSS)
> +
> +maintainers:
> +  - Andrew Gigena <mail@andrewgigena.dev>
> +
> +description: |
> +  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
> +
> +properties:
> +  compatible:
> +    const: qcom,sm8150-camss
> +
> +  clocks:
> +    minItems: 27
> +    maxItems: 27
> +
> +  clock-names:
> +    items:
> +      - const: camnoc_axi
> +      - const: cpas_ahb
> +      - const: csiphy0
> +      - const: csiphy0_timer
> +      - const: csiphy1
> +      - const: csiphy1_timer
> +      - const: csiphy2
> +      - const: csiphy2_timer
> +      - const: csiphy3
> +      - const: csiphy3_timer

I ask you to switch to the new CSI2 PHY driver, please exclude these I/O
spaces from the CAMSS container device.

It makes no sense to deal with all-phy-combined supplies and the multitude
of other solved problems.

The cost of changing the device to exploit the new CSIPHY driver is
close to zero.

-- 
Best wishes,
Vladimir
