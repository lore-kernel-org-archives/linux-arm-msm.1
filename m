Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67DA150276
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Aug 2026 13:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786886240; cv=none; b=lMEzbvnugcoW3xIxO3ccXRBpKlE7wctc5WZ2XY9AZMe8ynPTmD9uj1726ry6Bn9QuD5FbfsxMFc757LN31ORV7P3gYkk2ZK1LzfpJRrXxGPiCcI99k+CuhnTCx9Q7wA1gw/SAYdnyXNsANznGTxai+gYatLLElSXTBbLPtVMD1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786886240; c=relaxed/simple;
	bh=9lh6SnLl8V0+6EkqXPMHz3NbVXtbKUgYWv5JtTJxcyA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LEVTS9hf/zsEfcluYmixvgH+M6zyrX/HU2jYk5vWYNa3DFgGjw+1j/476b3YVfac1Jne1EZJzbZVpJHrv/HNLCJwztaxr78H8TgJljHXeGQG4kbEZSxnLvYUOkDeWf9OfU9N3GZHVg3Oxg1BQLbEcEMlvYDPQeBuStJC9+e1N9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bmOz/1gV; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bmOz/1gV"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38125cebfdaso3923735a91.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Aug 2026 06:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786886239; x=1787491039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8ovohQRp3uO6IS6H5dgbCzXT2FrwL8JP6NNpNzDBnNU=;
        b=bmOz/1gVcR6ERdXCY4tLCk57ymrS/g98sSiUme3dKv+xQ5sMgoC/EzH4emwO29XxLV
         a36aD09e4/340bdouXhd1ezxag3hdM5p98qZ+6ZTW2Uxp84iliI34IiOG+dXRCFx2mk1
         OiHz43SoEe8B0kZv2sreYJa14qGujKnGqmz8slCKbHNeDDlSi3LmB/mOb+RGJQ/tShxy
         nvO336O4BWx+/lx29a8yNAW6CVzon8n5lcsC0mFwL5DwYY5Bim5TNJaHm6bM2PIN0hZn
         hsWHkT5nsIfNzzAXXUoWL4xmRMpES1mj0Z4WywuTuKZoyBsq0XYV60YXcN87xhR7CWm7
         xVSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786886239; x=1787491039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8ovohQRp3uO6IS6H5dgbCzXT2FrwL8JP6NNpNzDBnNU=;
        b=EsUFJxDsZgoIbPswoRyf0uejpmZ4W9KoOEOLJnCWG6L5/KkLDuVM2D9/Jr5tCKCQrD
         a2AwiEcPhZa8tTxYvMxGEKPym9fbxwq02XY5hrI390evDWnQ0RRd4JGuH92fagQ6xgyn
         xrtrbuPRUz2E1OdtwBYWfUCKuWArHMwXo7sV7j7mLeFVib9Kv24KrLjoaMNKeeDax6C/
         nhfpA1h3QkB0qIkoArhJX13S5vvizJ4PsqWMS+JX6WZCg/3qclnPn6q6UwZi5r2wWX25
         6WSZ8g9FkWrYshoorSdtM7FSEYg3PY+QzY8hU9a/k3FWxyV3QI3aYZ7AIboi1KKKFrFi
         LCzQ==
X-Forwarded-Encrypted: i=1; AHgh+RoxKcrKAVSCMJofTa+Rflqs91/6UFv4Zx5sGOIMTU9mrlBnubbreSf9JAXZ9rL1YBJ4AN5IjWtAeivAmQO4@vger.kernel.org
X-Gm-Message-State: AOJu0YxVJh0p7J9HpjGM8Db4yAqARrxd4O6dASMCXMQ0JXpU9fJozEci
	01PVezUtHyx++NmzlgJVTKIoYUCMJu4pHAgw9BdT0RFNIKcPn5bGM/HN
X-Gm-Gg: AR+sD110t5fU0XWzyqPh5QSFV2TGT9RCp3e00eSYw4mMJc4oQ/PbRXfS855ScSqZlW6
	X51PdL1vSVmC/WlzDJqTO8HwpVOxPcPOo5WFz+pxpVDg9FYbnTor0IwkHPwIuS5LosFx1ymOelG
	No9l/nlFmYQ+yqVC6/D8VKBNFB8rQs3lRH6egxlQ6qAm4ihFCc6LXFi+VhFslAZDC5zoyfxbQ2E
	Nhtp9OkJM4W03q89hbyyij/vFYE5tlH6V2NMetmwrr02bNGAZuxsPPBJcgxGEba2/dVyTM3BBgY
	2g6Ms/+0yGecVMbs2uHtfur1ikBd+GyPoRJtuS07mlxdSlDupAJ2adFayubHG8T+kR//TjgpTyQ
	PrJ6g3BV7Ei5s9Dh3J+FJ7qWZQu9tFrqQy0RcxiXgEpRPDotB/qQ0xtMyADTZPUa1RSjNqvDhdk
	0zLX+X9W/NHiV2n2yPvHGGpOuZv/y+DbOFgMVNNmHpZdZjga/1VyjwEe87WQj7Ch/HRRo7zI1Js
	ZE5Tf9a6tNW
X-Received: by 2002:a17:90b:3f50:b0:38e:6f90:eabd with SMTP id 98e67ed59e1d1-3933b7213c9mr19862401a91.5.1786886238756;
        Sun, 16 Aug 2026 06:17:18 -0700 (PDT)
Received: from localhost.localdomain ([157.51.221.131])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1413887e3e7sm29235330c88.9.2026.08.16.06.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 06:17:18 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	quic_tdas@quicinc.com
Cc: bmasney@redhat.com,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH 2/2] dt-bindings: clock: qcom,rpmhcc: Document RPMHCC bindings for SM7250
Date: Sun, 16 Aug 2026 13:16:45 +0000
Message-ID: <20260816131646.10551-3-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260816131646.10551-1-sreeshankar0910@gmail.com>
References: <20260816131646.10551-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document RPMHCC bindings for clock rpmh driver on Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index d344b3386..df9e37f90 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -38,6 +38,7 @@ properties:
       - qcom,sdx75-rpmh-clk
       - qcom,sm4450-rpmh-clk
       - qcom,sm6350-rpmh-clk
+      - qcom,sm7250-rpmh-clk
       - qcom,sm8150-rpmh-clk
       - qcom,sm8250-rpmh-clk
       - qcom,sm8350-rpmh-clk
-- 
2.43.0

