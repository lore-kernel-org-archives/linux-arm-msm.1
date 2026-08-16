Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D4C13C9C4
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Aug 2026 13:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786887191; cv=none; b=Y/qe5hW07e0D6bNNuUx4xTfdg8GjwOndsvx9qiDZ7EN5UK6ZIYmhdgZijAEg05n2/luAE9pEyMFQQ7cFkJ3AcPsxFMdkPmO5suo5aNuQnRSnIC70H/cjKTK07LnL8b6X6vk7dOZdV/a7+kB7/ZM8xCIdc46Wz/w5nWYbfmjeimI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786887191; c=relaxed/simple;
	bh=R6Ql6qBhxv8nRfMWDl4ii2I8yaMmIwHS8a/lEb+KgZg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mljlkBIIdC8J4a7OTWyRRQYd5xD/cAZLF1WMfASlCZqlWM2RP7w05kaR6RMvcLhd4mjNvjJttNcAzsUesFRg/iPA4BYayDFFaqZd68QWKNPQoRv/A5crVBRGcEL4x9/xIeO0brtRMA2ki1uCowwZTuzlUYlX0mbvyg5+em6RaC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q0P0NowA; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q0P0NowA"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso2071518a91.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Aug 2026 06:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786887189; x=1787491989; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xro5hLO6XYdeO9sCaq310qk5ul0LDKCYcbgwbKMsfxo=;
        b=Q0P0NowAL8sHS/0OZpgaOn7JYu17myNtkeycku1BK/mNkonJM2+QQygcStzGuE88qF
         4rPLx/g7Mept/pLjSAUOmS3cHUO/ETLsKGexnoTu9clYvqcapkt0Esqwps4JEv0vvMpP
         39VHyQ0xq2I9Yf6xrTdxgmwhrDirYyhhKeHajT/l/ttE7ps7AAo0sfAqaIHY2qBk6Ub3
         TvDyjHVuxNVOm86mi+NHgxkofcTEHE5ltFPnatdXchh1XS1iPutUN+/Qhajfo2Ep3EMw
         Jreho2vNwMPpk9Dl2FQJnQUCHSSPEaNgGQseFugIZMC4ymYFwx90gF/B5qq8cryP9/yz
         c8eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786887189; x=1787491989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xro5hLO6XYdeO9sCaq310qk5ul0LDKCYcbgwbKMsfxo=;
        b=dMQoHE2efk/y7SdXgLoRy10T9LSXsdQOw5mXyZIlWwM3anugOKCzKnr/hfLIMhP3Lv
         kwROGVMGaypTEDADp7sPwzb2AiJk1RO/x4hNd8N/cx4rzUKx8hHxFUPrYRsidmIi3yEe
         4SI/lvXxVvPKQCcDV519YpBzIDEJBWzSpWD6hkxF2vM1BcgzoclVW4K3NuEZIPLezdze
         GntqFzfpt+20Q83JsNE5khIKu9XCAcw0ymaOUM4XX+o5tcVcH2oh6TBhOJE4hBTT24Y5
         CjIFLYQ3D18mkDQqWmpjHJAIqKgiAjn66rQqz2RYOYYLTiqAa5mVnOSYf31Gy6vspMwR
         6nPQ==
X-Forwarded-Encrypted: i=1; AHgh+RrL1GDrCgXj7CJ1IDwYwCSJsv3+ipeNIYt3dkoNE6X5wANkUwQsC92zpLNfFCMhX5wNDzp0Yvu+NEDWQ4ad@vger.kernel.org
X-Gm-Message-State: AOJu0YxAhwu4wjntBGIMVE4KNMkJykTeJ9p93R3pcckfzY+Be6v4CtzL
	0TWHJBUZ3M3smUmlJ57hrtOaseQ5158M4AvAbCAVoUXtQWI9cyVmjbCh
X-Gm-Gg: AR+sD12FjDnHcGkEhQSu39xQSc7fGEnRcbLNhNOTuYSgXytW+sEiUVNUO9SeE3+HS9k
	m+dQwTVbOmUSzHO9BG1Rxu1diKN74oFKoN/EGsPhgLBM+l1TVHhBEIte9U2r9hS9/Aj13o5dRXT
	eV8OuUoMSl50vxZ1AOpOZBaDuw7Zf/UuikXDJFl08eH77DaTEEXJRGncheixHjoXhAdpvWVuzl0
	CO3thUqyTI6db6RqEesyVpTPphvLW22e7Jb2kHR6z8/H54IwA/JKhY4JrQYQYRtSYnFcCQswtBe
	XY9YNWoDSJhnqWkqE1YoAL05OyQ08zeusf0v5xkMFK3IJYKhagSVMxCdK5UCTUr8RzSDOPKhmuy
	mQwSL64D0V7RUaZOHvwGO1PjKJUBODV/Epf1bCIoeUgkPHDlzBeA+pqhrSkllZaId4Trh+W/lw1
	9N1st39/mZwer+c1jyKImibTetI65HnAuuT5GAw8nSAmW5S2MRbC+boBtdEDMZE7MmAScMa/Ku6
	PJEZm9U9LYNg43/pg==
X-Received: by 2002:a17:90b:510a:b0:38e:9ef9:eb97 with SMTP id 98e67ed59e1d1-3933ba87422mr20314564a91.16.1786887188980;
        Sun, 16 Aug 2026 06:33:08 -0700 (PDT)
Received: from localhost.localdomain ([157.51.221.131])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320ea804233sm23599064eec.26.2026.08.16.06.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 06:33:08 -0700 (PDT)
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
Subject: [PATCH 4/5] dt-bindings: firmware: qcom,scm: Document SM7250 SCM
Date: Sun, 16 Aug 2026 13:32:30 +0000
Message-ID: <20260816133231.10875-5-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260816133231.10875-1-sreeshankar0910@gmail.com>
References: <20260816133231.10875-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the SCM compatible for Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 25f62bacb..7446a54eb 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -72,6 +72,7 @@ properties:
           - qcom,scm-sm6350
           - qcom,scm-sm6375
           - qcom,scm-sm7150
+          - qcom,scm-sm7250
           - qcom,scm-sm8150
           - qcom,scm-sm8250
           - qcom,scm-sm8350
-- 
2.43.0

