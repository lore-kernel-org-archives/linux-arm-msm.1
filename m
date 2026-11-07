Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794060222;
	b=xMg963z7svYnzbxXkbMn1oS5f16bpjuSaH+iX/Rq5O+id1WquRWeb/5CF1FfHuGAAnPR
	 9JC4LCOa4waIVo7BF6CcJT2b3YSDyPKehijKg8q5l/DLfdKPhukA3f78bO8gMKyYDUsz2
	 zLZdklN0IyFCKfB+lCquf6TZ92eI9ym4nKukzhwtf2Bnjy8gctxJNdhKZvIUb+8isk1ne
	 IHLWUDqvZIJxAGXTj+ejiodujaRS3OXMfNXePZ/VARrRnj4LQRVx/R21ZRbDcAXWkZY5s
	 4YBNy+zKkvRfgUeHCYroxvQATvAXauxmMKtsaaeknnJyDOy/cJnuE9B+xBxPIAThwNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794060222;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=n4RQKom85jkQdizG8jERqXd4viPHC+189UpuJ/BwOhc=;
	b=DJ5HSsDNhDlL1rhZRwfKj85Xyl9abbHKdSf3WGVMmzxK4gSo59hNB1uryVPXt28qNFr/
	 B/2aynArsBm7wkE8LU5p/IeKnpipsTQMFWleRxNx3H1XKm7ze8vJyRc8A02zpmy9pf77M
	 svMOJ6JuGdVxdD+nhpAmTdQyjCSjk/vQZI/10aWUw8te4FmAdRRsl+9CAANIU3uUD1b8p
	 vKWaq8e9eoKeyIDrXT6BZC76odqRep7MmbUPZMAsDqRYTfORC49F5qkAAhogDrSlgq138
	 eOb2fZCDJgt4RT4F5pliWVHZqACHtIxumqrp3Tfs84XAxQF/hvQqYlbOuf0Mlu9rlsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=aP3Lr9ih;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4691606A32C
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Nov 2026 14:03:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4691606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=aP3Lr9ih
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so11132535e9.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Nov 2026 06:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794060220; x=1794665020; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=n4RQKom85jkQdizG8jERqXd4viPHC+189UpuJ/BwOhc=;
        b=aP3Lr9ihnVE3AAdM9kPgIOvbXrlJiwClq0X74LQv3Wyb/Z9cppqMs2SyBmMxald4yu
         C7kE8oF6MlLS8Rjc84Pwv5t5NU5WSCXq0krYgU0fcGlOjUC+5jVUjdNcpsbspEjjl9wW
         KaVnSY8HVH3kwuZmvaalyNY9bp6d4g01KFtA6dYmG0sJMS0yVIMMoHhHZvdMld0yGyAm
         3XeXSmAfDvym7JVJkOKRByr8hhBdEnA1vTCsa2TEf/dXLc817ZRkiyMQfWgLXfK1+BG0
         qYVUL/yCfx8SnnmCchwCAoJsqVz9UC9Hsf9I7YOUzO5RHkQuJOZlXW7ydqVg7bdAoSjG
         5gyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794060220; x=1794665020;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n4RQKom85jkQdizG8jERqXd4viPHC+189UpuJ/BwOhc=;
        b=UsYpbc/o4aBi8XtvP2jbQOZbrp0Utm7zdCKyHtjkxaYP/4zdVbCv4LFLvp4cfesfjY
         JGW5eTEz4KB5EkhMEdw85Mz3CNDQlqoT19g7eBm3P5clBWo6NJzbjM0xzhazBhjRf0HD
         dmEmK2ZqohK3cRw0DY0T98MMiZgPT0Bsj+AjfwNNza9HrBvimxvEU0RSjpID9tn60r2w
         ijmYihIFffVWI7zIdJ+yVcXUulsgKAhbk9vtQfast3J83m4KBj6r/795D5dgBIvhdYic
         rRqQ4LzfRPIkocO2tiMIA80Jik0gP18l3fbSaHNp9kngc43MTCbamIcAQoaxSdpIYURm
         NH7g==
X-Gm-Message-State: APuU4Z9nXwlyAJkahYIj+JjltI3mIT+7e3FWA8rs5CG+KfOsut7wvUGq
	5W21L308n4DTnjXYRzKnnpXRRSbvL0x744/T/OhUOJLRtaNLSbxM7nt9O8mOn3x8wi4=
X-Gm-Gg: AYBFou3hgbhgJiMfERbg7rY2Xbn7LdXwqqP+V7GCuGPldRvKlu2h1cFAhJ73FAHIAos
	jSBBGj/uFetK2f3BrDdA+TrmmVXSirw4s7mIyxrtZnizlzL++7Hn/oD6sdlJUThxYPA5aNIovxe
	YEeVi+4IMDvg1NBblEidxOf6Tmn16P3KmRf6wKmDJkNdEao3FnHX1WMhsq0rxH2MThIxGsiL31w
	kkgOBbDcLOHfqB5kTBqo8ZQ17XvChaJSXLB6F/FFB+tLswJ/HFez59mCPmU0zyVQeC9Df4lEOTM
	stDL35riu/wMf1Pdi7BzGDZZGpb5yxVKla5XAYnnsKVVTf2+PD9KUByE0RmVKbVhUCVbI8gkzU2
	iy3FupY+HkEpsRmejlhvi6m+Khq4grJu77cCg8diZfUbXuNejvu94g+nqKjb6LPmj+v7bA+H/6L
	M59CCUQcZg2KPIXcBcZdV7WiF1XaoesENAuFJOzWkTjg4ctbDUSSUFiRTYJH4Xf/8L6lR7VSX9f
	9Ha/0WfgXZVFyg+47MO4DKxUkt6hAH6RvhvuUNmVEEGwokiLQxSnlAJeQZ8/PJdWXc2si9E1Qdm
	FozT6aYl4nlA4VEkKwGOco4LfN77fW7+gmeCpihx+J3MrFacP05+FI7uHxybcg==
X-Received: by 2002:a05:600c:4e0e:b0:4a2:1364:252b with SMTP id 5b1f17b1804b1-4b6e054920fmr98235845e9.35.1794060220092;
        Sat, 07 Nov 2026 06:03:40 -0800 (PST)
Received: from [192.168.0.167] ([109.77.86.207])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7a0e1f298sm49309125e9.4.2026.11.07.06.03.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Nov 2026 06:03:38 -0800 (PST)
Message-ID: <83c6281f-1887-4481-8c63-957b4bc856b9@linaro.org>
Date: Sat, 7 Nov 2026 14:03:36 +0000
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
Subject: Re: [PATCH v3 6/7] phy: qcom-mipi-csi2: Add SM8150 CSI2 DPHY support
To: Bryan O'Donoghue <bod@kernel.org>, mail@andrewgigena.dev,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org
References: <20261106-sm8150-v7.4-rc1-camss-v3-0-0103e8a0bbcd@andrewgigena.dev>
 <C4VI5PNThYmwD0VGOO9DvvHRRydBUz2k5DOLjkianYgYaz4G3-El6cDpnQh2siR4mMwjeiL4_Yp2xEAYeJDJ2Q==@protonmail.internalid>
 <20261106-sm8150-v7.4-rc1-camss-v3-6-0103e8a0bbcd@andrewgigena.dev>
 <88407f72-0c6e-4e46-b97b-7031c237dac7@kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <88407f72-0c6e-4e46-b97b-7031c237dac7@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 06/11/2026 22:29, Bryan O'Donoghue wrote:
>>
>> +    /*
>> +     * platform_probe() auto-attaches a single power domain during 
>> probe.
>> +     * Detach it first so devm_pm_domain_attach_list() can attach all
>> +     * domains by name (otherwise it returns -EEXIST for single-domain
>> +     * SoCs such as SM8150).
>> +     */
>> +    if (csi2phy->dev->pm_domain)
>> +        dev_pm_domain_detach(csi2phy->dev, false);
>> +
> 
> No, there's something in the CPHY series for this already. You'll either 
> have to absorb that patch or apply those changes to your tree and base 
> your stuff off of that, and orchestrate landing this series on top of 
> that series.

What you could do to unblock your series and not have a dependency on 
another series is cherry-pick the necessary patch.

https://patchwork.linuxtv.org/project/linux-media/patch/20261102213936.1251316-1-anusha.nandi@oss.qualcomm.com/

If you do that you can drop the above change and resend your series with 
indicated changes.

---
bod
