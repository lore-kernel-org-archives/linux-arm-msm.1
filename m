Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794581550;
	b=qJJ8DF5oqvnnusrWcmAs878eLQKkFrdED4YJVtmPnY+fR1triBU2q9hDAyxxwmwWLqOc
	 0NZSjKKBPGfDTtGvT2m2GNP9APbIdR0fpgriq+b9rM6aUJDDSL4HL5CrsxYyiAHbA3Tcj
	 s9ebq9OepfGrM2W/N6J8PVSnyMpxGD/MaSt5mGWsGLvEPV3RFnM8jLXd8TCGL5jCodD/U
	 Hwf8uRr5kXG75b0iI1mUfpcKQfgylsp8Xrr17TYImEqOKbMY+UZCFxxmUfVGaojDM973j
	 9nsxGdrSLykcPzQ7JKv9jeBwbLpT9lh/wJA1hYdoL7WMJFHn3rYubDIJqBKZgLX3SlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794581550;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=x6mtBBgalchnnplTaE4gth6kZXm1TRJPsm/TY03A6II=;
	b=kkKKcaPU3eN7E3jn5TKqCTkkzrb2/uu3CntImEDLyKtZxb/QfGobi6eKhPVthYjXyG12
	 GtbD1t5BOn0IIN0eIPlW0ld7jT+mJj6e5faltQLxpByBGNLB4SOD3oNoXBNCEnSsKrsvx
	 e5JHkLylOgcEkP1HyTqlGVzZCMZjDDZF8xzq0cTKvtRfemu37MvNS4/OZzBW5t6s6dFN5
	 3XOp+res4vE9buuyqzEb1JcDWlSeIyIFtsswf+Ub1B+ubtrGahTy0woOr6Tztis6MUkzk
	 CWGOJLggxgD9Ab4p9S7BmU3opkwbkrr4uvHuTDfmjWzBJ2N2YkEjf7SeErVQ39KhZbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=aFiWn8oQ;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9639D606A32D
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 14:52:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9639D606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=aFiWn8oQ
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c50a2efbe1dso178974766b.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 06:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794581548; x=1795186348; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=x6mtBBgalchnnplTaE4gth6kZXm1TRJPsm/TY03A6II=;
        b=aFiWn8oQ/Gdg4T0XFGfb0riUMpESOKfoO+blWZhQoaQ3KXBLpAxYHhpASVfVWlv+eC
         hd5Xkd7VZxaaS34+U6oPmvp7dqvXD7S9GrX8nSgOCXXex+j1laODKF5G2z2+tjJAWGOc
         qAiaOWTXBxR+RiZ+STVemTty5R4xbYnIK613+GcMFWOTO3jj8zBx3R3FaIf529asBtYc
         ImLVfQ5UaMskbedLnsU9Qu9C6whXAOZGo7ji3n8sI3PLB4jq5aXvMhBrJdfvh+uU3Y84
         BPj6BYfSvF26pn2G5W0aZk51yHCVjqsU4upU/LCx7kRUaSn6MnJGVrBdWvyeCH03LQuL
         D13g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794581548; x=1795186348;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=x6mtBBgalchnnplTaE4gth6kZXm1TRJPsm/TY03A6II=;
        b=FUT4XujBLBtA+eMrQaIiWiAeYxjZSWGDEqHs4jIuMJvFejBlF0crlgSfvcwkx8+qxJ
         Nzvo7WdA8p/H2JqaYk0bdPpqq6racIF2LqdeYarLTanyNvaWFT7+6h/3kuhAeZyd8h9g
         dMrFY+9D6qmK27xeD/GZrBSY1xOOpIJw0dGPUKvHS/83yNLsQLGkVCCpj2iw4MD2URLU
         HkHvFbjKdFtVTEHq6AbcTPpp0CyrdyaG0mqcFH1AoB3XeNbgxkX4tkR4ihZnPzP/nix0
         ZDoZgtqaJa2ilEvAPM+63ozSz/TpGyIcKSGIqYjWpfNeSCcXnV43E8TGVjITQuo3A9rn
         6dOQ==
X-Forwarded-Encrypted: i=1; AL+hErGdF2EhEauIE+NnuzVP7HYYCRbryIHu15aMNZ+EIA47C5twhWZi0XV88rWaOKrEjK+Gaf7PjtY4bvBsd3+I@vger.kernel.org
X-Gm-Message-State: APuU4Z80+d5NUaehJjIODE5BHbEjpXm0pTnmxtF6rfTcZiNC/jnBSZTm
	pRWNoyCwbAjYuEAv3+Ho+3jqhncI7Fhg43wb9Nhc4e/QPompAnCwnL46Pd0LshXhwWM=
X-Gm-Gg: AYBFou08gjdcmNkOSgJs5bsWfb4aA+zZlVF3tqNFG7ogcUXMCrnf9hAWNofklbfolHH
	Q1fuk6K+aG61hT4H3o8UnRziYMo7vIIkgerFZjpqy/d5x8m9aFSrgMJ2ReIQyBsSc4rPXBH+s1r
	PVXZvGsHzjUYuovv+0py8r6zQW90ylB01ntMy7l6VRH9dgIJghOMMYkqiTfTHxzb7bbre+Dwzao
	wzIUWAXGTnKJuhiUxRliz1AVliVFYZWQxLJ2mudmum+83s+WoCl/vtTBz7uyEgeCm5UrwEIVUY0
	62XC5IhcHvCyDb7ySqn1jCOqiy7SvHYUNrVDa/LFqBgs+pWfCASJb6CuNhYHamBnLQbZfMe+emp
	KjrolcJ8YGNJz3OrmT2NI/Wqv1R/niGcgt/JMmarbsKLoeuI6xZb+U18E8k3M7hZLq+9tAvbT9r
	T/K57gIN0LoQz1uDc9XnIQV94mn/PjDeb9WSG1uJDf0Cn6uDuL8/pNlQ2l6Vrwg2f94jMmJGB6u
	MwQS2fUQJ2H9Kkv8h1FwoKkWzC0ZrEBUAHm9k0BkiXufwjIVm3Ed7h+zoyYaB49A3MPGFPC4xmW
	DjjWfmLUEADySdVeWF2zJ3K4bW8W09nQcymt+zXd4VeoBpGidCHp9JLOmFTBNAPxuuswFFobmlj
	epR9+7yw=
X-Received: by 2002:a17:906:f59f:b0:c3f:c856:fb7a with SMTP id a640c23a62f3a-c509610fe94mr243168766b.3.1794581547988;
        Fri, 13 Nov 2026 06:52:27 -0800 (PST)
Received: from [172.16.240.104] (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b40831sm112988566b.42.2026.11.13.06.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 06:52:27 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 13 Nov 2026 15:52:23 +0100
Subject: [PATCH] arm64: dts: qcom: milos-fairphone-fp6: Enable Iris
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
Message-Id: <20261113-fp6-iris-v1-1-5496b6d99911@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2NQQ6CMBBFr9LM2kkYDBi5imHR1qmOCQU7xZAQ7
 m4Vli95/78VlJOwQmdWSPwRlTEWoJMB/7TxwSj3wlBXdUtEZwxTi5JE0YXmcrWhIm4Iij4lDrL
 8r279zjq7F/v82x9G4vdcGnnXwFll9OMwSO5M5CXj0SHot+0LWuOClZ0AAAA=
X-Change-ID: 20261113-fp6-iris-bf579af01e51
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794581547; l=900;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=eOYybVYmm/vaSHdcDuworLmH2a8ysNCRIzxyd+Wv6Bk=;
 b=Oakb4yTV8EJe4CaVf0hGwMlwSdxXutNjtX2IXg+EVnvMzeZGSXydLJ2z4lMzaqf3VkYczrgNv
 kEoaXwbIYsXB/26LegEkRQcsr03nJhNjnMVCkPp4psMIYflweIFUM0L
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Configure the firmware-name and enable Iris so that hardware-accelerated
video decoding & encoding works.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
index 5c4581410a40..e46db1b794cc 100644
--- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
+++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
@@ -768,6 +768,12 @@ &ipa {
 	status = "okay";
 };
 
+&iris {
+	firmware-name = "qcom/milos/fairphone/fp6/vpu20_2v.mbn";
+
+	status = "okay";
+};
+
 &pm8550vs_c {
 	status = "okay";
 };

---
base-commit: 6aa7dbf8ad5ebd3babf53a4d6209018f86939f17
change-id: 20261113-fp6-iris-bf579af01e51

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>

