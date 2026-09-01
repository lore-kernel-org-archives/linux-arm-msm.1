Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF25F443315
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 07:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788246558; cv=none; b=IA+GA/rJ/PDA0/dTrdETYhFYTLSCuXVHo409t31s6+RwhuLnqcnQTI255Sw9Kd3xqpVK/yOO2QhEpWznntPCPxfR+/7OI+sxauaRcI67bYIJSkrji3aBfv8uyuflyVr1osQHjHGDtTJI08AZMYd7e6fOxFWahNmXaROYR2EgKS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788246558; c=relaxed/simple;
	bh=6sYp6gwLdM8q2X0kWDCuDxQHrC8+z3UsdjNuoTgAQ4E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FCA/uFvX22PvezIO2BO8Nv1OfBcbQLycsaGEJgyog9W31F98rDGaJwTUxmwWhlpv2ZAgVbiVNmP3xTAC9UpNNwp1t3ylbDyw8Sf0Iqec8bggLxK6V4EhKHPP4ftE8F3ronJim1/p6+HIGD2/qodDg4AcjXsH2mYtRi2VOPWHP4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iqd3TB8C; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iqd3TB8C"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3965d3d9ab8so3455298a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 00:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788246553; x=1788851353; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jvcz145bWmmDM17NuFw1MIOBpRinQuOt1aSfmpsmn2w=;
        b=iqd3TB8Crm8vVVDn7O3VnZ14MbuYGqLv37HgF+ppCEQxR5MLaf4aFweP50pqN7cA4q
         wlxPbA2/aziFmlJGmtXDeQC5NfJ/K23wa/HJcu5WGU2Jghf/0rJ/kg08nm5FNkU3itOh
         8imFBAS9DTw3AGSH0U8O6MZ6MAc57RUtvSLElkWlizfDm4oNmx51VKyX8gW4K4nrx0px
         V7dq2e32sMZ6RraCQ16mcGsLo2FmFik0D9QVUzLze8+LqZPHGQMzQJiv30vzdoikY/iu
         9IWYq3HGvHM8fYzujcpSCPczQgUYwxXJyAjJ0jKWfMBUegGMirCubQG+oBIzkz+pnDI9
         MLvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788246553; x=1788851353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jvcz145bWmmDM17NuFw1MIOBpRinQuOt1aSfmpsmn2w=;
        b=nGM4EN8gELhA3OiTo+uS4p2QlThrgMkoQL1fjYzRzPDGnIGX0bse93v5C9pgyFD98q
         gnxBMWs6/TrEct9XsAS1Z3QMVeDhOwA6AxMg5soJC75WSv+TS4gPrrT2kTaCNqmyR8Qk
         FWQWPCQ6290psdlXoN+FXQPc+A2EZG/Ld0nCnnocFuiWOn2CtwVYVCeX3jrBGXOhYwvR
         3fGwllbyLGHM2TEhCdshsUHOouo4+LE688QPbmADQJ7fcPgdjvm1EK55Rh0XuecyM0uS
         NfUZBI1oO2fmc36J06X34MmwOzuRKXUgjW8x/0M8ASRwn0ssXaGJ5VnsdSzIb4+5FMFV
         gpEQ==
X-Forwarded-Encrypted: i=1; AKwUvBy/BZ7uob2jIAKaDm7LrjQL9gAf2nHZViKqTAD/ibUxeKke+i0rkb1vy/N6E36M73pqktU05Yu7g8b553K1@vger.kernel.org
X-Gm-Message-State: AFuF++mBNtxIAXQ6UcSW0b96Ufd/vBStvl+EIGwERN3VHqxwRjuY+Skx
	kMY1XjO7nrOfBDcR+8Lb7traMYE34wGjnb2khmps7cVGhAGiWfPVPfHQ
X-Gm-Gg: AYBFou0npjcojc47igh4FBvCCIPmBoMFII9Yxxx3BR0T9oUNb35m8fvQtZdXRzTZ9hN
	ILZkM7xuk7GsKLwUYBdg7buzNkM1oSDvMd6vin49P4joXbfNc4mj2IlXSFlXpJ5BwFHFDabUjmA
	Y/mdpU9HboUABU+5dz6DDu9Jsf/ke89DPZ7FN0i2ZOw6D4/eY1+WALRpOz/2AVc7kfLY9P5jhMD
	OCCizl0TGXjR2lMv5Hv2QcpU9VwyXuzbP7lBnVPA+n+8ryOQNF148ZKQiMurEskDyhysjeUvZwF
	kqPvxuSb5/Uf1Q648e3wl03nk334ndHP/poGkS6qbBvgsT0td5YgN/kzSMQNEKyaE5tNbNnC17/
	/yTSAk6lUGhUJCmIINlLuBoh/N9K3OaPWG/3Uj4LfbSkjF/Ucv/5nmvW1ZaZrS3U1aMjLaaHFL3
	zfglhe37LgqdBsI1wn3xQxse/tafJmtTuNWdAvs4zeMgmxiC31SQlbIrIwEiQ9xdj32RvSD1xjE
	eT7d9NYvGW7
X-Received: by 2002:a17:90b:2b4b:b0:398:9beb:5c18 with SMTP id 98e67ed59e1d1-3989beb635dmr35063238a91.19.1788246552818;
        Tue, 01 Sep 2026 00:09:12 -0700 (PDT)
Received: from localhost.localdomain ([157.51.207.128])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32bdfd03e71sm18274680eec.1.2026.09.01.00.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:09:11 -0700 (PDT)
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
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: radu@rendec.net,
	abel.vesa@oss.qualcomm.com,
	taniya.das@oss.qualcomm.com,
	danila@mainlining.org,
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
Subject: [PATCH v8 10/12] dt-bindings: interrupt-controller: qcom,pdc: Document SM7250 PDC
Date: Tue,  1 Sep 2026 07:07:15 +0000
Message-ID: <20260901070717.20513-11-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901070717.20513-1-sreeshankar0910@gmail.com>
References: <20260901070717.20513-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the PDC block on the SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/interrupt-controller/qcom,pdc.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index 8162a49d4..c30b88589 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -50,6 +50,7 @@ properties:
           - qcom,sdx75-pdc
           - qcom,sm4450-pdc
           - qcom,sm6350-pdc
+          - qcom,sm7250-pdc
           - qcom,sm8150-pdc
           - qcom,sm8250-pdc
           - qcom,sm8350-pdc
-- 
2.43.0

