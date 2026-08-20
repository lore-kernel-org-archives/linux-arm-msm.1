Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D14E41A4F9
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 11:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787223855; cv=none; b=TWfewd3tBo6s7kZp3JXUSukQBY+2P+YFjSNqRRE3tR3WPOkJzYlTInGVVcu0tz3+FFO/6TfGl5qQV61UatDHFfLO3FkNK8/MR1tBRqPtknmiopHSgQeluI99OK/EMBibCjRmY+/cyQ57x6Hhp08aCGIW23E9DFSkke6Paw01rJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787223855; c=relaxed/simple;
	bh=N28ryJa3YVWA1Cgupj5pKOjeNOpo+ptWos/yBchcvfk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c9saGlc19W/dLLIDiGK6o6WhWbxIMUQPUCeCsagOvizwKGvGU/bIEg0PezoUyS7/fdCbsoOhZO2+k5DGer3dws5rZ2ag/Zo3L4DatqoFcrldj9Yy68WsUi2m0r6s268fkJ/Yk4GMl679AfSk/IbVrQJQlcQaJhsuFQNKB3Oe3Po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dam4yxxJ; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dam4yxxJ"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc16c6dcae2so80672a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 04:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787223850; x=1787828650; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QVAB6pL6BfDoa5OsrighnSVQ76D8cSms3sDyrNBqKNk=;
        b=dam4yxxJst81dgGeaEWMwKBUyxEunncqVwHY6TnKvEu+CBSJEU7YDo1KEY1k8w/Q4N
         dc8+HPWlWe6Zwk3WTPXDsm5F15VnZOZNi+SlV2nyMSuXI20H8FN/+LMcb5WZQdZKysPr
         BeK6z6PDRAJ88Iv8U9vJ6xXjjCAAGv6ogW4hvg6Rvgsa2vHusxbnwI/iyiCyFo4wK4OI
         Ac8dJV3uDo/Irvf+gLWEL/E9KSIYwfG+KaTHD+2Qh9i7YyKU1QIUFqqvSGfb9XpBZcUe
         CFs9BEalBBOueGLW4+nIwqgBAnw/OMLwLT0eSqjGorhHD3QlUJzV0ePJJ0xH7LDCP4j/
         auEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787223850; x=1787828650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QVAB6pL6BfDoa5OsrighnSVQ76D8cSms3sDyrNBqKNk=;
        b=G1x6i/jTbCj8RC9x6WXgYrKPjdYQisu2IMm5uBawoca2Gw77iyfrq1STqO88VeeplT
         KVu/2TcEWpkeNX8+57jnfSL23DnIwv0cJJynQOW8dmKnNv1XneWWai7+uvbS+yOJ6Puz
         wsgoW4Yv4eZJuGKojmAw6sbBKKiqTminVJn6wN4U7yS4trUuchD1Tesb/G+9Tp+9U4rt
         ia81qvgU5FooZL2e+jx3Y0iiSQfHg1bONxU1gEMxoH4TpAXe6rWz4NKU5dFmeLjgh5mE
         ksmOuWaW9DC2NH6BrzEb7LjK6ahkzZ/kpdcplyNSZzrVGxKjXs/a10h3PWa1rKpUc/3T
         qDmw==
X-Gm-Message-State: AFuF++kiU3o2T2Q03H5+8P45SqXz/9aK5Gfo9sSAcQby86XI540zpxlp
	6wAKcK/vpLpimOLIOkNf8TqgUbgGzGmwzxc7IUvPdC5MkA5RW2PIqnrqucWqyQ==
X-Gm-Gg: AR+sD11oPy7vj0zdQCqa9F1kg7A2loComNYbOWerkksCaV/m4k2J1pJx5u0npOQ72p1
	XXNbT3ngfSelYCE/IUY012Rmmf2vxSdusPHjNNKDKyrGY5b/cR8Q/9A3+xQJ2V3L4xWvaE5aJep
	70w7FQNVOxRKfvV4aDEOapcb1NYKmDKoJglKDWV+J2JGGisgs9HbOYCsDHTQgklG112OxJBQ+JF
	vsFisKojcXhomPbzyVOLKLJMV1+Go0bHZibAFju4GosS+wom5OfgCi/ydG+UZN9aOTH14aExBJ7
	TSOQLVG0C27MecpLLR1qhV7vHMyHg+reFytNI3nn/ElHDoisDUxAk6E/LoPVtSiGwC43jETGNkj
	pTcQ9oz0oF5J2nEoQYeJqAAYNK23Y1Hnb4O2TF6LhVij6ez9Z8NAfdpM2LxDCDgWVGFzsKCN7lP
	DiEeJlPvZS6PD1fq9QhgPF+rHCTgV8P/msg9skHFN7QsYCFtQVXak=
X-Received: by 2002:a17:90b:4cc5:b0:37c:6130:7a5b with SMTP id 98e67ed59e1d1-39580ed0a57mr23327925a91.8.1787223850387;
        Thu, 20 Aug 2026 04:04:10 -0700 (PDT)
Received: from thefoxflat ([2404:c0:7015:a156:d857:47e6:8c8a:886f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957fb12145sm6200668a91.4.2026.08.20.04.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 04:04:09 -0700 (PDT)
From: Reza Kurniawan <imkyufie@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Reza Kurniawan <imkyufie@gmail.com>
Subject: [PATCH v4 2/3] arm64: dts: qcom: msm8917-xiaomi-riva: Add GPIO haptic vibrator
Date: Thu, 20 Aug 2026 18:03:46 +0700
Message-ID: <20260820110347.98068-3-imkyufie@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260820110347.98068-1-imkyufie@gmail.com>
References: <20260820110347.98068-1-imkyufie@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The haptic vibrator in Xiaomi Redmi 5A is controlled through TLMM GPIO
97 and is directly powered vph_pwr.

Define the vibrator node using the "gpio-vibrator" driver.

Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
---
v4:
- Simplify commit title
- Add commit description

v3:
- Add vcc-supply for vibrator

 arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts
index abfaae502..a066d9d7a 100644
--- a/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts
+++ b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts
@@ -27,6 +27,12 @@ battery: battery {
 		charge-term-current-microamp = <60000>;
 		voltage-min-design-microvolt = <3400000>;
 	};
+
+	vibrator {
+		compatible = "gpio-vibrator";
+		enable-gpios = <&tlmm 97 GPIO_ACTIVE_HIGH>;
+		vcc-supply = <&vph_pwr>;
+	};
 };
 
 &blsp1_uart2 {
-- 
2.55.0

