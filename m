Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE9F4F5DF1
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 12:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791895764; cv=none; b=IioTBhtj/kMPtezn8qKlKxna9QhBDnKWkhT1ZcaXBKQML3kIBk6WB5STJUnoJgpYKgwkgj0uWoc0zbmFy/SbVevOTb/P3u1nceQMGm5NNcr0xu6/pyGmcfED9BGZz+/4vaDrSG2ChoX+LH0MGx44ihl0rwhdyvXr2a30KpQjZw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791895764; c=relaxed/simple;
	bh=b9uNQFPyon1Nkfa1BGZz4J1Q61BhK/8GrLO97o/igzo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pyI2RDy1uxkqzzfoHlwNE4nI/TwxedhH0VpxD6IvsoM8TYqhsnZUmhsZLg6J5jfe109UEMAFwyFDXQJST3+mhkeR72DPikHBkdr2/f/D9lRPVxHy8/YrfNZIJt0sRtRWH0VXZo5c9gva10B0n74R2pagIJTZ4OVYmYzk41bKcrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T7dBMLTI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TvSLtx44; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T7dBMLTI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TvSLtx44"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8NZRB3907376
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 12:49:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vm4xU8oQLv8uyf2zachTCzY7k+RLBTFtPS938xas440=; b=T7dBMLTIw/HCaKVN
	VZtt8uI87P3lPKQNkq5XVh/gGu+wDkYcBuizznLQFdi5hKKstBptdC7OGAyqOZfO
	zBnZP1EHAlTWwjyR/l/x0LaKX5EBFmyaIB7f0Yw1mrK+QnCe371aI3pQYZGF2LFb
	C4g99h955aWL3atLI/M0fM5ZH5A7F+bL2FHkLdqWFA+TxkEJZoeykkF53rit8UFV
	T/LII2+I5MmUBS2a7v1T7WuC6Wh87D4oH3C37kEcQ2riPxNssDQilRNclBiEHNNT
	oO+ZuN6YZgFH5ySOre9J7gHtk0XzZXrcuN5Jl7w1awMUf3ntoxbGP+pBL9WFPXcD
	dpd27A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h95xquk82-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 12:49:21 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91b4bf686ceso102877686d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 05:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791895761; x=1792500561; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vm4xU8oQLv8uyf2zachTCzY7k+RLBTFtPS938xas440=;
        b=TvSLtx44uOYaUDZyYelqStwD5jxL7kWP1QRboe7lqSLCS+CuQwDnwyu9CUrRd8BS2A
         A1lMY7au8Qg+dI+RlhiF76IMvJnnpp0f/LcUxokhoAf1GVsaOupLK0obeumUXvS50gYf
         FCydkcViXa1B32QPuxyTdw5/UC9W/IXNuLXjIhU8gXxfr3WpOCIRoBGLRibL8UOGQ8WX
         9LjTSjH9iheAv65X1M2MkKUsTeP5fietsUsza2p7PHp8CJrSKGg0Nd5O55cGVYOby7BR
         Oz2UIzQrsz1oBsxBxn4ODn4MFuzVudIRzFQX67ogLL7FqJ3gX5OIJI2DfmExvBhP4Uz+
         w4Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791895761; x=1792500561;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vm4xU8oQLv8uyf2zachTCzY7k+RLBTFtPS938xas440=;
        b=xsQMmmi7s3Qu2q2XOGJKXO4PeF5etefwB0T+k3CgdncKGxQfXWNm4d/3CFfJqR/rtH
         SQkK75G/i7JG+olTF573jkL6WxecWCyXK4CyaFNBweewtumflVYUp5mZEuLGgLUII46q
         wmlUSYIeV8F0PrLep6GG1N3PELAa0IDYUApkSPIWa35B6ioWc2EofroOnMqzoUzOSq0C
         uSA36dICmnS3zyGal5AalXO2I+wJSTIL6hYY+MBULE9hps3fPOiIh/cilCwmPvV+Pt2A
         w9dXyz6rjSVgHNIcIMHqLrB42e96QOy18idBpCNZsJaqr/TFhoSaMerlSQmt/DP8ZZa5
         f/mg==
X-Forwarded-Encrypted: i=1; AKwUvBxKThnbzy3L5jGIq+MkGos+Zn0ySlvz6tm/kOx8q7mlykTI4iAWPqpenWCHKvX3hg8xbF/mW6gyW2B1DSb7@vger.kernel.org
X-Gm-Message-State: AFq9FYLT8QwreErLDw0xg2QwjUZn4A6i1FFFjW7f0e1hGq6sPKvlV7f/
	PSufiGEO5IR8xEkeN/BuBGDEyBbeHEkeoMktR4/LeAnkreqn6dNkdeqDiIEqDSmInZwsEcboGuV
	xYM/6Nqc/g8iTdS46WN6WfWjLc9AjU6G2kcvv8ENAex7kwceUwq0EMk4IBZTTFcLY48s/
X-Gm-Gg: AYBFou0pBBjKfPoymNTOrSP58kXJiElfqOrotWX4GWD8hpGw13UjFEvc3ZfFZM9KiRB
	kVYWLRO/dTm4GCaLbMWw6Egc+x+Ep3hO2SAXpL+CuVbUZEPlrL2ozmS9JrqkfxDVj5Sj4gHFCpK
	wej+uefTml2F1ygh8qMRSb+u5NuMy/y5pCl7MkwuBCzQ7kmwFX7NDPcG9IEwt1KsRgnXI7Yw0ot
	1KVyy5U8OnI0qP5sbv7LHr5PJ5De4JWryILT/z72Bkx8ARs1RQ7En1oJzBFc+s82aU9tT5u9NCW
	bgwFN/rR942/lE7Dlmz8Oh9Yvf7OVakJEa4xzJ3qM8r2yg5e1aBewKMGjDFCbkvKwGBMYsS9QEZ
	Y4tXh589f
X-Received: by 2002:a05:620a:2988:b0:93e:b9a3:f47c with SMTP id af79cd13be357-93ebd246acfmr2003996885a.34.1791895760719;
        Tue, 13 Oct 2026 05:49:20 -0700 (PDT)
X-Received: by 2002:a05:620a:2988:b0:93e:b9a3:f47c with SMTP id af79cd13be357-93ebd246acfmr2003992985a.34.1791895759940;
        Tue, 13 Oct 2026 05:49:19 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.215])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ab6361sm4351081f8f.32.2026.10.13.05.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 05:49:19 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 15:48:40 +0300
Subject: [PATCH 2/4] pmdomain: core: Prepare boot performance floors before
 system suspend
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-genpd-boot-performance-floor-v1-2-a765dc83e6d7@oss.qualcomm.com>
References: <20261013-genpd-boot-performance-floor-v1-0-a765dc83e6d7@oss.qualcomm.com>
In-Reply-To: <20261013-genpd-boot-performance-floor-v1-0-a765dc83e6d7@oss.qualcomm.com>
To: Ulf Hansson <ulfh@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3217;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=b9uNQFPyon1Nkfa1BGZz4J1Q61BhK/8GrLO97o/igzo=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqzijGYxlUUuri/lNeG7eC/U7HgteZ4uDhrl0te
 KyIguX1OrCJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCas4oxgAKCRAbX0TJAJUV
 VuL1EACCj73YIsYWqF5lOjal7V7poRQGz6bx0fHmejZtmqzGxpJStVURQYNRVRbUIriEUYze8my
 fbEntYfKbXbSIzR3qfqn7vpvTyrscR/CrpZLM6M+rgpmmoP8HTDYkMBuFpEl/UumTI3lg/d+Rgc
 Z0R6WllxSO4baSVwPBh2IIY9DnbEGLmp1qrW7dw08pAqsdu+N33I6tEDQ28clQAv0NHc98lQTSJ
 AhkzGoCXMItZrwUmdbiKoUnS9fMWK29GPbQowaudcWpXfj18MbP78Cq0wwj7qfkLsxfHicc+Zhl
 gDKYfASivyBn/0DVJw2IFCB/WLUosS8ssN/9pJPb0SmU087N0+R/prvpxzacGIOKCqEm3GoLypO
 ajKBIxMhiZrXBA9+yBQvOj8O8+6du+6WXjTNGLyMzC/ynsILaBDIwTfepi6TAUIYNO6bn00U5sx
 KXsxpZL4j7CAsAwG4xSd4kyadUh595fzRbXOxvwVWsRZPTurDqYz4clqekv2O2SnU+jb8SLgzkN
 6mI86vh27mBW63J+gGby6P0R64taFn96PicM5d1SfJTvTj7bq0zbpNp0TPaHOPJEeFCLry1O790
 UuRYDCn04UGqJRLFCVhqYZVlphVlfReYPiO/lQ382zVRhM194SWk6sY2gvWb+1ZkfQhHh//NOiY
 D/cZ6I2xWHQl/dA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA1MCBTYWx0ZWRfX8DU2Toc0pd+J
 p5arza9lptZtnwJ5tO1CB7nQxqFtkAHwm5rhFi9Zyy9Iz1EH/zGPNs2whaG67MFR1wa5MioA/zB
 emca5N9EfAy1EgkO1IbtZDLkQF70aQfJMMLRzjoHqTKXJTIBvthWfQHJLGw19KnDw0yu/554w45
 DphCBNIs+m2UB40avMffAKcHE5IGLczFoi6SAfefcojr0Pxc1bb7SR8XEjyFFa7kZ7oiViIj7zx
 gQFp/+IDOkfvxH//OmxElo1jGyLl5+4w8viWdkHYJRLmUW7prFwOV9SusjEHR/qYdLAdCL5Ie62
 pjR4Z8dwE4Y+LAYv/SVtCVpQPyPuK2ko7XbNaXjzBwiHmkPvjQyL9ceQ6ThdOLTUBQ0lPphQrAt
 g7sdmEz8uIiztDSaNOL31DvLpQHY0Ly0JCDhGCrVAct0tegsx7uzTnDcjKgqrnqZekqewb/7vbj
 e+mMjiZ6ZORimujIY/A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA1MCBTYWx0ZWRfXzuf+/bRFMyr/
 Ut5Naqy931sfyf/F7EEmt81mEYWb6A7VEUbLlYq5oahUPx9ag9SpCA5y0zGIXuh93utrLxhIxL3
 mfJL6bP/mePJa0T5luOd/mN1RWqDpC0=
X-Proofpoint-ORIG-GUID: xLOpPeLiwZIZM76oCqLDt5e6c2_vH3_V
X-Authority-Analysis: v=2.4 cv=EP+TQFZC c=1 sm=1 tr=0 ts=6ace28d1 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=Rt3kCFFBWhWisHNmluDamg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=u51hWZNLl4U8JzI3j34A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: xLOpPeLiwZIZM76oCqLDt5e6c2_vH3_V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130050

A system suspend can occur before a provider has received sync_state().
If a domain has not been used through runtime PM, its boot performance
floor may not have been applied when genpd_sync_power_on() enables it
during resume-noirq.

Prepare boot performance floors from genpd_prepare(), where performance
callbacks may sleep. Walk the parent hierarchy even when the device's
own domain has no boot floor: a parent without direct consumers would
otherwise miss preparation entirely. Take parent locks in the existing
child-to-parent order and propagate preparation failures to the PM core.

Also retain boot power protection in genpd_sync_power_off() for domains
with a boot performance floor. This prevents the system-sleep path from
withdrawing their power vote while boot protection remains active.

Keep performance programming out of resume-noirq. Domains with their
floor already satisfied do not need another performance update, and
no floor is imposed after sync_state() releases boot protection.

Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/pmdomain/core.c | 35 ++++++++++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index 6f2b406ce049..4ff55175d899 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -1538,7 +1538,9 @@ static void genpd_sync_power_off(struct generic_pm_domain *genpd, bool use_lock,
 {
 	struct gpd_link *link;
 
-	if (!genpd_status_on_unlocked(genpd) || genpd_is_always_on(genpd))
+	if (!genpd_status_on_unlocked(genpd) || genpd_is_always_on(genpd) ||
+	    (genpd_is_power_unknown(genpd) && genpd->stay_on &&
+	     genpd->boot_performance_state))
 		return;
 
 	if (genpd->suspended_count != genpd->device_count
@@ -1623,6 +1625,31 @@ static void genpd_sync_power_on(struct generic_pm_domain *genpd, bool use_lock,
 	genpd->status = GENPD_STATE_ON;
 }
 
+/* Called with the domain lock held, before entering noirq. */
+static int genpd_prepare_boot_performance(struct generic_pm_domain *genpd,
+					 unsigned int depth)
+{
+	struct gpd_link *link;
+	int ret;
+
+	/* Parents may need a boot floor even when this domain does not. */
+	list_for_each_entry(link, &genpd->child_links, child_node) {
+		struct generic_pm_domain *parent = link->parent;
+
+		genpd_lock_nested(parent, depth + 1);
+		ret = genpd_prepare_boot_performance(parent, depth + 1);
+		genpd_unlock(parent);
+		if (ret)
+			return ret;
+	}
+
+	if (genpd_needs_boot_performance_state(genpd))
+		return _genpd_set_performance_state(genpd,
+						   genpd->performance_state, depth);
+
+	return 0;
+}
+
 /**
  * genpd_prepare - Start power transition of a device in a PM domain.
  * @dev: Device to start the transition of.
@@ -1644,6 +1671,12 @@ static int genpd_prepare(struct device *dev)
 		return -EINVAL;
 
 	genpd_lock(genpd);
+	/* Performance callbacks may sleep; prepare the hierarchy before noirq. */
+	ret = genpd_prepare_boot_performance(genpd, 0);
+	if (ret) {
+		genpd_unlock(genpd);
+		return ret;
+	}
 	genpd->prepared_count++;
 	genpd_unlock(genpd);
 

-- 
2.54.0

