Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1783AD529
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 15:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787153246; cv=none; b=bgAcjL+4tgpnhMSnW4Ps8bppWOtSDcJ7tBSbpoDXTrbPXeCHfYn5oZOpbkbkhmTJx/N8shtq3kVA9lV0mRyog0S+1HSGvUXTn/e4k1c/tROYXAAM6uM5Wvgo2qYgq3QhXfxQLwyj8O4q1IJ7hI+uMLu1qTyHkbMl38oY5ty7EFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787153246; c=relaxed/simple;
	bh=WQnQ6/awaqesyO4FuxnwtkQQVd/qID9Itar1frdoCTo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZYr20guQ8aPCEMnpTavfGS8z0+OuqEiQJ4aG8vTgFjQkMMzPuIUjDbIe+ijK/Gun/hAGGuD4EVvFjNgNdygKrMSG0mJ7LLtUXpt0duZ/hYdca5PexS0Lz3CAFxV+ejuG7vaN2G7dwjXN9JpflNZpBfJUTYXhPw5AR9b6tKl1o1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PY071722; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PY071722"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ced3386430so10067155ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 08:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787153245; x=1787758045; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iuOxCh9qY6VsPX+/asBmCdWifj8i9okEwYPqtY8odhc=;
        b=PY071722DAq2R/vNddLOemYNOfK6indS4JwbOCoDFBQa5278hSsishsukW+voyv4Q/
         gaj35dCk+/iEz3u8Cm5G7JcSeO4rqK09dibdU6f5PBezd8q4FUgFdz0wfHfvFLWSbtMq
         bnIe6Ze40JDJzox0bSkI/osq1Hm704FG68s8Syf00sTLlnRXOknKv+mbGwLTt+EzSaSX
         dSZza0u2orVT0RUPKkQ5MbUz3SCT+lCvaJhHo3Pa9Wr2PevM2NpaDwUCcnRdTigQYwRW
         o+972Tr/Ay+1312K66Q6yKWlz689OAatzOcF0SJ1NdDuhSXHKTSY5T6gvtzXs4R+oXsh
         ysVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787153245; x=1787758045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iuOxCh9qY6VsPX+/asBmCdWifj8i9okEwYPqtY8odhc=;
        b=Z0+QD+MAopu8Gv1+NepY5344RF6RH9VueGgdS3UJVhVRxIxWcl/59jw3gIcBvopbVZ
         bYjHGZsyP6JwSgX2lctl4PrgvZ/Bd3S0GeMOh27oSoryWuWIDoAs44z90qrJH0RAXinC
         nZeJJayybVrqu/30M7SAJL6453bjWQmiT6enxB9Fu01UAoSrCqgrEMyRpcIV4SDPZVrX
         ZRcaodLdhkriQiFEHRHEmpcDMxAn2F+Exmh4TAiTVCZ68E9UB2LgiRoYB9iz10/p6Emd
         eQTnsptPiZD+WCkA4gmB6FMLqpa0t1iNwk+sK5uc13YWePuCITtr2ApkL8Pn4G58ey3P
         uU2A==
X-Forwarded-Encrypted: i=1; AHgh+RpaRJ0tJ5o66285/PZO3O+z3bhgntw1AC4nNcvFJui72dpt7+HPzGlBmi0moJJLognYelfS3U7hTaN5xCtr@vger.kernel.org
X-Gm-Message-State: AFuF++ki2SpgvUIKlTcsHXzxGJCAVM6EWJbqgdGpFHMSF9F2gAdxXLye
	gKkH4aTb5sahSLn90acSyrnWiCOTNc7Sq9Ey7bEVx0c3398Pg6CO4dxs
X-Gm-Gg: AR+sD122M3QCES4RHTy91ljkVfdP0ZqdJf4yM/NuB9xUjNCeee7WpD11+Btl0rYJ/Is
	EFyNXQotJjQ0R5dHoezWVUcrZczf33sPkrXvs4iDG0Dh1KBdEsUGOK+FHul6IoPCmK+4XL83pws
	ERCEnFo3U27DzKLktTrvHWIlItCqPwL49A7VE25dbsLTsqyEja5PMTNXG09hpRvL9XKbsRViCjJ
	u9Vgs9Hg4FjNcJb6b84EyJMVmzc6bFqd/wvzpVEold3yAzDrrK3uUsBuwsnAA+Emj50bS6tBDAc
	qG6yu+wa1UXWRrgMgVadAEI/JnbTARm+0DomzUebsmARENRqu7IVKAYBf38EZCusDe/SGNOAYpa
	2lU6SONTnDTvfPgeCeqrjvmbz7HAybncI0RQl9Y5WtvRDiEieNIIEgwdd0RV9EY1uBJUUiKTf9h
	eNrCanOEVurAmmRItsjQBQKRCWYW9j8ComAi07E8zMigm2bvPtITeNTriIk+mqbBEKa1LPYtiEV
	qCYSZhVf0cR33CEo5YHYw==
X-Received: by 2002:a17:903:3d0f:b0:2d3:14c6:2372 with SMTP id d9443c01a7336-2d5fd684c16mr107853805ad.1.1787153244901;
        Wed, 19 Aug 2026 08:27:24 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf14376asm8232838eec.24.2026.08.19.08.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 08:27:24 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: bmasney@redhat.com,
	radu@rendec.net,
	abel.vesa@oss.qualcomm.com,
	lpieralisi@kernel.org,
	quic_tdas@quicinc.com,
	danila@mainlining.org,
	davidwronek@gmail.com,
	mani@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH v2 07/13] dt-bindings: power: qcom,rpmhpd: Document RPMh power domain for SM7250
Date: Wed, 19 Aug 2026 15:25:36 +0000
Message-ID: <20260819152545.3934-8-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819152545.3934-1-sreeshankar0910@gmail.com>
References: <20260819152545.3934-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the RPMh power domain for SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
index 0744a867c..427953913 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
@@ -63,6 +63,7 @@ properties:
           - qcom,sm6350-rpmhpd
           - qcom,sm6375-rpmpd
           - qcom,sm7150-rpmhpd
+          - qcom,sm7250-rpmhpd
           - qcom,sm8150-rpmhpd
           - qcom,sm8250-rpmhpd
           - qcom,sm8350-rpmhpd
-- 
2.43.0

