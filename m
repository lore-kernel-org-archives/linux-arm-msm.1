Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8BD035F60F
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 05:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785389066; cv=pass; b=VWxnHEX/CgiBhr4GFmK8MgXKnI4capGNyWvVlKHGpPCo/UE3AWnfYvWQGmd86YoLXBu+wUdPtCo8+62Lo/JLgkaaRraWwvbUACa0BNKPAWiaWUbcycs65BshdpXA4VCmsucP/x3NquAA797HDLBOkyvD798RP6jX37VnOeR1u38=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785389066; c=relaxed/simple;
	bh=iD44/rGtVzEnXi4gt4YVeymeNme8+lpJ4mWrVC12JEw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B+tobmHScj11tPk3rMtum5CK0RwzZy7vqIEQUwboLiUAHmn7EZ8eCuuNHkCHPPCYs7YS8l09KpamsVe0yDArA5hx4YJh1ntms0mMrn0qoapeLgupXKM7BSBroqm0O1xhBnQAVjfGLEmsNUJ8CYI6LTJcX4TOEIOzwJF/DQ1AC5s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nd/NscQB; arc=pass smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nd/NscQB"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-664e3ed58bcso584632d50.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 22:24:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785389064; cv=none;
        d=google.com; s=arc-20260327;
        b=EgYJEUg/+FPJXcQve7ySjs6wMrWLvwqEhMXRASm4eEOJdxg8DNxg4ddTGnY2wY8/4b
         gOCf10jTwfc6tK4JvqaRO3DeZ9hb+QC+AH+Ug2DzhR870bJAqOmfu0x4Z93L6ocoFPRv
         bmzm+hIpz/Dhd0GpMk9ce1GWRhRuNplhyWzHoDPRxW1UHtByowBC9L6l7eK6LNGJGKz2
         zS+fufiyZx3tDlDrkDZ8Ly2hEnj4VARn1IYqPxZ1w9LUc671TKsf46jx55aeRsfuMapv
         k7z8koibgB81Xl/ScuQcCgzhsA/4qQoK/yJdtgMrlVf0wvIMRdrgBiwxEB+NIo3g+WRq
         txwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Rc+hxOuofWOse1S21bWYde75jrC/PxCtGOdh1TnJIOI=;
        fh=7Td6z0/9OC1umA8WWbnMSlfv+aetFn9NVS518Q0xvMM=;
        b=XTs4qtweoZrK4uAgi5LR2xxFO4zxd0A0SnM9Iy3fH1RNSLmhbWS+K+LvtNpCuxFztN
         01RViPJskpLJjrdQVsLuT7AvCdNbh5HRy2Di/AX0Ln/RgjqT8eD+bm4qtdD2ud5zLEI7
         dRujwvEe6Uw6lly/Zw4bZWZZOY4qTaDeqINLeiiAOaBow4aQ+H3OMTm1T28RQJBgRD09
         8trOcFICw9xC2IHENBFdMZ7FdULa7yBtMfQt6PFtP2EQ21mP5yp9BUWL8fYVK2/2czMK
         2VvFxvfaBYEfEfb3gMXXVgXwuxEP4GsgzHFcfTmZcSfpFaur4k+8FD3dr7uv9DR45cnd
         6Q6g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785389064; x=1785993864; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Rc+hxOuofWOse1S21bWYde75jrC/PxCtGOdh1TnJIOI=;
        b=Nd/NscQBcmclqJmOhZMc6shIbf4+LeHSR1xF0OL6XOR1dGCtL9NcfmTYxGlodJxoHc
         Fwfe1UVOUQh6rvdfBC8frjUe3qBk9jvBwmDeLZUhGRwFzdgCK4fskGUia8mFh2+j9FMt
         7WRBb60VOcokaipue4D2p6w3PL4DQT511Ymvm1iat5WAOdCextJef/RP9XFS6ZZ9cLkX
         ZppbZKsjnF1y1SGhaADgkjBm6aZRtGsAYKvZZx3/Ss1aAlCEslYweyigfxQKUnt+YtPB
         zRy3xNnf0FlraOXA+cGZGNo2rMXNdfUZuwE45dK6W3OEwOiPkd+TDNbdcseMI/Ce+FBg
         mJKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785389064; x=1785993864;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rc+hxOuofWOse1S21bWYde75jrC/PxCtGOdh1TnJIOI=;
        b=PssgtHMttTTGTquZZ0Q1NeS/V77fQTD9cugmsaaY8ppmgPanT+1A0xHhKVgsovhikN
         JJGYSJToRPqnUvAPHl+61ZjfM9JHPMCWB79ul3stek+OR1z0CoYEFOZTTfUnTOpj//H5
         eVjOWjUNHYKncvZaEx3u+DaOZVy/FI2957T2exhyP/23RHn9OMlDoGEQrhLULHoVL1Nn
         S1wYw3MbFhIheaWKpUDicupefiHlkFuSLiDldtjrKWTtkt6KPodfsRAspWfZ+OO36fb/
         zUaUBQ6VAXsxhaDuo0P3G0g1DtuQnMpPDtSEQ9c6no95AAxDxUpUrgddoDcRUK1XMnJQ
         u9Iw==
X-Forwarded-Encrypted: i=1; AHgh+RqYW2zUCxlZYY6Bt90FW6mp/T53/zzKcNYF9qNzHmXOB7stgtfrldLerz4KItAFIuXHA0hFtm6j7t0H4Mlx@vger.kernel.org
X-Gm-Message-State: AOJu0YxUW/JB44Ws3lFTM3K7g7E5Jh5dWJmn3HTUTscKGl4Btj72+d2P
	MNmbeH2wjFy/pukfUNnaLzPWVK5MrnVBH+8xeAy4YxhEdjGjFEQnC8k/hH61NrnkMrzHbSDkKiR
	ZX+Ojcffun17X918pO9JbRaumViJ6oGIKNW5pcsxkUg==
X-Gm-Gg: AR+sD13hgd6VLQ0ZD7I8potgUdRSSRNxeYf/Y2g6tPJd91FhtTBgsqSlJIFH/ENDePp
	ozdqBeeIz9J8Fw4mZy0r7oJK/dCdbLq1T0zEil1sdarDDOCba7q0yoCaw5f4B5O7TNuEDZUi9lL
	VF/IyGIVb1hok4kSlUnxjHIavuVgsSWqKInWIv2A1ZtkvS+Vin2+DDY+gyweL7xsn7BiPH5/noU
	49JtEpHEwPYz6rLJHMlVz9hyedc4YIbOJDkWc87Iqhsn7mhBxTYLC3wd6KI/clWRFKQg5iws+Ni
	+6umq9VHYQ5n86hKYMLwoerbvciAPxPIFqx0h7IZ
X-Received: by 2002:a05:690c:e192:10b0:80d:ec6:ea1d with SMTP id
 00721157ae682-81fb96410edmr4064567b3.7.1785389063747; Wed, 29 Jul 2026
 22:24:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260729064538.19564-1-kaipeng94@gmail.com> <20260729064538.19564-3-kaipeng94@gmail.com>
 <7eae2da9-1d4d-4ed2-85ba-4ec5d389b0df@packett.cool>
In-Reply-To: <7eae2da9-1d4d-4ed2-85ba-4ec5d389b0df@packett.cool>
From: Kaipeng Zeng <kaipeng94@gmail.com>
Date: Thu, 30 Jul 2026 13:24:12 +0800
X-Gm-Features: AUfX_mxiizW0P8WvtOyPiO4sz2tAEt4IJFB7icocyx3eD4OMM8xqXH7yGV20jtA
Message-ID: <CAHk8Zdt5st9TCUU3tbm+vFgzpsVCjtLYm4KDgJasj88C4AwzCA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: Add support for Acer Swift Go
 Pro AI (SFA14-11)
To: Val Packett <val@packett.cool>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org, 
	konradybcio@kernel.org, andersson@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 30, 2026 at 9:45=E2=80=AFAM Val Packett <val@packett.cool> wrot=
e:
>
>
> On 7/29/26 3:45 AM, Kaipeng Zeng wrote:
> > Introduce device tree for the Acer Swift Go Pro AI (SFA14-11).
>
> Are you sure it's called that?
>
> I think GoPro (the action camera company) would not have been very happy
> with that branding :D
>
> https://duckduckgo.com/?q=3DAcer+Swift+Go+Pro+AI+(SFA14-11)
>
> It's only been called that (with the "Pro") on the ubuntu forum and
> such, all the other pages refer to it as "Acer Swift Go 14 AI", no "Pro".
>
> > It is a laptop based on the Qualcomm Snapdragon X Elite (X1E78100) SoC.
> > This device tree implementation references nodes from the x1-crd.dtsi.
> nit: "to reference" has a technical meaning here (with the & references
> and all that) so it's rather confusing to say "this is based on x1-crd"
> like that.
> > Supported features:
> >
> >   - Internal display & Brightness control
> >   - Keyboard & Touchpad
> >   - USB Type-C, Type-A
> >   - Wi-Fi & Bluetooth
> >   - ADSP & CDSP
> >   - Adreno X1-85 GPU
> >   - HDMI & USB Type-C display
> >   - Webcam
> CAMSS itself has not landed in -next yet :)
> > Signed-off-by: Kaipeng Zeng <kaipeng94@gmail.com>
> > ---
> >   arch/arm64/boot/dts/qcom/Makefile             |    1 +
> >   .../boot/dts/qcom/x1e78100-acer-sfa14-11.dts  | 1483 ++++++++++++++++=
+
> >   2 files changed, 1484 insertions(+)
> >   create mode 100644 arch/arm64/boot/dts/qcom/x1e78100-acer-sfa14-11.dt=
s
> >
> > diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qc=
om/Makefile
> > index e05414290d8e..fbb6b0ef67bf 100644
> > --- a/arch/arm64/boot/dts/qcom/Makefile
> > +++ b/arch/arm64/boot/dts/qcom/Makefile
> > @@ -422,6 +422,7 @@ talos-evk-lvds-auo,g133han01-dtbs :=3D \
> >   dtb-$(CONFIG_ARCH_QCOM)     +=3D talos-evk-lvds-auo,g133han01.dtb
> >   x1e001de-devkit-el2-dtbs    :=3D x1e001de-devkit.dtb x1-el2.dtbo
> >   dtb-$(CONFIG_ARCH_QCOM)     +=3D x1e001de-devkit.dtb x1e001de-devkit-=
el2.dtb
> > +dtb-$(CONFIG_ARCH_QCOM)      +=3D x1e78100-acer-sfa14-11.dtb
> Please add an EL2 line as well like all the other dtbs here.
> >   x1e78100-lenovo-thinkpad-t14s-el2-dtbs      :=3D x1e78100-lenovo-thin=
kpad-t14s.dtb x1-el2.dtbo
> >   dtb-$(CONFIG_ARCH_QCOM)     +=3D x1e78100-lenovo-thinkpad-t14s.dtb x1=
e78100-lenovo-thinkpad-t14s-el2.dtb
> >   x1e78100-lenovo-thinkpad-t14s-oled-el2-dtbs :=3D x1e78100-lenovo-thin=
kpad-t14s-oled.dtb x1-el2.dtbo
> > diff --git a/arch/arm64/boot/dts/qcom/x1e78100-acer-sfa14-11.dts b/arch=
/arm64/boot/dts/qcom/x1e78100-acer-sfa14-11.dts
> > new file mode 100644
> > [..]
> > +             wcd-playback-dai-link {
> > +                     link-name =3D "WCD Playback";
> > +
> > +                     codec {
> > +                             sound-dai =3D <&wcd938x 0>, <&swr1 0>, <&=
lpass_rxmacro 0>;
> > +                     };
> > +
> > +                     cpu {
> > +                             sound-dai =3D <&q6apmbedai RX_CODEC_DMA_R=
X_0>;
> > +                     };
> > +
> > +                     platform {
> > +                             sound-dai =3D <&q6apm>;
> > +                     };
> > +             };
> > +             wsa-dai-link {
> Missing newline
> > +                     link-name =3D "WSA Playback";
> > [..]
>

Thanks, I'll fix this in the next version.

>
> Thanks,
> ~val
>
