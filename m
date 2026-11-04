Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793832073;
	b=Sf+p8Z8G1LG63BqpbJfzgU/XebtkbZYj0wiEei5oupcmCiGcTyARyAADUQLKMrBMU7DX
	 O5LNw7MtdVS5twXwfVNVRk3sSgH/Yk9gYQvLpJaORZ9BTk5EbgTKH52VsqyHyi4YqU5Up
	 z8EJsOUpgXyrLL1ctNNflwUwB+rkjUsR9P5TjmCRCLc9JrqHuBFSIkkizriv8LYOvjo5d
	 bA3OQFYFe/kRFDJNWahXx5Z86JamtJeqWWQsSW0RKJgpT9kWkPfIjOJW7HXjbd2tuh38M
	 5wJpYV/mbbf839NK0Jm7k+TASP6RDFpDJOwhV/RLUBHmVEnrG6axc+fxiYZHCYZFD6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793832073;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=/nW6715EtFswgRm8I9cbPPt4Or68BEFqTuXQQkMmvZ0=;
	b=gNsi2I3LrAVT/7Bqfd5zvwwPj3e70MojUrJTRNxuD2MGNOEdAdy6wTVpJfCQDElAmTxC
	 r3qRhjGgZbszZukYE5zMAB8+YFhEjTfHWIyHxhu28SC7/Quy0bLNm/AJ4FrVYnSUSnlr2
	 jQ/n7L4CRyXIOq7Lm/STjJB3ZA9GT8N5LB04Pqsv/nPTq5Ta7uq84aukxk+bfhBef5GhD
	 Swvt+de4Hat6F+fmQJxoqSX6KiRzkjqMArRXw6GN/PhFQDEDbr/nX9VlhTpA2OMZda3Fx
	 8X1gsJ0labSxe0XXrIimLtlrUhRNvPranTJvGW3CxdZ3PGJgcNwl6t98Eb+fu5CY/Ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=VblTHW8t;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A551606A32E
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 22:41:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A551606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=VblTHW8t
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso8518725e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 14:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793832071; x=1794436871; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/nW6715EtFswgRm8I9cbPPt4Or68BEFqTuXQQkMmvZ0=;
        b=VblTHW8tFX/DEh57e325ubcAiELluEymaW2vTWJuEEHyAuM3tm7KpOyqmWbQG/Op3f
         Msw0b1pJGBWgfSh66KmwWzwckkRp6IePhYqHGIkYUFna08m/hgJZd6QQDswNo0PXVObu
         3CpiTQiXj5E4+WZdskOIi7h0GjU40neX6tFnJ8NY1Sd2YVcZ12618lqLKskZg/T6dbYn
         mYxG36peURPv7BA0Mr/ughxR+KzpZXsw9r8R5fYIME9yNHAVdz8a9PRP1fQI38oKuPrd
         TvSa2T9416wZnCTTXJcP9uSG4Dwf2kTo0XZoaNmbIxIBmJpoHEd7hhkaTpqcR0TqdV4M
         46Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793832071; x=1794436871;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/nW6715EtFswgRm8I9cbPPt4Or68BEFqTuXQQkMmvZ0=;
        b=tCO5TpA0y3KFqnuwMQtlrOSxapgIh5+zEBcVxsWvJgJkVaxgvQbi1OcqWCUC+n267U
         /F1u7S4wjzmGmfTdH/cKEx0NvvzR+Auw7TPhDCvMvjCnIOR28kSfgzkm78MxwNoJNL0t
         ZcCpqAF3EClOIO/9y4OwAOK4pW+liVhYRwxGk9flX5rFPd9CXSFqCroqVRbipyAispQj
         jkkiyilNW87/D2QRpvwkB+cqWzRVN2MPN5IquV/tiftx5ZUdZvOsEYz+v8FXG0sjJUQW
         wtcvVFWum7415cXMWvth6IBVoIXwNAtUsVslm4DCK1iD4o25750XVMMUcxDaH7CMJx8q
         1RQQ==
X-Gm-Message-State: APuU4Z/Jm+Z7JG4O+XrS3GX7HG0Z8t+41azhwmQlguWDzwEWEZMESQE/
	7VJR8HtbVJBeYNwzFKSqik5QnhcLYWCKdiyBiHb8DziPF+OVAl+zH6cGmdXoFJnTHYc=
X-Gm-Gg: AYBFou21m8oVLQJWxBgVSlubAba9pEPs4O75lx1nrkCylDaIuB/9LXJSEyx0eH8Qhd0
	PpuwtxpI7dsLLyRfBXJcvVzGD71BjSpy/BBUymaLuBvZrFDTwHiHATY9xog8Ny1euSJE+Vp0Rfk
	A+xbYqn1jENRL+rZu7ENb1jCct92DzN6s2MlovknZmUGayp4/6MqvZPqig58sRFuE2bpj6NOnor
	qLHjp85VgzPd1+UrgasP1lCPJyPeIw7skt3ztEBWQ79XH4nx0Wl75OTf702zvwDqmSn8a/5/SQw
	jvsoU23aXvmeegAep0AMYwezb3RfkMjuucqhg7zrA3AKoJyERMrcLUYb9ORLEXDrGgEZNTtcACD
	CWLyE/2UHutvEgdGHstSHxGJ398yvOjetgJ6Zf4u/RUP+Q8+tEIa1GzVoiSdfHcdV6MxPsCA+Gk
	ubIhQaAKx905U3emKUnDaT8hrOp99fExBdpiOmZQBWPpfj5gOBVY4+Xm4+tHtpvhiHWqRQcCqTn
	eD9HNvGWXLAyK+rFpLVfzhD7GKXHNjMQjsVqSSivqApnu7pErtWVv+eEvU6IwElQir5USChe5zR
	qQVw5a6qIh73MVeXbr4VY3j4ehy1usbHY8YyGVAJJy+jtyQrEUWF1N/CqdxDcMA=
X-Received: by 2002:a05:600c:848c:b0:4a5:dc5d:20f7 with SMTP id 5b1f17b1804b1-4ac175669d8mr428288325e9.14.1793832070829;
        Wed, 04 Nov 2026 14:41:10 -0800 (PST)
Received: from [192.168.0.167] ([109.76.163.117])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56f5e65c8sm16013915e9.12.2026.11.04.14.41.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 14:41:10 -0800 (PST)
Message-ID: <ca9d806b-567d-41fd-95a6-daa6aa14d7cd@linaro.org>
Date: Wed, 4 Nov 2026 22:41:08 +0000
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
Subject: Re: [PATCH 1/4] dt-bindings: i2c: qcom-cci: Document SM8150
 compatible
To: mail@andrewgigena.dev, Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20261104-sm8150-v7-4-rc1-camss-v1-0-7a9534a9a22f@andrewgigena.dev>
 <20261104-sm8150-v7-4-rc1-camss-v1-1-7a9534a9a22f@andrewgigena.dev>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261104-sm8150-v7-4-rc1-camss-v1-1-7a9534a9a22f@andrewgigena.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/11/2026 20:54, Andrew Gigena via B4 Relay wrote:
> From: Andrew Gigena <mail@andrewgigena.dev>
> 
> Add qcom,sm8150-cci as a CCI v2 compatible, with qcom,msm8996-cci as
> the fallback.
> 
> Signed-off-by: Andrew Gigena <mail@andrewgigena.dev>
> ---
>   Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> index 1e8def25ec0e..b545fd2378da 100644
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
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
