Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792668986;
	b=HfaYh1sNOpGh1LPc5GgYonLxETwfE2H3PRfhN0KNWflIE+42iaxxM0/sEIk7AuvUOU3/
	 eXm3UV4yVsE2VefNtJ2+vYySMeSZijHSv2tfNN9Bq1RQ/WClDUhkNrkqkIKy9M7AmK9Ed
	 cCfwRYJN+wNa/NTtgnKRVF5PV6qDgGN9ytmFVQWu2ySSMcimHgGaqd/4bo3M9cF4uDdgp
	 kxUqKHCGIHEJyne473vrdnX3OgGLWbiv0Cqwwk9P7QtdDthdU7I/N5K8PRKhjGI7RN0zC
	 Cqp2PbOCl/f9F2g+W+GqW2bEhyHKGHQOSvRmQFZcqKS80nsLecG2eGXQpgqhMDNfLnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792668986;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=yV/zmmEJwq4vtEwn6ex+r18U2+3GRtp17gkWW7wfd10=;
	b=USEh2UyLn6Eh5bytm7jNB4xupvQgvxAUvpT6q6f4Od6kGwifyTjzwLaDj5TB4UzNUnmN
	 zlaXLuMBmwjFbGxyVjNZDiNjuwWsAxUjiR0xPCB/29WBIyxPi0TFz2HncAqesasM67dlj
	 uQaZ/vOhrRyLN6c2s9i03bIE/z+KjupKLHeTPoWMQwA2zV4OE7h8dnI3X+41UR3TbzmLg
	 QObCu0nY9vXMhBDKpa4ppYrXbCH7lt1tTMqd2NIDBqftoEKYoJyBsU4ifZ+/PmvwdSF1s
	 BwV1R7AfsPowcRo0BSqCTdGIOZ8k7PdUHNKN3ZeOkcXuNyEq3JdXOP5nh6dqFs2WZjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MmCte4xa;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC26606A31E
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 11:36:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EC26606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MmCte4xa
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3ab2cb8d577so1531051a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 04:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792668985; x=1793273785; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yV/zmmEJwq4vtEwn6ex+r18U2+3GRtp17gkWW7wfd10=;
        b=MmCte4xa2xHtjhMNMZ1MKy38Wy/mSYhv6OUk7HlfW4NB9ylifhGdFwRoTvXJFfLHLB
         8keaUIZ9+PtLQctAaN/YcisjapTgSuzy+TiQ6EzwFetWDo3j4vvLqg2sgqEziQSbY81B
         xqqhqiQ9rQCjMx1qXFKxaqoI3hXIticovMcJ3+/fVzkkIvzOZur7SngOBAD8zQ0jlhpf
         mXBzqto/8/LkqLPEfinoZuATeltfLuSGcexDxYB7d2oGt8xULv3D41DuWTvGk3b8l6MM
         AIMZxeCIFRYakj1kH2ecTchh3ido+5KQcQQZ9JqfULK9ULO5B9frP4gBune15u4ahZL2
         IAPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792668985; x=1793273785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yV/zmmEJwq4vtEwn6ex+r18U2+3GRtp17gkWW7wfd10=;
        b=arm0QjIdNn7+TSLtWi8Bcbse7g2TqCekztGtDFKyXf/AG03aGX17o3EHIfvtg2Y6AF
         8guKCczyjkUDkHoD5XNPda3CQNA+px38No80sRUzyWOAfL3DUFjUEPuBHc4jQhz4UN0a
         X9G8lL6kYexcWOnUkwGelDr61gQfPjAzRXSkNlA/J+lsUn5JUCBbuQQeE/MPGLwhzGKr
         2kqAnAi2Gh/ND+g9PCgxXVCA5zNgALJtBToaEFdmux44JKkjWMkWQtXhFSEvjUitvli+
         Ig7zTHQ2+XIx8ePOHBHEefngJjogcOweOpYarWgs1IyzVE2xUguUsg4YbOxvB98lV8oz
         ZPAA==
X-Gm-Message-State: AFq9FYLo/7JSrXbeYAAjC6Yx9zPkFEulJbhibFej7e5SgXSVDnfqssVm
	hi2B+u7IoxSED6sgKTEwOiSQSNprOTrEYBSeTwVqFakL3yZHUXCSL/K8
X-Gm-Gg: AYBFou0h144DDkVijMdHqVDkgppkCMAp5nVZPEcM0TBWmKdeKcxx/4Y5g9WrCYdT2Ry
	V5iGWKzzBkbSlBm/M+RcKzR7592/TWzHogUvp8OlV+XU4GktRdH+KUEvzKt8S3dqDeimmdkhQUN
	L2ILmAkre/ed8wMwZPZ8cFOQJUGuMLdMPvXJEZhHNuN9GqJcFcUXcBR8raZGwrdMkTvBwOxtXcN
	giLlLUIyiECaEGx/3X60fu0BMfzsV9jWc8icWpR84q2mE/dqWGtCygqlq6qWMC5OoLriAeV7FiG
	uUqSaA/CRvVytUkujvdnouRQg7hIE3/gD7bAyD6nxptlPyl4nqDFR9L0KCN1IZeI+THxatavo0F
	loxTwe8+kaJu0oS6lNeL4m0q3z7d9/g28tSkbriRsrADvcDYugkbXRHQtfW1gyJGpW4TjOvAk/i
	9rxEeIzy8og/ATITe9fDXQuHPjWSrbh4d0zwHtQ7RTAbi+d318xz196MYbeHkyzeZh93ZiYh69N
	UsQwA78XsOQHN//Hji6JmAcPF/wPqhnnEq567KYn+PdgXDUWbmzPQFwhcbNkwtbJ6Krq/pK1w==
X-Received: by 2002:a17:90b:2805:b0:3ac:97bc:4c7b with SMTP id 98e67ed59e1d1-3ad86f44843mr4190640a91.14.1792668985330;
        Thu, 22 Oct 2026 04:36:25 -0700 (PDT)
Received: from localhost.localdomain ([218.194.41.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada490e5edsm3997668a91.8.2026.10.22.04.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 04:36:24 -0700 (PDT)
From: ShiTou Hong <redstone.dcity@gmail.com>
X-Google-Original-From: ShiTou Hong <dc_redstone@outlook.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	redstonee <1516235445@qq.com>,
	ShiTou Hong <dc_redstone@outlook.com>
Subject: [PATCH 6/6] arm64: dts: qcom: sm8250-hdk: Add the 2 LEDs of PM8150b
Date: Thu, 22 Oct 2026 19:36:01 +0800
Message-ID: <20261022113601.2320940-6-dc_redstone@outlook.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261022113601.2320940-1-dc_redstone@outlook.com>
References: <20261022113601.2320940-1-dc_redstone@outlook.com>
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

Enable the LED controller of PM8150b, add the LED nodes into it.

Signed-off-by: ShiTou Hong <dc_redstone@outlook.com>
---
 arch/arm64/boot/dts/qcom/sm8250-hdk.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
index eb899c92f..d15e75a4a 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include <dt-bindings/usb/pd.h>
+#include <dt-bindings/leds/common.h>
 #include "sm8250.dtsi"
 #include "pm8150.dtsi"
 #include "pm8150b.dtsi"
@@ -157,6 +158,25 @@ vreg_pmu_pcie_1p8: ldo9 {
 	};
 };
 
+&pm8150b_lpg {
+	status = "okay";
+
+	led@1 {
+		reg = <1>;
+		label = "led-heartbeat";
+		linux,default-trigger = "heartbeat";
+		color = <LED_COLOR_ID_GREEN>;
+	};
+
+	led@2 {
+		reg = <2>;
+		label = "led-wlan";
+		linux,default-trigger = "none";
+		default-state = "off";
+		color = <LED_COLOR_ID_RED>;
+	};
+};
+
 &apps_rsc {
 	regulators-0 {
 		compatible = "qcom,pm8150-rpmh-regulators";
-- 
2.47.3

