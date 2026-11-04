Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793800837;
	b=q8POK24fTEwv3RCedwraiu8tCwH3sgPQyh6smHKmhxfifwL4ehAruDNduUkR257zVttB
	 Fd7zxEoLToO7CjsQ6UR97UOLvWgM/DuDtEI/ilpUVOggeyM8d75yK0QEgVOI8ZodvDoJT
	 D2WLDct6do9H4FMQbXN/KWvTUxuaV9lyF+RR8EXAPLmDX4dEVWodQ7ftx4TEIwoBquoxZ
	 prQJDPlYjb5BYDnWw31AXToQ9vP/1olpZT0RKFz3qYt6M5gg0Q1iSjRPH9UbLu0poCnW3
	 PH9RZfekS3FA+4GdDd8obk+WW4dipGdk6Kj/6svxOZosVQkvBV7cKE++R+NQC/f7QGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793800837;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=yLSW/CJ9qOILUYlmIBoazTCqPoZKnrkzdeQbNG8MlDc=;
	b=W/LnCywLOv+a6Hu8FOhFpMElUcugNIov8FZzLJWBobDj0yrXaFoZuQaYGRUbV6+8BSEl
	 8lyqfx2LhTSniVSOPK88/8diOKVi8tpdw0aRMZLXdeClxrAEuSfmospCUw5nfWboihYTq
	 XfFOSon19iYqU1pk9Hp9XQ+eSAwZUjuc9nIAAoqBi18SjF2Chc3dg09lWXmRtsWRlckl/
	 I+DD3FNnuBNewWWo505CpxsETMsGFl94LIbiWKoiIWFEz6XpzSrvNyUmYRjcU8n9sq7Yf
	 x0qOKKK6Y+Ek5bF6F3K420+8wX+9E2gTQAG6swJcliVaQb4HKdg4x1AD6gHZqX8Kqlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=nhmHfB9B;
	arc=none smtp.remote-ip=209.85.208.171
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3279B606A32C
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 14:00:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3279B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=nhmHfB9B
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3ab3cb83f54so1357841fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 06:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793800834; x=1794405634; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yLSW/CJ9qOILUYlmIBoazTCqPoZKnrkzdeQbNG8MlDc=;
        b=nhmHfB9BA7eipvNVWaA2Gte+/EuT7A9kKbfv57jnv9GerCXmy2xu/MiC3444R8X/zL
         CWlcE5Y/QVXtSZlg5l/Qkov43ieQyjwX7fZLfJOppIyIcH7rMTg9fTXrNFUYQ2jZCgd0
         CaOs4V31RbJAEB45XReNIgWcEuqqO3nOF14L/+wmihvANf1K5c4b2HyUU19Vq40riAtw
         r8QW0tK/PhteMxYNJiZ8B34VzNedlLYAoqCSJ/ES9FIzNBs/a78POzFCXD2rRDYZwRy9
         JLRaIl8bY9XxzhRieqfVYt1PN7AkG80gBzTracYK7Seu3BT147aL1kky2JHChH7CwXf+
         RKFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793800834; x=1794405634;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yLSW/CJ9qOILUYlmIBoazTCqPoZKnrkzdeQbNG8MlDc=;
        b=eYMKjPQqs2bkMUn1pANn61HhqfcXV0omrnuzv3GZOIe2oFqsj+c6VPqjIGECbP/V5w
         D4crLVz23F1Lk14OAZWrZMzO6pUI9REjgdzMjXzBzkuM1YabQpXyVoPzA7CEGVQlHeIX
         SYCXs36WqveNJMn9PEzHcQTkqsnGv12DEjGg2WUCGdiRBcWcTAqeuEbxqbuhYptKBQdw
         NmwKpmkeX6hCXf6DYqJWtc4/JsGd8gQxYNn42oe/N256x9HDfgHNg7iEIfkzgiSuQxtT
         H4RBj5+qbDYyhf9bCey+GTT0VHmiKiJxLjAbUdRJeaIxfA9+/u0vx2rZrDQnaM0ww3Yt
         EtIA==
X-Forwarded-Encrypted: i=1; AKwUvBwfqT2YG803jzkCbCTV1EpojJwPuzcS5wFJ6G8eACW639vL2TsGWmJcCmnMRwiPgZTfdpewxAIwxvRsq6pQ@vger.kernel.org
X-Gm-Message-State: APuU4Z8NoUOMYabw7/+pCpYcmmrieoVn/WTpzLJDtIu81Haye3AhhltH
	Bmarjy6dlJcCqVemh/YMt75l2MEFnynjCQq/IHQMsdpy3EnC3Xa6O5QGyc7auQ2acvY=
X-Gm-Gg: AYBFou1owgstCqxA9eAecwQK2VRdTUsYtYOOr80WnNgZhqgrYUUqAtOztao1KZ+rkJi
	xr3RnmDKfZku6W77pHTwsaekNpDPjWzESnJUhjnrzxerlk8MvAOoddN6QYkqzqd9xpjnfVdmksb
	1EhrsQWAHEg/Q2+Th2uVZ3t1POMYJgvCmBI6aI8w/RzXcpHlKNSttIXYefsDg28dXb9fRHNZ5VL
	qUD2e7tdnrl5Dkd1vfnqVS6DB3BzyRU5zBdLwuVrma4g2OBxqwsTIa5FzhhYR3n7pCXODrNpd9s
	R9m4zI01GyKJ3lzJwebPPMBrKSCDlWBI8F/Zv8pSpN6PfrRNNK2gXuMg6HiDQZ0vxoUFXnkwR5T
	pheurpRmsx437LsVjjft4dAfapVOa9ZRQvk9Dm+zukVMIGPtYjPHach1zMbBaoFCHqNJKF+3kP0
	ENalnUHyp1+H95vtSen201urOkyPdK05t0dsYYG0dVfCeS1RvXAzXXb0yvrTr/2xJBK69htg/9T
	oIHp7GMBMm2U7so966qNTns0moPD1hPfWenfXtNJeafChYIr958zFYm3A1EmpXtw05NpXg55J1P
	kpqHC5kPm0xZIJnqWpXwihlJNCJ+uTZJ3ul+lcJCxJAiuDRHt5M36QPAznnBdlLIWnqawabWp2q
	8/EfxsA==
X-Received: by 2002:a2e:9592:0:b0:3a7:7ce9:7530 with SMTP id 38308e7fff4ca-3acb7a59280mr29824581fa.2.1793800834086;
        Wed, 04 Nov 2026 06:00:34 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acdc6bec70sm4550261fa.13.2026.11.04.06.00.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 06:00:33 -0800 (PST)
Message-ID: <48f56fbe-9db3-46b7-96ed-a6e3b535c0a9@linaro.org>
Date: Wed, 4 Nov 2026 16:00:32 +0200
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
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Frank Li <Frank.Li@oss.nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20261104130014.681769-1-vladimir.zapolskiy@linaro.org>
 <4e7f2f2d-7c2c-4dc0-8488-6ba71f4b886b@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <4e7f2f2d-7c2c-4dc0-8488-6ba71f4b886b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/4/26 15:46, Bryan O'Donoghue wrote:
> On 04/11/2026 13:00, Vladimir Zapolskiy wrote:
>> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
>> index f99eea2ef228..dcc005674d8a 100644
>> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
>> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
>> @@ -839,7 +839,7 @@ int msm_csiphy_subdev_init(struct camss *camss, u8 port)
>>    	csiphy->id = res->csiphy.id;
>>    	csiphy->res = &res->csiphy;
>>    
>> -	snprintf(csiphy->name, ARRAY_SIZE(csiphy->name), "csi%d", csiphy->id);
>> +	snprintf(csiphy->name, ARRAY_SIZE(csiphy->name), "csiphy%d", csiphy->id);
>>    
>>    	return 0;
>>    
>> -- 2.53.0
> 
> I'm 99% sure this is a change that was made @ Frank Li's behest i.e.
> that csi0 is how most other systems do it (true afair) instead of csiphy0.
> 

Let's review the discussion, please provide the link to it for further analysis.

v12 has "csiphy%d":
* https://lore.kernel.org/all/20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-0-f8588da41f16@linaro.org/

Can't find a request to change the name from Frank's comment to the change:
* https://lore.kernel.org/all/ak_HfEIpXj6Aky9c@lizhi-Precision-Tower-5810/

v13 changed the name to "csi%d":
* https://lore.kernel.org/linux-arm-msm/20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-3-ae811e2f0799@linaro.org/

The reason for the change or even the change itself is not in the v13 changelog.

-- 
Best wishes,
Vladimir
