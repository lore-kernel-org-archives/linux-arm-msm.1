Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792630041;
	b=FfRTi/ly0UQkf3hlZiWhf1uAA20arkE5STNW48WX3ZmBdsyCxy5SH0WkK1ArbqqRLgNZ
	 0n/wIQPwLM7m8GuxGwTlTx/H9wX7lum+cju+qqagxma4RcPNVqxmO9SQSRCSKbXqFDkMq
	 iwiokQU2jst5+8Dsa3CZfjRhgHvciDG40PWzY07D33vSrYLe/Yri439noferKLVxL6nws
	 /Wt5DhqCviklEL6brIu8i/pAaiNd007UjD2vdk+8BX7zNIwTw92J+uJ3np3Ez8LD8M0LP
	 1mHAG1jyPmy9Ep5RhEawMnEe4HTS3+/qJjA0SxTB6RSKNNl0HvGnH+6ev32DT6qC3Ag==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792630041;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=pwGPGU23GI6h9pUQHAK84Z+CzrPzJKabg5jcCAcJQ1Q=;
	b=VejdwnJSJN+UnRYammV13pOJU7hWhx0HycXXU8wr6TTCu4Nbi4rCQvKPUrnED3XhZAgk
	 AVnDSWGEREmzZ3xQTg2i4gUFaLJSugxOx1ojLihlyGwrbsNyWb20YfS/EU9lV7a86prFd
	 dyHnloD9sw65o6+kSmOGJFmSiYGC6r2YQlV6HvibSuEblk4yXP3ABvciJY5okckWZyWnL
	 AHU/sDQA66ANDL54QhjIXZ8T8CE68yG8Xzd9/xuW1Ckw+R7zokdDYgfckr7Of0yMUBq/m
	 G2hDv5m7afeRG3Kenqo6TkBJ33rH/c/vbgYecDb/p0UPS2gN6MSz/bsTs6M5wCjIjyg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fSqxrQWS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.181
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B61606A319
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 00:47:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33B61606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fSqxrQWS
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8b0cf2c0785so13184497b3.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 17:47:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792630040; cv=none;
        d=google.com; s=arc-20260327;
        b=av/zav7cAPeNx0Bo9NZkGTWICAgAVelDxcieSA4bKCcTokF1l68QuXF8SrZFb/DNJK
         OslrDlI9sPda20IDFmqaJ6UnZmmsc3cPzuyXvulyBoagOIazoJyun5OqO8/JiPmfchQd
         aTm/ACAo+UWYoMYZRGcI3py8ZIgdQ70M7rCkpNd0VO/GiiJiPKkW82++cFaH7/r/bucs
         nO33lieE2ZTqXY360H5DkWSgyrO0WbaZNQLa+egtWtDbas+ZTxb3jcQi7l6ho/T5rKtA
         D95TkvkxwxyZg+0jQNzfUWUP48isqsAWPCYU8SuNME1mlwiRzhWBgNONNJGBdhXLLSs0
         IGvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pwGPGU23GI6h9pUQHAK84Z+CzrPzJKabg5jcCAcJQ1Q=;
        fh=QVwKITUckvJVsJope8GVdHlgTdIZ/MsnIToJVO+TKJ4=;
        b=neKsl71QRpz0ZNx/MbO7VallGr2Dt+pERP8b/mo6dlJ8nkdJVgrf5hKV8oVWq/SxQ+
         +G+QrqL8Op+iKL5FYbN3UAknCyrl1/6c+NnVGvxgTktP1rivK+LNVoB6VzLsv76Gpj6p
         D5WHwS7AEl4FtnMffw47+OL8FruI0MP2kT2JZXugw9qEhbcFxZFx7euU3ibxNHbvLOhD
         S0ucrwKU6S8k6ZVm6EZuCPhhiikkCyWsF2ivoO2ycu0I2nc1swqzd0NWxnrnoFvvbHGl
         MvpE/Wu7xJyP/QL2dfzYJHX9LGqPzDk1mLkZss2TYNfxhaar1SPUE1doZ1McbhQZIHSA
         OwKw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792630040; x=1793234840; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pwGPGU23GI6h9pUQHAK84Z+CzrPzJKabg5jcCAcJQ1Q=;
        b=fSqxrQWSb/e8tvutg+75XiYeP4yu2+A0NyUG78JLnqcE/djLmaqURHGfyr04zlEZXo
         Cvmk44oSSi65xXdUxxGFvKidmfgMyxpyqfGjt/4UcDWvjpWRJ7bbb8XWZGOK1sdZdn5o
         WVneswL82f1owpeFUgbL7S64xYPcBAIeoW11AVZDbdbNvBKWuDPaREDDAuC0eul0ivWU
         Srlufid+IrJeVoh7UxAVRlE6shqdOvrUqwjorxt2AsPSHONGBChGW33Rc3+Vxv0J8Y5K
         E0R0XSX/pzWvFFkRtd+MpPDU88FSvJGrWQ8n2Z07fvnSrbqBqkTjxV/ivaYrQkv2dovg
         qOxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792630040; x=1793234840;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pwGPGU23GI6h9pUQHAK84Z+CzrPzJKabg5jcCAcJQ1Q=;
        b=crKmr2/6IpFwpFY0ZBQvgJ2X5NXR6XQ3YC2cKZPQmLnHbe6lqx/zr23f/kM/WeDDaS
         8oErhd1TuVgPU87aMpEFTuur6xbF7BdaPjj9LsjbI02udP67mDqDiCg7IWUyreG2h8Lv
         fvZNcxv/S8gToelN8QrZmNze2CxLM4CKbIY7YLvIaQ4V6zSNQUJgJYP3ZKtEVrEw2PGa
         Ib0flM+h2Su95nnCU8sbR6fc0ETt9Tr/SJk6D07AUXOdP9gawyv5GIMKBlyxLV60fGUd
         vgyfTf58W3yWW2+SMfhS5WFSP70OwzUYL83YNNX0ONCvvrSvBFCoPrcFEVt9EXvaPpWI
         EyBA==
X-Gm-Message-State: AFq9FYJKkp2jEn+oJLe81svki0tcN4PRQvA+no82gQw3OvRCJGads6Wl
	LRAkQmj3ZmEz1OAeuno5qSUS5dtlaEeU7iUYFHE9hOYnU+BBRxRKfwVPf+ZepwX3VXnOulsUWF8
	CqqCq7otLX9or70ae0q7XRIjVen+8tU5D3n7hbLiYHw==
X-Gm-Gg: AYBFou0802lvuHFP+ajd7wXYZPYYRvxl/fLAtMHvpjUUhTLewW5Cd4h5dCs8G1rRGzS
	U/re41aeSCFSgDnbukEEdpgIdIzyzznmyhn0+F/QikWhSbNYOpdT0RwKkU/kWyFNsoR0hEq5P0r
	ZcuZnLLQhukjsFqsOGCHKqow7iqLwMtOmvZ62pmVtKkt+nazwwRWG6PqWl/+dbewpoiPs6PYrRk
	Ls3e0Y72yRBjUgS/JGmn1cYqhqnbqPWvGF7D/jyeie1EP9kuty9L8uUTuaRO7j1ylhBQyKKoR47
	u+l7OGGHt9Dn5/AmrU9IPh2BcjhMIT2815H34kR8Qx1I6rT6xtUP7CO/KeAB8MMXLPYkYeTlEmk
	WmhSQNGSOlbYZOsVjEAWZE41VX4LZ4a3NlQRm
X-Received: by 2002:a05:690c:c673:20b0:8ab:33d2:1528 with SMTP id
 00721157ae682-8b133f552e5mr14795247b3.35.1792630040090; Wed, 21 Oct 2026
 17:47:20 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAAnD8Rb4ZZrHFWMJayabioB_8bOHh1mqZ5LCXZz0jTNGMA7UZQ@mail.gmail.com>
In-Reply-To: <CAAnD8Rb4ZZrHFWMJayabioB_8bOHh1mqZ5LCXZz0jTNGMA7UZQ@mail.gmail.com>
From: Jeff Roach <jeff.roach0@gmail.com>
Date: Wed, 21 Oct 2026 19:47:09 -0500
X-Gm-Features: AclHuK8JKBY8JP6pZeQPmFOuI9QrPgjaWpGEcYfrrzYDKfYz42LajgcwAPxTyjc
Message-ID: <CAAnD8RaicCmi2vk_Mna-Mfct4Ebh5dFVnKUkvVSiX6kpTB_imw@mail.gmail.com>
Subject: Re: HP OmniBook X 16 (X2 Elite, Mahua): DT bring-up report and questions
To: linux-arm-msm@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
	lumag@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, 
	linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 5:34=E2=80=AFPM Jeff Roach <jeff.roach0@gmail.com> =
wrote:
>
> Hi all,
>
> I have a device tree for the HP OmniBook X Laptop 16-cp1xxx (board
> 8F46, Snapdragon X2 Elite 12-core, "qcom,mahua") that boots and runs a

Hi all,

A follow-up with one new result: DisplayPort alt mode on the USB-C
ports, and what looks like a wrong clock divider in the Glymur combo
PHY driver.

Setup: mdss_dp0/mdss_dp1 enabled as in glymur-hp-elitebook-x-g2q.dts
(glymur.dtsi already links them to usb_0/usb_1_qmpphy, and
pmic_glink_altmode provides HPD). Sink: USB-C hub with a Parade PS176
DP-to-HDMI converter, 1080p monitor. The same hub and monitor work
under Windows on this laptop.

With the default link-frequencies the driver picked HBR2, 2 lanes.
AUX, EDID and link training all succeeded (drm.debug shows "mainlink
READY", 1920x1080@60, 148.5 MHz, sensible Mvid/Nvid), and GNOME showed
the monitor as active, but the monitor reported "No signal".

Counting vblanks with DRM_IOCTL_WAIT_VBLANK on that CRTC gave exactly
33.33 ms per frame, i.e. 30 Hz for a 60 Hz mode (the eDP CRTC measured
59.86 Hz at the same time). So the timing engine appears to run at
half the pixel clock the stream header announces, and the PS176 never
locks.

Capping link-frequencies at HBR in the DT
(<1620000000 2700000000>) fixes it: the same CRTC measures 60.000 Hz
and the monitor shows a picture. Both USB-C ports (mdss_dp0 and
mdss_dp1) behave the same way.

Looking at drivers/phy/qualcomm/phy-qcom-qmp-combo.c,
qmp_v8_configure_dp_clocks() (used by glymur_usb3dpphy_cfg) sets
phy_vco_div =3D 0x4 / 0x2 / 0x4 / 0x3 for RBR / HBR / HBR2 / HBR3. The
Glymur eDP PHY in phy-qcom-edp.c (edp_phy_vco_div_cfg_v8) uses 0x00 /
0x00 / 0x02 / 0x01. I haven't checked this against documentation (I
don't have any), and I haven't yet tried a patched module, so it is
only a suspicion that the HBR2 (and maybe HBR3) value is wrong. It is
the same in linux-next as far as I can see.

Questions:
- Does the HBR2 divider in qmp_v8_configure_dp_clocks() look right to
  you? If someone can tell me the expected value I'm happy to build
  the module and test HBR2 and HBR3.
- Is capping link-frequencies acceptable in a board DTS until this is
  understood, or should I leave DP out of the first submission?

Details:
https://github.com/jeffroach0/omnibook-x16-linux/blob/main/docs/findings.md=
#displayport-over-usb-c

Thanks,
Jeff
