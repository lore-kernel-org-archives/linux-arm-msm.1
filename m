Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795616456;
	b=TSCtjAMDHnIVlAO2xC2QFfN2xfN2arTH7X0IzHhSu/eWMhOsjPYV7pfQlziXCmqYEniJ
	 lq2r/A07eDQVh8YbySUc1gbfqyLI3WgsLLwGyRrIBVTz2skZW1rsQ3NQFs12cAywZIBsx
	 4DaYAdFcn3mvbdXZNZ4fwTXAdImhcQxLPewVuqVoJUverd1DGWYAst6Kq0wODOYCc4C+J
	 xdrnK4HBiQp8Aiw1PszvEMpr4UHslLHDbY2NaFluGBxHMEX1GZ2N207k7R5uox3naual9
	 xaDAkpM4UppDKwDoeAqrYrYyql5fHq73IO26UkqmLkLdUcbDaFIHpcfx3Q+j34nOjOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795616456;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=w6I+ryhKUHBU8/ypdPULznpg2ekJDRBrE8QNL0EUam4=;
	b=II0H2cdthImLD4Od+SsioaBFFTtUTppq7/4EMBaCJIVr715nSWuHqnfVlowYne88qWUp
	 EQlw/lFuzKyB+TVKf6X7tYkgWNFfGwTaTElepu84fXGeDPsqZhxBcJUdeFg2ZgsqPOccI
	 r+R3ItO7MPMAlZopAZpXv28ByxZdcJe8mKJX3jyaTSS6ryy+/TsXwvI9FyvMZuLlR9RH6
	 CgZNaUFTog6A/DH4BrzfWE++hgN2Gn9vIwG4wmchXhNXmesmBMfTfTx0qTJ5eAxWcSnM8
	 kwwHQkk6ITx/3OsSeiOok4/y6RiLlw4/ZhTFl/D/VaNZA1prC7cIFi5lZwPdkc7EcKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uGl8+q2+;
	arc=none smtp.remote-ip=209.85.208.176
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4096E606A326
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 14:20:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4096E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uGl8+q2+
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3adef2bf7acso4809411fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 06:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795616453; x=1796221253; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=w6I+ryhKUHBU8/ypdPULznpg2ekJDRBrE8QNL0EUam4=;
        b=uGl8+q2+W4FLFqzK94rJ0xx8KjdkJPZX2a/BebrK8El6t7BmHdxAKcVXgxwcW1nRdt
         QaDP5T7P3uqBgih6parY7BRxsPbdJVw802NP7Gemiraa/Np6gnLKQF05xoUOx1QO5MTd
         iXoyIX/MAsm4dgMdBxlD8orfF15XV8WYNeU7zRmZg1vABFE+6eCqXZPgxaPE0TxHJHwN
         e96tkwkdFYRSOzX0hVuRIdJRorRZALa/qkpg3x3l/kbrdH4UiWuxpGgy16ZbHfEv1bUd
         KnO1yO8xY7OVPSOlafW9vxu96xbVdpSfm+8lwp/NfkBrKZvX+fUIC3TE3oAeApXuh/Bg
         Ef0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795616453; x=1796221253;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w6I+ryhKUHBU8/ypdPULznpg2ekJDRBrE8QNL0EUam4=;
        b=FAnOe52CsadI6bUTWHdn7J6YR2qThIHhwWNWyRN6dtmfKZJpvXf2j16yqN94HKhnAA
         8Jow23mMf9pL4dAFt3VHQETIZvt319+HrenzkC6NDipousTcGsVKN/uyFhQuGuuCsEKP
         gPKlC+0ic/Z0ngV8BMCAsorbi9A3IJjSmg1C+jL/N/w/zsYLZdGq/xT/KZkRUaNG+Lad
         4KDISfc/+ip0ILoHbowrnUriJvvxvbsSFG+R7p6sYkaFCYW2kvPY6wuT1uwMVsFDnp1L
         Ub/rTl0t0KsRwjJyINvUZ4tpCACGLXYbr29Wb4l1oT/+mnr7heEPp1i+3rNRQMbfICcw
         j92g==
X-Gm-Message-State: APuU4Z8WtslV9nhiZEk1G8iMCDuBZv+Gd62fC1q7lgURpycMR1NIgqW2
	RUbvds7Xn+NBhMRDta7ax7oETWXxOd1i190afG8KTlxQfaW5+QGFf6s3P7qKDN4MmOY=
X-Gm-Gg: AZFdTZewo8VSHvaYbUiFr16QUch/4W71zOuAGsFvJy1Q9WmlWWLobtm1X8lbFsJOgfd
	QVBTSZNyidGj2sGSJmQ/B6Q4zJIRUxIa3t3pW3BWgswQuh72GJ374kGFdj7ZGCTA1qNYBzwLd8A
	TufqM8rjZVYirsbcU+ZZr1gNu+MaGN6olP3pOpmu6wGbLbbBHVOoUjX2LYoltFNQvHGkRseO5Pb
	N022jIwfDwJpxQvyLPNMYwCot87obq3XQE7ID7boiBkrVNokDmU7pvcxkiopfGxuvtz2LUMnJTI
	8Yj5HktICBsZnqFXf/yhEl+uLVCZvbZBvqVKuWIut6iU8++ah6J9rhTjDog81obD0v5cdTXmQMC
	RstSwdjVDOCw18Tjnq5nijhhQbDIQ+TyWFlQSO7hVa3ORGyjxYfTHQLfUTpstFRTtHG2mC8ZFlN
	mcY86aF2/v2Uu5OyMN6O2XH0mAZuxz1KpvUm10Jr+Rpb/0qVqtO7tddgthDtWApKRrsm6J3TWyF
	VStpqr6335PaRKPGsFZKq7OqRYpbxwcb/hrOEuNPSSSbRlMVzaP8ED5smC4ftfoNiGO5EH5r6Gx
	giyzl4lMJVIQVfDlkr4++4kjFe4tdul/pdM8I0tVx8B2chvcIFYTRHsWO3ScHGoUMzvpjHfu0T1
	0J73EpXg=
X-Received: by 2002:a05:651c:a110:20b0:3ac:e540:987a with SMTP id 38308e7fff4ca-3ae7f7ccbccmr42593531fa.0.1795616453477;
        Wed, 25 Nov 2026 06:20:53 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae80537021sm43974421fa.28.2026.11.25.06.20.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 06:20:53 -0800 (PST)
Message-ID: <8510bd96-fbb1-4d40-ab90-6e337ed501a8@linaro.org>
Date: Wed, 25 Nov 2026 16:20:52 +0200
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
Subject: Re: [PATCH v4 3/3] media: qcom: camss: Add Glymur compatible
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, Suresh Vankadara <svankada@qti.qualcomm.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260925-glymur_camss-v4-0-d7c2983d6d7b@oss.qualcomm.com>
 <20260925-glymur_camss-v4-3-d7c2983d6d7b@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260925-glymur_camss-v4-3-d7c2983d6d7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/25/26 08:48, Nihal Kumar Gupta wrote:
> Glymur's camera subsystem hardware is a functional subset of X1E80100.
> TPG, CSID, VFE, CSID wrapper and ICC resources are shared; Glymur has
> three CSIPHY instances versus X1E80100's four.
> 
> qcom,x1e80100-camss is not used as a fallback compatible since it is
> already claimed by its own binding schema, causing a duplicate
> compatible warning in the DT schema checker.
> 
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 23f3cc30a15a5e098162bea98ba69fa636abdefb..9954a99981004590d34c722337bb6510fe759699 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -5751,6 +5751,7 @@ static const struct of_device_id camss_dt_match[] = {
>   	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
>   	{ .compatible = "qcom,sm8650-camss", .data = &sm8650_resources },
>   	{ .compatible = "qcom,x1e80100-camss", .data = &x1e80100_resources },
> +	{ .compatible = "qcom,glymur-camss", .data = &x1e80100_resources },
>   	{ }
>   };
>   
> 

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
