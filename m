Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F065E53A389
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 18:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790189477; cv=none; b=SyWrPinAE8qVe5/o8wWIGw6co9jkUy7ovxJuN8xGUM+GTBJn+eJ3c1ujlPgn0uDTDR5ApxGjLPphkRP/Eip9XbKXXp+t9kByRWc0vEbo3DvxAy9dTGDMo2q/Ij6ffWV8r0/RjTUWXNY1MO40W9YE/tt8nwrkTNMHEaRlQsKnkfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790189477; c=relaxed/simple;
	bh=Klb6dIIWDbivq7Nwzx0pLrjmulwzyzTJfh2mCwsjH78=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UyHf4g287EVr9gsUZtVMjvK7hwjGzpd2pnloY9XFT5Y4mzYGnUzhgCUW5dmJwXmPxcyeA01veJpYHHQvqNdV0m9v2ak/cCdlaftEXH410TFJbZx7bGxaPmC1M4V11AbQpKeEmKK/Rg1XPQjibATOhk1JiBSWKup28r0BZvgpOM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sjRNo8Zy; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sjRNo8Zy"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39b910bdf2eso720233a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 11:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790189462; x=1790794262; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=s2RyWeLbmlvlzy0g98C/45Akp7E/hTZac2wRMvl2ThY=;
        b=sjRNo8Zy++N4nwIiZXjpCtjR8XSxxx9C74RhypZVb+O/4qfq1ZIcN3N2Q5ZHhhKVhY
         ybV86yugoUrYyVPY84uqDCkSfxJTaoZSgDLLRla6E5HZAKuP0yekmNIHM5x/KezMbQEH
         C1+wLRTjLRWfSf20meUA2b6C6KlSLuL02FEIjRpsMoRjzDORdb1MgdYcXbl7ATgdp2ml
         esvCFGN5M9evMPLWUVAWXRjsIeGfzsuTEWXPUIcJTEU8gi4p5X9SxZGaWIWnbHvOvKJE
         s6Q0PePrUvHyOFJURD/w/qSI6TQlXGuqIbSG25AVBC+nB9PBAU0BilxpA3zgWmPScaDT
         yBCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790189462; x=1790794262;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s2RyWeLbmlvlzy0g98C/45Akp7E/hTZac2wRMvl2ThY=;
        b=wV//y0Er+LMikIy1KWu7+C4DwjDWd8Fpz+fViTU35qL6yyRPUwG9x/xDl4B4JhQU2s
         /pTof2pjRyAOj1FxwmW8F7f3YxHciRGRojkV38Kh7qfWu+kFg8ld0d8fnFog3+wqPeLk
         Rs2dsa52L7WRpQBd6MRChON4A9YK2gb8KsAXrJS3CGMIu81gl3IAgjXDTdY56WADTDLq
         BXXTwDPdPAD9HYPL8m4xs0N9LTqX8isRZmSyWI4vsEF2SCUXqoKj9P1NFdZSYyJVOctP
         atOWJdP+qsN934bfYLk1QjGuthzRcr2c9XNV9fjXcoP5SSJm9dCn2ngrpkYRxkfTQTvg
         ESrg==
X-Forwarded-Encrypted: i=1; AKwUvBz4psaV3OWRvMJTD2mNndoDnfSC+oQHIHdhlEuy3PV74uei2S0yxxhTA5URESxAD9MqEJstpIukbGoweq+g@vger.kernel.org
X-Gm-Message-State: AFuF++nX27RELZcKWrwXa9l9NjbUH8Za3EVvE8h38+HkXe1Mezr2CAiw
	pFNId4THKeZHhIR2WTIL5+FpX0al1zKmyMe+ru0clNnRmHPEw9oM8i/9
X-Gm-Gg: AYBFou33F7aR/iLcb4Ofl6enrezMuYVGQuulVLHx+csvOd1rspGtNFo8My3f7cN2gja
	70SGqnmUjsxxZCRaXFGmre8QQ6UYEzJQwIpaI7L/4D1iJUQJIEKpb4Mh54S7cDbJ+l3jkn4MDpe
	6LNY1v6cBpZM9ZWddBilvpn0xVgKuJzza+pnW5fFKu6xSRAn1ghTcM/d6L1/3g7pX3ftOpthcpv
	22nWchHTABJLAnK33EgxHbIRRcCz98ekOKw4yF2EMjFn+WwVPmbCYq/oP/N/tT6q1z/KUZTGEMA
	XVn7feDNxDtYmWITQGYQTtAgeOngJ2Iqzwzty3YBEbJqxXpvGehuE2+cbNfV71qUVJh+GoqqB/h
	v3h6jrKMcMK+hreBohqY3WEVzBdsbWdkBqBYCH+VAr7l20TkRHoGpI6NfvAJ1Q79cpSaBubJFMi
	N3ZzI12tjBV0r5SgwBZfRNA+EZ79yBJG4QnzVa5ao8DD+9qoKXauOMkx0o3mVeWzb8ufcZtOnpq
	5wXhG/9nimmDC6+aj6L8zSIUO6CrrOFHIIN+fw11mE0LfWaptq4DRyfK4aTt2SnplW+Qyz2phYF
	hQEWr7ExstpmVixqPw9d008YWf5p1ykh74YeTtW8g2/b/WX1Uw==
X-Received: by 2002:a17:90a:d88e:b0:398:9c39:520f with SMTP id 98e67ed59e1d1-3a0985b8f62mr75751a91.15.1790189461897;
        Wed, 23 Sep 2026 11:51:01 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a081274d7fsm2148797a91.2.2026.09.23.11.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 11:51:01 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-pm@vger.kernel.org
Cc: Georgi Djakov <djakov@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Rosen Penev <rosenp@gmail.com>,
	linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM MAILING LIST),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] interconnect: qcom: fix endian annotations of BCM aux data
Date: Wed, 23 Sep 2026 11:50:59 -0700
Message-ID: <20260923185059.25196-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

struct qcom_icc_bcm::aux_data keeps a copy of the struct bcm_db read
from the command db, whose unit and width fields are annotated as
__le32/__le16 to describe the little-endian on-disk format. Using
those restricted types directly in bandwidth calculations makes sparse
complain about endianness.

Keep aux_data typed as struct bcm_db, copied verbatim from the command
db buffer, and convert the fields with le32_to_cpu()/le16_to_cpu() at
the places where unit and width are used. No functional change.

Fixes: c96fc14322ce ("interconnect: qcom: add COMPILE_TEST")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202609221350.3Y8MOce9-lkp@intel.com/
Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: don't use a separate struct
 drivers/interconnect/qcom/bcm-voter.c |  8 ++++----
 drivers/interconnect/qcom/icc-rpmh.c  | 13 +++++--------
 2 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/interconnect/qcom/bcm-voter.c b/drivers/interconnect/qcom/bcm-voter.c
index 6c7e9a7c17e2..0880a287b0c0 100644
--- a/drivers/interconnect/qcom/bcm-voter.c
+++ b/drivers/interconnect/qcom/bcm-voter.c
@@ -88,20 +88,20 @@ static void bcm_aggregate(struct qcom_icc_bcm *bcm)
 	for (bucket = 0; bucket < QCOM_ICC_NUM_BUCKETS; bucket++) {
 		for (i = 0; i < bcm->num_nodes; i++) {
 			node = bcm->nodes[i];
-			temp = qcom_bw_div(node->sum_avg[bucket] * bcm->aux_data.width,
+			temp = qcom_bw_div(node->sum_avg[bucket] * le16_to_cpu(bcm->aux_data.width),
 					   node->buswidth * node->channels);
 			agg_avg[bucket] = max(agg_avg[bucket], temp);
 
-			temp = qcom_bw_div(node->max_peak[bucket] * bcm->aux_data.width,
+			temp = qcom_bw_div(node->max_peak[bucket] * le16_to_cpu(bcm->aux_data.width),
 					   node->buswidth);
 			agg_peak[bucket] = max(agg_peak[bucket], temp);
 		}
 
 		temp = agg_avg[bucket] * bcm->vote_scale;
-		bcm->vote_x[bucket] = qcom_bw_div(temp, bcm->aux_data.unit);
+		bcm->vote_x[bucket] = qcom_bw_div(temp, le32_to_cpu(bcm->aux_data.unit));
 
 		temp = agg_peak[bucket] * bcm->vote_scale;
-		bcm->vote_y[bucket] = qcom_bw_div(temp, bcm->aux_data.unit);
+		bcm->vote_y[bucket] = qcom_bw_div(temp, le32_to_cpu(bcm->aux_data.unit));
 	}
 
 	if (bcm->keepalive && bcm->vote_x[QCOM_ICC_BUCKET_AMC] == 0 &&
diff --git a/drivers/interconnect/qcom/icc-rpmh.c b/drivers/interconnect/qcom/icc-rpmh.c
index 7f2b5673629b..45662d1a2060 100644
--- a/drivers/interconnect/qcom/icc-rpmh.c
+++ b/drivers/interconnect/qcom/icc-rpmh.c
@@ -166,19 +166,19 @@ static int qcom_icc_get_bw(struct icc_node *node, u32 *avg, u32 *peak)
 				peak_max = INT_MAX;
 		} else {
 			if (x) {
-				x *= bcm->aux_data.unit;
+				x *= le32_to_cpu(bcm->aux_data.unit);
 				do_div(x, bcm->vote_scale);
 				x *= qn->buswidth * qn->channels;
-				do_div(x, bcm->aux_data.width);
+				do_div(x, le16_to_cpu(bcm->aux_data.width));
 
 				avg_max = max(avg_max, x);
 			}
 
 			if (y) {
-				y *= bcm->aux_data.unit;
+				y *= le32_to_cpu(bcm->aux_data.unit);
 				do_div(y, bcm->vote_scale);
 				y *= qn->buswidth;
-				do_div(y, bcm->aux_data.width);
+				do_div(y, le16_to_cpu(bcm->aux_data.width));
 
 				peak_max = max(peak_max, y);
 			}
@@ -228,10 +228,7 @@ int qcom_icc_bcm_init(struct qcom_icc_bcm *bcm, struct device *dev)
 		return -EINVAL;
 	}
 
-	bcm->aux_data.unit = le32_to_cpu(data->unit);
-	bcm->aux_data.width = le16_to_cpu(data->width);
-	bcm->aux_data.vcd = data->vcd;
-	bcm->aux_data.reserved = data->reserved;
+	bcm->aux_data = *data;
 	INIT_LIST_HEAD(&bcm->list);
 	INIT_LIST_HEAD(&bcm->ws_list);
 
-- 
2.55.0

