Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7640442F709
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2026 08:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788856121; cv=none; b=tcOR236fGAKGkAb4I/zBD0r8pL3FbM+/lwQMGXEvoU49DNrWt4T2JxCMsoR5NArUVTrMmXGgAB0g9j5f2VdUAE6eYVJ5tp/dVh5I6oh97uJ7ordBLkFHV+WZE9rdjuDv6TY7ilYOEEayfnnlkubC42LjFJ7S09SeN8Hgmzz+mog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788856121; c=relaxed/simple;
	bh=z9P+ywUBSNkvNLZ0UrmxpKOG870Ab70CHNlvp5eJxSg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WwcKFJHOJQTJ1Fl80jseQT/B63VGbNTIr5HFi20z0LcLMEZRhfTKOU9019uG9UPNmp/Be+/pdp7Lho79YQp+kPNTKWAVgpnZ7QV+5FZV0ER13VbEBVuxkSVooOjReM1SFYVcpzCRckEMEhfB24004gXuCJx/bJ042WlOXAqmHwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PUyu1woa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Da5b91dz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PUyu1woa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Da5b91dz"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886M2H72712375
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Sep 2026 08:28:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=sO8eEMJF16c
	3bC85Z00Il17KWtgP48sEVSRstL21fnM=; b=PUyu1woaiCQvYq9ktdRE28uIXgJ
	uYCqmccQVV7jCFZbSOimX84cXYBuyYm58R19XNjBxewLnc3bq3BMzARoQ7cjP2PN
	9roacdsHFbrIB8Veln0lILQTT1p7BGbUAqWLHK8sukAqV2evS/mE4aPeeP2JV7N3
	2h9ejHBJC9xFe7huJnd7298e+IyCssKU+7iR65PmjcN0rnIrN47mH3/0QN1JAq+Q
	L8jQxJp/O+aqi1QvogOMQre6KVZMUVd9+UCwPtp0EKP3+ZHQmqaUOsVpP4q4sDzV
	0MeVCFSs/PEotlyKvCQ5U13godf9wtRye4+nqHeMfr2XfbIn+zL9IHOPTYg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtdqm95q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 08:28:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9308eafb465so398225585a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 01:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788856117; x=1789460917; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sO8eEMJF16c3bC85Z00Il17KWtgP48sEVSRstL21fnM=;
        b=Da5b91dzUs7lzn7xvORPBcAKohR7qzipE4VZSkabCZH18aaZbFaDTJVjav47FlWHaL
         7YZkaSS+g/ezSX7d5L1OlUQYwu/lFTMJc+ueIshSU7IWBoSWD1M4erIhJytQQ0xBCgQ7
         72E3gRQGrNwVzn9C2kZqUbqq1sWQBW5wJbp1jBU84eaOL2VH0cIRVH+CvD7i8uOHSWD8
         jYQXwcvXRMj3oUrG8IP2Ozok9OE7la0HEkPBZWyAaNdksS8pji261qrAXROE4hgeA+Tn
         voBaUwVFu5jnnUvqEKNmKFRJ4tosQJcU+WtSdkxaJpnyqF0DzOn0erxVGkT6NIM/8YQD
         w97g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788856117; x=1789460917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sO8eEMJF16c3bC85Z00Il17KWtgP48sEVSRstL21fnM=;
        b=cTwObH2b/qN8YbXqe9//hBLMG50WlnXzvTqQ2MQKFEjBnX68VvI+pGdYNdmmojzE1H
         dt2U5HGUBh2LhL+m1uhFFpv8A+TeK/Vksg1FtfkoPqY8ThFQK/lM+FMznuSoEwO95EVP
         Mffdo6tY/abPysneC2ItSEFYptlsAmX0rEanABaBEyBEnduT4X6RvaIadbOrxWbny5Rr
         EdJqvg52FoTB2uVMEq8ymf2zgge+1aNM2Z72WCgl9cN+tc5n6AHIDSCUTNZ6luygzmf/
         02midOAU4QDgtMf8eWbD3XSxGoVJ/2xUu/rOpRYg0h7tlxtSoMdjDFl4RPsK+CKY1vQI
         cxPw==
X-Forwarded-Encrypted: i=1; AKwUvByFj9JTon7hN6xL8XyfbyI9JGX07JgYMSfqOA58NiPSDgRl28Mrs7mi/Ess0YK3RJoqp3S4IOqgJpPNfgp7@vger.kernel.org
X-Gm-Message-State: AFuF++lKDkfUseD57dRL/hMXsPNJAnKy9HBRNbhwSeMSppxgjfTFZH1I
	OE8HbUwz9SF0i4HjoEGxbwqLoABidNs6hC2knK+tGtZ8rShoi0gysBHHT35xGknlG4qPYyjVe3/
	Pc0YTqg+qlueEE48Ks6NQChFuejk2SjmgIS7Yrel9mN1vyTwF1cZbkpkUzP+iL00B0yKG
X-Gm-Gg: AYBFou1pMEzw7znEtpjLoBevUe03QXezXnW1SdV6HN6AdE+vi1tbySzQJA2pvtqm4Bd
	TKurPggANttZbdk7h8hBHsVcrQuM7wBmNqNFxMIxYonXjZa2EdLFQRgIO2VroAEK2K2CghGVde0
	SP4a1jGgq4cm4c7zcXF2Iwlr85iNdC7P/aIGsjauNkrqGzfAIrKsB7XvTFpII/WB43xs53RYUQP
	zmywDSe8Hs7vLZFK4voadN/lQOEilj37m/vYAT9P75f3Smpmo+P3e8CKo5H+LmSFIWx4nGjHf35
	25j+ic8ao/YdzENeiV1Y4Zf7WN4P7Z13ejTES30TtYm+FxL+kqksXG1RBVMRLHwLa22NiYo9Dh1
	kfxyk+RC9OC/ZdA==
X-Received: by 2002:a05:620a:a38d:b0:939:6132:62cc with SMTP id af79cd13be357-93980426af4mr2295509285a.27.1788856117174;
        Tue, 08 Sep 2026 01:28:37 -0700 (PDT)
X-Received: by 2002:a05:620a:a38d:b0:939:6132:62cc with SMTP id af79cd13be357-93980426af4mr2295507385a.27.1788856116729;
        Tue, 08 Sep 2026 01:28:36 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7736132sm369414605e9.12.2026.09.08.01.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 01:28:36 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: srini@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 5/6] ASoC: codecs: lpass-tx-macro: switch cache to REGCACHE_MAPLE
Date: Tue,  8 Sep 2026 09:28:05 +0100
Message-ID: <20260908082806.648797-6-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260908082806.648797-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260908082806.648797-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA4OCBTYWx0ZWRfX7WS6hppHFKSn
 AYtci6T8Myhg2HJzmiYSdmjj5hY1zuMWghtZ+fKciJy4T/GLHvNoi6RargjTFCLlM4NwG9tJhzp
 2AwUV7ZiqUjLqW3ua7aWGteAN/DeqJuPD9lLoRrTbIhSR4uHCrTEqS2fgCq0GT60B5uDDXDZvYI
 75+wTYoCyhySHzvP06xxVOA2dktKaW2Dk+cRC6UU45nHXCyU4c+d+cEQ3n5AlM1PQsBjqGMQraY
 uiWTAWjK8UmSpk6Iai38M+2dsDWGOQn6IfzZWM6b6Kb3/m9M0WqSBqloCo6DcJdXjxTMuFmxYQc
 xhPKZ1SpQoP84Kz4ZLZszPtGFzsYrn4O3NOXWP5j8wPjESkL0afFv06y6wjMXZKTEh5CWnuQMFb
 0SXYr21J6eky+G/XLsSXWljNi6Kj4fCx4RhculWEtWJ4Dfg0rBelRIKlA1VgOaslQ2Jrod1lMIM
 osRK4cMXV+6p+1TGLCQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA4OCBTYWx0ZWRfX3mTBMe5NhGNx
 1fTFW03CARhU/Y2+Eh7yX1avEqbp1DjwCu6O75O8zm9Tt8IkluLpWWvqf7h+BBy4yYQcoT1Rmgq
 0JnZDvEcbfFafXTG8tv8LC/JIvWKX3Y=
X-Proofpoint-ORIG-GUID: DKqQbETACV9lhk3178l47q6pxC3Ly8_l
X-Authority-Analysis: v=2.4 cv=U6aiy+ru c=1 sm=1 tr=0 ts=6a9fc735 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=JkBDmzDGGkIbPcWOdIMA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: DKqQbETACV9lhk3178l47q6pxC3Ly8_l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080088

REGCACHE_FLAT hides missing-default reads by returning the zero-
initialised cache slot instead of doing a bus read.  The caller
can't tell that value apart from a real hardware value, so any
un-defaulted, readable, non-volatile register that gets read
silently returns wrong data.  Since commit e062bdfdd6ad ("regmap:
warn users about uninitialized flat cache") regmap dev_warn_once()s
the first such miss, but any subsequent miss stays silent.

Switch to REGCACHE_MAPLE.  A cache miss returns -ENOENT and the
regmap core falls back to a real bus read, so the caller always
gets the true hardware value.  Write-cache behaviour is unchanged.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-tx-macro.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
index b73a19eb9981..b1cd5e34624a 100644
--- a/sound/soc/codecs/lpass-tx-macro.c
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -602,7 +602,7 @@ static const struct regmap_config tx_regmap_config = {
 	.reg_bits = 16,
 	.val_bits = 32,
 	.reg_stride = 4,
-	.cache_type = REGCACHE_FLAT,
+	.cache_type = REGCACHE_MAPLE,
 	.max_register = TX_MAX_OFFSET,
 	.reg_defaults = tx_defaults,
 	.num_reg_defaults = ARRAY_SIZE(tx_defaults),
-- 
2.53.0

