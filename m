Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795706374;
	b=ExLrLxqb+o24kCFZvPecbCURqpNETDtyLrHfqLwi9cKskQVle6QtSNROkiqwDUaUO+Z9
	 VmLlXD5cEJjmGRv4hD2Nl6nGfkgimiTJ3LmOua93leg/bMMTNJjA27pl3G61mGRm2WSU3
	 8lwUDvHesHwoFMCbAbzNbut9CZOrCFwC8qfjS8Mn9zfCk4hzDNbXLMi1sqWb/jUl11S2d
	 n8w8BwC3xxGBxsqYporq0hBdpvweEaOdIuqHw03QAxO1Et+eBJofutnz0+y0nWNSGTK8J
	 xT7OIlk7uYcdEwGNAW6fy8Odosb8yD5ZijC4fX6wRtR/87csEZA46yjv3JktKkbPGrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795706374;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=kbwgfhGpD/SnhZAxCCyXFJ8JiP4cUz8bLW1LvUKOW/4=;
	b=ATfOxwYlzJpV2+b1Z/GI5oHkW5xr00pp/o6xG3DDaPK9+3n74PKdAVoKWgombsWi2S+W
	 D8O7w4/f8TRtRgRk5BmBvkpDrASop7ZtVLC8zRJ+V4BRo7WIZDBRpHXTOznO2WdMgViHb
	 l2fqonPUw3+RpYSI/nyBdy2DvNbLyfNKwco9xElh6yDV+iGoE4EwLWOPyV9E6Xh4r6Kni
	 K1JcKEFYDgQQVF6QGcJkh15TsvEmkjkes9C7Olse46J8w9xwZCGQFWXp6GTmzyu+VumNO
	 AuZTU4yaJcKtVXnxRNiSmfBiU9i26C+0vEMB3JqaI1RbOKG3kEN6DPZw3m23uMeg/Bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CrbbYeYW;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F778606A326
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 15:19:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F778606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CrbbYeYW
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2f0213202fdso37756455ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 07:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795706374; x=1796311174; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kbwgfhGpD/SnhZAxCCyXFJ8JiP4cUz8bLW1LvUKOW/4=;
        b=CrbbYeYW7YZVgHercljukVu0b6JUMTJydB1LSJYAif4Z0fixzzCK03EWR/r37zd3Mr
         D0LO+Zga2qR1DP/qDPD4yyFYP0lzvabXVzmET6fDXDCC/If+2BgSHj5nIlaLFMjDy0iJ
         Mt32b2xqkgR9CnaHnBWEy4WnzxApp3Hy5lw0ry5Eg9UYILoAXBJIgOiy1Ts5ZJ1GzEKL
         T2RLvAvLFCJ2Q6q04CLlsDeLU0wfyhGEiG7yGcOqpDeQhGy2/AKLje+obkISeSfmV0WS
         +j7R+lIvzq3u/TijnwL/K8zWogjL4jmO9BZuzlCyHlWjsc/IEh5RjqW4XtZgZLytyLp1
         H5xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795706374; x=1796311174;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kbwgfhGpD/SnhZAxCCyXFJ8JiP4cUz8bLW1LvUKOW/4=;
        b=xZwegPeBFXWjgVgdd6Dzv17eeCCk28JrvTTeIXJLjWsqmuZKpcSd7l9K8sEeT5GBCu
         Trp0IJ7fNEkJY7Rk2/tR0EJsiA4oVvJiOFSp0yIalzuUASKjKZJiQve9f9lL4JbJB5dv
         jnjadRRMZ6sPw1FZfo4kfO/tqe7cuaofbhE21+8D6Af4yp+5NXqHaAGs17idcfrfGyk+
         3eiB2xl3YIH0uXRLTYk+2tuKjeJaVTbtF54ocsLWxF37NoaLCi9ex5yWjzK9vU+cN1aw
         r/Mmmr53U3lLqS2Cat2v2qe5OmHtofPdYhLe1rTSS4xb2W6sGRf2a30y1vVvkMOd+W1G
         LXsA==
X-Forwarded-Encrypted: i=1; AL+hErHmx4VAcZ2nJVbJsaX20jpxjUU1bdVvkLPnBjcpb+/BTqJ27PK08W1DLZEaOVkVv3I116PYrLanDF24kpSy@vger.kernel.org
X-Gm-Message-State: APuU4Z9hoyXwtdR3y09aZdfLMroyceUXt4Ox+uUFgaZg33otbMmrSuCe
	ujmme1l3rE1ZXgrB3IGJthHtGpMdEsNGX0BHRmEzJ8/6/wtEuWck1/iY
X-Gm-Gg: AZFdTZfc6f4W1KpLDFqTRp4VcSk2s/LCp5IWgUSbT0pyrUO74hMANBIYWFm5LEiPKPl
	89OSoNK0NuDxgXbbkO3kZbyyADWJ0XyxuW/OgYso2ySHgcEYFGUTYnhaHFPM3SKzlcgjvujs/H1
	1nrxJIQvP7Kr1Vqn2nqrJRw3Hp2Q9DFg2U6eQhVQ3Tx5b9InAGg76MjRv5wzuZL/ofGftGxFMm9
	5OEMlnKp7ggLWwLS8MMIumZSfCtKlfcOFhnKnJl4W0P5pf0PZXFJqhfGVfaOV14kNIPnYnJC7L/
	1oDjfh+BYwuFbvtfqm58gQdd3Xl1zniaRu9QzO0C6nqE8u05GHtqtfb9IBndL0UyLd/Co9PyCj8
	/Ead1imvjSzWNelbZlDkgqEshjofkwudaNAOiF6HtbjDPyGW6llzhkWmCD6urJ5axHogoAdKehr
	jsRnRsacgaDO50f2AC1RvcwGQMdgbb2vMKBgUjRVBHPF+Zn+M4dYPanlrCxHGVCbjs5gsdziJk2
	xNR/NRUozKEFOcj+we9fpI/2dNI7q9ajiwFLJi/UDsTTD7uwe3sLAca8d6rJfKiIPKp3s/1Qs9h
	4xrBD6QtirpmnI1lL1CrbRRNmBuAX7IsA/kxZtYBaUIfFctO9Ze4hfKwkS9CgdsL57M7HJ5bHuY
	Rwd6E8QZHdFhph4Pchj7zWzYpiGgOS43TtsvSOGTFCKIQG0WA+mW/geYvrq9Lgdj5lyr5slvufi
	kQEz75PL5b9FV3iSy4C7n2dxs=
X-Received: by 2002:a17:903:b0e:b0:2df:35f1:8771 with SMTP id d9443c01a7336-2f03f1e0d4amr214437245ad.54.1795706373704;
        Thu, 26 Nov 2026 07:19:33 -0800 (PST)
Received: from ?IPV6:2402:a00:163:2ce9:4e7:3fe7:3a21:f3c0? ([2402:a00:163:2ce9:4e7:3fe7:3a21:f3c0])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d026d6fsm11015263a12.19.2026.11.26.07.19.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 07:19:33 -0800 (PST)
Message-ID: <2fbeab27-f57c-40f6-8f7d-671cd8a2604a@gmail.com>
Date: Thu, 26 Nov 2026 20:49:26 +0530
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
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: qcom,sc7280-lpass-lpi: add
 ext_mclk1_c
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Srinivas Kandagatla <srini@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261115174237.48908-1-surajsonawane0215@gmail.com>
 <20261115174237.48908-2-surajsonawane0215@gmail.com>
 <20261116-nondescript-buffalo-of-whirlwind-6a5008@quoll>
 <9997e6c6-2e5e-4314-88b2-a8547ab035f2@gmail.com>
 <3682be02-3e2a-4e01-8066-15b51215854a@kernel.org>
Content-Language: en-US
From: Suraj Sonawane <surajsonawane0215@gmail.com>
In-Reply-To: <3682be02-3e2a-4e01-8066-15b51215854a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 23/11/26 22:09, Krzysztof Kozlowski wrote:
> On 22/11/2026 18:22, Suraj Sonawane wrote:
>>
>>
>> On 16/11/26 18:10, Krzysztof Kozlowski wrote:
>>> On Sun, Nov 15, 2026 at 11:12:36PM +0530, Suraj Sonawane wrote:
>>>> LPASS LPI gpio5 can mux EXT_MCLK1_C. The SC7280 driver names that
>>>> function ext_mclk1_c, matching SC8280XP, but the binding enum does
>>>
>>> I do not see it in the driver, so are you sure you used correct reason
>>> for the patch? Mentioning driver means you document existing ABI being
>>> used.
>> You are correct, thank you. In mainline, gpio5 in
>> drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c is currently:
>>
>>     LPI_PINGROUP(5, 12, swr_rx_data, _, _, _),
>>
>> so ext_mclk1_c is not implemented for SC7280 yet. I described it
>> wrongly as existing ABI.
> 
> Did you just paste LLM output?
> 
> Best regards,
> Krzysztof

Hi, the wording is mine, but I refined it with an LLM to make it more clear.

Thanks,
Suraj

