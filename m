Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1BC3BD228
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 10:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786359242; cv=none; b=a9S6OxF5dLj+6A1ppfQhgru0hAJBdd4w56jycJwYzL20a9hDZdXh6DaO4Lacn1Wl5MmgUKhAUlyOd2IKYFpFkPyCOLcFFjXApoLv2qgr0TH6gDaYDljoTqGHqsOzuxFWgADn1hXun7px/cTKF9YHazjpQrZ5vGS6tmkyznj+psU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786359242; c=relaxed/simple;
	bh=UY04sXqtgfZuiIRe9CNmz8m46h+7PvdCRxQvkLu8ep4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OaNwQzt6G5KzWBkAMzzRrXmeBJ56EWgMiAQT4yqalfloGik8tXaKmDcA+BcZ4JL1jS9ECIUFaw4QJ+wGo5H5NVVazMvtZGpNF5jRociTzfCIlvT9n7RQ/Z8ZFnW/LTWT61tSQd3ZElwVntwlXOJ9LHHGkLE9utuJMiF/Eifz/X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a7uqM297; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a7uqM297"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cf50c6f235so18037625ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 03:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786359241; x=1786964041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=geEdsZdmCC6yete2inWMzdlKXghMwGUV4jpZ5rwFRqI=;
        b=a7uqM297WYUMzAxpzyB62NLjxNGL2bWrio3KWDLg5TadD1YA4YtrAyLYPS2jZ87rG9
         vgQFVMcXuQwJb2ofKqKbHA1IUFnY58T81XGy24NxlKMv8MjgyKpkyGtQWFfsncQHtbUJ
         xoQXZMBhnfYuMnjxot/zabT+IZYNMNbkhIK7stArXPhBPM3V8b2Rx6I7GrHI1ueFYRxg
         4iUEOGUqAq1CZyZm5c/Z9RR+FVGwDk7+wq1a03TgKWa8A5J11mCZCf5maddzzJntiwpb
         ME8bFLR1wc7MQILMuumlIRK3j5ZZXATfeCjRVftQ32xniTwyT+h6UInM+LiUPCwW+TKk
         D3vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786359241; x=1786964041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=geEdsZdmCC6yete2inWMzdlKXghMwGUV4jpZ5rwFRqI=;
        b=JQsjxJIL8ZQqogGCDxr0O7w9fzgXTt3QY4RV5ginLn3j8FfjzI/dq3e/L9BGi9C/Gd
         3weNsGfXTBvDNVnAYbsN7HaIUwsOvD6NYq66dxKhUEOouXUme9cxK1baQ3WfyBzqmh6M
         RgdJafCKYqjwAAIi6hXY+ysdGKhj2sVgKbfBs6PZX8NARN5OOtI1cW9SN+V58cDv70Yx
         1FDll68uKSrshF7TXXJ/gQpptC2AFPsLwDPOc9TK//UsGM9SlwWQSdswOFxaC7vGzxe4
         jpxMn7Yti3iYXerWsbHlTLhyS+jkVYY+b4IDlENeRGaAB5x4rXQY+6mEByLgZQo1VzVs
         WD4w==
X-Gm-Message-State: AOJu0YwwXDDK3010PGQf14JT3GhQoyPLMHXgUN+qZQBxnvuOxPyFdzSO
	uluQiotV+M5wBGcmfhlQpctwdcPIuL8AsDv8JOqJOoRxzScJeOPe5NJd
X-Gm-Gg: AR+sD10kbjuPu0ZBXDXBlKE7T7rZ4fsfq3tK/1dsWXG68jYTZz2YtyHCJlhXug7yGhb
	3VM0ajCDhCJcs3hRqUMIveRVkhf/So5GGeXZopajGSWjB04meKEDbxOoAEp794zjOgGRF4rdmb3
	5rS9+zwTJmW9LiBc6XFmFXi7yKTLBjUuMxhNaA2QS0J6PgstOsIZzBTX1+6i0Owrgek/5rhakq0
	v9EeZrXAqtE6pBv2y/MSWtS/s6bC+h8PEDQqeklt+qqr0DY4ZqtbMbvUpCOXXOUgUUHLou8NMgl
	GZRzf9kW4uNrod9q+YZOfo8ZyWZ1eptVx4yP2ORRx/xQz92FBLZ9q7FPX/iwx8Re7wsQPmMoUrH
	NhjgtiqZyG7dNUi7aYf9vSsfwud/vFNC19WJeVjuM72UkY7Ji8c685x43BDPqV3x32ScRmcsINb
	80YVEi4p0uPR8NWmJZJ4++S6EVhIBRqApMznLAc2O5hbgCvo4nLKQ=
X-Received: by 2002:a17:903:1a67:b0:2ce:8e70:3210 with SMTP id d9443c01a7336-2d0ca82e229mr421183815ad.16.1786359241002;
        Mon, 10 Aug 2026 03:54:01 -0700 (PDT)
Received: from thefoxflat ([2404:c0:7028:5cc2:57f2:a6e1:6be7:bb30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d15ebfcb2fsm32890075ad.55.2026.08.10.03.53.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 03:54:00 -0700 (PDT)
From: Reza Kurniawan <imkyufie@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Reza Kurniawan <imkyufie@gmail.com>
Subject: [PATCH v2 3/3] arm64: dts: qcom: Add notification LED support for Xiaomi Redmi 5A (riva)
Date: Mon, 10 Aug 2026 17:53:37 +0700
Message-ID: <20260810105337.855546-4-imkyufie@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260810105337.855546-1-imkyufie@gmail.com>
References: <20260810105337.855546-1-imkyufie@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
---
 .../boot/dts/qcom/msm8917-xiaomi-riva.dts     | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts
index e6e708601..e74433f89 100644
--- a/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts
+++ b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts
@@ -5,6 +5,7 @@
 
 /dts-v1/;
 
+#include <dt-bindings/leds/common.h>
 #include "msm8917-xiaomi-wingtech.dtsi"
 
 / {
@@ -34,6 +35,28 @@ vibrator {
 	};
 };
 
+&blsp1_i2c2 {
+	status = "okay";
+
+	led-controller@45 {
+		compatible = "awinic,aw2013";
+		reg = <0x45>;
+		vcc-supply = <&pm8937_l10>;
+		vio-supply = <&pm8937_l5>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		status = "okay";
+
+		led@0 {
+			reg = <0>;
+			led-max-microamp = <5000>;
+			function = LED_FUNCTION_INDICATOR;
+			color = <LED_COLOR_ID_WHITE>;
+		};
+	};
+};
+
 &blsp1_uart2 {
 	status = "okay";
 };
-- 
2.55.0

