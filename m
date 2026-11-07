Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794060997;
	b=DJMP2gycoaNC0jMQuLal9T5j0muqgklyGSwyZiN9TNIcSTnd1RVuzozGveFnwgtAgwt+
	 2tMiRhAef/pR7IzuGJ87IZz7JfbfmUYsAFHSAWBENs0aZ00Fg1mojtfbqmhrVmN2+/M31
	 kvKtkexbJI5iKPZgpeThUzv4Ani2jXT0NargaSAl73NDXpRrT2HrCqSmoHcPwY3iMSvky
	 gMK2pOJIx+SzNCd7D941BtZOqq5DBIINsVS0LAwPZlsLk6UqJ5ZKr1foCResOO3bPnDqs
	 0i7dbMR4laudWo99X7YHuVcPqZ2zP8anS+ADlh4RwjKCvHpdFpB9cQKXIsDSG5aWl8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794060997;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NPDzjIR12JgNdbXICHbZZJFPUuiNbjBtyKXnk1/JvjE=;
	b=SMmoyZGKFV25IvBphnjuocO1Y9BS5n9hOj+NBCvqeN+F57DFCk3C7GRmhB1zx77TjbvR
	 zbg0uzkzCtt6vIEHJcKDNN2hsagr0AKuqFPTxWAv5YjvsIWH1VIf4RtrqhGzkyWA9OSvR
	 qDCqQxVfW6fcNPSXWzL23mBcBfb4VZ5GGMM7/yItPiv0Yr5xyOuN8xucblEQyYh8b8nwe
	 FOPB2fQj2GZceUTV4/uf9KyaZgjPL3xy4IuAzyHJyk1dJrH3BMSg9oeC3KdVreL+sFtyf
	 kqKk7gByqbZ3syAaSEcDwfNoe4R4o6M7LjznDBlpT8uV8OAgnX8yuYrpqccLUXdljmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DgsNWJML;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8C5606D809
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Nov 2026 14:16:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE8C5606D809
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DgsNWJML
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3b0b3438540so918273a91.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Nov 2026 06:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794060992; x=1794665792; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NPDzjIR12JgNdbXICHbZZJFPUuiNbjBtyKXnk1/JvjE=;
        b=DgsNWJMLaWLaY7DRlU3QPpnB+WCMugD0AjOdjiIV10CyVDff0zqfGWYulb2kQmxGTs
         lpVx7Z0G0BUq4/UZx2qVv3zlh8C/LPFOsXcn7tYps+KUavPbwOk7gWTxq8TKvJmT7vc1
         KYrk5uTdsMb3cCns/IHKigfz3uVYiCDK7V5gNgy+shhIgb8fCr+w2gZhMkEqvM5ReVVt
         FxCSfqx2QaHAvpXsvpSWm4MTRneoW1diM2H/admtHsdGKDSzguBZJqZKLdLTxtlYPbUo
         s2sdkvyiwBtAMwg90+Azb8Lz8F0GxXwLy8zagsEMJjYDXpIxnsmS59xyK/Rxtj7WIoDb
         bvfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794060992; x=1794665792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NPDzjIR12JgNdbXICHbZZJFPUuiNbjBtyKXnk1/JvjE=;
        b=Ysm/tAPjhCJlEvUlQ3cAj0+B4WRSkxDeiLh5d4Auz2iJzCQ5xnjlwzsvRpr2SCvJ6V
         yr9Is3qGG81X4VIXam252kkU5JcxixuVx8WVyiOS0ceYjsKeWpX+Mtw0B1gcoUKM1caJ
         fNZe2qxuzYY93WqMXtIyh58a8388Xpge993mNXqUa/nNbtmlWsqQvcOWjE3s0KtH7zIF
         YcthYujM3gRps37zYsGiJXH9aInkyFzdBdU0GzctVrq1SrOVB2G2JXPwOg5XUXaiLHsJ
         kjSJNcVSb1Bb2KmGZiP2wZFZ3keszpK2lcI/QeA+xko8qXWTeBS6qITyX2trpiknhRAP
         HPSg==
X-Forwarded-Encrypted: i=1; AL+hErHGN1hlWQghr0ult3eyEMxgrYTjXJe6gww8Cx1/f1QO34vjthEbOW8shRqh5mHtZ7sBI9ZrjfKQYZVIxNed@vger.kernel.org
X-Gm-Message-State: APuU4Z97GV5rs86NH9aOmGTfZigaYXX+DATrf8j/+8pD1x45RJM/VLe/
	53ni3F16h8/Xjo+N/6SA04szVPgXIrCuVB+18ZYJn5Wu9i9l99nXY870
X-Gm-Gg: AYBFou3PRTbhXyLv2K2d50BHbs4MMLqeXCBBmCUmMPhe7h48eTxRVzeE53rWSrAxXVM
	cUyHbCrNCDxpJ6vdBy5cG0HLa61lUxtw4nGHI/u6ADYjDVd7P7KQTvlhZRLpZRPMiPvJN8cYYI+
	SQSTAoJjuOX5yqHYWEFTqXWUenJQqyd/V5ezS4WXpKwUVny6XMVy0GlGEBWG9yrHDxgssrUyXxv
	KErlvuNF/CP6qLSmIbBeboJ8Fu6W+JzHTE4fi1QeTAtz+WakEDsnKzTGiDRUlmHm7rc0CgxZXmz
	9Q0qJmt7MadI99baHSH3rZQOwNmtD/RebiN72hCBRX+QmRWvV8iX05Fv/h76LEi9q/d/0kQQ13r
	g3PgIRtKtUT5S/4kFANxMBE75XjHXSicG4+01oJphxdmoB0XJK0Mp/0krZPAx5drTcIAqzvZEb/
	GTUy2S20V5CYikdXxquaziYiPdmB1KUIsRJy2Z927wArMx7jTYKOW3+GKPDOP4a0A3NIYnfx+Qs
	LY6zeu1532gFtPDkW593oV7BCIfujaxi5ZabpJdkAxjb799sAUC7VRFK/0h216hYNbbfmhcuj+2
	AbFw8ph2TgrTztuFTBGg2d2m7WNDTGU=
X-Received: by 2002:a17:90b:3d81:b0:3a7:bb1d:3688 with SMTP id 98e67ed59e1d1-3b0db6bb44bmr5357577a91.27.1794060992102;
        Sat, 07 Nov 2026 06:16:32 -0800 (PST)
Received: from debian.lan ([103.189.116.206])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b105864390sm3503778a91.6.2026.11.07.06.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 06:16:31 -0800 (PST)
From: Amir Hanip <killdeath104@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: abelvesa@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	killdeath104@gmail.com,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	barnabas.czeman@mainlining.org,
	a39skl@gmail.com,
	konrad.dybcio@oss.qualcomm.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/3] dt-bindings: arm: qcom: Document Xiaomi Poco M3
Date: Sat,  7 Nov 2026 21:14:30 +0700
Message-ID: <20261107141432.39099-2-killdeath104@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261107141432.39099-1-killdeath104@gmail.com>
References: <20261107141432.39099-1-killdeath104@gmail.com>
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

Add compatible for Xiaomi Poco M3 codename citrus, which is
based on Snapdragon 662 (SM6115) SoC.

Signed-off-by: Amir Hanip <killdeath104@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce..8d2e4f0e34 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1068,6 +1068,7 @@ properties:
       - items:
           - enum:
               - fxtec,pro1x
+              - xiaomi,citrus
               - xiaomi,lemon
           - const: qcom,sm6115
 
-- 
2.47.3

