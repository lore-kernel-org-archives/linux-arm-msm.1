Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794000384;
	b=uIs9b1/BqA8Cz4q4xKUpCIzYzQjhMzahanKuIaZDlnj0Nd5byRUTMz6zWuWdt5746Lj8
	 Wd66a1Mcbb3rO9Kasqntj7G6Xx74b7sAo5sDY+eXqgubg0iaA50w5rbTbd0RnmBrcTSzG
	 MRnBRr1+WvPD4Lq20pIowNzue3hjovMd+RH1j8CCNm1l5FUiRQC8akBGU/JOzXovYbMcr
	 lqswN8DxlGeazet/f3QTyfGkcy9M+XuR5Yz4tJpC8wN9YeD0BBVaUIXHh1H/Bbrt4CUi2
	 PFaGKhuscdd3MS2W9iL9Myvip9NF1czHyLoEuSiZklUJJiSMY6JhXVGWs+l2Zjg7tfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794000384;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=IS0n6SvtrSel8zY6vkWXqf2dHmq9Z3b4+UIE+41Cj1Y=;
	b=gjfhx5+gYQaRXymMtsYWUOw6eGbJ8GlFFgEUmbNtLVT3dHDsTSYxB3EugLsIReLir8vP
	 1/Hr8X40kBPz8sgT8gcMvOEpalwxRdrF36ICWSdYVw4ERT/mvClraAUlvAmS3ahE3dUPj
	 QZM7zzMlCg64hczIiMHJhy/+gb6Sp6S7REkPAlXjMjPlwaZWFX6ImzT1mPwiFXGmJ9ZN3
	 yCYWIMeaMVlcPxHiiMKf1R6ZKTDUkcOGzxoKo8ai28hc2QASL2iA+WpINqWZK3AbqD2wD
	 99PSsEDxE/eKL+kPnWIozalwLHfBb4/zG7S7YxdRSzxK1F/E9l1kV/I4WfLJLRjJeUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fElw+eI5;
	arc=none smtp.remote-ip=209.85.167.41
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C512606A336
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 21:26:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C512606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fElw+eI5
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5be4b29df8cso49967e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 13:26:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794000382; x=1794605182; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IS0n6SvtrSel8zY6vkWXqf2dHmq9Z3b4+UIE+41Cj1Y=;
        b=fElw+eI5A1w3IHAlBMJDLXRdBdImdRRuG7tpGlwkAMmBHAk16RV4TH/P0ZmbfhQYpp
         US2j+t2uTpkkH6Tvzs7OH4p4mgNUfQ9kbl2ANOSRPJSY34f++LIT70jAr/dBguYOgU1+
         0pfQQhuSZa/m9R5bhgoimw63HMKZMgihXiH6MUVCIYnXubaiAJZMT4kjUqLQLQYamQV7
         ADuxWSh3ffVdPJN5Mf9g8EhiqF/11g4M0XzKm2TlnCPDha+NBvRjeJ4Q9UjaAIb8cAIN
         bEsbw5aJM7boNpVe9K+HcYqpeB60vwmXjr/2qzSbU+YM6FsexXa4G+xwUar6b+1OoWIe
         6KrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794000382; x=1794605182;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IS0n6SvtrSel8zY6vkWXqf2dHmq9Z3b4+UIE+41Cj1Y=;
        b=DankzIjJaXctEpmNa5YfCNdWKQ50RLKwMfH75RTbMp8Lit0aW+XBIUkE4vM9Ymlbcc
         9/UhcpanP5X4BfYlmGCWfak473BwC2lPLZ/Oq9OhwYrsoa3hllPkNs/mmKewu220lV6e
         eLJqZ6nBkOvrkPxKhjg5GXsoi3GoEfHZv2sE9yjjz5dq0Mu0s0Bda4WX9DtEpJgNKUKZ
         eNWxhPhrtGSnQJQLXlTYIe4mLy3/0YWbeIRfob2mWpCOAWU38PFcXzYuNPUQE4DFf0R1
         /BE9gnG6DQijDd04bI7TZA+FrtNSauRZNV6KOnO6O7jcMEYzg8GGDJy00jrltWsVHIjZ
         YfnQ==
X-Gm-Message-State: APuU4Z9TDVhid10pGJpypaYV/4qmd2p0C1gCMXieTZMfTXXJ5cv0SSkW
	65WrPzkQBuUDncUOWvhXkS1iFgOVqIOvoC+GtYM9tbtYTcLeqazngVYoPnlsg1GMGGQ=
X-Gm-Gg: AYBFou3eIUQAb572A8Y4izG9keWD/lzoYSkwW35nDIYGV833j2y10FrfDHeCTh/0sjm
	dXOrylJU952TL32jxawKbcTDSknwXawJBZRaMrTqizovb6McL4RXtwSeyg1CPscQChoFx4F4xvZ
	HaLzG7zXxe9P6WhOrpmzOl/HYoW7xn90gzp24eaJEsORdhhxJoGRvGjvcDRFN2k23cXw+pjERa/
	qsP8THrF7p9kHELEK9RiU5tXvC7D5/1V0X+M47aH+zRiFqLeruHN+PO1NeGu/boW4QwuFm235qx
	v+EoPAy0GSTq6QnE9S3Mzj3CpDXF6X4RQaNrdjq/Qg65aIRySCliA4jprPfPXbITsGadf6y6iEB
	gsA88v/XmyX6m6FcWsj6S9GYwfdc3E3a9tW6WuvPGp2wXuOTgGg7yAto36wekJ2i/h30gYsx9Ex
	gfk5xC8LbdqsMQeqNxqnfMmEYdW9guzljnkjMq8KCQewaP36B4WjkL0comawjEVwv2kQ1mJ0HNS
	L7vBExTf+nm57Z6CnHiyJ7LSAyMddUJuqK8iXcWYjNmuO9O19z8uP5LBp6fNzBcEcpfQVlwJ6DS
	dwNUe5DvmE5OQNgRLRvbsLQ/kXKBV8ZzAPcZaxF8DUOeqq1/3YpoxF3SW1Nn35GZzuxvXkdTjPg
	Dun1LdQDUNat6h6D/8JRTszg1LsU=
X-Received: by 2002:ac2:5690:0:b0:5bf:ff57:b346 with SMTP id 2adb3069b0e04-5c003c44406mr1296500e87.5.1794000382152;
        Fri, 06 Nov 2026 13:26:22 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c00ba6e7d0sm4667e87.64.2026.11.06.13.26.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 13:26:21 -0800 (PST)
Message-ID: <ba22b7a6-83a9-43d3-9eab-93503e23a76e@linaro.org>
Date: Fri, 6 Nov 2026 23:26:20 +0200
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
Subject: Re: [PATCH v3 1/7] dt-bindings: i2c: qcom-cci: Document SM8150
 compatible
To: mail@andrewgigena.dev, Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20261106-sm8150-v7.4-rc1-camss-v3-0-0103e8a0bbcd@andrewgigena.dev>
 <20261106-sm8150-v7.4-rc1-camss-v3-1-0103e8a0bbcd@andrewgigena.dev>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20261106-sm8150-v7.4-rc1-camss-v3-1-0103e8a0bbcd@andrewgigena.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/6/26 20:35, Andrew Gigena via B4 Relay wrote:
> From: Andrew Gigena <mail@andrewgigena.dev>
> 
> Add qcom,sm8150-cci as a CCI v2 compatible, with qcom,msm8996-cci as
> the fallback.
> 
> Signed-off-by: Andrew Gigena <mail@andrewgigena.dev>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>   Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> index 1e8def25ec0e..1e7a8efaa398 100644
> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> @@ -39,6 +39,7 @@ properties:
>                 - qcom,shikra-cci
>                 - qcom,sm6150-cci
>                 - qcom,sm6350-cci
> +              - qcom,sm8150-cci
>                 - qcom,sm8250-cci
>                 - qcom,sm8450-cci
>                 - qcom,sm8550-cci
> @@ -218,6 +219,7 @@ allOf:
>             contains:
>               enum:
>                 - qcom,sc7280-cci
> +              - qcom,sm8150-cci
>                 - qcom,sm8250-cci
>                 - qcom,sm8450-cci
>       then:
> 

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
