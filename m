Received: from mail-wm2-f7.google.com (mail-wm2-f7.google.com [74.125.225.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C84459AE9
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 15:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786549222; cv=none; b=YmYC2A6S8+GFb9OVNb6VDZ9+9GNDHvfm0iZRhwulS4iFT1Pei2VhGp2IsPITXwKKpvtWg6i5idYxX5Adn2XEQFObjD7XweMFuVSg9D09hKpISwACCiLxADnwRPdTuFRr/rNYmqv+jEEfl9uF+zZQxUMneUfaP8QiAv+d5pWgqyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786549222; c=relaxed/simple;
	bh=26UWdpaQDzgnBTtxHw4Cp6AynYdIEUwCzz6rHSHePsY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gSLDGPFiSDcZoIETQaydEiHf8kaBpc4jbDSBKvZcTdPdRrXlC41dqTUBsbEZDU1M5KmvCa3cdBjO6iecRxKVfERHuHPzxZn2swN0TeRxvz+uRZu6VPGkJoWUzZXsgCS3yAUmGSKjl6eQI1OtEMZGSZj6dNEV5A2Sdfezxh9dBt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ferrisoft.com; spf=pass smtp.mailfrom=ferrisoft.com; dkim=pass (2048-bit key) header.d=ferrisoft-com.20251104.gappssmtp.com header.i=@ferrisoft-com.20251104.gappssmtp.com header.b=Ocgb9iKF; arc=none smtp.client-ip=74.125.225.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ferrisoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ferrisoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ferrisoft-com.20251104.gappssmtp.com header.i=@ferrisoft-com.20251104.gappssmtp.com header.b="Ocgb9iKF"
Received: by mail-wm2-f7.google.com with SMTP id 5b1f17b1804b1-49557073245so3725025e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 08:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ferrisoft-com.20251104.gappssmtp.com; s=20251104; t=1786549217; x=1787154017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QbLyQ0GmRGBKkuWyBUwDxJtHBvWoKJlB6ZFlIuJiUYY=;
        b=Ocgb9iKFmD8e5BThUWh5Plr3stK6EIYGFourjDEUPuLuVoyv7VbOioP5lqoeV7OuxR
         e3kMlVui4n5BzV8fI57aSmTYcXrjBw5dAiabcJHQ76apTNtdZvM3EfUoOyucKyynG+ZM
         ygjwqJ8DtfnAiXZJhVPbFE4AamAaZwlRFrTLkecPc//UXFtUbQY0Hs0Nk6UgtziJOIso
         6DceMsfIHj1eK/bZ9+PgDW21FV5nEbkXI6nZ8C7EVQt2dQB2j4mciHBvmVpLDOZ9h9B6
         QsG6yrFmpdnx9UndH4KQ7gcNcSkuBWn6aopWf24p9NqJx+CH84zY83dsp3EaY3wJOGnT
         9NPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786549217; x=1787154017;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QbLyQ0GmRGBKkuWyBUwDxJtHBvWoKJlB6ZFlIuJiUYY=;
        b=lXPPCaU/Nwe/obiLQdnQo7++fU3g2GkszkXzDUFhNMxnPmon8SxmtsZ1Zqow1tFHBX
         CKVsZOC8HAYh7e2+qapcbKJHn88ezw018wbEaB1Vrwhzg19yoap0WOOhOjRteluOEl+/
         HuLZbNfiNlYL4TPdAL+Bxar3BFaSr20oOn3+XtssonBF1qlrJdAQRsXNoXTVR2dCjgu8
         0PgRSuERuhfUbuwh++1nShGt6QzPK2SkbzNLu2otGRcWhcl93ID/xB1Zpyeo+h6rggtr
         fPKTtCGPofpjP6wiZRO2/RrmQD0ftnCfy+frERbd13uytmqkxBFEaOsTl2NNC0WbrBO1
         dJ2w==
X-Forwarded-Encrypted: i=1; AHgh+RrHpc0HE621oOZv/FeDAcZLAGPTaVYb/qTzoRp8d1uqD7pOm4Miu6sAUalkhENRCHKJkQkt4wJLBI1mWDrw@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn3EL86nAR9Oe74WTwe95y/18vnvkX4Y/xp+/QHxp0oPvHDP8V
	itGQ6iFC3vwp+MIudQ7lKffURIyWz0KhPWLGQmIXvlUHXmQ7btI6bHSHdCbNxLZ64Cwd
X-Gm-Gg: AR+sD137vCsNIt7Oh8R8JZyrU4RtkPuxV6QKScXmR+2JuwDHuXMtauXCeB+OMQqNahW
	xcxTzqJdzDNlksyrSKlBn6Zr9nSTCp7AJoPXuO6TkDT0ZDO6r3fTicR9N5hj18Sq6s+GcN64gmE
	IkP6OBB0EsE8bFf524IUSarTVs5hcXL0a1OeY3wQRZzvZbBEc2VQyhxKNaQ/QdAisNtw+6Lgo9m
	/YrbWoKk/sScRDMWdQMmiEG22B3SYBW0BLQYsaywxa+xoM7niq+ZdNf/0g+24GMdNIjQIhMTPbW
	LTSrlCQ0sS2KlwYRxqFi2s8Wr9B8Eplnr1y1fZZ3wRlk70pfAdGUc01Ci7sAOvK5U69GsE8ryU8
	LtXHG5IcUpjDDKJ1D7OS9mNGgLWWXlVz6fgm1GA23EoXjKXMeT/gRgFc768Ati76aTgZBGySD8R
	AcwoYSOZpBjSgoUHvBI8k5ljWnMJ27Q1G33R/vPgoAEj2WEdjH2WtJfGv9/zFXPKdKSs6G+YTW4
	A5pa+m7ovspYpjc
X-Received: by 2002:a05:600c:8012:b0:493:cc25:85cb with SMTP id 5b1f17b1804b1-4997c12747bmr83471045e9.8.1786549217031;
        Wed, 12 Aug 2026 08:40:17 -0700 (PDT)
Received: from zenbook (45-11-61-69.ip4.greenlan.pl. [45.11.61.69])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997c93b362sm23296255e9.3.2026.08.12.08.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 08:40:16 -0700 (PDT)
From: Greg Ociepka <greg@ferrisoft.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: glymur: Mark USB controllers dma-coherent
Date: Wed, 12 Aug 2026 17:40:14 +0200
Message-ID: <20260812154014.123315-1-greg@ferrisoft.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All five USB controller nodes on Glymur (usb_0, usb_1, usb_2, usb_hs,
usb_mp) are missing the dma-coherent property, which Hamoa carries on
all of its USB controllers. Krishna Kurapati confirmed the Glymur USB
controllers are dma-coherent [1].

Without the property the kernel treats USB DMA buffers as non-coherent
and performs cache maintenance on every transfer, which coherent
hardware makes redundant.

Follow-up to the clock/power/bandwidth votes patch [2], kept separate
so the already-reviewed patch stands as is.

Tested on an Asus Zenbook A16 (UX3607OA): all controllers enumerate
their devices as before and a 64 MiB write plus two O_DIRECT
read-backs over USB mass storage produce identical checksums.

[1] https://lore.kernel.org/linux-arm-msm/f92cc91e-6e5c-4375-aaa6-f079a165f4b5@oss.qualcomm.com/
[2] https://lore.kernel.org/linux-arm-msm/20260812083522.774711-1-greg@ferrisoft.com/

Fixes: 4eee57dd4df9 ("arm64: dts: qcom: glymur: Add USB related nodes")
Signed-off-by: Greg Ociepka <greg@ferrisoft.com>
Assisted-by: Claude:fable-5
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -4605,6 +4605,8 @@
 			usb-role-switch;
 			wakeup-source;
 
+			dma-coherent;
+
 			status = "disabled";
 
 			ports {
@@ -4681,6 +4683,8 @@
 			usb-role-switch;
 			wakeup-source;
 
+			dma-coherent;
+
 			status = "disabled";
 
 			ports {
@@ -4757,6 +4761,8 @@
 			usb-role-switch;
 			wakeup-source;
 
+			dma-coherent;
+
 			status = "disabled";
 
 			ports {
@@ -4847,6 +4853,8 @@
 			usb-role-switch;
 			wakeup-source;
 
+			dma-coherent;
+
 			status = "disabled";
 		};
 
@@ -4919,6 +4927,8 @@
 			dr_mode = "host";
 			wakeup-source;
 
+			dma-coherent;
+
 			status = "disabled";
 		};
 

-- 
2.50.1
