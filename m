Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC55139AD5E
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Aug 2026 17:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786899716; cv=none; b=FLZP6WeJi02hCG7UGSUxhhljixTJrmkfm8JDAA2RDrpVoF1OKv8pladpedR5Y3yOkO2fVU9lZuefPJb03S9kS9KzGo1r8plhbl1uppeJwG5A124lMgg7DsJhHlFjllAvSoDwr9p1CnI70x3FmKucCejZCXvQWa5Jo6CC2+r1zKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786899716; c=relaxed/simple;
	bh=lSJQLIodR3waRArNX7nAQigBXZ7KMNI+H3yZs3Z0s/o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hoRUw01456P30M2sYUsBiPHU7cewCdk5vK8WbR0L7/qCNrpJfCxkvwTAfRRkbFbm+vZSpuMicEtmm3Bs33KTrTK4ffZjI4naT0YjfdzzWRy6CzvY4HzLyKJhVjh9mJt0Xk5H/ne34O4HeOAAtwroLOwiSzrIzCkmAgaKrt7QK18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YtxQnNrV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YtxQnNrV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 763831F00A3D
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Aug 2026 17:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786899714;
	bh=lSJQLIodR3waRArNX7nAQigBXZ7KMNI+H3yZs3Z0s/o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=YtxQnNrVUSTzePIXxlBG8TSP/JEYZW/IWl13arpuBcl5FQ9AEDvm4GzM8ZqJuz/jN
	 drezQ6bdv+QTg4DP3vKWAsHUvnmV9CqriZEH/5XFrn1SFOk7jtykvFo7Z6YuFuiue2
	 2dnU7uDeT2N81tjoIw9HqzKBtptHfCFtiDFsjFPu3QONCL3AKbw9K+eYp5zINIR9np
	 moNBMWF7dUVzFEuPZ46AehY7JPYmbZKCYnZxTYuxIvLiA6fRXyuVTrVQMfc683OfZF
	 o2KRyWSiXuPdBrIFJ61V1aH1gBkAW5D3NvX8EXfiC2QiBH3MKeaix7stCbaSqNa7oI
	 hREEGgpllqw1A==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5b2a22c52c1so2289152e87.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Aug 2026 10:01:54 -0700 (PDT)
X-Gm-Message-State: AOJu0YxcPyhApxvcptPC+WCznLfPbGwnPvvlMt/jhFa2GDD5DLoeNZv5
	mDRflcr05KtzWKYtEHf+Tl3xm9Y8rkE2PLZ6PWG+ePh5zWeLRUFLFf+J3a9nN9RbeqWNwWhAmhM
	4pyT/SlGdySkQ55nSaPLOY54bit5j/Nk=
X-Received: by 2002:a05:6512:3f01:b0:5b0:1f06:f204 with SMTP id
 2adb3069b0e04-5b459138fa7mr2771373e87.34.1786899713230; Sun, 16 Aug 2026
 10:01:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260813084642.11325-1-bartosz.golaszewski@oss.qualcomm.com>
In-Reply-To: <20260813084642.11325-1-bartosz.golaszewski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 16 Aug 2026 19:01:40 +0200
X-Gmail-Original-Message-ID: <CAD++jLnUFt8kKGumURy_Ohx7GvxSvko7=u_YGFkfK_KK=GnsrQ@mail.gmail.com>
X-Gm-Features: AcwNN1UADoNQ0z2nSAL4wSH8-R-tV791BUF-pIBxOXP0COAi1FbSRCbSxYhqaeg
Message-ID: <CAD++jLnUFt8kKGumURy_Ohx7GvxSvko7=u_YGFkfK_KK=GnsrQ@mail.gmail.com>
Subject: Re: [GIT PULL] Qualcomm pinctrl updates for v7.3-rc1
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, brgl@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 13, 2026 at 10:46=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> Here are the Qualcomm pinctrl driver updates for the upcoming merge windo=
w.
> There are two new drivers, interrupt handling improvements for pinctrl-ms=
m
> and some minor driver updates and refactoring.
>
> The merge from the irqchip tree pulls in dependencies for the PDC interru=
pt
> handling changes.
>
> All of this has been in next for quite some time. Please consider pulling=
.

Pulled in, thanks!

Yours,
Linus Walleij
