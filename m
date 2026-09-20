Received: from mail-ed2-f27.google.com (mail-ed2-f27.google.com [74.125.228.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14991440629
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 21:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789939345; cv=none; b=WMtteuowXask6PWup7RjwOTl7oMbIy82dt6vGql+GNrULaDI9uNe41hk+u4QYnuIC/7gmxGFIRVvOFRBtG+GZKpeJSNjwaK3KhCiyWs3pxZ+KRU68gSewro47sflLh6giDIjMa4UMoHYy0mMUPdvvoEzf4pDZJvTCaMfhK/WCX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789939345; c=relaxed/simple;
	bh=9r5IQgj6NLgv+3k+36IgWhzd2nOBT0RKKorj7JZ+C3A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tMqNRn7fwxfc2OKzj5wCz3luY9YfU8TGoepjQ7DT6VfVYh40KIQ/dDF48lRb2uCz/jgpD1XzQVkS04m4+OgVVE/CYbmwLAqyXmCtAYbcutCy1+yUkx3L8YCYggMDZefzHVzsErMIhdDjGFbA1h/Zjiz3yyPSzMXTXFzXcSWbXao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iwLgM50N; arc=none smtp.client-ip=74.125.228.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iwLgM50N"
Received: by mail-ed2-f27.google.com with SMTP id 4fb4d7f45d1cf-6aa135d6e97so3500666a12.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 14:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789939342; x=1790544142; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=z3SMgxfhab4VA9DKQFqi+MK/1Tv47IexSislTxFzKx0=;
        b=iwLgM50N8ca41NVmc6ocfx75AeceG2YNPYXxf2+3QBx1EPyhhRXxNflSh+268rVSix
         kiWMMqRxoOMMWsUrlRO9oP2B5c1UScHxUlU7Od+PPTmXEsnTb3Mtmq+7vMa0EGpG9DA8
         gPB9UZQ9+HgnK+T4ucPMqOoPlrvqyHZW/aZlvrbm8+ViqC8ej14vaWY6obJoGsYKFn+R
         sAjgz5yu8cm8SDCqjvdOuxv4c5u/X/gI3sVpXyTQoBFgi/wf8pZLHpkWMRyGZh7r0YTJ
         YkyLH1pm7ObNa9MKlVzeL7VNmaap5gFQwR7MYB+KZ3KWbV8CZ0ibQJtaN4/k8lzbUs6q
         s4pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789939342; x=1790544142;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z3SMgxfhab4VA9DKQFqi+MK/1Tv47IexSislTxFzKx0=;
        b=GYAYXk9CvXi3KW4P6hqVQtnTbjL2dM7OIOv1q6HbAx5aJLOvUjs7cW7bEPgjmOjUa4
         aTHkbhUsrIsB32GycFYB1ZertKeI7YbqFWOGIMo/IBVJpuT8cFuSPKPXft/KoCwcDHpP
         2EVJy1oMAg3AlkQTDRvmfxPa6tOjyBpOgb05o7mxC5Pnm5OZSXiNDWhq9s/U7+AgGjYr
         KNB2YtlDacPnLFe00qhh83vasOKvGtP0fu1bYUbfqNfVnX/dktmiIuadwXmeZRg7zYYe
         hbvG3sVb8hPyPnYLG3YfzSrycYt0ZQpYUyy4QfapQZw5JnBiyA+vxn2YchIpFEiIlmNV
         8B1A==
X-Gm-Message-State: AFuF++l+xot6sD6qt5Z0q+aGQDateKBtYXGtPahe62wbkbIIQ82+vtci
	JAE9R0DmEbapm8KQG07Jhlv8qqA++HXBbf/0xScUQRcJj+xnaMKwbyHCS8rVPSCOyAw+Z64CH7N
	LeZfn
X-Gm-Gg: AYBFou2jirsj6vlsgseYkuuZHjkDpPjxz83YJxtYSialflc7doMqbUTQHkUrae3648v
	ycw9Eg5aHOuwqSXs9TG4DJeA+LCRyo4TStBTYievtERrovOIDCUnhgPAIF8wGLoDD05+Ojyq/pP
	+4kjP3+JN3lIPVZDzoTyeJASPusdCIJUbZnRMat72ipOqncnF/kn24mrPywTUMKLaDPK6wQulNP
	0L8B7I5tqtLfndBAXA/AWqyFiLPb1G/8LosQjQvgy6yqlLcbiwLgfoYLXkEIc8c1BG5ewc1JaoE
	MbSbPAw7PbydYPCu6Hdnf8xH5shp5BfKiOev/9UJWpLJ07RPS/Q6OxW1rKVaHX3YRFdwA7O9oeq
	gqgbkRAS/PPI6vKYmxDesJJSqYX6wyHG0zLunD2RrWAAcmq/iGDk4VVx00SMRNXt0cr5cKx4yyM
	dDQPXvIbeXOySIqsB+mryQFF4O6PVcPbYguwM3Y8/+sq2vJQ1a0YSHoVyKxT2fSRg0k2CStO+ra
	AZEavsP45s=
X-Received: by 2002:a17:907:a310:b0:c29:c213:1ec9 with SMTP id a640c23a62f3a-c2a156a52b5mr729661766b.9.1789939342055;
        Sun, 20 Sep 2026 14:22:22 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.73.189])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a640f9ef5sm122971066b.25.2026.09.20.14.22.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Sep 2026 14:22:21 -0700 (PDT)
Message-ID: <018776b2-a73e-4c2a-8ce5-798367e65c94@linaro.org>
Date: Sun, 20 Sep 2026 22:22:19 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: usb: qcom,pmic-types: require one of the
 VBUS sources
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260920-fix-tcpm-vbus-bis-v1-0-cc9347bbe81a@oss.qualcomm.com>
 <20260920-fix-tcpm-vbus-bis-v1-1-cc9347bbe81a@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260920-fix-tcpm-vbus-bis-v1-1-cc9347bbe81a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/09/2026 15:37, Dmitry Baryshkov wrote:
> The commit fe2195b019f6 ("dt-bindings: usb: qcom,pmic-typec: deprecate
> device-specific VBUS") deprecated the old, device-specific VBUS supply
> property for the sake of using the generic vbus-supply of the connector.
> It also removed the old property from the list of required properties,
> so now schema stopped requiring any VBUS supply. Add separate claude
> demanding that either an old one or a generic property are provided.

This is a weird sentence.

> 
> Fixes: fe2195b019f6 ("dt-bindings: usb: qcom,pmic-typec: deprecate device-specific VBUS")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> index ba790c4488b7..db487562cec4 100644
> --- a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> +++ b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> @@ -91,6 +91,14 @@ required:
>     - interrupts
>     - interrupt-names
>   
> +oneOf:
> +  - required:
> +      - vdd-vbus-supply
> +  - properties:
> +      connector:
> +        required:
> +          - vbus-supply
> +
>   allOf:
>     - if:
>         properties:
> 

Other than that this seems logical.

Once fixed.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
