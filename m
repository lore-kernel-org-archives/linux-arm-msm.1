Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792424869;
	b=UVVU5IY+r6n7GFmuu6nLv4GUu/k2CuyR8PMv6+p4xdBUrOrpwL7BHUQr8n1eGpYP0Ix2
	 +Z30e3F3IsfUArLFdIjxUuV3R8EK0rP4ZpSeUo4wmyxrTt/EzoV2sLYvM7FO4+EfWNJX4
	 pkuPkzeUep5gRTeIdTW6Z8tYEe06Wod4+nBbdR8hkxJrvX8mPul0zO4UZnzbdGkz1bJhl
	 Uh210ckkV5XpesBMLGtd7AgcGcntN7gMTPzTD7IecA2QzS1pwCwUrSGk0tauIpDp/P8+v
	 VhYEC8Es/9uA7BGgtmR4cocswBipebSmsKq/q5JdN8x2lQ7dX9YZNG5PhwBC8hKn7Kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792424869;
	h=DMARC-Filter:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=jlnB32LCHA0I4qZyo/tYM1nPEXySNpUnvzRunyvEwr8=;
	b=P3/eI/BJpCN9B4CFMMEuNrPQCdD3WGEp/aDXJiQcVzfzoET+mSox9NQ3A8WzdSvUqMVf
	 ILAHhZ8fcu9RFD9GbbuqMbIr7RbaAAGIT8EG7oImFztX1JYXLMteAG6uY6JRt98QwQoHD
	 aiZLuCvp08qaO7MZumZf9L/F9OVyjjaT24Y5rcW6qooGWzDVmTzhejm8hUOzSzQYa9H5m
	 yveVEGAXRRN4ItHi2m9C+aX3wmcwdq1JQQ+cI0v12tcE021dodI/bkfoTfaHeKKlJsP7v
	 2K9V0T41eu5vYHCDqshYcgyiOa9XJJyGUfNdvgdX5RROM1zJj4ZS+4+7pe9NEmSPJBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mentallysanemainliners.org;
	spf=pass smtp.mailfrom=mentallysanemainliners.org;
	dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail3 header.b=T7IYp1Fk;
	arc=none smtp.remote-ip=34.202.193.197
Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90A260820C6
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 15:47:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B90A260820C6
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail3 header.b=T7IYp1Fk
DKIM-Signature: a=rsa-sha256; b=T7IYp1FkAxva6r1yzogNTO2l9NH4Qm7bBxgAMYLSsEXaVlmZ/hSfysdkmbYfS6A33AEVeqyyh8jVF1VLwzTDvuRVPNKpkPvviyiNTjWiJrJ51tDGvQWPO2aCRFQGtnL6EhfJe43Gm7mlAI2J/hr+OntLhPXKuRJ1hBGqq8DeX8wUN6xduqdBpY1PgPr04Bgmvid5oEL3flmUZ3ucTPwNgUWmIfDicYFmJ3SgPqLWMfZOV3l0Euu2KmLs6RJblylA7CQ/GDCRPm8uauL49nInp46Yi/GUmfCs09iXTDw+AEhRnGbTdKIic7jaZ7wpkDeINwjoas/Ieq4PstEXpO7Nvg==; s=purelymail3; d=purelymail.com; v=1; bh=LlB6iypx0SJ2C2sZVr+0cmFUBBfczV79VPZDjZQrLmQ=; h=Feedback-ID:Received:From:Date:Subject:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-arm-msm@vger.kernel.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -415248943;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Mon, 19 Oct 2026 15:47:33 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Date: Mon, 19 Oct 2026 17:47:22 +0200
Subject: [PATCH v4 1/2] dt-bindings: arm: qcom: Document Xiaomi 17 Ultra
 devices
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
Message-Id: <20261019-nezha-v4-1-19c1e31eb255@mentallysanemainliners.org>
References: <20261019-nezha-v4-0-19c1e31eb255@mentallysanemainliners.org>
In-Reply-To: <20261019-nezha-v4-0-19c1e31eb255@mentallysanemainliners.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792424849; l=1043;
 i=igor.belwon@mentallysanemainliners.org; s=20251104;
 h=from:subject:message-id; bh=LlB6iypx0SJ2C2sZVr+0cmFUBBfczV79VPZDjZQrLmQ=;
 b=wuPQeyMKx2H7/Pe6ardSaBn30Kba4Sw7PXSof7bLFMX5jU6/iVYaJ+Wa9JicWZEL5AjVKYo8y
 g7zvLjmANAsDT3XocysgDat1NtUVTyjbXBSHjYkYhrX5cz9ktVhyGks
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=i9++1bbnBwoyc3uhTaetGXS1TbBJoS0mcxT59GrpYh0=

Add compatibles for the Xiaomi 17 Ultra devices, consisting of the
EU model with a smaller capacity battery and the CN model.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce1e..6d9e6a81b419 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -173,6 +173,14 @@ properties:
               - qcom,hawi-mtp
           - const: qcom,hawi
 
+      - description: Xiaomi 17 Ultra
+        items:
+          - enum:
+              - xiaomi,nezha-cn
+              - xiaomi,nezha-eea
+          - const: xiaomi,nezha
+          - const: qcom,kaanapali
+
       - items:
           - enum:
               - qcom,kaanapali-mtp

-- 
2.56.0

