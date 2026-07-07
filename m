Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FEC2370AC2
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 15:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783436569; cv=none; b=na5HigiwtbUkwh2+RHBhsIB3SVK8tbSakAdwfEcNeIaJ//78MNS6ACL1TquSHxgxR8b0m7lyUMgTeBjYU2/Ra8WyR3ETJKbkgGootNL+TTPDfbLMwcpwxAaieUXbLnw52wkXptryS1XGLv0wEMMrzls8xNPU7yO7z+S8IM90pMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783436569; c=relaxed/simple;
	bh=27lbe9R0uJfA1lOEGeN84RLKHIKzjAm6O94agj9GLmI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=biB5Uv2X6u0jeGS/sgliKm5zCdRj/39SgOLZsBqJwTomj6VaS0BNrajBkUuBWSoJv7LjoxVFjPHWgogwX8FltK4kJoQx/Xxj43A6WzoIOgKVSd+EPFsQrrCaUd+vfpf6SD7w6zPvqcQdWZsuV0YIBG2n3LqJ4d2R2xbfbZEXX7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XbqDHtV8; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XbqDHtV8"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493c52cde9eso42518005e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 08:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783436566; x=1784041366; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d8YHwGJCeEFKefM96NEtoTmLf7gsLMxJ2f5daJOJFZk=;
        b=XbqDHtV8n1DFiZkDFQ7OW8EsTRE+M2YXCnos1vEfgxfezgV8DPSDkVE5YpgzhjQVBQ
         e3iTun+MIrstqeEPGsvZl4PaOUr6kGwNo69At8wq6vp3SMyeVB21dFj6zvb4suQIxK//
         +nBQuw5MPATNi39PU28ujbefPQNFAmlkg2aRITExD95ewASXkXsGeypmfP/XCCsc4ex+
         4hQVfAle62EWGpGQUL/kLecIylQeLfS8HygLPWImOJT3MPXkIMvboFo46kLj+qV4RWrv
         oDznkblW70FD0FAPVK5lxE+3VmjfJHKRp0sXXzNathUtAPseN9wXtApD6arnNJkJyNZD
         aMyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783436566; x=1784041366;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d8YHwGJCeEFKefM96NEtoTmLf7gsLMxJ2f5daJOJFZk=;
        b=niTKhM4efvyvVzvoWhRivexhflnmtPZWdNpghxfnkeU+iZEVds8y2f9LqZmGd5X05Y
         3/xon3EMhqx8sU9tmjM57cDCGo4nLUgJGyyvlo0fYXUQtOQGTmP+bIATVedF6Nbi4UmX
         3t7jVc8gX+4nPUfxKjJ3unR5s63H15c0+ucPX5LyTSgE1htCnM65BZyjg1/BtZs4kgcI
         9k2lGN5ohTLBz0YjWcGtXSLIUHxAn2PyDtLwuX6KWDFUiiGyfhoKqXJDKTeAP8OhS3uB
         57LS1qfOmmSHuFTXwoa2jGmI1vgK18b+HoC64PiHmHW+hQb1tkYLuVO0GmuFs5/tlEyE
         dwaQ==
X-Forwarded-Encrypted: i=1; AHgh+RpgXNJHJ2nTMHI3kmMe0oMTkTmDeMBh0/7eJ/H9a0SRfa7JjImTz5jJ/jk0CAQXUrNoGaeR3q/VNYjysNK2@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7ldbYO1M9MKj1rbKG7XclmJBVe59PjBHXgFTt1xOYdvsLPiSj
	GQ81LO/KM6ad6c8zcDz+tKpHPsg8vkfzjCe463uA0WoyZUH4lIaRpmVEv4vBRUueiw==
X-Gm-Gg: AfdE7cnQwMWYZZK7fGCm50IOOL8POlhsKBi+8oQuHs8DmI/tmn5Kx1zMY4A+MAUOCFQ
	3dyHmlccSIEkKEPOd7QImFF3rhtC6Xm2OySn3XtO19CyA34sD8LfeNFkvNzuVU8tA18EB4IIQyh
	fbu9Hgb7qOK+RycUfWBOMV0R+6MHUC0K+S9BLNhA4GCc8O/IJaLYdv7F9kVZtbqxgjm+gHR+O/y
	iqXdQ1QMjx5DeL7uqeS5de4GndU0iaHlnvw8rxLK3NT/j2IvyRxcvlX7QOYCut4k6RMUBEHFu4X
	DMiPElbXFCEFsqSPzzeV6auTp9GD9q3KXLACRXPBqOPYj3dsLFe+nI12X6jGbOsyD/fHHLULjmj
	gByspH2v2iYphOrfQoarvvfyCpjLVihIHANV86ZkzcUw7wLy+hB5YNvRNxY9y+qDwh2PwqRVJKA
	cHElDxTernUeqJEPr1wZ3NfehDjpjlQ+E7gFss03qkGgKsdXs9yM9/SprzNiCV3tix2kb1Kw==
X-Received: by 2002:a05:600c:4747:b0:493:be3e:cc3 with SMTP id 5b1f17b1804b1-493df093146mr65333955e9.21.1783436566150;
        Tue, 07 Jul 2026 08:02:46 -0700 (PDT)
Received: from ?IPV6:2001:b07:2ec:601d:4b26:1672:75c7:805a? ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e10af392sm62069495e9.2.2026.07.07.08.02.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 08:02:45 -0700 (PDT)
Message-ID: <dc5aef2e-600e-4e97-b76b-dcc8bd72c709@gmail.com>
Date: Tue, 7 Jul 2026 17:02:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 03/13] drm/msm: look for lpac from dts
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, iommu@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
References: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
 <20260705-descriptive-name-lpac-upstream-v1-3-01d50c3e0c99@gmail.com>
 <rwohvfbsw2brpxrfg26egu5arwe6g7n2etelo33eegmu5cz65k@3syofuxzsjrc>
Content-Language: en-US
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
In-Reply-To: <rwohvfbsw2brpxrfg26egu5arwe6g7n2etelo33eegmu5cz65k@3syofuxzsjrc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/6/26 5:04 PM, Dmitry Baryshkov wrote:
> On Sun, Jul 05, 2026 at 09:13:37PM +0200, Anna Maniscalco wrote:
>> In order to associate the SID used by LPAC to it's own domain and
>> context bank we need a separate node on the DTS.
> Can we use iommu-map instead of adding a new device using the same
> addresses? You provide zero explanations, but it seems like you are
> trying to separate a part of the GPU into a separate device, but it's
> unnecessary.

What I was trying to say is that we need to map sid0 and sid1 to 
different context banks.

 From what I recall, so long as we use the same dt node, the iommu 
drivert provides no way of doing this.

What kgsl does is having a node for the iommu and then subnodes for gfx 
lpac and secure.

The address on the lpac device doesn't really matter. I have very limted 
knowledge of DTSs but I think we could just leave it out altogether?

>
>> Add the code to look up that node on initialization.
>>
>> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
>> ---
>>   drivers/gpu/drm/msm/adreno/adreno_gpu.c | 21 ++++++++++++++++++++-
>>   drivers/gpu/drm/msm/msm_gpu.h           |  1 +
>>   2 files changed, 21 insertions(+), 1 deletion(-)
>>

Best regards,
-- 
Anna Maniscalco <anna.maniscalco2000@gmail.com>

