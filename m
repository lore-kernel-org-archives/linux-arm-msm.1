Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794018408;
	b=U+5FONcRoxzUmWmEL7TJErkeTw4TWmCDC4mf9+447rpOJfvO/WspS8ixI7Wd+aetqDQ4
	 iAwEeUbnCQYoaiky0SRhnWJgYYkxZmOLyR8fx+0ORBK+elAVnslcCSF44C8SVaJzLZlVb
	 CATBGI22NHVs1L897x0zjRHUDarvHXud5uHAMQ/RvPq/++WgdPV7DWrcmPQRxX60CCi/8
	 3m2IvQ5ITRkRpytFGvOLjO8Ua46U5ffVFlifsCW2FU5Nrsydcaf4awExvnMyYqe8kKNyx
	 n56TQH1GclzCeAJ80s8LHDY4CyHYgp7DDyTI2OC+ehWHK8HEpC6x5qo2/WUWYdjFirw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794018408;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=B7+2bs1h7+qzvrMEtIoOvT0o5eL+5r9TpcyjfyV6bAM=;
	b=TD3+Vxdh4UURPwSlVk2sWYZet0HG064SR/VyvB0HvCmspfZbOovXp4zZBNUFC3p3kpJ6
	 T/I17WDPOj4HaRlrieAWRmRIMTlGPATinJsBGAMgPTH4oXoNirt5bY6miSpum4+0CO7mW
	 jb6/5kfJetvPs9LnTmB+RiDixbRfCzOce20OsZb2lQctSkl2rY2p05t8LTXUxPWn922wY
	 LTMy3NGESOR/ne9H+jvcJ7HrA8eXDV094Ztq3/eEzeqz5ArzymwrzqtD3PnGPLtFmb4gQ
	 AzGSR/ypUR79uTaLxywRG4iEf7ZS7fUXByuQN1PTnO9STsQ88T5pppKLqItsHhdH3LA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tXoM+PVE;
	arc=none smtp.remote-ip=209.85.222.49
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB33606A32D
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Nov 2026 02:26:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AB33606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tXoM+PVE
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-9906870a9baso615086241.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 18:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794018407; x=1794623207; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B7+2bs1h7+qzvrMEtIoOvT0o5eL+5r9TpcyjfyV6bAM=;
        b=tXoM+PVEIEMNDbySzTyNRv74+GqQx/TyqC/EVz/BxnMoX18SthD72GQq4Bahq+E4PC
         CEUsthwvDrWJ33nOX2l3rUBOmJlZniNuTAiq0CKnyl6JXObCYwB3eOCUA8DUATNtZ+q4
         G/l467g60IVwelFb8tOOQti8G3eAEoKFTML2xwujA2gzxw8y9JWQp7HPcqcud6XXzwEW
         hs3CxZEMttVPBc1rjn+HUmxEh7n/OmXh7mgXJe2l/UzjerXW1BpDBiOkdvnYu7xD//RQ
         /jWRorV/WABXPpx8siUDxaoeexxpx0NZ1I6JR4edi/prLt88t/MyUg086Sh0qUiY3Wdh
         xTiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794018407; x=1794623207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=B7+2bs1h7+qzvrMEtIoOvT0o5eL+5r9TpcyjfyV6bAM=;
        b=HfcHrSLep5ZRmqCQpbP1FhLDUf9xeGjGe/QoQrvNbSPehI5yJgInyPv6p0XHWEJkTz
         Xv7CHRnA1iiO/luTc40YMahH2C4bAYZV2PgOUNG9xFw+VE5aHDHsgfTfWTsbzBTl8f/c
         85yaRaonBxAgH5OMl1aPswlSIe5is+35C6FBdQZ8DEwfZ5Mz6s/54Cb28IwA4A6KkEAQ
         WHzUql1bqu+TQWAT3amciZCvAzO1z1BjSJDfiC3rVXB/2z19kOxgQoaDodNWcKv+16mr
         PszdYDeiChDmU6Ekl9fmg/apWQsCsiCltU7JHdB/Pb0yHIutbmvZF3/jD8WCR+dAC6Ms
         HPQg==
X-Forwarded-Encrypted: i=1; AL+hErGWc/m2hNAmOynhHUCpohoJIJ1EGl2IxxcRGGYbrAzz3ZVP5i0IXMZO5+0Qx5Ms1oACJ1Dln27tFRXdrS6s@vger.kernel.org
X-Gm-Message-State: APuU4Z9KCC2ombRrNFXX5UMC/1xQFir3+Hcb+Wwq0v5xZiLq1PuZ9M5x
	rxiy0vgTI5gE66lw9WzZWL0Aoi23q42HliY8hcWIBf91ps4P1JGkS0KD
X-Gm-Gg: AYBFou1ksy7xSvEHKCX7iNdMAqiERL6B1hAtJId4OfJ9ETSqHeINVcKpaT+dtJgmsPK
	OEB+/wqodfCuDLWNLUncxCTfxCQf9swspAvYhpAXtdGVpdkkr8Y7oDQW+UPuJs9zR9dNln7fg6K
	c1sPtBrZb7zHSEpaZGoGirMRe6Iw0OJ9TLih78GgoTWBd9ZQ+XMmwxHZQ5NblBGTVHh8j0lh2I3
	UpNQ6Kv0ZnLffoQaLKtK8eBR7SymAqDuWSTgw6foXY0FIfn4WQ5OqMw8nIWoFLlG07zL+fzkgA4
	XzlhW7hL2clG5ezxbAIGRgnCBevcwr0TlLX8o3+mqkt18CNYZl+w50pvi50oIcqDl/iGrxs/Oho
	tX3iIHg0XNwKu1EONNTe9UVSVVP5PhshwJVJE7v4/90s87dA8rAPypgD5PRsMkVBPURPeFkoYDa
	ykbfLwd21JbdeDEm7YhabugBDuDSdrQ/0t98B1h1TrOKZuVGH9vRlkl4agk5MhRkFxCT3kBtg+U
	n0tjrIGi2ZTWY7jfHyPv2aAqwqE+/RRi4cJCLiHNRVY2aYpqRFmejjXKMBYuz3TaV3dFyJuspEu
	I33Smt5hztL8wKRg+9V3+LbTgKwr
X-Received: by 2002:a05:6102:5121:b0:7a6:b18e:6d24 with SMTP id ada2fe7eead31-7d2a15f9d96mr2571256137.23.1794018407454;
        Fri, 06 Nov 2026 18:26:47 -0800 (PST)
Received: from localhost ([174.93.36.89])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99baea8aeb0sm3142542241.9.2026.11.06.18.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 18:26:46 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v3 8/9] arm64: dts: qcom: sdm670: add digital audio codec
Date: Fri,  6 Nov 2026 21:24:52 -0500
Message-ID: <20261107022453.159341-9-mailingradian@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261107022453.159341-1-mailingradian@gmail.com>
References: <20261107022453.159341-1-mailingradian@gmail.com>
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

Add the digital WCD audio codec to the SDM670 device tree.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index e99183c22208..3e5ca16e3056 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -21,6 +21,7 @@
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,apr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -33,6 +34,12 @@ / {
 	chosen { };
 
 	clocks {
+		lpass_cdc_bclk: lpass-cdc-bclk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <1536000>;
+		};
+
 		sleep_clk: sleep-clk {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
@@ -2822,5 +2829,20 @@ data2-pins {
 				};
 			};
 		};
+
+		lpass_codec: audio-codec@62ec0000 {
+			compatible = "qcom,sdm670-wcd-digital-codec",
+				     "qcom,msm8916-wcd-digital-codec";
+			reg = <0 0x62ec0000 0 0x400>;
+
+			clocks = <&lpass_cdc_bclk>,
+				 <&q6afecc LPASS_CLK_ID_INT_MCLK_0 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+			clock-names = "ahbix-clk", "mclk";
+
+			sound-name-prefix = "Digital";
+			#sound-dai-cells = <1>;
+
+			status = "disabled";
+		};
 	};
 };
-- 
2.56.0

