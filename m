Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF02351C1C
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 02:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790042798; cv=none; b=cujfkJGyr3QfuNAvF4zXbdtOQvGCVvTboFOWjALyfzsE5QfP/0gx4FlorIqPakSBk3Gn+LgY8/6AXXPeuaOsH63cF/sGeDzH6Om5y4cd8o4SrvnRlZ9/NN6Jjc9LMOjJLpmAQf9IYllmnBvIDyV+Qzn/j6KxuWhFM8nreNIa7Ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790042798; c=relaxed/simple;
	bh=sYbc3ej1uxvGbp7fQ3xwsiXSUYm/TS3BPEK3mBAv/HU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jmYra6WCul7zKPoK7i0H7pxXwpC2L+CTfVB60wBxpvvpFLmSH/HJ+5x2rfsQUYjkXDttPoc6hkB9OMcrdkTm5iVzPYs7g/maR5vZbKKOIQk4uFk1l0Q8xdBvh3tIOK3RYkTR2UhDJMG6vWxRh5uof6jaB1yF3oQmzI2l5idY1dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GNzxKV1l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=StMSNi+F; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GNzxKV1l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="StMSNi+F"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M00HRl2824304
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 02:06:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=MNfAeP8Wdcs1DlxdNoGI0v1RKws/Tqf1mS/
	DQs9SHeo=; b=GNzxKV1lFBz0drrzvIqC8/hVgrRLn/eG2/8JGhIwn7lYwPRWr27
	3BvaM2fCTX9D1xWE63FyCRXt7aZ+kfhwRDW5nlo6oeDXm1MIz3xTdZiFVB8Gc5U6
	aTo728lYhFDAFCB6287SpNSo6izqZKGnfnHsDOJMe4QGfMN7mo72Z/DjIRGtjF6f
	DWJ9KKE4pI/NPoKATtAEdSPT49KzrJDYhAym15ECIOR4wMnoK3elaC5ywfpbd14u
	oklfaGuQZqVGsSbv7UIeRkR5AmtvwYM5LLOQ7a8PjhzS3FNSWTsODpYt48Im+amw
	ANOZ2pV5Aj8YwfLjZXyX3guv6NyPezO53aQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu3cskapa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 02:06:33 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38ea32e57e2so6758421a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 19:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790042793; x=1790647593; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MNfAeP8Wdcs1DlxdNoGI0v1RKws/Tqf1mS/DQs9SHeo=;
        b=StMSNi+FpopRSY0z9fdleXuXoGZdCWsjyzesTa5ofwGbElJPa6wgd3mc91b+uQbgRX
         k2WaX65Zjfer6HCy2J+coUSMy7y+7Z0qOGhGwloktZsuiWdhpyJI+/2BqMHJFBe7uN1s
         PDVichCP9Q+xZnPdV72QUByjM+KSXP5RE84YFpfkVlqP1LawJygIg4pfVh8kQhFenZbY
         lT03IkkQTFsEB6w1Dsm12H9po3UdXQdZpcMRSCQvn4Hw+X/RBJAVKlQ0SjP/U1gEd9uf
         4UPdp0YRCIeHA2ADMtYgpfkU2/bugteWj55jZyI3unIw68D4HOnj3UH6TlKQwu9m2JY+
         3Lng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790042793; x=1790647593;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MNfAeP8Wdcs1DlxdNoGI0v1RKws/Tqf1mS/DQs9SHeo=;
        b=ghZR9mk6Z1BPaynYisA8jNoQ4PDfpkgUs+xx2GLC2MJU/U3m7Jf/AmPHjCJ55fDwQI
         FP96qbu/9b6BqWvgo8grWW/Yoj/WXjGBVx/sL3UC+8hkb9FjW5c78TQXW0O7t0qFoqaF
         RBS3hVVizzXBsiJsyjBYRmonPKX43c0caGMLsetLJtIH2CBINhgDj9idshutvDcs+2Bc
         B7SKbvzQe6JnoJfuX3MugtUgz4Hg4MLruwTXPgQPb6g4UMhWuf9LrgR4nR4CdBaynulQ
         y/G8QMcpkB/pOr3ZChJnVFnsV3LrG6bs5YyCib7SznPobRYQvebma0BpOk0M5HlowMcE
         e9Gg==
X-Forwarded-Encrypted: i=1; AKwUvBzO1M6WSLQp5WP15aFB+awiuy9rAvzIx8fmxcSsKTSYX5CqgXt3GPqxyiY4PSLv4WSuZUq42hjqh33kP18f@vger.kernel.org
X-Gm-Message-State: AFuF++mpYrwGNB0vT72DEOm9uD7JEG59ua6dEtRKOJgLRosuwRsXd78R
	u8QSR0lpfKeICTMNtyf9xbE5nfiQUUq68xCN/g7m8jy07lwteh+T5k6VlyMFjDlP1ZW/iNDNsEF
	yylxvzUlo52lFa9jlFZbzY8bN1IdwR3NbcvGeFRFJiCxA3MBECgo7M6xsvpqNx7O0cqeq
X-Gm-Gg: AYBFou1YYanvtgCZjZXbzmvrnZ9kBHBPuO5idSDUOc1vmmBHVnEOd7qd18Yw5bFAXBX
	3NlfuggX2i8yI01AC0igiNy5uwNLtt63QrUqD5Np2vPOrNa4vNNBkewv9IFk4w1ZtQBb/5x9d39
	I8Vt4/b4sSR97XL+cLFO0Q/mzaoO7SVxi6SsYa52e6WkaO4hNdEd/3qVEEoE0oSeAPbK8wYc2Og
	nTKNIwx3FbKRE2n/58vkWMytpNwXA6OBWtjON/TkEosNlDJRfv3TF7i8/SrZ4FPOUF0D4/0Pofk
	LJP7H0LQr36U8LyH49pKG6Ec68QYaLj4KWmGy6Cn+3+GcRePrTtRUZkHLgW8yMdxVKNpgExVbpp
	H1ObksyvXAgXMn2LZnPv2kcS5RizyFgr5fpexC1C0kgWVMmjZcK6QRU5z4Us=
X-Received: by 2002:a17:90b:4f81:b0:39e:4c7f:8b1a with SMTP id 98e67ed59e1d1-3a06af1034fmr788203a91.31.1790042792603;
        Mon, 21 Sep 2026 19:06:32 -0700 (PDT)
X-Received: by 2002:a17:90b:4f81:b0:39e:4c7f:8b1a with SMTP id 98e67ed59e1d1-3a06af1034fmr788170a91.31.1790042792021;
        Mon, 21 Sep 2026 19:06:32 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e6129ad40sm1044028eec.12.2026.09.21.19.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 19:06:31 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] interconnect: qcom: Skip get_bw on QoS programming providers
Date: Tue, 22 Sep 2026 10:06:23 +0800
Message-ID: <20260922020623.398913-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDAyNyBTYWx0ZWRfX1lmAKEByMUML
 fXZzNtycR0LNwQW6EDqKCl7hqtDwhhzpjQbSJDWHDcc6iLk8/E5H/laZqfgKK2o02hu8QFIY6Dl
 XGRP/bQjMvbRrTTa2V3AAPyMtGMDFjQ=
X-Proofpoint-GUID: VUoC7gKWlZcdWSLcI42wq8wlPm8FcVUc
X-Authority-Analysis: v=2.4 cv=QovLTlyd c=1 sm=1 tr=0 ts=6ab1e2a9 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=PElIDr7-s1pVZMEy5acA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDAyNyBTYWx0ZWRfX0Aa5ZKnhMflJ
 4ad4/uISx1DW6+TReYxGATCDzJEj7FXT1pWkyP9IR1PYXBcpOMx8ltcNd3ex43sGJhQJIg3V6iK
 HU6gmlftJaksuj790OTJ0aROYLh7JIhHfeUKnibXqjdUacX3/5YhxcoBb24Q/fP6KhbAN8AYmoo
 TcYfu3rEwIruO9LQGG/dlK1t7uFOwI69p0+R+z8bERtIKJmQUQqKpJjtK13qUlKbKLjRt6UCdzK
 IZ5G+HT8EMkDhBxBQwifkkV730YaoHFE9mEal9eXSVxxkBRXxtkdf/ngEgd+MpC0JZoHzsIvRZJ
 vLW8nume7WU7reSmHpnot+C8hitnjd9tzlPRez07wic8oBUkMZKkffYy4tLlCMym7Kb83MzfbF4
 KhZpm7nz4az533tuO0qKc+bASHZHQkV1iQR8TfjqYDrZZmAuXOnFfNl7U7hWsbmwv3isozU2kvP
 dRkifS9+2u45FdamoZw==
X-Proofpoint-ORIG-GUID: VUoC7gKWlZcdWSLcI42wq8wlPm8FcVUc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220027

Programming the static QoS configuration in qcom_icc_rpmh_probe()
touches NoC registers directly, and nothing in that path clocks or
powers the NoC first.  It has been working only because the
interconnect core used to vote every node to INT_MAX while adding it,
and that vote stays in hardware until sync_state.

Reading the boot-time AMC votes back from RPMh removed that implicit
guarantee: a NoC whose BCMs come out of the bootloader unvoted is now
left unclocked, and the first QoS register access aborts.  On Qualcomm
Nord SoC, the MMSS NoC dies while programming qnm_camnoc_hf, taking the
board down before rootfs:

  Internal error: synchronous external abort: 0000000096001610
    regmap_mmio_read32le+0xc/0xa4
    regmap_update_bits_base+0x64/0x98
    qcom_icc_rpmh_probe+0x44c/0x540

Only install the get_bw() callback for providers that do not program
QoS, i.e. those without a regmap config.  Providers that do program
QoS keep the previous INT_MAX initial votes, so their register
accesses stay safe, and the rest keep the benefit of honouring the
boot-time votes.

Reported-by: Bartosz Golaszewski <brgl@kernel.org>
Fixes: 11a44c6087c6 ("interconnect: qcom: implement get_bw with rpmh_read")
Assisted-by: LLM
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/interconnect/qcom/icc-rpmh.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/interconnect/qcom/icc-rpmh.c b/drivers/interconnect/qcom/icc-rpmh.c
index 7f2b5673629b..38c8c3cb9a38 100644
--- a/drivers/interconnect/qcom/icc-rpmh.c
+++ b/drivers/interconnect/qcom/icc-rpmh.c
@@ -310,7 +310,13 @@ int qcom_icc_rpmh_probe(struct platform_device *pdev)
 	provider = &qp->provider;
 	provider->dev = dev;
 	provider->set = qcom_icc_set;
-	provider->get_bw = qcom_icc_get_bw;
+	/*
+	 * Programming the QoS registers below requires the NoC to be clocked,
+	 * which during probe is only guaranteed by the INT_MAX initial votes
+	 * the interconnect core applies when get_bw() is absent.
+	 */
+	if (!desc->config)
+		provider->get_bw = qcom_icc_get_bw;
 	provider->pre_aggregate = qcom_icc_pre_aggregate;
 	provider->aggregate = qcom_icc_aggregate;
 	provider->xlate_extended = qcom_icc_xlate_extended;
-- 
2.43.0

