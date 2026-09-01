Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30BD476071
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 09:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788253580; cv=none; b=o8NElDUq83jgSZgl2almBJVS9uyTvFmsYPy8LpBfHKrCfWgssoQ9XNS+lTbTMiWkQHbwYuNrb5S+iaLYJyz6zkB4gg+vspLrUlQrBoPPQB9zp42ajAGgFynAJzsVc3fOXBNtXIj8Qq5JnfqcIQi2yDYkxApn6bpUV/aE76+kb/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788253580; c=relaxed/simple;
	bh=VLMCTblWAmcjvlydjiDQOaM9EY30ui47eVm7HFZNWD0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=sM9yt9p31AHZ/Ay1ulb4kXOnOc3Nohm4WvF12X3njQgTpK+hWxQGqyRK5vxySfu9Y+aDOoufhmCQpXchEdsi5c4Pn6wv0htEBqOhFt5u+ASEXzWMHXQeVFAguHKIKlIsBOI5nrMUKcXDzeWiStN0DCSHmJqCqc8HBZz8pSLk+28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=zwdczwa3; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="zwdczwa3"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c1600d040e4so152120666b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 02:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1788253575; x=1788858375; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4RZfyoM5tD0q7WqcULgsURT8LaR6zOJsyJgPkVRkoT8=;
        b=zwdczwa3iQSrZKHoSS7DDDQ7f3Stbep0b0Wfmlg1EcCRX6SxYF/9MoNo2WEoq/01zy
         /PXQNiP2zkkWrAiEovCOABUVNTGVStO7sYtNrDIyWSa4R4UdMvM+0g6LCnriq1vW6PeB
         NUGGb4hwo72xPuhxuZ66Ni3bPLOeERjb8E9WCr1NBSl/x6a6LF0RR+huuBDHTOiDIDeN
         +kyHp8LgENnkYZkCXv7OxWlF1z7gzHmPkSYLajmA7T4dI+OMsMdguff9bvHItgxUwjiz
         5EeBUrRo/EiIvw2yTfB/mo0c5WoB1EBNk3zes/W9Rma5KmPZxvbkfuE2IN/bMN7VA1Qj
         4/fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788253575; x=1788858375;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4RZfyoM5tD0q7WqcULgsURT8LaR6zOJsyJgPkVRkoT8=;
        b=rsuFzxVZw18ChRGT45ANXosokmQuT9f6mOUvnj1Byem7si/HPotmVXh9MiESI7Jtsx
         3eFo/DDob8bsEtDtOQwvE8yE9syffItdQd0X7vgglfgikG+JylV8Bp/A/BAeZk9Z806x
         k8C0QzCFV/zK57JSYWH/u+FIM9ne/4haWUZk4IJ89X1Eb+CMYCH+WlIVAIXZWQUK25W9
         HlmcFv2IyE+/RbtJ09bQ5oHuQWQkagNRmwiSx/DIjYQ7J1jelR6BCoo7dj85+K36Fdgw
         WK3vdfN+xaS3U1UR5p8QSzHn7THyXa2gTaJoUNh0H7+9iEzCliqTXokiaC5pJcj29WRg
         vUHQ==
X-Forwarded-Encrypted: i=1; AHgh+RoKycA25InD8q11OhAV1pdgioqTawuDDJbaRzzwnFLbn8o8f7NNCTlIX5Zo1IxEHehxck9p0TwcRfi3NlJ7@vger.kernel.org
X-Gm-Message-State: AFuF++mkbLQcsIKFLhsxkPNQin88PKDVe+WKr72ow/mMkb2qasKJuy36
	xjX1XEeiKH0gbUEdm+RqFXhFrXHo+LQsWTRxrGikwU2h5sG6dfScaFwH9ygNrhsfgz/1qDwZWvu
	ThZSj
X-Gm-Gg: AR+sD12W6GNSkxOvJi+rASCcGAIsN7EmQJPFThkPr6jJg9aeMAz+3zNFqclp4C6fWvk
	+arlfA/EBlo5/19uqQScpVIbG/P2RV5+6/tSOtcBaelBOaMzTa1VQ2hk3PNx59SVCPjkS0iOc2b
	rI8mQnRvI3A9jezWGXYIhXkxTEnfva/Lc+JLHTB63gkAIW/okDvxFB83gvbn59UmFl61tTlqNUR
	g98GFSXSVwzU/WSVMxIG9K6LX1F0pWlwiwTcXppyTc4w+S9rUVV92G+z6/BwllFjQnoMlX7BsO0
	2lYmDApHNskv7vk5nJd9hnSz71vwLJn+YGG3L8S9P8kdWqqvsXp06DRASoXkCk7tuPVbIlQUljD
	FNtAWt6goC7Kky5fm9qJq2jOMZZ/HHXSecQ7hlPUFfdgm4J3zyaqd7BWoPc1aA4H2iUhwms97Ii
	dx3LwOMKDTLiVR8pxywJ0UMP1yrq9WbVeiha5/hOO24fBHEyj6H7bDGyDNW/Z52TcVpKaRQeowA
	qWlGys15mp1XtTa66Md/pK6Ml18OGQ0INGIOO7O1vE=
X-Received: by 2002:a17:907:80a:b0:c15:a7b9:2ae1 with SMTP id a640c23a62f3a-c25b917f381mr253265866b.6.1788253574737;
        Tue, 01 Sep 2026 02:06:14 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255ee7335asm525484866b.27.2026.09.01.02.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 02:06:14 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 01 Sep 2026 11:06:13 +0200
Subject: [PATCH] arm64: dts: qcom: sm7225-fairphone-fp4: Disable PMK8350
 PON
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-fp4-pmk8350-pon-v1-1-e05937e9c860@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrB2Ixkj1KuKixpl2FGNIrAji3
 U3b5Vv8f0KkIBShzU4ItEuU1SUUeQb2/XQvQhmToVRlrRpVIPsK/TI/tFHoV4fGjGybWjMPBlL
 lA7Ecv2PX/x0/w0R2+27gum5fOokCcwAAAA==
X-Change-ID: 20260901-fp4-pmk8350-pon-55dfc963ffb5
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788253574; l=982;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=VLMCTblWAmcjvlydjiDQOaM9EY30ui47eVm7HFZNWD0=;
 b=OLfQFq5Si7pDMICrd4APmwBWRMw+HenJSjX4WknR1Em3H7jb/DuDAJluqkvwR6PHLVY2xqAh3
 MwA6BCej4YeCiTxRg8BftPuiK9yE6nY0uI3LT7wbnq1CtTKNsD0eubw
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Two PMICs on this phone have a PON block, the PM6350 and PMK8350. Only
one should be enabled at one time, so disable PMK8350 PON and keep the
PM6350 PON.

Fixes: 582e7c1026fa ("arm64: dts: qcom: sm7225-fairphone-fp4: Add pmk8350 PMIC")
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
index 5d20ad93b0c5..773304b4759e 100644
--- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
+++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
@@ -992,6 +992,10 @@ xo-therm@0 {
 	};
 };
 
+&pmk8350_pon {
+	status = "disabled";
+};
+
 &pmk8350_rtc {
 	status = "okay";
 };

---
base-commit: 89c07d98716a13454ec3fd9f97689e812cc71bd4
change-id: 20260901-fp4-pmk8350-pon-55dfc963ffb5

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>

