Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792701359;
	b=VCcWA+rmbX8vuIaExC+wsGqZfk5qRETHKAc+V0eNF3LTuzqwcKhCuf+CMfRIn3ny+9Ds
	 njjCKhEo1bDyAW2ErQuWYsnAsYyg0Yan7uM7+4z5YYJ0oGnxVOLrjKVP1Tnj+nxRwocRo
	 rcn1Nt6bnYabdqkKQA1baJKVOGlybzpZ2Ra5CZRufss96tpD7xlLJmZjiQArr+P9c9AB0
	 bDS+WNCswgbldRKyJaGvkjHvUvWw6rZ+2Xv0P8Ic17U+l/5flgYTbNa9Ox51c2iDg5QPz
	 fHQmEcJ08juhWeefwIcL02ffNO5bYFFE5UlzFV7KqZKa5C0GtL/+TpzsGuniBJeudXA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792701359;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=HnDYe3NHhf/4uICbOTOnoAX8q2Q8uj0G6Q6jfHYnHzk=;
	b=Kz1xou3p2pZvt5CFRTRWQk+22mPq9cb5v4K3AAQGBpTBsZDGh+JJAzYhg7a4as02L4Tz
	 3DJ6RZIJihz/t8aAnavfkwA6Vq76yt9UN1hLiO0icEk2QF+f1saYfxzkF44FbNE5RLyru
	 0W4Dz6JhL9bQ1V4xt+rfZCZIHd3KOo5O/nVPJBpS9V7zez8gEbilIwU7E/s3ad2FE3BwD
	 iyzrJ8wwAinFXTdArO63i/Un0FRt+x7vFh8FMGmx+lW41kHxUQNv+tO9aers4Y5TUFEYv
	 BcYpoXF2pke0R+3Y+xqakzirrBBwmU3wd6evgLRlK9sonvoqsLCXUVjiev1zFfoNoKQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cIydL7QE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.175
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1995606A320
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 20:35:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1995606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cIydL7QE
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8b0dba37a7fso2531937b3.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 13:35:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792701358; cv=none;
        d=google.com; s=arc-20260327;
        b=SHAby8Ns2QTyq6XWO0YkeFKBV8aDreiWYIpcpYgfSuH32o5G7IueqtRjRJR00Zno9u
         uf9N3/EcfF6Dh/FRPWqnHtN5gsyEbfKjK1RcqP1W06561z6KL4LzLErs3XtMbo56eRnr
         MqSjNEliW/rh5iq/03cg5u4KWPwG3DIikEncMHVBfGpIx4jD1uxjLbhVtQlbKD+tn0qi
         hrE6Qn6c8kBGOIq6T6TCtrg8eN1R7AcA0rp5mvrztfRfL1qCwKCSdUcEfSdZYMttuD5c
         j7KZ4sTeyTF+vxa8Sx+Lpa6Hk7V41nyOf8MlaztSAONgGH1KnN9Os+3vGAJSr6Zchbr2
         qIMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HnDYe3NHhf/4uICbOTOnoAX8q2Q8uj0G6Q6jfHYnHzk=;
        fh=QMHcqEJR9ethHbXf5ME9F58li0chVxDK9sX8SnFo5FY=;
        b=d/JIgRbR6J3+mgx0hn+uPJIyjazHEP3nSupj+GJ9ze9DOgPsUV+74vFZGiC0nCNf3K
         hmVQpYpnTwJVTIUQutAqQRftyT6ZIUN5t7VZ7K3fsgncbnYJmSPiZF6KlbvBQQCYQVXz
         WGyLD9VJHwEf1V8w7f3Xq45USEwOFRejBCvJD8jgj4ZlTUF9Q9TCfbf3DrzLYtw9hB6D
         RkOCYRINzSbJEccYAkHubLAvYC9RNWKjxPSB1X2qHTNZyZatuQmekKDYCZal0wJHQQAn
         B5jBSd4kTcg4fMR2JK/dwmZOz3GE4df+r4jYuFgS1N1bdD/ytUhn12J9Hsd+/djq8/ad
         TRUw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792701358; x=1793306158; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HnDYe3NHhf/4uICbOTOnoAX8q2Q8uj0G6Q6jfHYnHzk=;
        b=cIydL7QEMmCY8flsUamB32fs05+2ptLxtZZLT6mz28i3jQanOo20QchRyKcMSNhGCh
         vfWHoa/dBxcWaWx4BjUJN9Xb9C1it5yllobIaf6gnLBvxu5wtgY8g6w14mQFoVKxND0B
         nesCOq3x54OSB3glP1RztVydcHrgelrf3MsWaQA6zLz2GX3MBM+5+ZSIYx4Ybhe62iQo
         EbDuuyvtXVbP04VzAgX/Dv6F4xMpujQDxP3qCAVF8eSvzJHvmux20sAVhuOjFXNdhqak
         qWWBt/vPdTf9wJupcgaLPagwRyhIWSphjTg+MrI4IAmtVTgQKQ4jXiGL8x6l81CVCu4V
         ytCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792701358; x=1793306158;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HnDYe3NHhf/4uICbOTOnoAX8q2Q8uj0G6Q6jfHYnHzk=;
        b=CT5T8feYh0khoduI0srCRqyf8JnPV5PI1+pZjSMRV42A3DzOXejFCRi9tDGijvhoTs
         LqUEOjHQ2YtRCHTXRtNV9i57Q4Z5ri5cDcT3NMMZSpme7j5k7X54i11vAS31R895pwXk
         mMygqUgr+9nH7ND0iaxw8/O4QPxHNAzvIQKWFrZuOFjbKrYvyN/pRIT1CkaAo3BeE64M
         4gcjhYfNdRpTaFV1BGkUIyXRM7+3vrxe9zfNSGteNVVzCayV6LdUYln52rtC0/VZdTv8
         Bl8fZlbONHH6OaBXPDOnxfoVEvVGt0Gxg+xp61obT/NaIUmvVM/d+SkgKqLqkU2+O5z2
         IybA==
X-Gm-Message-State: AFq9FYKcd5uUwvoONZZgrX/XrhqNyHMRH6jAhwAgYf/IjrEEwpDtqCVv
	FXWYYMePOacOtiRLYtU5rTf8eNOLYZQ4J+Ff4hSXX0UlNWrtgVR/0d84gfFzPmtETxATDgPpq6p
	kmttkybDZ2WOKbXyRAK+9zo7j+tZStH9J7qKOqk/Pmg==
X-Gm-Gg: AYBFou1zqh2mfKjpTdso++NyTOSVTAXuhPRuI4aVnZ7q+UCK1ipo+12KEu1ncNHG1mo
	Q8LfHYDWIllhikTpFWozDHiU3b3azwB3sEunE6beQHXBTpgmMq4Q+Gt5oOocHqFhRskxFEiZ24q
	tfpL5rhH9ZgZk9gWjy9fkVaVEbbeJj7lRNISp5LU+kIbd96dXdeITPzt2yrTTco7ZOTPk6XGt4t
	XraZINwdUw34HiEixr+u7+wyfpoXvMnSnyDMRCsr/f07qlTDIpwRGoJgxyNxsmJXB7B2nzxkJ3O
	d2bJrRHNFBUQFZYLgIcqA6lHLahFjALpTb0nq6NECkgCYvsiMk1yR0tZ/catuDSA+ZkSeR9NIYl
	c9QEUg1BGBh6paYfPI1cpuUicwqvJnmq1hwPeRA==
X-Received: by 2002:a05:690e:14c6:b0:679:abf5:1478 with SMTP id
 956f58d0204a3-67a35b1015amr75503d50.50.1792701357664; Thu, 22 Oct 2026
 13:35:57 -0700 (PDT)
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
Date: Thu, 22 Oct 2026 15:35:46 -0500
X-Gm-Features: AclHuK8BQZdV2f1iffSFbYwwrKQTOhYGtR91ViuizkGRA5Tky2cU2koe5WWRIn4
Message-ID: <CAAnD8RZKDiv7eW=63HP+obgwXEUCvoQLNzC+xa3quy3P=PT-QA@mail.gmail.com>
Subject: Re: HP OmniBook X 16 (X2 Elite, Mahua): DT bring-up report and questions
To: linux-arm-msm@vger.kernel.org, pankaj.patil@oss.qualcomm.com
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
	"jagadeesh.kona@oss.qualcomm.com" <jagadeesh.kona@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> +Abel is the fix for that out now?
>
>The fix was posted for usb gdsc but wider discussion is pending which
>might make the patch obsolete
>https://lore.kernel.org/all/20261016-glymur-usb-ret-on-v1-1->1790a523fd9c@=
oss.qualcomm.com/
>Use this series for the usb context fault

Thanks, that fixes it. I applied "clk: qcom: gcc-glymur: Use
PWRSTS_RET_ON flag for USB" (20261016-glymur-usb-ret-on-v1-1-
1790a523fd9c@oss.qualcomm.com) to the Ubuntu 7.3 kernel (gcc-glymur.ko
built out of tree) and disabled my workaround (unbinding the usb_hs
controller before suspend) for the test.

Result over two s2idle suspend/resume cycles:
- No arm-smmu context fault for SID 0xce0 and no "xHCI host not
  responding / HC died" on resume.
- The webcam on usb_hs (HP True Vision FHD Camera) stays connected
  (only the normal "reset high-speed USB device" on resume) and gives a
  picture in the camera app after resume.
- Resume no longer has the ~10 s xHCI timeout, and the second suspend
  succeeds (before, it failed with -22 from xhci-hcd once usb_hs had
  died).
- The other USB controllers, NVMe and Wi-Fi resume as before.

Deep (PSCI SYSTEM_SUSPEND) is still refused by the firmware here
(-EOPNOTSUPP), so this is s2idle only.

Tested-by: Jeff Roach <jeff.roach0@gmail.com> # HP OmniBook X 16 (X2
Elite, Mahua)

Since this is outside the patch thread, please feel free to carry the
tag over by hand.

Thanks,
Jeff Roach

On Wed, Oct 21, 2026 at 5:34=E2=80=AFPM Jeff Roach <jeff.roach0@gmail.com> =
wrote:
>
> Hi all,
>
> I have a device tree for the HP OmniBook X Laptop 16-cp1xxx (board
> 8F46, Snapdragon X2 Elite 12-core, "qcom,mahua") that boots and runs a
> full desktop. This is a bring-up report, not a patch: the DTS is
> currently based on the Ubuntu linux-qcom-x1e 7.3 tree and still
> carries my verification notes. I'd like to rebase it and send it
> properly, and would welcome advice before I do.
>
> The DTS sits on mahua.dtsi, uses the same PMIC deletions as
> mahua-crd.dts, and copies board wiring from
> glymur-hp-elitebook-x-g2q.dts. I checked it against this laptop's ACPI
> tables where I could. DTS, notes and test results:
>
>   https://github.com/jeffroach0/omnibook-x16-linux
>
> Disclosure: I'm not a kernel developer. Most of the analysis and the
> DTS were done with an AI coding assistant (Claude); I did the testing
> on the hardware and checked the results. I'll do my best to answer
> questions and test things, but please be patient with me.
>
> Working (kernel 7.3.0-21-qcom-x1e, Mesa 26.2.4):
> - eDP OLED panel via msm (samsung,atna33xc20), DP-AUX backlight
> - GPU (Adreno X2-85), with the workaround in (1) below
> - Keyboard and touchpad (i2c-hid), lid, power key
> - NVMe on pcie5; Wi-Fi QCC2072 on pcie4 (ath12k, modelled as a
>   pcie-m2-e-connector)
> - Bluetooth QCC2072 on uart14, using the posted QCC2072 UART series
>   (btqca/hci_qca and pwrseq-pcie-m2 patches) built out of tree
> - usb_0/usb_1 Type-C (SuperSpeed in both orientations, PD charging
>   through pmic-glink), usb_2 USB-A (no repeater node needed, UEFI leaves
>   it set up), usb_hs (webcam)
> - ADSP/CDSP with OEM firmware from the Windows install; battery through
>   qcom_battmgr
> - 2x WSA884x speakers on swr0 plus VA DMICs
> - s2idle suspend
>
> Issues and questions:
>
> 1. GPU GMEM size on 3-slice Mahua. MSM_PARAM_GMEM_SIZE reports the
>    catalog's full (4-slice) GMEM, so Mesa's tiled rendering corrupts
>    the screen (garbage bands, diagonal half-drawn quads, and CCU write
>    translation faults from WebKit's Skia GPU raster). FD_MESA_DEBUG=3Dsys=
mem
>    and TU_DEBUG=3Dsysmem make it clean. I think the a8xx slice-info chang=
e
>    in linux-next ("report the active share" of GMEM) fixes this. Is it
>    going to be backported to stable?
>
> 2. CPU frequency. scmi_cpufreq fails: "timed out in resp" and "Failed
>    to query supported version for protocol 0x13", probe -110. The SCMI
>    base protocol answers at boot ("Qualcomm:PDP0"). The perf
>    protocol never does. The clocks stay where UEFI left them (about 3.5
>    and 3.9 GHz). Is perf over SCMI expected to work on Mahua with
>    production firmware, or is something else needed?
>
> 3. Suspend. PSCI SYSTEM_SUSPEND (deep) returns -EOPNOTSUPP, so s2idle
>    only. On resume from s2idle, usb_hs (a200000) gets an arm-smmu context
>    fault for SID 0xce0, then "xHCI host not responding ... HC died", and
>    every later suspend fails until reboot. Unbinding dwc3-qcom before
>    suspend and rebinding it after works around it. pcie4 also logs
>    "Timeout waiting for L2 entry! LTSSM 0x11" on suspend, but the link
>    recovers.
>
> 4. Smaller things:
>    - "GICv3: SPI 4115 out of range (use ESPI?)" right after the SPMI
>      arbiter probes. I haven't tracked down which node causes it.
>    - The pm8xxx RTC probe fails with -ENOENT because this machine has no
>      RTCInfo UEFI variable (qcom,uefi-rtc-info).
>    - The headphone jack is a Qualcomm SoundWire SDCA codec (only in ACPI,
>      \_SB.ADSP.ADCM). I didn't try it.
>
> For an upstream submission I assume the right base is the qcom
> for-next tree, with a dt-bindings patch for "hp,omnibook-x16". Please
> tell me if anything in the approach above (for example the /chosen
> simple-framebuffer that keeps MMCX/MXC on before msm probes, or
> dropping usb-role-switch while running host-only) shouldn't go
> upstream as it is.
>
> I'm happy to test patches and other things mentioned in this post on
> this machine to the best of my and Claude's ability (mine being fairly
> meager).
>
> Thanks,
> Jeff
