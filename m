Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793971053;
	b=BzuO0HTi4CFJZ72fDfFjH76CDNBnDvJGNjnyCm90tXVD0kVsRCup/3sb6py2lxTKA+9h
	 B7wxkeXiQ6X2xoq5LiA3e78C1oucjGHU23XFym/zs6hg/CS7eo/KJXilmaPIa4+ihloo/
	 LVCfm33kaIutTMX+KwHvaoW/HeE77AbG5TEr4zn4HUeI6dPFuVdKY5mAbp6UT82PVTgaC
	 BZqdjq0+fLmRTjWKzAJAglal0H3Di9pU+Y8hcZZqtYVN1EjRtDAId5YOxsqpyb5G/gulG
	 qEktcXXMd2FuWr5kXQI+eYw2AfJ5F2lpzNp3ePvJXuBKg9kPItEcMgrLW7mAu2Ren/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793971053;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=u+wf99cMGcQ0pMiHmoB58UApKCibH+wm8RpTNlP6OIw=;
	b=V9A+J3jVi5xqTYDqN5yQtXXztkt2lpBPDqYPe48OFO6JildKfQ/LRHKKcRE4PmNIcU+n
	 L4wb1CzPFngCwhul1rPVKceLcld1aQgRrh28lJcP4CpSVR9cQ6q0EDXZ1kMxNp2SBT12h
	 K212DzucXa449Wku3w2wj+U4vo0EDVX50YGdljYmgJpMYH8iQqHcgohKw6cQzeOYIFsL/
	 jRMiUTBnfbY4hivsT4jon9IWiKXDNcDFVAI5BztrVI7cw9EJUvyTvSho2sBowO/5bpEpu
	 8bOjjTiJg6tCQNH6xvvByBs5EPXgAf3QmwRHoqaD7gSIz30j8KhSgRd9nj6arscVEBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GfynEgaF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3505606A32E
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 13:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GfynEgaF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46BCE1F008A5
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 13:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793971052;
	bh=u+wf99cMGcQ0pMiHmoB58UApKCibH+wm8RpTNlP6OIw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=GfynEgaFImZ746mES31pK1q7yEqfdXB+ZB4yDlEw3Z+sSnzAzz6//XKUgnTJkS5Jn
	 4AeE3OLN5vWpvgn6+hlRCbOM8V962ys2bNlnO8yb7Fg4MHR40KPWrj+XXJOH2kbsdc
	 C9TWWQAa22FJ/icts183MXcedtUP0q+So1USkbpUTyJLiAdv/kSLhlWAYB14mhQ18a
	 e8W8RVQ0ur2g0VI8OW4io0HO9cpCBP7gcsZdViZbuT/ebf9GGBg+vIzLSY6jXImDi3
	 zooBz1gt7JKIsTEvMQPGB7w+QVXRHdi4/7RFmH6S5IhtkEcAOJ0grIr5VXP4Ac+i8s
	 5rnTXe2nEGZIA==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3ab27b4924aso4005041fa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 05:17:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBy0XmQWpY5rezcTPgRSMYxkBm/wMaAvQ2ABGXL2Mc2SrUFHryQXsV4Y0CsLci0ymaASK337yMvYnh9W0XI4@vger.kernel.org
X-Gm-Message-State: APuU4Z+Tlpazn1MeKyhFeaDw2duIXE7GbF9LinR77nb7Z80Ehtifqsx/
	/afDn/t2DoHpUl4yonzdvGBtfJKodAbYy2wEpDdLjUbfZe3MP0up9HsB/pN/dfXzl928u04xmRk
	aNGk8axqfEmc/cQKCu2fjBkRnN0oN3No=
X-Received: by 2002:a05:6512:ba5:b0:5bf:fd1e:1677 with SMTP id
 2adb3069b0e04-5c003c088d2mr846658e87.63.1793971051040; Fri, 06 Nov 2026
 05:17:31 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-pinctrl-qcom-uaf-v1-1-c9cbc0a93161@oss.qualcomm.com>
In-Reply-To: <20261105-pinctrl-qcom-uaf-v1-1-c9cbc0a93161@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 6 Nov 2026 14:17:18 +0100
X-Gmail-Original-Message-ID: <CAD++jLn5fT=DuVZkXQdW4rM7Td46sKAfBxUkeYCrYhGj0KyHUQ@mail.gmail.com>
X-Gm-Features: AclHuK97tULkimWCed7he8xYURQ5GlgGYoHRoVb9Wa0-fs_u313mHIyxiwKFPhg
Message-ID: <CAD++jLn5fT=DuVZkXQdW4rM7Td46sKAfBxUkeYCrYhGj0KyHUQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: fix a use-after-free bug in system
 shutdown path
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Stephen Boyd <sboyd@codeaurora.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 5:09=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> msm_pinctrl_probe() allocates the pctrl structure via devm_kzalloc() and
> unconditionally populates the global variables poweroff_pctrl and
> pm_power_off.
>
> If msm_pinctrl_probe() subsequently fails, devres resources - including
> the memory allocated for pctrl - are automatically freed. However, the
> global pointers are never cleared, resulting in a use-after-free during
> kernel_power_off().
>
> Schedule a devres action clearing the global pointers that runs before
> the pctrl memory is freed.
>
> Cc: stable@vger.kernel.org
> Closes: https://sashiko.dev/#/bug/linux-0c3a18a4-3de8-489b-abc9-e9e3a8641=
ed2
> Fixes: ad64498762dd ("pinctrl: qcom: Hook pm_power_down for shutdown supp=
ort")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

LGTM
Reviewed-by: Linus Walleij <linusw@kernel.org>

I guess you will decide if it's an urgent or nonurgent fix and
send to me as pull request.

Yours,
Linus Walleij
