Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com [74.125.227.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE293E638D
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371403; cv=none; b=uPuy8Ml0lozXFe4H4uAB4pc619HLYp72Mj7GRiux7qOuMum+W1y2UuTA0/Ecbu30FviJCZEUaRQL+11DM4gDU17nDfvDPnzzCuTjb3Ct1aDLi1VFB63Ks385CngXQdEuDnzcK0kkzc+2DCf9Gb1+sJCxrnSHuaAa/a76qnJKxRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371403; c=relaxed/simple;
	bh=+O3epdP0hNt8bWCh+m7fHo3yvg6cawjfYlW1RkLSlg0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iaoqbvIqf4zoqqzf3iAuqUcQg2OLYAh3qzNfWUwjANQUpl1fzQf1xOElo1L38cMsb7CsYtr4wP4YpeKdxGP7nKz1MXnaJtj6+TEMnqU+DhWk/WdrztRGXfa0avABEuiQdC+ksopIzBw4Nw+qovUvYt3d0B3AxV4IhJ0fSQZg+rY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f43.google.com with SMTP id ada2fe7eead31-78569cf871bso1341543137.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 00:36:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371398; x=1789976198;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MdZ0sJe93gFmfPqzjpCmLFmphoDkWj4ooGAcaz6b51Y=;
        b=ZfIwWHbs1qoi5YJJ/ufdTUmPJ/1zFvDATQj2ZWO0KuuVP8Tx1ibrcqntarUFJ9SE3b
         T4NY0VfHe8frvkN5Cl72+rVipt+5T4wKTmY2wgHIeMRpCGQu0nOFhnfb9hm/PAdO9+J7
         QikiSLD2hDxVlf5mY/WuI612/ITtSza8axG/ieoaeVmpF9Z6QhfYoy5kYgkQ7npxIhk/
         6kFAGI/Cxa+VtUlfvGFNwSAlMMmoEGWpxMVpKiTTol2EQd9VIoMs294Udecux2gNAWvN
         Yy/5Dec7p7xe9Bt7YYPlegWz9sBW9dSylAGqiUJMrpq9yXUB23fQWj2h0v6VCanh48K5
         HjZQ==
X-Forwarded-Encrypted: i=1; AKwUvBzDyDhQSTuh1KhKBM+TkLq1T6ALxVkDpQ4uLBmvt3sw712SDVLqm3YuuhYsyF+D8sxywIMS1yevrHKntDgZ@vger.kernel.org
X-Gm-Message-State: AFuF++lZEUIzBs+EjsxKIhSMZE19nsXV0eUUmRnuJdUnBqI38XXXHF8D
	C/uC1Bsjm43ahW9vwbynqhheQm2b3tkuJiMWw1/Zf+M/4K74S2RJfkQPplG7Kzxv
X-Gm-Gg: AYBFou2QfoKbHq3smFiV7RS0m4vlZ3KCc9RdvFOPemDDDZjRL9SiLNJGeUWa48eMUjD
	COkhrkvraLX6Q/1uF2n7f5L0CgPWVCb03C1VFROIkoKpp5WcuYgBEndYwVrlVggN4HjJzHD8yWf
	T0xY5MmPUZz0PW28H4Qm1Hd9z0633pXfd5P/TnMz7dDBvOYQi0Fl7ZcQgSmW1i4cKbJhxo1UxRE
	4U2v6gAJqALCvOjoFYHZ0XDCrByw0/gtHuE/hk1cH7R54Ifz26jGLFjdzg6U2VBMbHTtjAWIKx0
	yhpe7PrlpxqW88kotcJFP8rgS4xWWDhM+gVjWYkjdK4y/4QhWpyyD9Oe6oyfGH4TylVfywlPiYo
	pxODtE59tTDVsVcyl4Qww2Zo/efKwuaPZXv71Z6J/2Id629C7NRBOCb5wo/k8Zjo1PHotmsmIVa
	dl6jBNxSjTYJxWwiEnv6nn7+y1wV/Kd/y/src9VwNFQ2OL4NxsUvgqEi1/kXVP394BfjpydZ40l
	k658yVfDiWx7JdiL6pY4g9ndxk6l2viGZBM
X-Received: by 2002:a05:6102:1044:b0:79b:efec:7d63 with SMTP id ada2fe7eead31-79befec8956mr159343137.7.1789371397888;
        Mon, 14 Sep 2026 00:36:37 -0700 (PDT)
Received: from mail-vs2-f32.google.com (mail-vs2-f32.google.com. [74.125.227.32])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-982b9ee3b7fsm10812261241.3.2026.09.14.00.36.37
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 00:36:37 -0700 (PDT)
Received: by mail-vs2-f32.google.com with SMTP id 71dfb90a1353d-5c67e4d8d8aso1723055e0c.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 00:36:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwgY9HAFiN/5RRWkS7+oLlL9JxQ80GreHQFgTJl9qxY/HVmCWkuGG+LRDz4GJYKEN3+xZ0BPon27A5kHAr0@vger.kernel.org
X-Received: by 2002:a05:6122:4697:b0:5c7:fb4e:2cee with SMTP id
 71dfb90a1353d-5c981a874d4mr600982e0c.1.1789371396752; Mon, 14 Sep 2026
 00:36:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260913173049.1168963-1-sashal@kernel.org>
In-Reply-To: <20260913173049.1168963-1-sashal@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 Sep 2026 09:36:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVVpAzuUDMn2zQmbOaLxiroyBGeyD9wZWe83dweoVPVqg@mail.gmail.com>
X-Gm-Features: AcwNN1XOZqE79DMSk78qvmSH-H90kBGDh0g78DMpY4SxMOMYafpm345WSAqwPF0
Message-ID: <CAMuHMdVVpAzuUDMn2zQmbOaLxiroyBGeyD9wZWe83dweoVPVqg@mail.gmail.com>
Subject: Re: [PATCH] firmware: qcom: scm: Hide QCOM_SCM instead of depending
 on ARCH_QCOM
To: Sasha Levin <sashal@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Sumit Garg <sumit.garg@oss.qualcomm.com>, kernel test robot <lkp@intel.com>, 
	Abel Vesa <abelvesa@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Sasha,

On Sun, 13 Sept 2026 at 19:30, Sasha Levin <sashal@kernel.org> wrote:
> imx_v6_v7_defconfig fails to link:
>
>   arm-linux-gnueabihf-ld: drivers/firmware/qcom/qcom_scm.o: in function
>   `qcom_scm_pas_init_image':
>   qcom_scm.c:(.text+0xecc): undefined reference to `qcom_tzmem_alloc'
>   qcom_scm.c:(.text+0x2b0): undefined reference to `qcom_tzmem_free'
>   qcom_scm.c:(.text+0x1514): undefined reference to `qcom_tzmem_to_phys'
>
> QCOM_SCM gained a "depends on ARCH_QCOM || COMPILE_TEST", but it is
> selected from 20 places in the tree and several of those are reachable
> without ARCH_QCOM. DRM_MSM is one of them, via SOC_IMX5, which is how
> imx_v6_v7_defconfig ends up here:
>
>   WARNING: unmet direct dependencies detected for QCOM_SCM
>     Depends on [n]: ARCH_QCOM [=n] || COMPILE_TEST [=n]
>     Selected by [y]:
>     - DRM_MSM [=y] && ... && (ARCH_QCOM [=n] || SOC_IMX5 [=y] ||
>       COMPILE_TEST [=n]) && ...
>
> kconfig still honours the select and sets QCOM_SCM=y, but it does not
> propagate the selects of a symbol whose own dependencies are unmet, so
> QCOM_TZMEM is left unset, qcom_tzmem.c is not built, and the
> unconditional qcom_tzmem_*() calls in qcom_scm.c and qcom_scm-smc.c
> have nothing to bind to.
>
> The point of the dependency was only to stop asking the user about
> Qualcomm firmware interfaces when configuring a non-Qualcomm kernel.
> Express that as a prompt condition, which is what the same commit
> already did for QCOM_PAS: the symbol stays invisible, but it no longer
> carries a dependency that silently drops its selects.
>
> Found by KernelCI builds of the linus-next tree.

linux-next

>
> Fixes: 8fecd3194de3 ("firmware: QCOM interfaces should depend on ARCH_QCOM")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202609120634.g0HMAp3g-lkp@intel.com/
> Assisted-by: LLM
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Thanks for your patch!

> --- a/drivers/firmware/qcom/Kconfig
> +++ b/drivers/firmware/qcom/Kconfig
> @@ -26,8 +26,7 @@ config QCOM_PAS_TEE
>           by the firmware TEE implementation as the backend.
>
>  config QCOM_SCM
> -       tristate "Qualcomm PAS SCM interface driver"
> -       depends on ARCH_QCOM || COMPILE_TEST
> +       tristate "Qualcomm PAS SCM interface driver" if ARCH_QCOM || COMPILE_TEST
>         select QCOM_PAS
>         select QCOM_TZMEM
>         default y if ARCH_QCOM

LGTM for now, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

As the MSM driver is used on non-QCOM platforms, too, in the long run,
the "select QCOM_SCM" and "select QCOM_PAS" for DRM_MSM should probably
gain dependencies on ARCH_QCOM (like "select QCOM_UBWC_CONFIG if
ARCH_QCOM" already has), and the various qcom_*() should gain dummies.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
