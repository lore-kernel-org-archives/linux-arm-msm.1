Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794988019;
	b=PkFLkk2K1F/+C2zLVXBuVv17w/b3totUoy5w5J3GN2O0NFqbIhBolDAJkXgISlTRoVIV
	 kYi5yS6p6InD9+UmCKJdSq84vg4n2WrH6tV7vpFf+1rit5krlicvy+hmvnZQPUm/v5NKR
	 XuN9ELsjsTJJx57N9Pg7i1ICfX8Yz6/i1vjA6u0gBORbRv6wjurgAIwyB7+CK5Y/WOXvP
	 Xzk3gsUzbUMBSLwnGhPxs5iJuhzFTwkvfksHuoDhS3bdppvppEsjaeuvHY+FB1jqlm3ML
	 vXVU/pzh6ccJ/6ZNKRV6clcywe/a9zBXXSepmbdiJdH9iwjJ2yuCMzvg74u5xkdmC+Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794988019;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Pnx/XKeGh94aieoFZrCY2NwwXx3i4N4YVNZK0i3sHOs=;
	b=PzulIyID85gfDm24Iwa427f3weZcAu7wR7Ky46xGONi5yejlLdU+Kyv6OBW0MhZnTpAy
	 X0LKeScd4H1qrA6zlelsWvVqbmbR1Me4+DCEYJx8o6LtkZymbuLk2rF2KSNW4IeVbfHMD
	 Yy9t46gN51yi+Egp6O/05y0Gj4LQTQnFAF23UAvMrz3WLVZ/DTV9C0Um891nKntlhBWsD
	 9Gwn2oN/rfnQcsRqjDU+THDfHYe+XZ6HDNKBZ4whGgstvOqS6QM/yJ2ECnYbYuAXiRzQS
	 /dMQGQ2+EIwWCkiVJjPnxQAL8KdDGEx8LbRxYDCUXC8N0YiHpNVmek6bmIt/cyeIjTQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=KwxIBuS9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B59606A31C
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 07:46:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26B59606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=KwxIBuS9
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c50cc8e0f84so85169166b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 23:46:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794988017; cv=none;
        d=google.com; s=arc-20260327;
        b=oVgyAld6PjVaEgkfJgJRLpPfaYe+0z4AFYm40ioiql1v3VH66vBbbyVXNEIjLS7i9t
         sVYOAslNCvBhtMQLu/7jNQXEJHXB/m2BswO74BlatSvloUborn5joXHeK1ZqighQx+Wc
         GO/MQoOo8A1sedbPA074cbJU25GshB/CwkHb+zlvc+ocR3iayvdxZbNgdUVUDAbJdN34
         4hgqOu/HGCm2jTjB4I/hSU7q/STcS+BKYg4wNpME1kSWK4jRpyaF8zWBSGdFkXPIXwve
         l5G2+Ffc+4aq/a9BSN+HYTEZg0PyQ/mHf0ZjIoQRgHbiSzK/ihxWyXolKJfkfPSIso6I
         4UJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Pnx/XKeGh94aieoFZrCY2NwwXx3i4N4YVNZK0i3sHOs=;
        fh=vXdtTOORE4UKMNSAmYD5zY/37nXUIlV4icux8ncevqU=;
        b=NOlLAYqmw5J8FbY96e9hYZIx0ShQ6cGVkaTbcA5lVXcUnp289aNBd0HWbG8PhLsF7i
         oSkFOeS/fjM64p48XXPf/Pzg6RzcZDkCoLQlK/3F3QZjKxwfTgpE8R7U0NQ6Xr9Qe+1q
         7wPbQIlHEiX+Uv7vHUBD7DTA4E0qW16v99DKiPJdxvgQf0V+L1IBhlMLWbtA7wX6IZVt
         8HZLNu7RdlcEl3qRHgral22kV92sCyIzFba8uKkUpq9ZNi5lOnUNP0KnTl4kgy2v5px1
         46V7HvFQdjVlg3yBuMLQ0p2pzj0r749clMDiiRcR1BMPSIxLTqMHx7K7ZgzzPNxK6UTF
         qLjA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1794988017; x=1795592817; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Pnx/XKeGh94aieoFZrCY2NwwXx3i4N4YVNZK0i3sHOs=;
        b=KwxIBuS92KiVES7EPspJTIkt+Vyfny/uZgiUrllnoPC8h5ws2iqgOx6IGqU3bdxpJF
         dTh+jwl6pe/Mg2vFUsOi2NsXr//POfNQZwoZGHxLw8YE2AypIZN05YQ++EvnjV5+l1NT
         +NATB2riwpwfALaIqHaZQcMqilv4NY7h7Kd93KIg1VEqkvhv9rwn/bFvmZomybfh0gk0
         dxSxiw2IovXsuFbv+f5Qhxzv2Q5O4vL3W/pYQc9KJe02/JYqpLW7h7bxxzji6Z2SsDLR
         Ul+uqGPAIPJHrYy7FkTC4ddPTvtIgQQ6nMTZCUHj0DGq1S9fjp9CUECwLscDn+TXP/oJ
         8b1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794988017; x=1795592817;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pnx/XKeGh94aieoFZrCY2NwwXx3i4N4YVNZK0i3sHOs=;
        b=hzJOIxOlnPLj5iT6jePIkKHIZpbqcB4kQ562d3Eh3ZFVAbvWUYnIM3bT8BrJ56xHJe
         q+wxnOUa51dL1Um5Pu2BMhZyspExstSiRaJUJ6kNrvYt8o8DcszHdT1/+74F11z5lp5x
         vJvtAw7rFJW1K8+rUreAGoPE5SmCAOM5HvxphGoYQvAR2V2vh/ih+sfov+tjlsRAjYl1
         5iSkYbOS3N5GY+AImkHyq/ARA1b1BCw/V3YzLQnY5wD5KTtN6aJV3lu32JKEYGUj1CJ0
         pqZugchX01biKkwPII60KsUmOeCPHBchK63Czxm6LziYf4vV4ML7QACmMeyKmkM6phSm
         PjCg==
X-Forwarded-Encrypted: i=1; AL+hErHRVmR9IVPZ+C2dnfYKpR8YjGRJP1HHmlxre90QUJDBgZ3yl5AF9U56cn2nOfzB3Adt5+FyqSyC4CaFN/ZU@vger.kernel.org
X-Gm-Message-State: APuU4Z+HwTILAmlJvaMj7jiGz3nCk97LrCYRuy4sZaVWE9iHtW6IQeuj
	/i0u1txaoy6t8C+RqzssEKFzieTCrfp7XyvZEIfcx1gBb34PYoyCEf4PZOgscleshhv9cdTXtUi
	FedsYyqNd+PThgHw9YiGSigOtk/4A3ocTGNP3Qh7Nmw==
X-Gm-Gg: AYBFou21hgl46QYcJJvF5tRhEqQMGFt+KGIqBmUkMMBy08591RYTKtwx1Qd9VrKSzIr
	qQ+QaCGuFZ5P+8rok7rQ0pD0djx+Xc2sD01MDr1mIgBSNFzIMQef8hWkzx9ITaB6B4oqgvzUpoE
	9E0jbNVOpbq27EVlIsd3Twb/NQQVlSHUw5u+Mt4vg70bOYKYKIRXoqIgn4T3VxivJo+xZmtPSOp
	VGi6Y+JQSY4IwbINd/OhId0HN2d/HjCRrTTT3WrTpvjmAEr2ZJp2Ruftn1/sUO2IKJ7z7RjPljR
	uVwGr2WuVraqzDT2F6szGHW2N+TXjXF4IurQAD8cDQwH+7ihiDoJxmsaTeYkoKL8WiyKLzYBd4X
	GTLBRvN8lKnPfZd0QuIJ/SNvbWv5Y0PhoXcIOH5EvkWRXHNdWbdlcmjKs2CDbySy4ESQCJQ==
X-Received: by 2002:a17:907:9446:b0:c4d:456c:4a29 with SMTP id
 a640c23a62f3a-c510e16a720mr128985866b.14.1794988017524; Tue, 17 Nov 2026
 23:46:57 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021-pcie6_fix-v1-0-ad37134c35a3@oss.qualcomm.com>
 <20261021-pcie6_fix-v1-1-ad37134c35a3@oss.qualcomm.com> <CAKTNdwG5XA_chr2ZM9qTnr2RaDMzOjdb85bRdCr4aJCr1EGy7Q@mail.gmail.com>
 <398a1d12-c28b-418c-bbcc-170d781223d6@oss.qualcomm.com> <CAKTNdwEzbYAqM5ABxU+tfh4juU=wgYp=QXyjvdA1haanU0e8tQ@mail.gmail.com>
 <861b48b3-32e2-459a-a6e1-75d93f10e1c9@oss.qualcomm.com>
In-Reply-To: <861b48b3-32e2-459a-a6e1-75d93f10e1c9@oss.qualcomm.com>
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 18 Nov 2026 11:46:46 +0400
X-Gm-Features: AclHuK-mzUUyPR_nvHlWIkQreDiwLH9wtGyUE6yWiokuHebhGdjJ_j61S1Ijpdw
Message-ID: <CAKTNdwEOiPzvziW5VsNrHcFXEr1E7YjbabMfC3fsG6q+5-TnzA@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: connector: Add PCIe M.2 Mechanical Key B connector
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krishna,

On Sat, Nov 14, 2026 at 5:45=E2=80=AFAM Krishna Chaitanya Chundru
<krishna.chundru@oss.qualcomm.com> wrote:
> On 10/22/2026 2:56 PM, Alexey Charkov wrote:
> > On Thu, Oct 22, 2026 at 8:27=E2=80=AFAM Krishna Chaitanya Chundru
> > <krishna.chundru@oss.qualcomm.com> wrote:
> >>
> >>
> >> On 10/21/2026 9:14 PM, Alexey Charkov wrote:
> >>> Hi Krishna,
> >> Hi Alexey,
> >>
> >> Thanks for the thorough review, this is helpful.
> >>> On Wed, Oct 21, 2026 at 5:51=E2=80=AFPM Krishna Chaitanya Chundru
> >>> <krishna.chundru@oss.qualcomm.com> wrote:
> >>>> Add the devicetree binding for PCIe M.2 Mechanical Key B connector
> >>>> defined in the PCI Express M.2 Specification, r4.2, sec 3.2.19.1. Th=
is
> >>>> connector is used to attach WWAN Adapters to the host machine over
> >>>> interfaces such as PCIe, USB3.1 Gen1, SSIC, or USB 2.0, selected by =
the
> >>>> Adapter's configuration pins.
> >>>>
> >>>> The connector provides a primary power supply of 3.3V/VBAT, along wi=
th
> >>>> optional GPIO signals for WWAN-specific power/radio control:
> >>>> FULL_CARD_POWER_OFF#, RESET#, W_DISABLE1#/2#, WAKE_OQN_WWAN#, and DP=
R.
> >>>>
> >>>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualco=
mm.com>
> >>>> ---
> >>>>  .../bindings/connector/pcie-m2-b-connector.yaml    | 146 ++++++++++=
+++++++++++
> >>>>  MAINTAINERS                                        |   1 +
> >>>>  2 files changed, 147 insertions(+)
> >>>>
> >>>> diff --git a/Documentation/devicetree/bindings/connector/pcie-m2-b-c=
onnector.yaml b/Documentation/devicetree/bindings/connector/pcie-m2-b-conne=
ctor.yaml
> >>>> new file mode 100644
> >>>> index 000000000000..a7f4bcbc5119
> >>>> --- /dev/null
> >>>> +++ b/Documentation/devicetree/bindings/connector/pcie-m2-b-connecto=
r.yaml
> >>>> @@ -0,0 +1,146 @@
> >>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >>>> +%YAML 1.2
> >>>> +---
> >>>> +$id: http://devicetree.org/schemas/connector/pcie-m2-b-connector.ya=
ml#
> >>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>>> +
> >>>> +title: PCIe M.2 Mechanical Key B Connector
> >>>> +
> >>>> +maintainers:
> >>>> +  - Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> >>>> +
> >>>> +description:
> >>>> +  A PCIe M.2 B connector node represents a physical PCIe M.2 Mechan=
ical Key B
> >>>> +  connector. Mechanical Key B connectors are used to connect WWAN d=
evices to
> >>>> +  the host machine over interfaces like PCIe, USB3.1 Gen1, SSIC, or=
 USB 2.0,
> >>>> +  selected by the Adapter's configuration pins.
> >>>> +
> >>>> +properties:
> >>>> +  compatible:
> >>>> +    const: pcie-m2-b-connector
> >>>> +
> >>>> +  vpcie3v3-supply:
> >>>> +    description: A phandle to the regulator for the 3.3v/VBAT suppl=
y.
> >>>> +
> >>>> +  full-card-power-off-gpios:
> >>>> +    description: GPIO output to FULL_CARD_POWER_OFF# signal. This s=
ignal is
> >>>> +      used by the host system to turn off the entire Adapter. Refer=
, PCI
> >>>> +      Express M.2 Specification r4.0, sec 3.2.13.1 for more details=
.
> >>>> +    maxItems: 1
> >>>> +
> >>>> +  reset-gpios:
> >>>> +    description: GPIO output to RESET# signal. This signal is used =
by the
> >>>> +      host system to place the WWAN Adapter into a power-on reset c=
ondition.
> >>>> +      Refer, PCI Express M.2 Specification r4.0, sec 3.2.13.2 for m=
ore
> >>>> +      details.
> >>>> +    maxItems: 1
> >>>> +
> >>>> +  w-disable1-gpios:
> >>>> +    description: GPIO output to W_DISABLE1# signal. This signal is =
used by
> >>>> +      the host system to disable the WWAN radio on the Adapter. Ref=
er, PCI
> >>>> +      Express M.2 Specification r4.0, sec 3.1.12.3 for more details=
.
> >>>> +    maxItems: 1
> >>>> +
> >>>> +  w-disable2-gpios:
> >>>> +    description: GPIO output to W_DISABLE2# signal (default functio=
n of
> >>>> +      GPIO_10). This signal is used by the host system to disable a=
 second
> >>>> +      radio on the Adapter. Refer, PCI Express M.2 Specification r4=
.0,
> >>>> +      sec 3.1.12.3 for more details.
> >>>> +    maxItems: 1
> >>>> +
> >>>> +  wowwan-gpios:
> >>>> +    description: GPIO input to WAKE_ON_WWAN# (WoWWAN#) signal. The =
Adapter
> >>>> +      asserts this signal to wake up the host system. Refer, PCI Ex=
press M.2
> >>>> +      Specification r4.0, sec 3.2.13.3.6 for more details.
> >>>> +    maxItems: 1
> >>>> +
> >>>> +  dpr-gpios:
> >>>> +    description: GPIO output to the Dynamic Power Reduction (DPR) s=
ignal.
> >>>> +      This signal is provided by a host system proximity sensor to =
the
> >>>> +      Adapter to trigger a reduction in the radio transmit output p=
ower to
> >>>> +      meet regulatory SAR requirements. Refer, PCI Express M.2 Spec=
ification
> >>>> +      r4.0, sec 3.2.13.4 for more details.
> >>>> +    maxItems: 1
> >>> This seems to be missing the four CONFIG_* pins, which are quite
> >>> crucial in these connectors, as they define which interfaces the
> >>> module asks the host to provide on the respective pins. Without those
> >>> module type detection is impossible.
> >> Agreed, thanks for catching this. I will add a config-gpios property  =
(4 GPIO
> >> inputs, one per CONFIG_0..3 pin) to v2. It's optional, not required - =
a board
> >> that always has a known, fixed card type in a given socket (e.g. QCOM
> >> glymur-crd's WWAN-only slot) can just describe that fixed wiring via t=
he ports
> >> property and skip CONFIG decode entirely; config-gpios is only needed =
when the
> >> host wants to detect the card type/host-interface at runtime. Kept it =
as plain
> >> sensed GPIOs with no decode semantics imposed by the schema - the prop=
erty
> >> description documents the full Table 3-18 state table inline (all 16 s=
tates)
> >> so the binding is self-contained, but turning the sensed 4-bit pattern=
 into
> >> "this is a WWAN-PCIe Adapter in port config 0" is left to driver code,
> >> consistent with how the rest of the connector's sensed straps (e.g.
> >> viocfg-gpios on the E-connector) are already handled.
> > Agreed that the logic of turning the 4-bit pattern into
> > enabling/disabling interfaces sounds like a driver realm, although we
> > probably need to consider if the connector should accept pinctrl-0
> > through pinctrl-15 to hint the host about which pin muxes should
> > follow from each of the 16 4-bit CONFIG_* pin states. This mapping is
> > hard to recover outside the connector's context.
>  I'd put the pinctrl states on the connector, one per CONFIG_0..3 value (=
Table
> 3-18), selected after the driver reads config-gpios. The CONFIG-to-mux ma=
pping
> can't be recovered from the interface providers, as you said. Providers w=
ould
> keep only their own default pinctrl. What I'm unsure about is how much is
> SoC-muxed in practice. The high-speed pairs are often fixed by PHY or lan=
e
> routing, so the states may mostly matter for GPIO_0..11. Do you know of a=
 case
> where they cover more than that?

Thanks, that makes sense.

Regarding the high-speed pairs, the Rockchip based boards that I know
about route one PCIe lane muxed with SATA to the connector, with the
SoC combo-PHY managing the interface muxing (including the polarity
swap for the SATA-B pair). I don't know how people deal with the
second PCIe lane vs. USB SS muxing though, or if such devices have
been made available at all. Either way, it sounds like those could be
modeled as one port per muxed pin group - i.e., port@0 for SATA+PCIe
lane 0 (as two endpoints), port@1 for PCIe lane 1+USB SS+SSIC (as
three endpoints), etc. A PHY driver for a dual-lane PCIe interface
would then have to figure out whether its OF graph has one or two
links and configure the PHY and the controller accordingly.

Best regards,
Alexey
