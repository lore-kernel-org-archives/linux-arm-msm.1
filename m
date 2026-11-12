Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794472816;
	b=PX+9v5GNKfzp28wyKiLBevaAkq+FJaebJJbn53etE7PLZldJSDJ8b1vyjXcF5INQ1EOW
	 idL1mQG6wskJhiWRIeq3w5qTtr2M5uDP0faZ/BtWCMijCxTXXMSMRSmgc351i9cI5vUZl
	 iLsOwtks/d0gzhks0hahSqRVvrMmtrEe1m3TEqwy/QP61WNLDNxrMY2heq3dkty+x4iod
	 c5tKefu2YEQ7y6SeajJai8cUXsHoEWn6X7U5wRB/YESU0Sb2uORfGfQmt4y20FPouG53l
	 pPewASPdQbSjGQU/btJ0iSrGZ5mTVqH4OjXU4yNSR7ab711vXKYRVpTjHkuIwwjxMuQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472816;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=1MLHENWIhimnyZAk96Q7jBk87imP7SgqnBM069C44cY=;
	b=wvXmYfJjcOIv+RncJA8rB1eWQY2uZSSaO0W9qUjbwHpllfH0QpO8CDtvRW0ll2XhhGyX
	 TQ+HdgUqE1RV3Hx4U6KGYlAkeJsfT8x2XFv1y6fWBsu1E2oQ1mPR/PCv3ef4p4OGbcsTt
	 XzpiblEI8OlpNwIdRslm3XRVGUePHkqBBK9074pLjxxx/N1a6cHyVkABNr6Qk2vLgxBxv
	 taj/tjdo5ClneOnpWEZChIbbR7V8gduCMs6EcSeCBZHd3m51klnw1W+fHpmii6Smc+xO2
	 sgoKHcxovHfzdhKXTJ/DTk7ChMUbUxmMwqFxsdeRJsEkk9SPgE6X6BJgnnBwoZ69BdA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iA6lCI6s;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.178
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16122606B38E
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 08:40:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16122606B38E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iA6lCI6s
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3ae10409ceaso1656261fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 00:40:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794472814; cv=none;
        d=google.com; s=arc-20260327;
        b=rmr4b1vKaXF8g85on9CELDfy3rGeJH4VNiwm7EUrTCLJvO5eeUhzIeqxKolKMILXMs
         A8Th2McX2cfs3FCbVGspGYwfZgr+9/9cLHUtFW6cCItgZ4mEHI6Yc5fWPeHcC9l7XhMK
         iBY5/VcF0i7jWRiiDrmk3DGY3i0ko1L4EgHVqp9pwCGBR5M77DlAECA4M2irnk1RBAIn
         FMFO20z9QEtopEcKUo3YqSVoMFK8NcJfxcqePJ9g4aADhDCxZI1uRE087lgl5URDq5j9
         hh/z8pYskQHJDwlTiIEY7fhNkfMX4hpu6EcBsWQHJ0UHFR19Tk81+JB1PtN6qe3GnzKt
         36ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1MLHENWIhimnyZAk96Q7jBk87imP7SgqnBM069C44cY=;
        fh=famY3HvyrVVpCNd4iE/IoQotnaf7dUAdMXeGbj1t0k8=;
        b=I7n7NCO3iFBDZVf5o2NGQJtbMbSwgbOFQStckbAOUINR6NwTYeR3i7+ZBBfjJr66Kk
         f4DXIxiq6cP3cTOgpSiKSlB4e5ARrx0oxdT0GP7GbfX0QoMEHePdychHIrvYTUb8HrD/
         2RuggunC1rOyV9Tuqz/S/ynAvdZEf2lwmBYZhUJuujYrejC9WDkfoQ3YLe1PtpWfRgtO
         7QV/2f/1tpxPgoRXaH97XYgNWFzZM0EbenwIW0f9fdlF8D8ioBfj5QRvxqzhujBZs3Ll
         jK1RjfqMZnqKbiyuxXQA31r764N76jmy//LO2LZjeqLbk2jjQhiuau5CkIoid2kd2Nzk
         H0Jw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794472814; x=1795077614; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1MLHENWIhimnyZAk96Q7jBk87imP7SgqnBM069C44cY=;
        b=iA6lCI6shaa3+dIzCSrmsWPUPOwk0ok/6mrWjsdbK64wHrR+UqbXcpToprzxcTL7CH
         t/J5qapm1CtbdTMa3Ajj+WnXzY7XmkstHk6gyfQ/Wl6Yh5ZaKeqIjA2uEkjdfj8ita7c
         wuK2PqeUDZOGP0LoT5B/opDl2bT0gvb9fKStuCdbUBN4ZefPMfAq0ZrzjBLMq/wCJvBA
         OnNdAhpIB8r+5i9jv7XV3Wj42nGOasZnyS07GXqVm7/zyaLfaeJSIw68JAGojuvbesEN
         Lu9hbf9DuYexTp9DeBgD687tn4lw6Qj8rAHahNazrNc9L8tHnQq02FbwlSEvI8xcWCfR
         wg3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794472814; x=1795077614;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1MLHENWIhimnyZAk96Q7jBk87imP7SgqnBM069C44cY=;
        b=xPJE1JIloIbJ5skN/Yv+hMWnKIooi3K/P3Y7Xk6lk4r7QoG2h5/7RvI3bG2KKBIkRz
         PEG+2Z/9l2JAbG1yOzYCNuXKeXh1c+SO0sYIW8+eUoboy7rrelpUzCSzGmH7SRXnAiUX
         W0gxPvagEHbPDwdqdBvEdwUmUjffLjj1Mcos52Y/nlc88pvvgdzfDUOtPR3vAgxqsMOh
         1Kj/WO0G63FrqivhFYenCRggyLXQrPUHLPwuWBGyAWi2gRdVeLjswupGTQJbdCRGN9X/
         J1oNiqPny0cFIzO50nONHw7GYpT6YGlaNzEx5+Uf4Blhe1E1rBHetlOBe/8LsIcvKmfU
         /g0g==
X-Forwarded-Encrypted: i=1; AL+hErEol4GU8leQhD85sPchwo9sEdRAOoKCqGiShmZ/4rXCk3vuLrzoY2FpC8DeUtE+O16iABEScRj3zLtIh1ir@vger.kernel.org
X-Gm-Message-State: APuU4Z8Kk+hUq2y8UpQlpS5AUBCpWcF+QzeEz+MA9d4GX65KlTxa5VEV
	6uaV0F+1psFiBvWcKyK7ov8gPIYYnrUmlXrJOoj0tTfjwa8BdJnYc67raVxoeNk5ZLQL7dxsC7n
	wHjukKSStVUo0bSBZMpYYwrnZZ+xNHjsL3snBE/2ICw==
X-Gm-Gg: AYBFou1ZYSIhmuLaqCdX7vnBpfQMKvB7/8hPC2TFkcYslI8OpawB3CIpfkCj/1njwfi
	OWaYaVgRXNrJCidhlNMhSdpl4MIW1qnvGsblF6D99EkZllY415d6frtjL+0nUwt8ed2wQ3OhBL6
	CJWJdCJCc0iuizDcNIpX0tlrqHZws2VUQq4K3MOvo1t4Y4uBvSzCX0AjI+XDYs4GUaWWYCd4baW
	nPnan00pg31r4bfpvT6yfv9lzBMkSYVvlxfnleHunOEN2PhjHLscKVgeQO71wze+BYtcxTnulWm
	9c/2P+pqLKDN/46dqQuO45qNy6SOOZyz1nT2fMIcoS/O76mb4slj8RgGZSH8mWoo8IDUpEoAiFk
	nOAOHPaPHCKnZ26ZVEZFQF9nvDk1VekCGU4c0/pmt9Vp7Z3sSK3KQhnMphXZdNNoaOJPhgac=
X-Received: by 2002:a05:6512:32ce:b0:5bf:d00a:b6c0 with SMTP id
 2adb3069b0e04-5c15d61a7d2mr1980194e87.3.1794472814061; Thu, 12 Nov 2026
 00:40:14 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110-dwc3-s2idle-v1-0-2ef4cc3f8130@gmail.com>
 <20261110-dwc3-s2idle-v1-2-2ef4cc3f8130@gmail.com> <20261111121556.1871-1-tvlad744@gmail.com>
In-Reply-To: <20261111121556.1871-1-tvlad744@gmail.com>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Thu, 12 Nov 2026 00:40:02 -0800
X-Gm-Features: AclHuK8Qkz3X25XXdy-9C9EEdeN42WIrLnKNtjHkZvDmYTXrW3Oj8Y0wgyVcNBI
Message-ID: <CAEy9hNXYymaNAkNbSY-hnjXhWGxSedSnmnoEFtLO7ad4zc5U3g@mail.gmail.com>
Subject: Re: [PATCH 2/2] usb: dwc3: Keep the host bus suspended, not torn
 down, across suspend-to-idle
To: Vlad <tvlad744@gmail.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Vlad,

On Wed, Nov 11, 2026 at 02:15:56PM +0200, Vlad wrote:
> This is the third point of the Sashiko review seen on hardware:
> device_set_awake_path() does nothing for a domain without the flag,
> and the core is treated as kept although its power went away. I would
> expect 2/2 to bring this failure to SM8750 controllers with wakeup
> disabled too, unless [1] is applied.

Thanks for the data point from SM8750. I agree, and I have dropped
this patch.

Its replacement is an opt-in: the core keeps the host bus in
suspend-to-idle only when the glue sets keep_host_bus_in_s2idle, and
only the Rockchip glue sets it, for RK3588, whose PD_USB has
GENPD_FLAG_ACTIVE_WAKEUP. SM8750 and all other platforms stay as they
are. The RFC credits your report:

https://lore.kernel.org/r/20261112-dwc3-s2idle-optin-v1-0-842e3f8413d0@gmai=
l.com

Best regards,
Arun

On Wed, Nov 11, 2026 at 4:16=E2=80=AFAM Vlad <tvlad744@gmail.com> wrote:
>
> From: Vladyslav Tymoshchuk <tvlad744@gmail.com>
>
> On Tue, Nov 10, 2026 at 07:16:44AM +0000, Arun Iyengar wrote:
> > Suspend-to-idle does not power anything down behind the drivers'
> > back, so there is no reason to end the power sessions there. Keep the
> > core, its PHYs and the suspended ports, as is already done for wakeup,
> > and mark the device as being on the awake path so that a power domain
> > with GENPD_FLAG_ACTIVE_WAKEUP stays on as well.
>
> A data point from a Qualcomm board where the first sentence does not
> hold. I have not run this series; what follows is the existing "kept
> for wakeup" path, which this patch extends to every suspend-to-idle.
>
> On SM8750 (OnePlus Pad 3, v7.3-rc5 plus board patches) the controller
> node is a wakeup source, so dwc3 keeps the core in host mode. The USB
> GDSCs are PWRSTS_OFF_ON in gcc-sm8750 and the qcom GDSC driver does not
> set GENPD_FLAG_ACTIVE_WAKEUP, so genpd powers them off in s2idle all
> the same. With a USB stick on the port the xHCI then comes back like
> this, in 3 of 3 cycles of 150 s:
>
>   arm-smmu 15000000.iommu: Unhandled context fault: fsr=3D0x402, iova=3D0=
x669fd3200, fsynr=3D0x370011, cbfrsynra=3D0x40, cb=3D5
>   xhci-hcd xhci-hcd.3.auto: WARNING: Host System Error
>   xhci-hcd xhci-hcd.3.auto: xHCI host not responding to stop endpoint com=
mand
>   xhci-hcd xhci-hcd.3.auto: xHCI host controller not responding, assume d=
ead
>   xhci-hcd xhci-hcd.3.auto: HC died; cleaning up
>
> With the GDSCs in retention [1], as SM8650 and X1E80100 have them, the
> same 150 s cycle passed 5 of 5 times, and two shorter cycles of 25 s
> passed as well.
>
> This is the third point of the Sashiko review seen on hardware:
> device_set_awake_path() does nothing for a domain without the flag,
> and the core is treated as kept although its power went away. I would
> expect 2/2 to bring this failure to SM8750 controllers with wakeup
> disabled too, unless [1] is applied.
>
> [1] https://lore.kernel.org/all/20261110213346.1359-1-tvlad744@gmail.com/
