Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3143F3D9557
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 20:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790886548; cv=none; b=O2wsrXo+Dmm0PzwxEgcO3E9W1jzJvvPPzQynV5YBXdU47Xut+2rTQycP962L5FmKi+H8LrssZcI5ZUCoQsM+ZK6Barp6onLP4LHu+CvC0dXRqwn3bMEK3GeAZE0T1zGPPzC792Gzh2sO5TKw6OJzcyhAOntLaFZTtPqIWBBZ4vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790886548; c=relaxed/simple;
	bh=paPuHBU0M0Fc5IP/EaRFCppS3a/8CMb5FKyqUyC9z84=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F1+pRBH5Pe4rUq1uPcUyWzR2TJXdQsVQqlyi5pdoKRRav47n3lW4OeEpBG3lJep0I+Hexx/BQSj4tXN4xWdZ4vZQX44+ZlMzcJC06u2lLO2ZzwDyUnkXoWxOAiYRjFbK4I5jaHTHkr2LQW/6bys+7paJgTsrHfHjTbi0JElntIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jDRATZB2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jDRATZB2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7AF21F0089C
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 20:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790886545;
	bh=paPuHBU0M0Fc5IP/EaRFCppS3a/8CMb5FKyqUyC9z84=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jDRATZB2NH0cAo2YivW7l5oPZS2/O8Vi0Jt47J7dV3XBFCnXeFZFs/vfHo0TTdZe2
	 lvLWITO4t9huQbzx/at4d3zclXoNkPaKHiZymAE3rAzs+JHc5tpMbUAy2xfBue3pH2
	 A2Seae+mTWsUnBtmC409hcQNE3FLHIDvVd/F/2oOJMp+0i7pNET9unYhWde6pdUA6K
	 y4ueDeDqfNcBGMqHjejiMLGb13V4WIJRCU17SJEQptYGJrDx5lj6wP+ldOtOvgJ3oX
	 jFKnpd9muy1ZwSTEGUc8p4+k7M5AP76NTS/dkmIYEywl8QZ92BB9vkzgxfAD3YxYuu
	 PjaLU93BFGYDg==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5ba379d8804so3058325e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 13:29:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy5CkX1JYyRQIJlAn4ZHawjLDuSM1wH6n2wZdTXW4W4RhOIRLhBBiQy8JN3UAg754GGAulJf287qjxpvATM@vger.kernel.org
X-Gm-Message-State: AFq9FYIj3cvp6Ja5bw/2N1qmK0CfAP/9XDjpM4iiVX5A0B+DxC/IEORc
	YjpLirtd/kECB1cMTrs7n9/b2Jog+aaYpcYS8Nc+mmM2hITBFz18SMRtyQd1YHBaVcncSbRkng+
	kDp/74tVbli2K2LvRl6y54ZAI0u6NDsY=
X-Received: by 2002:a05:6512:688d:10b0:5b8:e83d:6c13 with SMTP id
 2adb3069b0e04-5bb9bc3b324mr96264e87.56.1790886544629; Thu, 01 Oct 2026
 13:29:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929-gpio-shared-fwnode-lookup-v1-0-57d54811de1a@oss.qualcomm.com>
 <20260929-gpio-shared-fwnode-lookup-v1-1-57d54811de1a@oss.qualcomm.com>
In-Reply-To: <20260929-gpio-shared-fwnode-lookup-v1-1-57d54811de1a@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 1 Oct 2026 22:28:51 +0200
X-Gmail-Original-Message-ID: <CAD++jLmMd3XeaVW_0hqDmuci_RJPcR2pfXwAgYwEh=qKWcPKUg@mail.gmail.com>
X-Gm-Features: AclHuK84HZUC2aYYvjVIwuAhm4fop0VNbRvpCIR7Rh2oI8vGX-AbPiBp13xdE7c
Message-ID: <CAD++jLmMd3XeaVW_0hqDmuci_RJPcR2pfXwAgYwEh=qKWcPKUg@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio: shared: fix use-after-free bug when adding
 shared proxies
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2026 at 2:32=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> The GPIO lookup table can stay alive for longer than the kobject whose
> name string's address we're assigning to lookup->dev_id. Fix a potential
> UAF by duplicating the string.
>
> Assisted-by: LLM
> Cc: stable@vger.kernel.org
> Fixes: a060b8c511ab ("gpiolib: implement low-level, shared GPIO support")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

That's a good find.

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
