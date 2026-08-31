Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E53E382368
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 18:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788200244; cv=none; b=MAJfu1V/brOFByxRKm4UjBkORIyuetP0nzl9W7WMmne4CgEdFGSbc/GkTUBxAOrg/56H9gJ9Biiz0bj+mNibHl3hzhVLlDsB2Tc4SatRZG+uyldB7MePahWcr77OP+bRlFPhEvivdoCuW5V5vvL3bTKbNY31fldHpCdK2OsbCt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788200244; c=relaxed/simple;
	bh=3mzJyxDJT2mp+IdJIQ9y9rYao24CZqxfqF2rh8sEaCw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fI3BZtxAeiTQsAA36w0o200qpP5Dg2xuPk8e5JtOxRSvtFvXwVZCLeNBBNh1VW9L916NrVLguTyuhRzWtlLl+wVtb2vzb/reBKS5Tpvh+G4gUEtMy6554NcNERirEgS3Rzj4gZy3AxsxIrU7awvjL6Lu4EikzmmnPcEcY7s9YWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Hbh7I7Sh; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Hbh7I7Sh"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c25b3c641fbso54949566b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 11:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788200241; x=1788805041; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UH4ANZUDTinUoNy1nGt6KAwdPIsDwQv9pXQSAcw0TmU=;
        b=Hbh7I7Shb4wZfl5CNvVdmJE1GjNc61Hi8iLFII1ptxCY1ncRc1HSGPLKWrR3+NAvy8
         c7toteMk8infpn90oZsiJfCh3YG1i0wPMi5uPMEuZgP7zNRLDAhM1TobKISpeTPyNFhY
         k39w2AdZkWKfaKjMKYyceS11LDAnB4H7jDtlc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788200241; x=1788805041;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UH4ANZUDTinUoNy1nGt6KAwdPIsDwQv9pXQSAcw0TmU=;
        b=TaLOP4r3BX1J2QFTh72igx5hOKIbLKKAdUKpvmwr2wkrzh7ae8HpcV6XiPBbhvD7eT
         BObsAEnnXCBtPco/vqScrC8EVaJdsf3yWUphUm9VHK0igt1seHpkCHDZiTaCAVNeAWgK
         +a2eI+o/L7GHz4dZUeckMxb1SB4E1bxAupICNdKZ43rw9VVy2ZDCkQelKmkgwgZUei6+
         uvBp4RibS358To+GE4BrGKoE4TmnwLFA5BhzIVWcdxQ7pkeivTl3ZQtKRBNCkUd71YDn
         Hs0iGhdSNHqd1QuQesW+bqX5BM99i6c7unpycbu/ppCH0LoAv+fCc80VM0VCA+CPNYtp
         smUA==
X-Forwarded-Encrypted: i=1; AHgh+RrrTgoDl90ESvzDpTN2NH9Bf7nBU2JvHycfiLcnb2vKVZ5BddWmu63MRBlqQnDKJEzwdFa2/irWr4tfGcnv@vger.kernel.org
X-Gm-Message-State: AFuF++n07r/VeO7N8KhP5/nVQMS2VAs6ZcC4ErDQmgoRM3BBYaVpJvQG
	qCC2Y5HQlImI0QpqdzBxU1Eev+W3wWhKJWH//L4hm8K3OFGmxbmHBpY7dXrbxnG/b/mCkazelNs
	BRmWg1i3Y
X-Gm-Gg: AR+sD11LEUbEhud4gYh3x7uzcQyVweVyWr/tYq7QUFSSEjeUOHcSxKT6QP+R1Fz+rc+
	XXIr1S0/x1Yo3VA78ohfg8U4I6va3rPx0Dv7MXK/RhC74Uf9fNsL0U3cYIfCQxqNc+hWpT/1drx
	eu+RO7JvyIXYX5DKBG/ZMjV7MJGHfvUxMXcC9WXPs7mjrEpVkW4gXNxPjTuMRIXdNvuSTDAWP58
	6z4IXBw5r4OHav/3rtd67oiUvQAUIJVNt3rIMs9N88Ucnaq1RUV9jBXb21+acApNNCcJvZjPYTK
	GgzdG5BPVeZRn0BfWcFCiN76spoWhy0SiagntOoB5P4arGKOZD+IoapK7lWnOMZd7rw12vwtg4U
	6Roq1Bvue7KKChLQsKnxQUvJMO6WL+2F5Mq1JEdLi3xrPpl56Pmki540zHWMYlRNCIHbz3Wrq4R
	e6B1ftpr+SG2C6qvxoWH1A/YSjKOkW84W6CXQ3rK7i+kEp/aQnvylShQdO4YJSkCguianOqAzCU
	v5fAwRhyz89QDlpk/95Y5U/wWzf
X-Received: by 2002:a17:906:4082:b0:c25:8d62:f992 with SMTP id a640c23a62f3a-c25b3db1604mr111098766b.21.1788200240693;
        Mon, 31 Aug 2026 11:17:20 -0700 (PDT)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com. [209.85.221.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255ee7335asm453060966b.27.2026.08.31.11.17.19
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 11:17:20 -0700 (PDT)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-484362f5c4aso1591535f8f.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 11:17:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwy+fGY00qavRgfjb8nVUX2QFX4V0VAXSU2XrTPTTk1HJTdy+1QTfwym7hawSYs/Y1ffcRzk7gT4W6/rFs4@vger.kernel.org
X-Received: by 2002:a5d:4d09:0:b0:482:a9d7:7ced with SMTP id
 ffacd0b85a97d-48441011572mr4215421f8f.14.1788200238138; Mon, 31 Aug 2026
 11:17:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828-qcom-wdt-nmi-series-v2-0-363979fe6b6b@google.com> <20260828-qcom-wdt-nmi-series-v2-3-363979fe6b6b@google.com>
In-Reply-To: <20260828-qcom-wdt-nmi-series-v2-3-363979fe6b6b@google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 31 Aug 2026 11:17:05 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X4NB7nBqtfVQeoubc7wjS0n2nkfez+Yyby53yO39Kz-Q@mail.gmail.com>
X-Gm-Features: AcwNN1U3FPvHmoemFs05LjwC8xqc8xl7PGyosbmesgJCRaLsNeUN_OaM3dBYevE
Message-ID: <CAD=FV=X4NB7nBqtfVQeoubc7wjS0n2nkfez+Yyby53yO39Kz-Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] genirq: Export NMI APIs
To: Mayank Rungta <mrungta@google.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	"Kirill A. Shutemov" <kas@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Aug 28, 2026 at 6:00=E2=80=AFPM Mayank Rungta <mrungta@google.com> =
wrote:
>
> Currently, request_nmi(), free_nmi(), enable_nmi(), disable_nmi_nosync(),
> and disable_nmi() are restricted to built-in kernel code because they are
> not exported.
>
> Export these symbols with EXPORT_SYMBOL_GPL so loadable kernel modules ca=
n
> register and manage NMIs.
>
> Assisted-by: Antigravity:gemini
> Signed-off-by: Mayank Rungta <mrungta@google.com>
> ---
>  kernel/irq/manage.c | 5 +++++
>  1 file changed, 5 insertions(+)

This is no different than v1, so you probably should have carried my
Reviewed-by tag:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Sashiko has feedback [1], but it seems to be mostly regugitating the
same feedback it had on patch #1. It also mentions that "`free_nmi()`
ignores the provided `dev_id` parameter", but (to me) that doesn't
seem like a big deal and is certainly not new.

[1] https://lore.kernel.org/all/20260829011550.ECF091F000E9@smtp.kernel.org=
/
