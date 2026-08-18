Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971BD41D210
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 08:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787040550; cv=none; b=VumQlXoeq3vXIZWKElgp7UiF4OMfkFIGClIb2dYGKQCtMxpVJYdYfpltKPiXStAXxS+PobmXnHDuGTJNz8i1gqCnv11WM8fU03U8j0lYL4yiHRAsfHyEh31DTBDLfHNdTrNNiVXdLmaR9ohSa7C0/xBTfCk50P+XcksmJj5hRV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787040550; c=relaxed/simple;
	bh=9lh6SnLl8V0+6EkqXPMHz3NbVXtbKUgYWv5JtTJxcyA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HfmN2uwS1/tQRaFrOISK2jdHnRcQMjfJEQ05IENbZSa+L6pTfHA0oqVt2nPLGgbboyXOGfLZGY2UtTTBAQBjiOgzmkHRfsKphvQH0C4gMGRj/rGoq1Ise/WINN6S5jSnMtMDYBYMxq6v7FxudkJI6NLG4+SbAu7cCLmy9ZKFaoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h3mAW38B; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h3mAW38B"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cacb8416a1so41710025ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 01:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787040548; x=1787645348; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8ovohQRp3uO6IS6H5dgbCzXT2FrwL8JP6NNpNzDBnNU=;
        b=h3mAW38BsYjZeHUgtpAJqG0AzgkNFFTZlrl7UcAxllu952+AKrEXOd8Th1rzGLwLJ1
         akMsfwOVGolyAcDf8RaLje6Vh25fXnKfg2MUktDBuSPz3Ia3YluhJmX2+DswYjZ2Yduu
         Y7PUULH98cIbQvs/b+UUzYQTKBpM/H27yepQsFG6aC+QAr6VukzY6ihHcq0Ezcgm0/N/
         +ipa7vsyULKl8v3EhpM4CtAoebJr5eSifAzxKsJfYU+4i304KMD+aXTLI8GBO6umqCwG
         0TLps4l2wj93rcM+82fp2FYYmemyLS+MZHKdCfjdWLYmC+g85YLZGrWhLWGbQ3jt65tJ
         kn4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787040548; x=1787645348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8ovohQRp3uO6IS6H5dgbCzXT2FrwL8JP6NNpNzDBnNU=;
        b=X3AoFhYbTdDbBGgQ3p/LplpdxlJOP4UWH9PyMyDgk2yDIHdIwDiQV61FY0nPprg4Vv
         KGJepFNFGO5EwKEWZcZytLJro3N87fxn2Cz+tIAwgyFtYjUwH/m6nPsGg+07Ngu+Zc/T
         rHTIoCpfq2VJbZJV0SJg+msqYN77OqjitQmb8EXCLE0oX3S4m6lTKOtFXD8l2ObYkqKM
         W62hau7laNRqENobDSGfX6m8SDmoaOF+ji/abyl2/ox4AZ48/TPCfIbmqTP/pTLZFdrO
         OkZBnwblU9DF0oDYlcbjK4E5Swxw9in2xhhsgQpLJNswH/+KT/yLGRJW+2DtjhiG2c+1
         p5zA==
X-Forwarded-Encrypted: i=1; AHgh+RphjGgUdrIsSWIepQFfEgKSnj1PB6WHPJySCTt211EtMa7CTIWqY5dYb5qwfH6gIv+F7KrwIrfiHYzwMLAf@vger.kernel.org
X-Gm-Message-State: AOJu0YyCn5ZIZ51iSLNKJMzC2nC79mQ6wGDRkeXrf9FrvkDu60bFeOKG
	0s7TIzha7UIpvcka35iXqm8aGGFkTyXFnknWkMYfmveMOW4S4zLcvK80
X-Gm-Gg: AR+sD10EaeRbF7sOVbZqeFRSwikr1Ug6ojIZGIGM2aY5anYHtXObEecwBoQ99Kxj80b
	tjY42lxtXvSvjVC5Jqg1IRcRECu5Cr9xVMqYPVzclxjA9GDkcGKq8AP08z1fWzgREZ/UEFf5lmI
	4OODrWZqjK1saMcFKbjMr368WWyIulYk+ZaXIT65kFkqDgaHYH0NfCA51d99vrkU+qlptj8dozt
	ANr2qmsYauZ5mCNK/pv3MWRj3qKGPIR6yI3pMJdU+T3aPtCrdcp9IJZEyp35JWpCiuqx4FyD9c7
	vtfsI3lINa/RI3UAaoIqzBxktguHpgOGQNGqhNiBvFlu4h+ToCe8tgrHNwqCgAmVNRDwGrjVsiA
	bA+XtcfT2l3buJswz0TMe0m3TAQze5kcKiI3OiUeIw07Npby8cieavMF6XQh4nkwDJ9PAnPD4KY
	rmxFfDLljIn87pnDKOf20AEpeEm8cgnKASd690GGVOuBLQu2O1DyM33Md5xO+PvjQgIam/vUc2Z
	VqbIcJ8Bepqu0L5jBmsOg==
X-Received: by 2002:a17:902:cf03:b0:2cf:ca89:499d with SMTP id d9443c01a7336-2d3b0b1f7a7mr335017295ad.7.1787040547743;
        Tue, 18 Aug 2026 01:09:07 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32678dd08d6sm22606290eec.4.2026.08.18.01.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 01:09:07 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: bmasney@redhat.com,
	lpieralisi@kernel.org,
	quic_tdas@quicinc.com,
	danila@mainlining.org,
	davidwronek@gmail.com,
	robimarko@gmail.com,
	linux@gurudas.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH 05/12] dt-bindings: clock: qcom,rpmhcc: Document RPMHCC bindings for SM7250
Date: Tue, 18 Aug 2026 08:07:47 +0000
Message-ID: <20260818080754.4362-6-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818080754.4362-1-sreeshankar0910@gmail.com>
References: <20260818080754.4362-1-sreeshankar0910@gmail.com>
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

