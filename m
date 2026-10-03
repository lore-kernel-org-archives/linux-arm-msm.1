Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28784A3F2E
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 Oct 2026 17:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791050240; cv=none; b=h5idsJIGBDNAqVs9NQafyld+/m2gq4b2YIShsWwXhSgQF0mBlhSaDZ8myxNkr1glKyeUvgtQ38CeIkTg8lxOJn3omD5FREjKhx3LggIAsuN1FQVNaNcxLFKzjTmDl2cPiaJLtnRe1xUBaiodNDeUDHTqN5XG8R/tviMWQqhIko0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791050240; c=relaxed/simple;
	bh=2V0qBXWkQWaJIHJgjhlGvc3Gd47a7McRdg7biTgETbM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Li6x0OJtYoi1Xgkm6WYt7TKPnUdkPwhFCGJgAyMkbUbwtK5LWZ0TzmbRyctWXsYXK0TDd8k+zI65THWxoh3nJZQ2cEXpKlyTy/bLXf8HFXRu/wX5kHbjyiMnrRwQbP9oEiAzpmCNS/GMr6abqo3v4Sw3feFKqCHoBWyb7wX4By0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EpIl5tr7; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EpIl5tr7"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-5309a20a55bso4286291cf.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 03 Oct 2026 10:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791050238; x=1791655038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4/zOvoPnwXNPf5C8d03bW80XrbdlIDkEOSYK24yCMxA=;
        b=EpIl5tr7xAhCJ9UR2LO3Oz4s+9aY0bS2nH3LmJ/y7ryAU4rEGclI2X7hkVDxRL2x0y
         IrfRL3wnNTl1ZLThdQJIqGVxt890SgUZrUxKFA3xI+ZcnXVlyS2HQpE4KdFBUmCxrxcQ
         zQG/PO97YlfaK3gA1D19QZ+Yuf0N0XxcT1ONXkcNj5Ppj92TIvMUxHf1WKJb9JRInmcn
         9jOF47Rc3TFMbbVnGhhpJ1pfJuODdNId7/3x1DwVNTJArYFtrlaprkGNAy3vu/u3Xgkk
         Rp1N1lc9r3JZuZTSv353TQqN/rSZSewwE4igJOETAkmGIVmAGoev0M+KWBr7eOiN4uQB
         td3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791050238; x=1791655038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4/zOvoPnwXNPf5C8d03bW80XrbdlIDkEOSYK24yCMxA=;
        b=ZI8pgZSg+5+NPVLNxI7QIY1CATWoc7NqWeKRk2a8ao2JroZled7vMs6xP+q3nCXIKd
         TypVI83MJvPP5wUPAl705DBA26TPD1xYwH5q9clFQqsHnckeEPwp92InC+2lKXHgoJBb
         EHE6pHMg6pFnuKy0Iv/jZm9NetMZGTi2et/lmFDpaSYhvk/m47qtJOEye+8ZHI/5EwDp
         U1t5sKO4vuEh8R5Bqw1RmSbjukZXnE0Mn0zgswEHEXMZsJq86FZWc1YifUXEdHuTA/lS
         nj4YJ1YuDCBC9ltLcS/tMaOgXFs11P8+9euDkQSddt6JNm4n3O8cscEXeDeJJzciAyCv
         HMuw==
X-Forwarded-Encrypted: i=1; AKwUvBynKoWrt5s/VrCQPLSa4mxfY/Iotj/GE8twfnj/auILMtbmWaC3L04m1aM8TeKRS3nVJpna3yUMItbHpLBs@vger.kernel.org
X-Gm-Message-State: AFuF++kxftzLeo5o78Ia+cEdZUYGOhA6qSaOugegLk6E2A5Fgbb8hsw4
	sIn07YX3hxTHiMINrbXc188ZdHsA111NRj4QGH1PZFFV/yTqdiu0In2W
X-Gm-Gg: AYBFou1QfHlqhaX/Q/bJXuKgbrbpD1xS2cct9CUaZ1R9rdnD9mo1dYx1kyFeWoy5d13
	rC22HtCyjj0cfPK6wYSBjH0SxrcuBtLDL1jHF77hPnguspx0NlCBLEi9gtG9exY15zHbMQq2Y+9
	QHoGvB2phDJS0xo2dmLxnS9h+bNzk/85BuOh1sv8o5Erh925pI19+Zm5JU6cpNQ3DvxyeTZAqyt
	WGDtki6Y1nub4VXitVKJjBC3jkBRXUabKtYZ/yuU9Kcb7Ue4KctQ7yQ4LLskCaV3F4Vx2L9XIoY
	yWRL8CKQvQ+yyXUJM3Ptg9b6LHiKSjQ210qcgzw0CIceKvtMEBXSnU+ZSavlChQ+XyksIhSUnLG
	e3OMaCu+WvOYFECGm9jDwjVrM7AMktPEuX5RQBFcMeP51prTYyqD+aclcElBs6un1oXkovpgPtb
	Qjw6Re0v4vSNcsyislaDOc8/tgLCCxDnobfXZq/ae5FTjTcLPmHUVH4AUcwB/oZ49xhmWObSY5J
	JJgpy7ccJNW
X-Received: by 2002:ac8:7fd1:0:b0:535:753:4b08 with SMTP id d75a77b69052e-5350753550amr92217291cf.17.1791050237877;
        Sat, 03 Oct 2026 10:57:17 -0700 (PDT)
Received: from localhost ([142.181.121.230])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-918f748c54bsm43302276d6.9.2026.10.03.10.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 10:57:17 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Jassi Brar <jassisinghbrar@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-sound@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v2 08/11] arm64: dts: qcom: sdm670-google: enable adsp
Date: Sat,  3 Oct 2026 13:56:56 -0400
Message-ID: <20261003175659.23536-9-mailingradian@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261003175659.23536-1-mailingradian@gmail.com>
References: <20261003175659.23536-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the ADSP on the Pixel 3a in anticipation of audio support.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
index b4854801a5f5..73639b0271e9 100644
--- a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
@@ -196,6 +196,12 @@ cam_vio_ldo: cam-vio-ldo-regulator {
 	};
 };
 
+&adsp_pas {
+	firmware-name = "qcom/sdm670/sargo/adsp.mbn";
+
+	status = "okay";
+};
+
 &apps_rsc {
 	regulators-0 {
 		compatible = "qcom,pm660-rpmh-regulators";
-- 
2.56.0

