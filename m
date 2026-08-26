Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D14F44780D
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 14:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787755282; cv=none; b=fj5HXK654zRkCscxHDDZh5ZX2SyUh75ls6pxuw9FsA3s2QDTbnOv2JDLR0AkNrM47FcWIN3sRwvxXJNwh6CNRF+iEBmdUKcAWQW0e0C/dSaHo/azODD3UnVNsNF+r5IAOcuPuSMcPF5NXtsL/zzX6ElQ1WpHKag310l5B0DArs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787755282; c=relaxed/simple;
	bh=38ulmt4xq+ksW8krj+T3oRElOAiMeGlxgJwWv/HNTLc=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KU/AxmtHebnj7HJdMye361rS9t+vTS208CJ7kzydOMyknjxRywSa5H+i7iCRpcbI6A2VZl/zc7Jr4G7TRuEyhXYS4XRQTBN9h6b5LxYy8+vcjTMgIiRPQHu5TSAkZgG019/4EkfkBuyWIdrx3D6mfKjpTdKJRnu3jzUgrpKJpuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oWOAWoxn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oWOAWoxn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF5871F00ADB
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 14:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787755278;
	bh=38ulmt4xq+ksW8krj+T3oRElOAiMeGlxgJwWv/HNTLc=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=oWOAWoxncL4VASYLAvYM4yCDGKxY04ms7bdXhMqqDJygkVyLNLmE6EAssiuhVkJ7R
	 oHLTzEkBSNNbdd8x6G/xBXvxTp7OCeaLgx2j93nECKWcxSLs3LITms5e7XtbO5bObv
	 dPIz7/66blVU8f0utY4er9pZyGlIbE8bMdB5WdQlE5khhogOBRo8JLvaZ1NlyLJJme
	 u9SxJ/kcwI39I7D6CRV5hKriLaEMzY6OM0TZ4HWMU66Gx9yQS0+DEjrB7ce/Dt1mMK
	 KQn8BuIFevvyAJs+6+snLMR0f5HT0eb3CJ/9KwdAyw6Y9hFXfpKHwabPmkZboSn71I
	 fGyrIjFoTFgRw==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5b00d083818so1976100e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 07:41:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpkjxuA1haNrsC6BdGZI8WXIj6KTmTEW83oWkeW1DmTp6nNol9pOAgXazY4f865ytp4ZM5+G5aJvPbEEkme@vger.kernel.org
X-Gm-Message-State: AFuF++kQUXEwTnCVhz+s7xV5YLV/mUsflDeZwSTTKTRO84O+H+v6SejU
	mPL1p80GVoFRa5hfZDJ8t5v/4ZS9uZdhTyEBTAr5L4y/CGD31x2knuq96gUUsn0+M/4weXTIuxP
	WsRINZniOe8H7nwNndDSXWt63r2RsWaQiQhVF6tCxFA==
X-Received: by 2002:a05:6512:65c9:20b0:5b4:9d3b:9188 with SMTP id
 2adb3069b0e04-5b49d3b9499mr2279161e87.6.1787755276572; Wed, 26 Aug 2026
 07:41:16 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 26 Aug 2026 07:41:15 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 26 Aug 2026 07:41:15 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260820044258.1954272-1-triet.hoang.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260820044258.1954272-1-triet.hoang.dev@gmail.com>
Date: Wed, 26 Aug 2026 07:41:15 -0700
X-Gmail-Original-Message-ID: <CAMRc=McVLkVGQ6B_MF6GdV6EV4t3dVkuB2+Mnof41htRX8qdTg@mail.gmail.com>
X-Gm-Features: AcwNN1Wy6AKMKqiYa_2rmxei9FhG5QhdaCCzKF5MhaantZDU0Z0UkKucl3vG4F8
Message-ID: <CAMRc=McVLkVGQ6B_MF6GdV6EV4t3dVkuB2+Mnof41htRX8qdTg@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: hci_qca: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
To: Triet Hoang <triet.hoang.dev@gmail.com>
Cc: brgl@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
	marcel@holtmann.org, luiz.dentz@gmail.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 20 Aug 2026 06:42:58 +0200, Triet Hoang
<triet.hoang.dev@gmail.com> said:
> Convert the deprecated SIMPLE_DEV_PM_OPS
> to DEFINE_SIMPLE_DEV_PM_OPS and pm_sleep_ptr().
>
> This lets us drop the __maybe_unused annotations from its suspend and
> resume callbacks, and reduces kernel size in case CONFIG_PM or
> CONFIG_PM_SLEEP is disabled.
>
> Signed-off-by: Triet Hoang <triet.hoang.dev@gmail.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
