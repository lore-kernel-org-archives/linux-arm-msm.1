Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792668975;
	b=yje9J203VkcjykG9DPyLm5p1vw/3RASHqGowyc3CWtvCY9LHrs3n5R4uT/eKvtqthEKV
	 VDWCGPStXZeEgCytjvTWEZ5gV0KkTIYQXLimqk1ihpe9rHmYoAz118zmcnGofbdk13uQ8
	 zwjru8EmnG7QvV5qrb1DUUlku/2+hB8s8qeUNwPGsBv/QUmmCFvkTRG+HjKmfa9aaauhD
	 Qj/xkHKVRM7bSnyRn/PdPbsR+wMwzsG6FXR1PsyUcObO3AQQCDbVvCfhqAqjgrDbj6JXC
	 MExHRvvA+0pfLux6U+9GTUAACAAG2plk5UCSrF04qlx44a7kwbIB6wV2TumY8Ib7OnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792668975;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vrUa6hIUvxLqwy7q5daZHiibTuImBxQY/Z1eTJ1hYug=;
	b=SCXhk4uPf+9zV3jbuRwqFD+K8HnMh6R73CCqrgEE6+S2Ve+9GED5KvM6J/Y4Tf4PAUp6
	 xkr++fc4y2L6w9YCOfUHxY+qQPb/FmNcWpy20swSrJe8h+5wIQIR7jofqCwUsB0bstL1i
	 dMBuvqwcPfBK4TxRYGZxZvQRKNIl4mbAmCwx1H7ExeF8V4MNZoJyoKO4KhKOUM1RnRZTm
	 eoA7KfJtKcmmzF5wSl8G+ZTYw4X+Q3ANEwFaFFBmhdzDB88KJgk1Dcq/dBbdh8iSZCHTU
	 jTtW1mU0mTxyxMY7fnEpX/TmfLekqAvqZlbzrQf5YLjoG7jwWvXfJHaDUwBp7Rcl0Rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Yo7RHuct;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D605A606A322
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 11:36:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D605A606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Yo7RHuct
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cd5c9e52398so642609a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 04:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792668974; x=1793273774; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vrUa6hIUvxLqwy7q5daZHiibTuImBxQY/Z1eTJ1hYug=;
        b=Yo7RHuct4vIfYgih1J9BBon8ob7EbD5/5U7puckYrXHLohpc9YInp0dZV5rC+fh7I/
         rciQan2JjadaudWOhYjZ3zCoS4j9BLNRHlZJvIC4CZ2clN/aBJRzlDHSiMHlOxcq2ypL
         N0Y0yn30H2XrHKZ/A0U2PQm1i21IRGWX8skVGv2HqOJKNtSiUv2Pq5OxwhEVtGZluMv4
         KOygpiUnj3+ZpOlVs9myp3qJWiYWUCSXA/vbFBcaOs+rhSe394jokWit9tO9yqzVR5cR
         jkuwp410PkmpvBqt6ghUdSGVOHvty/8+xphokJsaIt6a/CIQE2eZoFzci/u3JXr9DGgY
         pD5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792668974; x=1793273774;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vrUa6hIUvxLqwy7q5daZHiibTuImBxQY/Z1eTJ1hYug=;
        b=uSSDPidXiz5G+FTnu9KkF7j5ZRG/mU8AnXNmosEdR2ifso81lstaB3WLT2mt6XK/wj
         jCG+ILAgtlcJJIfMonpuMdnjjqEYES0RtVLEaYOdkN7sKBjI/3NcJH8/8edf9hGYE7Sl
         sps3wh5T618PGyi/2GwHYPBUrXDkmaaiqDqdwEBH/a4I2dnuFk9t6du5yHMNvREgmxX7
         9ZU4t4fEvrxIrTZzUbrSZQqmq1f3COA9VrnmcKe8kc0X9x+kAZEBRHtVEPISBK8OBnlj
         zDF1WOXf1EdxE99vGIW9kKcdqscuEZEfyI4v4VDVCkhbM4aEGkeDlw0Tl/JpOQbbwEJx
         7FDQ==
X-Gm-Message-State: AFq9FYL8Ku9IY8/lxgaKzBfaW8HmnwC3vBRxP0TBaxogf+eOOtP4UZxk
	xLSvaQ4rn4p9NV1YyLqrrrPZLNW0WP1iql6cKt5sxQf436GEPvM/9tLn
X-Gm-Gg: AYBFou05f06Dp8Dno5E/0XxiaQWTBj/KUgRhYcHA9ucxPVhI3Idz/3CJj5sJCRnyqDV
	YJr+lBtXVjF1ia4VeKJ6q38yaUhaMkiayAalGW0XJyYB0ATSZthtTZNUx8NQ+5eoLnRsp5IzY0s
	AGJzu6DJmOgHNy3wb9Ldl4uygLFavfdEaTxtyeMbvXrtGT1zkSeghIWEUgpsoZDtQ7G+Z1YqA6b
	Pf8HmqnOSKfi4vnTYm2WIog/MDgfr1ndMJ1WEiz41YKARbH2oePBWd2FSvAyhKTIg5zo5aA3EuR
	Y+HVKxi3AGXVylBLYUV1pYkf02KVtThsJyzoaGTlQq0Xn4DSuwQEnwSqphZH/RHXAtgir0JxpG9
	FXgEI/x7t2bl4LhZFszE+9W5Q0MKe92s5jCv59XvDk9Umj7IX/SlReMFtkY/bBSRW3K+H051Kzs
	1lqXiLe1ZOeJbK7hnRRNMvTdHvkv4izoQ75Xye1ALa0fzwlCw6E9lXeWsCB1SaFuvfns0b0xf+X
	w4pEnEE6ry9YBIfoTujjotQREbIZeozpRLmsaXwLMl4CLnMvURt+UlsUKQFjuZWb2j7t2UIVg==
X-Received: by 2002:a17:90b:390c:b0:3ab:1b19:78ed with SMTP id 98e67ed59e1d1-3ad86c792aemr4034503a91.21.1792668969475;
        Thu, 22 Oct 2026 04:36:09 -0700 (PDT)
Received: from localhost.localdomain ([218.194.41.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada490e5edsm3997668a91.8.2026.10.22.04.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 04:36:09 -0700 (PDT)
From: ShiTou Hong <redstone.dcity@gmail.com>
X-Google-Original-From: ShiTou Hong <dc_redstone@outlook.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	redstonee <1516235445@qq.com>,
	ShiTou Hong <dc_redstone@outlook.com>
Subject: [PATCH 1/6] arm64: dts: qcom: sm8250-hdk: Enable the sdhc_2 port
Date: Thu, 22 Oct 2026 19:35:56 +0800
Message-ID: <20261022113601.2320940-1-dc_redstone@outlook.com>
X-Mailer: git-send-email 2.47.3
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

From: redstonee <1516235445@qq.com>

Signed-off-by: ShiTou Hong <dc_redstone@outlook.com>
---
 arch/arm64/boot/dts/qcom/sm8250-hdk.dts | 19 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8250.dtsi    | 20 ++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
index c1c673086..5975878ea 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
@@ -398,6 +398,12 @@ &qupv3_id_1 {
 
 &tlmm {
 	gpio-reserved-ranges = <28 4>, <40 4>;
+
+	sd_ufs_cd_pins: sd-ufs-cd-pins {
+		pins = "gpio77";
+		function = "gpio";
+		bias-pull-up;
+	};
 };
 
 &uart12 {
@@ -467,3 +473,16 @@ &usb_2_dwc3 {
 &venus {
 	status = "okay";
 };
+
+&sdhc_2 {
+	status = "okay";
+
+	cd-gpios = <&tlmm 77 GPIO_ACTIVE_LOW>;
+
+	vmmc-supply = <&vreg_l9c_2p96>;
+	vqmmc-supply = <&vreg_l6c_2p96>;
+
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&sdc2_default_state>, <&sd_ufs_cd_pins>;
+	pinctrl-1 = <&sdc2_sleep_state>, <&sd_ufs_cd_pins>;
+};
diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 90f8b0916..c2500e5db 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -5809,6 +5809,26 @@ ws-pins {
 				};
 			};
 
+			sdc2_default_state: sdc2-default-state {
+				cmd-pins {
+					pins = "sdc2_cmd";
+					bias-pull-up;
+					drive-strength = <10>;
+				};
+
+				data-pins {
+					pins = "sdc2_data";
+					bias-pull-up;
+					drive-strength = <10>;
+				};
+
+				clk-pins {
+					pins = "sdc2_clk";
+					bias-disable;
+					drive-strength = <16>;
+				};
+			};
+
 			sdc2_sleep_state: sdc2-sleep-state {
 				clk-pins {
 					pins = "sdc2_clk";
-- 
2.47.3

