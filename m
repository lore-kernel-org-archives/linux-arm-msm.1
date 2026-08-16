Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F133B3D5246
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Aug 2026 08:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786867957; cv=none; b=eenTVLkHE9URrhufmjgcWGB96nEsvFrRs9NV3W8Pg+BDTjJzfJ/t6VuQf02a3D+Sdz8mC+42iOJ3wsseJEEd/UWh7g/nCJitiAVBDcLg3MqhxepW1NNJLkp11ifUozQPxKvSI7XJsOn6AoFooubwHrpytG8BMznDbCb6Lc31G1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786867957; c=relaxed/simple;
	bh=St8ucU3ojSXInIoaRiplnocZp7Q2Y7UGXGTdomltuLA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NsyY/BL0M+ItpRO3xZjC/9hi2j26miqkSGSOQXXyKEplcb9KRoX4ybpRAjDzhsvPcDtpT4exUiJguL8cv+VjQkZgFtFrD7+xuVQ12zVW0uvb5W2wLXF7koBJFEfMsEziy0vdK59H/001kOsp0qCZ1LpmgjdW1+2oab8Nyj/OL/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HXQxitnu; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HXQxitnu"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cc97653887so40328695ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Aug 2026 01:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786867955; x=1787472755; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S/HU2YPUNtFosepQ51+dsKsorbBYkh3zE8nDrxs9nac=;
        b=HXQxitnuADuRiKgdwlteh81QUlGFfLu6IarXKOt0QVGoi4KRUxcXB68IdoMOSgVPth
         5n7vEjm3rd3+OmKafA23hpyELt5B5TXKIBhTAfEC2JlDygm4mK28MXj4Qp72IO4gjnRO
         FEb8RMpWKCoXOAgcLFpbuSW1Y7QGafm8mSLND4uqp0/tY7o1jjHy/nWisSZRDBUAZqX4
         1ptkxVMa/dIQQqWTmYOn+O3Rcr/4SujNkPd4SXjTltq5o+my5xhNReRRiaQyhdAJ++5y
         Lx4tM3bcqTyAYWb7IlLWmtgazONWDe8TReYPQO8th9hFfmkh8ZqCVEft9kDWakz6CiOo
         sEjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786867955; x=1787472755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S/HU2YPUNtFosepQ51+dsKsorbBYkh3zE8nDrxs9nac=;
        b=SGCTgoYXRUBr++O92fnexmwPnXaPE5t4OO3ocDTnYvLcvVtoJpVMUP0qn0hCB2WMdH
         FzO4lp7Wv6aucvsWGQfkdWCmYEZ/FjqLO50m3QHYpxQxfMDga9co6MGytGkK67PhlcOr
         n4GYuF5WLm05/aLt+yBGyz2NgJaGN6ZslmSDz/oVvd5W9tGsjQ5WWszQh7p5WU0Dj/iY
         ynAld3HSg5BxEn7o7Dsty0zLiDSKoR1ZjfWMkjWH+mJMLXLakTXiJmkjf7W4QKvcbYtp
         fTlRw5xQEzASv91QZ5PIwScsSvZZCbLG5xOgbD/psMOmJBYNRj8+pCQ49COtZfVUyXpN
         9FTg==
X-Gm-Message-State: AOJu0YwYD0ckGt4Sq2YMyIvotWMpyP3Hpdbw9zjlYTg5arn8FyTpDnDk
	O1jNms/sIp5M98mADwHNWgyFVpMXzzABHVYXMSas1Oc82drjhDgxHBza
X-Gm-Gg: AR+sD12AnuNa9xmI8F0mZZxiemVOIHQ0DdWZo16EAr9WL6pE2PzLukmuCT1lM79xmLx
	kRfNClq7v61xrDdF/ZLBRny8iwpXDjrYAvyyoJ6mH4ZmMkDQloHGWDz2ND9494FBPP4xpMwo+Va
	MYhamRibhPRXWBsQLD9YPneC3wogIxzXG+ulGJp3AR84icTuyCsiWtCWfvpUhwnewJONDGIuxoJ
	6agLaxvllupQoOF3hFMSCEtj6LqQLVvZF5d75lPxbBhaXeJKvBQirAvz0YNXLtCHbcH8NWzNoez
	t9Mihz9VlsL8QpFd6dw7niChYW2Er4gzbIO+DoCj4OahaNCDV0Nt341g4HLR1ZcNJm0bxz/FogW
	uMrZagmOGsN2dcCYDkrBKPXAXXt7uDsuwcWKWp1LfrTttojbzFqFz0siVQ7L/ixH/UgHrdKpnR+
	cczbuLEymlcSTUjilejc+LWz1HXUxeiqc5vZX0Ew6IbXxXn7r7+ui5TeamLSGIEAaEfPoA0uPGf
	7T1Q07IF9yr
X-Received: by 2002:a17:902:d547:b0:2c9:df1b:e948 with SMTP id d9443c01a7336-2d3b0cdbdcbmr209610275ad.4.1786867955262;
        Sun, 16 Aug 2026 01:12:35 -0700 (PDT)
Received: from localhost.localdomain ([152.58.201.186])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320ea8fe3cdsm23716838eec.28.2026.08.16.01.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 01:12:34 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH 1/2] soc: qcom: socinfo: Add SM7250 SoC ID
Date: Sun, 16 Aug 2026 08:12:12 +0000
Message-ID: <20260816081213.5495-2-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260816081213.5495-1-sreeshankar0910@gmail.com>
References: <20260816081213.5495-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add SoC ID for Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 drivers/soc/qcom/socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index af418adad..54b1f8e1b 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -449,6 +449,7 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(IPQ8172) },
 	{ qcom_board_id(IPQ8173) },
 	{ qcom_board_id(IPQ8174) },
+	{ qcom_board_id(SM7250) },
 	{ qcom_board_id(IPQ6018) },
 	{ qcom_board_id(IPQ6028) },
 	{ qcom_board_id(SDM429W) },
-- 
2.43.0

