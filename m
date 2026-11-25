Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795636365;
	b=ZruDHiOrBu/D6P9B50/00OKB6wdYY+T9DsE9b00CwZ1ylrAdKlL6qOfHC2ZDaJWxH97F
	 nwPatWMDWtsza1VTAOGURALbePeGFPR6kkkl2U9++LA2yUQpI4ZXgElsikbq4+0c+kjqB
	 WZwYKqslfK2FUvmDMShnSCK5aTl52OISoy+uM9xI5S3qtjK246+tyT9IjEZcAgnTF7DnV
	 PgyebxlYDp486E40j3LipMHJc5H/tjBA1eJNcEtBQRNmM5bkRbtaAlAzVYALF4szdh2Aa
	 ajYyCZnRTWsov1RqpO/KhNMyZpf0E50pEswlczes6bkmkH+56bzzUQYUYZeDkbAMljQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795636365;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WBMiQJP19jkznUvjuyL4lpjOIC11peac/ln1EsczLao=;
	b=0vjKt3wOX5MHHng+jQixhe9rXEgyDrx7MtlqrMG2FsTgEONYZJA57eV7IcQEFzqMXNds
	 hrHD67Wsyu7NbHLNQ3iw3pVRa0D/VW86xUTOZii+zPNO8LWLJ+nyGit22mmS77Nez78S/
	 9H5SNnsTrTA8FBIKG9IxKHaU+q6vUAeIHM70CpXPVYvMW8IgqzZxXkiW1gA/g39fKVdKk
	 1ySZMW4VujPXAK+7CS7lYGwohEmoaKw+yCI8k12gylSdMNypaere2Xx2z5YdryVVpgFV9
	 86DKbvj1/uIhxQqTMlU3ehWfaXF8hRmKcDRRFzAtpz/02y/t2PjD6bddAWxF9H/fosQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="In/s4wR7";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gxBlYlzW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0CD9606A33E
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 19:52:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0CD9606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=In/s4wR7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gxBlYlzW
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APJAvCR162783
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 19:52:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WBMiQJP19jk
	znUvjuyL4lpjOIC11peac/ln1EsczLao=; b=In/s4wR7F7GpkDpKtEXoGM8Ekyy
	r+YJwoXNY/jaK/4q9Z+wWrp6sm8eheLhn5tOuobZHA0MRMWLRP9UVRJnUvnADK4E
	FcFp6lh6e30ybjRvN3O4SDG3TkS123CvqLt5m+oPk5f4HszeQgxtBvTfG07dpN0P
	fiKSTakERDztTAzGMUHjLgPoDaSpYN5vKBeaRBDwhE4b7+qyEG2akNJ0742lK77O
	T96VstZYbECBaat3Smep3aoRPsGKwEB+k/CFuFt0mEirZgaV96ZwTHLHDtg2VNF6
	DVXh0JfUJfRM3NoMqDn+tbX0ElcfubTb+R5QmKFHOSJLZh1uVuLXDaG+M7w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62aeh1d8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 19:52:43 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93e92aad34aso1071040485a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 11:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795636363; x=1796241163; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WBMiQJP19jkznUvjuyL4lpjOIC11peac/ln1EsczLao=;
        b=gxBlYlzWyVE870k+kd+pZ7HsJU2jT17QK1FnQMYDJX+Bk9hsNMJ6fgkl2RI93Vvppl
         Yo7An+2tych1cUc4dTIAfEmI8oOeMC9jk/54ieSEZoLFG5Wr8G40MG8vcpKhwXnybufZ
         ldNiqmBEsmU9PsbrVmlt+MukAT4M7w1lnpzjbht2Yd8yG9LkCuEwDLMNrcy9o0rs3DLH
         Z97jhu7P4kUAxbAj/lWNJ1TOGpG9sTbR4fXVARDF6aUAtZS8ZQ++5xYh0h/GN8ggOika
         Mb2yY83XGn1rLIzRJRSx8moOL/vzBhHDmWPa/7cIOjf2dM410HYVzQFWFvYVjWe9P0U1
         b2KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795636363; x=1796241163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WBMiQJP19jkznUvjuyL4lpjOIC11peac/ln1EsczLao=;
        b=z4uS82bcs2/ZCXOGx8eCwp1+vo539JaoDUsjYJqWmPdvgavaMp4dlTdlOev/9ERVRf
         ac56WMXI/r5SQKqS4w1KgHesbzjy2J7aPZd25ozsKPGXZr6kSpwIM4Qy3iIWHijfV6TV
         Uch75A7zu5panL22X5oJLnwjYqC+X1qFsZgbYG2P4P1UTi1KrXtY+D5RC5kYFtgNahBc
         GUtWfkh3F87nV6h9XlLIO3TELWIyosx3/sXszedODG8uEaiP2bK7pMVQBCJyXyLTqitp
         JKMZ8EA1N7zoypeA8mZyd4xT9iVWkCBTfaaNcqKt/BnNkjK0KdkkCOwcnTt7dcPD+Axc
         z6/Q==
X-Forwarded-Encrypted: i=1; AL+hErE2Ucx2lizc/VuNTZaGABLYnqPdyLX/YE27fjRnY8vaTe9DGUh+k0qvnM24KXd7oxp8CmJJc4hd5QnVVgVM@vger.kernel.org
X-Gm-Message-State: APuU4Z+kkaSBqO6YALavZ8LhkPQ2rjBfUoGU7B92Ag27ReCxdX7ZOErC
	wZFvl8zx4PH1+m3u0wvJkS8IH9hQhKEYkyuUWmpghLmseYWG3WnpYahsfpo4qjb0hHjXnPYt8ud
	Pbv0gNHS4Il9LpHVTrrabZMVQMHdQr6ambi58Pko3XU7GrZozH1E0oVlb+EhWqzN2F2AR
X-Gm-Gg: AZFdTZfsuqrfEK1mzWRsptAU+KuX1c1+idUMtkm4kKJuA87o7VEWrIhCj3fOXY2Ez61
	bOIOloY74FiCZGkaozDUg14x5RwMjLHtq6fldsWtQQ/rZ4Xx98T7wO1vzs71BSP8OJxR/9mV//c
	Dnuz8+DQ5m05+w5g3oQ0QQtm8wQpL36gY5tWkVCN+FeTZifjCgujrlMaUk6Ngsy/i9Ot27jj/C4
	oO7lFiUzwhbpLr99MTCEGKyugNgUvX119czctesoHpS61T5P/f14Uh6gNzLOvttBIXkTgfP8twK
	O2wshP08B1I7nXniH5wQif5rIKnokBps9Zi0umhKMdDyXm408OCNjRUwC9rUERXNJv4kYnC1mdg
	wXCS/hoKtwmCWE8W2ZOCHSt20WO6bxZUmpsneQLIUByIr/BKo9bZDwb3Am5eKl6HC
X-Received: by 2002:a05:620a:6c01:b0:93e:c12c:43f9 with SMTP id af79cd13be357-949bab6e243mr3192620985a.70.1795636362959;
        Wed, 25 Nov 2026 11:52:42 -0800 (PST)
X-Received: by 2002:a05:620a:6c01:b0:93e:c12c:43f9 with SMTP id af79cd13be357-949bab6e243mr3192615885a.70.1795636362477;
        Wed, 25 Nov 2026 11:52:42 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm774316205e9.11.2026.11.25.11.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:52:41 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Griffin Kroah-Hartman <griffin@kroah.com>,
        Luke Macken <luke@phorex.org>, Srinivas Kandagatla <srini@kernel.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 3/3] arm64: dts: qcom: mahua-t14s: wire backlight through pmk8850 pwm
Date: Wed, 25 Nov 2026 19:52:26 +0000
Message-ID: <20261125195226.1563577-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125195226.1563577-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261125195226.1563577-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA3OSBTYWx0ZWRfX2A3edHp5QRm8
 ffvBXMjG5DIUPsApHDwFCE0BYDAaq1XYYijqDEL5ozo51ww5MpdNGCm53V4kSO7kuCGMRsxvjwI
 yZd3jIDbop+pDCsntETLa6+6h5zUiaXwvw/y7aB4k9lxfZ0lokKq3f+4Q5olr+hygM06fsVVe7V
 uaHWjH0BgmQzDl8LUhanyvV0PJA0QyGYGuSpKD1NyqB/ooWkKmHj4I33ectwMYlgjTW1XhKJMM6
 /dW2u2eiU+fGhxZ6A17h7wt0astFtpUq0740JXwUB0ur5wi1pMWFMLetj9JnkJfQx2BUDu2rVGi
 IDn2ej5Kocr6fvARscCwHHLytLTMCZzJTZbTYrGorNp7I/DVTB3Fro2XBAQwHZRCkBGRT9z9jTH
 6+BfyZiLfRl9nmwVN8CEEPsmv6sVSN+UhAgBetypqhEo4OTm8LNz6tbJJd4lIqNkf6TCr0GeoY4
 5ckB1qBG2zI95daifYg==
X-Proofpoint-GUID: 5XS_AyXeJKXmKcy3YRKTtR0bjQfDmrhh
X-Proofpoint-ORIG-GUID: 5XS_AyXeJKXmKcy3YRKTtR0bjQfDmrhh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA3OSBTYWx0ZWRfX0q+lDYsgmyPE
 rzru/LIVcUf33KWcnE+EVe8pbLHx0XrAQM2qJZtZ4ryJCJxTAMCgVLd6GL96vVQQ6eQaqjHjk9e
 rzVcdCcPRMzJsmImf7e8CpEgWepBM58=
X-Authority-Analysis: v=2.4 cv=PqoG/AM3 c=1 sm=1 tr=0 ts=6b073c8c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=mO8_gwkcAAAA:8 a=lS6zJmM_-713XfzwtBwA:9 a=NFOGd7dJGGMPyQGDc5-O:22
 a=InTEqNb8lIr1xazlwGwc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_05,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250079

Move TLMM 18 (EDP_BL_EN) out of the panel node into a pwm-backlight
node and wire real brightness control through the pmk8850 PWMR output
(EDP_BL/PWMR_BV_PS on the schematic).

panel-edp was asserting EDP_BL_EN before eDP link training, turning the
backlight on ahead of video. With a dedicated backlight node the
framework toggles EDP_BL_EN after the link is up; TLMM 18 remains the
LED-driver enable, now gated correctly.

The panel takes only its 3.3 V logic supply and references the
backlight via a phandle. Brightness drives the LPG/PWM channel on
pmk8850 routed out via pmk8850_gpios gpio5 (func3).

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Luke Macken <luke@phorex.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../mahua-lenovo-thinkpad-t14s-gen7-lcd.dts   | 26 ++++++++++++++++---
 arch/arm64/boot/dts/qcom/pmk8850.dtsi         |  3 ---
 2 files changed, 22 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
index 2d6578edcc82..bad49ba5443f 100644
--- a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
+++ b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
@@ -156,6 +156,16 @@ vreg_edp_bl: regulator-edp-bl {
 		regulator-always-on;
 	};
 
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pmk8850_pwm 0 4266537>;
+		enable-gpios = <&tlmm 18 GPIO_ACTIVE_HIGH>;
+		power-supply = <&vreg_edp_bl>;
+
+		pinctrl-0 = <&edp_bl_en>, <&edp_bl_pwm>;
+		pinctrl-names = "default";
+	};
+
 	vreg_misc_3p3: regulator-misc-3p3 {
 		compatible = "regulator-fixed";
 
@@ -579,11 +589,8 @@ &mdss_dp3 {
 	aux-bus {
 		panel {
 			compatible = "edp-panel";
-			enable-gpios = <&tlmm 18 GPIO_ACTIVE_HIGH>;
 			power-supply = <&vreg_edp_3p3>;
-
-			pinctrl-0 = <&edp_bl_en>;
-			pinctrl-names = "default";
+			backlight = <&backlight>;
 
 			port {
 				edp_panel_in: endpoint {
@@ -696,6 +703,17 @@ misc_3p3_reg_en: misc-3p3-reg-en-state {
 	};
 };
 
+&pmk8850_gpios {
+	edp_bl_pwm: edp-bl-pwm-state {
+		pins = "gpio5";
+		function = "func3";
+	};
+};
+
+&pmk8850_pwm {
+	status = "okay";
+};
+
 &pmk8850_rtc {
 	qcom,no-alarm;
 };
diff --git a/arch/arm64/boot/dts/qcom/pmk8850.dtsi b/arch/arm64/boot/dts/qcom/pmk8850.dtsi
index 053ae42ef0fb..dfa99cbd21d7 100644
--- a/arch/arm64/boot/dts/qcom/pmk8850.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmk8850.dtsi
@@ -69,9 +69,6 @@ reboot_reason: reboot-reason@48 {
 
 		pmk8850_pwm: pwm {
 			compatible = "qcom,pmk8850-pwm", "qcom,pmk8550-pwm";
-
-			#address-cells = <1>;
-			#size-cells = <0>;
 			#pwm-cells = <2>;
 
 			status = "disabled";
-- 
2.53.0

