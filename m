Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795787403;
	b=OtjEl2loS93n01pnmmmermSUnnINlQ/GAaeosaH5Oin9DwdyofiQqbSArmFIymLSYic0
	 nEWJ9bQiiBJuJIENGNYzA0QQFzvxb9NJ76bkj9Jg4ltc0wq0JQejx7c6NZsM5Bu1yn2aQ
	 YJhEcifGdmq1FQqKZOgI/YOUZ8YFehpKIOq8/0wGn2d1tgmGLsSqnf59f7+A00eZI89RU
	 kDkEmP8a7CRqZvWDQ6xyycwMm8jPKVG4DbVMfPfTphGh9WnIVQ/HDbUWc/27l58Oc6WqP
	 8oroynVvKWPEsynOC76BnSio4nXay+TB1zQ193BU7Y5VuXgBA40RRpe733trs9JgarA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795787403;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=EILx4C81IcuhQhfNn6eUO2v7ek7ffLRIIkY0aN4K7xc=;
	b=oZQ0jk08hxnU8gd/yzjPNrKf+as0N+AD4uLUteyt8ZgAGnitNsKxX9J9w+fSr2K5+Qn9
	 /DHT7Do3mLWnt4WKl+6y7jOlPuu3eNa0ii46XxJrAV0Nem1ZAul4ito7aUiQhvY9ht+MC
	 3Ee+wPsTNq4nzQhIDpRJCQ9OgTfsTsH1o4arLpWwkqDfDZbNbMXXOB3EzNYdrLq+n3foq
	 IeP8lE1FgjwtXPP8xiF+U0HVOPk9f3ql+DHFCMQKLKWLaeDnI/tMFutGID6GsN0UslX4w
	 DNIKhbKRt1OBsI9sdsYzAyX1Ss40FP6nC2wepKiQi1CDx+LQFc+THBem1qBkwgpUN5g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lEeJGHVH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.177
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1331606A31F
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 13:50:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1331606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lEeJGHVH
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3acd523a802so69368811fa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 05:50:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795787401; cv=none;
        d=google.com; s=arc-20260327;
        b=jrLd9/f5/jaH2U/V/L9czUhTP5cxvOO3XMgTou/5tX0/ZAee6nJbp3il7ZMRXFB/Lb
         hTuYGHk6PLuyXEoxF0X/VXGQ4lL+9pz0pM81kCt3rdYxVksrdWLqexoZbNPOdDf2cv/2
         hDQhRSBbEdF9EZH8NG3ngV7tXkt1gJGyl0kKtziStpNd2RMVFg4YzgDqVTqRLwf17Z9J
         Z2O+0UXJ7gonKoz1YaUVk6Gvce1XTZLP6DyiCOnDPaJIWFn97ri3SEzmsbg434l4GU9r
         wJg7lwMJnn8gaUGh2woBaWAcBvj8ksMV8ha59UP4dH9Vj0BqndsramYbaequcKesWhQy
         aZVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EILx4C81IcuhQhfNn6eUO2v7ek7ffLRIIkY0aN4K7xc=;
        fh=MsH8WCt1miOChrFAesVxyoggzlBmAQ6dW1z8QYIT0hA=;
        b=L4soE6dObb+7E+qBp4taMtWdLHuKbyusdY/o3fuIvJFQr52fKgEs7M1tmK40iJJOHT
         AF7K0nSzOcUshzEE9u+Mn9yY8QL3nNdxxKEEaIRUqQtvyY63iYO+AkMiK+vD6qPXFMDF
         XJm6zunj8AnyOnVSKIN6KJZFPPuoCCxX1CQ8mZUm2GImWcHQ86lOfo0MeQQLaO8gglf8
         s7II19BJA4fW3G3xcbr/waxM4Dj0aJTh0N7kEGwBcPWvCYT6dkrViLl1OcCrlrd3yLLZ
         jwfPZ0h9Xbhq+Bl3ceZoEQWO9BvZTVgaVEsxkjWvSGgHgxCbDV2j80PGNkusRS1JaHdy
         8D5w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795787401; x=1796392201; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EILx4C81IcuhQhfNn6eUO2v7ek7ffLRIIkY0aN4K7xc=;
        b=lEeJGHVHehQkDw5MC7zJtSUaXXPlVVQ2pYqVaXLag6CFCjgoqsgWiajg7qoDprouuv
         ODxiHNZjov+QcD1i/SGwCsTIxdsB1pV85HyqTcT3/Cm5fuI9IbMS4CDowk0CR0ie6P/e
         3o6TYFXF/WxXOHFfhpdd0gpMwY3WzTKjdBldo+0MSMWILg8M8eacgE9VS/aP2PohV2nC
         nvZPtvxwJFJKhC3qwc9+jRpLIK7Pewm/CQuLVOuDnRIaOVZCGPodFmjgmF4JIYGj7M97
         B7iX1bSflHUJIRzingrPKi0HoGU1njcl+wD5A1uSISgQhcizlrpUcFWRZpohuEDyEryG
         hzWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795787401; x=1796392201;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EILx4C81IcuhQhfNn6eUO2v7ek7ffLRIIkY0aN4K7xc=;
        b=KizU3g+ljymxJXrVWWbHfyRYyr9yEcObjQO17I8akGOrVcGCdM4QL0q0Dt45VmzC7y
         Yt3KeAeWmKie7SATQ2mH7WG2pDPtHDiwNHR5ShDlSNl1nqF6ZWr7d4nhrkXfdlkdaN1n
         MTXVwmRbOFDSYaFyGHMrTLrcdFPL0mg/F+bSLSRX7a1fByEMSBihimGHB8wTrAfcSohO
         tw/u5L7X9gsMIpF//ke1XXznFmMk8rRr6/WcGV5rZO91by+O2LG31vYpzjc8vr6j53ba
         w7hi5doXqbwcvH64HW9Ea5iGqKfqLGc7m7ZNuVQo98AOB2JEvMsJN0oCaSFwnwwTqoI0
         0BjA==
X-Forwarded-Encrypted: i=1; AL+hErGyaTLLaR7D1UikKGSjDq2wI8vGARMZ05KwQF/Cim/S2xm7ycxOuNTVmA8nq7etGgbjUJ2hZtGgb3vLgTy/@vger.kernel.org
X-Gm-Message-State: APuU4Z8LDWVpW98Y0fM73+jK7tLVxW/QD5caucTRztkT4c+A/bj8C9tN
	O0ELL+C+eTEgxHpgGaf+WZhwqctQ9wAyt7XfCetBuIts5V8offpMvvAinBPj0/0/okgk+/Y9B7p
	up+FdvV6OGmbO5lWaTZdQp2dhcJfvQbI=
X-Gm-Gg: AZFdTZf7v+n7vUqfLbX4CEzrNVDw16Z4aw2tevLQJzbs9VSxrQnmLH6Nr+9AwR0KIa+
	ppaq474sHuKAeIEGo6R8KRjCiNJeb1ej6owK6LQRtYtWwUQdtcdBIt7iQV62oBXaT6soadmHNpt
	70kQsGLSgz1HZm/aoD7WSPQ7Xmu4TkKknGezObYo6MJQykMAVKTpnJjZ7Gp2/7kPRFhEmiWd4wq
	7Kku4FeyMxrkKjErlCjBUs7bghS+d8t4YfbL15jLl9FIFH+Aik2bYrp5FsA9M1eOyG2nBYbtDAL
	DI4RxVQY3ROKEGkgTjPtHZle/EoZwSh44jGiJQ2By5hZz3MPyjOtRf8xM8ez5OpvpvN7RVh4QMV
	ciNaTUQGkUwRzZ5G/Qb34iKvK2cirpd+6JZBY
X-Received: by 2002:a05:6512:3093:b0:5c1:595f:b370 with SMTP id
 2adb3069b0e04-5c1bc6d253fmr7284015e87.3.1795787400636; Fri, 27 Nov 2026
 05:50:00 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114020509.632311-1-jeff.roach0@gmail.com>
 <20261114020509.632311-3-jeff.roach0@gmail.com> <dd4e15d2-5037-4610-9a80-5c330f436263@oss.qualcomm.com>
In-Reply-To: <dd4e15d2-5037-4610-9a80-5c330f436263@oss.qualcomm.com>
From: Jeff Roach <jeff.roach0@gmail.com>
Date: Fri, 27 Nov 2026 07:49:49 -0600
X-Gm-Features: Aa3M54pHYzzfFU4Xc2un7T9P8fzKCah6MxwtII6nKZyi50ZBPS2sY1vNA4Vb8NA
Message-ID: <CAAnD8Rak9BJ2WTHxz+i3ETm6vJQ7EOy8zSfJa-ejoHqWidM6mQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] arm64: dts: qcom: Add HP OmniBook X 16-cp1
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 27, 2026 at 6:12=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:

> > +&usb_2_qmpphy {
> > +     /delete-property/ mode-switch;
> > +     /delete-property/ orientation-switch;
> > +
> > +     status =3D "okay";
> > +
> > +     ports {
> > +             port@0 {
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +
> > +                     /delete-node/ endpoint;
> > +
> > +                     usb_2_qmpphy_out_usb: endpoint@1 {
> > +                             reg =3D <1>;
> > +
> > +                             data-lanes =3D <1 0>;
> > +                     };
> > +             };
> > +     };
> > +};
>
> Does simply leaving status=3Dokay also work here? I think it should
> simply never enter DP mode since there's no altmode notification

Yes, that works. With just status =3D "okay" on &usb_2_qmpphy, a USB 3
flash drive on the USB-A port comes up at 5000M, and still does after
a replug and after s2idle suspend/resume. No PHY errors.

I'll drop the override in v6.

Thanks,
Jeff
