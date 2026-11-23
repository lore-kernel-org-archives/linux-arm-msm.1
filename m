Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445859;
	b=PjqMs6ARpMl/dxLAj64gUGqnJt1i5zDvhxj3SCEguHImmDz7GmlJfNlB0aJXxjwOlQ5+
	 UgOLi1y9MBOp58822wmiwQBt13OplsP+xTQU3kqLS04yX5CVc3ekkhaZOB20eBXltoqmg
	 uhKBzeQg3hgjHn7VOKu3gx4sAYbxXc07j2LaqYIYHbb+7fOfROc/aRAOpcd2qWYnMhLQj
	 WGmXV6DW35TJFxzJuBeYWuztdMEm5nN8zq2HmY4ntDPwIPHFFEwqvYzMT9lJYugzksstl
	 AowA2DwoiK44fOG4ArtcUlpr1gN0MoaaaUFasFWjX3h3yIQPfqaKlN5++TrDbp9FvqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445859;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=zYKXJCR+OHzPIwXu848W4WS83V243GLbfOzYCVn1lSc=;
	b=jhkPjrFT34f5RPtGa4JGhrSd5JjEHW5MN+IZy26Dd+gAqKO2zUlQbLcARBbyGixMNOOJ
	 R2sBDEPfzwMetn4JWwBsFMDx18xspfk4fzxyKQhDaCR7zJoxHoMmW3e4ok+/3AKgPWgTG
	 EVo7te0r6mpCQkpsOa3Ii4Q+JS+T3ErS6i5qKBeQYNYkuOGGG6vlj1TYDUzad0NDRM8YK
	 JwLJts/KWAJx8xyErhsG0aH0peet43FpWxBN9XKes2xUdqHDhfZQRP3ewpCy16+TiG6KM
	 EDoEq1nk5YSMcgoBVqFKyjSi/DZV3wX4jNNVZCjoU/7Ky/MvGhl6rPv31cglMRgOC0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=a7DQdW4k;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1E1606A31E
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 14:57:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC1E1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=a7DQdW4k
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49d05d51553so24580185e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 06:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795445857; x=1796050657; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zYKXJCR+OHzPIwXu848W4WS83V243GLbfOzYCVn1lSc=;
        b=a7DQdW4kZdqSRWiWHKSKPUe9cVkvSjVcejQelfAfoGAeh3AU9nnL99c2fJ1jG++X+e
         TMipsz8mdJUc9txeNefbc8dIpkrXVtWt4zy5XdWENjoIfHpqQnDp0YSBtldIvgjXtWAY
         JcOnO3d4SubDnbDMBCjQCvMA+MRN5JqqJ768ff6hoFWh7I7TmQh5Hzo4wD3J4jIJJLub
         ovqqkHRUccgU7gDNWJUtvZw8Mlb0fWz/0+TEN89nl/n3PZipH27eFBJSRtvQZZWkgy+G
         qw0LEcK1AJt8N/fspUEqjw0WIvEUf6f9b1LtbDm/NowxSoAzHvrjtagjymM+FSpmjd0y
         JWmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445857; x=1796050657;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zYKXJCR+OHzPIwXu848W4WS83V243GLbfOzYCVn1lSc=;
        b=nmZ8SoxpDVl3k12P/F8CEKwJWTJO0lSyWTyDpw4YrdPRyLBq5ti6dHEiW8iLY/yHyz
         K/ZGPglgAOrCoKOZH+ZmdgDCIxKUuVCAunTPKrB0V3P67gFQUuji9RpL4LMCgeGCBauY
         qZubHwgQFSySl6h4m6Da958OUo+k+sF3M3ule9V8t1P/q/sTlZ1t/H3v2cHfBQTB+cmo
         Sts9Clh1hInmszz+E8GmYLkgTdc0PWXJ+iuFLZIoFwQvxVGXsmW4tURzA2p/0D3W2ZbE
         wgrf0ehVz4Q84KJ5UHZeZU0hdneOcYPmElaW/hrcQI3Xrm/uSMFd8OYzglP8NS4z47gm
         exLQ==
X-Forwarded-Encrypted: i=1; AL+hErFR/84QkMtV4sIiQ49J7bS4OaMdvWBwXkD+Q6BReaxUvRSHor8VqYQmFnOvoezdSfPAv793Cc4xbmsI17ta@vger.kernel.org
X-Gm-Message-State: APuU4Z/+fRUxb6PZCJZkRINPNrRAtjUTSRsMLk/4eoj7oMLtTzpFjk+L
	ILcofqKe+7uqJSQPiVdHlYL3VepVm56NHfDx5sG8E+mN4KdGSommuyKyr2QwUeARsr0=
X-Gm-Gg: AZFdTZfk5WxZ0npi5ebsZnFrOWGvu3vEurinU1QrJrxI8UYCtgA1mILL0lf+VIfQvlu
	lHaOCpRMgURF/piwxttuPYD3xLhLZF0N8BQa9GFh0m35PhPWc2RULDxFvAYpiIlDaGfNjLEXkjv
	GPMo5UAHHYC114xBV6MDVCPz+VfSoVyTw9nLzXcd7wgb5bSoc73SbCZdm/cC53avqrkQ3PK/uSV
	ae05YJ1Q5rF+lY0p9GPUwAj/QmjCh1LIgjn202i4WRbBXhnDkICDgH/D3v/6g4uRYEJZkIViTS6
	thjFkcX/LohLdbMJPIYcl5cmQ6NYGRSrDBjWKGk5x+EUQIUE7s9bEekSnUyNZxJrTHI+mUTXW3+
	ccEzihTl9DZIYwZwr9/+ldpQ+yTEIRy7uflyR4MdPaHVqABrxdPDS5cfyaqHGMujOCOqZVL+F8p
	C/dkxLHC6hWV0cqtZxwEltkiMQSKjYXGFhH5YMvZgqbxlFOkMK8OxKe5Dx6gl3dE0qyQdCWFoJG
	QS/Glsrz5U43tobq8HwSHU7BX6CayRhqN9RtAxgBoVXVvrjymqyrwYO1Z8Ud3tFWMtkAudNv6GC
	RSsEjtu2d4Cl9hmECFKywDKhrExF4jRRSbDolGjRUrfI2lIwy7GoLKDUk9oDe63w
X-Received: by 2002:a05:600c:4f4c:b0:4bb:8503:69f4 with SMTP id 5b1f17b1804b1-4bb888097a2mr299056955e9.5.1795445857113;
        Mon, 23 Nov 2026 06:57:37 -0800 (PST)
Received: from [192.168.0.167] ([64.43.130.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm169377755e9.0.2026.11.23.06.57.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 06:57:36 -0800 (PST)
Message-ID: <ab0a0ad6-4c5d-45ae-a318-dd678a5685e5@linaro.org>
Date: Mon, 23 Nov 2026 14:57:35 +0000
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
Subject: Re: [PATCH 5/5] media: qcom: camss: video: stop started subdevs on
 start_streaming failure
To: robertijtsma@gmail.com, Vladimir Zapolskiy
 <vladimir.zapolskiy@linaro.org>, Loic Poulain
 <loic.poulain@oss.qualcomm.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20261122-camss-fixes-v1-0-9df4deb87ea2@gmail.com>
 <20261122-camss-fixes-v1-5-9df4deb87ea2@gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261122-camss-fixes-v1-5-9df4deb87ea2@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/11/2026 13:35, Robert Ijtsma via B4 Relay wrote:
> From: Robert Ijtsma <robertijtsma@gmail.com>
> 
> If a subdevice fails s_stream(1) partway through video_start_streaming(),
> previously started subdevices earlier in the pipeline (such as the VFE
> and CSID) are never stopped. This leaks VFE stream counts and write
> master reservations, leaving the pipeline stuck on subsequent stream
> attempts.
> 
> Walk the pipeline from the video device up to the failing entity and
> call s_stream(0) on each already-started subdevice before stopping the
> media pipeline and flushing buffers.
> 
> Fixes: 0ac2586c410f ("media: camss: Add files which handle the video device nodes")
> Signed-off-by: Robert Ijtsma <robertijtsma@gmail.com>

I'm 90% sure someone has already submitted a change for this.

Anyway

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
