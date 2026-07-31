Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E141C3D3CFB
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 08:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785487089; cv=none; b=Cw4zp33cI5Tf/hb5fLbzOV++Z40BVBiQyfjCXV+4uVhu7UV7gUI0a8NGuAGte9Pyn3dBgZKijorgq7h1nGbzirZHuCOrnFATmgme6mymxXDYZ3bMvkmpcipLWWeFNL12HkUZihmgIsNr6W/5OB/hjjWHuNDezpF+LN7ktmZLvPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785487089; c=relaxed/simple;
	bh=8O6OMh3BopzW2o5MbwDKX3oMfe0s8U6FTgbLxMjawwI=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T+66w7MsAfvznY6FMv71dlMzJ4SYjKqE2cx6QNVzA455RIumNe/m/GLjE6p4gtVA9r/JtkqClw//3CWLvzVD5UYbOJUaDLfVMXYhHV7RqTaVHkH5T6JjZ3z6mTAHs1IHzX1GhYqrsKzoW6+vNjoMXxmzcjwljJFTSPMax6e2kEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gtSYGoIT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gtSYGoIT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8853D1F00A3A
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 08:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785487086;
	bh=8O6OMh3BopzW2o5MbwDKX3oMfe0s8U6FTgbLxMjawwI=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=gtSYGoITe3b22MHTzNq/v3fJEAsuCbWl95oa+4+Vzf6Che4BW5MACzBZYDZS3Kfev
	 qUjCUyDj1gY1p/uW8zCdUiqEjsxZgvyK9ECz/DMGOkw8CThQsqXoweQqANwoPf7yf9
	 3iLxuUV5TmsM9fhFIuWLByOgf2GfJtBDdIIjE6xj0bG0BWmO6DUrIdRB7gUMB3CUor
	 IoOX8vXm/A9rJX00XVkkyaSq9DZTGJkdp9IXmE2hyoNjhAtkqohK9vzVH7LnVbVThX
	 mSii7zo+WLqPl8FuzhkbbO4rmIxFmUoGmWeuBvuPxzTgcAdzCG7ytPzB0aU353Ft4w
	 ZTV129mksJmoQ==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-39eb257e9fbso5287831fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 01:38:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpXiHSYkV5/sLRcrwAEE/arSbb8BJRlmFuEK1QxO0E//yJgWEWY6TbJkU0hpDPM11q1TjnOHmwexgY3ytMZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq4qFOpcW9qBr6obp7JeGijlDXzRv5z7xkzuxFoa+17/smWjWv
	7qstqyQ6WeWuARvSxMDvEMEobpM5h6ojO6gSvQuNKMd+AHBeV4HIFx1u4bFm5+YQTZsdQ9JHvMb
	DWSrysHUA1DSLOIDPgyaQkaAY/umzV4pjP1FOD2jsRQ==
X-Received: by 2002:a05:651c:a210:10b0:39e:ed52:cfdf with SMTP id
 38308e7fff4ca-39f7e3e8a4emr1674701fa.20.1785487085323; Fri, 31 Jul 2026
 01:38:05 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 31 Jul 2026 08:38:03 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 31 Jul 2026 08:38:03 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260729110455.641256-1-kuldeep.singh@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260729110455.641256-1-kuldeep.singh@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 08:38:03 +0000
X-Gmail-Original-Message-ID: <CAMRc=MfYYCE7XhUWsaQbsFpeWf3HGhRqhb9gmcUJcHz77YUuhA@mail.gmail.com>
X-Gm-Features: AUfX_mxy7QItm5GTEtQowQ4yrii-Id3OiyLlizpmaw3u7Qdo6Dyo3jCNfq241Oo
Message-ID: <CAMRc=MfYYCE7XhUWsaQbsFpeWf3HGhRqhb9gmcUJcHz77YUuhA@mail.gmail.com>
Subject: Re: [Patch v9] crypto: qce - Add runtime PM and interconnect
 bandwidth scaling support
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Udit Tiwari <udit.tiwari@oss.qualcomm.com>, 
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="UTF-8"

On Wed, 29 Jul 2026 13:04:55 +0200, Kuldeep Singh
<kuldeep.singh@oss.qualcomm.com> said:
> From: Udit Tiwari <udit.tiwari@oss.qualcomm.com>
>
> The Qualcomm Crypto Engine (QCE) driver currently lacks support for
> runtime power management (PM) and interconnect bandwidth control.
> As a result, the hardware remains fully powered and clocks stay
> enabled even when the device is idle. Additionally, static
> interconnect bandwidth votes are held indefinitely, preventing the
> system from reclaiming unused bandwidth.
>
> Address this by enabling runtime PM and dynamic interconnect
> bandwidth scaling to allow the system to suspend the device when idle
> and scale interconnect usage based on actual demand. Improve overall
> system efficiency by reducing power usage and optimizing interconnect
> resource allocation.
>
> Signed-off-by: Udit Tiwari <udit.tiwari@oss.qualcomm.com>
> Tested-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
> ---

This works and looks correct to me. I'd like to see it applied but I guess we
need to first settle the debate about this driver's fate.

FWIW:

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Tested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Thanks,
Bartosz
