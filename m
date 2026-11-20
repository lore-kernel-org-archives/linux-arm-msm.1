Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795190104;
	b=XLfhnzkdefY9VrE4c+2Yy2C22/V48KT1LlLHRwFVkYm31lUIUsVsAflYfAi1lU5GW4ui
	 u2Fh0a9FSUpThyi11qyoyD2yYuqizAo0HxZUmvOPxGkqaxm9k+RGeUaqpY0hll2y5PwHj
	 vuzLGaCA1Nk9MY6JJ79OhXZguy8EuKvy8IlrHFO6eBYwMFXFtZVRmIqJwUEV72KpAtjUX
	 aykXJiKvKaEkl+JzsxTVfkU2sZ4d0yl6TjqibP17qb0H6kKrtEFIy/aWc7B1cm+gnvPRr
	 0m72dUiWz8pOpKnquUXedGmAFI62hct0EWt4EzRbeKpP8ROksyF4g6Fw79pJTfqvmRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795190104;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Xs8qsWr3WzXXJQ7Iw3lOFiXdEVTvIvytDHijgZN3pu0=;
	b=JO8gbhQiXVWUalGNqokRPBTLYXQuALpAv3g9f9v52B0HirxYTgbZxy7uPU8BKnu634tU
	 AeNMODOYJiYdqmYgbKDG+8B15iB+QyIrEQY83zCZQmYFMEm4QIfQZAioCFTYtLzXDyi0V
	 Q2IbjP2/wNvm8VboBQO4HbFXHnUoG0wbwGEopg5I5f0EIIK07Mq4/v1hgZZ3Vp8KFyN5o
	 KXgUVojMpN2CmiA4kvxvM7+AXJNs9GTbilZU3gXw1NZ+FMYk+v8AMhR1NxDorgr72+iyU
	 Bs+6YQEaTKi/J2eSjHhkxj+xE/+yVxxKcHFA5Imrcxwvz/GICM/QCxXls27tCAxcrLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=du0gvix4;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5BB660A6F61
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 15:55:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5BB660A6F61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=du0gvix4
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so9314375e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 07:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795190102; x=1795794902; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xs8qsWr3WzXXJQ7Iw3lOFiXdEVTvIvytDHijgZN3pu0=;
        b=du0gvix4PF46UU8EW2IzrDZh9IoSmqO36VYXVJObJZaNizza++7PRBnMcNBGYXs/l8
         XnP3wICQc0mLrKKfZzO0pj3iLGFUFR+ckeLzlDjtA1OYmfHC+T8mRj9LkqLPhDA4n0v6
         49uRiBZxK0Roozx1BCz2ssEZt1V6XxbZN/xI5x2QE3VS+TGWdi39uXLyHt/H+Uk0299C
         wviApfX+8/oZ8l9eJHlopjYcGsJmRa08TPCeV2O/6Va2sJ8VaVupsnXekaqkg+hwzamh
         huB/hDb6W+RTwl3AwLpWnOQERIxDBnSx42xpsAUoc3lMm7nmuqfsaPoTr5zGoaIESvRy
         edog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795190102; x=1795794902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xs8qsWr3WzXXJQ7Iw3lOFiXdEVTvIvytDHijgZN3pu0=;
        b=GOU4qm5dCI61u7FrGln+YF87qBoGAhdVwMh+FzeleAzHqZCXLzrhhV7P+UqlnvBrE2
         8ksnbEHibyn+iWeSvJNf3UNlaIO9XMhYZlui+XEDCKz/QFo4qCiSMstE92TyL6ZlJ0/n
         w6Bn//JoA2Q+othFjVU4CLhpGfFri+szHYYrWurAgTnO13+OEutn2zAlgsZsuLnRg5OA
         Zqi5lG5afcBIDC4k7UIWHPK0q41pq4v4wviGRdl1aveaBUI74EpuC2Xu79jP/9SnjcMk
         DrDEQIKuhreWB7Osdvo15S62C5uny2uu+LbBsRhUonTbkOJJMrqKHE6QpoqpvFG7r8jD
         o5vQ==
X-Gm-Message-State: APuU4Z+ya+dSrvI2HRdX/QFe5eMNPdRFx16MXxU6BIPJhKczRGck+VQW
	iPMBbz9E/B8x6EXKd9924u1YlO/f5G9yCnfUWfumfP+8a5BGrFonDejlJ7xhJUNUFE0=
X-Gm-Gg: AYBFou0Y2hnxBB4Y2rTfwJ4+yDWrpnzsle/Y6AiFsMWeY1Kl/T3ZArWeAuh2Uwn/UK1
	/Dp5/UyHbKK/HRQvSjqpeX1HDmAXV7fHY5dSa/8xh8It1BINO/SLoaFHx3X3n63hr2hihlfok+9
	2BnWeK+j7JGTK/YXwZhDKh8UB3GVSS9WctWgHyXjyxTEgyB3LcQR0VXQmlEIq/VIC+DZqbaHQhD
	jtvNkvTKycKJ1IVxM5gOCRVDYsz1aCQJeQNaKnxnyGv0gtblleEkR5cQSrYcQKVlierXZeeH9tI
	fH10bC8+ezHkTqQA+Y4hqWlzVB+ZduHxQtzKwaM/J522tGbbwjg7zme1fPjxYeot99pa1m3KcKc
	NgEEyI1hx+yX4OffDFYkB/KUP7ShrAcTddLx1TVgoOHMlfGaOv2R/u/z4dpFvaFGrtloXQPf8lh
	X0zOBvlR/17LNvs4sud4hRFQ9j33o3ZwovlkIJskucMAPZWjHkWMY4SKpClVwPUT7kixDKbv7mR
	8MjrdeUGL83GpnfFIuBNx348kUZq+EeQZFEgweRwdXJuBl1jQHfgNnsfD9ns1W83T7apyrB8dH9
	klgNTe4MfWfSZ8fhwMdWe6Ci5pZK4SN9xd5LnM5bUo1YCQ+BY8V9M0HdfeWOsXNJ4KP92Jsq5ig
	=
X-Received: by 2002:a05:600c:1d8c:b0:4bb:5345:606b with SMTP id 5b1f17b1804b1-4bb8882358dmr81647945e9.31.1795190102271;
        Fri, 20 Nov 2026 07:55:02 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a15absm83982635e9.9.2026.11.20.07.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:55:01 -0800 (PST)
From: Abdur Rofik <rofikcoga@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org,
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
	Abdur Rofik <rofikcoga@gmail.com>
Subject: [PATCH v5 10/10] arm64: dts: qcom: sm8250-lg-timelm: add QCA6390 Bluetooth
Date: Fri, 20 Nov 2026 16:54:49 +0100
Message-Id: <20261120155450.7719-11-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261120155450.7719-1-rofikcoga@gmail.com>
References: <20261120155450.7719-1-rofikcoga@gmail.com>
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

Describe the QCA6390 power sequencer with properly voltaged supplies
and enable Bluetooth HCI on GENI UART6.

Signed-off-by: Abdur Rofik <rofikcoga@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts | 92 +++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts b/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
index 16ed6b3871374..66cc2a0a57124 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
@@ -65,6 +65,67 @@ key-assistant {
 		};
 	};
 
+	qca6390-pmu {
+		compatible = "qcom,qca6390-pmu";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&bt_en_state>, <&wlan_en_state>;
+
+		vddaon-supply = <&vreg_s6a_0p95>;
+		vddpmu-supply = <&vreg_s6a_0p95>;
+		vddrfa0p95-supply = <&vreg_s6a_0p95>;
+		vddrfa1p3-supply = <&vreg_s8c_1p35>;
+		vddrfa1p9-supply = <&vreg_s5a_1p9>;
+		vddpcie1p3-supply = <&vreg_s8c_1p35>;
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
 		res_xbl_uefi_log_region: memory@80880000 {
 			reg = <0x0 0x80880000 0x0 0x14000>;
@@ -633,6 +694,14 @@ &sdhc_2 {
 &tlmm {
 	gpio-reserved-ranges = <40 4>, <52 4>;
 
+	bt_en_state: bt-enable-state {
+		pins = "gpio21";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+		output-low;
+	};
+
 	sdc2_default_state: sdc2-default-state {
 		clk-pins {
 			pins = "sdc2_clk";
@@ -666,6 +735,29 @@ ts_int_default: ts-int-default-state {
 		drive-strength = <8>;
 		bias-pull-up;
 	};
+
+	wlan_en_state: wlan-enable-state {
+		pins = "gpio20";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-pull-up;
+		output-low;
+	};
+};
+
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
 };
 
 &uart12 {
-- 
2.39.5

