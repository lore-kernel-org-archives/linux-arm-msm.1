Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794262544;
	b=1FtWhg5uA1WIC1/LjLF/18OoyXzdFp57vgATZrkgHAXzR1EB2eR2nuTSVd9DsN2QBXRt
	 Jj9HinFICg2IDBH+fEolIknmRbU+Dxa8gdcka2drCE2cyaKOuEM1eUsk7OFH7fjyJJY1T
	 v7jYUym9h3QnojeLocO8AjkL1oQea6iz4kfnZCq5KMFiVXeZHOCxs19VFFmHS79HQ/105
	 hTnKoKFMVQj49tK7bGT37+9alnhpSuYUv/vgTcpy89T6gqJUrU1nOLRacn+jN5kRyVGzl
	 sIBFcnpvf/hB+l/Xwy7UGnZSGAw+hqFGCY1RvRlJzkHy1Oqc2wiFvS7Hr6DxG7t+A3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794262544;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cnbWzp8SRYw9JefcoG20foTHGQw84aM7Os7qfOEDv2g=;
	b=1w/uGchVq7ujUjLkH+lweTCPO+gdaR3hhIdwERa3ELGbKwO3KSzl6Dwcqm3JC5iRME1P
	 87M7T3hz/6UQwEUH19o0Tz9MACMb+Zu0Pn0lSrg9fb35sHgBBApOZFPBOkMf12qfflu8W
	 7+SAcAvAWNqD/aUWFEW52lveG8N2qfiJtKqrjA59hiDuAJG0iwdp/JcvYkCk/GQWdNmAf
	 vPwidZdZHrrbtEB6wZTT75IFvWkCvedfrXMjtjDFgTqC2/seBwPcdwH0d4rD5phx7PZPr
	 tn2mxvW2dybuAvooT12TUujrYpJSF6+7IOrzH3MAfA8+i+hezSgH3oDZsQmMaQGnD1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	dkim=pass header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=nm3X2TUk;
	arc=none smtp.remote-ip=95.215.58.17
Received: from mta1.migadu.com (out-17.mta1.migadu.com [95.215.58.17])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD93D606A321
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 22:15:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD93D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=nm3X2TUk
X-Envelope-To: linux-arm-msm@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Jz5VysEAlQcAxLlojRgxtAz9V5M3QMUrbakks1zM4k8=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794262542; v=1; x=1794867342;
 b=nm3X2TUkLCtFAcB756h2Sjpim385SJKevpzzsFjEam/gxjtEqGNPmb13cV3KL0fJvJFick9F
 Cwrtvg/m5WlYvrODPKPpfD3gqG5g2pyJqxGly/VGlEKeDR+5z2c42TtCy886+fNM/uXwJB64mcP
 tpxDwDtNuSNC3V6QUW7gROVMac0yPyJh0zP3iuxUrQiC967sL8+G9MB5EKZbaILjLk/wtrWcXqj
 xjnBqO0eUiZJZACy2j4DmfVybZ8BNzQ272jxNC9b7saBrh28QFZKvwgU5009SawVzJd0b1ezFZo
 njTMnQ/iU9BMESPAjkDZQ5hE5ygAZu6ZL/5jWpil6SEjg==
X-Envelope-To: linux-arm-msm@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 2300422c34a38f09;
	Mon, 09 Nov 2026 22:15:33 +0000
X-Mizu-Trace-ID: 2300422c34a38f09
X-Migadu-Flow: FLOW_OUT
From: Val Packett <val@packett.cool>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Val Packett <val@packett.cool>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>,
	Michael McAllister <me@michaelmcallister.org>,
	Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] dt-bindings: arm: qcom: Add Motorola Moto G9 Power
Date: Mon,  9 Nov 2026 19:14:31 -0300
Message-ID: <20261109221453.658316-3-val@packett.cool>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109221453.658316-1-val@packett.cool>
References: <20261109221453.658316-1-val@packett.cool>
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

Add compatibles for the Moto G9 Power smartphone, codename "cebu".
There are several display panel variants, start with the Tianma one
which will be the first one to get an upstream device tree.

Signed-off-by: Val Packett <val@packett.cool>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 37443849d0bb..9c463fce515d 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1073,6 +1073,12 @@ properties:
               - xiaomi,lemon
           - const: qcom,sm6115
 
+      - items:
+          - enum:
+              - motorola,cebu-tianma
+          - const: motorola,cebu
+          - const: qcom,sm6115
+
       - items:
           - enum:
               - motorola,guamp-holitech
-- 
2.56.0

