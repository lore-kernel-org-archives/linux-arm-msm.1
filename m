Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795771721;
	b=tfEKM4vXYJPNA9oLKKAVEu42R1tyMC9jlIsuScGjXg3pa4qO75wHdOb1jNFh5HEXmlKr
	 v4i10Of/NfTkBkUHlBu1MXPe1X63UG7iA8Gdw8uj7H6rJz+teOHlZBd4WuypHb6BDVHQa
	 p5kpHvRwXKJyoMGVG8ZUM7LBPCqhs4f2jq8J9V4LcA5bFhEMY5PYR/GEcOD9sh3aTdo2E
	 aeOJI20mI0cW3XbshhzO8VIxOPk9xupboboCOzdNUhxi/V2vUVQ193tvmGkX++rWJk7Kr
	 Vr86iuvjCbLTDVXA5hjvDsArDxHwhWi36Sali55TuXKuSzPacZHwEFU9/VTqHqm9XHA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795771721;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=jasLtAoAN2ehO2HUA2d9AgFolPUIbV0VilFvPbWCDQI=;
	b=kHCWPRrZ3qlcItG48Qli2Wy8DAXugAIhFCPTg6Fu7dGRAPDVqx55rcQ4AuvM9frwTTAG
	 F10N2v17jOMiwCBd/i6FwLkE6t+zzzxWkC8d5s4H7DWRGGpkShZEatU8CXDWk7brlSnU1
	 ALnXUrgLE62te+vPHnmS0/rgm4Xbkaf1IDfjD6UTD55xWLSGyfXK6xxA5iDBCkagwdNOl
	 KqLAL3N9nnc8mALbH+LHt1+EDJwqBE40XR8jJeB2bIhhsPYR6E7RslCeQ2oQl6Rh2ftQF
	 3mKjH/MJXqe09vdIUPK56UOqdfrs/SM0zs1zJTBBan+zYhvotjBra8gnt91Ky2srdMQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Rh16fdah;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7CD7606A321
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 09:28:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7CD7606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Rh16fdah
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6df7f544919so4649272eaf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 01:28:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795771719; cv=none;
        d=google.com; s=arc-20260327;
        b=T1y8eDN9BR6NTfU97IfMsioX7nzUCI+6nxZMAf6H5+ucD9zFtALnSoea/cdpG3f5tH
         97CurzZefLSxN8tg7l5Nqoowh//WP7tGLjOb5C80kEFhBM+f64hK5fNsaO17XdiYxPD2
         LQCqpOFvlkmTO7Dtlq+qg2UghqdxDpnrYVUr0KkEhdUTg5IKCLHlCsq8yi1cAQa4X/cH
         3RHYEk/nBlMvq5zzvBjU5GDMGiEw755RUDeon3UzwQ3Qbm9y5OqRDyYABGJa3/QaBIvt
         d0viCP2eSJ6p+FzxbF6nNIlvy6sgxt3x0l/HetO7Nnjqfk/KpotcraESoXdIXNfCYzdV
         abig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=jasLtAoAN2ehO2HUA2d9AgFolPUIbV0VilFvPbWCDQI=;
        fh=gJIfBhtw0jG+q+BoCrDawDD4anIYVvWlplMW2JHiDbU=;
        b=GoLlrjWgPD7XTau40qIzlSRmQ1XmFz674AeDZf2oQfkE4W34oo8LBVW5EiAA0j0VGg
         bH1Ha5arh6D7T6e8VHI007WrANxBB1scF//+myb/luU0YymLX2qdSlu9BuGjq5YXluqZ
         uL0wv411nPOVLMLs6zV163duTVS4E2uOoLYuXldlDG99wAZTRRGOI0KK2Xifwl7yHtsq
         Vj9gnpOW9ay+rHuVwJt5vrk7OFUEXUJuMxfRThFm0Ej+geb6llfUrofpurEb8Ln9fh2h
         JdI7qrYssvq+5d9wEl2P6m93cNXYTdrnCv80ZLKeONuOYIEPx+Tt4ucABzIYRMfYrMNO
         /s/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795771719; x=1796376519; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jasLtAoAN2ehO2HUA2d9AgFolPUIbV0VilFvPbWCDQI=;
        b=Rh16fdahTkQEr2yvVBRJtwyGnSAEFnpmKRuEY4VXO7nsw7zB+ex9qefDx7s0fup7eE
         HfvsT2dDX0gNl3efQY+ztdmRkgDrArOtyNy69FzG+zJGk0KYKOuRWHnJux4l7w1UQs1V
         QQjjBGJPIfb0rn0PQop3avMkjA1j7sSSJ75oGJUS9ur0qpazQ1PyPXv+GrO8iVGds8OO
         8qXtqT34EW3BOo5kmmYx9Z5JuRDIoUY/g7i6q8HXBXnftNXfZo9zQ4kz6Y1LgivYUgUe
         hSixs2u7lgRAWet52bWJjfOHbqaIeieewDhqyDBPZYng4Rk5uzrebQ5B5rhSddKBuyfL
         Psxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795771719; x=1796376519;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jasLtAoAN2ehO2HUA2d9AgFolPUIbV0VilFvPbWCDQI=;
        b=Vl0zUQ2Nqu8tJKBJwwVNpRAIUWYcz/ynszvhhLfEUS/jJ00QEgU+iYtACgjxGRcC46
         /Mx0QQLIDKj194WJZVdIjppRsiLFogapJIjenJuF13e2fmNG8o7YJ1MEWDMJUgZQIqgs
         MBkCmIiZy7EMkZt4OorlfulgTKyrProJpBiS4u83HmcmCG6b2eS8JOtByqe5C33mij5j
         yzfJn4x4fSMSjvWy0i9pyJ159GToBIgPaMwEiAiZKV0xK9MogAmGKcloAI0oyjqmjJ3b
         BEFlHr6+rW+MNP4d2GA3j088/JIDtk3O74DY2BCV4IRzYqM9HI2IquWf3nO0U12zHSdW
         eUcQ==
X-Forwarded-Encrypted: i=1; AL+hErEe2VBVDkkWNRiwpZmXqO1c9Jj5c5cfTda7o1E8wIxtNJTUb7dpgtXWI38TYZS+XCopCeLrit6BJRIbgsR4@vger.kernel.org
X-Gm-Message-State: APuU4Z8szWD/Huft2ERdyLBx9ylKR2VY1m+z1t17IKCdpNbcChCNuqx9
	7KS7diZOgeN/b5c7zNS1j/8mEejM4NrfFH1BVvzpaMpcWWoqs5jgkw7AxMUjRDvgC5n6mQLdbjS
	Tuq7ZROfnOgg+qY/oE6HmB3Xj0pgSXs4=
X-Gm-Gg: AZFdTZeeLbBD/oV1U2VNS1KnTcV3gUcoee8uqg6zyRS+sKb7MECgenInLIkhbbJg6P6
	wXR2Uvbc8i1o0QaZ7yQo0u3HVKK+GqzzaCvWPq26ah+LCJlTHf3M28H6HsiZDw60Z5aC18zckKv
	v97S8Ufu5I1DJ+GoBo2vVxmLqTN2oYFA5n/Ik9aNEFDT2WcwEVq4cpYg1LXBA3NvEPCP0Xu6tGS
	U6UnGmFZSarDMvUi5GI03Q8V98f2lpLOvvvRYmD1KBfAREcN3omFid20KaCeXoiT/KSxciDwDTQ
	oElDfAzRK2K/FC1eeojUEVNHk/cRI/yOTe+Im8uj2+0B7M1k8tBosmbVyG37s1L5pFj518IwEB8
	ZSbmadNLSUGJ+H+JOV5uWuoJmv9qmiPcKQgYuO03g1Y3UdwFWkIWCnTr+Wfvlwn4DBuEU7XndLs
	6z7nehRkPfyN0=
X-Received: by 2002:a05:6820:5703:20b0:71a:ef4a:8684 with SMTP id
 006d021491bc7-71b395213a7mr14074658eaf.59.1795771719556; Fri, 27 Nov 2026
 01:28:39 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 27 Nov 2026 04:28:38 -0500
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: getfeus@gmail.com
Date: Fri, 27 Nov 2026 04:28:38 -0500
X-Gm-Features: Aa3M54pU1a7yp7wVeaxARQpBCGw-lDvj9PbMOs8vidCd9nBQqqFWYBMApYiimPo
Message-ID: <CA+m4KrB1p2u_y92phm-xpn3up=kebi1OmiVc3X4CCdFzHT9-5Q@mail.gmail.com>
Subject: [PATCH] arm64: dts: qcom: gaokun3: Disable the cluster idle state
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The Huawei MateBook E Go fails to resume from suspend-to-idle when the
SC8280XP cluster idle state (PSCI parameter 0x4100c344) is available.
In a same-kernel and same-initramfs comparison with the RTC alarm
disabled, the power-button wake led to the boot menu with the state
available. With only the cluster idle state reference removed, the
system resumed in the same boot.

Remove the cluster's domain-idle-states property from the gaokun3
board description. Keep the CPU power-domain topology and per-CPU
idle states. This also removes the shared cluster state from runtime
idle on this board.

Verified on a GK-W7X with firmware 2.18. Using the same local kernel
and a DTB differing only by this property, the system resumed in the
same boot after 5 minutes and 19 minutes on AC power.

Signed-off-by: Lee Youngjoon <getfeus@gmail.com>
---
--- a/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
@@ -365,6 +365,14 @@
 	};
 };

+/*
+ * The cluster idle state prevents s2idle resume on this board.
+ * Keep the per-CPU idle states available.
+ */
+&cluster_pd {
+	/delete-property/ domain-idle-states;
+};
+
 &apps_rsc {
 	regulators-0 {
 		compatible = "qcom,pm8350-rpmh-regulators";
