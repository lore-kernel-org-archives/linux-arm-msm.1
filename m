Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793313227;
	b=Eo1mLWTba0L4rfbqbZtjmgw1tkNbrPhMuQMSyjBDPdo00XaXC9iFwP5owcZhG3uBdDgu
	 bN7qMer7Qkdd8RPr+npHvT5Czs+w0B4ArvYumYxWJKD+os3RbsYyb6n/cP+wPTIy8DkY2
	 Dnm8qLTQ3yucolP4Ht39g2jhtnFEU4DGsscRmSbEh/JgRUruiXFo/s5QbHFoUsXhAiABj
	 6wPG72s8yz60aNAc5lawF/dgrExyrHNCAc5ddurra9e0UC2EahJjMLRgsJ+mIg/f1cEvT
	 HkLpF4oLjG1v9RCrmnKoQY2NX7wXA1kXY+eFNghzlZrGGMoMjJ++SC5wi7yTFVNLBcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793313227;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=/DDRfMOuTRtg2YLg5xA4AAUbkoVMF1o1B6Hot0iCio8=;
	b=G1oIiao+7bqLL0yaeQg/cb48jr5zb6bPJ2D+/jpd5/DRdGkV3zDEYeZPY4mkohvQf8PB
	 o7t6SR/wKaF9ymqx5db+Fca7hw8GbioMzT+b2mK+S7SWpWs8P633qXxak9f8wmpZicm8h
	 SmPaeFYs7kEKNzoSpGRbjE9ZKIhNR44U3QxmjJchm4jL6kZugtjvtxh8uER95w0Lnh5UK
	 NYawMindsmSdam7AW1rAjdieTXUSbz4nBBipIYeAFMrPnUKiwSRLkAuxGNnTZAM3tfOcf
	 qxpx4MFq80KCOeJJEHl2n7N0Ar+rttXHPbvIJdhJdIh2Y5ZcPWIAUV2mYIvE7GFxSUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=X5sbn4ej;
	arc=none smtp.remote-ip=185.70.43.101
Received: from mail-43101.protonmail.ch (mail-43101.protonmail.ch [185.70.43.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEBC5606A31D
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 22:33:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEBC5606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=X5sbn4ej
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1793313223; x=1793572423;
	bh=/DDRfMOuTRtg2YLg5xA4AAUbkoVMF1o1B6Hot0iCio8=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=X5sbn4ejMUk4B+gqBfQqaJnCLJ59zkwA49LPVrhAkD77l9ov9Bq+MSaUhHCZAuzdU
	 jbPyt9p6XNJq3K6GD5UdwrpX+19gOSD+kTUWYMEoGbQXZGOLXt6Fd6VROHlFRPi7qo
	 Gxo0qyEQJpCXnJwhvYTO0aMZgLyj2nheKC0cuMjcHVkg5lDSM1FntJefpcE2yx9zbG
	 h+yAmp4TDVZu827ys98cIi9BLdtgDazPnKNd8GLDYfdc+QKumz+0uWIianS7WVLJZH
	 7W7J8zIolcuY9/r5vc+ZH8qs0YuhBF6vZhn6ZzY+02iOEL0l+yFAb4hGRPFF+6z2fh
	 lU6rr5cVBWu4w==
Date: Thu, 29 Oct 2026 22:33:40 +0000
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH 0/5] Enable some more hardware on the Nothing Phone (3a)
Message-ID: <20261029-asteroids-dts-updates-v1-0-79351337d681@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 1b879897af5045c17c9f979b0612e79e8a687d23
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

This series enables UFS, Bluetooth, Wi-Fi, IPA, and the display panel
for the Nothing Phone (3a).

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
Alexander Koskovich (5):
      arm64: dts: qcom: milos-nothing-asteroids: Enable UFS
      arm64: dts: qcom: milos-nothing-asteroids: Enable Bluetooth
      arm64: dts: qcom: milos-nothing-asteroids: Enable WiFi
      arm64: dts: qcom: milos-nothing-asteroids: Enable IPA
      arm64: dts: qcom: milos-nothing-asteroids: Enable panel

 .../boot/dts/qcom/milos-nothing-asteroids.dts      | 314 +++++++++++++++++=
++++
 1 file changed, 314 insertions(+)
---
base-commit: a39c950806213f6861d00f90729acaaa21f2d95a
change-id: 20261029-asteroids-dts-updates-ce3d00b4f844

Best regards,
-- =20
Alexander Koskovich <akoskovich@pm.me>


