Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794448701;
	b=a82qAjN/zLtAU4bxp3yn0BOliz+oWNJpkiqEvFm/53S5JcfuuPCx0buKsZP90sxarmLC
	 Puim/xNF5tr7Jwiq+MqJy9oB7W6i4HSRcvhAiX8YkokjH5bUmAAw+h38ep4gQk77ZqLJ5
	 m5B8uK4QAo3scyBNBSNsdZ1tGQAH7o5WEuhd8up4AH7Z4kDGA6NuT93Sv7dBGG7w5MqLU
	 odnoxGjS6LHLu+BXvgEmyRJduKnO+wiRg4MKXntrj8iqRIrb7/bPiZ9h9xTW9+v+Ph15N
	 lHMkocddzTrhYhXUnGHGSS/UyBGMEhMe7/317KEixk/YG2lq6FZYw9tlD5XacSjwesQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794448701;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=fFeZXEbhmfUqv+BRu8zMGHHr1ieq05uAvFEKtu7g9xE=;
	b=FtZxTQupATaqZnYNHP+eM1CbQqz7rlvy8Y+EJYN7U1eN++7cDchIDn8IxEkt1PamA3qy
	 iCXeOktUecGVSYewtXyC7TN337mYY6G9NcsyaWzRK0VBihuJ/4BuXwOr8rV4m7I79Ejbh
	 FI9xMvzI5bCGYFJsu11Fh2M8ZHzAq7XJtuXcAga/YWo6l2218jYXQ/sAyUbysczjQdz5i
	 YFWwq0/EohoAlxeOTV89xuJU9nhbnL+dXp2NByo5hEFbYYmg970qWQdijpuBTebK+8wua
	 TWefEhq7x4+26QJT4jBjofiWBIWwYy/qbwRqlVoxPgyFwVUpP1X0mSUyI0Tajdtdx3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=MIwkcfFT;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38775606A323
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 01:58:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38775606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=MIwkcfFT
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so2086342f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 17:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794448699; x=1795053499; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fFeZXEbhmfUqv+BRu8zMGHHr1ieq05uAvFEKtu7g9xE=;
        b=MIwkcfFTDw1CFc7M9hKieOExGiw8T7CiLf3t3+t5CV7xhSgAAX3qJnWHyYdHW2btbM
         APU0VO+UqBPrBJGFTOQWRbrbsDleNI5QY4VxP8RT8LkEvyQ+PE0omWuzozZ5+gotOHen
         G8gVkQ00aMI7aBuiN+ov0zpDQ+3ACCU2PSR4Vxhw8ekGOmC6oaSFFnl4+MI7YviqTcTb
         9Pqb5kr8d/lj8ka+ynlS8cek49k8EpLeUDvQlXOXKNWiOKFSGhgpu/xv8gok1gue9gfv
         rudmZL6JMrjW2AK2Zn0lfAwuj0gxYZb5J/bvH62bMQOiuaS67jSlJSqcvmNU/GVJcGpU
         Jd0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794448699; x=1795053499;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fFeZXEbhmfUqv+BRu8zMGHHr1ieq05uAvFEKtu7g9xE=;
        b=F4rnD3g1tCnsPC5VHroHkeAhEsTi+LJuiANbHJ4pm2Py5tenJk25+v9uIrzqeRW9WA
         PTCfbOQA7StVlk7Faliz4Q1aLuXDoDvGJN/Y3lShSmSBNiapB+xeKMm1RUXMBqoaBUO8
         2u48VBIycDqsjsDnlke3Q5dHq6TWJG+MIwwHqBLunJYYPuudlmSBgVJkjSc2FfhyMsxp
         clZeQEim4x+340g8dDXMYCVLhIDlNAh/KmPPTsVngnvotIiTa9pbcGq826I8pT9lCV7d
         xBpeEyj1St9CzlZ4FIxTssgxKpDXDGevFP5I+zpxSFHhE7M54ugduHwtdsyttl0ShtxX
         NNhw==
X-Forwarded-Encrypted: i=1; AL+hErEwxZ6rlR9Etr93BlHfZxqVX0L7F56WMlxw2in85ZK3eCNS1TRbLKIcpuCrzh+gFHNeADKrLLoNTw0mNPNl@vger.kernel.org
X-Gm-Message-State: APuU4Z/HrQXmb38lkFufvIN1MG9rDnHklcmokloj1XcYcd/Hn4gVlH+g
	OBWbHISoLo1OlcDtTDVxRW/vQlgPZohKlqkSs3AVwQQjM5Ach+noLHoGc2XOoEaxexA=
X-Gm-Gg: AYBFou275UvmPPS1wlO+LMfLfqy++RyBSBDw7A8hd3JmdozFMGx2GBjlqVJWvjnv+8v
	VDfslg0b8CyZ9Y5j5fNeuaFHBbxRPUxmb5czKDwuvYjGR7HnSHh8e131YciUAgKSeTuQ0PAf0qR
	jL3atx60+UZ16gVgWuFxwxe8njm+7t+mnOb8ZH2w/NPgPkQvFDWEcYAX+wMsTsV6nC5Kg4g2z9p
	xEZ45iMusNwUtRVzZtD3ev8cEFi2zoUq+2E7O8P8kjLbANc2KgjvxZgD6Svb89tTa7CdYhdow5P
	htOmOkZc61hEKd7etB8tIkRvAHHCjiomzd3Ab2D8J8d/sv75hTli32YFY7a3u6zpp2dzmqoXxWT
	gvICkCuMgnCgvh/JM5I8n6hKp/2vVw5t+7ER93D5I566kWVkqY9gvbozlHFa4jjPdsYEyAsqFxd
	bHzssrbzC5CpO0y1/A+LXSPiLF7NejqRe1h+CZ0DjQXv0ATAY8+5p9bLB3z2EZ1aN7K+7QujpOM
	SCFoIZqVs2/w7nRVcRG5bDV1c93FLKFw1+fmDKAO3wXvUkXcupEyp2w4cHXQixugSUzsN8qSYVH
	hn7pBNEDAH6gxdA5LFz1m9cSd87s/kPjFGGQIPYK
X-Received: by 2002:a05:6000:4027:b0:491:45bc:d69a with SMTP id ffacd0b85a97d-499c792ea42mr6742918f8f.44.1794448699467;
        Wed, 11 Nov 2026 17:58:19 -0800 (PST)
Received: from [192.168.0.167] ([109.76.11.16])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-499823761f5sm8864900f8f.2.2026.11.11.17.58.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 17:58:18 -0800 (PST)
Message-ID: <1e6f7588-aa9d-434b-aa8a-d45031df5a4a@linaro.org>
Date: Thu, 12 Nov 2026 01:58:16 +0000
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
Subject: Re: [PATCH v3 2/4] media: qcom: camss: vfe-4-1: program the RDI write
 master buffer size
To: Allan Siriani <allan@fatecpompeia.edu.br>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Todor Tomov <todor.too@gmail.com>, Hans Verkuil <hverkuil@kernel.org>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261111135338.27008-1-allan@fatecpompeia.edu.br>
 <20261111135338.27008-3-allan@fatecpompeia.edu.br>
 <6fdd46b6-e57e-4688-8231-b31b61810cb4@linaro.org>
 <20261111154536.24163-1-allan@fatecpompeia.edu.br>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261111154536.24163-1-allan@fatecpompeia.edu.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/11/2026 15:45, Allan Siriani wrote:
> On 11/11/2026 14:35, Bryan O'Donoghue wrote:
>> I would appreciate a more direct and succinct problem description.
> How about:
> 
>    media: qcom: camss: vfe-4-1: program RDI write buffer size
> 
>    MSM8226 has no CAMSS IOMMU. Program WR_BUFFER_CFG from the active
>    format and clear WR_IMAGE_SIZE to prevent RDI buffer overruns.
> 
> Can you take it with this changelog when applying, or do you want a v4?

Works for me thx

---
bod
