Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793416226;
	b=0kKo+5UAA+HTAUIaiaDSJ9fBvBnW6JQ8kooWIEVezpeXUomYkBieWVH0r+4byWOvGCg+
	 oDQMBs/eqRyF+fyMfKuytonrZpD846A53uk+/jMehWlWbmwrUe4gsWlI2qw96UUcPBLiw
	 v7ULJvhD5igmWeTzoBixEX9LdxDjwn+ccN1cqd0d8NTFemshSpqnV7vtmReDeE3YEeGz6
	 ydU17do7IIOVee/iQSy/4F+6/XKn20qhJ579lI4zWAyAMsz7EPPIukZb0aloIfUfvf16E
	 nzSkHW9Bpuo+y6NsDBUGCGBpYU7/M2hElHuX5PAO8U6u6n3VSfB2zAUB82LGiCl5hyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793416226;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rSQVuufJqG4DagM4PmCmZM1z/EqJK6JLyOoiv3ybUJs=;
	b=H9rtWOyBfxEpH4c3zfbY1YHlmdjHwwKHbv0CnYYzK65AAypL9k3o8vxaO4ynH0y6R/ez
	 J7a04jV/MxG3CLUbDSOubtzTl2RFNBGn0fZv/Qjplz+3Lq+sMHO5Ue1OS50wGhUKGuCm4
	 LoHgB3SyDuoiZJJeU6825CaPVLrX4D4zUIP1X2jRaAQZaTgN//6hqpJ7SY43Edyo96FZS
	 l61+OSei0s6bzBE2IB7CGyWKzelArYpXFjD2kjeQvUqiOYFSpAG2JuKAukjS7HYlfD8bI
	 sCGFjuD3RpuEduIt/JFL4KF589zFN2aVynT3EJzbQHhaWnlU7j2LMm8RlVSnR4ISxtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=kUKeSNNY;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65CDF606A31D
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 03:10:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65CDF606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=kUKeSNNY
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c414e5d282eso166398866b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 20:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793416225; x=1794021025; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rSQVuufJqG4DagM4PmCmZM1z/EqJK6JLyOoiv3ybUJs=;
        b=kUKeSNNYvtbgcx/HVcArHCvrBIAzQNh5o9VvYAMme19Qd1VsR4RH7EPG329JlYuRqR
         JBavE9QDEQdigk/el50pqv3bHy0idX2JWpZswhOylbTRy9TWdo8J31J5ODQamoSmzPP5
         Z5bcnXqCnDYvZzow2gwKYaGeW0rvbEcj5VmWw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793416225; x=1794021025;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rSQVuufJqG4DagM4PmCmZM1z/EqJK6JLyOoiv3ybUJs=;
        b=K4ZOd48k1zG4thZawdXfkS0drmSOgZF2a6m5YEIvUmae3SeXvT1thcIomv9qPwvsV+
         kX1ulGG2lkvj/DDHEeU+3/Xab7/7RMI3wpWy1C4i3E1ppcIEeWXdCceigHnTTXTDu4d3
         hljWaECJ5+o1Cz+xXMn/r1hDHSffreYUqxtdguoY+XU09gCh+ByVAlqTc3x4YktPWvzI
         gJPBmxLBUnrboc5pQm/2idCif9/N/WT11jfzEdEjpepIq+jhtXUCrQtBf6jkL27KRXRU
         gIMGgqG4zpj2DbKLlqaKegqDhg7bI+g95tA0FJEJJaQuYTsX4BKAofdre2dAq+t8qmZW
         72KQ==
X-Forwarded-Encrypted: i=1; AKwUvBzJ/ig0l68b6kUcC1+YoWKzTfV6M1/8i2b15HU66jt91lVirTa27lbgEVf5QFQ2rgvenexX4rdrsLQwIfQl@vger.kernel.org
X-Gm-Message-State: AFq9FYI1bdySwdcQAlDC64/vR4oD2Hr+dMW7dnVVwqmntOxgaIFao5SL
	6+IDTxa1VKP1mA1jCzVgqk+7jWGftTiKH1sG0J0GvW+cfijEFoUJiSYcg3oKrwKL4QLJFSGS5jE
	Ama9nPR9L
X-Gm-Gg: AYBFou2Fvelqi58xqpGuUc0AxhE6Bb5L2CqbhQ9Eof43lq/PGJENTFFlqNz/Z864GKh
	JAJoWmZ8oGzZXaewq10s90Z0wnUyjNw4Pnkie64AJe2p+RC3usGtXLA8boIUqoXY5bCt7rkcdFA
	2+UDR2NQW3A9R4KYDECqH9Fv56kjAyXV4hYIWEc4Z/qPm1uxPpAc8BnBqB84+UrUX1ip9S0p5mx
	UP29s5PyF4wu/guWcolmhj/yYvPu08ffTUJqm0OPvwocFdpm0zrEKSpzxvM75aej8JJMkrIDq6d
	XqUkYw4tta+ELImeUmIYCaC5D48SOI+Na15YZ0LuwUY5cbCVUR+e1LPs4CChcWWE2kAslflvJUa
	OH5OOvmxc7LP9VVjILUQ70MN86r11yllGl6299fFAzOFQ62gpRwzeulh2h/KYj/kq/KCDa5TA1s
	GzfYMEXnIpaiM93LuVwGSywq2qB431DLCTQ6zGdQm9eWYKiLZY/QNGr6991IkPYOjOQE7012Dwo
	0rRGmI7YBB4tj5Xrjr+i1k63ARym2SHbjIVhn6g/8lbMumlkYkLRgzQ7TW7pTTM2QKhf7A0guCf
	iNToKI9sFcA40dxGCD7zIs0QTImtAqdQ1SaCgPYPMDxegbsSEV6AqFmrMWOdMGrM1cyP
X-Received: by 2002:a17:907:3ea7:b0:c25:2d27:5652 with SMTP id a640c23a62f3a-c4ca7aefcb6mr354532066b.11.1793416224819;
        Fri, 30 Oct 2026 20:10:24 -0700 (PDT)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com. [209.85.128.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe4aa07sm131822766b.63.2026.10.30.20.10.21
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 20:10:23 -0700 (PDT)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a208d93758so14131595e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 20:10:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzKUyhru4T16xFpj4mVLCaVBga5PXDw4yqP4HAhH9G9klpUzp8fZtldvptL+8Sw/A3mL8pAeXJIUfnao37t@vger.kernel.org
X-Received: by 2002:a5d:5f84:0:b0:48d:eec6:308b with SMTP id
 ffacd0b85a97d-48e6e4f561bmr9818154f8f.21.1793416220997; Fri, 30 Oct 2026
 20:10:20 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020153652.2907186-1-dianders@chromium.org>
 <CAFLszTgzpQ-donjjtcPwy5T3pfWg_u83QMh0GcdpY2JCq_s75w@mail.gmail.com> <CAD=FV=Vt6hgGJuYtv1_mBSQztWQBjmDN9CwLtVxrXcyECGx2-A@mail.gmail.com>
In-Reply-To: <CAD=FV=Vt6hgGJuYtv1_mBSQztWQBjmDN9CwLtVxrXcyECGx2-A@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 30 Oct 2026 20:10:09 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xxn75bf6ZjRPyQ5jfWwxx9cPe8_8bV6qzAXQc+gckB-A@mail.gmail.com>
X-Gm-Features: AclHuK-bghq4wzz1qNlwlR04GGQ-u_3zjoGTgsEW-iZ0A7dRvqdHdSoL4JcYqzo
Message-ID: <CAD=FV=Xxn75bf6ZjRPyQ5jfWwxx9cPe8_8bV6qzAXQc+gckB-A@mail.gmail.com>
Subject: Re: [RFC PATCH 0/7] arm64: Add fit images for sc7180-trogdor and google,lga
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-kbuild@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Chen-Yu Tsai <wenst@chromium.org>, linux-arm-msm@vger.kernel.org, 
	Nicolas Schier <nsc@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Nathan Chancellor <nathan@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Devicetree@vger.kernel.org, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Will Deacon <will@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Alice Ryhl <aliceryhl@google.com>, Andrew Jones <andrew.jones@linux.dev>, 
	Bjorn Andersson <andersson@kernel.org>, Breno Leitao <leitao@debian.org>, 
	David Sterba <dsterba@suse.com>, Gary Guo <gary@garyguo.net>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Luis Augenstein <luis.augenstein@tngtech.com>, 
	Marco Elver <elver@google.com>, Mark Rutland <mark.rutland@arm.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Nick Terrell <terrelln@fb.com>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, Rong Xu <xur@google.com>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	cros-qcom-dts-watchers@chromium.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Oct 30, 2026 at 6:09=E2=80=AFPM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> > The FIT_ITS path is a second way to build image.fit alongside
> > make_fit.py, and much of it repeats what make_fit.py already does: it
> > puts the root compatible from each DTB into the configuration and
> > compresses the DTBs. The series adds fdtget/fdtput, sed parsing of
> > /incbin/ paths and a shell loop in Makefile.lib to do the same for a
> > hand-written .its file, and the .its files repeat the DTB lists from
> > the Makefiles.
> >
> > Have you thought about extending make_fit.py to take the per-board
> > metadata (e.g. from a small file next to the DTs, or via
> > FIT_EXTRA_ARGS) and to run fdtfactor itself? That would avoid the
> > in-tree fdtget/fdtput, the mkimage dependency and most of the Makefile
> > logic, and trogdor would come almost for free.
>
> I certainly can do that if that's what people want. ...and, yes, I
> think it would simplify some stuff in this patch series. The
> question is: what does it look like? Is it a file that is a list
> of devicetrees along with descriptions? The list of devicetrees
> would be to limit which devicetrees are built into the FIT
> and then each would have a description. ...and yes, that would mean
> it would need to be updated in parallel with the Makefile, but I
> don't see a significantly better way to do it. Yeah, I guess that
> could work OK.
>
> If so, I think a bunch of the patches in this series will be
> dropped or look very different. I probably won't directly reply
> to your comments on patch 2, 4, 6, and 7 if we go this way.
>
> Should I give it a shot for v2?

FWIW, I did a quick prototype of this, and it is definitely a much
smaller / less invasive patch series. I've got
"sc7180-trogdor.fitconfig" and "lga.fitconfig" files. Because they are
easy to parse in python, they're in ".ini" format in my prototype. So
"lga.fitconfig" looks like this:

+# SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+#
+# Each configuration description encodes board and SoC matching metadata
+# for downstream packaging tools in the format:
+#   "<Model> (<key>=3D<value>,...)"
+# where <key> includes board_id, board_rev, soc_id, and soc_rev with
+# hexadecimal <value>s (in any key order).
+
+[lga-blazer.dtb]
+description =3D Blazer
(board_id=3D0x070406,board_rev=3D0x010000,soc_id=3D0x0005,soc_rev=3D0x01000=
0)
+
+[lga-frankel.dtb]
+description =3D Frankel
(board_id=3D0x070306,board_rev=3D0x010000,soc_id=3D0x0005,soc_rev=3D0x01000=
0)
+
+[lga-mustang.dtb]
+description =3D Mustang
(board_id=3D0x070506,board_rev=3D0x010000,soc_id=3D0x0005,soc_rev=3D0x01000=
0)


Happy to post a v2 RFC showing what that looks like if you want...
