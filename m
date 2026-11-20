Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795160053;
	b=xyybqCBy3yx2BWGUL2WFVhn7u+FZPi2m5X7q2XaNsQG5uWuWSZ5X9fKR+bwYq2Ib05Hw
	 qSSoYbXVAv55uD03I3gJGKsbnEkTRGVPhSmM0w/LkrNhKRUHXGKhCxGtoVaqJ0ZTTFfwg
	 re5aqNi4JaAS9vUv7OIIIgBfFLRUwpkp+cEMXNm9IXlR3V7rJ4rIJ70Tn/I09H7XRFfh7
	 6YKkg6LpqIH3CNezcK5kXClt8TdSi3L2s6KHlXB2Q3g52+WNR1fhDUb93A8sLdrKV0DDA
	 5z6NmDEWxVPdEbMf53wpS6/ydRnM0c+FOA/AWm2rpCZCYS+ck7BzH8USwtZDQKVdFEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795160053;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0qQAv0ke6L7thaRcZoBAW7C/f5nOb8olxJacy9wBEu4=;
	b=ScaKF7xlI07oelihxn7Qe4YS3DfyhPsXvLTiNm37LRevZpjvE3GUE67pLewEqsG29RxP
	 A8fCKpbonmQtLKN18ISRCIZpOb7+trjPW58JVZuGQ5ZJmBFwhWbkx9kYa5eBRj5NCrwpb
	 zqp8ilhqy82kXVx465jTPlILCTqOxo7XvaLpbE8KPDDvGlQEHbBUEDZqH8Zm3K/aEn/jF
	 JVxcodmoAilmapbigiQJoLYro71+5Od9Mu0o+rzS8RnfCqxx8BqTIDnoVjDN3DCd/NnD6
	 KNBNalz/4zJcNk7rRxiBN7oJR6h/yebyTqcHjmeIYr8ISmMT2eJU8WnA0JRvC+SWFPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=caNuTuUn;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD17F60A2613
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 07:34:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD17F60A2613
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=caNuTuUn
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so4055765e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 23:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795160051; x=1795764851; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0qQAv0ke6L7thaRcZoBAW7C/f5nOb8olxJacy9wBEu4=;
        b=caNuTuUnbk/CiU2CCksNUM3jfmJfYfATNbvRdD6mDUD7922uAAIvcfffd8HaVo7nDe
         maUx/Q8bh4GwIzRKzUCpSPIad1bewWf7Q79xzOeKxcOhcWBYBAvOVO4jdo0T5YtThfJW
         VagYkp64XVf/IqUDjyLItsm0zzUr+wXUGEGfuU070mXHn9b7qxC6mkbHfCXdIDIa46Q2
         nX5Kal+csBsGL+FieTY0X6rMo8rn3k9GjRwuuoOVMTZS6h+W0CAEp+Av3gyxj5dVc06v
         +bOCPl6l2dsP9v4fG7z9CyiZwyed3x5HD7WFjZXszVEPa+rvsp6DLewlgqrMKK3ifbcR
         c3hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795160051; x=1795764851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0qQAv0ke6L7thaRcZoBAW7C/f5nOb8olxJacy9wBEu4=;
        b=iR6PjUCSAFZ1CoVK9veD3QvIyQXUOXLPtsPR0+mdn3WCBvJ7F+wyoOUC72vIRdlOVp
         u5KN3tSyJTaLDpD/ej7aGSiEdM0zHNnuGZzycVXcjkroPXUJlyKQk5Px2p/tts/LbCGx
         1yEhOV/vsKZNQYJ5H5YYuGSBuoXcB5vFIrKIeXoVIvxiJv+Mrg90P2CYRD9uCQt++6m/
         2xB012MbGyxEH0O/fWv+1IpWbKM8AwwYUXT5FgPeX49wECL5HdTQQUkddi/W0L9JGNt6
         ERhxKYIhbbunY/lKD7F46lE4F0zOHUvji0b0EtuUJJ3DDeI5EGoHvWqg7goYl+5bUYKg
         p8vA==
X-Gm-Message-State: APuU4Z9UkumqzUvODwIZ1Pn5qYRbV06wtWovKsNzZ78v+mcDmNf863ih
	hV/4EAA1ja1oaU7fjM6QtmM942wSCxa1H2x3Fz92uzIiAVnSEf4eEdkXIT8OLEt9SlE=
X-Gm-Gg: AYBFou32BKi6u6vMnOpHzr00P+M8F+uHQg132OZDspw5Wo2rFIOmAYI+uxbzCvnlKCb
	eOtrRGlBXQnQ9KvdmyN4++0aM3AhLPukVxFH9FtpZDu8tw0WY2lQeDm9mEtrUqbhG/xnA5MfLWz
	NCJndXof/gOfMagLM5hXamyzm+7lBe1M7/1vbySlyuWh2paYq+/YAE+tv4aFbEeEa7rSzeijOpD
	/Ocaeuu4Yh4X8RnNWYcWSWi+ZR9cEWN++bg+Yu+yazsb89puRpdh+mW0PKQoMVOetWDrmrCISuf
	5z5oXFLS3MsK8gCmxQhuGWcVYFrJqPcRLh5sG0pYDrusd5vE8TDzGQkeZ7B2/54Q+5xytx1XtAa
	q0adCEKBz/GXFeWUl+SfqW/4Kq5kSBZexOPvS5YI7W6O/AfeBoJKa4augH7KGmWMbKnYyDqNChK
	/JjR6DpDIzZC7L3w1x+u8vfVrgiNNC1TYL4jAqLVCSEa5keqVBblvFZ/jwjI68os1nmjycJAkES
	0eCF/7l5CkW+I0KgwMhBZijtoyirJRTV8jt09TCZhNbrMaf218SMY3URmvWA0yzCsaad0OGly17
	m3R2xZ0+qFuRtFa9+F4JAoCncJfgoYCylx2zGWXRJBQqhpinhCmUdebNdDgFI534lZI/m2I5bVz
	rRwV2SSxbC89NOyV+8sIC
X-Received: by 2002:a05:600d:82d3:b0:49f:e701:51c8 with SMTP id 5b1f17b1804b1-4bb8880f0ebmr49766975e9.9.1795160051109;
        Thu, 19 Nov 2026 23:34:11 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a3a3dsm54154045e9.10.2026.11.19.23.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 23:34:10 -0800 (PST)
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
Subject: [PATCH v4 10/10] arm64: dts: qcom: sm8250-lg-timelm: add QCA6390 Bluetooth
Date: Fri, 20 Nov 2026 08:33:58 +0100
Message-Id: <20261120073358.10267-11-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261120073358.10267-1-rofikcoga@gmail.com>
References: <20261120073358.10267-1-rofikcoga@gmail.com>
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
index 2d8b06c05ecc3..46258f3a8cc72 100644
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
@@ -634,6 +695,14 @@ &sdhc_2 {
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
@@ -667,6 +736,29 @@ ts_int_default: ts-int-default-state {
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

