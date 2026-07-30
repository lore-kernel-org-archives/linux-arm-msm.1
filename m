Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3FBF38DC44
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 21:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785448394; cv=none; b=HDC6grTObrj5FASiaec+3j/SiUZT7/8lwHdEVlQofTMlhFqU9+DzU7ll9DQMtOD+M35Ukwipn2LK/d6GyekJ+BC9oJSgv5X1idyzAFqt48rBvKHuH9aUBK3rrrQlb4QSWmzd8qxCUqBbISYGDB5uq3aXUALKq8TlrTQuyxoNHLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785448394; c=relaxed/simple;
	bh=n7xZ4d6pDBOIsBccoj41PoA0ulZULmTJlTbJyd3d0b0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wn1vu4xNwPyNtVQ7lF/hJrQTmlil84bZfqt/DF3RDr2B65C1wFXw0lzoBxwRchUV94bsUw6904htTyjtsuTJ7acaAfSMXmIsH4V3FwloC8gjLMHM8QWrXa8pf54xXtEKxVJ3jIG8S7tmsxfaeVO0yzs8FLFRNupd5nQubjS2d+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=B8Kr+oFz; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="B8Kr+oFz"
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5bfa99f8ef8so904701e0c.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 14:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785448391; x=1786053191; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N6weBl8nXyjz9nQrg6nLHwQNYvi+4xIJ6U2EjMla1oo=;
        b=B8Kr+oFzTf4Ibm5uhj8g8nnzpmlcQH3x1pnXGGTgsKcUq2bUrvNU6nhj3EIb2Pgk4M
         P+zfkSWczarWbGg7lXFyL2I5ZdGaJ0D4RlbNyk5yHYr6exXLhb9URKcb/jpUnpVPUn4J
         hIFhwSUoe0t8yl2pCh961dO00HshXSZIiAS6o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785448391; x=1786053191;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N6weBl8nXyjz9nQrg6nLHwQNYvi+4xIJ6U2EjMla1oo=;
        b=lcY5wNYUlUAcHbFrvuIm0lYZZ46LiD2+jyL9mXREmSzzS5WR6QxVhF2l1Qfbq9/AM2
         UCU8XxY5myziTKSlpnX9FPrLMMqSU6Zv3oH0xWR2S+ybswwhxc7Io4OhiD+P0IVL0Xaw
         B4IDxU8e0WbDQ1VNxOjQk/Q3+ovryxy3t37yQriHuxvTBpt3L8o6UrunqcYth4IRY1lr
         VK5Jmrocq+GUR65DScsYa8yb8yZytgEUXaTrkgPnbfcZxjhLUms8+O+WOIMWRtHObodH
         sDhjfGa55nkYoas93QH8meYZ9n6sJQplcoZmKUO5nkcDrjPlRyf2mEAU8Sjp5eBKlaY6
         QB2w==
X-Forwarded-Encrypted: i=1; AHgh+RqjThv3u3VdUgEhh1iwaKaJa334D+7ATk5+5WjeeXlmPlJwRUfAloRllvFc++QIdd0hnupgmzNYo19RoJ+W@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3V7NAeUa74ObYxv6wdJWwnItB86HS22diaUFV6kFhbgWucnZV
	r4kC5XC77BvoDorC7byKPFVd9KcauzAKvV5PB9uyDeC/MIoyJCQnESLlFV9HpfCK+Jo0Ard23h6
	53jE=
X-Gm-Gg: AR+sD11vAJRKrQBTuAlBzpSzYWZrEq/PDlI6TxIOVLtPvsR9ZsBzhOKEycheHrP7Bo9
	Ghoq4N2xePYGekg2TWvsm6osBKFqikJOs3wCkne1xYf+4JwLr2yr18bBn+nu8+eVn3d0gNawQ6I
	tW/ZluAUxhUfamVTsP8FbIgAT3bpW1S/tWVyVFBVugvo3M2qUTQsJDQEqkVZ7w9Vj2KqPw4mIGX
	/46el6/cKw0gPufAh1FAEb5G0vmnpAklS7ttzsyryR3ZENHxSlAemSTiYpjhH+pGHOohpCb2kts
	56uQohabFBHOxQXagWaYMq1j8wk7L/sCEgo+V8GMXVPaUk9vT9W+7/Otam7z1jvJ1kfptdineLK
	sOta/3qYbec93LieTwVHu7PJzz9SjrAgIRzupXeLdxeRq/IuneKZdVrI6Irs+m2T9c/KgkSQlo0
	y434yAYochM4PR8B9ASk398evzTp8wPq3MkTc+Dp4h31jFkwxeL0E96QpvPIrI8crHS72IgO9cf
	n62qg5J9nCwvpgzD45IktsyosBM
X-Received: by 2002:a05:6122:3d13:b0:5c3:5806:b494 with SMTP id 71dfb90a1353d-5c373eb4108mr775374e0c.6.1785448391592;
        Thu, 30 Jul 2026 14:53:11 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c36673a58fsm2457746e0c.14.2026.07.30.14.53.10
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 14:53:11 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-7377dde7bc6so815609137.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 14:53:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqyCz86gPPTxjNiHRHlh0GBTE8sgLjiUeS6a2lKm2mCnPt69w+faXx5yRn2TX8qOC4rBVOZUUX/xJ1M0/Cg@vger.kernel.org
X-Received: by 2002:a05:6102:14d2:b0:744:ef7e:8f85 with SMTP id
 ada2fe7eead31-7582acd5ff1mr590809137.15.1785448389325; Thu, 30 Jul 2026
 14:53:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260730-qcom-wdt-nmi-series-v1-0-3aa86d162914@google.com> <20260730-qcom-wdt-nmi-series-v1-3-3aa86d162914@google.com>
In-Reply-To: <20260730-qcom-wdt-nmi-series-v1-3-3aa86d162914@google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 30 Jul 2026 14:52:58 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XiTw7ueV5BeURhG50LXUR0ZtPpJWTF-AuQEaySrVTigA@mail.gmail.com>
X-Gm-Features: AUfX_mx22NpO5lnS3W8reOG7Q_qsbtJ8_4eaA_IlpPB6diF6oZxCuem5LyMUp48
Message-ID: <CAD=FV=XiTw7ueV5BeURhG50LXUR0ZtPpJWTF-AuQEaySrVTigA@mail.gmail.com>
Subject: Re: [PATCH 3/3] watchdog: qcom: Register pretimeout interrupt as NMI
To: mrungta@google.com
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Thomas Gleixner <tglx@kernel.org>, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	"Kirill A. Shutemov" <kas@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Jul 30, 2026 at 2:33=E2=80=AFPM Mayank Rungta via B4 Relay
<devnull+mrungta.google.com@kernel.org> wrote:
>
> From: Mayank Rungta <mrungta@google.com>
>
> When a system is completely unresponsive due to an interrupt storm or
> deadlocked CPU cores with standard interrupts disabled, a standard watchd=
og
> pretimeout bark interrupt will fail to execute, preventing the pretimeout
> governor from capturing CPU backtraces before the hardware reset bite.
>
> Attempt to register the pretimeout interrupt as an NMI (or pseudo-NMI)
> using request_nmi(). If NMI registration fails due to lack of platform
> GIC pseudo-NMI support, fall back to devm_request_irq().
>
> Explicitly arm and disarm the NMI during watchdog start and stop operatio=
ns
> using enable_nmi() and disable_nmi_nosync().
>
> NMI Execution Call Trace (lkdtm HARDLOCKUP freeze break):
>  Kernel panic - not syncing: watchdog pretimeout event
>  CPU: 0 UID: 0 PID: 5419 Comm: bash Not tainted 6.19.0-rc5-00022
>  Hardware name: Google CoachZ (rev3+) (DT)
>  Call trace:
>   show_stack+0x24/0x34 (C)
>   dump_stack_lvl+0x84/0xac
>   dump_stack+0x1c/0x34
>   vpanic+0xfc/0x2d0
>   panic+0x6c/0x74
>   watchdog_notify_pretimeout+0x34/0x48
>   qcom_wdt_isr+0x20/0x34
>   handle_fasteoi_nmi+0x50/0x88
>   handle_irq_desc+0x4c/0x68
>   generic_handle_domain_nmi+0x38/0x48
>   __gic_handle_nmi.isra.0+0x40/0x90
>   gic_handle_irq+0x64/0x234
>   call_on_irq_stack+0x48/0x88
>   do_interrupt_handler+0x74/0xc4
>   el1_interrupt+0x5c/0xb0
>   lkdtm_HARDLOCKUP+0x18/0x28 (P)
>
> Signed-off-by: Mayank Rungta <mrungta@google.com>
> ---
>  drivers/watchdog/qcom-wdt.c | 55 +++++++++++++++++++++++++++++++++++++++=
++----
>  1 file changed, 51 insertions(+), 4 deletions(-)

I pre-reviewed this for Mayank and it looks reasonable to me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
