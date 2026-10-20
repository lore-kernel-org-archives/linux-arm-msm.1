Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792516593;
	b=4EY4hG7QV/TZKQ2knvvuT4/HWM3rU18UTH7xrBm2kR1IgUkBbxkFHQvQ6W5X5iAlEIJA
	 HRD9lYczXJomyrRfmywwvXNh4XVqzD32XaVyXMonf9/bd85XRmHIoxD9P88IVnVtHVL4z
	 xBn8mLfhR48O8Klu/6P8FAYiStJOGcrwMRBE0ezjf2ybyjq4qoyg2YMo3YmGSWNYomt9A
	 5whvYtUu7HPdZLB4DiiVLTjRqwDUsbmjXy07cYFYXRXRZlXRYTFQiRpLxu2XOUxini7sF
	 ERTZIh3Mqe5k3IaXMJL/n+lNK2KuXYjiMZuf8GL9X8VEuDRZgIYIb/hcdcIPHG+A1Uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792516593;
	h=Received:Received:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=8JgZTskEhAe6xxV6x68aEhfu2INYkml8PjbzJi5N0lU=;
	b=ufYTRy63KZqKydDbE3uKz0NtIYw6zaiAmZQ2q8neiHI0bxEPKob7IlcnVBGYFKAk0IyE
	 qs8ctvE+aOTVFmWpoB8KCSdYegkvX+DiatJREWFL2cAjELSA2Caxxzod8kPbs1XMLikDx
	 Cl3p2QetHF0ntmUe8Zqkh4Xe+LSIU+36+oLZtKfSPzT0KENK2wAgo1bsUdHAgBqovTjIl
	 2mZ4zD2WiFLdQAdhX+y8+hCnDMTn3n8ChTJGqLL39Z//3Y5gZQI+Q8lcJWwUFzUiVoio6
	 3opP1JPReXmj/+/kwgOAsnv/HowQNQ3R4c7s9sUQUgPtt33rKzMPP/2JbF+KuiTugYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95FBE606B518
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 17:16:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DD7F1F000CA
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 17:16:33 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5be4a2d94adso2872885e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 10:16:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz1Ye4MHAUxWj5ow75KfTEYdvQeXd6bMIIwC5pHp4eeWNyYWZqEcYG7A6HWVEvTasFCTHEIFo8jUcz2mvvU@vger.kernel.org
X-Gm-Message-State: AFq9FYJpdLzrTAxuFaQFQVXuU8gMBSyOuyPFHzKUTauIdauVvRI2vS5Y
	ZnC+2lh7Yl8cpNEeVamaTqx02mh0/lQ70+geZ6ddQbM1CfU+IKiJnBVybgDndFgYUXo1GPmQs0K
	0znJuVealhkjGXx4POni9aAFJ665u/io=
X-Received: by 2002:a05:6512:114c:b0:5be:4d37:3bc0 with SMTP id
 2adb3069b0e04-5be50a9dbd8mr4119073e87.62.1792516566187; Tue, 20 Oct 2026
 10:16:06 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020-iio-light-gp2ap002-v3-0-b7e0946c9e79@rudorff.com> <20261020-iio-light-gp2ap002-v3-2-b7e0946c9e79@rudorff.com>
In-Reply-To: <20261020-iio-light-gp2ap002-v3-2-b7e0946c9e79@rudorff.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 20 Oct 2026 19:15:53 +0200
X-Gmail-Original-Message-ID: <CAD++jLmCo8tnG5vp4Qv=6rDG3nob25LHELretdu7t3_SLxQASQ@mail.gmail.com>
X-Gm-Features: AclHuK9jGkoAjznqQZwxFsnHN6Zr-n0TfSZfEnfEZkRBZOBxywfmSrVOcQu4ooA
Message-ID: <CAD++jLmCo8tnG5vp4Qv=6rDG3nob25LHELretdu7t3_SLxQASQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] iio: light: gp2ap002: add led power supply
To: Christoph Rudorff <chris@rudorff.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 1:36=E2=80=AFPM Christoph Rudorff <chris@rudorff.co=
m> wrote:

> tested on samsung-j5
>
> v2: Use regulator bulk api.
> v3: pretty up, rename vled to leda
>
> Signed-off-by: Christoph Rudorff <chris@rudorff.com>

I think that commit message needs a bit of elaboration ;)

With that fixed:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
