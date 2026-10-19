Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79824D1790
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 10:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792405453; cv=none; b=SIJ8whCnpzQJFsvxVq0XuRDYrNkz6ulbEP9yuPDEDS5lDN1AF4fpGcn+3eZ5Pe5vMMGmOs6UduLH0J9zuraZ1HWpETInWgqb2qNoY1AScaXuqb8v6QE8LLbY4kYY9uspN10X5v5mLm7UrN1sUInLsZ64VEPnWcKRVs5nfnQjdEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792405453; c=relaxed/simple;
	bh=hwq6n3lMri6f0tS9cV1XHP1OuBW9AhFJjSclegmlXgk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=srjJJncJEfVNCiVcEeKO1SAfuleQtnQzZCNjuFSGGaqBfck1XbqyWeMhj7UVxTo6rHhd4c0V4H/qbkkYLxt9+Fucar9rUwlNePK3+an972l1OyRtUgCWzPFzAseqpf8/u9zfeHWIEWvnfz33H8E0A4nJCKc2X39VnHjEwvP6qNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uR5KCq9G; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uR5KCq9G"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1880e1bf1so17021395e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 03:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792405450; x=1793010250; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZQPRCU8mulrVTcYx+mtCokl0uJBA6jXozBw1EvQlJfk=;
        b=uR5KCq9G1RH2lqdq1UlEEcHMbz43vLpROotfjGGvjHIDuEgPeKnq9RwDQkivZgKNDC
         Sq8X4Dn0cwH/Fzh6/IyF7NW1gFENktFgycejmzj9AtTaJvnIjTq99B4cAaQS8FOClx2j
         5+X7V0t6CZUfaKMZhkVIc1heItesw9YQrMEOJIBjF3OvJKDBnQliRsZIYFyGKZhK/JPz
         YYBgX8rwsRXcwPek+NvYVQ7CL6mddfqKlEC+EBwZM//qlagqzpHlBqs8cMyd5JTzhgR2
         5vFHodufphnwbuzChUTSKU6jrJ3dBAwiRKZr/oogHRYoVcQpY1pPNfJ+3t5rhvJW2UTg
         Skjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792405450; x=1793010250;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZQPRCU8mulrVTcYx+mtCokl0uJBA6jXozBw1EvQlJfk=;
        b=k4bKv7fp1umifX1f9xVMiOJxfa+fffS6yD2pWjkSdoHmxHGv8zNI6darMYmF1EDGwm
         U6kVFWb9MjB/p92IeENaeJpyixWSDdL5pMG566zvroJnaaTWolEIxd2vwtPzkwP/nl0I
         MeA/9+Zhj1jDWd777h1gpeMjlhCCOViNsgCjxhjofBReazi/FhHOlSrEdQV6GriPyvyL
         fgo7GhQsFLCerKQweqYLX2uJofiakezw+76zk5Yog5YFQhP+ssr8ihkJDiv48OJk1iD5
         V3iUG9GmJ0PyXUPO2Dmojx25A0s+x93q2igK6xU+JdKNaW7phyuQtdfMZriIPOAZMVXg
         /SoQ==
X-Gm-Message-State: AFq9FYLdmDjl21cHvpb3fs1R2vu4G5dJrRI2CGZsbFTYIptm/Ax2DDqj
	/QaWUB4861PxndkjRODFpg4oSrsViBf+1zL/Y227ulhpL1d3V0wPcEiwNdC4owHjM90=
X-Gm-Gg: AYBFou066WimuFd7WnHEp6aE9VNtBZ8pCx8+BJRJV13rQ95kAFs1CxUurivdBdp37wD
	KLWzr3jhRws6yrm2Yj+zFe7HIvPAQypbLVUbMf9549+tLFaqnGab8dIRaj9SHDhJGpEbFkbSMl1
	juRd/SSrbQrndF+fzhn+xaGMoFBvOP2gnKvR8KFD+x3jbKFF3Dx+IVIpdSBj9DihJ2WqfvBdVMs
	FsATMKx/tGKWFem2Vl+4I2+P8Sj/dKBUeipGmaNozR4LhrBI7+YPCQwg3B2AZmQlsAJc5ejr5DQ
	varWPDE/4MppbNyKUcyS2RKsnUoc+XnnzdNkn5gTtXRz0+zVSUDzvg45RuTyk0JOh6BaWiW8IQm
	o34GepasG/s9Ta+p6w3Vp9+OTkO8vQD8HgG1kmiOrnnDkJvaOU9/stelRwbEufl/9yLCgG6S3QX
	FmAFWqx/xWNeZmaNsFk7YFYFln5K0OOw8YCyzTKw+1runKtb9fUfl0UBXdBrN4NGoCauity5JLF
	jlnmeFmmQEPz6Oe4PryMQ==
X-Received: by 2002:a05:600c:4e50:b0:4a1:76c9:5408 with SMTP id 5b1f17b1804b1-4a1d7600190mr157794965e9.11.1792405449821;
        Mon, 19 Oct 2026 03:24:09 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.252.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1e3ebb3aasm187781085e9.0.2026.10.19.03.24.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 03:24:09 -0700 (PDT)
Message-ID: <c6d963f5-a57e-4086-972a-4f04af2c5b42@linaro.org>
Date: Mon, 19 Oct 2026 11:24:07 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] phy: core: add generic MIPI C-PHY configuration API
To: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>, david@ixit.cz,
 andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, bod@kernel.org,
 vladimir.zapolskiy@linaro.org, loic.poulain@oss.qualcomm.com,
 mchehab@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, gjorgji.rosikopulos@oss.qualcomm.com,
 jigarkumar.zala@oss.qualcomm.com, hariram.purushothaman@oss.qualcomm.com,
 akapatra@quicinc.com, linux-media@vger.kernel.org,
 krzysztof.kozlowski@oss.qualcomm.com, daniel@quora.org,
 konrad.dybcio@oss.qualcomm.com, christopher.obbard@linaro.org,
 alex.vinarskis@gmail.com
References: <20261017041733.3946816-1-anusha.nandi@oss.qualcomm.com>
 <20261017041733.3946816-2-anusha.nandi@oss.qualcomm.com>
 <a6d8514b-269c-441d-b280-4895b5f21fac@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <a6d8514b-269c-441d-b280-4895b5f21fac@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 18/10/2026 00:00, Bryan O'Donoghue wrote:
>> +    unsigned int        lanes;
> 
> This statement and how you go about using the data aren't consistent.

Re-reading this.

unsigned int trios; would be fine too => data_lanes and lane_polarities 
is a multiple of trios - always three - does it imply that the first 
three entries in data-lanes == the first trio ?

Presumably.

That would work too.

data-lanes = <4 5 6 1 2 3>;

=>

trios = 2

=>

data_lanes[4, 5, 6, 1, 2, 3];

trio[0]:lanes == [4, 5, 6];
trio[1]:lanes == [1, 2, 3];

Probably "trios" instead of "lanes" makes more sense here and the driver 
just always validates that count(data_lanes) % 3 is always false.

---
bod
