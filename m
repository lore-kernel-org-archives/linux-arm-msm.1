Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793885723;
	b=lZWluItJAqhKABM25zP32ovdTPKx5Jf5GSnsmIK5LhyLLNFOvBwwo409taHzG42ihifc
	 U9UJRZcHYP2btmTTE2dnYFRAdLrA3EwG/FWI3gyMLhb+PPGaiCztyc/ZjPdpHMF7zwpbB
	 FpI59t8vShDBlJVw/ha+oU1OVre1UrLIBUfJ7797f78SbJBOjLsqEye/gqTgvCUm8ePYU
	 uA/xkapDNLlfKgl5II/JsqOrYRKU9lvRt0HFbfcz4eZf357CxO6VZhua6L1c2e1yahmwS
	 O7s6weUy3Gxa8MRRtdRs/gEij0PHL5nLlg9rl5m5U18Qhz1M8qUEWj5saT3NTp3IN6g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793885723;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:From:
	 In-Reply-To:References:MIME-Version:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=un/mirF/YwQDhny9ifbt8IaNHDK4E34ldwmWHRru9ic=;
	b=NuLjhD1X5AFzPyS1pMfK4ArgZ5PbdoCrYD/sF5PT0PORaGUo81wqrObyfOfirHu0w73A
	 3dHsoWhEWEdkVPYRDGIqpyMb17SgZ6MBvs06zkc9SM7hSyNxU65IafmkUyPsQIMKbhUVe
	 ud7f3gOaRKaVwDBLJKZIm+NHOtgEWrWjvkvIbxo+nQ1BEUJg+xbjMu5lkFDaSmYpf6ilm
	 /An5M+GOXvlFoEOrxdoJE0WQwWKNfGbl3aEufuZc1nsU2SF6LIfLo7exY8SYJrkk99SH4
	 HM14yXiCkLm6JV02lxvCO4QIvk81J+BQoGm05Fpg1tsiRTNdaH9nAspaNdoFkl2aanA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Lw8/kRVp";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.42
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341BF606A326
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 13:35:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 341BF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lw8/kRVp
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5be47aa555cso1622515e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 05:35:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793885721; cv=none;
        d=google.com; s=arc-20260327;
        b=hd0dg9M+wnopJ5x2dolb/WoaNEiwa2OIerKsFCeHBMq9vNpbJ9rtE/kE1QyLMTkjOX
         EUD+QskRaKhGiJO/L8TndirKcTdhw3JnNUD0wGYfD30ab5AKaWdRpiLt6miiheY//KQ0
         VXifwOi1QoExH9LW590S0zmHpZpaaeMx9Mw2fYEIzHJlBBf1KBioHCirSnA3BBeERi/D
         nlsAT76rHTh8KMwrxf7/k4oynEKxARuSWRDfXOYNScFP8kQ64DjLAv0uAeFRkLj3sGp2
         CpDT1q+lfSUu9d324by3m/OQXPfN2kEi2bI/mmcmduY4ryB0tPLfTi74iK03uSpU1kCN
         pe2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=un/mirF/YwQDhny9ifbt8IaNHDK4E34ldwmWHRru9ic=;
        fh=gZkWN7N24A9mcSE8SQ2m0iViyUKtDxNwad/X3lMQIrU=;
        b=JiMQutzc4L/sLhWat7E7YmqM0AseZRJwPVxv7+c2ozZFj6kdiQ6ZDqxot+iOX9vW5K
         w0YsMegGrmMxcdBRgTxsMdYyGBgMBiLpdKiyXF3OgJYD4NiZZW0ACDKZNjBiSxApJuvB
         MVnt/nPDY2SpdTj009HjfMiSkKl/4hcejPXPTPqBmyT9kIgJVYkI34bZT1ink2FMIv78
         BMrjSJH31irhtST3w5jn++jHeZxHiL6/0azK1PRp9ivb2UXRcKOtsggN5oXQ1WNwR76t
         rECfm5GBtJKXUtp78EJStXrFrLF/9TOepy3SnqzF6E+UIzOUYsHCeIe7N16fUHDFyVG0
         c+dQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793885721; x=1794490521; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=un/mirF/YwQDhny9ifbt8IaNHDK4E34ldwmWHRru9ic=;
        b=Lw8/kRVpv6LXuYIoaEpebahFoBr5aZQ9ihCcac9DQvQxhHJG5f1yXVdZ8NBn4iE63/
         My3JqwAGB4UIFXOtrNZsKgOeA8JZ/rdoi76sgNCs2PLA54x9NlEkUmAVpD6f1vyTclJc
         S7D//LCPa3lVO2Uwhj5G/hcL84G/9pYKF4FKGgBrdeaXQ9UnLHRSRlP66dOGALU3sqzm
         mqPb5VryuESGKF4Euwln6+MbFDyMMyW52Nhx1nT3YFbNboOekkWInjSmUKb18OZ7mHMj
         4WULOQsGIykLB+7IJQVJmMStu5vP61LTGVsjm2S533e0uxSeTSrepdB5szUtmb+Kianw
         LlSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793885721; x=1794490521;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=un/mirF/YwQDhny9ifbt8IaNHDK4E34ldwmWHRru9ic=;
        b=wldkG6Bfm39w5+2OFX3Gwb7D4NPSHL9A8xY0zWgrqa6gEcyrYzhINjVHvoDv1rev2u
         ZjtPA8y+tHVTQDDwN4BSqX2RGg05AQEoqjqRnUec3/1J5z0+cf+6JgTc3TSFmtSeYHL+
         oArU6bUdwkzxpEk9WbxqHF5vZwaYanS3b0FanW7co0R36tCtU5XQna2zb6WsFF90+tmu
         cOlWipWZP74Aqsgz3oTrN43qENMGaCsHhafTKAy2NgIQILLrq/eIAdZ/b7GHtG9iCR1t
         sB8xKWAdkUXWyh0dvMxWOwwR0SoRKB9IiMwCVUwScJc/+Q1pH8nRSb8fbvhBaLl4JBaD
         9SSw==
X-Gm-Message-State: APuU4Z/4zuUcU3pLFlisO3pvEoOOcfOc6F+/dXAju9Psym8msEAbiG2O
	3A9Zksd0KcMlAIhwKAE7R9c9lqPciblnDJLg99wbwNqU4vgo2UvC+edLNfdplbQNNPE6xxpmVE6
	T1zMIz8btzvfseGpZZxKVDw1kyhToxrTFDA==
X-Gm-Gg: AYBFou0B5+V2yzs1UAAknjZ59yh02gpc0GcQYKS0Q41J5jMkMyo435ETuHdXYBrJjt4
	rTFH8jOPMYjfLylRbXYc47Ptwn/5eAQmRtthnnxzzmIZv8/WMnmXFI2YJtHv18nsS4ptMflUkr7
	nwF+ocTH8KLfbT0pwr2uZJcxsRVcBdXUJNmeV1j62kfA5jnSbG+9B4g9IIUxq5WPsHfjSbkRKhA
	40RbfRIFkRt81mk8C/8TwU1+Z2UB1iaASC3keMAD49l8U4PGGokULsKVRMoVv4K60AdWvSDohp5
	IY9BEvto74ARV6d6GalO4rFXb7LIrOfEAyCRe2AjnGe73+8Us5kg5U01OPGh7E+tVirwY1HjuIu
	SfzX4WbR0Qyy10YsFfAca+92G2lBfRMxU+8PY
X-Received: by 2002:a05:6512:39c1:b0:5bf:d2ec:904d with SMTP id
 2adb3069b0e04-5bfd9563095mr6994195e87.14.1793885721088; Thu, 05 Nov 2026
 05:35:21 -0800 (PST)
Received: from 16659893159 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 5 Nov 2026 05:35:20 -0800
Received: from 16659893159 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 5 Nov 2026 05:35:20 -0800
From: Steve Meek <stevemeek82@gmail.com>
In-Reply-To: <20261013-rm500q-db-burst-v1-1-bb850d54e2c4@gmail.com>
References: <20261013-rm500q-db-burst-v1-1-bb850d54e2c4@gmail.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Thu, 5 Nov 2026 05:35:20 -0800
X-Gm-Features: AclHuK_uyRr2JFV4uyjiNutcKI3LwrFFfmjL5VbrHIy6nDY9T6nQp1olD23DFVo
Message-ID: <CAPzME4ZmwuXDRAoYDqi7et2q=f1QU69g8ZUrocS3rZn9ajy6+Q@mail.gmail.com>
Subject: Re: [PATCH] bus: mhi: host: pci_generic: Disable doorbell burst mode
 for Quectel RM500Q-AE
To: mhi@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Mani,

Gentle ping on this one. Happy to resend or rework it if you'd prefer a
different approach, or to send the traces from the stall if a core fix
would be better.

Thanks,
Steve
