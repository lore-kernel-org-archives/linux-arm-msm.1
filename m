Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C3547D478
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 16:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787243886; cv=none; b=U6JkbXLuIucTktE8Dvxd6Vm18F5ANlZsE8H4M/TaUW2a5mufMFNSLgR5f1yFVQURaQMcMBTJLcLZ9fUmTkh0asw9ly1aI4c3/TgsGOs2ssKuNzGotZM0icDOyhW/BmRsO9CguO9CDk9H5itoZinj9MUT2/+ih06b1TCyVRV9Sx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787243886; c=relaxed/simple;
	bh=9VIAdGxSp2wAwONWsuwIOG0ANZNJMdmKrPjHId5rZqI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rcPiBYY+7RAteK6MGsXj29ESUzsv+8L3pqQrdxQ0I2n8kPBPKXgmoX/WA0swPPeyRl3L3Ql/AK18fF5lLI2W1a6a3Jwa9h41SXK0O0ouu+xnhRqDhNZ1hDxIPzvlqPw2AR9JncIG0BlTarjtmQfKx01A7DunGo4vlI9gPcJ7vLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a/qYns4z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a/qYns4z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D95811F00A3A
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 16:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787243884;
	bh=9VIAdGxSp2wAwONWsuwIOG0ANZNJMdmKrPjHId5rZqI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=a/qYns4zyUuV9s0SMrBkLCupSKfy3sLgnKywJHrlmC0YGjsOvxJrojGGcIGl/dE8P
	 IOQrFFQjkSB/VjxFmBMLPDVgI4oTV3ow0Yj8+P+lpciaYbVlMsPT+V4vfp+SMJ9kq9
	 YvrYMbnB+IjR534TNuJYrHaQg145NrX/zhkVAeZPs5NM1ZRcIhpPg3Ms/JM4dfULhz
	 5OJKBBSnRlVtOvXi9s19qbDLIqX5MHrFRCaxitk+H9XHz+jDi7Mb8+sFz6dbe9A2s2
	 FcYsVB0aNJK1wr7Qtnpb1kwQwu0h63Kpoe46STb3gCut5k09gBmwSuYlW3klQDdVei
	 rQ4ztMzDjsXfg==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5b29599b81cso62271e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 09:38:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoxJkSddDf1MynCjITgBwXpXzlCgyqFgvq/jWFMW0zA8leaW1kcHk1BOIdrtulOnrQFg84lUTz8gnzNPkP3@vger.kernel.org
X-Gm-Message-State: AFuF++mO1PtRK20pv5yMLXDron6mUleQW7alzGnXrND3ELONmR6ihXs4
	mXfJrOCgIGZ4JXV1QDv+LmsWoKCXlUMgUWZ/AuzSAnGzDF6J6CopEm3OM87gI92nyIQJPxjwRCv
	vF71fx7iBxBVPpH9tSahk/flJ5gD0VXU=
X-Received: by 2002:a05:6512:3da1:b0:5ae:b59e:aa45 with SMTP id
 2adb3069b0e04-5b478b6e385mr4801077e87.17.1787243883692; Thu, 20 Aug 2026
 09:38:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260820-msm8952-pinctrl-v2-0-bf2b8b7b379b@mainlining.org>
In-Reply-To: <20260820-msm8952-pinctrl-v2-0-bf2b8b7b379b@mainlining.org>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 20 Aug 2026 18:37:50 +0200
X-Gmail-Original-Message-ID: <CAD++jLnGGonfOxLHhM-uXAzP10J9o5=0e_cV9JM5r7SJawChnA@mail.gmail.com>
X-Gm-Features: AcwNN1VIofihN13MO74vPgIKX8RfzOrO0BtkLko8hhZ6miZ8I36rRd39GndE8sQ
Message-ID: <CAD++jLnGGonfOxLHhM-uXAzP10J9o5=0e_cV9JM5r7SJawChnA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add pinctrl support for MSM8952
To: muzafferkadir@mainlining.org, Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 20, 2026 at 1:17=E2=80=AFPM Muzaffer Kadir via B4 Relay
<devnull+muzafferkadir.mainlining.org@kernel.org> wrote:

> MSM8952 has pinctrl system that is similar to MSM8917 pinctrl, but it
> has some differences in some of the pins and their functions.
> This driver was tested on General Mobile GM 5 Plus
> (shamrock) using my own kernel fork [1].
> I'm holding off on sending the GCC (Global Clock
> Controller) driver and initial device tree until I've resolved some
> outstanding bugs in the GCC driver.
>
> [1] https://github.com/kadir1243/linux
>
> Signed-off-by: Muzaffer Kadir <muzafferkadir@mainlining.org>

Bartosz needs to look at this series, he'll review and merge
it.

Yours,
Linus Walleij
