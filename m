Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.103
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793400109;
	b=tf+5OUPOwLxYhu/F861aV6ECqlJOjJRyN8n9VoDjgMUc6S7EVSm2pC6mLP9opq3vyBcT
	 gDXmCp6zbKsOLdmeKBcxGgxRU2xR2QcyWVmjZnt5HhNoJrm3GoqzJW5kP7YmpYgLikTy8
	 E9aZdXrD/2UEDf4VG/mcFAT6Ai/D/4q8xoAW9YoH8pXWkRlxcJhax1P9amrB+kBBUUOiT
	 eWyQ1r3T7zka1Ku+rAuIiSy6PFHsOBj++uVRIGPe8g0GicnO9MpiHj+z9zxNeMajkVCj1
	 kinbE5PqzqsyfJTLw95APuRUqeNamq71/MzXSyn/JCimGzIwPatsA0uHm8O/exsKwwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793400109;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=JpR/85rT4iXiGLeK70Ktb9RoMSPDhVzaKxPIt3ZCZ0A=;
	b=HoPqw3B49LS6iM9A6aV1TjZK0vlXjTYWqTTCzXbK/w4f+wUTxKkASyFtYMyJLPEHa7pk
	 uHSHAaUumF8sWY1jNXuRdxF8NnSD9m0MvRf4DgbddFZbiQ9k7Wl4ETrQezoxSOobvDlX7
	 3aZm/ikvyp/PJt7o/ndhV1nMdOF3KSrYF+npb7MCNCCj0ZROa0T6GsV6yfrgChQ7Bft1d
	 dLJjL800HsIGycZkAUReUN7ofgCAEt3aMk9zstThO7XPA6bzXah76aJFtVKE5ljjU2bPn
	 A8ZQdGe7Iw1LlaFFR4Dn72UHq/jx2ZHIa6BBmDsh1KjIbyw1Brml0WaRTH1jXHQoK1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=FsQFJPPs;
	arc=none smtp.remote-ip=185.70.43.103
Received: from mail-43103.protonmail.ch (mail-43103.protonmail.ch [185.70.43.103])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E09D0606A326
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 22:41:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E09D0606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=FsQFJPPs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1793400106; x=1793659306;
	bh=JpR/85rT4iXiGLeK70Ktb9RoMSPDhVzaKxPIt3ZCZ0A=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=FsQFJPPsW/KX6NkrgxiiDX+daN7mKNBI9PGoltjOEaOaUKksRmiXmIH0QdEONlCf5
	 2+fOyjTPQuUfSKTfZm0Js+Zi5XtUQKmCAXhbhxdNhUmz/+24eCoYGjTGkDxuQK1Vyc
	 bCju2fb8SXeRNQ+fVmieGTishPgcbt+DGmiMxs4CUkdp4nEAQ8wS9amhntjKwNcwBq
	 9hjxYQozxdjNPwuFbCBKZzNYzTFzQ0cOzZ11dsfE/d1/ePeCqhw0y/baSXr7wZBx8J
	 /xlj5DaSu4kLt2XBBtXY/go1dMPtpiJcXWJmsEowIFvsiL83TOyF81G95Nc4ltklXM
	 mo8OfE3JMavkw==
Date: Fri, 30 Oct 2026 22:41:42 +0000
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 4/6] arm64: dts: qcom: milos-nothing-asteroids: Enable WiFi
Message-ID: <20261030-asteroids-dts-updates-v2-4-66a56c537749@pm.me>
In-Reply-To: <20261030-asteroids-dts-updates-v2-0-66a56c537749@pm.me>
References: <20261030-asteroids-dts-updates-v2-0-66a56c537749@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 92f60f461b90e5c98efcae50ed030c37f02f44d4
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

Configure and enable the WiFi node, and add the required pinctrl to
provide the sleep clock from the PMK8550 (PMK7635) to WCN6755.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dts | 19 ++++++++++++++++=
++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dts b/arch/ar=
m64/boot/dts/qcom/milos-nothing-asteroids.dts
index b2838d2d3d98..79092213c253 100644
--- a/arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dts
+++ b/arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dts
@@ -141,7 +141,7 @@ wcn6750-pmu {
=20
 =09=09clocks =3D <&rpmhcc RPMH_RF_CLK1>;
=20
-=09=09pinctrl-0 =3D <&bluetooth_enable_default>;
+=09=09pinctrl-0 =3D <&bluetooth_enable_default>, <&pmk8550_sleep_clk_defau=
lt>;
 =09=09pinctrl-names =3D "default";
=20
 =09=09regulators {
@@ -916,6 +916,17 @@ &pmiv0104_eusb2_repeater {
 =09qcom,tune-usb2-preem =3D /bits/ 8 <0x6>;
 };
=20
+&pmk8550_gpios {
+=09pmk8550_sleep_clk_default: sleep-clk-default-state {
+=09=09pins =3D "gpio5";
+=09=09function =3D PMIC_GPIO_FUNC_FUNC1;
+=09=09input-disable;
+=09=09output-enable;
+=09=09bias-disable;
+=09=09power-source =3D <0>;
+=09};
+};
+
 &pmr735b_gpios {
 =09s1j_enable_default: s1j-enable-default-state {
 =09=09pins =3D "gpio1";
@@ -1140,3 +1151,9 @@ &usb_1_hsphy {
=20
 =09status =3D "okay";
 };
+
+&wifi {
+=09qcom,calibration-variant =3D "Nothing_Phone_3a";
+
+=09status =3D "okay";
+};

--=20
2.55.0


