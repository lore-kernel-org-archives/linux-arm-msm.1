Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F4030C606
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Sep 2026 11:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788520600; cv=none; b=LTf6TRi3K0eHHprS0QfjLe5cQhHsS3w8sXCXBvdrg4tdLl5bn9Z43XcZZWDVJMUZxQRCNrx4DP2MrLUFBfB5SQ6bVs2wBXRrr86XFfJvhBggX4k3/IMdpCVoP49FE7ihvg4p32hHKajV+YNraKbrFuK0cTmphCkp0vCoU+IYi4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788520600; c=relaxed/simple;
	bh=ER8+VqkKNh1m5awCYEZ0+WC8t8fPrdYjk//ReUw6pk0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DWdW7O3JXJ4peQ+5MJAoB6aFE36S3eqf5/lfBZ0qMAtqPsbMkbM8U1TKm8WtdZu5G+O2Y83Qb+3LdstQpBlPIrro+aGJ9VhDaHfH/4eSh3bY/EaNQUv3AaFcr3fihekQeXKEkTp3Qsvzwt0p9ldDSmfvhXHj4WPN2gpDFEb2/2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MHX5vr9g; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MHX5vr9g"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6b1ab6d7239so707113eaf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 04:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788520597; x=1789125397; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JppfUUpZfHKcmt6XqyrmFgzf+ARztTLGx1FGIhTdjnQ=;
        b=MHX5vr9gnpI5FXxDnZSt4klU+uF0DRX05+ChFKdk9U8fwjkEfIR29zK1e+eJGVxvqA
         8nP1XNpdi2nca9TJhD6RCrS9kp1DFJ1inrMya30oWsghuAZY1IMiLgU64pHwoclOZoSb
         E4qWg3MXLvPVXcyVs+fsIfuLSRWpQt5oPFaUC8gLq0eXexPGUovy6HJeJEQpbrXguwxr
         dlt8ahG7xoz+qIX+tFNq3nfzjC6QuYK15SHoKnFhJD/n+PnovMftIyudjK+rCHVOp13/
         UE48tj4/QBOhNvqIda6AlIKY+PZvqeD+gaQCUneiZF3J33AqssFRMDtFExNuMFf86gSj
         F0jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788520597; x=1789125397;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JppfUUpZfHKcmt6XqyrmFgzf+ARztTLGx1FGIhTdjnQ=;
        b=I85ORoPLwWKQhIXG1nKRfepokYENi9E7O8TS3RN9c9Y85fTiOeKAtF+kJGqu/cR8eK
         yVuvSd2MtqFZF9eW/lbTfLgject3iy2PjeZVpkQhgkb1GFJvmBbMNz7/CKIsFVg74Ask
         uw74rh93r/QKtwKYrwjpQJ39dBFniQ7iyoGWpbr4oRhVHKDXrkb+qeibvEPDJHLKNzIu
         RHPLRH+ZJJNAt48DavNkjLBJTSDb7cN5mHsIPTcWDwUNj/bronVrHY21ss3qdppGZ4/i
         zlWtSPwIt3brG7GN9BxaG83vXnzjGAqhNEdxz6Hb/rRottk2fVTeL7zhxWUfFSii4VIk
         wWow==
X-Forwarded-Encrypted: i=1; AKwUvByp2kDA0toyT56GUxj9Tvp4TKBZrBMBucicLx7m3XC9hm2/Y3bF85WqhNudmSnGLwN6JLnby1qoKwtlOUUK@vger.kernel.org
X-Gm-Message-State: AFuF++mU899wDXuJS0WRQ5jXSng9k8WpS3HT5GW2EERXnvWE8Kc+cJaC
	SJMEVWXDkyuuCVjpJEZgKv7DZtMdojBK+mdz2+2eCW/uJHEh6vCLyRnP
X-Gm-Gg: AYBFou2SfGygw5wEB5mdCBZlh+xYoi1mHYI+jT+bwre73pKmfBfhb/xn1A+hvErd+Jk
	dloZEKkuSerNH1J2SU9HeEsouninZDpJRwzzeUDwCf/6KMicMvMMuKJbJ/DwjdByBtkuFA4NAoM
	LovZJ51Hj9VPAw4CXZSJ+Kmhur2vKZOi5lfV0KcKTw7F5p3KSDtpLV98bb6nXYd4VhOqDmX65VU
	LFSN/znCMoPOH7PVP9TKXiMY0Jmu3sxP1GN6DPsrG5DkoY0Jlf8yd71o4Y2XdxGKcKc4Rk9afys
	oOE1npn5bw8H3APnTZQli0U5sO3tg0SjlFmc6Nf2voMTuVO0Ki5ssg39FkEqMSSdfm58gZPWJAq
	hpchZoNwrEt4iv8KTsKC4fJTnHvDmngqJEPVXajRGjPJ1IymhEwo6MjmEnXQUqI0J06//rx82Gr
	uivAPKY2YtXXgKbjJo1HfnHZSyOiYd8p1zfrUiXSA4Q/T62kUy0xKA1fnBi8DVijKU7Hnr5DKPt
	c39E3TuvtGwTfQ=
X-Received: by 2002:a05:6820:220d:b0:6b1:4061:4193 with SMTP id 006d021491bc7-6b6f7988a8dmr3287799eaf.0.1788520596953;
        Fri, 04 Sep 2026 04:16:36 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b6036fcsm6395431eec.20.2026.09.04.04.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:16:36 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Georgi Djakov <djakov@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH] interconnect: fix typo "commited" in comments
Date: Fri,  4 Sep 2026 16:46:31 +0530
Message-ID: <20260904111632.29262-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "commited" to "committed", reported by scripts/checkpatch.pl using
the misspelling list in scripts/spelling.txt.  Only touches comments, no
code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/interconnect/qcom/icc-rpm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/interconnect/qcom/icc-rpm.c b/drivers/interconnect/qcom/icc-rpm.c
index ca4c8a944755..da06c58e078a 100644
--- a/drivers/interconnect/qcom/icc-rpm.c
+++ b/drivers/interconnect/qcom/icc-rpm.c
@@ -402,7 +402,7 @@ static int qcom_icc_set(struct icc_node *src, struct icc_node *dst)
 		if (ret)
 			return ret;
 
-		/* Cache the rate after we've successfully commited it to RPM */
+		/* Cache the rate after we've successfully committed it to RPM */
 		qp->bus_clk_rate[QCOM_SMD_RPM_ACTIVE_STATE] = active_rate;
 	}
 
@@ -412,7 +412,7 @@ static int qcom_icc_set(struct icc_node *src, struct icc_node *dst)
 		if (ret)
 			return ret;
 
-		/* Cache the rate after we've successfully commited it to RPM */
+		/* Cache the rate after we've successfully committed it to RPM */
 		qp->bus_clk_rate[QCOM_SMD_RPM_SLEEP_STATE] = sleep_rate;
 	}
 
-- 
2.48.1

