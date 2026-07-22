Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739074399D7
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 21:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784755240; cv=none; b=uI6u3jpI0LhxDKJzJ92P03AtRd7pC7rzpoyGneN5Cjag5zRs8a4MCTalPQV4LVa1sDPNO9QsE/O3zoDEmvbvMiz1tOKF37XduapVob+YJ1vcqH3WJ523HtDXj18kgMaRklOA/FCnKzZP12Nu8xo3o2/y/JHF1CxuDi0mvr6IxBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784755240; c=relaxed/simple;
	bh=3zcQRDku687b9GexCCiJ2+XMGu4iVB7m02pg7jXFy0M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sHRodkuyYt59Ru/W5e2gLN5hRnC3JbpU5AElxAmKTH7xyNTDb74GRfu1urpSB6fHNw8uGjzGhGECnA3/UiCwtjiLrZZE+I3zP15NAjUcryzsFcaOsNgKLfG4wtt2zgxY0x40nCPn1tA3R0MpsFdiZ19Q14UseNvJCN5t9m5h9nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G5qeH8Mr; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G5qeH8Mr"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47362928f65so11845408f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 14:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784755236; x=1785360036; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xRjAKOb+mPkA8VAuf7Xdr2FlWpi0y8QOoReI50/TJ6g=;
        b=G5qeH8MrhsgMEKuPyoHpfm+E/Efc++lGnmSrDdnjoYjUHPFDJ4mEI2bop87+zIeCTg
         +GvCw2EvhNAW2OEusHsrteZY0FnSTCWknFxf4fi4AmWkcH+vlH4JVe6jWK2kzbKtYAQq
         59ILYA2vS1ePTyDJVGlbIkM6yfwGd3RvsUudEvzFT0w/PszSLpmYnUhB/JRIvMxXtIp7
         3H2dpYKoFKQNTIYqbaZO47hwjm4L/nVc0ccFTfWIMUXD9+01l8EL6I+MkqrClOlpG0Y6
         fPSCsUIZsvmy+olwej2m3KxLnCxNwW2WxTRhoOZnbWI6YV2DhEU5H0h9wG34pnRtpEQx
         PnFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784755236; x=1785360036;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xRjAKOb+mPkA8VAuf7Xdr2FlWpi0y8QOoReI50/TJ6g=;
        b=hdGP0zAGEztHB4wqMzUjGMjbBOCId7wrsIOIXv8ezof2RzD7T0aGt43GH3Z6IvY6XB
         VZPXZnYLOrOTKgiY9awqtB0UGV4r6IhkLGk70gyqRg604wEHnFHRJvx2jC8CZB/8eQJx
         xkHW8y8fNEMNuVCmD+yIDB4ow9Wbf/cXcID3ogQDZm19UgDu9F/FkEzuGRPgIiFjahia
         CnftEBBy7tpjDc6yhUxJejT4HKVlXgF8ihfA6QoDYcbLdZW2tGRGl2Zvfcc6mdnGmV7+
         YD6/sVpqqE3rTCnU5Q6pf3tN22q0dXed46D5doYIC2foOb8nAclHtVPqKyikQhDpyik/
         wbnQ==
X-Forwarded-Encrypted: i=1; AHgh+RpzllztqK3/4uO8vvWpm7BLZxmfVE9Q9LPN7ciIOt9Fx6IxRG6U8N25rM0YScde9O4qwSh6mbX3aNV8UrHx@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4Fy+PtNwNRdE5e0aW2txkHbGNzF6lSws9VeluduVPqaXF31fb
	z+WjyOtiiKF1EttJ8S7VHznXQfpBmnhiuNqLCetn/sHyAf8NrVA0ZoFZVtCCTgDMbHs=
X-Gm-Gg: AR+sD10wonB5kiJL3Px/rEPmSfczHoWxL2HolyfY8Ot5X05Opljw7OY0B9KZwJe4D9G
	hJxcj9MBagvZb/t8afjbsQabG0HEfH5/3Vyr0PIoqu3c4b/hXZCy6tM13w+Ve1FIt84VttK1DMf
	tg7PYWRPr6odvU11f3NnaSPmNWl6yfCWccihXX3Ujuyn/2I7Ybl1TOoaUbtd5eeUTeOE210okxo
	M2h/hNxWJ34p29TyACMCirgZeVqMVX/shgYyM1rzkBtYCg1/2Ey92Q4IiGJfI/+LnOz+IPNLAVR
	M/Vd1ndg04gBd3HNu6EjO2qpAJqA+S9MjXG52F2BUn5RPFH1eSvXfwzCdYRtV8+auQxDlNFbFww
	pGHGRTbc5pM4eSFqX6mh4/ItnLZwrvupSFoUZLsz8C1rJgQI2bN64fuB1mlg1AdttaBE6z6iQUF
	FUa5vEqANe9pIJew==
X-Received: by 2002:a05:6000:230e:b0:47f:7b85:b883 with SMTP id ffacd0b85a97d-47f8d761973mr533687f8f.47.1784755235652;
        Wed, 22 Jul 2026 14:20:35 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.14.136])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f864305f5sm8820431f8f.17.2026.07.22.14.20.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 14:20:35 -0700 (PDT)
Message-ID: <382f3a2e-4493-4c14-b402-a98b12d4c1f8@linaro.org>
Date: Wed, 22 Jul 2026 22:20:33 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] media: qcom: camss: Drop icc_res_qcs8300 resource
 table
To: Hans de Goede <johannes.goede@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20260722163658.409872-1-johannes.goede@oss.qualcomm.com>
 <20260722163658.409872-2-johannes.goede@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260722163658.409872-2-johannes.goede@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/07/2026 17:36, Hans de Goede wrote:
> The icc_res_qcs8300 icc resource table is identical to the icc_res_sa8775p
> icc resource table and qcs8300_resources already uses the sa8775p resources
> for most things.
> 
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 17 ++---------------
>   1 file changed, 2 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 3efbf2fb4472..477358dd39fc 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4161,19 +4161,6 @@ static const struct camss_subdev_resources vfe_res_8775p[] = {
>   	},
>   };
>   
> -static const struct resources_icc icc_res_qcs8300[] = {
> -	{
> -		.name = "ahb",
> -		.icc_bw_tbl.avg = 38400,
> -		.icc_bw_tbl.peak = 76800,
> -	},
> -	{
> -		.name = "hf_0",
> -		.icc_bw_tbl.avg = 2097152,
> -		.icc_bw_tbl.peak = 2097152,
> -	},
> -};
> -
>   static const struct resources_icc icc_res_sa8775p[] = {
>   	{
>   		.name = "ahb",
> @@ -5573,12 +5560,12 @@ static const struct camss_resources qcs8300_resources = {
>   	.csid_res = csid_res_8775p,
>   	.csid_wrapper_res = &csid_wrapper_res_sm8550,
>   	.vfe_res = vfe_res_8775p,
> -	.icc_res = icc_res_qcs8300,
> +	.icc_res = icc_res_sa8775p,
>   	.csiphy_num = ARRAY_SIZE(csiphy_res_8300),
>   	.tpg_num = ARRAY_SIZE(tpg_res_8775p),
>   	.csid_num = ARRAY_SIZE(csid_res_8775p),
>   	.vfe_num = ARRAY_SIZE(vfe_res_8775p),
> -	.icc_path_num = ARRAY_SIZE(icc_res_qcs8300),
> +	.icc_path_num = ARRAY_SIZE(icc_res_sa8775p),
>   };
>   
>   static const struct camss_resources sa8775p_resources = {

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
