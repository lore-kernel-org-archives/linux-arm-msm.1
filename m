Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6425E4BE430
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 13:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790601956; cv=none; b=IjDNAvRtIIJ4EOoHbXFSAHo/OpByVK4s/dpIJZ32kEir89mj3aU+jLi9q3URwpaTqZWNCFNKebtMlajk8xByoJQbPuDu57hpTbeZqNv9kR3fVXJUZBUbzgMGcJl3e6R2/SvnHWEHT8lqpCcUptlepe5Rwaq/i7XOcdq8M4WxoQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790601956; c=relaxed/simple;
	bh=XeTqlOGO5UJpA5Y/ixti2g+j5EuJrE8Ky8E8O1CBHsw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L/CcI4QLXwQy2+vgonFRJrd3EZH2PnkZiwo+yRoYlKUJiaX6XRSi6TytahoLEmdP4/hYIN84jrIVdJEmEgESUEZJv8j9yojiCgmv0XqJBSSag2KBuCWCuCUceGjNFKcs1+pLHFT4jKUcw2garTouB4jEerN4FC0JHE5C3cqqmfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hpgN2kzd; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hpgN2kzd"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c169ae1cb26so5293466b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 06:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790601954; x=1791206754; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1zVAGtWsSkfmenTzIW3+TUh6amDiHnEAZ63ReFuJwGY=;
        b=hpgN2kzd54j6cbS6EP3E8fbdoLbkzuJ+TwhtAB93u8vgWAerAXB1R970vrbOgPiBdf
         wqkj2FxM8w8eN8TmyFq8be9pq/eZZE4kJosIBtvEmt/lyl4wWUjdvkx0Smer2yOsrzCR
         q+KDCHq+XZhKqqEklO+nVd2pgkqHyN/uIcpIjnuVXDwJ0kokgW7LW03H8S1FDCweiRfZ
         2eACMScJ7Fpzi5a87bBEI7ms+8QLNcT98YuBuyS12bQvO280Puwlb1tKp8bBl5+upZVE
         oEQSlLA2H1DSp/+WGma1es+GWc80vq3FZNITQa689pmqN3YlhSTLroxGaF7vDekyTvR+
         dHhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790601954; x=1791206754;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1zVAGtWsSkfmenTzIW3+TUh6amDiHnEAZ63ReFuJwGY=;
        b=NDvAGoZqIvumBOtgRcJEUdiZir3uhwe4awoqlzyoFo4C667FQMtql/bk11KHkZKXQU
         U+Pz9NwQxlmcHpK7vdMDLKmTxYxmeqWRpF8HuMIiXbvq70a4YuTthLue/HBTm71zTqVx
         OMhCHsoYRCT6hekoeXMgVyfiN/dFDUQX8taICv0ne7mvkEZEH5vJRvkO163mu+jdA3Xc
         O5zPV0zaABao1e4icixhq6fnwWS3BGjISQTOUY7eb8JtXr7BRu5SKma4aO7ggbwWNFBc
         liP4/lm0BCbYhoN/fBdnRzWcjEK2iWL7a+gkSRhoVD0zr5TPgPD0vXvmaXkOSZebvBeY
         n0fw==
X-Forwarded-Encrypted: i=1; AKwUvBwt52dnW6rczaaGizL98d5HV+xdHrPtoC7q/41NYAZ+yFBRLWNyPh6kHuUxV5sQIltnQBWmJu02lyt5YiUt@vger.kernel.org
X-Gm-Message-State: AFuF++mOl03Za+IiZwO8X3T7OHtN4mKIGtf8Ao9x9W0/M+CgOlxJeIH8
	RplVNczzfHy+1NMpIXd3G++uWEDNCVG+ffiVqnF95skhEfGeFF8Lx7+z+WiHDO8RW9E=
X-Gm-Gg: AYBFou1VkNCx/H0iQxRFQfp8C4wZA1rnM+uLdqkGdNoS3mD3v/PBI01rjqvRD+2nSAn
	N7dMQHp8pnM8xcll2BN/tyhURVPGygG2UGfssZ2RJIlMxCaOgLJA38X+92Vv+OtDOU0cNVVly+V
	IiSoLlYQ8NmJCE0ls76UgxMjZlH00zG+zmPeQTgJ7bBnIYiO7NhlwAhGFYroWuTveS6jYwz3ROa
	vEB9nphEKDsMwKjB5r0ZMWMn8ex62w70Ozkpa4ggO9qFAUD9N6glwRFl9W6mT64LpqOQvcFqRaM
	JaRN/Tp8ndUlVOupqStbtnHQN/d+jyTEdMzG9oB78UDnEGUBCtvozl5OoT8v733h5/eFM5wtoLX
	FOSbQ1BM3pyW0liFK/BFeuuiRs2yFdWKrO7tNdlS4cG8+ekrnYP6gcHkxqUkxpGrdseslpThQln
	vBXyqDO3wPExxxV284A5lYphw/fo3xUflOrGeEI9DxMTOA1H/6Ioe+w7XDUKBlT44JWGDUeFYPl
	TnUsvKt4lNj
X-Received: by 2002:a17:907:db18:b0:c2a:880d:777c with SMTP id a640c23a62f3a-c2ac2245724mr1069641566b.10.1790601953464;
        Mon, 28 Sep 2026 06:25:53 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.243.160])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae7357cf3sm475547466b.17.2026.09.28.06.25.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 06:25:52 -0700 (PDT)
Message-ID: <15ab286e-23d5-46c2-a952-0be1d93409ad@linaro.org>
Date: Mon, 28 Sep 2026 14:25:52 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/6] media: qcom: camss: vfe: Fix VFE reset while
 another line is streaming
To: Hitesh Patel <hitesh@ebytelogic.com>, linux-media@vger.kernel.org
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 ravi@ebytelogic.com
References: <20260928121508.1404808-1-hitesh@ebytelogic.com>
 <0udzjudr45cAD9iLLoskmn10mElRgfZYq9Ir2wzfaY_qUhAb9W4CfL3Gr7_j95UJI4vC_CMphfJmwiFoYiwmNQ==@protonmail.internalid>
 <20260928121508.1404808-4-hitesh@ebytelogic.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260928121508.1404808-4-hitesh@ebytelogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/09/2026 13:15, Hitesh Patel wrote:
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index c14d97a131..d20cd4dfb9 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -821,7 +821,7 @@ static int vfe_disable_output(struct vfe_line *line)
>   	output->gen2.active_num = 0;
>   	spin_unlock_irqrestore(&vfe->output_lock, flags);
> 
> -	return vfe_reset(vfe);
> +	return 0;
>   }

This method should be void now, I'll fix it when applying.

Suggested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod
