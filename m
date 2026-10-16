Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF18F2D7398
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 04:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792124868; cv=none; b=VD/pXYXHnKhuThel6BBpBBwMCrR+t5yvP3DClEMPrY1RUAgztsOGfFF0B+gcgt7H24U3aSLTCdDEZcTUMbwNKFcFrBNWjs3/egCAzJwYq3AJJyN10QVYiaM5AWg7fkyfqmFrSVjB1+Q7Q6ty6RLvGOQyq1nDnnU0PMn9jaMQFh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792124868; c=relaxed/simple;
	bh=gKbqr+JbhugVzrK4haKucfxH1GbAmaJ/63Ra+8PimmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ow+Rxmem1hpq0t8lVfM3MCsAbURADqD4oLVO1GBstkgO9ET3f/aqGbgBoHl71CE1YcPVgTnw0Pt0LUVbCZpyWby+h3gPE80sLiXzVpKu90x5+SziYbW05Pw+GFcvpiAZ9Hetd9Zi8wgONsMgokwfA32ogEVJvYC3CynW3n/hBV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qE9XFzBl; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qE9XFzBl"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-35ef6b49813so3359094eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 21:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792124865; x=1792729665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rRyq9W1nPrd5M7AXluKRAa4K58WRzpGWnzgIJ9MVQJI=;
        b=qE9XFzBl9jyqW0qjMgcap3bqgVdBXPoEBrfDfWilfmV5PorLJ3FWrq/VqezFhGqBPD
         QUSXPOAhyETm2SawYS+NmOpbg7H7FiEyQ2YhE4toQyxzuYLIKSxdWx9ylCvQ8bhWckOt
         RqHUbrCpcc4UKTbbJEAU+/ix3JZDcxlSzKd97QoVeFCWG7W6EHBP7C+W8t8G5dbSDWh4
         g9G9KbWaFaqQKf6CqeTrPBlI7UhqoV4ZPJtGV5TeXWDTAzLLe6QR2Ab1V4My+Zqo9vmT
         Umxn4d0sz4+ebloIx8y8XD67YjuNGL4USKsC3lamrvzwe6gpCtueeTV0TfbaVhpC5W8B
         YstQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792124865; x=1792729665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rRyq9W1nPrd5M7AXluKRAa4K58WRzpGWnzgIJ9MVQJI=;
        b=zFonR3C9Mma2krF80p+5RkZRZ5tIHjus3Wg5b6sVFIDOLnzBAjcpcP+PUdZrmKC6gU
         DtFFTMWb1rBhYBRnm+ZUgClwY40cWSWyhTAESvnrgrRTfz0+wmdltW65NSZVvuVsW8v9
         qbwV/UR5sVUxNn8akIQzQ3gFpNJDya1/D8j2//2MGrIKsBPSxAMiteseZ/sYBXDLmdlu
         MKL6LyN0m28AZktdAv7G1pq00w2uWN/VeubAsNJ92BtfMOcNPQsrqmlTGhBj8bs7MEnn
         Q0XYexMbY2LooAlPo3WZsTE/1YeZxTujhj+qboVQujmD/HVmAsgjz3lH7TAyguN7ldyZ
         jpxg==
X-Forwarded-Encrypted: i=1; AKwUvBw+0T8PH/sq7yXo/HZJglAwyRs/Sh69fso3GwW9rv6ckx18Ats7q/rIJDJFAemQA3yT12iz9+bi058A1zwd@vger.kernel.org
X-Gm-Message-State: AFq9FYKLM+c0rxng4BaoU3bKKs92KEk1mX+y3tuf1qmfB+n2OgZUaZTu
	PHwRJ1oIGO73+OFQEO8DwqkpqD/+bEXSuyq/pDOtb2SNpLmQSIz7ovYl
X-Gm-Gg: AYBFou3ymmbcym98FvS/Hf0wY3HwstAfVRcRjqDugc2dgZKYlxeoDNn/mMxwnR03Yjv
	4DPdavdVYnKM1/PdYRxpHgU9EhwhXDo9uAc7NEYWLjlA9tSuoFj9adLpvPhWpK3ny/DM6wiVGii
	2vW1YHWu05buOXY5VRpRRYCMDIdO6jtjlxHS5sFrLlnw9sS3qPtr+MgXufPWjRs+36rXkHE3eAo
	saJhPdEcbSwZJ5x7jq8oOh9GRErIMXkq8hjjhbZZ1PlCwXLC3QGq3YyGkSpWZIGjH4XneTxF4K2
	uKI0e8OsG5vbTwYlICUCd+H+PddYNWPtjXC4SB5U2gr8QQhIJRZqAnHOyvtO6d+Dt4G5pcSLiXp
	efbu0WlA9HBIjVtgKqRw/D7Xrbo0v4JwLv+SDCiOzjmrvxq4y0sqU/G0iRnPZXE2POLcOZUGAh+
	TDsLah4eKGG5UbpYhMplEOg8RSR+IVUlOvEYErN9Na2wzfPqNLQj8GrvntH2YvmBZV55TMei84Y
	2z0DSpPznvFVkEfLIfFXaZ+yo7SY+VjnPNwK9ojOqcQSymrBkAi5A==
X-Received: by 2002:a05:7022:ea56:20b0:17f:7280:134b with SMTP id a92af1059eb24-17f72801559mr6984891c88.30.1792124864684;
        Thu, 15 Oct 2026 21:27:44 -0700 (PDT)
Received: from localhost.localdomain ([152.58.201.32])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831b75be5esm2644712c88.16.2026.10.15.21.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 21:27:44 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: andersson@kernel.org,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	konradybcio@kernel.org
Cc: danila@mainlining.org,
	davidwronek@gmail.com,
	mani@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v11 3/5] dt-bindings: firmware: qcom,scm: Document SM7250 SCM
Date: Fri, 16 Oct 2026 04:24:30 +0000
Message-ID: <20261016042432.824-4-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016042432.824-1-sreeshankar0910@gmail.com>
References: <20261016042432.824-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the SCM compatible for Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 037d4ad8f..0cbdb3b2f 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -74,6 +74,7 @@ properties:
           - qcom,scm-sm6350
           - qcom,scm-sm6375
           - qcom,scm-sm7150
+          - qcom,scm-sm7250
           - qcom,scm-sm8150
           - qcom,scm-sm8250
           - qcom,scm-sm8350
-- 
2.43.0

