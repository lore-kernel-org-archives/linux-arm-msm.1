Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.156
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793775972;
	b=oFYjTUzS9UPD9jHSoAy4KPL0EciISK9Am/YvbRQ5bCufvitHloMSnD9LL93xf0R9OhVb
	 JnfZvLckEFGp0tuPRF2VdpLuS36nrRw/Vw/xUTylDXTUq42lIZJRm3Ylw8vcZoXvrX2st
	 aFg2GjVxQ91qt7l6vB0BgvNmZ2TlJCGkSkFOmzXunrMhQKlN8LnHEqHDstRZovgz+BoFn
	 OscYlQH1gN0cauDR0NACG8oEs/7s3QhJwgxdlLaNMAdQoHDqTrAksy4LgNfijZxVowBqN
	 NflsNJMKVHKiKlO+sgktVFzk4taBzC9D437cQDngPmiAMv4+6IKW/Vitm+jxRdCI/NQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793775972;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WokjOK4qUKpaWUewt5ne3nHyD3RlNEsjQzStQ+c1XNE=;
	b=aNpBT9O//xLbVVNJRcdsur4qV+bNlKzzhRz+XJN8lBHpGQMMmQvK99SDDkMuBicO0cKF
	 /RdS7LCnakfncLvwo0B/6l1a5r9EQHdQZJMHkLC16e4EJ5Rq+XgO2D8RVczQCB/ney2pT
	 4VWHJ71O94IhhFYI3EQvZPiz2uwJXYOpayZVPFihttlVPtxceuyO/jPT8BogbgJOV8ZoE
	 gQusimZldOmTw/0u3gXl7+r2CetDSrYuFCnoKap1mjCyWHmqPENXgG55ZiQNuoPVdRNxH
	 vm3kFKc1kbtobm03/OrH8nDXn7CRT0x+Z4t9fr0hOCg7dUeq0YmbsHb828rtX+n67pQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	dkim=pass header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=B88Yhe8a;
	arc=none smtp.remote-ip=91.218.175.156
Received: from mta0.migadu.com (out-156.mta0.migadu.com [91.218.175.156])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 985A2606A329
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 07:06:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 985A2606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=B88Yhe8a
X-Envelope-To: linux-arm-msm@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=sN6eycwIKu/qE35PSu5sRh3YS6d8qIr8WXShRM/F29s=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793775969; v=1; x=1794380769;
 b=B88Yhe8aXbPotwPXS5mSp7q9WTisv3lU8edmv+yeUfUElnMVx+W199HXIe33849cJX0b2Pw/
 wAkTPyH2vUZI62vArFzpgbv0zKyNyjsp3i/yE1Rs6yeixslCXDENmaZamV2R5Co0F481foPyI9Y
 x57EOvQqvy5fStSms+7SVykevbLmYLjfWLwdD+noYCdGWW3pjP0bEsb25wP0gOUs9B4yYUii/B3
 aYT6G+EDqC1VSa+Cld2VMUH/FfChob4dmCWnDFa/187hnKwLgv/ElGS9msqhVqQXkAWnIRsSUXD
 93RK2RKyDdiTeDbCqa4+2nj7zRs13o4rTaPDSSVQhGwGQ==
X-Envelope-To: linux-arm-msm@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e5fa99feb5128d1f;
	Wed, 04 Nov 2026 07:06:09 +0000
X-Mizu-Trace-ID: e5fa99feb5128d1f
X-Migadu-Flow: FLOW_OUT
From: Val Packett <val@packett.cool>
To: Maximilian Luz <luzmaximilian@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	Val Packett <val@packett.cool>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 5/5] platform/surface: aggregator_registry: Add support for Surface Pro X
Date: Wed,  4 Nov 2026 04:04:36 -0300
Message-ID: <20261104070441.74127-6-val@packett.cool>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104070441.74127-1-val@packett.cool>
References: <20261104070441.74127-1-val@packett.cool>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Maximilian Luz <luzmaximilian@gmail.com>

Add SAM client device nodes for the Surface Pro X.

Signed-off-by: Maximilian Luz <luzmaximilian@gmail.com>
Signed-off-by: Val Packett <val@packett.cool>
---
 .../surface/surface_aggregator_registry.c     | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/platform/surface/surface_aggregator_registry.c b/drivers/platform/surface/surface_aggregator_registry.c
index cf3ae252b1c4..bec0a87a2a95 100644
--- a/drivers/platform/surface/surface_aggregator_registry.c
+++ b/drivers/platform/surface/surface_aggregator_registry.c
@@ -51,6 +51,12 @@ static const struct software_node ssam_node_hub_base = {
 	.parent = &ssam_node_root,
 };
 
+/* Real-Time Clock. */
+static const struct software_node ssam_node_rtc = {
+	.name = "ssam:01:01:01:00:00",
+	.parent = &ssam_node_root,
+};
+
 /* AC adapter. */
 static const struct software_node ssam_node_bat_ac = {
 	.name = "ssam:01:02:01:01:01",
@@ -352,6 +358,22 @@ static const struct software_node *ssam_node_group_sp7[] = {
 	NULL,
 };
 
+/* Devices for Surface Pro X */
+static const struct software_node *ssam_node_group_spx[] = {
+	&ssam_node_root,
+	&ssam_node_hub_kip,
+	&ssam_node_rtc,
+	&ssam_node_bat_ac,
+	&ssam_node_bat_main,
+	&ssam_node_tmp_sensors,
+	&ssam_node_kip_tablet_switch,
+	&ssam_node_hid_kip_keyboard,
+	&ssam_node_hid_kip_penstash,
+	&ssam_node_hid_kip_touchpad,
+	&ssam_node_hid_kip_fwupd,
+	NULL,
+};
+
 /* Devices for Surface Pro 8 */
 static const struct software_node *ssam_node_group_sp8[] = {
 	&ssam_node_root,
@@ -508,6 +530,10 @@ static const struct acpi_device_id ssam_platform_hub_acpi_match[] = {
 MODULE_DEVICE_TABLE(acpi, ssam_platform_hub_acpi_match);
 
 static const struct of_device_id ssam_platform_hub_of_match[] __maybe_unused = {
+	/* Surface Pro X */
+	{ .compatible = "microsoft,cambria", (void *)ssam_node_group_spx },
+	{ .compatible = "microsoft,carina", (void *)ssam_node_group_spx },
+	{ .compatible = "microsoft,caspar", (void *)ssam_node_group_spx },
 	/* Surface Pro 9 5G (ARM/QCOM) */
 	{ .compatible = "microsoft,arcata", (void *)ssam_node_group_sp9_5g },
 	/* Surface Pro 11 (ARM/QCOM) */
-- 
2.56.0

