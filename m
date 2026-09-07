Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E02F3AEF3A
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 06:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788762574; cv=pass; b=tIFGd0/ApN1cunOytrrxAVTaDPYsoi6J6TEwGC7RebA2Lprw5QjQ2cG1gUpxkLqmHLDZpTtzRcl0JF9SNkbQfDlD1pec3zw29rM3kpHbGyyqSMLmMDbwplqxVGCHOHabsTKnKLJVgQ0arhzpJtPbHuZJ45TzrB3o7gwzxFhhk5g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788762574; c=relaxed/simple;
	bh=ItFKlZKI2V0+J9zr3KnYF7nU8ra+oldkcSW3cENw9yU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HvE2GbQjNkaEr4KUzjx2dG3EG31KV1BJ4L4yJl4t4zkcuywcyAoMIpXS0bW41HbQJ7fO12Pn/cup4Y61hGtm4GYbKHeN5D4cCw0bJwYyAFPddOsXjB8QaDwqp5J35HDrs4ImeWfKLIHa1qSvNUU+XwC2uOKVbhJVuvC+8rMe9hY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=zcEnbdmG; arc=pass smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="zcEnbdmG"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-939a5b1f871so111100185a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Sep 2026 23:29:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788762568; cv=none;
        d=google.com; s=arc-20260327;
        b=sdBayxeigEPSoLrr6ILksEsPNUaTnQM2ntpOyVwljuSG472EMUP4ydFr9y4Qdz8LWt
         Z99A3NrvS0cHlNHhxsZjv5a6VFmpEQlpsdhnsrLmxezcDUuS8WZqrM1qY6ow/GXELlvq
         L5HxAV1gBEbek6Q3tZI/JbJRuoMpFzHM4AiBkQwXQIWYtbSyabamFkI0C4FFMG+bG5Ng
         ge3h7o9P9/rNqpiu/tTbJ50l6rIJ36sV/bGcpzokj1mxSAMM8ucLKnZ/zyyh1s7yLwmX
         97Fc5A3KRVm0j4qRxT9yHwrCm4jFmo70ALRD/D2/xrdefz/CpYBEiEyrGdRkcAOf+0fQ
         kN6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+nobZfwyZD6U2aEzKHUENEfOz31yDjT4kqI9cv2dNhE=;
        fh=Oc/lueD51n1AzZER/zWj3jD4Kasd0aAxtMsnNPB/72Q=;
        b=HNzc3eU5vfdSGibRdsIAKmlY5YGVlBw8tboviggSQL64AfACrJhKv/9WN1e9LNoa+J
         E9/PyuzAcsfO5QEIqdywuRXT4J2HOxVlnx35HGwSAyKeJmAWLTJT80M9wbMGuH1sSSPH
         3GziIbsBPOgPlkZ8CKKGXzQBcxWzt6ZJVkDS13JUkdI/2WOk+MPOOsfGFKyr8yejFUrr
         FALSV16iuO7CmTenGPx61+EGpTYDOtGiZggOowjRlZfUdtEkReeDNMRiSnEBGQnyuADC
         E4Xuu8GirNrdi0n5VwU/oQrs/wR3szpl1h1C7zsmjE3hmyObEG5psUiUOBd8YaQYW7kZ
         b2UQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1788762568; x=1789367368; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+nobZfwyZD6U2aEzKHUENEfOz31yDjT4kqI9cv2dNhE=;
        b=zcEnbdmGSPsDEFHGfiQ78aau/tFzwiSYO0HLvqBPVpcH1R3YFF3glszsRyDdPtvavX
         idy2PoVIZoPwU8HSui5Wa3BDYwqulZA6NMzBDobU6GMIT/VneOS9I8uzcZNFZnNMCbwx
         6zyQ8l8xOpcyOIBKq+tRxW22X9OArZn014Dca5XBWA7YFtB8VmnmgqKayWicG0wVaox8
         ZbBQdfu9fxiFgEVs7G63t6wIM/cm8CAKiJ78Uj8OlJkntXk0i1HKmCiIrEz08bXp2GsK
         1GRLdAO9zOtQbQkVPSUqOxv6+JNIFYUq0zAbqESIo26oEFX7qOQGv+mD1bsnaXhkEks6
         4iUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788762568; x=1789367368;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+nobZfwyZD6U2aEzKHUENEfOz31yDjT4kqI9cv2dNhE=;
        b=DSuP5Z5awUmBHqbeLhtdmnW47Um17ehFyT3RSmGsybfg1F4yAGFRsik0GuPq9JjA3K
         NzVdV+kvwtLoWKkQ7C22deBWo1PBYXtnlsoappVqI3FVfr9PffOwr+BmeGx7ZStrdcdF
         jJhJcrdnkssqd1QwlTBBAdPrGwBhKyeNxoq0q/0f2wWuym4T49xjyvJYOGfvA7YW0E6A
         ZChKubzZdEEN6PGu4A6140mDnJO1HSh6Thcwak5XZ8AdLP+6QXO5Wu2ADva2R/z8NJsG
         1dUOHfpCQyaYpufXEJvHFG4OrjbTKJ8l0dW2HLE+yyDcDQETfY5oLdxHgFLQCTHecZvP
         SN4Q==
X-Forwarded-Encrypted: i=1; AKwUvBwLuVMs6IgrYt6ys2uS1RphM+2uTOP+Oa4wOCdJlqmdqQXURZYgUGeRcMpMWNmsG0dV/7rrwKtNK7YjjKKM@vger.kernel.org
X-Gm-Message-State: AFuF++kFQ8WhMYSPHjULRlImlY6BJqUXW5qVj7WEaWqB45baa7LN9Wha
	Q03sti95Fa6LCFSmdbxf2GyWUGNt1eT0c2Ad01zT6rTMp1q2HhxyTifMhI67KK2JAg74IHjj3RO
	ub3SlZEoomyNyw1OVfmMQLMkhwhF/9m6SS3AC+R4nnA==
X-Gm-Gg: AYBFou0h8ZOGoBXNpe7GKHjTw3IVKwz8qI3IsAnhnepIOeYbYPBsjevrmDRGeaCN6v5
	8F/maUCTEX9bF4A1d6jQrNwhHjzyGQ+8WIfVtwyzTzYkR3pJ7pJsB9t2ZsCjo1/ZqrcRDDVdr9p
	OyUCakMNowAzRHwzcbXEpMG8LTiy6RM9usZSqjCn7ZUELJ+tGHcVJ/vocoJnDr1Zsx33akl8rEG
	9rOO/BAv0W70mnou0AHwg7IozQOArZImSQYetPXwBEDl7QpQMSeitxIV1Y+MRoeMBU5Fl3CrMwa
	VouZDOeA9RZUQvInqDrlB5MWD3Akiz8Ti0Y4AsxF7GnGu0PgU4szrKmDU2kSzbio6VeZKzBJTdZ
	RT40=
X-Received: by 2002:a05:620a:3943:b0:937:1097:feb8 with SMTP id
 af79cd13be357-93980426539mr2131110985a.24.1788762568248; Sun, 06 Sep 2026
 23:29:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-acpi-dma-v1-0-0fcc63d65d4b@thegoodpenguin.co.uk>
 <20260904-acpi-dma-v1-3-0fcc63d65d4b@thegoodpenguin.co.uk> <aprZKXi7h1prHZft@SMW015318>
In-Reply-To: <aprZKXi7h1prHZft@SMW015318>
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Mon, 7 Sep 2026 07:29:17 +0100
X-Gm-Features: AcwNN1UZJqTHPp0gVwDMba9SMPF841uiWsVn6TpoKEJcXyrTZ-unWt9lXJsg64I
Message-ID: <CAA6zWZ+8=sS1JE4JJORYu45xt6B6VWsf9YXBi4okk_2TdJNUuw@mail.gmail.com>
Subject: Re: [PATCH 3/4] dma: qcom: use named initializers for acpi_device_id
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Viresh Kumar <vireshk@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Binbin Zhou <zhoubinbin@loongson.cn>, Sinan Kaya <okaya@kernel.org>, dmaengine@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Remove "While we are at it".  Unify the list ...
>
> and wrap at 75 char, check other patches

Ok thanks - will do this in v2.
