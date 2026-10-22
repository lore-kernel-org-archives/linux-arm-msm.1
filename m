Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792695809;
	b=uxtwXyDa1KVBJlAZYdwZPfmlmKvUtyUmDtBWBF7C+lbK759vaLoVAZiSH9Gvg40Yn/7e
	 YH1jKSnE8vThZ+lQ3FA0BLYGtiM8pYpHwLt+FdxWmhkmkmn80jgwwR5nTyH0yDbcWLrRn
	 0NEGxpDNeC6mv+5cVQR95xlSvGSWIV1Tmcf2FMcUOKV6Kz+YTWKrSIBNv2BIBW9TjOlI7
	 oK0HmFtpBVWajpdeHi+zQz0puPWkGK4SucNluaDyJo4yV+791y59rh2kEVnEgyjLNNaFX
	 5py8elWo8jzA12VXECgCL7NfNfVdgojeoopBuKRg2+97QLF9VcYE0tXJgaZE/ZERmfw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792695809;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YFlP3FccQeszqXuZ0Z7/akOSPtoAt88BpigY0WGGEQI=;
	b=etX0UAaEjdvdBdO82gv2l26aIobCSkaq4O8DIMPWH2PkVYaSqFyhjOeLWoNHedUGh3/2
	 b2xo2jZzzwPIm2NEioiEdic+1FI1A2yCW0hVU045o8G1RBrlZzOWsTPQtoIZRGMAwAVcV
	 fPUiCfOPfDzp2W6PrvvxIWfKEzg69PC7EUia3zAE7dP0UMAplhwwTYBExxOLzi9hmyoME
	 v5rGADnehDgIgM7hHFewu0JHKA3QKCMEnGY3MfS8hI0Z6No+bXZp6+8ycdqMFw8Y5YeLL
	 gCSCPwggQZlOwG4QSGSqANY6/yQvApWmD/M0z9DSoMFz4XeiJRoUDBPYbXFlSugFvXg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hedWKjzr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.46
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF59606A320
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 19:03:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0AF59606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hedWKjzr
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-676804a3a22so220057d50.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 12:03:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792695808; cv=none;
        d=google.com; s=arc-20260327;
        b=Zq8YdPzl/Snt++YvmApN+PcEOUN6PfMOM5InYSEwj1hqNN8nZgcxI+3lR6ZlXWE/MK
         QolicoWwM8GG79EMQ+DxukP7HzGG8RxRr5zZ5JWeH+Lrud9vQsVFPJm/ixEDkIvTQNIa
         oB8cl9FuGdx1etFW9awXiMMIcQrjlFDnWCkCjIovaEM+2W/pMYBrFYkuJzPTIJQ3ZDj4
         QWphPP2NP6mHqO+cb/iECZMb37GFL/IDapzdX9Ovt3yIuwQoF/ri8QXk219qRpueMNMs
         w4ENuHYMIQsloUNF9aYMgQvQiwXqV0HLgG3PGIM7PzfI+L97+SOPmUXp19FO0HZsvMV9
         QOjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YFlP3FccQeszqXuZ0Z7/akOSPtoAt88BpigY0WGGEQI=;
        fh=vfZkaP6t8JDES5/f3SJ3RFR9815t+IKWBRxLybUOQN0=;
        b=Dc6z9kGFCDA6KSQh6iNaJ5i8BYynnT7f59A0MbFr7B94dYRYSWAkX/0/z65ETNZrYd
         UP/TE2fAxmuj3lE5vkMHsS1YyatVex6xmxe/SNzxIGbiGTTA+YrZobkniIcqOSHsK0r+
         MOnmc0Wc1ZUAYHxyThGrHxD3Qy3Jv3sw6y8fxiOurqVUEvUd3SfMWz4Kd0jEn8km0uqL
         bAlMa5Ag/29WbwDmU565LAKsIdCqT5RhXF/woBScU6rPoRW1fUfbUUlfhNH3zff6AVpF
         CopWAoUqHD2P2SCgdPAA1Koh8tDqombAURvRgLS2L/lhSzOfQJZTMxNXU5J7te4J+LXD
         F2Kw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792695808; x=1793300608; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YFlP3FccQeszqXuZ0Z7/akOSPtoAt88BpigY0WGGEQI=;
        b=hedWKjzr6n8Cnn/i7BU0iiSXpmZfhleP7MCu+ncjReECnpMy6jBAzMDWRwK/Qubhps
         P7Y/G/SJNfqXR3ySYac29R2v2CmZav8jwKSNcayqnJbbDXaKINoMMDiiDAGsmD3E4Cv5
         i81ebc5DTqlH2pQ2Godk/+vuD5tDFk/m5fQ/IUiGksywS4s9i2w0Ra0a869R/BwwmAbN
         AmJF4ieku4X6nFr4QzUSydbCkZYRRc5nvBItIvUR8yq2E23vHk4JQo210AFwm0QXzru1
         bSpUiGwyI6uys2SNdYAuYGW+DkUuRnW+WZSqoJhestETBpw2tDCfISGAuhprxb49zy4V
         HiSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792695808; x=1793300608;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YFlP3FccQeszqXuZ0Z7/akOSPtoAt88BpigY0WGGEQI=;
        b=kghkXvBT2ITU3pbCbTirxrEw+A2HLM5lPpcO/x2Qea9mAdUtPouqtR89DVB3lHexSj
         qbTE3CHaIeOMlQLzMta+oHEd5RBmkU8Rb8JwMlkljAUWJjQA+/1E55iyT4+hTMy0pytu
         m4sRctf9HmhmB6WrCywD1OHNtL2jNvk3b4CEtcOp9aB6qdZnMKdqAwe3nE4MHIc4wmN9
         AKMpmUsfCNX0clg01gFg5qh3n9eJCAojVkeDbvGClSoKGCPmv8fumKz0HiIQHItOteqU
         j93O7aT9sLmNbmURHmAqDb1+q7jG48dHgPwGBlM0DnH1wD0fjdc1nKJZGprpPpOmScK/
         UzGQ==
X-Forwarded-Encrypted: i=1; AKwUvBzW5GqdyHqxEFFryk3jLc+WIjJ/q4SMeFCTzCCKt/D4GhckFdd8J8Jhe6UjCzWiJM0S4tsTNqql8aNavrzt@vger.kernel.org
X-Gm-Message-State: AFq9FYJ46zcuhwXoN6hC9gdrrguNOD0oxZz4G4l4o0Gl1fxgSFe236cQ
	ANADz6xL7+0koa/ZajhUIrF+ISpkj39W6shpO+X+BC0Ybas9HxAC0lBb/BQuw572213PpIvii2U
	OyHJBI/rORRSFPojECSWmhU4UrVVL1tI=
X-Gm-Gg: AYBFou3ObgAWZZLqJhInFgGaLldEiHkcVKbsfYU+bFFjUfDfVUiP1UTReXzVWqTn500
	iBDgdfmqk1UG9DMTzqs7lHwlOYJgbHxN1/Mn7eWYY7Xl2GYxuwiXnIfbG4x6j9mv/hv6d/CNn1U
	VqpCOGFjjzOGo9SkE3nPg4tghxxeyRWTMQl0XrZpCrfk7ahiKR38pvSa3GvZZqzrchnHgRcd+5u
	VZUv1REOxoMqDB9lnbowfN0actOUtYY7EJJtvE7cYoI2fLd8WVKvfnWdobJmdkmK7zUocLo5w2Z
	38kpOJ4Uq5KnN6+tbW+1eHvetc94m2c6KSbU1YM0rBp1KLZBpueSIdtlaRukfjZrIycDNMe7iUI
	763GX8DPvjbwGyoMvuZVOUTF0kvWN7AhcMwE1TIQ=
X-Received: by 2002:a05:690e:1388:b0:674:1576:d1a0 with SMTP id
 956f58d0204a3-67a0e581177mr3680100d50.76.1792695807788; Thu, 22 Oct 2026
 12:03:27 -0700 (PDT)
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
 <4e031de2-6564-4e63-9102-799a0b435689@oss.qualcomm.com>
In-Reply-To: <4e031de2-6564-4e63-9102-799a0b435689@oss.qualcomm.com>
From: Jeff Roach <jeff.roach0@gmail.com>
Date: Thu, 22 Oct 2026 14:03:17 -0500
X-Gm-Features: AclHuK-mi8DArQXBK3M6EzMjpoBut2i6CrlCmiOb4h8BnDGm1iNpr1qwnqLyRxo
Message-ID: <CAAnD8RZtjvwOAfRWGyQzaVqPepozCWOkRiP9F-eiG2=E0QKXrA@mail.gmail.com>
Subject: Re: HP OmniBook X 16 (X2 Elite, Mahua): DT bring-up report and questions
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 3:17=E2=80=AFAM Akhil P Oommen <akhilpo@oss.qualcom=
m.com> wrote:
>
> https://lore.kernel.org/lkml/20260925-mahua-gpu-v1-0-0fa0bfd8d315@oss.qua=
lcomm.com/
>
> Please check this series for Mahua support, especially the DT patch.
>
> -Akhil.


Thanks, that was it. I applied patch 3 (drm/msm/a8xx: Add Mahua GPU
support) and patch 5 (arm64: dts: qcom: mahua: Support GPU and GMU) on
top of the Ubuntu 7.3 kernel (msm.ko built out of tree), and the
rendering corruption is gone.

Details:
- The GPU binds, the GMU firmware loads, and there are no faults or
  hangs in the kernel log.
- MSM_PARAM_GMEM_SIZE now reports 0xfc0000 (15.75 MiB) instead of the
  full Glymur size.
- gnome-shell (freedreno GL), a GTK4 Vulkan app (turnip) and WebKitGTK
  with GPU raster all render cleanly without the FD_MESA_DEBUG=3Dsysmem /
  TU_DEBUG=3Dsysmem workaround. The WebKit case used to cause CCU write
  translation faults and hangcheck recoveries; it doesn't anymore.
- GMU firmware v5.2.38, Mesa 26.2.4.

One caveat: the newest released Mesa (26.2.x, 26.2.4 here) does not know
chip id 0x44060030, so I added a local hack in MSM_PARAM_CHIP_ID that
reports it as 0x44070031 (Glymur's 3-slice X2-85, which Mesa main treats
as the same GPU). Is there a plan to get the new id into a Mesa stable
release? Until then, users on released Mesa won't get a working GPU from
these patches alone.

For patches 3 and 5, with the above caveat:

Tested-by: Jeff Roach <jeff.roach0@gmail.com> # HP OmniBook X 16 (X2
Elite, Mahua)

Since this is outside the series thread, please feel free to carry
the tag into v2 by hand.

Thanks,
Jeff Roach
