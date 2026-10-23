Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792713703;
	b=OLNRBZAaFoYFst3Njxm1p9llAP9H6MbDGKnSOd/bKUQWTXQ31+8mz8Nr9OTAixTvkxK/
	 Zk1IaSBnh7guDBmwmcv/NMTZnF7bkY6dlMx7wuNPPbnD0M4YKQrgeCBE/jw86ZePT0HVD
	 4vUm1EerCpvOWOUv/UCI1tj/Pz5huYeB1ZmkAjO4BcYiZ5BdO6WibOk9XJxe8KYrCpgkj
	 qYi8jDj3btKdVKsYKHkdEYMmjgSnAWN+pkErKT6bhwGqbIjKxyU3Y5o6S63lQZqVyzgbH
	 U2IMkfXTpaqWsDjE0hcaErUWKuCbUSX88tEbee3UXGCV/lWj2V6+nTXILAKvdHmSCkg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792713703;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=yzq9DLiJaBumj+9b6/Tu+UJpvww2VzpZXqDN8hZnKOM=;
	b=SFZN5YMGyKah6Jnej2P9hWOnbyiyLKsgvugQOxwcKYd2XhID2gyv/rbyyee4EbCEJ3y8
	 bfK89/6kEc646MNdGlIe5VgUCxqt9aq9yJsNOnylmeyT6CWWamFiHmWg0aTpHFyNYY7L1
	 SEhJFoIPq7TScNr2bk+HoHyGycxdJwreg5WYJt+HLc7cvHP/peux5Ukqf8+Uso7t23u6z
	 WEGHsmkkBaeszPKFuPwIF+6ty49jAdwHbwEp0dT6J7B+GS2uop47WjFVAbZH3NmUKLstE
	 jXHHY++/j6bIxnrs6C2jVWuK2Fl3+2f8DAwK9lCteTT3E/K5NkYniz90J0dR1vDkV2A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=M50CXSkX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.54
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C79A606A319
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 00:01:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C79A606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=M50CXSkX
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-67583c777abso317222d50.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 17:01:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792713702; cv=none;
        d=google.com; s=arc-20260327;
        b=aE4gyemODBXUDWNg0cm0RlmQwnN5fXFmug+S+bEwcDgVYaHl1nL4z3kLl3eI4NRtjC
         XL9+Il1G5s4ZdO71IKwECDWULBPOFPIfPTN9zNTMrvLOapLs1Cw88aNjlqzeH2F3gcUy
         BtT7zIeMlqZ/G8rVhc5qQ1vDzKjMvy8B/tSEaHIt3wIFJy6eiJDYVv4Em0F+OFYEb27S
         ojm80+WdYJW6RuLWvx+DJ07jhYcgvSmE79wdvhZ22jar1jGDZn45pSViRDaWqZ5C/Myd
         ZOkQM9IRI/tc/xvkSKI7tfvZWw4uck7BuYGscbPx39fS5oKm6G5hV4PVJlqQ+m6KdD6w
         qq7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yzq9DLiJaBumj+9b6/Tu+UJpvww2VzpZXqDN8hZnKOM=;
        fh=U9JxCdxCmFlaxTU7SQAV0CThd2T7YCT5yTj2BlHfQXM=;
        b=kmrh+8ukzneQzrt7QOwi61bpDGPDD0IIwdJbg0qEZQA3DpsZmbz2oxsEzIogt/lMPt
         JXReFd8lUInIPdRUvOCGYcx45zS9uSa3VVlyXX88pxDYorJUCytN3XcE3moe4mUTQUai
         cRntBtSc6tPkUzFqFZDacOZz/dltHLhZt9FYn5zHgVqJmgxKS7gnhg6hCFl4y25zcEZl
         QoshDr4zZGuocOQa7i9xVZk1nI3A0Zqe/WdzSLIV/hBAJiFgLvPevLyKxSt/kaB1d+61
         0kb/SpPEmj4vKNl6/SaObTKHXQ8SmBeSYVbCeCOKeTzkR7FJtQcEDwhNWZ3JDs7prn+L
         bJKA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792713702; x=1793318502; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yzq9DLiJaBumj+9b6/Tu+UJpvww2VzpZXqDN8hZnKOM=;
        b=M50CXSkXcThrBd58ow/idb05qqM1bqyleaHXlO1YxpAN6xiBh1zo1eOn3f2SyxbWY5
         mZlRmddBVaWyO7N8NuRAYXn22YUnjwkDapm39tl49t3AiEwiGgCx/VdSVOJVMSrp2W2Z
         cUJpbG2j4d8tDaYUKyPR86q5OGuUPcejNVaUrTomOCZtfG5el/3iAVJlsDOn5FjhLN3p
         yPucnnrsve6ZgLSBgponEi/aP7DCyNKap00SXw8Rnqjd31Q/Mw/cJj7aqIBVfDCOy/jF
         XD0/6QCfWer+Sa2seNz+xZgaSBUIwhSA6Ua9Mov71+sJOcKN+nRQXvIO9nvxuNA+FAyC
         7UwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792713702; x=1793318502;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yzq9DLiJaBumj+9b6/Tu+UJpvww2VzpZXqDN8hZnKOM=;
        b=UGWavkuPg5ndpDCKO5Dt03ERmIG4rXEv22r2x/4cfrnrfkdmh3Pzts7SYN6mLDS3+X
         vTSOTiKbaIBQaUEQhQKXczu02UibXx2VjICYANVIbUSt87SLJ79MxJaaW1lXgPL09sx2
         Dhx7JSBjvVkh0YKdSwtSeNsaph4l4LBpnAoXnAMEYQ/YxOUcW3v4ZEMS1DzdAWbIOVXU
         AAJ7TF04LeFNqaOC50fxC37EmLElD6N/ecJTy0Qiu1Tkjq074wBVor4CG2Bbl2ig4/u4
         6OhEGf6llnt68kfW7icKNDeWSNbptdYrBs0iFGsllq83dlzD7vaPdwQ0ha17X2XMJl5s
         +tCQ==
X-Gm-Message-State: AFq9FYJYWFpv4Z+kVzCf6VqjU3Wrernxu1iKQHf7/A5UfHBdBiwYOjhJ
	MbCzj16WffUBNzwuw+cb6wityOggDiRe+/3MHlOAWbn8VdFirqx9gZHn1ctbSreYDth63I+1qee
	FJGmEIHBGjtW7q3UFvId42p4D3nh6HzU=
X-Gm-Gg: AYBFou2RZh1paq8sDvrs4BG9HqRc3xj7Rx7OsKO3fiqhH9qVdhTE3Z8mb26SaTO6DP/
	dHfS6GRh3DLFGW6GL2Rodb30Z/ikkMxvgRJa7V33R8yhabDLzv3vy/F9/OXzciJiyXfZJO3Kf1G
	BjXYS2q2iX/Xb+r4MebaxlGduIbfWIGDT8L03Xfj518jGt7d6RifdXWB2+Ozy1Rr9uZ03PHGVJM
	MBdSgS2it8kYa9zikTd5liIq/PtfQNONds4oDHwpE3Pfkcl086LuoZbCkKlDj2sOW4NbbsiHnDd
	Tt1mKMQBELicdU90xc2pfkvjY7nt/CxwelCWr8mp3PldvOi7HdBymsAl2vd2b37mqb0gM16ltUp
	4FTJ7HuMffV9OzLDjRmsPur683LiZn/99oZ6h
X-Received: by 2002:a05:690e:118d:b0:679:97d1:439e with SMTP id
 956f58d0204a3-67a35a6c199mr448404d50.2.1792713701951; Thu, 22 Oct 2026
 17:01:41 -0700 (PDT)
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
 <CAAnD8RaicCmi2vk_Mna-Mfct4Ebh5dFVnKUkvVSiX6kpTB_imw@mail.gmail.com> <1ec9207e-0eb8-481b-8cad-ee6cbb31bee8@oss.qualcomm.com>
In-Reply-To: <1ec9207e-0eb8-481b-8cad-ee6cbb31bee8@oss.qualcomm.com>
From: Jeff Roach <jeff.roach0@gmail.com>
Date: Thu, 22 Oct 2026 19:01:31 -0500
X-Gm-Features: AclHuK9Ou9nMTNXaoNYaO8jx8I2A4hFZ-K0BbSc9girdNrXXWXuzQ9E4n7fnFEI
Message-ID: <CAAnD8RareQsg9tsVQ_1nVNq2dwGubni8pjKNKVVVdkydn_YX0w@mail.gmail.com>
Subject: Re: HP OmniBook X 16 (X2 Elite, Mahua): DT bring-up report and questions
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>, 
	Akhil P Oommen <akhilpo@oss.qualcomm.com>, lumag@kernel.org, vkoul@kernel.org, 
	neil.armstrong@linaro.org, linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 3:27=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
>
> Can you give this series a shot?
>
> https://lore.kernel.org/linux-arm-msm/20261001-glymur-phy-v3-v5-0-3848c26=
15d5a@oss.qualcomm.com/
>

Thanks, that fixes it. With the series, DP alt mode works at HBR2 on
this machine.

Setup: Ubuntu 7.3.0-21 kernel, phy-qcom-qmp-combo built out of tree
from the 7.3 source plus all 11 patches (patch 4 needed a small manual
fix for context, since this tree doesn't have the USB4 block). I
removed the link-frequencies cap from mdss_dp0_out/mdss_dp1_out, so
the full 1.62/2.7/5.4/8.1 GHz list is back. Sink is an Anker USB-C
hub (Parade PS176 DP-to-HDMI) into a 1080p monitor, on the usb_0 port.
The hub runs DP on 2 lanes and USB3 on the other 2.

- Picture is sharp and stable (before the series: "No signal" at HBR2).
- DPCD 0x100/0x101 =3D 14 82 (HBR2, 2 lanes, enhanced framing).
- DPCD 0x202-0x204 =3D 77 00 81 (lanes 0/1 CR + EQ + symbol lock,
  interlane aligned).
- Measured vblank rate on that CRTC: 60.000 Hz for 1920x1080@60.
  Before the series, at HBR2, the same mode ran at exactly 30 Hz.
- Works in both plug orientations.
- Plain USB3 on the patched PHY is fine: a USB 3.2 Gen1 stick
  directly in the other USB-C port enumerates at 5000M and works.

Tested-by: Jeff Roach <jeff.roach0@gmail.com> # HP OmniBook X 16 (Mahua)

Two intermittent things I saw over four plug-ins of the hub, in case
they are useful. I can't tell yet whether they are the PHY, the hub,
or the cable:

1. One of the four plug-ins gave no picture. DPCD 0x100/0x101 was
   still 14 82, but 0x202-0x204 =3D 00 00 80 (no clock recovery on
   either lane), and dpu logged "vblank timeout", "wait for commit
   done returned -110" and "frame done timeout". Replugging fixed it.
   I first thought it was orientation-dependent, but the same
   orientation worked on a later plug-in.

2. On three of the four plug-ins, the hub's USB3 side kept dropping
   and re-enumerating every few seconds while DP was running ("can't
   restore configuration #1 (error=3D-110)", "set hub depth failed",
   "device not accepting address, error -71"). Unplugging only the
   HDMI cable from the hub stopped it within a minute. On the other
   plug-in, USB3 stayed stable at 5000M with DP running. The hub also
   logs a "URB submitted while active" warning in hub_activate() even
   without DP, so part of this may be the hub itself.

I can collect drm.debug logs or test patches if either of these
looks worth chasing.

Thanks,
Jeff
