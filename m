Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793345322;
	b=bJR6tHuS9jjTBx/fwVNac7XL80Er08E11N8lsbo9L6k+OtNDdALf3SnxKuCSKZZW/1Dv
	 L0HdZAfU7U60fleoDQkn75jGEGdtTrmEv9oKCDYcNh7vhr5UzmIsNnDnBOEFi0vv0nZQr
	 5AyikfJFGHKboW4oVDMpBlErKBAqyc8zoqRrVRURGrMR7IA3klyQzUvGhJ/7xwU5dPzdc
	 2SJsu9HySo2dgZ8H04rnFOl9gX7g33iIN7btNB/pC/e4RRazS4t1whUoU2/FDOWgOgefg
	 xFPMPZwHsYZhWbBxhiq8/D8iSST3y01GK/IoxLLByB0PTlW1Eaau4JOMaouxVzKveBw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793345322;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=7PxPIeRuNsvElsGXImQTEuL1CpgybTHblbxvuB0DOLI=;
	b=QpttE0ufH1l/vzkXle71QQFATu16xPkk3l5mOqK2Msq0epVx3yqHjUZ6dYvTxcB9Z5Eb
	 A4glYFjKz6arQsI4oZ6GQeuMzDXDD/xzS1RErSPZYZ5KQ++C02FSrZliJkNGMhIqX8Upp
	 8dOeXpeM/VERIvRyczjA0vON7fG9JC7h0GlABKGYnFO3RecRbno2NQ1otVFDFImmBDhrU
	 MjG/op6b4kWwhI8jjVerdI9+nue9oUWv6/WeCP78S1dno5Js5Ln20T6LgfPshg6Ksp4tP
	 VgShISqvbWs5WL3jpEqppOBER5WrtJuxWQqkAzwhxjBRjy4o0o3aVF+f8Lpb7tQSuzg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="IKy+T/qh";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.50
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D8B606A320
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 07:28:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31D8B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=IKy+T/qh
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-679a420b5afso302719d50.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 00:28:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793345320; cv=none;
        d=google.com; s=arc-20260327;
        b=k55psF3Cn/KBK0S/gPZv88D3BUWiK7hgvicP6qbVshyJvZ+yE+ejvTznTWkirDC7Ka
         Nftz+j8x6Moz5TaYtnpDZhCMptDS/LZTPtQyMcswRi5puL39kaEAmEH1YgA5qxEWML2n
         FTVILznwyFtNlnhQ4kZxg6/N2J/l209cGzizg3mc69Q6us+5VOBHp3Q7uFyjyK+tMLqi
         qPHGxFZJFC3Z1dNV9CV2CDvDBTWo1RZ+S7aS71G2vdaZ7nNa7amc+fUu57/pGTDaPU2S
         oS4WfnaNCtTJkxdLZpyU95mAmEEQ7LeRKjdBWtz8BE/+ydPqFAZl1Eix3uHfRgMO7+a+
         g60Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7PxPIeRuNsvElsGXImQTEuL1CpgybTHblbxvuB0DOLI=;
        fh=GC8swCRqoEnmyo7df/93+bq1Z+tJHYUswldT77zZkhE=;
        b=nYwqUt1vDfig8pGYGeXrk6gTWvTNL7BQyrc23Iir66Lrfs/2qvSZu8yOTleCsZ6TnY
         54ysd8Tv1nGJDH+/vPEPSjJ/EeAXoKa9wXwco9WAl04X3U0KeahjwCYGk6RL5sOEDdvW
         MjjnBr2TzDRB4OTmu3btfXdm9wva2UEPspgdNtxJfnluPNf+yThr3Dse5Dd5JvtpmMyW
         KFbjpKd0mYPAdI9mhrDrb3KQ+c3G+yVbZYUw4pIdjvRgdgFMax/qqoGU40gu7iKFw5mI
         x07jamGD0TxP2Eg3vOpUfa0U3Uee9M6fMdhJ6/LyY/EKBARIrt7KasKgKFJ5TPJ99TOE
         Sjhg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793345320; x=1793950120; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7PxPIeRuNsvElsGXImQTEuL1CpgybTHblbxvuB0DOLI=;
        b=IKy+T/qhhIrUOzchV2V4rsBprme/Hu+3Hl6zCa01nFTCsOY9pKmewlMrEn4BQLOwW9
         feJJmNQO23DQ3rGjEzuWcIeZR34xo5NfY4KNRYFVsQwIp9ColIO/GW+PGca/8KtFU+/f
         l1bdJasJc0Tz9mTRQCSooUk0FYHVl951kJDfI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793345320; x=1793950120;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7PxPIeRuNsvElsGXImQTEuL1CpgybTHblbxvuB0DOLI=;
        b=BK57g518Ri3uP5Fy6JP3AJujGLymGiiQq5aCKRTrnk5w++zD5HSrn+V7rPKI+gVkFn
         BKeHbIofORt+Ijk6EHV6Rzft04nxnf8zAHxw3FK0nEvocfYpNe15EGZmxL8psYTGg98K
         KuE4CUx/4pg7q/1Q9CJPAgdL1K4jYcZQm/OWCpARCCRO0yOb2q2EyRcEQWpYSkFSBaVQ
         vz43PxRaekt+I5E7aDA0ieGgausrO+G7+OWrzrse9rwknr9YVuBA5UOasNOUfDtSZsyZ
         1L3F1IlzlSf8enMu+9Z3G+l0SFmgyxbMOugGUocGl9XHKh/kmUK2qwDiJ9857/o8ArSN
         TeMQ==
X-Forwarded-Encrypted: i=1; AKwUvBw4ZhRNQKWFbz1y4J+yzkjRH/1UP2WPvA1ebgVuE4L2LC+7Uekimf6zym9vRJsqkRL3js7O4bYkTI+96CJN@vger.kernel.org
X-Gm-Message-State: AFq9FYKWGCo1tTO2qaA/yGZ5J5fVcpNoSE/W0pnyTwof6F3ZnAII7gbp
	lzjPiweiNDGBRWaARMTD1zfnsbvaeZzplRRuxy3cs5/PwcbwJDt/7a3ICRiRPGYp+N7vKDYpdCM
	HttTDMVyGRbdQhiairCseraXBAK5fVuF1owGR5Uv0
X-Gm-Gg: AYBFou2IZTqjan1sk16B0aXavyx39iEdV4wX9ub6Fn9jsBUmts6a7aRLGNIG6JIRIJr
	kh4dmKohtOBO9o79bMRhU1O0AR65oFLXOGPVl9Y5ZZz0PRtd9fe/Z0nsonBW0rfJqAFUeAqbpgl
	Qin9ghy7p+Qnkj8kYGfeqvdlWfqNUSHES0HbJOZbie72uqVOkZRwtzJbaVXCVdKNuJdios4fAtu
	Ow7KMRLpipTf+eA35s7kL8yE9G+t4JDzey8yFxZRxqG6j0q8sfRJUYHznPad4UV8dzdBLwEj3et
	IJQ29hB4zvuwkVjAy23kYf6hdPeJE9ZB7MgvFJ34HjSVs6+7ASPyUqKWz6A8U92vV3d0y3n1CuV
	1TVpdkKsVoOcb2cH1F/EiGdpuAk9W53G6XsOAbbZx4XGzyyaLN/5sNEtoBduC/7tRhG8=
X-Received: by 2002:a53:ac8a:0:b0:679:9afd:c0c7 with SMTP id
 956f58d0204a3-67ba508d24fmr864212d50.126.1793345320085; Fri, 30 Oct 2026
 00:28:40 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261014082037.1774672-1-wenst@chromium.org> <20261014082037.1774672-3-wenst@chromium.org>
 <7020a7a6-332e-4fd0-a659-d82eb768614c@linaro.org> <CAGXv+5G1kgyumbj7wGf6rPFbg3spSO0zYmEkn-hZT4qUdJbytA@mail.gmail.com>
 <03375a31-0ac6-47a4-b0dc-6327080e1622@linaro.org> <b4c0761b-34f2-42ad-97e7-ab34ae776281@oss.qualcomm.com>
 <8d4d3ec2-3c97-4a46-97f8-048fdf81b853@linaro.org> <CAGXv+5G_ig=k-eH8Cp0ES70WxTHcBS2TVj9VmHaG9caROiAuQQ@mail.gmail.com>
 <8ceba969-91d2-4b43-81d0-b26e7139664b@oss.qualcomm.com>
In-Reply-To: <8ceba969-91d2-4b43-81d0-b26e7139664b@oss.qualcomm.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 30 Oct 2026 15:28:28 +0800
X-Gm-Features: AclHuK87PpF6mvOIXqHCbuY1WKimiNRH2tQGnceMsfo-UR5TI782gxdvYJm286Q
Message-ID: <CAGXv+5GFogx_kS=N1t8-SFTp+HyxLtoHzhnL6t8Zn0GBiqMoKw@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: usb: snps,dwc3: Fix downstream port numbering
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <balbi@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Sven Peter <sven@kernel.org>, 
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Ryan Chen <ryan_chen@aspeedtech.com>, 
	Billy Tsai <billy_tsai@aspeedtech.com>, Michal Simek <michal.simek@amd.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, Minda Chen <minda.chen@starfivetech.com>, 
	Shyam Pandey <radhey.shyam.pandey@amd.com>, Wei Yang <yangwei1@eswincomputing.com>, 
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>, Hang Cao <caohang@eswincomputing.com>, 
	Li Jun <jun.li@nxp.com>, Peng Fan <peng.fan@nxp.com>, Roy Luo <royluo@google.com>, 
	Yang Xiwen <forbidden405@foxmail.com>, 
	Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>, 
	Robert Marko <robert.marko@sartura.hr>, Xu Yang <xu.yang_2@nxp.com>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Stanley Chang <stanley_chang@realtek.com>, 
	Ze Huang <huang.ze@linux.dev>, Aswath Govindraju <a-govindraju@ti.com>, 
	Roger Quadros <rogerq@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	asahi@lists.linux.dev, linux-aspeed@lists.ozlabs.org, imx@lists.linux.dev, 
	linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, Mathias Nyman <mathias.nyman@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 5:44=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 10/15/26 11:00 AM, Chen-Yu Tsai wrote:
> > (Cc-ed Mathias, the xHCI driver maintainer in case I misunderstood xHCI=
.)
> >
> > On Thu, Oct 15, 2026 at 4:44=E2=80=AFPM Neil Armstrong
> > <neil.armstrong@linaro.org> wrote:
> >>
> >> On 10/14/26 18:36, Konrad Dybcio wrote:
> >>> On 10/14/26 11:44 AM, Neil Armstrong wrote:
> >>>> On 10/14/26 11:29, Chen-Yu Tsai wrote:
> >>>>> On Wed, Oct 14, 2026 at 5:28=E2=80=AFPM Neil Armstrong
> >>>>> <neil.armstrong@linaro.org> wrote:
>
> [...]
>
>
> >> How about the USB4, does it use the USB3.0 port ?
> >
> > I'm not familiar with USB4. A quick search says that it can tunnel
> > USB 3.x, DP, and PCIe, and it doesn't have its own USB HCI defined.
> >
> > So I'm thinking the USB4 controller would be more like a nexus node
> > or multiplexing node, or perhaps like a USB C connector. It has input
> > ports for all the protocols it can tunnel, connected to their respectiv=
e
> > controllers (XHCI, DP, PCIe). The binding probably would be very messy
> > if one controller supported multiple outgoing ports, as each downstream
> > port has a 3-to-1 relationship with its respective upstream protocol
> > interfaces.
>
> Yeah that is more or less it.
>
> There needs to be a connection between the USB4 router and the native
> (USB3 *port*, not hub | PCIe *port*, not RC | DPTX) protocol adapter
> where the tunneled packets end up at to create a PM devlink between it
> and the USB4 router.
>
> ACPI does that by adding a `usb4-host-interface =3D &reference_to_router`
> property, for DT that's still undecided:
>
> https://github.com/devicetree-org/dt-schema/pull/196
>
> As far as the Qualcomm implementation goes, I was hoping we could
> go forward with base1 numbering as the DWC3 is an XHCI controller:
>
> https://lore.kernel.org/linux-usb/20260929-topic-dwc3_tunneling_state-v4-=
0-63e296346d57@oss.qualcomm.com/

I don't have DWC3 manuals, but assuming its internal numbering follows
that of XHCI, you can't just use "udev->portnum - 1" in patch 4. That
is the logical port number on the root hub.

Instead you need

    raw_port =3D usb_hcd_find_raw_port_number(bus_to_hcd(hub->bus), port1);

to get the 1-based port number for XHCI.


ChenYu
