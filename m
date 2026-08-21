Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB943A8756
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 15:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787326926; cv=none; b=pKgUcZNzwc7JOpvjT0v3gw+72FO8lJVTqG0vvTHHpRuQcjUFo9W1Cu0UixLcdVK7rbmRyoJnTc8l2Y/XU5VhNXUrjjHvBAvcvE10A5OABhvpO4Sz+UwZQtT+z0OEvNwRB4v6WE+QJmSwxV2on3ksyQNAp6PfbgJhwp2D/bQpr24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787326926; c=relaxed/simple;
	bh=jKh+XPUoJmr7fIpNbx8/2EaPd/67MsZW4ebNDZ/8MPE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MGRJrqO+6biE6/mFa/3saQIfgC8h3E5ei7YzMN+kBlN7Nc7i4dYf5ItIuymO50q5PEqznbNj/afjs7X5c5ecPpqHuRplF1/Ve+BAkrA52TryKhn4ujdS4Cnvm35JqccV2HEEJUDgazf+lxBA6rht9Rb6kphx6Tct3H5EP7FDn1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J/4jkxkW; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J/4jkxkW"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-381c51fde6bso1212086a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 08:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787326924; x=1787931724; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QQnqfdvjWzHpIFqKpmfnZN4AvVDc8IQ+C2JI25EK8GQ=;
        b=J/4jkxkWBvSQGMF3DzBFLupkWH8JYQIuiOmzEoBQcIDk8TAyhRcAwFwF78mWw+HJlc
         h2wufJAGQg0HHegQ9AsyXQg3RnIjl3qjVzHuc/vY0ZVds/f+lR6TwUU611OVgsxwLIFq
         l8G6bZREYTV5m3XYQY08GH5CjJKIWU2bk7PGV0iwpFTfZ8GgYSzuf14HxyUtaMxh9ORM
         zqIr/i/RdQaP3d4m6oP4G//o4ICn8VRFpxMZBj0Fow3LttgH+qgLlZLdNIBbDAOGC8Wm
         BoeEHNl+Kwb9bv8NFEuAKxHUNQbIny3Gb+Up8MUpZCOiPWoYfQF3c6FOThwVK28GemAR
         UMcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787326924; x=1787931724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QQnqfdvjWzHpIFqKpmfnZN4AvVDc8IQ+C2JI25EK8GQ=;
        b=PbvN/4bNzw4wucHG4gTkc90TVZQ0YGHVmtYRSbGa6S/lMPofE6V+gaZkRuWbbPwoLW
         2JlXcDKIEYWCWyvnXSImw7fK0taou/QM9rdg5cPsjdid/xX2AWgIUwuYNJAVDOJsJPTq
         Or1F701OwC9yNvaVh1ownRzPNiHtNJKeBmlZTMZTC0qiK6PAwL+3E7iDU62IyM78KVgy
         98cOLNdtnaBmjDqkefkv6Q1dwKb/cU7rjv+tNm3QI8YX3gpyzAz5BEraBN7/2gXnzvjn
         Yz3PPRXjmkLDnZmct8n+di5d8dlF0d/pn/YWgiiaCKaB1r0i/ses9IvkqSMbbBc3Rq3f
         EBbw==
X-Forwarded-Encrypted: i=1; AHgh+Rry1ibMiAjLsQ9eOBR2Diqx0LBHKSAd77a3m/xsQ33GKdKh7UljjlFKcS3M9Fd5kfiHgu12XBjmZnDH7eOL@vger.kernel.org
X-Gm-Message-State: AFuF++nWgcLbPu1RfvmCAFAQz+S2zWvKmv+MoUo7108JOm18fB7vgdxN
	BxD+2H4sc3hlqt8pupiWdgSgWJhyDhsE7YIRBPFV+qKFJQUqlef+0uED
X-Gm-Gg: AR+sD127lEHAiYVtn7EsSfRvVNzzwKDPyzAYFMDJQGlN4Dk731co8KTuIFcUCpHWnod
	a7C0sYiQ6B9sAzO2iivt5/mwJ7t3Dkj/RJtqSSQYbJMf34+SZElhayJHXJfIv/4KRryP2Vku3oJ
	40C42CrBJMFv8oMBB+9CJZrLQhA5y0GuNHsirf59DkZ2kS0bGqW/8kMxQ0RyyPaTkfQVCExxtzM
	r1Tk9HJGIFp1K4rrWHLOg/H1GbLN0SJG5czG8sCay5f+VMPvNJG8OnJLS+eLDkyDlJJOXkyxkDJ
	BGF6J6k8u1UcPDtsMhNQdk8wDVxTSQjtQLtBX+5RHBfjH8sGHSj3Z7fI/uBTUzk2GcT+1tGZJBI
	ML7rSt1f/+MCBiCCfDGBqiYXb2T1sH1mxtIorPALMse7qTt2fk2yXK4OPyjcq2+enEu6Xg7JyWF
	JbvcBdro01+zo39T6jdwwRdvwFHP5MLmkpnpD799DnFna+XILgMuTV0YWraWnbDQApr+aGpWUpz
	ss4lK965RGK
X-Received: by 2002:a17:90a:e7c3:b0:38f:dec8:f7e9 with SMTP id 98e67ed59e1d1-395c37130d0mr12860660a91.12.1787326924462;
        Fri, 21 Aug 2026 08:42:04 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.163])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ae5f1ffsm42903185c88.13.2026.08.21.08.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 08:42:04 -0700 (PDT)
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
Subject: [PATCH v4 07/13] dt-bindings: power: qcom,rpmhpd: Document RPMh power domain for SM7250
Date: Fri, 21 Aug 2026 15:40:24 +0000
Message-ID: <20260821154030.2514-8-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821154030.2514-1-sreeshankar0910@gmail.com>
References: <20260821154030.2514-1-sreeshankar0910@gmail.com>
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
index 0a45e1f55..e08441915 100644
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

