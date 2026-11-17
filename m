Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919202;
	b=ACEwo6d8lBdvPaYlLYjOBfrOunNKcxvhJeqF0Zf1MzX1n/LweDgmOMHTQQYkBKKY1Or9
	 AEY7M9FO8QHAuBReR90ItPpmTkLL8osxN3OyfylH/6gFrWNPaX+IuwsQ85wWo7kaSzvxj
	 tVlIWG9lNvz9fUwnCF4riVEN0DTEEgRfuJQBtpKyOGYfs0s3ESZkyMD1oXqxXRIXMNfY4
	 W5/0gX+h8CBof+Bq6hwfM0vfnJM+gx/QWm469ELV35m8r4plqXi9KP2yO8+lOFJu3XQ/2
	 pwqunzeJPuz+Lvl4ItBlwckYc2lIWV7jO3+llZxnA0OyJ5W/B1KP/TpN3OAysI/u29g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919202;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=eH7GNmtkSKP2fzAXhmpuBWSGX/FXkIALtIPPfHtDiis=;
	b=3igMmaC32QV8ZoFNS5P/OR13WoGj4/lvw6bj9AnqRR6u5Fmoo9jyo93dQvAGo1lEYXlc
	 W944LcOtOa8zSidKVzqzO84DOTM72T7G+qVtxxZfoQCGTtAhq+OR/fC37B6EMaZ3MmXs1
	 WdsBg5dyOxKxuJPwPfC0jHrAVQFttiuKGECEUC6OKNSOpBIAo/of3q6VfKviGOOq+shrj
	 Uayg2PifM2V83nALD/JHiEIdXtb4ASGrCAUSqW8UyvHLbwzb7i41af8i1AzsApE/Nys1b
	 kiK1bJqS+/lYuVmB5varOqOt+AK0FEOoYG3yoSYT6upVF5f8v6QY0je2QV49/ZIvkLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ce62sMFo;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2700560A6F5B
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 12:40:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2700560A6F5B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ce62sMFo
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso52102685e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 04:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794919201; x=1795524001; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eH7GNmtkSKP2fzAXhmpuBWSGX/FXkIALtIPPfHtDiis=;
        b=Ce62sMFolZ8wDThxrrbo+CnTzEs6w7mi342mwpd9ugs27RJgJ5cnId07PBaxEu1f2t
         8GevcTB5H8HH0tU7USgs/C7oMgv9C0E/2ENimKZuqJYO6fUEJsnb+FA/18VNYiFDdJOV
         5Pob9+GtoRAtyzzeYV842RMcHt1a5qQwiptHgRxHqkDQEYD24TcKNisrkw9Umr0kQC2s
         b+gU0YRgX+3RcsiL5lLTQVNbAqgu6Lz1m9w9D0860q9fHHpe8W4Fb/a+9PLqJC1UR4Ao
         f5P9EdlzBCylkrLMsuxiJLc0SwS+WTSiku/JffJ/yUhwQwnzrhcmbogzStGBZmR0Uf3K
         75Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919201; x=1795524001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eH7GNmtkSKP2fzAXhmpuBWSGX/FXkIALtIPPfHtDiis=;
        b=O9IjjQx2H+bk5m4jomnwSnsdwN/H2UKB3wU1O82A8ekCpDApoM6mp9mbIqFxfIjrnV
         kSvsb48YrIOzC8FADEOQg6Il33+IJxoxWmQM8s7sY4Lk5YQZTvSo9ooRFMmrBpujrQxr
         gnc4mTRk2Ida6MZRvbiRhyBQ5OksMub/Z4s5IHV4NCp2Dio4JLJq5wHz3L767I73PaG1
         TUk284icovgNA9NmKeDvJYzW37EJbuu9SXRqi7OaMM+Kx8wO84zoZgZ6Z/GSQKjSp1SD
         DVfvlKBu8GOOrf1gspNsd+bgQBW1lZJKGVYO/XHS9KZz1d9S4Zkl+l7EX7mXsrv/2WSW
         9zDQ==
X-Gm-Message-State: APuU4Z9r/4K/UoKWChom/YoTgzTYLeHOV1vVBwa3bLC5VsLdTMFyTQiR
	kVTICcR13Ha/FKY2mXy3dV93sBflwZ0NhMU1KIfKJLjOIaTV72zZgVwSZOajWNuZlQyYrA==
X-Gm-Gg: AYBFou0khqBcDr+L+n2Csgkij/hj40IOGuoOqjQFvCWUYodK1XZMalSXdWUalxs0UCj
	rGzW0DAmE21CNDRU3xK+Ktr8YqmuxGfWujE3nk5KcTXgwrlbJUkIt59tKaVp/OtH8bU5R5Frejy
	iPacGNApxSniv5YHUGQaTEuQ6fAqJFZymxeJomLLEZHipm56q77OoIBs/Q9M5s6oxyPslglNIdI
	Ed5JoWDta3fMfDjYi2lhHqTZwGoDLDIBL4GkMIr5cj3heyAtmC5C1x1w7sTzvpSr+vfRY9BTqEP
	YOv52q0BVovl347LEWomaQzx86z6PX3pSnNitAif3V/7dEdsjBrfU7QvkEchX2NXR0E4mhY77Yn
	9Zi4FlCQ8ojI5+J+t6afty9ruD1HIRx3PtDOisLK3d6WL70j4RICYAVz03Q/3PlaRIem31883Wp
	MwlZsySo7DTFQKUNzQlSIQpj4M4u+OjxkI4ricREmY4x5lpfuTay3dN2vrHdG1+uJl5TNypOMib
	nOZSx0Xj8XDo9S7ru/14Cbw4hZmsEg2l29h6Wmq5FGC0jsyBxVXXAw185OnIHrU7AuG0log65rP
	dlEmegGskOYzZHzeFBZLO6KlLDHc7zhAYfAFqO1dOJ1hUU7Nvs9+EtuR0u9V4gGuO3eDcg==
X-Received: by 2002:a05:600c:8189:b0:4a3:598e:e7a8 with SMTP id 5b1f17b1804b1-4bb559f72b1mr298144455e9.4.1794919200559;
        Tue, 17 Nov 2026 04:40:00 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (94-21-223-203.pool.digikabel.hu. [94.21.223.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783f8154sm71474905e9.4.2026.11.17.04.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:40:00 -0800 (PST)
From: rofikkerneldev <rofikcoga@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	rofikkerneldev <rofikcoga@gmail.com>
Subject: [PATCH v1 11/11] arm64: dts: qcom: sm8250-lge-timelm: add QCA6390 Bluetooth
Date: Tue, 17 Nov 2026 13:39:46 +0100
Message-Id: <20261117123946.668557-12-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261117123946.668557-1-rofikcoga@gmail.com>
References: <20261117123946.668557-1-rofikcoga@gmail.com>
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

Describe the QCA6390 power sequencer and its PMU regulators. Enable the
Bluetooth HCI controller on GENI UART6 with the supplies provided by the
PMU.

Signed-off-by: rofikkerneldev <rofikcoga@gmail.com>
---
 .../arm64/boot/dts/qcom/sm8250-lge-timelm.dts | 92 +++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-lge-timelm.dts b/arch/arm64/boot/dts/qcom/sm8250-lge-timelm.dts
index 6b57c658cf918..38816268fcf53 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-lge-timelm.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-lge-timelm.dts
@@ -95,6 +95,67 @@ key-assistant {
 		};
 	};
 
+	qca6390-pmu {
+		compatible = "qcom,qca6390-pmu";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&bt_en_state>, <&wlan_en_state>;
+
+		vddaon-supply = <&vreg_s6a_0p6>;
+		vddpmu-supply = <&vreg_s6a_0p6>;
+		vddrfa0p95-supply = <&vreg_s6a_0p6>;
+		vddrfa1p3-supply = <&vreg_s8c_1p2>;
+		vddrfa1p9-supply = <&vreg_s5a_1p9>;
+		vddpcie1p3-supply = <&vreg_s8c_1p2>;
+		vddpcie1p9-supply = <&vreg_s5a_1p9>;
+		vddio-supply = <&vreg_s4a_1p8>;
+
+		wlan-enable-gpios = <&tlmm 20 GPIO_ACTIVE_HIGH>;
+		bt-enable-gpios = <&tlmm 21 GPIO_ACTIVE_HIGH>;
+
+		regulators {
+			vreg_pmu_rfa_cmn: ldo0 {
+				regulator-name = "vreg_pmu_rfa_cmn";
+			};
+
+			vreg_pmu_aon_0p59: ldo1 {
+				regulator-name = "vreg_pmu_aon_0p59";
+			};
+
+			vreg_pmu_wlcx_0p8: ldo2 {
+				regulator-name = "vreg_pmu_wlcx_0p8";
+			};
+
+			vreg_pmu_wlmx_0p85: ldo3 {
+				regulator-name = "vreg_pmu_wlmx_0p85";
+			};
+
+			vreg_pmu_btcmx_0p85: ldo4 {
+				regulator-name = "vreg_pmu_btcmx_0p85";
+			};
+
+			vreg_pmu_rfa_0p8: ldo5 {
+				regulator-name = "vreg_pmu_rfa_0p8";
+			};
+
+			vreg_pmu_rfa_1p2: ldo6 {
+				regulator-name = "vreg_pmu_rfa_1p2";
+			};
+
+			vreg_pmu_rfa_1p7: ldo7 {
+				regulator-name = "vreg_pmu_rfa_1p7";
+			};
+
+			vreg_pmu_pcie_0p9: ldo8 {
+				regulator-name = "vreg_pmu_pcie_0p9";
+			};
+
+			vreg_pmu_pcie_1p8: ldo9 {
+				regulator-name = "vreg_pmu_pcie_1p8";
+			};
+		};
+	};
+
 	reserved-memory {
 		ramoops: ramoops@b0000000 {
 			compatible = "ramoops";
@@ -506,6 +567,21 @@ &uart12 {
 	status = "okay";
 };
 
+&uart6 {
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,qca6390-bt";
+
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddbtcmx-supply = <&vreg_pmu_btcmx_0p85>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
+	};
+};
+
 &ufs_mem_hc {
 	status = "okay";
 
@@ -636,6 +712,22 @@ touchscreen@28 {
 };
 
 &tlmm {
+	bt_en_state: bt-enable-state {
+		pins = "gpio21";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+		output-low;
+	};
+
+	wlan_en_state: wlan-enable-state {
+		pins = "gpio20";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-pull-up;
+		output-low;
+	};
+
 	touch_reset_default: touch-reset-default-state {
 		pins = "gpio38";
 		function = "gpio";
-- 
2.39.5

