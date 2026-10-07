Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32303D5259
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Oct 2026 09:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791366738; cv=none; b=klu9GPs2DZK2UhOfncS8Wrhtun5+yzZ5lt7qxLu+iVdleLScjtg/WllOJtdDNm26QPZjFMxYdlbyJwAMZB6+eQTwkRcumbNldrfcaMyUOKGD/iCVWmfBqF7P4d2BhmPkhES7fngRgLAVOGXVysGqT4XhSF8T+8j7sWIBci0uj7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791366738; c=relaxed/simple;
	bh=A9zqlCOxjRlPR6veYqUZq2yHzXNj7ksqudP06P908Rs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TyCkCPKvKxhrF10XFm9hP31XAp1rTIk8At32UyRFDW8c5GI82H7LR6KIfu4CA7BStAqJgIMqVh25cXMpF6B3UXFw1Z6vPNKumqB6QKGbT1OuwiUXDw8A04HuUY+digsWyaiyY9onTt8dgi6cqBj3ZRIz0QpCggeqv2VE9lLR4ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dJQcdaX1; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dJQcdaX1"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a02753c04fso8868055e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 02:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791366727; x=1791971527; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lTCkoZU0MickLLuynMxKjy0YUIqhaSwwD9LsZbzk31Q=;
        b=dJQcdaX1hM5UJxG5DtkGI2oRPMXqempOR594uf9pqZjpG1yzcicjFbQOYbIEDfxE0f
         IJASTEU+D3ZWknqSUl0PtuWpBKwVxzeBhQq4eMxNW1VUy8GO5/SPZeiImYAG2zyQgQTJ
         w7inapaFSHrf0SjynUBULolD26W/C87gtT1eSycnsGtAlcm8AFfsCxhxuREcq2OCoigA
         xosXm2JS3aDM5S07ZreIpNhMIhWmaQX0sqC/HkGE1UORHKksJD5t7D9KjyBTafTuFoYe
         A6S0BUHXHBAnIFQgoAPGTqKmbD2n2Yb9lxE7S8ah85m5H7tyyEA4IKsXgXP1mthWH9qq
         e6Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791366727; x=1791971527;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lTCkoZU0MickLLuynMxKjy0YUIqhaSwwD9LsZbzk31Q=;
        b=LdgQMF37k0TSbRvF5RYTA9qhW70+trusYK7Azzh7Py8BCHV1SvGKnaq/NiT5i+2ANM
         5NFvvlrG52CGhbAI+dxbwHbAKdlEuv6STmyHXKn76rZ+VZY5H6yyyFVdnnF6oTFMFwYm
         b0feCh0vljRr4qmZ7rH8lh7HDz4rdJFN2C05OuzfWJf1iYJz1aR9PYgbuitPYWIH+8bN
         684lJWy83nqlXUcJoDiRfRLN7s6g3zDKiLhEM4K/MOhmHWnZcnGPkoV5BjjXzKb4Bgu+
         TaLSiRtmFqh60W9jpxNGOgEYg7OLGG/rHlUw5TA5l6scl/5dep1+XitsG2P6cpoLuc3r
         YxwA==
X-Forwarded-Encrypted: i=1; AKwUvBwJg3+8FWEk9TDcxSvgCzp9mLZTB2W8K5tNftl8eitEmK851yTfgCHHgdFe0qWgFSzHf/bdZf66XFq38pqE@vger.kernel.org
X-Gm-Message-State: AFuF++lhkdemmZqbmnvBFwXASZGvHL31S5icFvMMJdD9Xl0uOJ0j/+Fj
	abCxGpyvQeJA97En2qHOzuDlh3yy1PdMkauzllTAiyg2OTxtjlh0ZAG8H78wBRaCdmI=
X-Gm-Gg: AYBFou0GhGMbI3bHgd05DTV0olwQxCJEn4YiqHGbuEpGIG0a3Hw0/M2nkhkZqvd1lD/
	hvD/vmWl5By5PlnZ8sYb7OntLpKzMRfEht6omqOeuoaQa2HssGH/SbYCBbGMcu50VoaSFX7Clca
	SENNv3qph7IkLxV7/pkA8W87wy6Rq9g1rck6gjmtfGtF/iBFeEhxl+MAR70tb4GwQwuCtkBcbkr
	/talvzl0AjObqcHXyXM8TUPMdVdGUgr+sPQwqGaqpliIrn4F+yRhCW78mz3FnYNyCwS97fj8Lrb
	M2TdCTLrSt+ZfDbmK2SPwwwCW8Y6gPeYpc1Z5SCSL2L+HEb84ttiv1YFR35b97eAxkfzoV2Y3Yf
	8G7Wdp8SaF4AdUlO2+q0xVDd5tFMH55iAEU5MymUTcagaNeBjpty69Ie9iiPxVnRD0dUQmgHgvN
	r2enWbTGRXVjitm1d3+DS/qhw035hJk4Z12e86M1ETJo/HfJzYOomTyNh6MA26VLzcUBm/SOP3l
	tukOJf0TgXA
X-Received: by 2002:a05:600c:8884:b0:4a1:80d8:aeb3 with SMTP id 5b1f17b1804b1-4a180d8b0f1mr16568905e9.12.1791366726900;
        Wed, 07 Oct 2026 02:52:06 -0700 (PDT)
Received: from [192.168.9.72] ([185.249.114.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f653d7csm54587755e9.14.2026.10.07.02.52.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 02:52:06 -0700 (PDT)
Message-ID: <e7c46f2e-fa6e-4cfa-b16e-8fa5d2112db4@linaro.org>
Date: Wed, 7 Oct 2026 11:52:05 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/45] dt-bindings: media: qcom,sm8250-camss: add pixel
 path variant
To: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
 Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, hariram.purushothaman@oss.qualcomm.com,
 pshrotri@qti.qualcomm.com, Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
 johannes.goede@oss.qualcomm.com, konradybcio@kernel.org
References: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
 <20261006223953.3382273-5-gjorgji.rosikopulos@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20261006223953.3382273-5-gjorgji.rosikopulos@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/10/2026 00:39, 
Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com wrote:
> From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> 
> Document the qcom,sm8250pix-camss compatible for CAMSS configurations
> that use the IFE pixel path. It uses the existing CAMSS property
> layout without additional properties.
> 
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> ---
>   .../devicetree/bindings/media/qcom,sm8250-camss.yaml          | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
> index a509d4bbcb4a..d561179be48c 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
> @@ -14,7 +14,9 @@ description: |
>   
>   properties:
>     compatible:
> -    const: qcom,sm8250-camss
> +    enum:
> +      - qcom,sm8250-camss
> +      - qcom,sm8250pix-camss
>   
>     clocks:
>       minItems: 37

Same feed back as on the other binding.

Enabling the PIX path shouldn't require a new compat string - 
Lanai/sm8650 operates this way and x1e/x2e will also follow this format 
in v2, v3.

Lets please align to that and work to a common cause.

---
bod
