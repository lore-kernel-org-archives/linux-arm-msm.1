Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789A7431E71
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Oct 2026 11:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791373520; cv=none; b=JIB4dVTMqZbjHMdfSRwaG/jZGxe816riOM0aPDCZtv2iojHhsatNrXF0L4D3Q4ktdz7tonrchQxTURYZJRtxYlAHsi92LvGoqrqeETMI8AiIapCoY4lZq7+2W3lmD1cA7ZZauPFKxt7mV2brJ6jVu9tlBHrgiX7klGjYgFrtqX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791373520; c=relaxed/simple;
	bh=nz28DfqvHtefyNegxqFh1duVUJANumKDTLI00w9IPY8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tDnKFhotf3Z5UOof4RK5brCWjjEZICCxQd2E3bn+bIjAFT1B0HQPoHD3w71mmKSdfV0Mqc5msox1mEdhePUm8D0kVAGs3SyvpJI07VZhNsk3p4qZVzBjaGliqrrO5HyB6a6RM7cZXeBvU+76ipUUOnUdHYU40zPc1okV8TQo7Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cvu055ET; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cvu055ET"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 229A31F0089C
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Oct 2026 11:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791373510;
	bh=nz28DfqvHtefyNegxqFh1duVUJANumKDTLI00w9IPY8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=cvu055ETLVJ5XMoJM+CIrEuMDk3VJcs4AkkpZyeaSYjh3dki7VugPtMmqvJgXLtfU
	 9I0GaD0ZZnzMsIETGB2Og49KiQw04ltHIXVjMyQQ90yjmB0ZFoAzYBt+pGo55Mt75K
	 xRhoA1OYlIeTUWZNh/bt7VgEtsMSwM5PgDufIE6qfHnnEIpzI9aDdFBXqd0gxwb2bX
	 tFgccpiyrigskdeLjA+4WVk998CWg3r6ORsvLp1bTSvN3rnsP4AJOIQosk5VBBoxBQ
	 POgjg2Hn2xgm0eVeVlJvxvay9RBIjte8KT7XEsLhAwilfzJFAcbKcr8Uzcs59D0r/E
	 4SosWiCUJdY/A==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3a98f260f85so20550501fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 04:45:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw6uwDOZMEW6/Ym0dMbQUOLOb9egqVZHi/rezYPcutPIdSMJdHn9PKwa7EYXuQ+6sxK/RFlmY3jhgxDPvyh@vger.kernel.org
X-Gm-Message-State: AFq9FYKn7J8TINwRwRc0tGdyBFtSdfUrGCl9Hbf1uZvZOhqIBzILH4cM
	LgEb3VDryd5bUxrv2MuJuQPtmdcQQCX0MBl7EY8fSEPMvHuuXnWDz5+Q5Ryv+lU+q4K5K4gNKwm
	R8aijEvEYlKpn8NXKKWohr1FCYUDkw5Q=
X-Received: by 2002:a05:651c:b08:b0:3a6:6831:6e28 with SMTP id
 38308e7fff4ca-3a9a2c34eb6mr4880381fa.6.1791373508809; Wed, 07 Oct 2026
 04:45:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006231900.3230373-1-briannorris@chromium.org> <20261006161337.5.Ica4bfaf179a86c8d77f8f845826602914b81181b@changeid>
In-Reply-To: <20261006161337.5.Ica4bfaf179a86c8d77f8f845826602914b81181b@changeid>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 7 Oct 2026 13:44:54 +0200
X-Gmail-Original-Message-ID: <CAD++jLm0w_fs-O_BSwTVbGOwozB7yBcFAgTe=ubzFE_SxWjSUA@mail.gmail.com>
X-Gm-Features: AclHuK_tq1pfIubCAp0KCEs_RXsZkfKO4Fx3eMbI5PAcOYf2xBy3KSKKGEfBZkw
Message-ID: <CAD++jLm0w_fs-O_BSwTVbGOwozB7yBcFAgTe=ubzFE_SxWjSUA@mail.gmail.com>
Subject: Re: [PATCH 05/13] pinctrl: qcom: lpass-lpi: Discard
 pm_runtime_put_autosuspend() return values
To: Brian Norris <briannorris@chromium.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org, 
	Ulf Hansson <ulfh@kernel.org>, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <brgl@kernel.org>, Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 7, 2026 at 1:19=E2=80=AFAM Brian Norris <briannorris@chromium.o=
rg> wrote:

> Passing the pm_runtime_put_autosuspend() return value to callers is not
> particularly useful.
>
> Returning an error code from pm_runtime_put_autosuspend() merely means
> that it has not queued up a timer or work item to check whether or not
> the device can be suspended and there are many perfectly valid
> situations in which that can happen, like after writing "on" to the
> device's runtime PM "control" attribute in sysfs for one example.
>
> Accordingly, update the LPASS LPI pinctrl driver to simply discard the
> return value of pm_runtime_put_autosuspend() and return 0 to the
> callers.
>
> This will facilitate a planned change of the
> pm_runtime_put_autosuspend() return type to void in the future, similar
> to commit 3afd8df02433 ("PM: runtime: Change pm_runtime_put() return
> type to void").
>
> Signed-off-by: Brian Norris <briannorris@chromium.org>

Acked-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
