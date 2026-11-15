Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794744224;
	b=ajcRgd6aG++rLPQmjek0TG5CVpHqYi5fLBTrjTYOdyoph4liZk45FwWiiAnCGe8fr+R+
	 z5+rEh+yOkXWRpfZQ78I/kXdLRLCFXTNNFQKGzwpTQMr2wouHpd0ypUY9tAGnUoAuEScJ
	 FQy4ZdmiyCo80NC7Kb1Ex8h+5bI0N0TFmz5xbLDvAZQHg2kaUngsLki8J6ssbgmUGC35s
	 4/74hEIb5UTBv0c5AiI43fLEpsx5PJLM30lJMzZ6JmVYEZGrFKnoxPA/oCx2wuiLeXIuj
	 H8lpn3q5WOhKDHhT3TRtFmY1CITLqdJ90bYK5n0TFG0V5qpAxwO7BPoNKanJdBxt3pQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794744224;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=G2xfTStPsDXrBa4bi2OyO6+uMbuqPCiOosCTtZjhiB0=;
	b=DOYzRw1kaOsQibRCAh2S7nZUmg0XdwMSOqlKfMdpIvxURiTNIuTnmA2F40i2XujPpqHC
	 gZ55Udr/i8uvhqmebdiGc9m2eVeMObtkw+7VllKt6zNPJbKankDECg2uYjLCHJ+iHixsP
	 ybLPK2Xt5VYeEeuUtYCcN5nHsst0P/YOLt60HKLE8iA98KhMQStyk03AY41mzDsUcoT3V
	 hms2mPaGLZYM2+tg412IIytpSKiypL8du2UPwFtHA8qTCa2JSZMDKmELJbNMHd7dg4cjZ
	 fKXMQo7WDCExk3JCLeEhvIVjsFjbI3gnz4kd0YSS33jjBXVoflbNCM6Sv4V2TeYpgfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PUV0k4wi;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F68606A31A
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 12:03:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60F68606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PUV0k4wi
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so14295365e9.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 04:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794744223; x=1795349023; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=G2xfTStPsDXrBa4bi2OyO6+uMbuqPCiOosCTtZjhiB0=;
        b=PUV0k4wiuHhnC2t7Hsp/WAP5J+moB0hPEz1xgcSUOumUT/V74YrWQ+u4/kcDQAZZAI
         FU1UcT4LA71zQaO4RNN3fDK58kEm0gyjmnHcM9RXVv/QQUcKWnFnRVFUJIN5LvgOmRbU
         CdkX2MpZzMt3w1jVBaRwXSai8LXU3yenBkKD3eLHOTo7bbQWZTnRfd7OxqDr2Tm7aqgM
         tqbEjAIs/onLiVZMqsDdlB+BeBjSC46vX/IUEnjCJMfCs4q473Yu0+LQXUWKpIUAmuWq
         g5GqBSIfulUimYpqvkhkiTnwvyFlIbN6ai/HPSelBPAghTiFoksA7JqN58Ta6+eI4q4I
         045Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794744223; x=1795349023;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G2xfTStPsDXrBa4bi2OyO6+uMbuqPCiOosCTtZjhiB0=;
        b=o1erV4CWi6TuHMtl5W+BHXcl9XOX7nr27kGkKNZSA6Ptz2jztbZuRPlZ4WF6cNwmZx
         XPPcsG0RArTi6Aifcu8L6PKvzIFIaLwZOTXMjXMPDzyusd8n6+3SDTqc81oN5SjvWKS0
         JjByyAlXyScOSYol+i03+4K2/H4iS/lHK6wJrCRvSR8akbAgDhiGz27sswqD7g2QUUfP
         dLD4cydrClGhPYEMCrpvz0zaQkhO4afCBCET4ibWGeWnUlP4g7XOHcnmMK5yi80QucUZ
         7NLzr++wrUjgICah0PUh4FRIOKbjCGTJUQjw4KYwrQg6wb2J3Fv6x6ZgAulyfwzV+2w0
         wn2g==
X-Forwarded-Encrypted: i=1; AL+hErEX8vuB8v2nHDKjtJr6jBUxu6AlKj9lRgPltrb5qgGl/rQ/iG2gdDFJTXU1LPYEtXF1qVIXtVfY2eIhVK2k@vger.kernel.org
X-Gm-Message-State: APuU4Z8gi21BBsWn34/kF1P/YeCcHnOTfKcz7Chlo/ZyUOJqOMj0WJ0Q
	+lnNkm2NUJViqQJABkd454M5DNMQttuyRzhQwoiZz7sHWQ7YPB4cQkK2Bu6F3W7E+EI=
X-Gm-Gg: AYBFou0sNKiWkoZRGmfyvvpEV/ORUZm7ElBvy7E+Dy5LCWCfjerFKjf9bRX+ZaCC/kI
	XLNFbbgYuFxdYZUOLHkQayydd9K99MJjXjJUohyTF9o3uy8F43OMCUn/aL9CumzJtt+Hq8nX6ca
	SQMtu/s7l1LIQVlE4qCCcZWggbOpmhvfSO2/FUIBUGeTJp9nGS80qZBMDfhP+bFFxvB2iLnEVV3
	ve1Ss//fnLd8uv9XJ4tAiYKpmvHqjVmoEwM5mm6SbakAALKtVzTWBunZ+7KBuVJ0FUrgBu2QgSy
	pgW4DR/r+X+GF6kh9p2sBLaENiDHj4jTKYVPjDgkE7Hpx3fVsjtHAV59f9YQKE9eGFjZ4VU74qz
	IJH/kGbp9Ecm9oXOXyeo5FdgVKWcCy827oTwDwITaN27opaK7DogHSGuxhA8lXEatcZTgQiWp7o
	DeTLJlk83eWOUH4NMB+HBdzon7f8MfEZhN3MUxxGjXlxlAJDl12XNIU+IHFoh+0S7KxYPH86SQz
	oPQ+Ax/H4UbcYmEkZfRL+uSqApSp39UZlSmiSAOINGe1UCgBzeq7+MOibU/U4yPc82MYesr25vh
	RFfezd1CXu/OD1ivB4d+tTl2YirPwdAel0yVrQBwlY0=
X-Received: by 2002:a05:600c:34d6:b0:4a8:f2ad:a9e5 with SMTP id 5b1f17b1804b1-4bb559f609cmr148644995e9.3.1794744222495;
        Sun, 15 Nov 2026 04:03:42 -0800 (PST)
Received: from [192.168.0.167] ([78.152.238.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60021375sm15371401f8f.29.2026.11.15.04.03.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 04:03:42 -0800 (PST)
Message-ID: <31101889-9d4f-4863-afb7-0f884b50088f@linaro.org>
Date: Sun, 15 Nov 2026 12:03:40 +0000
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
Subject: Re: [PATCH v7 02/23] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 Eliza CSI2 PHY
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Frank Li <Frank.Li@nxp.com>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
 <20261114-add-support-for-camss-on-sm8750-v7-2-8ff2a11835f6@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261114-add-support-for-camss-on-sm8750-v7-2-8ff2a11835f6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/11/2026 11:29, Wenmeng Liu wrote:
> Add "qcom,eliza-csi2-phy" falling back to "qcom,x1e80100-csi2-phy", as
> Eliza integrates the same CSI2 PHY IP.
> 
> Eliza has no MMCX and MXC rails: CX feeds the existing "mmcx" input and
> MX the "mx" input, so only the power-domain descriptions need updating.
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
>   Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> index 8ff3df1d0d2787b2af0499c1e4106b86f56ff82c..884984f6f6b9e595df9bb3b0027c0bcf285b8058 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> @@ -22,7 +22,9 @@ properties:
>             - qcom,sm8750-csi2-phy
>             - qcom,x1e80100-csi2-phy
>         - items:
> -          - const: qcom,glymur-csi2-phy
> +          - enum:
> +              - qcom,eliza-csi2-phy
> +              - qcom,glymur-csi2-phy
>             - const: qcom,x1e80100-csi2-phy
>   
>     reg:
> @@ -48,8 +50,8 @@ properties:
>     power-domains:
>       items:
>         - description: Titan Top GDSC - Titan ISP Block, Global Distributed Switch Controller.
> -      - description: MMCX voltage rail
> -      - description: MXC or MXA voltage rail
> +      - description: MMCX or CX voltage rail
> +      - description: MXC, MXA or MX voltage rail
>   
>     power-domain-names:
>       items:
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
