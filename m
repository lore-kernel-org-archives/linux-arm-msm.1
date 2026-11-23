Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795476523;
	b=hyDNKqqEQMGlVIMbMjSbAXfV7c72Ws+47Jn5nTmyROPDA05l8Pojjk28M0Laqz2nD4T2
	 LK5+bf+ODi/ut+hlSlZuAQl4p2EyxlR9P8ejG5hba1H5vMdDW+s19767YltQ0zuPYJETL
	 1DkVfZRbJ/qlEeeDzYhtRZ80ffMVQ0h1i7Fj0b70yAcv54V0oArJTVg7BKZBZpqL21uOg
	 JoYN8jTAduVkA68U3oj/U5wir8QvfbbWQdq4WMXe7mBZd8iU97LeG2zFRJZpxI46IVRZw
	 UIR/qir91x8ujMC8FpwIetq5ApncYz3YhJ7Cbzyqx3fB1isx1r3j3XMqGWc7/Apaq+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795476523;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=L9JyOQCk4ptyu6RbQxU+dboohfD5AUMkdLfi1iuTleU=;
	b=TVyCKpapriGP4ETv9A6zGBG8hF7mFjwh9VTT4g2K+nh9MD7f+1zSkULN+csh+5KXblTi
	 5IQtFrF/AWKAqy/pv+6jYvKknDvcl37nKDKxgPHkuAbyeee7DlZP0jpuqhmi61/xaaEdi
	 rWro8H6AgiGwVT+FHraQI7LRYW1KQ3H6PQ7J/QWWlrpnzjMO8KU7uOJKLQJhhUDx8DSCT
	 xSbk59VfY8OBccaWpm6mRFH0ZBlvw6Y492nZeCacEtSxqkSI90CPOR5QXBUnosV95T4sI
	 N29LzhhwdcYbGxtRI3+WPCteZkSZCfB1c8nvER7pd6X6IbC0S6Y9dMJFRaHnFktyycw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=DaM0vGy5;
	arc=none smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F90606A321
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 23:28:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93F90606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=DaM0vGy5
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so6201391a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 15:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795476521; x=1796081321; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L9JyOQCk4ptyu6RbQxU+dboohfD5AUMkdLfi1iuTleU=;
        b=DaM0vGy5teEoXFpFxJnj0el7sOopE/UtgSxsoV0X+63o68kaJuglNXwnm++mQfUv/A
         Zblix92qflJ0fs4v7zSiMnsdAVFDY2WIVjxOraOEmFwXzinBBKZmNUQuxkEyZ/xQbBDs
         lu6boBaLdELBJWmNzkdR2maTjISux6/ldn9X4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795476521; x=1796081321;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L9JyOQCk4ptyu6RbQxU+dboohfD5AUMkdLfi1iuTleU=;
        b=U7HyP/FdOTpocsloCE5tcTrhtT2mV/Ei5xeoQqh579txYCN2KhJOCa93MeziHkMqtY
         bsujWHwi5oKT9uj2+D0d3X4HnSkcS0/FfU/iqqiTv9bhabxsT5zqScpqKTnQKO2Jrlqu
         0bzIja0fKUSrSr5RcsHyjvAiv0PqOfkdLuNG2amJyf+xRC68EFq5aUSgAFNEW/5B2mVe
         +sobE5krCjqzabFr5kDZaqkirR9Jc8OsXETN07bguvV8DZ/Y6Mw4Ch/otAx7SpIDyE20
         mbOIAWefyRyJ/uFOp0IDbQz5oIfScouuWjAP75vPKczCNJ1GZepYv9EvznLbcVQwbyNG
         91BQ==
X-Forwarded-Encrypted: i=1; AL+hErHUXnRQy3/ClNl+1km+eQCI7Ml5NCvolNVa7kNXLOgThpid/6KPB2wKtett1ntIjyeiwnXnKxubFtwbA4Gm@vger.kernel.org
X-Gm-Message-State: APuU4Z/0DFxBGqtTubwNIUzR/HKd787gZJ8NFoq4QqGy16CXm9uR2Wn2
	GUfaTtiDWazhaRD9qV/3rf/t1jSenklujhgsR7nYAOzh17mIAPqfPWo8g1HUZp3A3T5kaJIszml
	bg1lhDQsc
X-Gm-Gg: AZFdTZdja9HymBmvBztyqy6fWthFxGBgLtaXIXEpNr/aLoF7FUEefbXYokMOjA6pFM3
	SmZLWIUxdPAHRJ7wPYV8Fxae1aRo7pSyyqTcRkrvaraPwivB2RXQRMUWf/aG+7qRNWjZgQvucRN
	SlEA1T4QuY4O2VRee9IU9So46mzbwsMDjkOJPKM3kG1hBuJNA9e1I9e3Bch05YvebPQl7foP6uP
	1JJBhbQCPUrtfQp6xr8qLNxcxv7vKbPIa0cAbY/sJSIRXLAUrjsMExZoaBXRliH7cAI7/GSPN0w
	qUoalsSDJOVltMFQzAeH7R3N5DGezgjQJBz5Mm4Pr8dD/ELXK6qoDtdKIsZ72UIFIAm/oaCCh3a
	DXKsJ59Gkm43mvo/JN5x5b+3GDfP4JR34947IJfQ8CrgTAxjsx1zVnL2/3JtbIJEM1PEBOU/hdK
	LmD7tZ2lE53Jxxu5nFxIu4e4dw/XTCUaiHl8OKfh+7zvej9r1zn1fr2f0BGw1bGfV8K2sjigiB2
	Vdrl4QFZGzvw8SMIDEfP8zydVs0RDq366lS7SAD3lrjZ8/+dzs7ZHNG2oA2pReiA86agmh3c69J
	fOEj1+/1IfAXgb0r22G33X6OpeHKUEPC427WCTqUh/4c5ZE5MZIehHEYVzM1FpbhYSj6egkavR/
	JGDLkGkzfy9Rj/Jo=
X-Received: by 2002:aa7:d94b:0:b0:6b7:df0c:18bc with SMTP id 4fb4d7f45d1cf-6ba37d3b56bmr6860833a12.17.1795476520973;
        Mon, 23 Nov 2026 15:28:40 -0800 (PST)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com. [209.85.128.52])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba36e355easm5785817a12.3.2026.11.23.15.28.39
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 15:28:39 -0800 (PST)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so41103045e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 15:28:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErF7yVQogbL/Blf2jR+USReGz15ebIdZtqMrJXgTbzvk1L5xCDR7E0P6aflXsI8N4izok3+6S6zJT+H0SgSW@vger.kernel.org
X-Received: by 2002:a05:600c:1c1c:b0:4a2:1364:252b with SMTP id
 5b1f17b1804b1-4bb8892ac4amr288126295e9.35.1795476518196; Mon, 23 Nov 2026
 15:28:38 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112031629.396819-1-mrungta@google.com> <20261112031629.396819-3-mrungta@google.com>
In-Reply-To: <20261112031629.396819-3-mrungta@google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 23 Nov 2026 15:28:26 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WfqqTp8Bue35bfnHXiegqVbHxtDf0UPjg1JnXF_o_3ZQ@mail.gmail.com>
X-Gm-Features: Aa3M54rsKLWqkESys1duLI-KqFGibQ4RK6Ckuh_aN7G37_7JSHexELC5Pm6FEBc
Message-ID: <CAD=FV=WfqqTp8Bue35bfnHXiegqVbHxtDf0UPjg1JnXF_o_3ZQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] genirq: Allow global interrupts in request_nmi()
To: Mayank Rungta <mrungta@google.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Marc Zyngier <maz@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	"Kirill A . Shutemov" <kas@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Nov 11, 2026 at 7:16=E2=80=AFPM Mayank Rungta <mrungta@google.com> =
wrote:
>
> request_nmi() currently requires IRQF_PERCPU and forces
> IRQF_NOBALANCING. For global system-wide interrupts (such as watchdog
> pretimeout SPIs), forcing IRQF_PERCPU sets IRQD_PER_CPU and prevents CPU
> hotplug teardown (migrate_one_irq()) from migrating the interrupt off an
> offline CPU.
>
> Now that in-flight NMI handlers are synchronized via
> __synchronize_nmi(), drop the mandatory IRQF_PERCPU check and stop
> forcing IRQF_NOBALANCING in request_nmi() (existing per-CPU callers
> already pass both flags explicitly). Also check irq_is_nmi(desc) in
> irq_seq_show() (matching kstat_irqs_desc() from commit c09cb1293523
> ("genirq: Update irq stats from NMI handlers")) so /proc/interrupts
> emits per-CPU counts for non-IRQF_PERCPU NMIs.
>
> Signed-off-by: Mayank Rungta <mrungta@google.com>
> ---
>  kernel/irq/manage.c | 9 +++------
>  kernel/irq/proc.c   | 6 ++++--
>  2 files changed, 7 insertions(+), 8 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
