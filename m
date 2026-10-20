Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792516641;
	b=i29g7sS7rfjhbkx9EjR8ug7k+8oggo6t8Nks3HF0kv4HBq+ERxecwdJUe+Q225VYBA4u
	 smItfWwWWT3APyLeG8QTKcuc7KuzNfWfrJ9fg3wxbqg5DUa/fjupayRRd12oEnJKPhcD/
	 4P8Nze5t5ITYV7FZ1SFcpQGSbNsTlQgroX3VvLReXDBG+tdj6P8qv0+wn4XweufLkI0F6
	 27giR8aukmfJjkWnKvT2iVWU5WynNKqIk6HyOdyGrWjVEuDv5vevpqeOsKl/ftyTf41Re
	 RrKjxCNU0/6m/+Hofr/ILOr/pGTyLiDg2QwoxaW8cO7PuNFTEJ4hvgaemU4P+ltqrjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792516641;
	h=Received:Received:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=lZsoV5xV/qdIzsmQoRFkHO+0ZG2LBiefLdsROQtEphU=;
	b=286c7YXH7AACrIXwBipPYF9M2IKnlMDQZ1bT/cHOoPOFS9EyyZPBE7LQz8ydsIRiXQ8L
	 MEVLsU2YrtB9y3SafcZeM+FPo1oZvBlgvH0Vm1XxPlUNBgIVMfU3CQBa/A3SlaD2EXKEB
	 anjyJaUU3w+b6tSY/wk4ladgToa9rnP4xFDliepdOp2Vd8aNBkG5FEHUqdS1qYGcBgAA2
	 idZ+Q6cvBo7pNhKBXoGAG6D6g+eZr/oeVFFYIMLy9pF/bj5F0IRldSNOlfmNTWHIqnD6R
	 +6P8vBJEMAD2sqy39/C/OhkrtxaZduNqL/hCbKlIfqzoOfsgE+kZ8WGeKdJm9wQAsnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7372606A329
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 17:17:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A28991F01575
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 17:17:20 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3a75f960be4so22727161fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 10:17:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzAx63Cn4jX/RUdStNL5q0Z684zVOGYUPd6aa6IxluH2auba5d14+l5ApvgUuJ2i2G18XdrQsrvrm4lY2Iu@vger.kernel.org
X-Gm-Message-State: AFq9FYLbD4nB72Zy5bdJuBRRXnZvrDfkx69cjCXpXBNI5DSDlaV3Pj4H
	kJwtGvmJHF5N4CTEd4Vr9GnHhwmfqhCTZiQlidpJ+B7zslr3EuMVpipaXJsA9iTh5FEQjMU0Emu
	z3dFvqnrvchnQoUw4+xP9UE6LQVF0fj8=
X-Received: by 2002:a05:651c:3614:b0:3ab:1639:9a79 with SMTP id
 38308e7fff4ca-3ab292b7375mr20330481fa.15.1792516609558; Tue, 20 Oct 2026
 10:16:49 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020-iio-light-gp2ap002-v3-0-b7e0946c9e79@rudorff.com> <20261020-iio-light-gp2ap002-v3-3-b7e0946c9e79@rudorff.com>
In-Reply-To: <20261020-iio-light-gp2ap002-v3-3-b7e0946c9e79@rudorff.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 20 Oct 2026 19:16:37 +0200
X-Gmail-Original-Message-ID: <CAD++jLne9-+i5aWejLoqb4ZYf8Bk66iifcaT1MV4uY80+9ORww@mail.gmail.com>
X-Gm-Features: AclHuK8o7YJtu4fGAIWMm54FLQfyDMwv1SgdLwwrUNSyOsI4L3FOJbzTrlMgBeE
Message-ID: <CAD++jLne9-+i5aWejLoqb4ZYf8Bk66iifcaT1MV4uY80+9ORww@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: msm8916-samsung-j5: Add
 proximity sensor
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

> J5 got a gp2ap002 sensor, add it and it's supplies to the device tree
>
> Signed-off-by: Christoph Rudorff <chris@rudorff.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
