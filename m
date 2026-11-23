Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795428763;
	b=rARn1krTwruqtYO9TGSX0Z2b7tJeD99ANYLaDi5Bf85U11C+EtCMu5TY+BCC/M9et+gz
	 Lg8RVZ0sbn5KgJWMSgEkMaxbeiCT5qajK4G0EbujmNblS9+/YghuEjeE9bHXdtkf3W9S5
	 dMofUALUth84NrLye40OHbr5fzTqDk+4jrC04gqqObkwlmzwqH6tRcLzJQO9VgvQz5kPR
	 YfEXf0n+4Ej2/vNzerWqtTED2ndWBOYD674ACGNj5f4urYpHHKU5+hBsFSM+7VeKGuU7g
	 G/v4pQVmOiSjvsJvStL9BHCi7/I0e5WTa5gqkh09F+R/dpYUxLVpKCKpopYAZp72JcQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795428763;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Z6PZb3pWfu3DBOMyeBvBYRTT0i6m3apihG5iiqFet2Q=;
	b=x+l8e+/zsWDWc6OGfU2hpp/1/8pcMb2ByyfVbIIA96tllu/o6Dw2I1pnW/TIP6cgHy60
	 9EDFf3Q/nuXwAy33mPVK4b1D+PIbRiKa/bCUxBS4LY0AiEAHALx6sl84J4aCbNG6mSoIU
	 EB0s0CJyt8d6Y80CcHY7+M9MFqD/1uo+/87rvRj0++8C2h92M8A+sl3m6dPnH9LW7uqVc
	 Yp/DtFKSAs+t32YKsayJCnGZq36HrH6YlBGabYtKvWPZDdNrZd0PdyfJMF+g/MqaB3jOO
	 bqcnmE2NUZNHbgYOYa3aq6lP2CYqsIKQKkobpT2dSzhBLOqKbW+KVThA5oitx5TTkoA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=MqfY2WR5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B249C606A321
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 10:12:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B249C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=MqfY2WR5
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so503852866b.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 02:12:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795428761; cv=none;
        d=google.com; s=arc-20260327;
        b=d1fRNrtl7EOURbKjQLptAcxdld3YbKc/Sr9WCfLw4G6tiLvA7BgrE34rWjytaTh4u9
         k4D5pWShmnFDL2fkQdpkKxuMrdtcUZxF0iJ3cCNw4WGtPMnnH0XZqu0vr6VgvOHc84EE
         4iHWi3geEVpN6bYTdFyyrbMJKTL4unlS7RPcQBIfmrgpi4Mzyq9OwkdZG6eRw487y1qt
         xW60J1VqRRCKtGebQPg1IebfLS4GPWcRe4srqDEV0n+g3KSsiNgVHX6kRioTz+5+P521
         gfrs+piMExsMXhPTDjxQQ93MZxw9cFrXsYyBkiSYesNXBfxaxlaDTx1/EuMJcsBrtU/8
         UMLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z6PZb3pWfu3DBOMyeBvBYRTT0i6m3apihG5iiqFet2Q=;
        fh=MBOY0hi6p/DZAhMjEU8V9xPbxr9HOx349kRyOqO8NqU=;
        b=oi1uYukW5U4jVB/AEpLqJVtzDKc/IAC/rc5LOOhhJT7wsjbqepS9TwWIz2utvVJEBp
         D7pZ+0gTa84rX8QzdvGK811NwfsL8lB7GXQKqHZ1VAdtSTbFGREw6N1E8fFGpA7IljMR
         ALNr9bF+AHkoUbprKYiWozoc2Lxxik02UThhG3WfYC1gr+CsMa+8yXyO/RFQg3qTwJEd
         5ygSMEd8kIi/8FF0Zn4Bu4jcSoaVhzz1R9N6x4Y+OWGfZ4yVnrThEoiRun2LfV3Iig2K
         YWtQCNBJ1VFKS5aoGzAvFCqbTbRCFyMEwB/ksyjDnu64o4MIGAuR6eC+pHZOmKRdpH0C
         1umg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795428761; x=1796033561; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z6PZb3pWfu3DBOMyeBvBYRTT0i6m3apihG5iiqFet2Q=;
        b=MqfY2WR5A+tGruAVHjRKrDw5GIaiKkjvwm6WEch6FTIYRq8BLizWLXn5zpDnFwRRwA
         kwN6xPmj02C+f4K6Pesc/ipxTUWAJ/jX7Z2eV2g3S3/G9Ri2i5mYzwiFBYWE4mKlYNib
         JaEKi9jzGkUyZfJGjcv+VdtMrCTPstBpK7aXngyyd0uzeK44uGws21jQUKMvEPyX72E9
         nu0okVVQrxrFvL6Nj9PKzFOum9ntDS1PavLl2r5c/4y05NfY1cHnTTw1MJUAQvpESx1Q
         qXotT3VmYjML0hmwFGL+p+w5OsqphEiy5AfG0/ACGnd6E2yJhxynpmSns7W94umSVVpc
         w4qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795428761; x=1796033561;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z6PZb3pWfu3DBOMyeBvBYRTT0i6m3apihG5iiqFet2Q=;
        b=Zyi2eeBaI6Xzi6IA1y/NcTSL2mnTrjx0SBHIGZ3XF+VwnixLMtk2LuncfiresmWpop
         +AQiM1Nw6ugVKxobi9Z6Nv1FjuiD5klsRYpWAageqQknVvJy5dEqKM+sGivZRvavuRPV
         UJGuuiJZfPwYdy/uXEXPDrMEV0+vDZ797irMMH30IrMty2O/a8gk7+K8Ju0Zey4pQEOL
         8Azv51hphEtuwP/AmPhBlnh4ZMgC/DiMw9GcfLcYDPj6dqBomJVLXHamUmuC6x1bz/tZ
         dD8T81SgrD7cr8OM5IqP4AUAaqiVuya1GNLsIjYSItpVKHStg+ByIYnfLq2UFEBffBcc
         xRhQ==
X-Forwarded-Encrypted: i=1; AL+hErGRCP0PqDedJprz1e0PGM+QrDtdsBmOmdbKGt9CFLyiE6/JRPEt52F0bCG2ZN91yo/4G/lf3ggf1rfuZG2Q@vger.kernel.org
X-Gm-Message-State: APuU4Z/nedmPs1jfAg1Opez6iM/iIYabYpZRDJB1j2DDokn2uwEhV1Xm
	lmq5S8EduIe1MpVWpNfW5YIF5LnwgI5VFFz/+1nYs9G7fL6bdDqi+tuqvdK9dZLxSM82Ptc3vSP
	VLwMXyAWVIk1ToyuBlN9DOliF80KKmpd2R6dSnAa4ng==
X-Gm-Gg: AZFdTZcvC1tJZckJJSppcptVTbjFAHa5Z2Wm+XTpcApGraIgOR97Id9O1RbyLpnTR5n
	g3giu6g1pDEZrYWGrNytyWcYzD0BnnCTfTFyxskgy0wdhaK+LjKfMrUoZ/OAKOUxvOVnNXG8Cgb
	YTdRMxFyiP/Ec9v081hpR3OnhKKOPqQZgmrMI35PHgwecgW0O2rUStG/HeZTMekqy9a8lkkf+sX
	uZBwaFzl93JVxFnPEKvCp3NHlhDhbsuW9ShiURQiWp9GXrK4DpnYCEuJG3F1FGwAj7KrHF1DmiZ
	sdGIlrFjQWofhgnEfW9Upk2579q1ZKyPuuc9QKJJRgKzVHKlUbHdZHbQpYa4vSIdR64Jg1MdRDC
	oM79u6EMvcC9oc/EQgJpP0ItcDGYDX/K/UywR9uNpa/ts2vguuesR9Z7jglJWftNX72pz5jK/hB
	ph2JSh53UXEfJrAnM=
X-Received: by 2002:a17:906:115a:b0:c3e:ee86:d2c with SMTP id
 a640c23a62f3a-c513a866684mr820899566b.27.1795428760997; Mon, 23 Nov 2026
 02:12:40 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122-pcie6_fix-v2-0-2e0fe615d90b@oss.qualcomm.com> <20261122-pcie6_fix-v2-2-2e0fe615d90b@oss.qualcomm.com>
In-Reply-To: <20261122-pcie6_fix-v2-2-2e0fe615d90b@oss.qualcomm.com>
From: Alexey Charkov <alchark@flipper.net>
Date: Mon, 23 Nov 2026 14:12:30 +0400
X-Gm-Features: Aa3M54q-Xar7VXEu12WPkFbFHzHu90UHCgQbyjxEoWpDnyAZhVgjhAvqOSDzA9E
Message-ID: <CAKTNdwEuu75UHA2_r9FLmximPjXVHp05Aztk201AjnFGcGSXRw@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] power: sequencing: pcie-m2: Add support for PCIe
 M.2 Key B connectors
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krishna,

On Sun, Nov 22, 2026 at 10:46=E2=80=AFAM Krishna Chaitanya Chundru
<krishna.chundru@oss.qualcomm.com> wrote:
>
> Add support for handling the power sequence of the PCIe M.2 Key B
> connectors. These connectors are used to attach WWAN Adapters to the
> host machine over interfaces such as PCIe, USB3.1 Gen1, SSIC, or USB
> 2.0.
>
> Currently, this driver only supports driving the 3.3V/VBAT power
> supply along with the FULL_CARD_POWER_OFF#, RESET#, and W_DISABLE1#
> GPIOs as a single "pcie" target, since Key B Adapters expose only a
> discoverable PCIe/USB interface and no non-discoverable bus (unlike
> Key E's UART-attached Bluetooth device), so no serdev creation is
> needed. The other signals described in the binding are not supported
> yet.
>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.co=
m>
> ---
>  drivers/power/sequencing/pwrseq-pcie-m2.c | 70 +++++++++++++++++++++++++=
++++++
>  1 file changed, 70 insertions(+)
>
> diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/se=
quencing/pwrseq-pcie-m2.c
> index 56c5d51293c1..8af4a059b596 100644
> --- a/drivers/power/sequencing/pwrseq-pcie-m2.c
> +++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
> @@ -39,6 +39,8 @@ struct pwrseq_pcie_m2_ctx {
>         struct notifier_block nb;
>         struct gpio_desc *w_disable1_gpio;
>         struct gpio_desc *w_disable2_gpio;
> +       struct gpio_desc *full_card_power_off_gpio;
> +       struct gpio_desc *reset_gpio;
>         struct device *dev;
>         struct list_head pci_devices;
>         struct mutex list_lock;
> @@ -135,6 +137,45 @@ static const struct pwrseq_unit_data pwrseq_pcie_m2_=
e_pcie_unit_data =3D {
>         .disable =3D pwrseq_pci_m2_e_pcie_disable,
>  };
>
> +static int pwrseq_pci_m2_b_pcie_enable(struct pwrseq_device *pwrseq)
> +{
> +       struct pwrseq_pcie_m2_ctx *ctx =3D pwrseq_device_get_drvdata(pwrs=
eq);
> +       int ret;
> +
> +       ret =3D gpiod_set_value_cansleep(ctx->full_card_power_off_gpio, 0=
);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> +       if (ret)
> +               return ret;
> +
> +       return gpiod_set_value_cansleep(ctx->w_disable1_gpio, 0);

Can this signal be exposed as an rfkill device instead? Otherwise the
pwrseq driver hogs it enabled with no way for userspace to control the
radio power, and WWAN power draw is quite non-negligible for portable
devices. Ditto for w_disable2_gpio (GNSS).

I'm also wondering if the WWAN-related signals should be skipped
altogether for non-WWAN module configs?

Best regards,
Alexey
