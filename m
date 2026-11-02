Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793612846;
	b=YzV+qIReEeqAhtJqDJJcUAoNV3+SGB6myhWaBXMFd0GBt0SDKDCU2IZP2L9mFlnY+Vvp
	 6f9KSvkYcFp6Fo0aws+enjKS3h0LJZPcBKSLfNUQv11zuI6ixBFoEg78+l7hMtok4TbBn
	 dO6ctqOKJCiCHImRfCpekrx2P4XNAP0daLf28q644WiEwZEBruTZYhojaiv2TTwlFD8vT
	 4weKDz5C41E8kAUbPJ435w+KKQn2ZiRUQsXpxh6xA7OUa8TAr4BWhKCwaNrne/zUT3Lo3
	 gSunloMNz9TFFoybTC8xmwXLAF2b5lQBAc/wvaU7JOFTanv4hauM+GGA6lFs0fYQIHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793612846;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=oRHoL0IowPBtdkXq6acf6pO5kP7NbE/jHqMLo/D6VFA=;
	b=ar+npfw0WbVD+DgM7Pt7VWAc9srHa8EeUL64XDAVlz77a4x0+ph/qltOCyDjGMRxsukA
	 /fbZMoXcX25yAP0YgZXBiy36lnSgnCG+N0aIRbUe9F1ZN/XpOVDLVRVCstAFGKLxgy3UG
	 E2o0NBaWzfjfN3cT2Hgbr3cSn0jAGm3ffwOxmqiDLdTwxty9Wccv4K2lbBuiteh7Tkrp9
	 rY29m+vttvEzhWI+vY3kD1+gjj+HzKdvXs+4Q8os+GQi64eMH7rlK39ElW7VqKwcaUQAa
	 70nBZ9AV6sk7ohvCDDr/qqiz7+TdWXj/kFuye8vnjaeCNjVW3iAhaaBbpDDsqIh4SGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Wm3QIn4f;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OW7SKwWc;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1598606A335
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 09:47:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1598606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Wm3QIn4f;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OW7SKwWc
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29B1Fl4015002
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 09:47:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oRHoL0IowPBtdkXq6acf6pO5kP7NbE/jHqMLo/D6VFA=; b=Wm3QIn4frgFE+1bs
	qRJ6VpTVrvD6xXIAbqfeIgJYWopTXPhXjjyAQi6QRVMtcZNnvyUtIqYw32N0YG4u
	Whc4M2Jv3Hl5RqaT7Suh27/0ijSoYWfXWiEqvjBGE+y26E46NS5PyG/+umL3fNzT
	LT+27sc06bzvGmPdb52W6gnaPWdU/Ii4RanNX77fqAX7WdHY1PrSzzuFmwv3t+PL
	SF76ka8kLJIFFUuJvV7/4mj32d/K80DOSAyvaNNJEoNMWUh2p9upYTNaC1L3DU2y
	089/sz8ACIQDnnGkQ1mpFTcT/zPoyTn0YJIHc5LJ3JYNCEMjPq7gdV151HnCQdVw
	Q9ty5g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7b6pdcm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 09:47:24 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ad30487d55so4249906a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 01:47:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793612844; x=1794217644; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oRHoL0IowPBtdkXq6acf6pO5kP7NbE/jHqMLo/D6VFA=;
        b=OW7SKwWc1GsjjKUtoROXvYMewXz8uUE3dhvyBCwoHqn7hdGQ0A8qSzyJWJsgJwbGTT
         y5RqGjZlvR94wstcKSVcUca9dmyfVaQFoH6DZpVAFcbuS3teVXOQJkjK/ViH0fGeWZV7
         1c+wPE51TdzhvcwjFENhENxmmL2DZ+g4xz80fDbZq56fT8gdoNh+l61lrO+oaLHf+RNi
         PzuG23OCei/9oqXyL++kLfzgxOsg5PhV6BFtl8h9o+lCTO05vtgK64VA1G6YnJ+n9Gug
         qu9CiyuoXafAHZs2e2Vnlvn07bpxR35IJ+l09ZEP3qYD2Y9Ksx/mHHBFy6B98pp9c23X
         7Raw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793612844; x=1794217644;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oRHoL0IowPBtdkXq6acf6pO5kP7NbE/jHqMLo/D6VFA=;
        b=2XXF5OD0ZobfN8G6x2gVfVBKHKnIDVq9stwXTbk2rIJ6eFqMWAH50fGNi+Pg9YLlIB
         FRo+qmqCNyRRu/sdBYn7xq2nzWoYlcH4u8E8rJxs9IE7fu0ewZnFpAnkvrOK1TUZpEcO
         x8DbcViXdSlT7keQZi3SIqRt7EYjlrPLco6CVTVjKa5QSCij/aWrrBolWx9pAYRZnuOT
         yAwpiawPsxwYev6Wuu9JcsGGUx9mYwTcr6WMHRIaebFYbHLGURbp/8urq4stS+AkGAtV
         pQc81dEFN2AsphHBdLB5Py0a7QUe9RDcc3SPROBxtqqHAnUxkdTPMpBdb3gh48zhFUdG
         jDTQ==
X-Forwarded-Encrypted: i=1; AKwUvBz16A0N+Xs25EleKW6gwyUFEhKYn4HaR6hFNjdLjb2ZdDuu66TsmagTYMxSK6buPfdUwM48BTanuzvrZ8A5@vger.kernel.org
X-Gm-Message-State: APuU4Z9Fa93iji+qjn3gdXSNYMGakSaONrfNWGA9IHGyTLra5UBEzfca
	Oljnh1k7vbR9yucdU2KaFHzF+wiR/GXaA2swwPcinE2/yUEBe7qUfW6Aat63Q6UDiv1a0n/6BoA
	eO859CViDF9WG7qrrgASWq3ltp4cPLhOYhJH+zxz/vDd0Dh02afvP7n7ZaXQkeP4mWqy8
X-Gm-Gg: AYBFou3nKykIAi3QQ/z5s0gOQq6rRJWD/2ozBL20vIh1JP3pYwkkKPMQW+3FMm8qpRe
	81aTE8x8Dtyzxj6bYw75G27v5muy6aX+jfhQtGgEVpa8xal/aaaMOqE8M/hdC6sPAxo60JQrOvn
	Un21sGBGuFBByg3XtVh9Lt08a7RUUpu4zijYWRBnKTzWoUYVblfeqRt2QTY4pIDfs5iQJMiyzQN
	TPLIaPWPN9LcaoGrUEchvE3ZFAbWX2ehiZGGP9cjiGyDis9WW1koLa310QKJMO0m3UIW4CukPM4
	blEpwXIHGZi8xnbn0YhVqarNXERS1uIjKwGe51mx3nb0YeVelaaLj/KanXI9Etn2g0Aq8f3dZLp
	kaz1SBaauxAV7Qqz45nFxDbvEbIJfuVbLj3CdZIE2yLBEDDCn6Us64JwlM/6nbaitLat7gDYgN2
	7v+ghkuE5DUUnmV0aN5VYoJwUDJt0vpg/b430=
X-Received: by 2002:a17:90b:268d:b0:3ac:762d:79ae with SMTP id 98e67ed59e1d1-3ae895a5c65mr7491754a91.2.1793612843766;
        Mon, 02 Nov 2026 01:47:23 -0800 (PST)
X-Received: by 2002:a17:90b:268d:b0:3ac:762d:79ae with SMTP id 98e67ed59e1d1-3ae895a5c65mr7491729a91.2.1793612843324;
        Mon, 02 Nov 2026 01:47:23 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3aebaac28c9sm5053234a91.15.2026.11.02.01.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:47:22 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 17:46:29 +0800
Subject: [PATCH v21 1/8] coresight: core: refactor ctcu_get_active_port and
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
Message-Id: <20261102-enable-byte-cntr-for-ctcu-v21-1-231e069b7853@oss.qualcomm.com>
References: <20261102-enable-byte-cntr-for-ctcu-v21-0-231e069b7853@oss.qualcomm.com>
In-Reply-To: <20261102-enable-byte-cntr-for-ctcu-v21-0-231e069b7853@oss.qualcomm.com>
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
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793612828; l=3915;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=+oZshRSJK34bHEGxdoF7ktkVcnA/k42MY2hxHJFiV/4=;
 b=RghL7vHLQ2LLWPeyClO5kOMvn0TiqRKkbIQ8KwYjaEdz6XIdZ5rR8t9NMisjNHMkl6xdUkz9v
 l862wx1cR2IBqXWU77fiZ9kSzs17FnpwmcgZCzxTJNYUQv3jmOCe9N7
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: THaQhCcd66Kznz35T_Xi-99xP0FgQZIj
X-Authority-Analysis: v=2.4 cv=QuvLTlyd c=1 sm=1 tr=0 ts=6ae85c2c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=lyq7_Muqgj1vGRpOYO0A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: THaQhCcd66Kznz35T_Xi-99xP0FgQZIj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfXxBYPTpR+KDsH
 QMyXHy2maX1sk6m9rW4MEelyDCd06xhqsf0gzQa6CEt3IZwjBd4KYtE6JJLBwsfxgpG8LhTyG+s
 AKEPD7ew1zUvW89zWgMjPLMxyFlyESE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfX7B85CLhocYcv
 h55J85VPxY34nUkSC6n0/BVtbsDSQgQWrxHdsfZFdEhZtnhuvWD4T3UmUz4gtyWIoQKE1d3Lo7W
 ktY0cAcSr7n7Mo7y3DYenbO16ERsAwq0qKMgzcUbSBkzkM9lMN4BeT5uISumyf940xJ21NlNmBg
 TpL+JZOMZdbujy5fhljSDE1rABUmxvF65s1TudMDyKglaej/EgjM0J/4lMFtfHvsi2/8Iv1LlsI
 cVI0sx4BlDWLPVCu3kEEoANtwfeLduDSzyhpUz5o73JVZFBxewj/QoqKXz3AZsYOIyeWDO3hZE0
 8iuRQksyBrUN4+ee1MzB6KJqn7WRw6U1ZLKxS1tXmSj/o+DXZ6tZY+puujp/cmBbhfpKn3wiIc7
 Mbj4CMLQlq+I6BNbGp2s5sj8Ruql8XVN+EbCggoomC0YMvTjSLSFdqqt7WxEXy/7VucKPhkvd5C
 Sr8DU5QycIduCkR6tRA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020038

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

