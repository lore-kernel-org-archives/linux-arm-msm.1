Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794483660;
	b=GS0eR6rdo54WP069uNbNfM8/kC6/xswrhZICNtK/LQTY8ZhgukWmaL+4AL9AzOxjp9nB
	 LLiIHb9N6YQRKaOpaAIOU2lgqfjCy7RA0ueMKAEvoVEFSvDM+FSmZ3O4bUvsaXX+rRGNZ
	 ue49gE002ANMXbIp3I32Ggg4WO4qvror5sYdT8ULl1ZKXPCIdtZZS4CaZg18G16t7wGld
	 PgnmIRh51kOYQFZWpMniTMdM6N1tJYdMkvOYKmIgHvPXwwz0H2v6D+c9KoN94tZnRAd+U
	 IPP2zDCFE5oFPXf2I+hpBSfCF3MdnxI1rE/nV055/k6y1ypNbsDg5ej7efo0D1faIoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794483660;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=gd5qaOSUVWh2d2v6VyXcOF3/P2fT705qxQ3nPfB37vE=;
	b=Xr4meHrIN/pSaYYOi9EnQD416ivJBPp/9fvvY3mLrtEUA/cI3LW1u5s9oylbftNBcku0
	 OpY2eK3e296Kmim7TvkCJcLUV/Y9zWahzmnjL17wESGGP32EX2Un0XPmwYpciHiAVpUyE
	 ho+Qcfqmbpu0ILTAFM4Ukl1/h30FJJfSwjKEju+7QI+x+oUSf0pSWXiXPss0ykcOGCHri
	 IMmYGpdJLxYsOx1hPt1ijs4x7Igq4VNREn+N3ZkHgeXq4OlBSIiWr1I8fVD45mwGwAPiK
	 Wz+mo1CqAWIYJJu4051EEyJhP5FlWwtwWg7wyqcRcHMqUzWlzlouKuAtI0Dd8c7qUQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KEmPplNn;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98BB6606A8B3
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 11:41:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98BB6606A8B3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KEmPplNn
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-37628596783so4188134eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 03:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794483660; x=1795088460; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gd5qaOSUVWh2d2v6VyXcOF3/P2fT705qxQ3nPfB37vE=;
        b=KEmPplNnoiOlOa7kWqvKF07gxkGykUViIUtmPh+kP7nQPzhyUQI2a1DrOFo26kA+FN
         C9UmWiuEgkum7U3lnZF2VFTEPJX3p4Ml61IrlT+cGHzD8hsnZNObZ95CR63hz98/GdN6
         oVVLS/uTLJOs5GgM9aOpfrcCHJAATOXLlBLr16lks61jshecz3PHzThBl0mKt6RU4nux
         UWdgHb+cuuerQdqnC2PXOfrZbzzzfXprb4boxxMY5F9Wz3GGu8Xd/EcnThJ8SnNGD12u
         N18W9NAt3u7Q25ugmUdER6ODPxbAGOEuAUNq3WrXdURkhdVsz7uqGd27gWnkRxKiObNB
         +Y0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794483660; x=1795088460;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gd5qaOSUVWh2d2v6VyXcOF3/P2fT705qxQ3nPfB37vE=;
        b=GV/TxjHn0b2fbNYFry0KPzb47h/75qnlKff5l99QWb0kptSqitCIB1wu4wJq/n7/yu
         SLqwt/BwpyiSdpZ5dOOL0FRYOjIgPMPBUt/E+HW/5N7ozy6Hs1iy4X0v97gCy6U+VqEI
         L/ssDDsBIFGKZ14IGjWyNmCW8GiGVBhIHAGepi/xJrcYvGhNcXP555x4S9HEpIYDIRqc
         9EBjhHu9s3ogTuoMnEs/WJyXIiEN6MNUKt4xmTxPMnU8I9iWbyBKYQt+hSGufbjEaWcM
         fEP2FK04Hyaithl2lHEcGU7h99e3NRUONpGGGohgp1kEuQ69P25toi0/zcohwMJHQJMj
         yXKQ==
X-Forwarded-Encrypted: i=1; AL+hErEdDvs8u+CAjxuoWBxF0ln5P73VjRROlj6JKm1580fBefd+s2AmcAXaIVkT4g5RkMpkd+C+8SUDPyGhQOhz@vger.kernel.org
X-Gm-Message-State: APuU4Z/Poxh5QcM48AHe5P1Sy//yIK9Bc3swjtrHiyg2us+fICD1FnIC
	StXTbwnzqWD3kQvgAjh9N1ZhDZ3h65VO3NB0md0qDry+WPxPboWMNx4Q
X-Gm-Gg: AYBFou3HOngmJcmP2tPt4p0MoJ+M1fso5zX0I7XzqEXNMq0cWIzh9hLhepJoNKCdDf1
	PnG8qDX3OI+e4/BZUUkqcolT06k9PXt6+jj+uCAUbZ4vYeVeijTp0yKplIpuDeLoYuruU4iTbKk
	JIf8bQ4uAdkDpu22eURqdyXLAeVtC0v7ldTS8YXiKn7+JXQTQeqm7Y0GnqKPORuZESc2Y3wRgoJ
	ZHHqYDnye2djMuJUGa51No4pSK+8vUpXTbFEgF089UqvV4wrEIiyM99IdqmAxFTn/vUXyPCbedH
	WsHHRFHDAKSEpbb6ZcqpICE6Taju5MlupqOVjuT3d9DPh+0jfTzuCZL1V5HTxDTukuLJZMSqJIp
	CjN2C2BLAwQucZz/sUhXgSdj01x614v43DL1jt4085PHUvGCr7NBrl2NfxaTbRiqXxQXbWJ36mo
	CGPKqojaIefh9LW6fjuelIibMMaOqjshmPAnyUvGRiGSlNWbQQISo5g4E86hZcS+P9P+LbCdzNU
	SFTI57zafTno8f+ENwp8k43OQgPdF1zkn6GRMeZSkI9ugnztiOKNZGZUuG920IWWIsdWB1MZf68
	bhT4kqf2BtMDR9WL1vAT88YDBzABsq91g0HR72FqS1UZ/aRK7ZjVCVx0IaGK0oU=
X-Received: by 2002:a05:7022:1184:b0:1b2:6b1f:1d89 with SMTP id a92af1059eb24-1b3c0360627mr4336535c88.36.1794483659738;
        Thu, 12 Nov 2026 03:40:59 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([180.67.33.100])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212ec002sm29245380eec.26.2026.11.12.03.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:40:59 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v4 4/6] media: iris: add platform data for kaanapali
Date: Thu, 12 Nov 2026 20:40:58 +0900
Message-ID: <20261112114058.428-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261001-kaanapali-iris-v4-4-642f9ac5e699@oss.qualcomm.com>
References: <20261001-kaanapali-iris-v4-0-642f9ac5e699@oss.qualcomm.com> <20261001-kaanapali-iris-v4-4-642f9ac5e699@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, 01 Oct 2026 20:47:24 +0530, Vikash Garodia wrote:
> +	.inst_caps = &platform_inst_cap_sm8550,

I ran 8K streams on the Lenovo Y700 Gen 5 (TB323FU, Kaanapali), on
v7.3 with an earlier version of this platform data that also uses
platform_inst_cap_sm8550, plus local line buffer fixes for 10-bit
output. Streams of 7680x4320, 30 frames, made with ffmpeg's testsrc2
and software encoders; decoded output compared against the software
decoders:

- HEVC 8-bit, VP9, AV1 8-bit and AV1 10-bit decode: bit-exact.
- H.264 decode: 2 of 30 frames output, nothing in the kernel log.
- H.264 encode: 3 of 30 frames decodable; HEVC encode: no output.
- HEVC Main10 decode: reset the board until I applied commit
  200473c198b2 ("media: iris: Fix iova allocation from restrict
  region", not in v7.3); with it, the session fails with -ENOMEM:
  the 222 MiB co-located MV buffer finds no contiguous IOVA range
  after the 11 capture buffers.

At 1080p and 4K, H.264 and HEVC decode and encode pass, and HEVC
Main10 decodes bit-exact.

With the SM8550 instance caps, VIDIOC_ENUM_FRAMESIZES reports 96x96 -
8192x8192 on the decoder and on the encoder. If H.264 decode and
H.264/HEVC encode are limited below 8K on this SoC, could the platform
data advertise the limit per codec, so that userspace gets an error at
S_FMT instead of a silent failure?

Thanks,
Joonhoe Kim
