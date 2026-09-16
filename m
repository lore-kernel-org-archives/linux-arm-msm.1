Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4564B129D
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 10:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789553583; cv=pass; b=coDqtZSvBX+B/zdnQFtEzjWf69ftYGwSXBl9ZiJLL3Ck5XV40Wojxs0FWugKN1RDqjWEcusavU16J/K2MdNqUI3LfFUIcz6LJqfS6McIitIuHpzAASjNbWkT0A4pLyZOgoU+Uc8XKaI9YHoQ9jo9nuC4GS2oCDtkhL0ax6sYiaQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789553583; c=relaxed/simple;
	bh=FcMZAWu6Pl4djj9zhAk6RGVFzPCsFGY0WGARMV3Tby8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EGWwyPCYxcXKiigluApMvPm6Kj2l16tMy1UkSxUlTSqWJjEvGFNSWQGWzjHIcgdNsX/LwCjPPVu6XobwPgTvMH0I3uR+Wp8WG5AvsLpjyb7vFiBPPVQSnCJbFnxbKYH9FjmbxSP4JI85/5Vn2C+qVpv7wnjH+g1KAi2uz+UGKMo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.b=oT2Dsa4y; arc=pass smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.b="oT2Dsa4y"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso7201465e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 03:12:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789553550; cv=none;
        d=google.com; s=arc-20260327;
        b=d3uMlE4+FTqVbB1fsHp0GtuJi4RVO3roLd6FJGLBJ3ksyD2evRAbfVCpTrFLzknene
         ue/6cowOO5WSKVfcQY9olc50+9tILL/PAaYUhwh4Bfv3o1qyTihPEG/VOD9IBijrsnSg
         dNT/2rl6U4t3Tm5EmUq04Q08s20P7iIY+ffz3Od36s02kSyaVLAEsiX8+8uBVefgJ+xY
         TwskCSvAFahev8vnOj5GdcIKuiAJTnl7WM8kFfBtB8/Zn0whTIKEmiPl+R/cmLcGOQV/
         slgAvlFpElcVDbIRxL2nRG7B0IVAsb2B1MfncTqF4EkfGRaAzmezhJLP+e+USSLe/LHB
         1T+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VMvnu6Q+bhTIDoi1lbqTiSXnAgA138OR2uRiPsRsuJs=;
        fh=myFVWmdRpzCa+iTkPbC6PJFZWbIWgtLXGr5Ox9mVcCY=;
        b=DTLzQRN/SXMfE6X5QEVK5G35j+IizGYBNn8tHyKLE70fl/8Cb5YbB/LhG/JaRvbcET
         KiAqLs3kmIhnCI348TQImF6u0MORSJwDTlMc2cFokJBp7wropgWVLDdAYphbz6MaiRPV
         cJkzNGGMSATffp5GO/YTMh3mY03JuuU20rgHte1JvWujs8VqFYtCy6ne8S9myZC8HjqK
         sY8VJ5W8dApeZ/Fte1HYLMS2QQ20SlZIkPbUgwyFSJwjez2OLZO6cv5kE0Ci3g4mDvDj
         g8RxZ8kv6GQvOc88bGcADA66ZQJ/sqXl2VU20/zOaVnSaF+uPY9O57YWtlB9DbZSatvz
         W4Ng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1789553550; x=1790158350; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VMvnu6Q+bhTIDoi1lbqTiSXnAgA138OR2uRiPsRsuJs=;
        b=oT2Dsa4yx3+dHLscDy3ZY+lSwK7V6pmb0dHhdUF8HM+3ZVgBjSm5S+jBPGPziqCFvh
         nefhVwCCwfX/abaqccUI2fEOs62vVSyIU6nn1+ms3l+bt5g1ibRnxAgSeK718Ck8Fe7A
         5OGxkQkrTHvP3DNmZ5Z1xXI63GelHMN+F7SD9DMmRqHEecivXvoHF9FqoYfGquN6YSQ+
         ji9SE1sUqEF+s29lfcSPXjYKJFxngsIEyWEs6xvc/RsO4+7MisNtv2/6/k+2d05fAGzQ
         fbGs4NaaYgXRtpxSV3JrrrWq4gVs/T0OOCDTUbgyBq4y+1OLUhZEOq8taGzt0eC7nWt1
         WAIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789553550; x=1790158350;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VMvnu6Q+bhTIDoi1lbqTiSXnAgA138OR2uRiPsRsuJs=;
        b=eR+f0W0Bwsvch5w3VswrFZ033TMNaoLXOa2uFD0u9WyjK10zf4oqfhdhlxo4fj9rmo
         m7+GBUhkATd/Lfz64nCov33+Q3CFxTLkENkAqlHW6lSc9lCnsr2sKpi3lqKVb6dA3Skv
         X9DnoY3OjP3V0MufDM2N5AI6FWjkL1/VGuC2qKrItGjYlwzrGLKxi3eW5cE1JEIY8SNA
         DcAzE8MLno/1aQCImKVBpgajUUXrKQgIiyFmySgka5glA5z0p9koCT16CmQl65AGex+7
         zvK7iyLKRmHhd3jJMEDOVWU/tp/qgBEazaT6A9kCu1uJ8lqEWX1X6StD/NEJeWKg9QU/
         1FFg==
X-Forwarded-Encrypted: i=1; AKwUvBxtM70r3ips8q2PFdZx4kfIE2UitLYW/ztquPmlOxjx/sgVVtsNhnpoiYi6hN2zzLZXnkCdMNy3+fiGUice@vger.kernel.org
X-Gm-Message-State: AFuF++l64NSZBNZoOTzT4YLgrOapZ9kKXqT88pjcJI+hCneTIOGRftkR
	pStkLdK9lFY0Ndbhb5jGbi6y/KzS1TcFBoR3PuvRu8c2VuthHQqoB9/pBDf5VTNu5QtM0NYuKM6
	q0txHX7BYZeJU8/j6cvaQ6pmSttHLOsI/qx6o2DhU+w==
X-Gm-Gg: AYBFou0m6qaXuRiSPuOuRqn85J+yFuxF4n2ObxYEZW2K1Q00qKWMIcJbVfDFupApj7Y
	3ga4gUH9nyhqCcbyO03pTAZb8+cFohZuQa9iOxGOZG+0I8McehqMUF8IBBJw9PLEyiuzN4Gk45O
	LGx6g8WOOu+QmXJgaVfjN1JDZl7MpBPjW+X5/WHTo4W+Z1h/4pxxS26feMWrasz/7ZdsE4Ek677
	BIAiOSW5xrxTGBe6gkGlbHnnLrS1czJV7j3AlLtCbSCh2kwieW0qETTimuPlUrS+o8HclgvvjTz
	rFgUqC4IKG9kjfrDs4TI3ecpN7wBcp9RyiLznZ05lB43xNoTVtYLh0nQWsPpepfpMVijiDCdtfc
	rz/6+O4U68MK6f6D238fGw2w1ncjD01Tjz0G9V5B9+UIRtJaIv8hEOBqYQJr9FcADAccZdNyYcv
	o=
X-Received: by 2002:a05:600c:1986:b0:49c:d019:70c5 with SMTP id
 5b1f17b1804b1-49ea528e2f5mr24120835e9.0.1789553548884; Wed, 16 Sep 2026
 03:12:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260912-rpmi-tee-service-grp-dev-v1-0-1d1d35c2a859@oss.qualcomm.com>
 <20260912-rpmi-tee-service-grp-dev-v1-5-1d1d35c2a859@oss.qualcomm.com>
In-Reply-To: <20260912-rpmi-tee-service-grp-dev-v1-5-1d1d35c2a859@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 16 Sep 2026 15:42:16 +0530
X-Gm-Features: AcwNN1XhJcdypVFFKePBGQrRcccPnauqo1pQsJ8HQwZetdLhE4E6-eyGGrD9-yI
Message-ID: <CAAhSdy3Or_uDWuQniUGguc9AwL8smF6XHhJ0kizFOJKJ0N+9OA@mail.gmail.com>
Subject: Re: [PATCH RFC 5/5] dt-bindings: tee: add RISC-V RPMI TEE transport
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Cc: Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Rahul Pathak <rahul@summations.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, op-tee@lists.trustedfirmware.org, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 12, 2026 at 3:45=E2=80=AFPM Amirreza Zarrabi
<amirreza.zarrabi@oss.qualcomm.com> wrote:
>
> Add a device-tree binding for the OP-TEE RISC-V transport using the RPMI
> TEE service group over SBI MPXY.
>
> Describe one mailbox channel per hart and an optional interrupt used as
> the availability doorbell for asynchronous notifications.
>
> Add the binding to the existing OP-TEE MAINTAINERS entry.
>
> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> ---
>  .../bindings/tee/riscv,rpmi-mpxy-tee.yaml          | 65 ++++++++++++++++=
++++++
>  MAINTAINERS                                        |  1 +
>  2 files changed, 66 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/tee/riscv,rpmi-mpxy-tee.ya=
ml b/Documentation/devicetree/bindings/tee/riscv,rpmi-mpxy-tee.yaml
> new file mode 100644
> index 000000000000..8f6ff313fd42
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/tee/riscv,rpmi-mpxy-tee.yaml
> @@ -0,0 +1,65 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/tee/riscv,rpmi-mpxy-tee.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: RISC-V RPMI TEE service group based message proxy
> +
> +maintainers:
> +  - Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> +
> +description: |
> +  The RISC-V Platform Management Interface (RPMI) [1] defines a messagin=
g
> +  protocol which is modular and extensible. The supervisor software can
> +  send/receive RPMI messages via the SBI MPXY extension [2] or some dedi=
cated
> +  supervisor-mode RPMI transport.
> +
> +  The RPMI specification [1] defines a TEE service group which is the RI=
SC-V
> +  analog of Arm FF-A: OP-TEE and the rich execution environment (REE, i.=
e.
> +  Linux) are peer endpoints and the RPMI framework (machine mode firmwar=
e)
> +  mediates every message. Entering OP-TEE on a hart runs it on that hart=
 until
> +  it responds, so the SBI implementation provides one SBI MPXY channel p=
er
> +  hart; all of them are listed, in hart order, on a single node.
> +
> +  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +  References
> +  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +  [1] RISC-V Platform Management Interface (RPMI) v1.0 (or higher)
> +      https://github.com/riscv-non-isa/riscv-rpmi/releases
> +
> +  [2] RISC-V Supervisor Binary Interface (SBI) v3.0 (or higher)
> +      https://github.com/riscv-non-isa/riscv-sbi-doc/releases
> +
> +properties:
> +  compatible:
> +    const: riscv,rpmi-mpxy-tee
> +
> +  mboxes:
> +    minItems: 1
> +    description:
> +      One SBI MPXY channel implementing the RPMI TEE service group per h=
art,
> +      listed in the same order as the CPU nodes.

I am not sure why you need separate MPXY channel per hart. The MPXY shared
memory is already per-hart whereas the MPXY channel will be doman specific
for TEE.

Also, for this binding refererring to only mailbox channel is
sufficient. The underlying
mechanism to send RPMI messages is abstracted away by the mailbox controlle=
r
driver.

> +
> +  interrupts:
> +    maxItems: 1
> +    description:
> +      Availability doorbell raised by OP-TEE to signal asynchronous
> +      notifications over the RPMI TEE signal bus. Optional; when absent
> +      asynchronous notification is disabled.
> +
> +required:
> +  - compatible
> +  - mboxes
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    tee {
> +        compatible =3D "riscv,rpmi-mpxy-tee";

This must be "riscv,rpmi-tee" based on above comments.

> +        mboxes =3D <&mpxy_mbox 0x10 0x0>, <&mpxy_mbox 0x11 0x0>;

Like mentioned above, only one mailbox channel is sufficient.

> +    };
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 207a6e2db70c..7d0e550085b2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20577,6 +20577,7 @@ M:      Jens Wiklander <jenswi@kernel.org>
>  L:     op-tee@lists.trustedfirmware.org (moderated for non-subscribers)
>  S:     Maintained
>  F:     Documentation/ABI/testing/sysfs-bus-optee-devices
> +F:     Documentation/devicetree/bindings/tee/riscv,rpmi-mpxy-tee.yaml
>  F:     drivers/tee/optee/
>
>  OP-TEE RANDOM NUMBER GENERATOR (RNG) DRIVER
>
> --
> 2.34.1
>

Regards,
Anup
