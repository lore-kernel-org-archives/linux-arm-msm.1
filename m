Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795476514;
	b=nE9KtA5yzKieghIIAMeS8vPTHWKiYWZ7lq4moox/dxfIT/5biJdRbwEjRAxHuUOD2KyM
	 +TkSa9VdEb3zups9Th4nAmywYc9Xvglu6brUhF4I3SYkCUoJOQLryoucSXdExgrn7Ad/l
	 Tu2uhKPwODznXLlUncLTd6300XhkF1gjoz4S6hVhOvkftozdFQbN8j8qQs3M8UWQ5sX96
	 d46gsyVUiMk9tb/m5/6c3hiXdR9RRKwgotIsI479VZklDOWvG2aDWPC31zA9fHTkaV7M5
	 vL6IeXQDyK9IcmyWGlxmSzqEHC2Q4cdiS598Sixy/90+Ysq1/cQwvQa48R/8BEWkK7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795476514;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=9y8eBhUOHRLpdlPNcmQfoTOPtq1wEw9bOFKY5UXmjUM=;
	b=wwx63CFURX1MTO1gMFTpRr+zedqRNCl3Nmz4KFYZqlj8ZHYalqCU5s52/ud40YPFk5Us
	 vm5vK9S4yzNE3w4NMlJUhQYBxTJGzuuH+RkMSptvdGqJlWDS32LTaU1ZIubOCM4FqMr8p
	 ny1qRHx6zTB5Xxb/Nd20APv4/PB/PoVoI4XmvGvQ81Xi6hw3K9KclWEKRYS80RYiW0SVJ
	 3+OgC8JUYN83UQYciS/lYt8uq1A80bpxg2ZZ3Rfj8LTAoJVezIdv5GNvXZ/6QitbNegXg
	 zR4HKI9b9VMBAvJTEfb6XTNt6MiOoMKf2OSX0CIPmbkpCTEX5eKofUsuE5PD8cloWoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=aSOc9tsW;
	arc=none smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E701606A321
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 23:28:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E701606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=aSOc9tsW
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b87a92c17eso5448677a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 15:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795476513; x=1796081313; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9y8eBhUOHRLpdlPNcmQfoTOPtq1wEw9bOFKY5UXmjUM=;
        b=aSOc9tsW2YexUcqWbYtbVIAVJm5KMJESy3z3Cs88ZSaAqTV8HvAzj93YxI+xXhYfia
         ZCqh0Q0MI3JhyOCcPRzP4Kjb0frf6bfEZwtJMUypKJYhCQONA9YU2VmRgYBwDDCuEis2
         9AKiK+Bw0Q4tddDX24K+ufjZWIuliq2PxylQw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795476513; x=1796081313;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9y8eBhUOHRLpdlPNcmQfoTOPtq1wEw9bOFKY5UXmjUM=;
        b=nTpM/kKXy6bq6ORl2/YsSlIGV3W6l769stLmiZmB+gH23yZwyU8I9J1Ejn/QsTOi1u
         7J1IYp7lc6PotopyD7+CQdtZybk1of2lR84G44A7TRMlUxWqCxB+/391iAzP3xA0D2DE
         4/qz2m0Qjp/Ejvh/czphOIrtUdXO0/ECmdxOJPs21KWmQiyWYOO5p/CB7Ul1hRwh2IlJ
         NvXbgViKSqxwL0zGNFWVw1P5zBmhAJAc19sToWOX2mOQSUPSUI/tIdnL/jmNePmB72BC
         /mU/DMv520tzXmMzWvP3l59l0IQLGujV6vrl9Y1HkSeVZ55kOITVhE1697IH6rlM8HNe
         YhpA==
X-Forwarded-Encrypted: i=1; AL+hErExBNSoeel3VchKMN9jsIrtVpPfxu78T8zRhXrL9Sf0HQqwVAz29TT0kQFcU7tLQqcTo2z1NBCOfbsA7fCO@vger.kernel.org
X-Gm-Message-State: APuU4Z/gn1hxFRMPTV1/NKPtsd0BWo3INGrb1DXbrxqjnwrBIt9Z4HDn
	7iznqBZoncHF1Nxra5wZxnK/ozIxF1wxvLHWoWrabNJeRYjDzXNAAfiUE88ssrTDVVnGN/3PA14
	RUfBCWajq
X-Gm-Gg: AZFdTZd6fx2zHRfJD+hBnlqm9l8vAHBPzu896FOxXhKEFS/oepgRbeV4n/EE3orKYD1
	OeXk91GL7TphZecfwjOu6j08LfprpZBN5QyN8FOQGyWpmFgezhmyYhIzND4hw1aSp64LSiS5G91
	lv/iOzHpPo8Jv/yJuei4JHk5P3t97csvj6OPs5NoVhuV4zl3qOZnkZXaM34bjurtopxdMBADP+d
	R4GfcakDvFnyTlyJ9NUG3E4ZN7kEw75rr+/sXEdnz4XHS6uaa0y8F1a8LkVsbCjDnrvCuPC+PX2
	3l/9vY6P38XK6f8rng3MI/iq7SoLao50FqQk5FcWR2Z3w0M7iCgu8KWc1duJPcvJU6uN4v6T5N+
	oWw5ap1s8puoG2R1HQ87HuTL6fYluYlCkveU0mRlMSzqvnSzdhk3sM6d9HyhODK5vC9R2t+6zO1
	8vbiu6d4H19+iDZX+f23UXNvzI7ucbNfN8ZaJ/AGsrO+HhoiCkxq0y129cObjXZfODaZ4uJ8F8P
	pxmGDWl+QH3rsxWXVlMBUzME8klrbPqzcM2XfBi9Onnyxm8ycHGkUffG88TaH7+g3cuNR20MpA2
	Hx5c9VdKKGUmdX88UspfEKX4ZNb/I/AB0fRY/0KVrf7qA1V8GZNmMXgsZRL8cUprVXAo
X-Received: by 2002:a05:6402:3223:b0:6b8:5f08:931b with SMTP id 4fb4d7f45d1cf-6ba37ea44b2mr9492643a12.26.1795476512637;
        Mon, 23 Nov 2026 15:28:32 -0800 (PST)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com. [209.85.221.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370cbeb0sm6062068a12.10.2026.11.23.15.28.31
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 15:28:31 -0800 (PST)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48e47347279so2287541f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 15:28:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHoEnoYrOPlcVp7bfKufOF6S2vwPNip8gDeaKq5iA7aY3+eHAE3hkeCFmBo4Iej9tjNEUqqaaWRdtyW7sKd@vger.kernel.org
X-Received: by 2002:a05:6000:18a5:b0:48a:f0cd:8712 with SMTP id
 ffacd0b85a97d-4abb7f3e149mr24759404f8f.50.1795476510904; Mon, 23 Nov 2026
 15:28:30 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112031629.396819-1-mrungta@google.com> <20261112031629.396819-2-mrungta@google.com>
In-Reply-To: <20261112031629.396819-2-mrungta@google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 23 Nov 2026 15:28:19 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Wbg2NrVkRcF5tmkCKCaO68s02DSioZrh0Kef20bgoidA@mail.gmail.com>
X-Gm-Features: Aa3M54qxqk4ye-nzMXd_3z06vzEcZgIhi2oG8UCPyVLsWcK9JJNpK4as0MRwgIg
Message-ID: <CAD=FV=Wbg2NrVkRcF5tmkCKCaO68s02DSioZrh0Kef20bgoidA@mail.gmail.com>
Subject: Re: [PATCH v4 1/7] genirq: Synchronize in-flight handlers during NMI teardown
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
> When freeing or disabling an interrupt requested via request_nmi(),
> __cleanup_nmi() and __synchronize_hardirq() currently do not wait for
> in-flight instances of the NMI handler on other CPUs to complete, which
> can lead to use-after-free conditions on module unload or driver unbind.
>
> Regular IRQs and NMIs require different synchronization mechanisms:
> - Regular IRQ flow handlers already acquire desc->lock, so tracking
>   in-flight execution via IRQD_IRQ_INPROGRESS under desc->lock avoids
>   extra atomic operations in the interrupt fast path and extra memory
>   barriers during synchronization.
> - NMI handlers cannot acquire desc->lock, and querying hardware
>   IRQCHIP_STATE_ACTIVE alone does not cover handler execution after EOI.
>   Track in-flight NMI handlers locklessly via an atomic counter
>   (desc->nmi_active) in handle_fasteoi_nmi(), paired with a dedicated
>   __synchronize_nmi() helper that waits for both nmi_active and
>   (when supported) IRQCHIP_STATE_ACTIVE to drain.
>
> Because handle_fasteoi_nmi() runs locklessly and cannot mask lazily
> disabled interrupts in hardware, force unlazy disable
> (_IRQ_DISABLE_UNLAZY) in request_nmi() and mask the interrupt in
> hardware before setting IRQD_IRQ_DISABLED in __irq_disable() (matching
> irq_shutdown()). This prevents a level-triggered NMI from observing
> IRQD_IRQ_DISABLED while still unmasked in hardware and livelocking on
> EOI, and is safe for regular IRQs because __irq_disable() runs under
> desc->lock and no chip disable/mask callbacks inspect
> irqd_irq_disabled().
>
> Update __cleanup_nmi() to serialize teardown, shut down and synchronize
> the NMI before clearing desc->action and NMI state, and warn if
> free_nmi() is called from interrupt context.
>
> Signed-off-by: Mayank Rungta <mrungta@google.com>
> ---
>  include/linux/irqdesc.h |   4 ++
>  kernel/irq/chip.c       |  35 +++++++++----
>  kernel/irq/manage.c     | 111 ++++++++++++++++++++++++++++++++++------
>  kernel/irq/settings.h   |   5 ++
>  4 files changed, 130 insertions(+), 25 deletions(-)

This is a relatively big change, but IMO it's a problem worth solving.
I'd already reviewed this ahead of time, though of course that doesn't
mean I didn't miss anything, the Sashiko feedback being one example.
I'd be happy to add a Reviewed-by tag on v5 with the proposed
resolution to the Sashiko feedback.

-Doug
