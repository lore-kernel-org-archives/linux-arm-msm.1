Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794988976;
	b=QBrEcJ7DEZAr6altBu1MvW6ejKOfyjpcu88lD9/zjFZn2oK2t6DdTkW3J3XCIj3NtLSG
	 UlDEZw3Iw8Kr+98xg7mqf3GApq9d6KzJtqU2qoSaKm0I8k5+OVvU807d8t28pnyHrtKfx
	 5WHlr5Hcy/sqIhxO+Kzw/XAo5xmuaD6X3QSQjq7Qt9y7QlKM0o4cHZWbHwTjEto+p8GpS
	 B7DL+TVithyQQXGklkdyWra4gmFOzCMu5B2pfj0eSfy91CLGxfexaY5Ka0hAcXszUz7iz
	 Q/LxCLd65++++Wo71KU18Ooqbw1w5rJg2BMNR8h0RT81v+Lsr0ZjsElycWQeW1u/odg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794988976;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=oRHoL0IowPBtdkXq6acf6pO5kP7NbE/jHqMLo/D6VFA=;
	b=NR3dx68yna7mkC7hjNI5pJQ5P0icWgAWRsWLlHFdaGSDTNF7lE4PapThUrGH3NdI8/zI
	 3PtLZIfpxw9KaQk40gyqNDTItf/ufgQGbeouDNl0ZYjGJOqqXRs+5pHWIyQsn1Bi12mIz
	 dTacDvbb1pJHnai/suIQwFOfmdpfRSAYpO41TaXZVppmLXIY4QR3AAst3OtnKLlgDW4vO
	 uKNLIrr4bXJpE/GhyidXh6398U04DE50T4RFVAOL0/+i4cuJH4TI6Tn7/UVum/JnFEhFv
	 D6ZWakl9zE5etx37oM1y4a7Yypga9XxPPBUnMePhVF8PNZ+AwBNtd3GMXOVerKx8PrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fUsSYriY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GkI82qww;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A123606A331
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 08:02:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A123606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fUsSYriY;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GkI82qww
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2VvM14059958
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 08:02:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oRHoL0IowPBtdkXq6acf6pO5kP7NbE/jHqMLo/D6VFA=; b=fUsSYriYxUBhe2ok
	LUURC3k8cJqJcNOs2tP+TO5gfMabqNHoNa4ji290GF7xjVo02WiMbAsms68mrMcO
	pfVNMPjcgzXFU4kzTivDN15V+0F9ZG4RarW+ExSShMS/Z4FadHdu78FJRdV12U1I
	vtKaGBoKGAFMhEscbguyVzNB0VHe9MkRF750M1aWiEGDv5DfhBoXJMCnL+dSGLWQ
	8YMkg1z6xc8mefOkLCqmij8NgMIh/z7ZYTxrzzLo88nDtlq5/pzfq6jNw82oEC6J
	eoovRuRZruiabIBr3mLKMHAnrt/x1J60j18c3eFeo5gaDDT9YMDMJi1/E4z40hlP
	Oq4b+Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvchy83-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 08:02:54 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ad704d4760so710079a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 00:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794988974; x=1795593774; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oRHoL0IowPBtdkXq6acf6pO5kP7NbE/jHqMLo/D6VFA=;
        b=GkI82qwwJY7PYhEK20nsAzg/bTVPx4S1X024fy/vfO+nDNc1ins4Y+ZrYONLJhuQq7
         ybjJPNp+humqZBcW5jp2S5pTnlcxXyTrJk9WBHn/pHZKSJFqEP4VuBE42DAucn7kddh5
         oLdQomzswe7Aj5IA7ozBJ0WOSvqH2HbQbIIg+hGHMLhBtS45IQ8w+pJI3YEhsLUoF/kY
         dLtxNVJmPvqsEXM4hW2aUpJIF+eVyTbCIzdCYqbTx5ixa4STUllVYA9WtU7li8t7KA4a
         Bcl4a1vv/KBqfKSyb0UijZePtExvM3XyPSTSPQ3fqQXBxquDcI1e939ab6CcQeKnlUh2
         nWmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794988974; x=1795593774;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oRHoL0IowPBtdkXq6acf6pO5kP7NbE/jHqMLo/D6VFA=;
        b=PXX137LaPqrOlvjxD1FQjXdQPtnfy9CVwb7UKjKVUYsxYLm+m896Hk+6RdjaO8g2Ys
         jOoJxsR9DaWSm62dym1oX/vweuQGvPBN35hQQBc6QwRYIlUz+oJ3vwVdLtNJhJy7g9O5
         QCz1MKBsMYLgd80cQH/avKrLpM61NgvwwXltAf6pKBCorh/0R5hBzNS9A7Cp5qszCuC3
         DT6QgukzIxVAmnWStrPo2KbdCsv7hSdYFyQsJWM7FnJ9SdQe36O+j9F+u8uMAUeRvSg+
         D8h/72uRTKb3a9teeXYoFq5DkGzax0ly7XwIctjAs7WF2k90IfgIa67UmRl11i1Al5rG
         z9Yw==
X-Forwarded-Encrypted: i=1; AL+hErGikpq8qo2cVzpeifp9lojH5xOZKQLLfnBKlidlGX9NmWh8T6b7XNYgG7ZbH4wPIs7q4Xpn/Tqg9eo0vKRN@vger.kernel.org
X-Gm-Message-State: APuU4Z9fvW7p8zQN3e62aSFBDXe+uCLJu9HLtBgke0IlsuJG4SDf0/ew
	WzgFYGwpGfLLDPThm1eJyJmgduT36tnSJi3h9fcSCC9PAR8T4sTHKY6667lmyWwH55AwPuY18fH
	9d4lunBcyQhw+zxF7pa8tGP3aF3SoJ8BsmF+JvJdZfxXQwMzJ+n9QUv9uz5/cu1ZA193n
X-Gm-Gg: AZFdTZf+WOvVe4Se8huLt2hhmCH1lAZHM7eZ+SrefOyN57gt0JI4N4hoohOZhF8D6lT
	BIyv6GBz/ImfTauD4kluf2phBl3kREbma1Zw6MjeD6n+v5Rr9n/N/g7kWqxsyJTc26wHfl8GFwd
	8pu7Ft/7f+PnJnkb5suQzD7kn3Qo2Kk5WCETY+o9PeYz91nJZI5V8WqsGP1N75hzm0kczy9R7z/
	F0o7+xO26FJWN5HPmVs4XPf+lcPNRs+TU/xQAJIUXIo/5GHm8sTrh8XZ+QVNo/CmI5r3oaSXsKR
	cRom4A490gdYtLqoI7WPG2G6/Lban8fzwnDBLN3O0e4FTLSlkWQX6TMy+JLaYlgd0iOpi/OCtx0
	bgQsJp8yXIG4IK/qqspuKIq4HvcnMnJsRBgHMKlilgtWK78ws+edaB2MnpfYf7hMQCu3jzXmIAo
	sYHrBhFVUa7/DBsVn0J5ihqz+8GMTcOMotNSU+
X-Received: by 2002:a17:90b:1d47:b0:3ac:8ee5:e007 with SMTP id 98e67ed59e1d1-3b3d07a7856mr1524825a91.20.1794988973715;
        Wed, 18 Nov 2026 00:02:53 -0800 (PST)
X-Received: by 2002:a17:90b:1d47:b0:3ac:8ee5:e007 with SMTP id 98e67ed59e1d1-3b3d07a7856mr1524802a91.20.1794988973176;
        Wed, 18 Nov 2026 00:02:53 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d19b6adasm3004072a91.9.2026.11.18.00.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:02:52 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 16:02:22 +0800
Subject: [PATCH v23 1/8] coresight: core: refactor ctcu_get_active_port and
 make it generic
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-enable-byte-cntr-for-ctcu-v23-1-67fd9db6bc0e@oss.qualcomm.com>
References: <20261118-enable-byte-cntr-for-ctcu-v23-0-67fd9db6bc0e@oss.qualcomm.com>
In-Reply-To: <20261118-enable-byte-cntr-for-ctcu-v23-0-67fd9db6bc0e@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794988960; l=3915;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=+oZshRSJK34bHEGxdoF7ktkVcnA/k42MY2hxHJFiV/4=;
 b=xita3mZAUpFh5kamyEmNix6Ry1Q4ZUfdHYGcvVo5ikI/KmNGgWqCgVp6rcFIMiHmcpu91b2vy
 5ycxre/cwQMBzLD84GCg1z2XugbfBA5scLIMdVDdssV1DuLe0zKXG2k
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=R5OWitRX c=1 sm=1 tr=0 ts=6afd5bae cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=lyq7_Muqgj1vGRpOYO0A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: BpvzCGki1Oc3kDghII19rxx5T_lCGqZk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzMSBTYWx0ZWRfX/oB8XvrPaCEq
 3oEf8DM2LsucMkr+HZ7DPVovp1wGRzVaP0e8ZFGTsSrLDWByyjlQWzeku+Roh87g0dyXCtSjpWE
 uDlzPBL6Ihg831AbiyNAO9mMWMRoK+Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzMSBTYWx0ZWRfXznyGEnPSGT0g
 JwTGXejsP2A14MD4NDdbHXkwNFdjKLcPRtd35Sh91CMpz3NBc3tHy2sZ8Qgd2lKJj/Co8nMFSCY
 vnUbICv17uozZwmyJVHd2+CBn19AY2bHHRxTFMMQGiGcP/K88UoW/gXN2ZlRco/PBM3an/gE5yM
 hZBbjuFtBOCoo59Lgd5BdnJi4aoMWOmeNB5jrS1javx+midwa9s/DI7wwWCJus79V+gM12LsCzT
 1A4uTJx10Ir9YQxqLd4dC7HfIcIHyp/x4p9Y/BOzlai5/iVXym3ExIoqyED6SxxoqFudfbfNzXr
 O+9RYHhHv5Oapd0vR3m4kFyBWEPPu7kzkswT6LRhasQI6fjSVZ/2s7YTFCS7IvA412x8nkT9zaq
 EX5GdZ80CnFR8N1dDDf27PuuvC62bWvDiEl60wUeucXtsXj0B1sQVERiwssC2ew87inTUUIfCkl
 Ur/i6/5WofvCWcAf3IQ==
X-Proofpoint-ORIG-GUID: BpvzCGki1Oc3kDghII19rxx5T_lCGqZk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180031

Remove ctcu_get_active_port from CTCU module and add it to the core
framework.

The port number is crucial for the CTCU device to identify which ETR
it serves. With the port number we can correctly get required parameters
of the CTCU device in TMC module.

Reviewed-by: Mike Leach <mike.leach@arm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-core.c      | 27 +++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-ctcu-core.c | 21 ++----------------
 drivers/hwtracing/coresight/coresight-priv.h      |  2 ++
 3 files changed, 31 insertions(+), 19 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index d2f9c1fb77d9..32e8b3e51519 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -773,6 +773,33 @@ struct coresight_device *coresight_get_sink(struct coresight_path *path)
 }
 EXPORT_SYMBOL_GPL(coresight_get_sink);
 
+/**
+ * coresight_get_in_port: Find the input port number at @remote where the @csdev
+ * device is connected to.
+ *
+ * @csdev: csdev of the device.
+ * @remote: csdev of the remote device which is connected to @csdev.
+ *
+ * Return: port number upon success or -EINVAL for fail.
+ */
+int coresight_get_in_port(struct coresight_device *csdev,
+			  struct coresight_device *remote)
+{
+	struct coresight_platform_data *pdata = remote->pdata;
+	int i;
+
+	for (i = 0; i < pdata->nr_inconns; ++i) {
+		if (!pdata->in_conns[i])
+			continue;
+
+		if (pdata->in_conns[i]->src_dev == csdev)
+			return pdata->in_conns[i]->dest_port;
+	}
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL_GPL(coresight_get_in_port);
+
 u32 coresight_get_sink_id(struct coresight_device *csdev)
 {
 	if (!csdev->ea)
diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
index 9043cad42f01..739105acb0a1 100644
--- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
+++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
@@ -116,23 +116,6 @@ static int __ctcu_set_etr_traceid(struct coresight_device *csdev, u8 traceid, in
 	return 0;
 }
 
-/*
- * Searching the sink device from helper's view in case there are multiple helper devices
- * connected to the sink device.
- */
-static int ctcu_get_active_port(struct coresight_device *sink, struct coresight_device *helper)
-{
-	struct coresight_platform_data *pdata = helper->pdata;
-	int i;
-
-	for (i = 0; i < pdata->nr_inconns; ++i) {
-		if (pdata->in_conns[i]->src_dev == sink)
-			return pdata->in_conns[i]->dest_port;
-	}
-
-	return -EINVAL;
-}
-
 static int ctcu_set_etr_traceid(struct coresight_device *csdev, struct coresight_path *path,
 				bool enable)
 {
@@ -145,8 +128,8 @@ static int ctcu_set_etr_traceid(struct coresight_device *csdev, struct coresight
 		return -EINVAL;
 	}
 
-	port_num = ctcu_get_active_port(sink, csdev);
-	if (port_num < 0)
+	port_num = coresight_get_in_port(sink, csdev);
+	if (port_num < 0 || port_num >= ETR_MAX_NUM)
 		return -EINVAL;
 
 	dev_dbg(&csdev->dev, "traceid is %d\n", traceid);
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index dddac946659f..854c0a3cb080 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -155,6 +155,8 @@ void coresight_remove_links(struct coresight_device *orig,
 u32 coresight_get_sink_id(struct coresight_device *csdev);
 int coresight_path_assign_trace_id(struct coresight_path *path,
 				   enum cs_mode mode);
+int coresight_get_in_port(struct coresight_device *csdev,
+			  struct coresight_device *remote);
 
 #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM3X)
 int etm_readl_cp14(u32 off, unsigned int *val);

-- 
2.34.1

