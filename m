Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795710137;
	b=3Iq1y3c6CaCTXR79hUDq9+xP6mDtNC+2ThmiAwqqWN+zEWYMeiz+OeeDtK9tUmoND354
	 LbKfSEtTqkOTyW712ifElS1Nq6uJAJSN3PRrlp5jIWBjI5mV34GH9oAwsON+QdSJcZB7w
	 61udttv3vQGMVIotPwb7aw8qidmcJXF8OOR/6dsO7lmioNoMu6GMzfPDjdjHpKQTMlzCg
	 A2qJYLpZLuUqJQwjumgwBWPnAvgZDiFL5QCHoquNSBM6+m3LbbyxjUSsdteiEWtWBt10A
	 czFImsjqw+HqS70f29QNjTfmTVl6zyDS4OfCbOye7KdS1iHliC+2KzRE1tyVDnHi6iA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795710137;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=LhXW6WWxyK5q9TLN7DF86Y32xXd7qR1sGyUm/tXFhic=;
	b=p09RluOaIqqJZ8iw/Yi2s4j0fZZ3WRJbLBkfeH0gDJoCtvDk1PdlLDo3ygBYkHNjoUiu
	 n5K64m+NMqBJ5waDs2bYnae7PSfSgyli2GR9KZRvt6eWDabTk7VNX+UScEu5nkCEmh67q
	 JlEy1w2fykL/xDgXDwq15xQvYXxO8AOYWUBTxed7jQ/gY9JnCmZC8WspoS08stTBCnZDX
	 lkqoPtvSeh17uPD8r1MdFcSWsoySkg3hNeazxAwnR92P4EnoILArWn0ZP0CDqlDlHlOL3
	 DT5lXvf+/0TjLkZ9d0EbqIUHgFqMoSOxtYpr6IaM/KXcDtINlIA7DFNOh+zS4iRAe0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=sTXcBPYS;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1E5606A31E
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 16:22:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC1E5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=sTXcBPYS
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso72513355e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 08:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795710134; x=1796314934; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LhXW6WWxyK5q9TLN7DF86Y32xXd7qR1sGyUm/tXFhic=;
        b=sTXcBPYSeisnxxEwCZoFkwQP+w7rdOFVMnhCKwiTziMru4eR0LHtPa3aha6YYT1ceV
         CpmeE513GLsWm9+qqjK7wKXB7vapqRlPYKpQoB2Ffc9EdCY+CCjbwfy+QZtVgr+irFW7
         t7ufYEZ20H0Co2XeU4yJTf+3t5lazV15Y+cqlO2YwdB+787Modeuo0nGWcjCuGYRXVs4
         1akr24E0Xmdr7WT1m0mICXL/8lEGMedXGadIfV4wgf3HNI8HwypKypK5K0gSj5mGxN/v
         JA8ugjrD5VOLGnQbchT19EMbtRo1ALPIhUVBZwx+eaKKg/diWEezfOsKAZtwL1w1todn
         U0rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795710134; x=1796314934;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LhXW6WWxyK5q9TLN7DF86Y32xXd7qR1sGyUm/tXFhic=;
        b=PG7rB8rzcEur1/DtrrYhH6KB0cSuJiC/hwB0X/9Vd8eEWMx+y1UxUaUhSSZG+6TLyI
         5X6G87MmIKzEKfCMGnovG+lQ6KiivlbpeTMKZPHQk0YOhRvXJ6JJVC0Q/h7r6S9XPiw3
         psqutYn+1+uTGXGIoK+ZZPMzVQgYIWMeBng1dpLCqBiIlf8drDCgfxtWn3K1hlacJnAI
         Ix/zF/HIUhkKkLvKYVTql+sVkFMudOE8ua4gcNXUpMEA/Km8Oa5sNwOyDpFX9Xn49g3/
         f7uD0yyROlMfXfz5wULoOzGeIvHjEAmC9vne5LbFhZfFshUkBXi7MUvpvNRiBWDUxaKG
         EnTQ==
X-Forwarded-Encrypted: i=1; AL+hErF4sCeqJl+DhscpP8s/K5r2cQ5TtwaWxfdkHl+Hbj6dqzFFzXp+UO7hrLmff76fy2sWI1LaJV2qWbX2WU+X@vger.kernel.org
X-Gm-Message-State: APuU4Z9bVdAZochBeVHQz3AeXvzZ7UcpIYIxpOxem+vZgejhWb/he/u3
	U1s8tGTEaMe4Rna21ioOIlZu9/uyNtB0pBsrzZYLHSTkgaF67B4eyPmfVy1P6t5pG4A=
X-Gm-Gg: AZFdTZfOarC/lDHVXq4xjGSE5F/0DxsEtt2deiRs3LuyTfxKK3PInWeSmDJ+DpSlWLk
	Hv96Tw76g5BapuO264jKz+nBmsquxvC8GnDFj77clwQADMZDvDfmu6p6MY4O5xhGBY5RfpOxz0M
	PBVa9PqwDW1/YXesdUatf1vljsqhHancfRFl7Ww0jmDDbVvK732nm8puFn3n6mPJSKS7zSpL0A7
	gMlYSAQx1UlQzDF0Mi0wWknxzwiXMKbrCAkgb2tM6mTzjGPFXAuU2BkQXMwls4dOTWDpWs0bB3k
	Wv/oQFL+Ab/8aGaAnjj07AC4pIOwdb1xOOpao9YWUewJBvtPPuy7klCRda3sw28gSaqq+6oOgi7
	yhbilx+R7fRnnU/E6R3uxGVNhI+6FoiLX+Q6Q0QFc9/nl0PHPiguGghUXCAHWjrmR0uLYbT4IGG
	49vgrvvjSwUMwwCbG5KCy7R/Ulo+sQm4OAiB/SBs2IjdZxPJ8NxT+reSEGL5KZpDWve8GpmcjHI
	XZIyFsC9CIxB88G6/hM/wzrLaWItE0L5QK7CzA8rygS4vVhfgNmjLEqmF77j244dA/8g7Sr2qR0
	yGMzNUW5zsVztD6s8ftyvH0n1ShqsCjoqZ0pbMK9k+q4XTK75nZxDeqPmuGL8CE=
X-Received: by 2002:a05:600c:4e02:b0:4bb:5d39:95fa with SMTP id 5b1f17b1804b1-4bb88811c82mr422575235e9.12.1795710134157;
        Thu, 26 Nov 2026 08:22:14 -0800 (PST)
Received: from [192.168.0.167] ([109.77.24.219])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2c8csm42722484f8f.2.2026.11.26.08.22.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 08:22:13 -0800 (PST)
Message-ID: <c7e1b25b-23c4-4598-9a22-577e105cacf0@linaro.org>
Date: Thu, 26 Nov 2026 16:22:12 +0000
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
Subject: Re: [PATCH 1/3] media: qcom: camss: x1e80100: Fix CSID2 routing to
 nowhere
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
References: <20261122-camss-routing-fixes-v1-0-0deeeaca2622@kernel.org>
 <20261122-camss-routing-fixes-v1-1-0deeeaca2622@kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261122-camss-routing-fixes-v1-1-0deeeaca2622@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/11/2026 02:10, bryan.odonoghue@linaro.org wrote:
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> CSID2 doesn't actually have a corresponding VFE it can receive CSIPHY input
> and raise an interrupt but it can't drive any VFE write-master. This is
> basically useless and not worth coding around in the upstream driver. If we
> find a real use for this we can turn this back on. In the meantime drop the
> definition, it only confuses things.
> 
> Fixes: 1830cf0f56c3 ("media: qcom: camss: Add x1e80100 specific support")
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 21 ---------------------
>   1 file changed, 21 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 26e3f2aa3ef24..aa6d01d8fcb2a 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4515,27 +4515,6 @@ static const struct camss_subdev_resources csid_res_x1e80100[] = {
>   			.formats = &csid_formats_gen2
>   		},
>   	},
> -	/* CSID2 */
> -	{
> -		.regulators = {},
> -		.clock = { "gcc_axi_hf", "gcc_axi_sf", "cpas_ahb",
> -			   "cpas_fast_ahb", "csid", "csid_csiphy_rx" },
> -		.clock_rate = { { 0 },
> -				{ 0 },
> -				{ 64000000, 80000000 },
> -				{ 80000000,  100000000, 200000000,
> -				  300000000, 400000000 },
> -				{ 300000000, 400000000, 480000000 },
> -				{ 300000000, 400000000, 480000000 }, },
> -		.reg = { "csid2" },
> -		.interrupt = { "csid2" },
> -		.csid = {
> -			.frame_sync_en = true,
> -			.hw_ops = &csid_ops_680,
> -			.parent_dev_ops = &vfe_parent_dev_ops,
> -			.formats = &csid_formats_gen2
> -		},
> -	},
>   	/* CSID_LITE0 */
>   	{
>   		.regulators = {},
> 

This patch is too naive, it leads to:

20261126-purwa_camss-v6-2-5ab97aea3832@oss.qualcomm.com

I'm going to NAK myself here and do something better.

v2 incoming

---
bod
