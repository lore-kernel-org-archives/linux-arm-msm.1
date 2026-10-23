Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792740592;
	b=5JrsNIP48FXxvJpD+rpk/ByDaheqD6wfzKWYTIEmJ5V/fncQfcXZKqvkyy3pLgPjGdZW
	 Wt0VhWlifb002y5QFt86wvZahji8SlNK0c3knuehM7TXq1D/fiRyJ+1O7lWdtRUNyd74r
	 ouRXbn4kj6XwDNNWmSwLpL0nAQRmNyJR4wKIjyISXIJxDsc1Il/hy6Nn1miTFLBCU4bd7
	 zk0qMqysAYN6WHRiD19/Gn6bDeME4mXw5Rb1rdYfZhEmtxdtUAL6trySWOOzUa9kv9+5H
	 irrlJ/SC5kYnIa8zfwk5yOTqWZ1ukcG/MRktH3Wpsc0VKmWgDze7COmwo5eAqSEb0UA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792740592;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=cgibLyVqQMBa2cmfJ2c6ThKSZBzwvxbUEp3TwyA7rEI=;
	b=yRkRYVCZtQ53ft+1F+hnXBihy2HHQZFyjLlGFBSqEoUv0u0pAP2APoCdNCAaJb5zixD3
	 4AcmwS0XcSpzNZRIqrUHcOZJYsn2gg5eU2B8Oytvm+GXzBYytQoQhqMWuqKhJqIp+6HRN
	 GSMNc1EwWazuDDadKkN3TCdQFSfxKcB8BCuysdStNHNYYn5LA7GYLQxGApD0k7wjsxc+G
	 I7C8XfpJj3VvfNQGyDTkwgcLf8VNaMZZot38zQedlFZiWQ4flgaaPee5hdePxGAvN5xU6
	 d4ZzNmBhcfJxdQtRwLJUkj7S/48Mci/tMRwCbGtF9JBPGN5sqZUgMG1cwrq1CTYfxqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WaG1oIVe;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4F2606A31B
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 07:29:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD4F2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WaG1oIVe
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e812e2b31bso3033675ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 00:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792740591; x=1793345391; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cgibLyVqQMBa2cmfJ2c6ThKSZBzwvxbUEp3TwyA7rEI=;
        b=WaG1oIVeloaj2WDlvkNWpkCyIGKDF59I/GqRPFBXuT1rzcRMPLEoeRFyJe60diZT+5
         mTBM9CQGD665ZpG1IfhPNZ15/m0NtcAGcQnCBMOuIHPF8zeik4G2zq0/WsQiVjTAgYax
         jFyyIYmPViDkAn5Eh038XfuVUsNlX3Vhw47EA1auP0y4W0+yz2fMhoanCow4l63YztFp
         rP2Dhpk+5c0AifMDuSeWKJ+cRPsMT48MW7eOYhsUFP0U00AQVJkM4c8dIA99995k3IvE
         Tlpzr4RI1vEwy7dEzARdbkR0Y28rVos+M5OkBjzUtB56lNVvCxMczyoX4GNj9/qDS//0
         5BDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792740591; x=1793345391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cgibLyVqQMBa2cmfJ2c6ThKSZBzwvxbUEp3TwyA7rEI=;
        b=iD/H8t5c+yjT0irr+A3XqQGsauGC/arlKzd9xwUSMdH13X29W2EYsYCn3hcEZEFcKB
         mF+cDV4Ynl1UVBqOUGv38tj4Ixpd6rqn2gnHrbDodfr+q03u8VhtQfFFG6E8Wy9HzjYw
         cn4pl4THV585Jf/9Jb7dzA2MbNvc6wC1wTmhrIdhLuuM9+Tt/8tWJaqAY1kvI95ezVVA
         2DD4WMlwlzjMRbwoxQYx/OGrXZ+xD8hUZU/S2O3GPRhhNJrLOTcvawa3gu+iyxCpT859
         w8E7MsxLFMXklqgK0YbqiqYdSHMkUu4kQqJFSxJ05PxjCGobKSXXXxtTPTd6U8qZWROT
         M89Q==
X-Gm-Message-State: AFq9FYJkPrNHLzqGczXAUFGCdkZujx/B7f/6IRUfJyZz9cwFXgCj6pzX
	++gEHSL8ggnPvFnyRitnz0jpvt5AUQB9VQPS5CHL/JJNyRuXjMA53zVC
X-Gm-Gg: AYBFou3q89BEFtXQSNNrYOnD+OBrteFFufV/8qe8a2f4dfSzM1MlIpBIsTOLGI6ApZv
	1Hw3aSqoq2CJ81fijh9q7l90eT7nOkz66rYBseuowntDoesLAW8ujIWVs43ioysOFsoJWEs0JtQ
	YdK8W2oAOSRFpUXhsxd+4joIn49RHR8cUmOHvnihnYZBHLwoqGVpbZW5qOIHXxt3u8gRBoZjBtD
	hOSlmPypSCDS4TLgFYA4r393I5k0v2gtmNVEwwXpN6GSDY/gllMiU2Pfl4f2g18LQqK9nHsGYZV
	jEWtfqd1F8/qw4asguCBqxDc7thBOVL/oxdXMJ6KGl/6IZBshL0IOsURFH7K9ZU8cEuFgEmnebx
	oL3bG4YMtdenQ5A6nmOaYM8nu831X5k2et0KvJ8PBE+AsDLuL8hVSHn06IgfqzoGpkLJTqCyHGZ
	HfKiarGBHVpe2IHgPQi7HHm5CgwWlD1y1pTyWrOroyH0LXs611iQp3gDm15s6ARmbV7rCabIZVG
	ayX7kasEIxwe3pCvpQa0WfFNgVyTxFlFg2SOfMAgka+1xxMOrXq4UA3vPAnM64eC16n4rbNQw==
X-Received: by 2002:a17:902:ffcf:b0:2ea:7180:3ab9 with SMTP id d9443c01a7336-2ea7c18a456mr14410265ad.43.1792740591010;
        Fri, 23 Oct 2026 00:29:51 -0700 (PDT)
Received: from localhost.localdomain ([218.194.41.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea7af6a466sm6858715ad.9.2026.10.23.00.29.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:29:50 -0700 (PDT)
From: ShiTou Hong <redstone.dcity@gmail.com>
X-Google-Original-From: ShiTou Hong <dc_redstone@outlook.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	ShiTou Hong <dc_redstone@outlook.com>
Subject: [PATCH 6/6] arm64: dts: qcom: sm8250-hdk: Add PM8150b LEDs
Date: Fri, 23 Oct 2026 15:28:32 +0800
Message-ID: <20261023072832.2642647-6-dc_redstone@outlook.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261023072832.2642647-1-dc_redstone@outlook.com>
References: <20261023072832.2642647-1-dc_redstone@outlook.com>
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

There are 2 LEDs controlled by PM8150b on sm8250-hdk
which are not added in the dts file.
The LED1 is for heartbeat indicator,
the LED2 is for wifi activity.

Enable the LED controller of PM8150b,
add the LED nodes with proper triggers into it.

Signed-off-by: ShiTou Hong <dc_redstone@outlook.com>
---
 arch/arm64/boot/dts/qcom/sm8250-hdk.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
index 57c282bdb..e321fe9c1 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include <dt-bindings/usb/pd.h>
+#include <dt-bindings/leds/common.h>
 #include "sm8250.dtsi"
 #include "pm8150.dtsi"
 #include "pm8150b.dtsi"
@@ -157,6 +158,24 @@ vreg_pmu_pcie_1p8: ldo9 {
 	};
 };
 
+&pm8150b_lpg {
+	status = "okay";
+
+	led@1 {
+		reg = <1>;
+		function = LED_FUNCTION_HEARTBEAT;
+		linux,default-trigger = "heartbeat";
+		color = <LED_COLOR_ID_GREEN>;
+	};
+
+	led@2 {
+		reg = <2>;
+		function = LED_FUNCTION_WLAN;
+		linux,default-trigger = "phy0tx";
+		color = <LED_COLOR_ID_RED>;
+	};
+};
+
 &apps_rsc {
 	regulators-0 {
 		compatible = "qcom,pm8150-rpmh-regulators";
-- 
2.47.3

