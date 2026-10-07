Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E82646F4A3
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Oct 2026 09:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791366558; cv=none; b=cheAVzS90llYzGcc3QseNhr0CyuQnKHHC6AtLTCmU8/xIkB5Obl4g8MPFLhHhByAa9KjoGR5vNzWPAqjORuttGI1XL2Jn/gWFR3sEC1b9xyrRGIvYIHiX8Y491YeG/A+IFz8U5bhSRSHsG4rDtgVJY1r5/cF+dAKK//31QlUEIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791366558; c=relaxed/simple;
	bh=0sEpBHImgtBxz8uqC365DtivvPzhsstSwHsRYHYQ4t4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u9WfBK60o0VlrfahsyoObFv5LGHDtFUxjUUVDQvuGSdn6dYnX69FzhDGn7n1Oo1wevUT1BYESALtpCBLd1sEBfQbwVc/yoTEiatf5qlCD7sNpY3vOhKOKICq327thQ3azG+CMYiZmPOfyNVOA0Kmw0dbVdabV3pTmxcmwTLQZ6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rKBJxCJS; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rKBJxCJS"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a16af2a232so13472695e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 02:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791366547; x=1791971347; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KCLuNr5Jl4WbBQBGA8ZScNaP6xA2JOMpqFLldkWVSHk=;
        b=rKBJxCJS66UM2veHqCI1TbI+fZfaHwd4eP6Gu4swccjbzbpvgp6Rud1/IufdLNsjGw
         l6NN/lgL7o2ZPPhB8dtPcrTdBIXsn0KhuBplwK2+N5Cnj0u+mwwS0rlAs71oxerGwqWo
         lxoJ0DuE6A1WResD171qmlH49cB6pT0UnqhRIh1MHBL6sq6nTcJN0Ri+KXuzICgtfG3T
         SxrXfd1NwZrinvmxuusS9kQ7OvNe/GVpHyEiWFcGaowIB7CdDJaDhQWqr0w6rEQ/1A4F
         9eFU0aaQM+DdfmXIkuQaj50sQ8Zub9QWO2c8QARR6aJdvlNj+ObGY7qTYEKftyj/MRQM
         Uluw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791366547; x=1791971347;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KCLuNr5Jl4WbBQBGA8ZScNaP6xA2JOMpqFLldkWVSHk=;
        b=lIBkfXJ0X1eGqlFC8+ZnOX1JxEkwtYYm+xSdotoqJbaintJSMLXcPsq/Ix2f/HMZAQ
         7FRvsui9/gOkBTR1+wVYUspS7+YUaAL/8J37BIPpSGxEo+vNc4zsL2aVZZXJPpysk25P
         DDM5ojdA30GDV+OQv/l5imq6a9BF9k4kPLXmQ0yJNbKZEHVjFOu0aHVfmf5K3rJ1gkds
         HbRgCR1Z7cjnZDPQmkLFfReGb+eNlm1Z5w79lqSCiU00wfb/P2tE/Zt7LENSFhBHiQYQ
         OveSmi1WkWUzHg48wiKyd24SeUxhyj00lqWC9mds/Hm4ue9D75G+ceXLomuKl6s8Cmjv
         r04A==
X-Forwarded-Encrypted: i=1; AKwUvBxvq/79u2EZLJXK37NYJ8nv5APXdj9uDGbj0r7/n05YRttKvpc0yVgEYJR7jx1+tcpXGKtlkmXXR3swASzs@vger.kernel.org
X-Gm-Message-State: AFuF++nTN5ukScIOZ2OZeT+ZYz/lGakSKy3aq3gtyXKB51+J4NYTCEyB
	hiSNI6cEHUn2PtZzY+HudyOlFmAumvk/iHq2je3+EDeHnL+UtbSRl3EsQlB38Es9MW6Eh2yoOV6
	sfU+y2tI=
X-Gm-Gg: AYBFou04b5rBFyffYxiKa5MUcsIfCYJhPn2h6GmEUZacaNZQwOLBHkbLMWCKGdKyMs3
	QmAXKUzGMc9SW5fUTd2PzaRlOVcOopEBYLPFtbj0MHbSaFtuHg4jV0VWWmaZdSugprDNbCjYI+2
	5KWzLDWT2kYmz5zmIFngFxghpzsNhn93MhXH9fdd4/c9w8P9uAbuVY6W8mvcrek8j31Yl/8SUlk
	1bssWwPfiSCagiko0z1raUT35b3jfj3AiRD3nVFE0Ob7lKpS4fEoTpZax2DVbBWkE18OgpRLJ50
	RtiY+RT5iZWDk0+DtGxsMKjwlQStMHFGpZhXdH/Z0idvEI4DqY1R6XK7rp+jCnHjl1WWbzqJel3
	cg/zTvxvKx050HJOnx9S4HJohNo/hy8PyDbv0wxQrmEADy5tU5vJQxGGYk6cb+DgY2NgHBuJ3cn
	45MTREaZIS6UUPt8u/B2HYVtfNlfVrw+REXIA6XeNT3LpJiA7blxVOsiYmBO8xtAd+uJhWlMco2
	R1jp0LOmEQv
X-Received: by 2002:a05:600c:19d0:b0:4a0:1f51:ba2d with SMTP id 5b1f17b1804b1-4a18045373dmr21395025e9.22.1791366546591;
        Wed, 07 Oct 2026 02:49:06 -0700 (PDT)
Received: from [192.168.9.72] ([185.249.114.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a180932dd4sm20918875e9.4.2026.10.07.02.49.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 02:49:06 -0700 (PDT)
Message-ID: <2bb9dda6-4a13-4da8-b17d-3bee6ecf9bba@linaro.org>
Date: Wed, 7 Oct 2026 11:49:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 26/45] dt-bindings: media: qcom,sa8775p-camss: add pixel
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
 <20261006223953.3382273-27-gjorgji.rosikopulos@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20261006223953.3382273-27-gjorgji.rosikopulos@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/10/2026 00:39, 
Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com wrote:
> From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> 
> Document qcom,sa8775p-camss-pix for CAMSS configurations that use IFE
> pixel paths. Keep qcom,sa8775p-camss for the legacy VFE resources.
> 
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> ---
>   .../devicetree/bindings/media/qcom,sa8775p-camss.yaml         | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
> index 48f280e99809..9206c7cfe197 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
> @@ -14,7 +14,9 @@ description:
>   
>   properties:
>     compatible:
> -    const: qcom,sa8775p-camss
> +    enum:
> +      - qcom,sa8775p-camss-pix
> +      - qcom,sa8775p-camss
>   
>     reg:
>       maxItems: 22

I don't get why a new compat is required.

Please look at my RFC - there's no DT depends at all in that.

The existing CAMSS node has been designed around the IFE SID - not by 
accident - I've been pushing this for months - to prepare the ground for 
not needing DT churn to enable IFE.

Sorry NAK to this.

---
bod
