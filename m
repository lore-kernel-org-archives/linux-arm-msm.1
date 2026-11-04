Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793833963;
	b=M0ZvQgTtrPS1FbpUgQuH3LY+XvVFs45BzL5AYVXfYUYYbhtNaycSpVJQ5hzLhD/etvNB
	 G9k6OGlHDO7HlYPr+Iuxw6aOYzaMf14Q+e7UKtX0nJayItmebxAdhsaC+vuDpJOwcO3o4
	 AnjVcm3yETGMqAzD9kjoTPv8IFQmszmGqdE3pei/Es4FObTu9XPAaCR14c0YxnsaAqQgN
	 IooOMVCt8a/L+Ddx4Rq5GlcdOpC2H5BTfUCSzyph6kkIAgyHSlomtELh4ApTTDSXfOG8+
	 uEO2P6Az9IySlxmYh/hpSPepUYPOlUvscTTVekEe6cnsYlkqGkHWSxj1MAOqCmaY+5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793833963;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=4lBfIR/LafX25Og3OCJQ1wVKuVTFo8wSNFYi96ni0r8=;
	b=yR6UrQUTeCmRaNDfCumttNYuzKlsSDrC34D78zSXflDGYmdrGdCANVNb0SlRJuFuZyLR
	 2O5gYroThlWIpNyYIJcKXS5sx9om6XxzFw7WplMLOSTphMCXsrycDnkDRl+AHb8VLOk8k
	 oNvffI3FnvfAZLUipht9t4/BileBh/4mr6sl7N/vGP+Zr1EFpJv0raSs7v42xSouejmIv
	 2HQl84voj9fsfRrhayYQ9/BmUocXVGs96Cp846JVjX9UcTX1y1REznmbyc6M1z9TgSrLm
	 JBk6bhyEtAfHXcCpoy1PMRiCCZ0N9TOO6Xpzykmky5c04bpEu/3DqA/KQUIpsf9C1yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gs9pV5e5;
	arc=none smtp.remote-ip=209.85.167.46
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978D4606A329
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 23:12:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 978D4606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gs9pV5e5
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5bcef474680so126505e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 15:12:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793833961; x=1794438761; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4lBfIR/LafX25Og3OCJQ1wVKuVTFo8wSNFYi96ni0r8=;
        b=gs9pV5e5Um20Qgo2XDi0crgyXVOH8hndAHDdS9S8n+43dJaechcABgzMF3gj9EfEey
         KIuAT3G2FtKH/EJj1mtS1PFBWAxdRZmTdwvvqANPzSJZLEqsmxrOY60co79CiqVHLgpx
         I5T962ziyuGsNoMsE2hTh7U2V4DLW3/oe5rwcxjoSHX2o/K8U5u3Pu1/gKksHc1W0OKf
         j0ZwfHiBu3eoKoUKeSfBMPHKlJO2yCbPHSem0oghIS/EpeGTfPWJpe7jR/8Mqq43IY7T
         sNQkzUZWyy7FKByarHD1qsabOlRFUrBvwsAgNUPm7mHBowzx/reelAmpt3hqobysshdX
         V8gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793833961; x=1794438761;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4lBfIR/LafX25Og3OCJQ1wVKuVTFo8wSNFYi96ni0r8=;
        b=FkKweLg4kQWNwlqJ3X6M6o03MUpge+tKX4U6zyKAahX+jIjq22apBHALCLOuap2Fjr
         R4TynlwdL8rEwkrukjfXCIoxtGlyxm0nCuLP+ES56IDHPA/LXi4WdpVc1rDh7qy1eU44
         O7wkbCtenaXxShRKJ8LrYbYZEIiBukgSB8D6tW7HkE3hpOE/gsWEnREC/AlkC/+4ENsh
         zsW+c2ETD4aAq7adgGcTiVBCfib56iEolcDvo62CS/DD4y8zcpUzNGpKtr9V6OjNNY40
         Odm11v5Fg9ZcINeNiqBO83Pj/asawdRFqyYYYof3PLEPjiRPOQ58Mg7CSLKZLCx5WoeK
         oW7g==
X-Gm-Message-State: APuU4Z/QEALZzkevyIOb0O/5pMDUv55LSJwSr08YgP3BCuhyiDcR0eKZ
	pc/F8WBZgkcq25G7wS/uGuByC6a26Nx0Wo58llIplDZQZTXwiYRUBf9nCXFiRZB4mUY=
X-Gm-Gg: AYBFou0Q0iJmznb6Tu+2qGnAWXOe7GYz9QHsPDnbqceNqHdwKnPwJ07Pp9waCxFYk0P
	DIbgkeNKP2Ge0zSQbxJYst4Mf3x6OKylaXvaqpTbkvRLuq7rRd/1oq38Mn1K2NZALNoSXQ9ckEA
	esVnRsrXxZT8v8EY5EcfdQBdvFnZWtaDI89g6t5P8EtfGy7azLkh8+Uzygo9wPKpXV+nF2oATGC
	fqLQzk3idM+mqvtsPAlNOoP0W0R8XnTb/d3NYmxw+kVGxARGcozVkQvG4nZu7u/JZ/ybUQkA2Ba
	CGEICpYsaKURB173oE23ysPiNiQoGsp3qvp18KCZ5btsRLpdDoMo2De5Nswgm/FvOqCvlKRB82O
	s6N+EZw30/85wGm+eTExjp6WdnHdzIfbM1/RSlTzt/NsZagdz5HQBB7Uv3mSu05rrC+YmicqRfn
	Rj9Duy8Kyzg06KGA/c7som+2EFSZcuafR2KdXdPiHumH/0XzLzw3I0seIOOLEeGxkGD66TWhygn
	xT3yxxUa5S+d6sMhusJ7gZzaweGh6o9bNepYQAxUinSvM6jOJIpsgdUyzuFJv4eMpyFfsrkf6BW
	Hd7iZH0jgXGAVOYRnooW6vdriJ4NZ7BnK5B4LY4qsp8zpLaTtZ3ilgxYENQ8KE/gsDCkz+wQ7au
	zSspZcns=
X-Received: by 2002:a05:6512:3a89:b0:5bf:f642:bb43 with SMTP id 2adb3069b0e04-5bff642bd0emr1119881e87.3.1793833960601;
        Wed, 04 Nov 2026 15:12:40 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bff38cf7bcsm540327e87.71.2026.11.04.15.12.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 15:12:40 -0800 (PST)
Message-ID: <ec559f1d-0ecd-4de8-9baa-a0a6d5aac5b8@linaro.org>
Date: Thu, 5 Nov 2026 01:12:39 +0200
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
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20261104-sm8150-v7-4-rc1-camss-v1-0-7a9534a9a22f@andrewgigena.dev>
 <20261104-sm8150-v7-4-rc1-camss-v1-1-7a9534a9a22f@andrewgigena.dev>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20261104-sm8150-v7-4-rc1-camss-v1-1-7a9534a9a22f@andrewgigena.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/4/26 22:54, Andrew Gigena via B4 Relay wrote:
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

Apart of the update to the list of compatibles it's expected to document
the clocks.

-- 
Best wishes,
Vladimir
