Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794117268;
	b=Gl1vTbWtmIwz8DtYAri2CKYVgbiV4wImMfY5fEjqzdjb0WYhhw6pqBSJp/v2CJZ+KL/D
	 oDi2QxoW4Rzux+HRrt/ZB34UxzfgcGyPihNll/eU4PJgdGIHAn3frH6Pe9c2W3dajV7h6
	 EPh8RUaozwndgLfRiFYyReYDdACHIAoVD2uRBrGTNPW+BZKsnWpFJ3LL/Jk+KVRLZD4H1
	 KWfbY05QLbOSB8sQ2ZfjjwnUyKEcLaZnnIhMnABGDL5MvHJVDCXWkxaa162P8Ly/BRf4V
	 vBMTR6qNZkZpy8fp+ZrES57/Qhrlm+LYc983+bndasv7v4X7zlia4Ody1Bx8jLbLkew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794117268;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=ZK9lVcxiGeYvbrytWguEJMUSVjQJoofRhVDH2bUKRs4=;
	b=gmwX48F+j2CGpthM2s2bDFEMlKJOwnOVXgkLnlBg4+uFOtU/cC/IN9GWzkrnPGRcIq3y
	 9rlMoql/CxtCifejA54OqEMH1dP4d1Fa0YhDWSohPYFq0Cn8RUb3DnjtuimMpIJncS6XV
	 za3JMoLQw9pkcDnryVB5UaSaMfiGMt1bxD47adRcvgnF1gTclkIM1k2ZVQDMn/ZTVLRx2
	 qtmOfkSCGz5cSAYaVReuHmRQ0cYnsEqCEXax7I5ge+D1dDXD4aKgeHLMJYuIl0SKBwlRS
	 BzTPP9Miri5POMt0Mss3XLMms1AA2vr9SAryZKtMe6EXsEgOcyJRP3JQ7BOvx3pB+Hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=boTBU262;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5B8606A31D
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Nov 2026 05:54:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C5B8606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=boTBU262
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso186940f8f.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Nov 2026 21:54:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794117267; x=1794722067; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZK9lVcxiGeYvbrytWguEJMUSVjQJoofRhVDH2bUKRs4=;
        b=boTBU262RK2YOd1OLyUG9d3v/UvvA/mj/XbBNpA3gniG/44sfnl1Y9wzA+TD1KPKLT
         qWsFj22BNFuIzSq8hENGltILEIWlyeGRem5pZoivV7hO3Pgk386f3yVkAyfl9prUI/qg
         6gAE4nad5RLyYQeGWWacm4wToKmSlnYS4px/zyMKuDiJWgA6VJieywpNAOIjxh7Hz96v
         /YY1yrPJt2U0vNin1sQBBceCWIvH+qbLoCsMXUmVOmKuzVC94LT6BqLjb3zOOtG/z77F
         RomGuVgqNNYdqB2ICoAP2vLSk4hY7Nr7pdHiFMEIJBtRQjF3dkpGZkLFLCg83ElrCMnL
         IhYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794117267; x=1794722067;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZK9lVcxiGeYvbrytWguEJMUSVjQJoofRhVDH2bUKRs4=;
        b=XS64OrzBjNHnFOF46FwPwjJPP1vX9dojsT0or8A8D9LnrIRvEE/2UssuBFVgVgWWKM
         ZHVMzm8wlIPELPL/M1zIsTJssbnyxWGi+K0ma78H6wP1BOYEDbyti0N3M3YKarSVRhcU
         kpFeh+fsY+QygpBpWdfoCUAJvxFtkxFbkcoyfIiJ3eXpvrrjYXLROsC/Q5m5JH9zPZTJ
         AoptUUfWQ6vVrRi3zd9keKwWJA+ib4yJUeGLdUlYLQ5pA5caKONaGtUKAGshxsMfsZd+
         VpqAPpkohp48LN2j1NUyG470vkLZwfGoqFxA366xTOfWNHppIJo/qWw++DMjFw8TdT6w
         Uj9w==
X-Gm-Message-State: APuU4Z/KzOedU/H4JZYGAxcHTs36fyXurJ4+7/LpFvQULD0qMw1mDYwd
	fx1XieMv8R9ooYImExUXFc+edMeNdkzKJxLrnUmwXvsvlGIX9bwrrk6f
X-Gm-Gg: AYBFou2OaIWPtz1A/Fol/mO5oYEoU1zyGsLMzvfGLsbEpWdTaQB5D0QsroGlNSUXBTP
	8MyKpm13jr5AuAo5/zWvxGm8QkfbKHjMRyIjih7TMIK7H+0KscLYH2MHkh3aQsEJpgZis8Q6c3d
	nJIZzbXpJFkA9WsxerzP1hXGcugncNiRxJTcsHxoe/KYzMkix51R0rr6VLmF6fskcppVtm/FX40
	GL/Usv8tgaVC9Z69U7TZzwef8n5r+6ivx6TdTiVuhbkTUZlg21TCeB0PsoDx7AtF2FPdVcIYxvO
	MqqC1O+dJWlrd/0zySaDieQozbpyowzTsG4fQZcWntKhRIwnJbikNiwOfniN/RRIczdcAYMhEMt
	17fHjCKInKuqS2TxTYEn/6zKhJOYQkbGPLbWhhMcZEU2RPIjDQFtwQwbwt7MF15MQJb/4CFQCyF
	K5Xc3M2Udn0Dw03gI5qPdRruy4A1Z5ClPJaRDatkDYwVHy3yh8wXS9/2+1zJLKurrvJmzo2X0mF
	IClH92I6Ti+v2woaWMU1ADvuDVjhszf0OJs5v/ss4GhK3Y9Cj/YnsRxhRDw3J/iGzXFE5xgP/i7
	wUlTZAHd1QQMIN0gPbx/3nfiVzsoDyuC3QG007hq
X-Received: by 2002:a05:6000:25c4:b0:48e:3b53:e100 with SMTP id ffacd0b85a97d-4958d3fa337mr1211047f8f.56.1794117266571;
        Sat, 07 Nov 2026 21:54:26 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4959783fd04sm2113363f8f.47.2026.11.07.21.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 21:54:26 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Subject: [PATCH 0/2] soc: qcom: Add the SXR2250P SoC ID
Date: Sun, 08 Nov 2026 05:54:03 +0000
Message-Id: <20261108-sxr2250p-socinfo-v1-0-06244862f5c6@gmail.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHsO8GoC/yXMTQ5AMBBA4avIrDVp6yfiKmJRNRiLVjpIE3F3x
 fJbvHcBYyBkaLMLAp7E5F2CyjOwi3EzChqTQUtdKyUbwTFoXclNsLfkJi9MkpWmKUpVQ8q2gBP
 Fb9n1v/kYVrT7+4H7fgBvva7ndAAAAA==
X-Change-ID: 20261108-sxr2250p-socinfo-a250c0a83416
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794117264; l=687;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=qGwquROsopcDhM+Z4ThxOjcRoNWve/5H+Br9FxG/OS4=;
 b=T1HexMag4r8AxnhjXYeWFmzK9ht034Qz92V/qKDI11bVg1yO1o2yrrrMK/F8XAQrq9fGEyfLX
 3VaReaJcjwXA7VKOdM05c2yaseMFK8VETIa9tiPtBP9L5mkPMHF0y8Q
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Add the SoC ID of the Qualcomm SXR2250P (Snapdragon XR2+ Gen 2), used
in the Samsung Galaxy XR headset.

The patches were written with the help of an AI coding assistant
(Claude Code). I reviewed them and tested them on the Galaxy XR.

---
Stanislav Aleksandrov (2):
      dt-bindings: arm: qcom,ids: Add SoC ID for SXR2250P
      soc: qcom: socinfo: Add SXR2250P SoC ID

 drivers/soc/qcom/socinfo.c         | 1 +
 include/dt-bindings/arm/qcom,ids.h | 1 +
 2 files changed, 2 insertions(+)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261108-sxr2250p-socinfo-a250c0a83416

Best regards,
--  
Stanislav Aleksandrov <lightofmysoul@gmail.com>

