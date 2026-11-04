Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793809524;
	b=DjUkfKnkIGgE5G+UUkT7Tme8bgDpeqSpgg/d65d25kvouUerTvs9sLW2vZwTz9lSlF9x
	 BlnNFHYtecTCcx4Rg0+kkvCXlj284XnvJQUwlKiAC5hPQ8Sz4bvnu5jXcHM+LweCKTl45
	 B7HYQVTXHz961kBdoSPPvFW6WpSYmC7CjmmtfXa7g476SAT4k1cQB13jNA+u2yMGNESo6
	 tZzZlCkozlTJNC0WVTL61+jHJ2tykk6/2+OGOtZhnFhFlbOP9zwFS2RRpupN6XyRSkPUS
	 KmL8Ev3O2ImwjNmavWHyevTuzZnDncGtjwCK+/6oDQWqRV2cAAXK3Avwjn53ybq+wxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793809524;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=x484ZhrTGAE9p1E5ENgypW6izGXfAInwMb522CXH0/M=;
	b=4fwD6OxGGr8BD0tLCild0BiyZrJRQgzZf32SdEMGhTbqbwvsYp3qFka9rG8S9ApfFEHF
	 Y4jq5T2pjSc2SchfQWIdiBvWpXfD2U6RXjQdN4MHZ6AeFQksIPfesvRHwiNiIW4M/Hu8S
	 4EOlfk+/LSFoUtZDDfCGfZnHa3ykB4rQ345KAhxoVGNl7qGF6ufJuAi49J8BM1MJFRf76
	 p42h6ymxCVnzOxlmgMy2UuI5WbaiDXvLq4xS5qcjj4+AgebooNcIO6P2r2Vp2FezG/jHZ
	 j7mxZHO+WqlkHx3jAZBzZjKKWUuBVGNhW7ddTXE7GzBJofYJG+V3J6RwyYF8iB/HzOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Cnisikzh;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC63606A32C
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 16:25:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DC63606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Cnisikzh
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so867178f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 08:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793809521; x=1794414321; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=x484ZhrTGAE9p1E5ENgypW6izGXfAInwMb522CXH0/M=;
        b=CnisikzhUtdcZehzae5PTqWUH4SNGsg3CZIUq/Yg7q11AUdGbPmoiMfk7sjq8o8ylz
         ssHaxohl1993Hoc7DDJeaZJezYFjI0hnM69yt6WJltYauCuQpfE17YTGl36XcTGIrrAP
         kvbFhRkb3A9kfJaQUljAn8Ioha6HlS3DEE7nULd6mYvXsZrUaiYk1HE9802EAGsS7YOf
         JxFoSs17scZ+GvYbC76yaX035A+qcw42oXH+3pF8eqf1mOJAfVQfuBbdX0gwG/RlzQbD
         uYrjzR2q5eP0KIdLguF8TUFXnWtd1+aVngqZ4kSgkcVYXCw+3bJH6s4byVJfWU3ZhFo4
         UHzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793809521; x=1794414321;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x484ZhrTGAE9p1E5ENgypW6izGXfAInwMb522CXH0/M=;
        b=Rkzcm4BshYRDf/tmWh+1EOS9mvKEKrMR4bo59fXbdtdeINsPKECTMot+7O2qAB69qR
         7U97LoniTTPfn2KjbmPGqsRsGLsef3yz+GNdM7an9XE9tg7e+vbrd2uvSCnBkRS1JhNb
         ExYzSQNrOJGsezSRL/DBu88Ueqytn/L9EPReh8HcpnN5eJ5Qgp0t3JOCWcrR9JCZtTod
         K0KkhZ2iNAJ5pyEQWpcmHIIYzHaY6MMyP6Sg80qdoYAERg0VuXxLE8vBiaugHuZR/ITF
         2qVK+sweHMQh3/vU8aYINL6bmUINxe9hqeFsS+TMVQ6IJpJGBuExosVc+Uz66aNp8nqv
         kvew==
X-Forwarded-Encrypted: i=1; AKwUvBw5EuuNsOSEwBhsDJrxDMthxSyMy682IFZrR5AO0jsKUgO8OoLuvg2Q4K/FbO0piT5FpBOB8oq1GuhOM2/G@vger.kernel.org
X-Gm-Message-State: APuU4Z9ELFGjTpTkCtr9ireix4ziqNRhJ2QTlhJhOKjvziyFOLP732j3
	WVzXfbQtaBRVHhBPylJVq82SPaLj954yvy3UCMW+lgQQx4stWof/uA8ZelYp/FrJfFo=
X-Gm-Gg: AYBFou3sR5UneuojD3NDriWzJD6FUrfBJFcf00HtRtBhFOcvtwEqWxBQZd5HVMunmGe
	5ErjpZXvLLPXJnkHGpf6c7dVqr5vGi0z2NPTQ1UZt+fQ1X+Q2HFJPBcjD48KVCo1SZhXivp0fDP
	mV9+Ig1dJSqlc5nvP4dE+iNtDzqhMVkXEL2NcSHk9zj/HVzQidfI/Vlqd1blSQYxhBMVru86aia
	JzErcxFZ3fwlENAOWgI2to1DdPnqHSfUwEfVFyz1Jii92l00yD3/iCAkSZlkNXT5xKwtsQj638x
	3fsQMsHBxMRSfIYYKXEbGdXY9jhF3pZ68EEWhsGF6Ux1p2YvF9W7OxflDmpKv8JSyy9+dHKinvA
	/Z8p/ATYZVI/p7CTQ8jxBpC3BCRCu/NHCIJnnDbS39yIvrsw+FfuxR62pSFeInMmjy5Q9g1OA/X
	qhdM8MZeA6oojWVUBVqTL33GGICxv7kQ59Dy3fWLW3yGFmlwiUPcyjnndenL0DE0Ckgdwe8q89x
	4a7UhXFaR4DfN1fI9rGtDizXmrB8xlMmRHnk+Vg9r+jzZ4ykZIL+M1DNYHB4AlyeOk8zttVaRjF
	mZmVdToXNRunY9cDn157zwdfnzvy6+JwLh/NddZUhQ==
X-Received: by 2002:a5d:588c:0:b0:48e:3d2:44b1 with SMTP id ffacd0b85a97d-48e6e510f87mr35082049f8f.52.1793809521503;
        Wed, 04 Nov 2026 08:25:21 -0800 (PST)
Received: from [192.168.0.167] ([109.76.163.117])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fea181079sm5151097f8f.8.2026.11.04.08.25.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 08:25:20 -0800 (PST)
Message-ID: <d24e1238-c366-4963-8cbf-d40487e4b3c8@linaro.org>
Date: Wed, 4 Nov 2026 16:25:20 +0000
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
Subject: Re: [PATCH] media: qcom: camss: Change CSIPHY device name from "csiX"
 to "csiphyX"
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Frank Li <Frank.Li@oss.nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20261104130014.681769-1-vladimir.zapolskiy@linaro.org>
 <4e7f2f2d-7c2c-4dc0-8488-6ba71f4b886b@linaro.org>
 <48f56fbe-9db3-46b7-96ed-a6e3b535c0a9@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <48f56fbe-9db3-46b7-96ed-a6e3b535c0a9@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 04/11/2026 14:00, Vladimir Zapolskiy wrote:
> On 11/4/26 15:46, Bryan O'Donoghue wrote:
>> On 04/11/2026 13:00, Vladimir Zapolskiy wrote:
>>> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/ 
>>> drivers/media/platform/qcom/camss/camss-csiphy.c
>>> index f99eea2ef228..dcc005674d8a 100644
>>> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
>>> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
>>> @@ -839,7 +839,7 @@ int msm_csiphy_subdev_init(struct camss *camss, 
>>> u8 port)
>>>        csiphy->id = res->csiphy.id;
>>>        csiphy->res = &res->csiphy;
>>> -    snprintf(csiphy->name, ARRAY_SIZE(csiphy->name), "csi%d", 
>>> csiphy->id);
>>> +    snprintf(csiphy->name, ARRAY_SIZE(csiphy->name), "csiphy%d", 
>>> csiphy->id);
>>>        return 0;
>>> -- 2.53.0
>>
>> I'm 99% sure this is a change that was made @ Frank Li's behest i.e.
>> that csi0 is how most other systems do it (true afair) instead of 
>> csiphy0.
>>
> 
> Let's review the discussion, please provide the link to it for further 
> analysis.
> 
> v12 has "csiphy%d":
> * https://lore.kernel.org/all/20260708-b4-linux-next-25-03-13-dtsi- 
> x1e80100-camss-v12-0-f8588da41f16@linaro.org/
> 
> Can't find a request to change the name from Frank's comment to the change:
> * https://lore.kernel.org/all/ak_HfEIpXj6Aky9c@lizhi-Precision-Tower-5810/
> 
> v13 changed the name to "csi%d":
> * https://lore.kernel.org/linux-arm-msm/20260728-b4-linux-next-25-03-13- 
> dtsi-x1e80100-camss-v13-3-ae811e2f0799@linaro.org/
> 
> The reason for the change or even the change itself is not in the v13 
> changelog.
> 

Since that change never got though, actually I agree csiphy is more 
consistent with the current naming convention.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
