Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EAFD4FB9B1
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 14:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792073228; cv=none; b=P9dcQDT+gkBQMj8MWjDqbcj8uEpIfRkf2065xXV7TOwW9WOVn+U/Yz/zXMxpyjgFaTTMOhy1hgYK3mKNp8eqpcPdOlhgpZ3hZ0rpnFCZ5DtqhxyK6tMPx4wfI2Z8a+k3yKmreaQpvj5oPVEm8ikCPUFCif266IbfUT59AfdQQpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792073228; c=relaxed/simple;
	bh=G0H4oMfrqAtcIYgnag5JUtjm5ndYR/YiS93lKI2Ksy8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ESgeh6vTcyQNiQo/TKAqF9oNbV9GjBWfiXk7/kNQNWf+kFYWFJiG8j+SCKn1eurSWrHgIaRslRZqbbLCDbxoz2L116AOnuWxZKB3UkCtWa1Gw5F/NMIynWnF9kY9Zq+Pb3VGxNHxQqNpFyAaqSwEV+nsejROaFgq1mUNUHnmbs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VUbFA0QN; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VUbFA0QN"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c31745ad205so594566b.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 07:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792073223; x=1792678023; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=x66qBww20CHtwfM8AwYvYnWu/nKW/hm6sMO9/8Mj+38=;
        b=VUbFA0QN4Bk3OSQ/P3h3VbgSi3T/8wD7WIxP12A4UJ7JZ34Kzc7xq2OQmdOb1UYbmE
         VPe9OIzvC7rMo/BGY7jvCod3rKMItPRNgflzOl/81YKM2HBCl0QYYbvagdrUa0pzhokG
         KUn+01Sd3CfMlyA/vCg53jqbnssP11eEHYAJ8I7UCP7KeML7yPw9RLJv/TcNHfs/FwLM
         xqEPhZQIcZ0vBLHDLBhWEEFzH2MNhMV6thIHIt4EhPMwKrRRZ+SMAZzyhP4MKqVX/3YF
         kxMQAjXlxGCz+5/1Vmelce0Rz8hc0CzSEnW+1ct216Dc5CK9n4DwHxHV2udp6DSysqek
         HMRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792073223; x=1792678023;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x66qBww20CHtwfM8AwYvYnWu/nKW/hm6sMO9/8Mj+38=;
        b=FQ/16knd0K4tgMkt8gpJA+qPh53282uXVUocNT6ERhRAPhgy0k7S2NbkoRjvNl/pRe
         b60oknmQLHdOPiQXesqnB7lFUzMpDYEVRT2H3kOmR4coLx/VuZ0eaPDdAytInl1ckTMl
         Yx/h6UR1ySGTC+Zq0r0UKM0TbX76Lhdnw1E8SfO3/DynHUK4K/snOD8VKxG8DRPKity5
         0mM7OP9PU3BdMk9B64HM1rbhUkTs59RZB07o3mGyRLkghpvJVIKpmk81Yh1GjAyVh+n3
         qeqm9H39w1AwkVo9Af2RV/z24otU4wBrD0I2v0QsbuichdrqeCyMP7sz1PpEPpOmY2p5
         Fz2Q==
X-Forwarded-Encrypted: i=1; AKwUvBx1QAmC1zddT26FkjQDtfHbSNk/pGobRzOW1iNf9wGQ0SoaKFIPqIzofSEcMJEkzJecjGQtemSy/lGpV7JC@vger.kernel.org
X-Gm-Message-State: AFq9FYIKEJSRGeRFgqvwCjgVb82vhh75vvR8VQdvbMLwCn0g1yeBKbtn
	T04r+tKZWcTHah9+lJcJso1JjR/E6RCmSv3WD9QfqC2FijJBWPlfYI+RhS54/lczIQ8=
X-Gm-Gg: AYBFou2RRDrEgjszc44rptNBkz1ULXqaDIWLydko0wQGmpWtN0eTxCErivJ+tgI6VqR
	e/mPCICgVEjjqrgihqGCukNtaEn2mA9gcMdm/giVcI/JBcA2I83R6TT8wI4vBmv3gSsnFvtPlae
	LqrH2kvVyWE8SxapEe4xiLrzuBYhMlZBYke1zd2hkgR/PwBgh4KJ3Er0w2epQDEab7jMYHIf04l
	E0gQ9Zxb/JUij1eNP97lliksb1+Xtq9WoPutHAZ9EZ2s/tuPzv9SVpFpCB03R75GM36WT8ZQeEj
	5zqzPn/9f9nznXj/YV4R9TosIqG/69TOu++RnBOfTXg4q5MeCOM9mk80HjcBupmSrZXSV6De4EV
	/od6c5YyY4N9rzoMJlpS0m/OZkTU4xr/jgt4gF2tSy6E2LZ5M19vPgMrkpZdScXx+/zGfAvUlLg
	+3pxOwPKlmtPjTblT3CCEFRy8mlW/bYQmWvC3YZe4MfP1s3H37aZFv0qkIs/2txZM3d7QHABylZ
	zXCzfnXBQ==
X-Received: by 2002:a17:907:9495:b0:c25:f7db:4be9 with SMTP id a640c23a62f3a-c40201117d7mr13564866b.15.1792073223392;
        Thu, 15 Oct 2026 07:07:03 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.7.163])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed6bea942sm129303566b.11.2026.10.15.07.07.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 07:07:02 -0700 (PDT)
Message-ID: <1e1c3706-adff-4049-a14d-28bbeb3a6a01@linaro.org>
Date: Thu, 15 Oct 2026 15:07:02 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] media: qcom: camss: Add support for X1P42100 CAMSS
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261009-purwa_camss-v5-0-58c13dc7c4d2@oss.qualcomm.com>
 <20261009-purwa_camss-v5-3-58c13dc7c4d2@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261009-purwa_camss-v5-3-58c13dc7c4d2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/10/2026 09:11, Wenmeng Liu wrote:
> Add CAMSS support for the Qualcomm X1P42100 (Purwa) SoC.
> 
> The X1P42100 CAMSS is a cut-down variant of the X1E80100 (Hamoa)
> CAMSS. Compared to X1E80100 it has:
> - 2 x CSIPHY (CSIPHY0 and CSIPHY4) instead of 4
> - 1 x IFE instead of 2
> - only the ahb and hf_mnoc interconnect paths
> 
> The CSID, CSID Lite, IFE Lite and TPG blocks are the same as on
> X1E80100, so reuse the existing CSID/VFE 680 ops and the X1E80100
> TPG and CSID wrapper resources.
> 
> The CSIPHYs are handled through the PHY API, so no CSIPHY
> resources other than the lane format are needed.
> 
> Signed-off-by: Wenmeng Liu<wenmeng.liu@oss.qualcomm.com>
> ---

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
