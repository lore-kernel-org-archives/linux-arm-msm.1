Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792597473;
	b=nE8MH++EB1mZMGQUWSBbW3oeRbeha92bjQYUcKMtOF5Di62SFAwwFS2aEhrh4Yxz+f1Q
	 X5hdCZZmx0Ym02plJR+p8kB5MFmT7aeZOdTPCc5B4Iv+aPkc3TwlNHa8tqdTmJCATZgrD
	 G9ngKm5RAr6ymlpnTkIu26JjyV2yrt00RcWGafFS8TJnEAst0VNGgXhgf8eOvjD8Zte1L
	 3RBUgzusVcSN8oAtlXzP+jd3INyEj8oIONshURHxlMnnZ/ZD8dQhoSG8IRgJlPLNsQHTO
	 glnpr3+jry2XOmElD0/p7UBMQyMHGlBljJTPDV+edodu/8+ygUlZvR3fuxgSXtqtRqw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792597473;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=JP3isnTjkGCFTemUyIlLVxDc+jortqiyhczyp4kIfzM=;
	b=4Ol//0UTjQO3T6B8diVc5IznrsyWdkndmChKcpehO08AdfhnDfvfdgaIfgqnUI8WfLMd
	 dV+DkI8naV8KZJJpNSAtbZeTmuCd0cYp02nIBLVWP+EacdjI0xwjebW3rXCcCoTidt8Fv
	 yI+WD2JKf+wFyTi2xBO6+IOXpHZWNcpLm6XE5C+VamhB77ypZjGdSIJdRe/79UuwL3YLV
	 W145w6AAElEtcy3i0f4D12mBzmceqrmkdxXkNC1T/qINleYaPLhWLN3HVYDgHnUB2FTMu
	 2pSGiEGFqGvjOdZTpI73vXWQgz4px5wf1jt2G0aKvOSbL+dIXRDMKy+EcPmBTrta0Jw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b="fT1Ejq+/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDFDA60A2628
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 15:44:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDFDA60A2628
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=fT1Ejq+/
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c4677aad67bso97909866b.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 08:44:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792597471; cv=none;
        d=google.com; s=arc-20260327;
        b=q/XMPU2FrH97tuliUaISOG+5eO1TWI7bnNj5UWjFIDARWcHkGmvcLYX3NtcAm51C+8
         2KfU4Hd4rg/lRJPY61/65N0xq5hOx2X+njyBrvEm4vQsyTIBl+ZL4VTD1WvLTzav861E
         zg5o6eDZNX90esCNF7eml+E9wOkgjGlNEIsNUIPTZ2UnemtW4O/Tm/+KHWy25blCq6Xq
         3EMVQbWzY4V1r5HHaG43fQhHA8yJ//nE5L5Yjr/xnBUextOwqG5xbUTj/a+qtWT9v1us
         j/J3kwWXNaGgcQDRHARxPufUVAt3ljqKjAunh5KXBDXLb3qxVv/j/WRxsf+4URE5014c
         pjNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JP3isnTjkGCFTemUyIlLVxDc+jortqiyhczyp4kIfzM=;
        fh=GbPHSe1UpyMqPOkftt9mTSdV1vzLIbuehDQaVjexvFg=;
        b=pGClZZJvpRU58we1osEAVLrPwLbqSFlfYmIA1iP5VAFxQ+CdK6L8swYB/sC+06gq43
         +gARrdTVIbxnia5eO2FYGdp0pB9xLwRM52/QGSaU53EoWE1A7BPSBdqXoWdIXCfYd5MX
         h6GIj8384zPsfhOMg8sqmQmce3pnCaRz1e6pI0ojhWfqvuLt+N4SxuBDO4JbqpzCNzLV
         ZyRuDr1os6nRfm3IHpT6YTXKpTbHz4+dpa72j9h0td7KoMjZTRJSX+XLRkNV6RualNlE
         vYBA1uk4h8yp8N8xGYEd1MiTR0s9Y6YxNr38DHhv3dDV8UWbQt7V5C4Bqxg4FbKfYtTC
         SYDw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1792597471; x=1793202271; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JP3isnTjkGCFTemUyIlLVxDc+jortqiyhczyp4kIfzM=;
        b=fT1Ejq+/L56l79ie+PNmdQbxUE9/wPpsUh5WzFCARRIo7DhXjRMQdSMvNzHnT/eXUK
         U1uG49UybtIek/3tGTHsFnortB7I2Ud3eqM90D/fcwX2ZoNpWpLOYqIySWj5tZGiVmo5
         A8c4weGoCSi9qGxJAFMQK7fltmLgJitKz6b5FZvPv8IhrMLbQUQ3XkwLPLN4X5zIAw7V
         jDdMr7FQo9B1Jxu6a/lEtrZm7yUThf57nza2x9rNdhhjVZ2bCwn+ycLxa1LDU2+7gAwM
         c4w3om4KynnPQ8oVYNL8wqUCw1p0MtaOC4BAZXAZdu98lWHTUOJYF6I9QRNLwZnlW/9S
         b/bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792597471; x=1793202271;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JP3isnTjkGCFTemUyIlLVxDc+jortqiyhczyp4kIfzM=;
        b=FjXd66XTe6lYS+hpqJCBhuHHtcfKy0cmjYQpaXZy1tytMZnZmP3i3qfH5lIBrdGABf
         /JO8LPpGfjfXxHmGlH19CAXELnOuGU+2BAzyMHwrjWFW+Aq6DGRss4QZu/Zei1Pwm55+
         3gv3Iscu7cqFweYAmXCcdJxLP+iPboUCcPybRn+m4lEGPUcIK3H6oSX4YCbzlFEQ9/CK
         ty+WlIrEzkjTRnZLz8aJW4z5kM/T5fkZ/cK5kJkbR+zwGuVeFp+d+tR83Fxs+4t/TgJv
         0wLIQbOEyZW7/LgY5B1mErp3txeEgzx7WBRxjlfyDcPHmr+EaRIi+Ms2NeIkpMILysRA
         vbYA==
X-Forwarded-Encrypted: i=1; AKwUvBy18nooR0KEx9cRxiXuNMvQhiu7Y9/PwtkXIQ1biahjYAeqZOr9LITbiXUC1CWzeJvghU9PtxuD2R6RgQB+@vger.kernel.org
X-Gm-Message-State: AFq9FYI78WnY/QWgvSyXjS1k8aVTWoAcgekMZgahOkFY8YJTKZQEwwa/
	SFfEOXBSTrvV+EgjcBtw7QZ5pVxjlqQVnxnN5PpXsi/zj0o/yxQXw9gruEXeGeW/crcCXapRpHe
	29FA5YS1si+2TeLL+N2JpNPSF4KC+EMRrTrJP0lZLvQ==
X-Gm-Gg: AYBFou3u8fgX+TrFGTKmWlR9o0kF91u4hjrR9sPGuKoc9/01Zl+Cca+VVbj7+lWMLZp
	xO0MfZ38nEoeHNZwivkPZyUikHywM+PDNC0vDr31hybgo93HQbh5vOm1K+u638Ftybq1V2KOkoX
	Dl/rQkY0yu5F8UZmCi15h1bCq6jDrHr9fC7YepLEael5cvlWnRMpcyFjR1wO1GP1RAQ7OG3YQcs
	e8b4bpDvrZ59jrlvZ4R9LHtQ3uI8ALJVxC1KREu1gL5WNA1YpV8KM4dTOPrlvcrTOuileIvSj08
	gMsZJV5cT9fI4z6u7NwFitYijZZBQf86xQnUto/tGuj1lSDRbZbBDNQEMb5iE2kU7OFniJJLfeM
	Bk6HmkaEzmPWs9aydt/C1IBdSVpngBV/Pz/GPAe4aEmALHlRnzCuwKphDJdHRMaz00X3pcw==
X-Received: by 2002:a17:906:4fc8:b0:c2d:ca32:2176 with SMTP id
 a640c23a62f3a-c467961d9f7mr245660266b.8.1792597471151; Wed, 21 Oct 2026
 08:44:31 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021-pcie6_fix-v1-0-ad37134c35a3@oss.qualcomm.com> <20261021-pcie6_fix-v1-1-ad37134c35a3@oss.qualcomm.com>
In-Reply-To: <20261021-pcie6_fix-v1-1-ad37134c35a3@oss.qualcomm.com>
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 21 Oct 2026 19:44:20 +0400
X-Gm-Features: AclHuK_OzLUc98RwVb-VyZ4la1jnJworigni-GUiOSt1W-ytIr-eQQIArUmgwS4
Message-ID: <CAKTNdwG5XA_chr2ZM9qTnr2RaDMzOjdb85bRdCr4aJCr1EGy7Q@mail.gmail.com>
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

On Wed, Oct 21, 2026 at 5:51=E2=80=AFPM Krishna Chaitanya Chundru
<krishna.chundru@oss.qualcomm.com> wrote:
>
> Add the devicetree binding for PCIe M.2 Mechanical Key B connector
> defined in the PCI Express M.2 Specification, r4.2, sec 3.2.19.1. This
> connector is used to attach WWAN Adapters to the host machine over
> interfaces such as PCIe, USB3.1 Gen1, SSIC, or USB 2.0, selected by the
> Adapter's configuration pins.
>
> The connector provides a primary power supply of 3.3V/VBAT, along with
> optional GPIO signals for WWAN-specific power/radio control:
> FULL_CARD_POWER_OFF#, RESET#, W_DISABLE1#/2#, WAKE_ON_WWAN#, and DPR.
>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.co=
m>
> ---
>  .../bindings/connector/pcie-m2-b-connector.yaml    | 146 +++++++++++++++=
++++++
>  MAINTAINERS                                        |   1 +
>  2 files changed, 147 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/connector/pcie-m2-b-connec=
tor.yaml b/Documentation/devicetree/bindings/connector/pcie-m2-b-connector.=
yaml
> new file mode 100644
> index 000000000000..a7f4bcbc5119
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/connector/pcie-m2-b-connector.yam=
l
> @@ -0,0 +1,146 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/connector/pcie-m2-b-connector.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: PCIe M.2 Mechanical Key B Connector
> +
> +maintainers:
> +  - Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> +
> +description:
> +  A PCIe M.2 B connector node represents a physical PCIe M.2 Mechanical =
Key B
> +  connector. Mechanical Key B connectors are used to connect WWAN device=
s to
> +  the host machine over interfaces like PCIe, USB3.1 Gen1, SSIC, or USB =
2.0,
> +  selected by the Adapter's configuration pins.
> +
> +properties:
> +  compatible:
> +    const: pcie-m2-b-connector
> +
> +  vpcie3v3-supply:
> +    description: A phandle to the regulator for the 3.3v/VBAT supply.
> +
> +  full-card-power-off-gpios:
> +    description: GPIO output to FULL_CARD_POWER_OFF# signal. This signal=
 is
> +      used by the host system to turn off the entire Adapter. Refer, PCI
> +      Express M.2 Specification r4.0, sec 3.2.13.1 for more details.
> +    maxItems: 1
> +
> +  reset-gpios:
> +    description: GPIO output to RESET# signal. This signal is used by th=
e
> +      host system to place the WWAN Adapter into a power-on reset condit=
ion.
> +      Refer, PCI Express M.2 Specification r4.0, sec 3.2.13.2 for more
> +      details.
> +    maxItems: 1
> +
> +  w-disable1-gpios:
> +    description: GPIO output to W_DISABLE1# signal. This signal is used =
by
> +      the host system to disable the WWAN radio on the Adapter. Refer, P=
CI
> +      Express M.2 Specification r4.0, sec 3.1.12.3 for more details.
> +    maxItems: 1
> +
> +  w-disable2-gpios:
> +    description: GPIO output to W_DISABLE2# signal (default function of
> +      GPIO_10). This signal is used by the host system to disable a seco=
nd
> +      radio on the Adapter. Refer, PCI Express M.2 Specification r4.0,
> +      sec 3.1.12.3 for more details.
> +    maxItems: 1
> +
> +  wowwan-gpios:
> +    description: GPIO input to WAKE_ON_WWAN# (WoWWAN#) signal. The Adapt=
er
> +      asserts this signal to wake up the host system. Refer, PCI Express=
 M.2
> +      Specification r4.0, sec 3.2.13.3.6 for more details.
> +    maxItems: 1
> +
> +  dpr-gpios:
> +    description: GPIO output to the Dynamic Power Reduction (DPR) signal=
.
> +      This signal is provided by a host system proximity sensor to the
> +      Adapter to trigger a reduction in the radio transmit output power =
to
> +      meet regulatory SAR requirements. Refer, PCI Express M.2 Specifica=
tion
> +      r4.0, sec 3.2.13.4 for more details.
> +    maxItems: 1

This seems to be missing the four CONFIG_* pins, which are quite
crucial in these connectors, as they define which interfaces the
module asks the host to provide on the respective pins. Without those
module type detection is impossible.

> +  clocks:
> +    description: 32.768 KHz Suspend Clock (SUSCLK) input from the host s=
ystem to
> +      the M.2 card. Refer, PCI Express M.2 Specification r4.0, sec 3.1.1=
2.1 for
> +      more details.
> +    maxItems: 1
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    description: OF graph bindings modeling the interfaces exposed on th=
e
> +      connector. Since a single connector can have multiple interfaces, =
every
> +      interface has an assigned OF graph port number as described below.
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: PCIe interface for WWAN
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: SSIC interface for WWAN
> +
> +      port@2:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: USB 2.0 interface for WWAN
> +
> +      port@3:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: USB3.1 Gen1 interface for WWAN
> +
> +    anyOf:
> +      - required:
> +          - port@0
> +      - required:
> +          - port@1
> +      - required:
> +          - port@3

This misses SATA which shares pins with PCIe. PCIe second lane also
conflicts with USB 3.1/SSIC, which isn't captured here. Should it be?

Should the graph also envisage connections for the I2C bus (GNSS),
audio (2 or 4 wire), re-muxing of W_DISABLE2# and WAKE_ON_WWAN# into
HSIC functions in Port Config_3, GNSS interrupt line and the such?
Should the connector node also define pinctrl configurations for each
of the 15 interface configurations?

Best regards,
Alexey
