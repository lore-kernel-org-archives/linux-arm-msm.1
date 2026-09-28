Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E841481A82
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 08:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790584706; cv=none; b=fbmJ4e8sVktpw68fR2rKbSvUzrC3+vEidNIKd+Yg5mimroI0+wJgM1sr02iORhmftHeElV/0q7LCq4WC77d0urRL2+qvtfKNqPePkJZuQh934arSPxz/yJUERzdnbdg94XvaE3Ti+GsNuoWt94jbONcX4i6QIl0DtqGs3K+EWtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790584706; c=relaxed/simple;
	bh=KzmtaBx/W7Qo6eJlSIglcMY97ok4d4GtoRfvLF0hscI=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EKij4lQdulm2wrfKTpUz32dWccBecfM66bcfyPOpmk4gBcmgw9koyHD8uNZd7Vni8PF/bVr0DMqsM6eV3Uwpnu80b00fuZAf0oNB1BmQSmTuALu7YjWhx6NvWh8lF6QVPrL6njVDCJ7WOaWwHs31njwKwKOzzMCe0GYpswlYSno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fk3TfVQ8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fk3TfVQ8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3F4B1F00899
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 08:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790584705;
	bh=KzmtaBx/W7Qo6eJlSIglcMY97ok4d4GtoRfvLF0hscI=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=fk3TfVQ8MwNrWU6IzYBQXGVhC+7X8nYQZRYw+k3Yoy5mHGBU5bsNSttCLOn4tIcf6
	 alM50OyxM2mXVJpsTVzS0j8N4MhabhzahjBjUpa77Lr2VzbbC0MPDef8EPEsa1zqQf
	 27EY3yixr6k0zTBpNh6+HLvn3ATCMb47fylmkf1oStT9Z+N4SO0XLMAyzdptmYGOSQ
	 WMyb2fXIyw/tYnaqM2N+emPTnuAuj+NAYgE6L0y7VBunrm8/IIqV433U+3aQVTcILL
	 d8mKJCXoh3WoDHK0RRMTxhaSae9ZsSgrIUs9YbFGjYYcWka8e5T5LCUxBQU8JoFq2s
	 jdGTbhUN0h73g==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b8f27a48cfso1046285e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 01:38:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzjQWFdGxLGglYVqrb+ISH7G51LoiULpirYK51C1idODIw+/WahsBszBAyZImQeN++5JQI1OUczJOYX0TMb@vger.kernel.org
X-Gm-Message-State: AFq9FYId4qhhqnixB9KWkwHSwJmIRy49LJnPy8V5q+UmaGnouh00wiFD
	O0NvD9GlSELrvzKWXGkNEKxQMRbUAU8rqg/Ht9I1DT/gsKICKmxXsHgEJbql3MbFQjqVicCsaY2
	24c9sWDQx21f+ZQxAAqSqaV1ZbA66CsXXtcZsya2gdw==
X-Received: by 2002:a05:6512:2c86:b0:5b8:9978:a2bc with SMTP id
 2adb3069b0e04-5b8e6d91f8cmr2796693e87.23.1790584703696; Mon, 28 Sep 2026
 01:38:23 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 28 Sep 2026 03:38:21 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 28 Sep 2026 03:38:21 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260924-ipq5018-pwm-functions-v1-1-8990a4e85b2f@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924-ipq5018-pwm-functions-v1-1-8990a4e85b2f@outlook.com>
Date: Mon, 28 Sep 2026 03:38:21 -0500
X-Gmail-Original-Message-ID: <CAMRc=MeJcYezVbqVq4cM2RuAtP3mxCuKKLMS3z+XqyS4DEa5qA@mail.gmail.com>
X-Gm-Features: AclHuK9pVuYMjJOL3S9OWFCVZ-No99gs9AaKgirufX3RDkqpWzOUGcwSuUMSUDU
Message-ID: <CAMRc=MeJcYezVbqVq4cM2RuAtP3mxCuKKLMS3z+XqyS4DEa5qA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: ipq5018: add required gpios and missing
 PWM functions
To: george.moussalem@outlook.com
Cc: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 24 Sep 2026 14:22:11 +0200, George Moussalem via B4 Relay
<devnull+george.moussalem.outlook.com@kernel.org> said:
> From: George Moussalem <george.moussalem@outlook.com>
>
> On multiple Linksys routers, GPIO 1, 30, and 46 are used to drive the
> PWM led on PWM1, PWM3, and PWM0 channels respectively, so let's update
> the pwm# and pingroups accordingly.
>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

Are we *updating* or *adding missing*? Depending on the answer, this can be
interpreted as a fix that should be backported or a new feature that should
be queued for v7.4.

If this is a fix, can you add a Fixes tag?

Bart
