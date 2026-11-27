Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795797180;
	b=f+Ba9Gwx4b0ZWKM7LeKp3+Dp5h5IlO0TsNkCKcVrsCPSrwATm7CVGCZ+MmMb5Z74XBRM
	 GegYvM0eaFovwvza/pO/roEd187X4OO7F8Rk7vxxu8ESEmCj/gOta/KgrJCElqWGETmvq
	 SmmcDB3NLAiOnTkB4FXqgBDWSt2Vtzvo6BWTQ41Jd/F5NOgdoe+5aFPoAvQvr0yln19cs
	 YO4N+0IkqpvN6CqU/qoDB8ggqngNrmLqS1vzeJgE6VJaFtS9DnLdEbT4qmoRih77wBef4
	 IoS6SJ9I7X8RtcyC3psykcxvesmHySOtT0x6JvDmAj8DncAn90bAP5wAdDjV/gc/juw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795797180;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=ji+oVVz/nzpz5puo4DZe7HwzAlM3UJiD3cXKn2jhyog=;
	b=BLy+srftOgnU6YUGbfk/FI/bq0YgmoQNjHtsTpKKKefcdOQleFLyGdpOlDYwkD2yktRm
	 YGKK989hlu+KY6fNKn7vz2GsfToCS6PRlc5UQMULOsvCkowJK//vW9Ffhn9fZITI72W1L
	 U2o5+h/EcFH2vGUxkvi4gbrnnyzQ6cTk1Typ4JyPRU4xhrjIccfaumSdEXCaQc3KK/WNA
	 NpKZ/hfcSjuRduFq8v3UWF9PC5oADeLkORAjkgzk6ecJ8ZGuYUsI/OSfY+DupG8M8guwi
	 U47QSC/TnnoNLfQYolcklCHrEdW7kbuOCj1H9i3Lrl1BXQVx+2RQos3C7GTr4LwL6vw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="R0OV/R8N";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.176
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42395606A32D
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 16:33:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42395606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R0OV/R8N
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-9497a167a6aso1065013585a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 08:33:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795797179; cv=none;
        d=google.com; s=arc-20260327;
        b=fPthjVBlTjh26TSSu1dPEGmD2Dqb176Ed0VIXjBp+BdadSj6qq0nMXnZCah7eLtEdr
         7UQ8loww6ygt5WtcRH7/A9v9vkPm+A1ouvcolGl/hirtS9vfVbrmEfOZpGIfxuZsY3gU
         SpsFBcirevT8B6t7xuoSgtcoSc+SMVVGA7VrtSNzNcENDGQQeXi0IFT90ks2EX+7UW46
         e23Rh2AXMiXvtw2yL5sILWqg/oNzCMn45M3Gjqw8vXzngd7UK0rikO8mR3aRfge2ISv+
         xpNkzMC/sD98yyTdrsYTyqQHd62g7drYvb0NmYhJ/DYQaFYxRUdi4kV50pGmSpEp7ioq
         02MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ji+oVVz/nzpz5puo4DZe7HwzAlM3UJiD3cXKn2jhyog=;
        fh=elGfEZAM6+6ZuxoQZ3vEfwlsF/GOwiXob7Mh46df2GQ=;
        b=m4mzpw0JfljN0poTI0h3X2IVUZOmWGBWF67z8MzyO/DD9SJoYui73rii9ywitlNHuX
         3qHlAiEtaiWflmZHNlXprTKz+bupiZeWLMi5HsVm7WDK00FDmZe6uUZ4Lh1v6njVvouf
         +UXXotAVw/tm2n/AZ3RhgnQRPRJ1uv4YlX7UvOotTywHQyFWdaAcBYfZY7iOSK7oSgIG
         hb07YLMnan3LqdnqYaDDb6T3OUAi/lQQDoxtaGRbG9ROrn6KDf5oUIGiw5BwspkQS4b+
         3qWBWnVFggl1KhMxX0kElXLTRAhdlZ3ga9/imkJmHvMBkMK6i6rtEHoKWkfUCZ43ZxDG
         QD5A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795797179; x=1796401979; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ji+oVVz/nzpz5puo4DZe7HwzAlM3UJiD3cXKn2jhyog=;
        b=R0OV/R8N3BVXXKY1j0aTwOiPavF7AId5koBfS3gHaU4jEr5HoP+Tj640rwdSzLgRXH
         CGvg2hqLOF9uvz+3E5CeSvTj3enmbqX+80sdsC35Zd7qOQo+aGoPD10v5P1GRogm6G8t
         SmBwu0rJxJRYkL0DIta9tRVhidpGkA7hnA3xNd4BY/X9OQ4C6SCSxLW+Mjdj89Br4mTx
         WRngpZCi2qvPMoFP3fI+CtwSkMcv4e8jOvO2SlpMmWE2HLkrx5kGzmbg+muJAYWduDSB
         UJoBL0pXIs27FYQQEEXDxE6N5YTsacs8zFatD3SuAWjcsNLfNJ3jCy9LLMzfXNd31Khx
         I4MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795797179; x=1796401979;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ji+oVVz/nzpz5puo4DZe7HwzAlM3UJiD3cXKn2jhyog=;
        b=QZxdKtRVbzu+/6n4C7byEUWIf5YggLNyiyyQmWAn9xtFwWAW95KyYhgZBserhlTTBX
         UjifbnCQST4EH9OR77g8lC5cqJV2OO1Ux7EerV9KEsUEuXijoX7V0QO7QS+wFAL0vfNP
         wvJ7YExicBRL98WNxhTar2uACNyraT8dJe+QW5Lr0pmil7BDgHQKR5f0y5cnXnE/nkqc
         QZkRA+SK09E4KZBaQuIaeejzyfEsPpfz1Sq2uWGyNvwewpeivq8r5FTacDPnqv0Qu8T1
         /eESe0rX4ZZLUpbZwk4Kf9iC+f9T/dOST7aPm1B5FI82UtJ59k6h453gA8Fl4E4KFPb2
         P3ww==
X-Forwarded-Encrypted: i=1; AL+hErEa63jzTvZK+G+i4BsPTW/DwGtByWJiSAJpW2Wwkr1Bqt79KJESF3vsfxH2SjgvcebF4zZbrCWDMOEuYgEV@vger.kernel.org
X-Gm-Message-State: APuU4Z+28qvPDgN9LFEYDKOV8wmL5AuzLXYSl4UEGAjy4ytd8GLOk7od
	QSPmJ9u4HkBebQfftLwb7oc1nofSPlElVhg1/DeGnjB1ICf9+ZSjBMFV9uohVy6dCwmU+Ft+m+X
	Pswo6NPCCL5B4Pl2o6PdmjdkIehqENOU=
X-Gm-Gg: AZFdTZcnp3SrCZErs84Rp4oWAls6Zi+ovTxcK8qdaltPpsaghd5clJ11Pi8guJl4ok4
	xO+66Xo8rg7vKYpoA2DxYXemT9shTcX+t7lJ88YUvs7FUtntgWh1FYtfpXglU4zHRqFXQ7T6flS
	dHEZUU/JzUNrtziSQdsXokFqIroQSXe9GbtY466kQACwP+GBjoTdhDB7G8TA1HomW/+CIPzkTkD
	7qy4lZljgURNWyaPwBJX6ISMnUcxWjCBgcgeF8jk07S2/TWtQ70pEIqn2AuCKoxQyl0x9RXzfJM
	/Eci9/M+PF/D26d7EC4HiU6QVH8uYy81QRR4Uyp5hgZ93T1dK332/TkaGYhZlMNoosqAKQUiTTh
	4/E+zmVB00sbBwxk5Mp5W0D/K8PVIrn1a0CFtxTtJGYt/3cr5FpBHPBbTjXVMTSOXnnE=
X-Received: by 2002:a05:620a:1b82:b0:946:1dc:a276 with SMTP id
 af79cd13be357-949b35ac8d5mr4672679685a.18.1795797179191; Fri, 27 Nov 2026
 08:32:59 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <__OIHsqpwOqb8kxVYcd2PoPvNYDhN8XO6vyXiYMCCK6o3sfyJ1gl1GNdhcGYhdfBf43tQmn6Dt6cWXcSD1uiPA==@protonmail.internalid>
 <20261127134507.125513-1-hikmahgumelar@gmail.com> <012855be-7a95-436f-b0ab-11ae3134ced8@kernel.org>
In-Reply-To: <012855be-7a95-436f-b0ab-11ae3134ced8@kernel.org>
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
Date: Fri, 27 Nov 2026 23:32:48 +0700
X-Gm-Features: Aa3M54rpV9JJE-D1PefPa0XgKPQ9lDOZXhSn9zQqqor1iBHttCk79es3V0AufT8
Message-ID: <CADA=zOPWzK7Rq+CwY0izzjYdXGvTGKdSZMk2OUgN6_7oYV2xng@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] Enable front and rear cameras on Xiaomi Mi A1 (tissot)
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Bryan,

Thanks for the review and the suggestion. Splitting this into separate
series for s5k5e8, ov12a10, and the MSM8953/tissot changes (noting the
dependencies on the sensor series) makes a lot of sense.

For the gcc-msm8953 change, I will drop the board-specific reference and
update the commit message to explain the basis for using P_GPLL0 with a
divider of 8 (including comparison with similar Qualcomm GCC drivers like
gcc-msm8939.c and verification on MSM8953 hardware).

I'll re-spin with these adjustments.

Best regards,
Hikmah


Pada Jum, 27 Nov 2026 pukul 23.14 Bryan O'Donoghue <bod@kernel.org> menulis:
>
> On 27/11/2026 13:45, Hikmah Gumelar wrote:
> > This series enables the front (Samsung S5K5E8) and rear (OmniVision OV12A10)
> > cameras on the Xiaomi Mi A1 (msm8953-xiaomi-tissot), along with the required
> > MSM8953 CAMSS clock fix, sensor DT bindings, V4L2 subdev drivers, and SoC/board
> > devicetree updates.
> >
> > Changes in v5:
> > - Restore missing `select V4L2_CCI_I2C` lines across existing camera sensor
> >    entries in drivers/media/i2c/Kconfig.
> > - Move ov12a10 Kconfig/Makefile entries from the s5k5e8 driver patch into the
> >    ov12a10 driver patch to preserve per-commit bisectability, and add
> >    MAINTAINERS entries for both bindings and drivers.
> > - ov12a10: Call pm_runtime_enable() before registering the async subdev, add
> >    v4l2_subdev_cleanup() in the probe error unwind path, update the active
> >    subdev state and return -EBUSY when streaming in set_fmt, add the 35 ms
> >    post-powerdown delay when reset_gpio is absent, and match the initial
> >    V4L2_CID_EXPOSURE maximum (3372) to the default mode.
> > - msm8953-xiaomi-tissot.dts: Move `vdd_l23-supply` inside the `regulators`
> >    child node under `&rpm_requests`.
> > - Include base-commit metadata via git format-patch --base.
> >
> > Hikmah Gumelar (7):
> >    clk: qcom: gcc-msm8953: fix csi_phytimer_clk_src 100MHz parent
> >    media: dt-bindings: media: i2c: add Samsung S5K5E8
> >    media: i2c: add s5k5e8 image sensor driver
> >    media: dt-bindings: media: i2c: add OmniVision OV12A10
> >    media: i2c: add ov12a10 image sensor driver
> >    arm64: dts: qcom: msm8953: add CAMSS node and MCLK pinctrl states
> >    arm64: dts: qcom: msm8953-xiaomi-tissot: enable front and rear cameras
> I recommend breaking up your patches in three separate series.
>
> 1. s5k5e8
> 2. ov12a10
> 3. SoC depends
>
> with #3 depending on #1 and #2. As is you need people to pick up patches
> individually within a series which is always tougher.
>
> ---
> bod



-- 
Best regards,
Hikmah Gumelar
