Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792516533;
	b=NRo9eRlGbR4GD1SHDIgUbMtKOgE2nNR0EOmE0+ppFCkMBMOuQ0bH22IvLQT4z3jVxYE7
	 nEHKDOzr7KW6tddOqnxMi7AIhPmeRfhy3f8NdO+IOJjyhdrOfwCWaVaOxU3JlXZc2DktM
	 Jv0azvw2uWExxynl07zZSQhfTBv8K66NSWXwTk3L5/N5N6LWgUznxjeVqAISfTMh72L3K
	 RBTiKStj7BuESrk2X2V8ZYjXUB0OqK0mYYi8OXzcruNHp3S4DmlFYBi3teyS3DKAA/Axy
	 PGpG5MJzJGoNYJM+LWfTj9MVt0pVFbiyaTb5KbaoHC5uYE4XMD4J9G6pgWVJFGDwXYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792516533;
	h=Received:Received:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=+7AvEO87agVesSj9EpGksF6DuYMEbv0EchchTnG8b/k=;
	b=qkWILJjfImY6yL1fgMMENJv3J61EzTRoQSdUPyByfJPMdTFhu+3y1Jmp8wX3YG3iRWmy
	 Op99c+NqOr9zcUn5GRB5jNVJ8dHG++yhbze0H+wKLidT+fjD64UDD+o0FjX1avd5kxISi
	 ltO/3dTHuPKN9KfUfhkf097pOjEKyo8Et6iYARzr5/DWCEWLjNBoB48mOUgTSgwtxd/e7
	 E2h0HTKaEV3oUpQuANZN/oD1sofhkUJDudaL3LrzfTtYU0fDBFO6R26M3tlwz4ILu2wxa
	 tsY7eQR8hbnOdioMNxiUI3ffaK/5afKZ78Cf87ayIaRFznXTB0VBRegu576SygAptYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120DB606A319
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 17:15:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B65E21F000CA
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 17:15:32 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5ba36cc21cdso616198e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 10:15:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz2F4wXAg7iwxc4bJpmotgUU6d4eX7eYwlp5qv/nJLzIcMGAwDNLcwWREhHfeqK0l8AiB281moAXcIUXnbZ@vger.kernel.org
X-Gm-Message-State: AFq9FYKtPmyyCDSNDsHaZKGXlgG9mGRqCVG27vrDoSUIDvCqUGXpzkeU
	zydJvTEBSMX61DPxUp/4xiZUo0iDHnLrK9bQ8l3pN4RkSEyycfm+AdT4xBWuSpOHCiehkWb9iEr
	sNO0hX3D/5Z0Row9ea3j3LSlDu0oGROw=
X-Received: by 2002:a05:6512:33cc:b0:5bc:b0f3:8a4e with SMTP id
 2adb3069b0e04-5be50a62a31mr3833052e87.43.1792516501664; Tue, 20 Oct 2026
 10:15:01 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020-iio-light-gp2ap002-v3-0-b7e0946c9e79@rudorff.com> <20261020-iio-light-gp2ap002-v3-1-b7e0946c9e79@rudorff.com>
In-Reply-To: <20261020-iio-light-gp2ap002-v3-1-b7e0946c9e79@rudorff.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 20 Oct 2026 19:14:49 +0200
X-Gmail-Original-Message-ID: <CAD++jLmA_CAJi31OJe19A1H316XfigAKy5XbGcpvj1CYzPYY2A@mail.gmail.com>
X-Gm-Features: AclHuK9Cj5HfENDrz3fDPSLBKmxyGLPpayybWidXDJBEn6zBCvvY9bndZC-YM6k
Message-ID: <CAD++jLmA_CAJi31OJe19A1H316XfigAKy5XbGcpvj1CYzPYY2A@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: iio: light: gp2ap002: add leda power supply
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

> According to datasheet page 8 "Recommended external circuit",
> it has tree pins that need power: vio, vdd and leda ("vled" !)
>
> Signed-off-by: Christoph Rudorff <chris@rudorff.com>

Looking good!
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
