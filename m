Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE24175A7B
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 08:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788423878; cv=none; b=FhjiyY2bfdcZOUVg1gJsVkg57THToWTtHN3M7vi3XjC5pY+xox4e5iU0nEZc6f4OAgHnaYn/lM1bDejXvQHOlH2MOF48+V48yeu0I/DyTekvY8k82vaTala64lYIeWYl4m5ETkjhHfPYrZ9qCJy3fqGlliXwaGCYe/kYbAf6WsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788423878; c=relaxed/simple;
	bh=jUqRKiy1Als/fPzU2pw1tgkS2Mh780PlQdOLEThN/FQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VKYya5PpcXlVWjoGXL6Rgm0YsEDW3qgEsR3rjM2BGHW6TdWb86zKAYXNgm29ScBYs/uxxuKuZbLh53zaGVsG+jhxQ9yvLSfhNueIDTIb98oEHhhpCM9ObPEIshgebjL941Gd2mvqHFfvR9fNkIbeQZ5dMFasAbC0eLFwOYwOszU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NTVGaBHg; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NTVGaBHg"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6a173ad7cf4so206876a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 01:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788423875; x=1789028675; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MgOyUEIfGCWyeavJ4iucCikM9YF8g1HwJk3n6ykR+jw=;
        b=NTVGaBHgNQn7vMQGRLjUt/SMTYhvWyZFM4Z6hyK1oTS1fZTR6tcXpXBCuhbUZpDfPA
         vtj/DRX9gir9Itx7Tdfoxmm4SLYuzVgEGYK8WdhpIMKzBX7qkPxilxoRZNM3ro8hEoj0
         OlNe4D9R0jdgCxrauRvFnklLZsfa4VDgm0b34ByvsLqupe0IP3qU3Vf0MhXX175VwFQn
         E+pLOv7lp0G1kYrwF8IE57n2WsHU9LeQ3XjkLB2QoP2hqToozQlXQlKvG3oGJLPphrpb
         nY5ztHIw7h5N3MUMKb/NQs4KxMxby4e7g2GJATMRyIKDTnnNjZTAonFGFc7c/H9uj+wi
         ao3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788423875; x=1789028675;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MgOyUEIfGCWyeavJ4iucCikM9YF8g1HwJk3n6ykR+jw=;
        b=QDLJATyhy/gXoh9lolsfs5aDY4HpTN35fyMzYVs7VP5PNLCOLXA6L393GvLWAjmaI8
         kH2uzLK7X7A94haR/jcsXZM6VDAbA37pmybpcbnuilLjqb7NTj2x7kXs6Cu6iD8i1l5V
         Due15/SLUdlT0x95BMvGN5G7WmsqM6c11vLBMv5hA5irsb5UbuhQ19bAelyzTM4A99RJ
         tg+Q97M98zZZSSub5LP4YKAJq/ETEWPPHouhcFvyHHaYBSgNVMcA4FbNdZOdkct8fi4L
         +LHV7NayVPlUUgu1S04OM/B+KwLnHNSewjjZ9wlmVZtU5oSt5MIguL15j3vv6rGfPTEK
         rmXg==
X-Forwarded-Encrypted: i=1; AKwUvByURdNhbCLmN0sCb3xLkOlEv2rjAVke9pbbnju6/zmCvjwj6kHnI1vWD/o11Jp4uE3nkC4dIF8Ub1jzlRqg@vger.kernel.org
X-Gm-Message-State: AFuF++nipoI18sqE4cDdtI4hTuV37f4hr9EiKZ02WM6OjbCnTw7XOfyh
	35tKejdza2Ffk+WSBZRPF3mbJogukQDf/icV5MCDEyrWCX5jf835/LkY
X-Gm-Gg: AYBFou3Zke5GMRCYj8VSF6UGx2YkfX1yFilSqxGs3aWBPgZHTJzj0PVzY5QCeCZi8Th
	bo5a6SnnOjvnKSrvZnb1Za9C2p8q91jUw4FrftVIWC7YstSg+Uy4XxaJcZqr7yrylLNsgyDxMEm
	/RJ7UCn6KB9CDC13RMf5eGUrVaQNftdMDz+NvcZj0p0+cftfdFH1XZDraSoEX5zUzwzqLE6wMB0
	dW/H5EGCUhDsbeIq4+/0qTTsajTTXHfN7wyXheB/1XLDnaO29yXhMHr0LqTRf2NxYKLPLXTqk7s
	8WZgUy0xxtG+Tlei8/6KDjR5kkZ5+Cwg2j1fPJ8MBh35BpgybNmD2ELJhyWqgrZhqzwjuohUNlJ
	5PI+SufTfWUfchsqB+iI4Nzoa57EyZoMP6Efy/TsZzb3vqafe53joCatF6A1imJPweevSgimQ6l
	5V38Q2fIYkUIYeIDCNYrBarZy/P9skS0CuR4A4ugAuozNlCCVHcOx0T5LZVCs7U0BHuz8qD0hbF
	iC1Zygt9DSacw==
X-Received: by 2002:a17:906:c104:b0:c25:2cbe:edeb with SMTP id a640c23a62f3a-c25d5532148mr662129666b.21.1788423875110;
        Thu, 03 Sep 2026 01:24:35 -0700 (PDT)
Received: from [192.168.1.124] (78-2-9-45.adsl.net.t-com.hr. [78.2.9.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f42861c1sm63169966b.63.2026.09.03.01.24.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 01:24:34 -0700 (PDT)
Message-ID: <f81210b9-abb1-4e95-8995-f8ca1435583b@gmail.com>
Date: Thu, 3 Sep 2026 10:24:33 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net,v2] net: wwan: qcom_bam_dmux: account network packets
To: netdev-bot+sashiko@kernel.org
Cc: stephan@gerhold.net, stephan.gerhold@linaro.org,
 loic.poulain@oss.qualcomm.com, ryazanov.s.a@gmail.com,
 johannes@sipsolutions.net, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260831181006.1382372-1-sinyavin@gmail.com>
 <178838348238.3394541.9061693826070810058@kernel.org>
Content-Language: en-US
From: Dmitry Sinyavin <sinyavin@gmail.com>
In-Reply-To: <178838348238.3394541.9061693826070810058@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Thanks for the review. The TX completion concern is valid, and also 
affects v3, I'll address it in v4. The netdev lifetime issue is 
pre-existing and should be addressed separately together with proper DMA 
teardown.

02.09.2026 23:11, netdev-bot+sashiko@kernel.org пишет:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider:
> 
> Critical: 0 · High: 1 · Medium: 0 (1) · Low: 0 (1)
> 
> - [High] Use-after-free write of the netdevice's core-allocated per-CPU
>    statistics from the asynchronous BAM TX completion callback.
> 
> Pre-existing issues:
> - [Medium] The driver allocates netdevs with alloc_netdev() in
>    bam_dmux_register_netdev_work() but bam_dmux_remove() only calls…
> - [Low] Drop paths remain uncounted after the patch: the `drop:` label in
>    bam_dmux_netdev_start_xmit() (drivers/net/wwan/qcom_bam_dmux.c,…
