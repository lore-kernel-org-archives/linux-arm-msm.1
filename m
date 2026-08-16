Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D9B33C1B6
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Aug 2026 16:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786897124; cv=none; b=WKWaQb5GnoMiw24VGdqiimN+0lnn/0r/DNGgYk91zeWH09YSao0b3pOUBIksCvie+uTN8PMy3GB4zRjCOpkcouWI3rqXmt091OlEb31QGlAzEizgcQfU39NeyEvMcdfAJkgofIDO3Tp7lynPHYsoVAWTN4nwdQHpweXM4jGRkzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786897124; c=relaxed/simple;
	bh=UV1HcC8o2lo+HDUW5AdLSlTWY/QuTMJBVWHiIzQQzPM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bFDImZ6zIIw6wPUNGtYo6q7h38Yx34gI3wEuQBCw7Xqz8qrZE3ri0s18ANx4i3+ywRErIo6/mm/UXEyK5AKhpVV2Cu8TNy1RDrchpEceC5Jq8tKSfpb055czfy44pjBh9jmi7bGTjG8alW3d4Er9jZy3uUuxR4QCaAPBon9buU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GZQFqsqX; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GZQFqsqX"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8486ac3f347so3186802b3a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Aug 2026 09:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786897122; x=1787501922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3SDYJOwc2/gQDBPl33jAG6mx3Nx+oLrgTvDpzH25eS8=;
        b=GZQFqsqXFIu9aceoKrpKmecTkAV0gzhzcwAhpy3xO8w62cUV90FX00oCxGWvSU/Vg2
         HtyTH+mI37vlaBbF2bSYNs1e3tj2gKo1wEGrh0FM2C74LIox9ISWxxNj5M+BoOabxPbJ
         Stu5rL2zxqfsf1PTFytZJUatQO5UZFMVpuS/qX9SQJErqoLB7qzehXd6lmPglSo4VnBE
         nPEjqD7WMiq4eSaTNK56MbT6wMcdnpWi08bnx8ipA//byXBxm0t//w3Vu62SaXxr3umG
         yWbjQn7kwurX983ImwtcALAIlg95VNcrZr+zA21ELoJ7AoW0Hh1UY5Rfx/Apuka+wWcs
         mb7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786897122; x=1787501922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3SDYJOwc2/gQDBPl33jAG6mx3Nx+oLrgTvDpzH25eS8=;
        b=Fiwprfc8WKavXWVb+IaArlMASyzaR5ghRCwMMkWdd5bhnNo5xR2fs7APzNnuR5E8FA
         VvoYuG3OpmEpR35ocUNqDm5K+9bylGHyr4zIXIHp77E/kPnfztLf8f/Nu0AaCDAcDmEz
         TM1tjJnDwKa1wooySdkIibnI4yT8DoSndjjnVZo3xcWnL2eJKjr2a+kYywM45Kto4ee0
         05tcjg636Bv8HZdhQM9c+oW7LVKqXA2/c/G8BByU1+iafDTjhc8UDZPbsvQkK2GWjTGy
         BGisSNJVrYt6vWlTcugGN62jTCL3k1xXB+SDbbZQYtwsAg+leOuwCLacg4nF+4q4uCoM
         mRjg==
X-Forwarded-Encrypted: i=1; AHgh+RpKPresvXh78DFmY4KuFNdm2fWFh4E0a/YeDtre61tdgNsT5kuLOJqilOejmdva8sVq24n0bAPcPMKORrNv@vger.kernel.org
X-Gm-Message-State: AOJu0YxgOEmpSZHxKNvCWwl+yaKK1zPEzZBIrfucd2GOM6evgq5WKhoV
	wWgOYU8bDspRnIfRyVxh9y+mRGQonMr1kwI5xuBKJKsMszIGgK57OhO0
X-Gm-Gg: AR+sD10VCANYZyxjd8L0/Uo2Sp3sDmq0Zv0V2qkJ1W3qEDDQxg50He/MsVcZDKOylBg
	vpCajaSuuOu/orIz5Uyaz2Vbe/xK16wIT6txWOzMb3ADUoq2VARq0XtozOuW/PiRP5jQHpzhGXz
	kLGF4WywCCirAxb555Z7lsRfBlaQ0QiY4aPH8YF9LZNQFqZuYD84CKL3NorJFSPP7nty2YhURWb
	lwO27r+MywYMDxK7gXI7x/+uB1fMS3u+Kdxh2hh04ryh96WoOebxHHmF98z6W2UFSDBTFl1MDiX
	tkKQygi4NBPvFt29Dd/SCvKJNrxxS8MyKIGHme3AGDQ8NZIO+STycYOXa/lvdzUcwKSsnXrf+1B
	XiRnkB/AvAYhblXACLo6vKq9KadxLM6LXeVEpL1Sg1BUNhx2nQE89JuKIeeykKjBk1JXG+CKxNE
	1U0fGY2Nb4Yi4wraXlobJebtSzanauXXKiD6uYWcYx1uREF4JOIBoo5LvmwnNdQtrKAXq7syKoJ
	Mo7tdzzEFIK
X-Received: by 2002:a05:6a20:4309:b0:3c4:2cd3:f0bb with SMTP id adf61e73a8af0-3cc576397a2mr21774593637.10.1786897121922;
        Sun, 16 Aug 2026 09:18:41 -0700 (PDT)
Received: from localhost.localdomain ([157.51.221.131])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320d5bd9679sm28969988eec.3.2026.08.16.09.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 09:18:41 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	tglx@kernel.org
Cc: lpieralisi@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH v2 3/5] dt-bindings: arm: qcom: Document SM7250 SoC and boards
Date: Sun, 16 Aug 2026 16:18:06 +0000
Message-ID: <20260816161808.12419-4-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260816161808.12419-1-sreeshankar0910@gmail.com>
References: <20260816161808.12419-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the Qualcomm SM7250 SoC binding and the MTP board.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 50cc18a6e..481041700 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1050,6 +1050,11 @@ properties:
               - fairphone,fp4
           - const: qcom,sm7225
 
+      - items:
+          - enum:
+              - qcom,sm7250-mtp
+          - const: qcom,sm7250
+
       - items:
           - enum:
               - motorola,dubai
@@ -1306,6 +1311,7 @@ allOf:
               - qcom,sm6350
               - qcom,sm7125
               - qcom,sm7225
+              - qcom,sm7250
               - qcom,sm8150
               - qcom,sm8250
     then:
-- 
2.43.0

