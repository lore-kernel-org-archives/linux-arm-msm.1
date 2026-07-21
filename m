Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1219D3AA4F9
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 22:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784673620; cv=none; b=ChBA1dFMWXMUom74JAM2jMkqMUiIBVkSkvW6Tx0u5ZGqP2veJRa4c9BhebtgkdOAje6kd9Vn2gXrLBJ2hWD89+aJcMoxirUO4Jyf53DHe8NWX9DG7cjefCIMUGn5dr0KH41UrlOFD2KUuz7hdf0T76unS0g7DNJWCwIR0a8JXnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784673620; c=relaxed/simple;
	bh=86+FFVf2RJXCDge481xc40j9yQcZbXPzCSDbKxjMSQ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PLOE2NzD2Y7fsnXNzCjYDlK54raI5fwFnTqw2+q51KG0IejwCi8GubqetrFDgd4v+dSDTMZRxODS4OiqWOJ0y9mrn57UGbfwlPSKIt8RgsCtQ+TMmggtGncRn6YFt/ljHhNe/Vfza17P7k8wvbpDhq2uTNuECbKp4dF/xTR4Ans=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IVqIG5mP; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IVqIG5mP"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-474560436c3so6544730f8f.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 15:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784673616; x=1785278416; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RskP6QT1dpaQK7qfXd+bxkNm79lnYJ2LdMNrXnjHeIs=;
        b=IVqIG5mPge4kyxaEU3iL1xqOKSXgvrOTGk9GR5/koVoRSn8/lrEYcwdbaXEZD6d9y/
         ZpCsMjousZtMAJ5Kg78w0IWAbM4++jsnzlVTir75PCDAfkGh9sjZ8BiF0a7vaIKd0fVq
         RJmmWUjW6LUvuZDxw3nEtU4PLupoW4jXrX8bmw+jNXoRVFxlKnp5ieSGInXX4/k4UxEk
         ZKdb/0lRUHvJFDvsbjaNCAy8mMp73gP1SZxWaUqZq8+fKWY9KC2ogN/gtj0mdkovNpz8
         el/eMIkw6u2/N0rB6TsOGTW1NkHEW8XogucJq8sMv6EYbgTw0/thk+0sLWZn766mUvaT
         vwAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784673616; x=1785278416;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RskP6QT1dpaQK7qfXd+bxkNm79lnYJ2LdMNrXnjHeIs=;
        b=DhGTW63zc4XVXPaGvweLDL4GwGS98I//SsXY7o2de0Ik0cI6Az6b9HG9Ia75TMyfjT
         XxZyz/DwTYk/RHFjWDr/6VVFgtVkJou6K59E15Fhn4lBI9PyCMhrwmyXYsVIlbzBYD+2
         YnhaDvidaEa6asGd7xakUljDX0bve2C+voDb+W7qTIbljccejIFX8UFm1XKyc8wGBvoj
         mcOIh7wpzT8KBA3Tq6RNApLAD3lzVB9+AKXASSaKqh5K7Bzzqg+LgBT8O8qGN8LfcJ/4
         3SEGa/1D0B+cUhrHzo+VjJtXF9r8P+rSqbRTTXAyUMJOuElmNAfcmp7n2Y1vQEKK2EDT
         9elw==
X-Gm-Message-State: AOJu0YxR91u22kD8a/Glc/FNQIEuDrchjrL0mwd+aGz6y3NZQ4js9RCD
	tE2/tEW9rH7I6cEv0kEACEQZA/rsJQfYJ7ck9OBWybTwAfu7dWTzhvwXxwZtSNJjHgg=
X-Gm-Gg: AR+sD11lV6yc1n1VBotLtIgMqiXZF4PBRAajfVb0rdhx8u0Y6DsQGxO2bhTcs0Y4e+/
	mLrybjGVdBtT3Z0Oy6nqkuUIwgoJKpiDrmLky4A7SgNtISGmrJAZJthCr2VlYjlyDDSqk0ULlNf
	+BXTAfN1CDmX8P0IezQbxA74x4QsZTy6F5AOPmya7kM1SMrFAOrhCDxz1isD/FJzmbrS248eQsy
	Omp+R5AqtunEWVXxvLukv343I8yEshVSwbqKS7hJGB4SUc9tseeaO2VUQqe2J72eaZkWpWeJdTA
	HC5fQUAfUbDYmkxz95qROU299zruxtNA92XUPjHCPpdR0ppHwwJYwlPWP4hiWMvu/p18ruOTiWv
	T4s0DVvzx79o6Gh5jk9Jd7OQ2Ct/FJSQZp+0KrXRb3dLlLEmffw9G265YKwTau4OKuCi3DDITfn
	BU8q/KU+iQRt6Z35CIDqonm+1pzA==
X-Received: by 2002:a05:6000:712:b0:47f:6f2c:7303 with SMTP id ffacd0b85a97d-47f6f2c73c3mr17096854f8f.33.1784673616312;
        Tue, 21 Jul 2026 15:40:16 -0700 (PDT)
Received: from [192.168.0.101] ([109.76.186.235])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85bb57cfsm249830f8f.11.2026.07.21.15.40.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 15:40:15 -0700 (PDT)
Message-ID: <b14b7ead-d063-42d4-92cb-1299ef0a81e8@linaro.org>
Date: Tue, 21 Jul 2026 23:40:14 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 1/8] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 Kaanapali CSI2 PHY
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 jeyaprakash.soundrapandian@oss.qualcomm.com,
 Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
References: <20260720-kaanapali-camss-v15-0-c0b1c1167c5d@oss.qualcomm.com>
 <20260720-kaanapali-camss-v15-1-c0b1c1167c5d@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260720-kaanapali-camss-v15-1-c0b1c1167c5d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/07/2026 05:50, Hangxiang Ma wrote:
> The Kaanapali CSI2 PHY is compatible with the existing x1e80100 CSI2
> C-PHY/DPHY binding. Add the "qcom,kaanapali-csi2-phy" compatible.
> 
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---
>   Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> index 880fe602945c..7943049834f9 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> @@ -16,7 +16,9 @@ description:
>   
>   properties:
>     compatible:
> -    const: qcom,x1e80100-csi2-phy
> +    enum:
> +      - qcom,kaanapali-csi2-phy
> +      - qcom,x1e80100-csi2-phy
>   
>     reg:
>       maxItems: 1
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
