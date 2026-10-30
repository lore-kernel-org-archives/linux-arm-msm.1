Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.119
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793400115;
	b=QZVdNpwrkXoucFtWgtA6Pr7H7BnP+ShhmfOwScMhsA/QmOEb7gJlyZi9jLc8HuZgc7Pc
	 sdapzs5EqNxw9SFAzDB96/TDl2TagFtXZ8jKvqY19tlMeEuqZ/fUiwrmyZK4XWOO+clsZ
	 6YHwj/SSmeC8FltuEXC98ol63jp9UnK1Lj4XloVI+cL/7bnP9WhZ0LxwAPkxdOD36P6VY
	 miHYEgutD1HSwoPxbyCM13Y2OHdXIhDI7FohLocyiJGM+8QPV/IBGmwOJBeeH7jEVCDGG
	 bjeQLxlwpt+uR8X87OPx7+T/5NqK1PcTLDpgigwGWm/rPLe+QffJ7hBOkGklwC47iAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793400115;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=lIxwwQjjEAEim5xKo/chXE4CjUvcvqxfHRPRKCJR5DA=;
	b=i8Jf1kd9iXCmS27ECUs2Xlu4XFbrDpWakap1U4+2ZrKbnsofoO9HiYfxQ+Y51xbZ+pTO
	 Da1WXo6j0flW5hmggLdnzXk1pRjr1d3d8jgxrMabQtqQkxWpfW4TuKU4OLBms2qbBro0x
	 S3WVZ/W9aNWRn2bUPYvaCCkoW0AgQ2bKDp50ZA+9tQ/R93QRYdQfz1ZZwEkPOamEyYSDu
	 YS+SVDvzR2ITPZ4elK/55QiTIzdLjI9tpH7g33QHsSy47yB4l7Gx0NS5i0ein3a556YHO
	 vh86laJnmpDoVH7tP6odaaCaRkcshyJs2o+cV+2gUszBuM6dh9/81XAtsF5JMbuYuIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=nqDpNyD6;
	arc=none smtp.remote-ip=79.135.106.119
Received: from mail-106119.protonmail.ch (mail-106119.protonmail.ch [79.135.106.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9FE606A322
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 22:41:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D9FE606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=nqDpNyD6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1793400112; x=1793659312;
	bh=lIxwwQjjEAEim5xKo/chXE4CjUvcvqxfHRPRKCJR5DA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=nqDpNyD6/MtdACVfGP3n6KgxGKF1zKoFWmI+2yaEy5dA63hRw4JhEGJLTdNZBvjiZ
	 t+Ao8hep3VcNeS1pQVimD9THTDjn6zR6jGhPbuJG/r72Ox1y7hmlJk7iBmTFGycqR1
	 eUSx2uc1u3g23qKfwr3GzRPv0nSOZrnPb5d6dd+lpOTLdF2czs1qWpZDgqvbZUfNhe
	 St8au6guyCf5U2zZ6oqsYW+PWj52nPUuq5iqm/R2kzIxknNUtfOPixOqe4rmWUhQ7w
	 IX2T5lj2Illf1DU6wTgwXQcisKwhDwwAIe2fpmN+AjIApoJYMt8S9oMZNKKOfWOqnO
	 UW9VWzzRfYmTg==
Date: Fri, 30 Oct 2026 22:41:46 +0000
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH v2 5/6] arm64: dts: qcom: milos-nothing-asteroids: Enable IPA
Message-ID: <20261030-asteroids-dts-updates-v2-5-66a56c537749@pm.me>
In-Reply-To: <20261030-asteroids-dts-updates-v2-0-66a56c537749@pm.me>
References: <20261030-asteroids-dts-updates-v2-0-66a56c537749@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 4bebb2ae7c364c1e425bbeaa9e77f7b7b3b49592
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

Configure and enable the node for IPA which enables mobile data on this
device.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dts b/arch/ar=
m64/boot/dts/qcom/milos-nothing-asteroids.dts
index 79092213c253..9ebf4564453b 100644
--- a/arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dts
+++ b/arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dts
@@ -880,6 +880,12 @@ fsa4480_sbu_mux: endpoint {
 =09};
 };
=20
+&ipa {
+=09firmware-name =3D "qcom/milos/nothing/asteroids/ipa_fws.mbn";
+
+=09status =3D "okay";
+};
+
 &pm7550_flash {
 =09status =3D "okay";
=20

--=20
2.55.0


