Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10AEA3D3D0C
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 18:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788200459; cv=none; b=pk9uvKXfHnMKl6KytewYIHCIAFMth7q4+3uH5Z0Yrp9ABYJUjZJowIBsyFNzGPES/vCH2+JZDGYUIu45KizXvNb0tNzJZv/pEIyAh6NpfUHTyPKq2AWDsSb2nWTJ9zVjs24q5t6KH5TWn8PGrQdCSBvGXh60XqJ5mSKfX0a2QCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788200459; c=relaxed/simple;
	bh=rb3HKaLLxJzwcBkHRVKkVwDnPxrRHTfCEOty9h/3Dj4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Onzzp7/oxTTJRjBheSz20WiyvtXaF5D5fADXTkfCzNJ/vJ0OIPYlCXWoGPsTMpsPww1XGqG/dde9z9B7Wm8Gpylm5Ty0W9sDTYNgBBBtpYu3klJ0vZbP5L2LXGas5NfH/LrGhtZd26aAtpNDsgwJZd60aOaXmz1XfendSsnekdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gfFA0NNC; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gfFA0NNC"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49b8eeb3ff2so28320635e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 11:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788200456; x=1788805256; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OQu21g+jvYzg+hR8nIxI4Zsc1brzVFs3c2vxWfEZwO8=;
        b=gfFA0NNClt535kbQ/Xd9ftznrAlSMXcdp2NW824ufMZp78w9HO3iafhEBE1AwH7ao4
         b1oPVNS08Ef85EcgF1xuvAxiLH9O6AK9ZVTfqW4SLX5q6AV1iMduJ9DuvzDWZmLHkBQY
         Npk8GYlRZo6ST1RjAIjUfaF3fKfa/M3Po5scpDi7YxF1hCRXl1x8zm3jxMQvvtsZd3wv
         y19QSX6t4aGmL6RXQNaNcjH1UCgB/0fxvsdH+iaDvnikc7eUM2EIKQVVGQjWdxjUDZho
         zLaggydGcqoSqBPXwgiooqjX2/CapgKPiPT4g+EIfFw2LPqE6XxY1888DtUnks9/blpG
         3fRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788200456; x=1788805256;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=OQu21g+jvYzg+hR8nIxI4Zsc1brzVFs3c2vxWfEZwO8=;
        b=o4wPHqMg1GBHRQk9fHIrqS4gKoW3K0EXTbXWlEJ+tudf1eCugEba4PAOP4sHFwc9c/
         87mTreC+7PKZ1gRt7Whhcg883PeFzNRoicd/Lv1SHQ3n0iMr43n9SKXXSjTWmjz58ZME
         ArT4U7PGiZIFAXshM5AMbd8kmg4W4tiidUcNiBsZmzJqcdB16ktk1ryPKhE8dnL05nEk
         2MyaHZk1X99dixbo8JQR1dzfDREiZ8CEg9FouO0gE//Qt5NZoZOilHn+BgirVgrup6Wj
         OZNChlN/3FourAcRn/WHPw/3Emge8EjuwkRaYyZwqK4Kk2AkWPGMYSjK07T7vccjxMny
         1sew==
X-Gm-Message-State: AFuF++kLJ+4XU85pILUKedbqxQCsHjv+AD8JF3vz2qsrjYUCp5JeM9PJ
	lFCicbuMsxe0Ze4J/hvbXW2Ik3KcXSJxCUxuWS3M5RN16b0lAPU/PPP7
X-Gm-Gg: AR+sD10lHF+2v8l3KNEr8QWQT80lRQXRwg2Ab5txc78sLbtIWYnhYWeT3u/rm1s+UGT
	w43xLz2vVEP2ldGwQTd7zZE5QRsHsFvpsIVpEdMT9s7NtjfT1f+v+FNOPyC1oo4/g9NpW/y+N4W
	TLXvubwAyz+f8oF9LrFXA8v/QJmcaKO882MpwOJOuFGRo/uAf47Qx6UQ5pU3WyeXWVo7Zzuphjr
	45e0dYGO6ZyClztRwvH34MvsdjPAMBJlZn9uHG4adJfwuQkaWbmxhA+L9YUkdFjZdXCjNCz0sxc
	EkGPtW74gTtXu0Ca5DMBmZyxUX26r0FtRPoo25DJGkenIgQ4UK3DahcZFMuOrIV+rzKOiSd07Je
	YE1rAXgf24GP1h/eEeyLQj8Pq9SLgV/RMGz3Mf6WtvHNIF30A5aT8S+CWapqVXaMQvyYxdUOIco
	VXsDex2wu/UID4afKErOnkkfnVYyN9oNVkgTRSKcmkZ3ILt26wT0bZvniiCoiZX3Q7w+SFkw/9c
	/+HGxZJozO8+OUODg==
X-Received: by 2002:a05:600c:1906:b0:499:9240:9a1c with SMTP id 5b1f17b1804b1-49cdc555496mr39483805e9.15.1788200456098;
        Mon, 31 Aug 2026 11:20:56 -0700 (PDT)
Received: from [192.168.1.9] ([148.252.128.8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce08862sm10721955e9.1.2026.08.31.11.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:20:55 -0700 (PDT)
From: Dale Whinham <daleyo@gmail.com>
Date: Mon, 31 Aug 2026 19:20:48 +0100
Subject: [PATCH] arm64: dts: qcom: x1-denali: Add audio playback over
 DisplayPort
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-surface-pro-11-dp-audio-v1-1-fb9c0d3216b7@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMMQ7CMAxA0atUnrGUNICAqyAGN3HADE1kE4RU9
 e4NML7h/wWMVdjgMiyg/BaTMnf43QDxQfOdUVI3jG48ulPwaE0zRcaqBb3HVJFakoLhvD+4kB1
 xJOh1Vc7y+Z2vt7+tTU+Or+8O1nUDVFJ6DXsAAAA=
X-Change-ID: 20260831-surface-pro-11-dp-audio-394503f0aeca
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dale Whinham <daleyo@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788200454; l=1386;
 i=daleyo@gmail.com; s=20251214; h=from:subject:message-id;
 bh=rb3HKaLLxJzwcBkHRVKkVwDnPxrRHTfCEOty9h/3Dj4=;
 b=0m34U2jSQLU+yNJSgYdPHWwTU3Re1UwGoq0Ng92diwb5aZgzY1W/jRL26WqpaCM9abGwq3uOF
 AyIlcCFxtPMAqxFNJre90wdlT2F0oj45p7nbB4XmDXN6oU1x7OZth64
X-Developer-Key: i=daleyo@gmail.com; a=ed25519;
 pk=M4mvgx1TB2TniKaedTDsO3PbLKgFosJuegXRXPbn2Ds=

Add the DAI links needed to enable audio playback over the two
USB/DisplayPort outputs.

Signed-off-by: Dale Whinham <daleyo@gmail.com>
---
 arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi | 32 +++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi b/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
index 7559557610ed..bc8e00e59dc9 100644
--- a/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
@@ -314,6 +314,38 @@ sound {
 				"VA DMIC0", "vdd-micb",
 				"VA DMIC1", "vdd-micb";
 
+		displayport-0-dai-link {
+			link-name = "DisplayPort0 Playback";
+
+			codec {
+				sound-dai = <&mdss_dp0>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai DISPLAY_PORT_RX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		displayport-1-dai-link {
+			link-name = "DisplayPort1 Playback";
+
+			codec {
+				sound-dai = <&mdss_dp1>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai DISPLAY_PORT_RX_1>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
 		wsa-dai-link {
 			link-name = "WSA Playback";
 

---
base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
change-id: 20260831-surface-pro-11-dp-audio-394503f0aeca

Best regards,
--  
Dale Whinham <daleyo@gmail.com>

