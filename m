Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88498190473
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 15:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787842853; cv=pass; b=jF2snuu1xOg/iFbk091rf5eFDwGIp/dDenCYZZO1HlNyagWkbubfGRbIDticF3IyW3WQzrds9cAX9PZNo0jJEyZY2lu1WbaDcFOQR6nhrYsA4fiMyCMoL5xpEptfPpPb0l4wfrHxBbAUOkQUN11ivhK76PZ88Q5r9wcnTpjbcfY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787842853; c=relaxed/simple;
	bh=W3Ab3yphKMxYz1/8CqZ7FpqnITfODGN1+Yw8aaRTaYs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jOHiSHOOlOguUAG7+IPGH4/Yt4uo9B3Pbv2jYmVeW5jKvlL0pyKld9ZUwi/ca+K6xyoGxJZn7vQKHWcqy6/4kaZkS+JQcGiocrNa6Jsjs7t/qt+ITDKdpiZV2bkiNGsof57fObG2kNCu3etOgIwzpK0ERosJ934ISZv9cUqWAkU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FTBYnCOT; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FTBYnCOT"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6a5f91ae397so10992a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 08:00:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787842850; cv=none;
        d=google.com; s=arc-20260327;
        b=LfNXYTaOWS5WdZO7zfr3LoV3oYldG9tdJUx2rWTcku89dJvjs+fsg++mQPtPa3vnxp
         1tGBXVOsUx7KmEIlCtVRlkLQpy/JzP+2e8NfynOpxrVr0Vq02rM47FqBYDrcRU4dSM1s
         NhLdOZJX/InrlxQx6gz5aM6y9FjlOTth6ELDSjoOrupXC8hbfqCf2Fh13YtSiQlkiGjn
         a44o4kpAhoFnynw3hw3VzahTv6j4wEhSTVviP18CPHFuZ2pslfZWfDnLP65TxrFVJuY6
         cyMUlZMSeUjSgXTfBf2rTshHkBCDMkno+JPsgN3Yv7P2xYBZ5A781b86YAZgYBlUwl3H
         WkNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9lxairpgLiXIXVMdCgp5oBtZGa2taxpEkryecJUmNAE=;
        fh=unyMuEBcQ9eOvoLScSz5JLosbkb1m7fjF6+23zlmAqQ=;
        b=oi80Zx8J60TWnsHgDjmoSxBg11N1QUAw4IBd1pbNRwEE6j7N/ZWTxG4MT9Ne0kb40y
         PecR3+EvG2qY8KmGfTcXa7idn5vSnYh1vaBuq5lJ3IPcXSSy38q9s/d+kF6hL0p1bPoP
         vadeoWu0jdeZyGMQeIXuShv9JGym1rsgaxEIBtovbZlIPQB0plugTpTpVbRHvyCk6t52
         HR2esO4OQ/a3/D5BgnynRoyLy484kqC6woXQPLF0Pl8f3GnHxDXmKVNzY0eeNyOtvkBZ
         pPRXhGa5mrXk+3nptkr208gdmmsLJ6mnv+kDjMId+CUB7RQtDedxa+/vTDNRlnifmFcu
         dJgA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787842850; x=1788447650; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9lxairpgLiXIXVMdCgp5oBtZGa2taxpEkryecJUmNAE=;
        b=FTBYnCOTFSYAy9fcUuWOAxKmDG0//9508+Cd2/6D22TD5Tl3UpUQweerqMRpUnC5uc
         MSD7Sy6U3P++ovtKDcX0I492ZKxNl4GMqmLNEDMvwbECSqkqXaN97cWIuz3Yv1vcGc/7
         nqXn3sspJjbIaHFEiL/wdIFSE73lOIoMOZHjOhvKDA3AOEsSbE2PiBSzmf7608hnM+8W
         ZiEMMZyDoBLpf0BdKRqn55w2gCi9HBhNI0JuaHMQiTBxLSw9QMURu6jTAtkc5nD33Mug
         ZFTSEpg1PIEVi5mBqmal5a+Tfc3F7nYrHVU1CMbGgw+YholHHYogzJ1XzreMmi4IEA1x
         qhvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787842850; x=1788447650;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9lxairpgLiXIXVMdCgp5oBtZGa2taxpEkryecJUmNAE=;
        b=Uj6VOTD12kfgQr8KqE+K+8aEadGzTs4jFHngT3PR21Agz4CnNKIIwlSO8IRYkh3FgH
         jimc7A7kyPq0FnYVaNkyJeL15NFqh8e9DwG/ZpWxGB63zkkdyu6J3X3fzC7/lareyGw7
         QB2eEU0VF2Ywsidgl7a5OvJ24nod+U6aIUgSMG1vzziQhrNvZ5Qbo1O+YUrELJF8xJWe
         9GIY4ui1nfvPypZPgCsRpY3hUEQd3pzrpSZQOYFzbYERISguU3Uwf+3Osvo7d9dT1lt6
         XEfbfuSBSLXCcBAMmkPSA+fA/RsE1WYaLI5mRxPFgX3dcjvoNEh1czry4wW7PwprGdmo
         7WWA==
X-Forwarded-Encrypted: i=1; AHgh+RreFN7Bd/YbJV40LnS+d4Y20p9/Co76tinRMuuDLfv4KdMiKJpUF4wTo4zdVA7i2NaKKkj7lbj2lUmpWnrn@vger.kernel.org
X-Gm-Message-State: AFuF++m9lDf8kfI3ZXs19NigYYQlk/dfPxMihMVCgarYofQH0h7m/+3e
	v6XeVpVmKazWXBPC5STGe9rMzCOpWVNTEhISwpiHvIUYmNkvS8knXcL6+sMLZUCgU0ZkLOz8BtS
	CwX/ks+GS9FH8XBHgpx4Myk5YQ8rIYNvb4c60Sx6G
X-Gm-Gg: AR+sD12BYgFtJO2NQDxXtt7QQUCcV0RkLsqFF/2TdbT5QX/Vz4b+U7T2rCwBXvf8vWg
	F4dyTOGpTo2L7fb4tSnWt7JRR2eWp96y/eJBoSHH8SJ2gUel/b98gCwBjPsjIG/DDhjkqCmqNBb
	D4sfWeLaV/IrSardR2dFx7MnPmY0Fqt1Gw4ZttJ/AIcpl8rx9Wa1epqfAYOquoo8HsSa+hmU7VK
	pHQ3G1dQNybwD5dhUFFYju3v4VoiWHlwruJ4Fz3YSe24qSGoTHa0EhtPdjt5+CnUXmvqlGLYt/M
	lXiYanzweLtSVO0c1bNPYyXiD1OQR4G4WVqUCkz35v1uTw==
X-Received: by 2002:a05:6402:611:b0:67b:7d05:60b8 with SMTP id
 4fb4d7f45d1cf-6a5f5647937mr53711a12.10.1787842848394; Thu, 27 Aug 2026
 08:00:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826134048.854748-1-larisa.grigore@oss.nxp.com> <20260826134048.854748-4-larisa.grigore@oss.nxp.com>
In-Reply-To: <20260826134048.854748-4-larisa.grigore@oss.nxp.com>
From: Stanley Jhu <stanleyjhu@google.com>
Date: Thu, 27 Aug 2026 23:00:07 +0800
X-Gm-Features: AcwNN1UTquEpZeWJV5own34vt8ybBkfXz7pYThlv5e4VIyfdz2_DSFDAfqeUnxs
Message-ID: <CAE14pddHBP6HMihTePR+-Pqhu2DKjVgRA9++5Epod6TOCLagFw@mail.gmail.com>
Subject: Re: [PATCH 03/10] ufs: host: Add common Hibern8 TX FSM polling helper
To: Larisa Grigore <larisa.grigore@oss.nxp.com>, NXP S32 Linux Team <s32@nxp.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@sandisk.com>, 
	Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K . Petersen" <martin.petersen@oracle.com>, 
	Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>, Ajay Neeli <ajay.neeli@amd.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Pedro Sousa <pedrom.sousa@synopsys.com>, clizzi@redhat.com, 
	aruizrui@redhat.com, eballetb@redhat.com, echanude@redhat.com
Cc: linux-scsi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 26, 2026 at 03:40:41PM +0200, Larisa Grigore wrote:
> [...]
> diff --git a/drivers/ufs/host/ufshcd-pltfrm.c b/drivers/ufs/host/ufshcd-pltfrm.c
> index c2dafb583cf5..034ee988924a 100644
> --- a/drivers/ufs/host/ufshcd-pltfrm.c
> +++ b/drivers/ufs/host/ufshcd-pltfrm.c
> @@ -563,6 +564,84 @@ void ufshcd_pltfrm_remove(struct platform_device *pdev)
>  }
>  EXPORT_SYMBOL_GPL(ufshcd_pltfrm_remove);
>
> +/**
> + * ufshcd_check_hibern8 - Check if all TX lanes entered Hibern8 state
> + * @hba: host controller instance
> + * @num_lanes: number of TX lanes to check
> + * @timeout_ms: timeout in milliseconds for all lanes
> + *
> + * Return: 0 on success, negative errno on failure.
> + */
> +int ufshcd_check_hibern8(struct ufs_hba *hba, unsigned int num_lanes,
> +                      unsigned int timeout_ms)

Hi Larisa,

Thanks for the great cleanup!

Would you consider moving this helper to drivers/ufs/core/ufshcd.c and
renaming it to ufshcd_dme_check_tx_hibern8()?

Since ufshcd-pltfrm.c primarily handles platform device glue and DT parsing,
polling M-PHY states via DME commands would fit more naturally in the UFS
core. This also keeps layering clean and allows non-platform controllers to
reuse it.

Additionally, the ufshcd_dme_ prefix would align nicely with existing DME
conventions in ufshcd.c while avoiding potential confusion with
ufshcd_is_link_hibern8().

Thank you,
Stanley
