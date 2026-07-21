Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D1D377010
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 22:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784671362; cv=none; b=BKY2EZGeDBDcPkn4Y6b5LfNS0rNqCTWcnymuy69U/WAYRv/ZabeDHgw79OsWVX8TK9tun86EiQfZ4rByFRz1Fk9wNHeM7yShr4Z5a0aB705Nh+/ObdZo+tXtCTDEGYbrJeX1NcdDZmOywBpRoaqvBKEpO5gZ0Ok43rTf4NSvg7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784671362; c=relaxed/simple;
	bh=T/VkMFPUv3Q5qYauWlQZ7smouZ3swOM4/oAl9Uvfjkg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lz4eUr6yIZbObMG1JIaHGc9T9NdcoSQS4p9VWm67tfeWCBrMU6cQSwII/qoswxAQKox63G2XZNuLeNArlvygLnaLgYlfB4xGcYrc8qgXURPvKlxEZ083+oGPOvx+K2VBG3r9xi0LiCzIo+h4RjTNiIqHJzFuYmHEjp7yO5SlCzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Av93SSLp; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Av93SSLp"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so85579735e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 15:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784671359; x=1785276159; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SPSg3MjVVHYHBL8xsGemBcS28WSKAlhtJKnkhU6oD9k=;
        b=Av93SSLpAJNkb7MhhY1beSXm9AQ/ak0c2Bc9/yhV5R3M7BqJQuKLGeiwME7HgSh9MY
         q+AsoJbwnjAItJQI8Nm1BSJ2X2tHB5EEWMF+pre05nm98Ekh+gawIneuZ84zQpUqKGwO
         i0Uuafs4YsW89LIT9+0WiKUxsDXpo4njdg8YGxGR+S+hgV4BD4XZS1da2lLVWfJ9SeZM
         wLDPD46vDp+q0I3UE7nk7buCj0pbOOSxLFBpgYizz5vlO9iMM9Ywb67RBuqRMTDZJlsD
         KGAVL/mmIb8bQe22VPENbA0MXONN+zuQatD6caGmYUtE+FgaLkZxHazwQgk1C9y+zuvp
         fS6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784671359; x=1785276159;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SPSg3MjVVHYHBL8xsGemBcS28WSKAlhtJKnkhU6oD9k=;
        b=L/NHvtX48AhKBvHavQ/JtYApTJ3L8iGOq6pWkP77nO7ZvtfkSUDX+1kpegpDs4WjZl
         pWluQP7uNlJIxC+jS7mNruxdfYFcsZk2Ci23NDEQGnAw87pRbweSwbecEGPkMIqZVLqn
         PKyVr9fXoXFqgZcGbsMtWdxTOab2UFYY1yeSD0rWXjP9qFWfB6tFAMqkxi09HmGRj6dp
         3JzqJzYeKcv5DeKwvtG7vAL8oGbNu2VBLcdOrohvHp8XYO9bJP7/c/GDOSGatM/vMeK9
         ydoFZDg+HOoR6wfL1Ub2E5NV+kblscS34IX67fgW2hQ+8ZEXG16za+USNuD9cB/jcdVA
         DrgQ==
X-Forwarded-Encrypted: i=1; AHgh+RrWOLW77NzKrKMNG8Wx5C/NljqZwgqB45+apPCTiTuz1cjUPVCoILXtO4LjiDZ6A6K+QM3ApSOSVawXLJmY@vger.kernel.org
X-Gm-Message-State: AOJu0Yxzc0NxxJt/HMlxnVCpo2xVSSSfUsK2QRDxVnjYy0Jl7f/KegBT
	mQJNkNzN548ZO1UuNsDF3mByx0MArJWvEAmCY09GBS+qOnJ3jiExVM45ffNUmnPHS7lo6s5lr0r
	J/U48I+0=
X-Gm-Gg: AR+sD13yWnkpZRZ67UMWGx763Jeu+njRxSJGeO6SHTCEvNcTLZs/puFUDjveFTxEYl9
	qszqDSjh5Mv1J+AqLQqEUu4EX+me+39TCaJTZNMTQ2GsIuxWBxFcYRkL7ExffSoRPpgu7F15vZF
	SblrmPQjg8Q31M/CeUt+gZbNDWua1BSXCft6KMmPp7iD5VvnlybfXzA6RrpIcZMa6olk3U/zZm7
	+iUyxl4MBBF+GAzZJFn2UaQSe/1NqgAkSzDYKNKh4GQ/npQyQLvQasFH3uJ7EJtcRlJPmX+Grg8
	gTl81dVDLR+GtssOplYgXadgge1dSAXcPvqRcNEW6ULkjRL1foTzUieRUPFY3Ry+gRB7GEqn4yG
	vcbcmqYe/a9EJVjFOra5OZ2aXkmA1ggj+O4aFApgH3fOB4boH25ffx/9gcq1oZJ5K1+MHSZh0iP
	1+KD5ufPYuohM99Vc=
X-Received: by 2002:a05:600c:190b:b0:495:4d35:5eab with SMTP id 5b1f17b1804b1-4954d5a2d76mr203295865e9.24.1784671359200;
        Tue, 21 Jul 2026 15:02:39 -0700 (PDT)
Received: from [192.168.0.101] ([109.76.186.235])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495653698bcsm88625915e9.2.2026.07.21.15.02.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 15:02:38 -0700 (PDT)
Message-ID: <8163a7e4-675f-4d6c-85b7-48d07f063a67@linaro.org>
Date: Tue, 21 Jul 2026 23:02:37 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] media: qcom: camss: Add PM clock support and
 integrate with runtime PM
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260721-camss-version-v2-0-b2440d99085a@oss.qualcomm.com>
 <gCmRXbwBpa-hkTNAvWkjhFvbPk73RIl1OebJb8Iae0gLmAr2kcfNoYDnLhyG9EOKGZZ-jhn7F8f6vwQWrGPhJw==@protonmail.internalid>
 <20260721-camss-version-v2-1-b2440d99085a@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260721-camss-version-v2-1-b2440d99085a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/07/2026 14:21, Loic Poulain wrote:
> Add optional PM clock support to the CAMSS driver using the PM clock
> framework. This allows CAMSS clocks to be registered once and
> automatically managed during runtime suspend and resume.
> 
> This is especially useful for global CAMSS clocks that are shared across
> multiple CAMSS subblocks.
> 
> This avoids the need for each subblock to reference and manage the
> shared clocks individually. A typical example is the set of clocks in
> the top_group, which may be used by CSID, PHY, CCI, and other CAMSS
> blocks.
> 
> Introduce a small PM clock descriptor table in the CAMSS resources
> structure to describe clocks and their optional rates. Initialize
> these clocks at probe time and delegate clock ownership to the PM
> core.
> 
> Hook PM clock handling into the runtime PM callbacks to ensure clocks
> are properly suspended and resumed alongside power domains and ICC
> paths.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>


Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
