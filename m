Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793872299;
	b=KL+YRcMO7Imhnko8JzG21ifmfGAcCoi7dJ99mbtym9BlhxCH8dv/yPKB2okfW9+/3ru/
	 Ys1iInqig2CakOQyZkUevTvLrUYF7DcnrIeBUeXHZ+rdzQMLuZfP+suMCK0g96HStCi5g
	 sfPHcpctpVn4xG1W1zJTUwejcfvASErMv2d2MVT5RouL2IwXZ+2hgHvcQLItyF41bBVLF
	 ts7dWrJ3zmg1IECKQlk624r/P3ImiKAblIvY8SPzNWyeu3cWGgGq1OUjW4bbeB2wZ4w2r
	 3wqmP5NYCGggx1gX/4PGTtZXp+RwlXuXLUEmD5G0/+tw60gv2pWnzJKZowgmNuvSRVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872299;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=dvKyTZ9haWPfTGY/2ux6Lo8rlburvEYrvCc+2l2o3+g=;
	b=xp9QVMUssHs39GUYDJKkK2Vnd/oG+C2SLbRMViDKWRdKnzRCXhR2FsX0bzj8YcL0qXfX
	 FEadgMcryvAazCKYFLqBD9y2PaYq8s3LHtm6iWl3cTPqAZzD1HHaC6B4edW78LZACGUkH
	 ViOFfNatbw/3P+9KheluVLwOEizD6SUAx/W11HOCjTAiC2KWEMAnFvG7Y3QZLSbCyLoWg
	 3xGGOMenlhS1G8tBAx4EA7Zc+7IY7/Ab1GAiyGNNaC+HUGTAwHFrJ5CfK7l39xVB+d3OZ
	 D7rgtSlqs9swR8rUFqDzwzVo18otvb5TAdJ4+HEzgQnd9HFJFUxVnYl677lVeBwLykA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=L2TUIWcz;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC516083639
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 09:51:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCC516083639
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=L2TUIWcz
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so16508075e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 01:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793872297; x=1794477097; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dvKyTZ9haWPfTGY/2ux6Lo8rlburvEYrvCc+2l2o3+g=;
        b=L2TUIWczYjxmSNW3YksVxTTXQJWVA20AXdJ8vCHjMR7GtxLqwju9JKjqMwhaUgy+Ag
         Y0jUBEYZai/ZgKkAW1P4S9HjM1gkSIY8n4/hWTaOnvbBqLdDk3NzKnUc9JxJqZHr5LLs
         qkQ0/gxxMa5dRWfLld4C3/I0Ti0+UZ5xaP1pYzPE4DRRMhETPu5gtXyF6uetxvlNXt9h
         JIcS77KJ+6PPi01g1zG971ug4Q/XwH/bw5q4hy1LmQMmlXOOs050EoF7iYeJf1lpWt/r
         qTCXSLZskxiwyRmjR0p6sI0PUFjLmeykwBgTLdUjyBj1326mzsCbC7p4Y4XUcEOTkSfb
         ImHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793872297; x=1794477097;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dvKyTZ9haWPfTGY/2ux6Lo8rlburvEYrvCc+2l2o3+g=;
        b=QIfWrq3wpCkui2oph2E2DMeVKbgmeT61l0nkl5wHABbdxtCCFY5QtB7KepPLsUdKNQ
         wQ9CqxYgg2c5AkUoAHUVKmb8iEdcNutkuw4PMsYpLpyIjsTMA7AjXneXS6wY1PpkPFvQ
         z8wGpFAFQnssD0Aklo3eAmTXxXW/7iDReFOqxQmRv7VONpYaKffxzdv/qjRDprFymuSu
         U9yaxs6tCAIAxhKezfRNP3KRha7Kp2FM6J61HTJ8xq99Fq4UKrmAZURKoNTcH+ArRCrD
         c7GTQb1VvPpb+GLxa1STBBPVBqDG5DL9GiEfUzYXA1oIfDcghHF2WG+td83TaH7HU4n4
         Yayg==
X-Forwarded-Encrypted: i=1; AKwUvByKK4bOX5MDnhDtrMevi2YagTd4sUlgd8rFt5rq5nfflI5O0JNs3uFK3yg/DLXUkjTdgjWtbIioWExjjKPk@vger.kernel.org
X-Gm-Message-State: APuU4Z+Hhw2zG/NazQloPCExlvesmuPhkQr4zBxv98uW5cRssVp/MuHr
	kjk5F7QjW8rYrn8RI4FitGX+zPVDzxJKfJRVTzufy0hV4YEboYpx1RxjJou14Y+kNeo=
X-Gm-Gg: AYBFou3nzUIv9XhT5wAC9WiCOqOJDslbiEbFvAg/XMTcJup3Ah5NkjXcHszRHAjlfjV
	tbTHP8xoPhSpiIgnadH47RuWiQhkbvJRBmzdYvQI8oMzlk3x5F9BU9/ow8uj29aFmNH4PmhyH7E
	VlJqWwyUS0oW60Az4V1LCqCJcog8tS0Sx3FQsMsK9KZsTIwEvJNMcD125RXyuwlWfENAk8egXiR
	Jq1Cxs/xjAu0lUcHFg+VbKdP/n1w1dthrE6C7VlKQxhpZAbjQCHO3S7HCUTw8Oos5lGiGo8/XSb
	IiJP10i69yGgY5+kSRT4pq1UqsdIdNz4mTkpbJQjHw5h2kNhLnVt8cbt4T2ARl59J8gfS8XUsv5
	CQ5+GYRtP6M11ip4h8MZfeJeYlEQmrUnsWzYrXp5LfUht1a2KqoQPNGXUMeCp7pqp9uxAA8ZyMw
	NGp85vV1CzD0iJqsN6i2+HIF7/bvQKDseCZeHYMGwiBRUo6+vSv7PzsOvLuAAGUXKyK9D89gDE/
	xcOfTmqwx7jRtSHhbGFtqgfg+fv7pTmv6YRHoXosBuKmQQkiHW6fvMXh+YaiF1AQtySmGW8lXUV
	JtqWkm1qR/rz9aA+IVmziCqRoI8Ujpg4WKflFw6J
X-Received: by 2002:a05:600c:a00d:b0:4a5:e6fd:65e5 with SMTP id 5b1f17b1804b1-4ac19705d57mr404951005e9.31.1793872297245;
        Thu, 05 Nov 2026 01:51:37 -0800 (PST)
Received: from [192.168.0.167] ([51.37.126.136])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fea180e7csm9090994f8f.5.2026.11.05.01.51.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:51:35 -0800 (PST)
Message-ID: <aad7cf3c-cc25-4368-bcff-7e222f22ca99@linaro.org>
Date: Thu, 5 Nov 2026 09:51:34 +0000
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
Subject: Re: [PATCH 2/4] media: qcom: camss: Select Titan 480 CSID offset by
 VFE type
To: Vladimir Zapolskiy <vz@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20261104234533.3044265-1-vz@kernel.org>
 <20261104234533.3044265-3-vz@kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261104234533.3044265-3-vz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/11/2026 23:45, Vladimir Zapolskiy wrote:
> On Titan 480 CSID register spaces are placed inside VFE register spaces,
> and the offset of CSID registers differs between VFE and VFE lite blocks.
> 
> Instead of the assumption that all VFEs starting from the third one are
> VFE lite blocks, check the VFE type in the platform VFE resources.
> 
> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
> ---
>   drivers/media/platform/qcom/camss/camss-csid.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
> index a00791b00feb..9e64e8d44926 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> @@ -1119,7 +1119,7 @@ int msm_csid_subdev_init(struct camss *camss, struct csid_device *csid,
>   		 * between the VFE "top" and "bus" registers. this requires
>   		 * VFE to be initialized before CSID
>   		 */
> -		if (id >= 2) /* VFE/CSID lite */
> +		if (camss->res->vfe_res[id].vfe.is_lite)
>   			csid->base = csid->res->parent_dev_ops->get_base_address(camss, id)
>   				+ VFE_480_LITE_CSID_OFFSET;
>   		else
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
