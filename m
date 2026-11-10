Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280963;
	b=QH2p4psor0LWP7uIXCpP1oqzwuLifQ9Oq7S6ZLQZrFHyx1CYhHfiHD35pbJtzFfnGkub
	 9Ka9G3QUBMXDPWlfdv5Lk7LcZ42rlPXOOKSpLHkx1OLdyzgI5V0R+EKBWDmd0GhiABDRd
	 pFDrkHyfVdF20fipsv8SB7P8Oho3GWM1EP+P4yDg6lWpwsKQLdBS/VW5JJVbeB32b/lTn
	 xgYUuTHJp0AaoLugbnGcGp1gzBA40gOAHZwnRhCHyMm4Ub8nmwFrABOMmPynuBKfwvHXe
	 oXK/5Wrc6jtx22pBjL6yc4/FrjCSp3zBykRv3VzhdUS7w7gLxN6g9FN0Mu0Kr99NEBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280963;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=K62i/P8PbkS4nusY5tpqbkn28J4X/MrUcVukoPMJY+I=;
	b=DGNao88knwO9eYMIE6UeuxlbnsuRkZHMyAdCRdCLCcjyoh2AWIdc4z3GyQufnOEokTi9
	 opF7md9OZ5EjcS5DMkCJrOgTEiD6M6CGn8PUP2Fr/HSG1qpU0Wh5hMkyKUS+jydU1DJfq
	 fPpNHCye/e5vBVtCJeiNVT7H91R+fXCwB3QqubVV74qcmOKGOA9y6fKPueEv13yRjaNfe
	 3xbqSIVhWqOorwYv7lT7T4RO+qSvw41kj8OWKdSEYCgcalyfxL5QtU1D06Q7LWVNiVvR+
	 AtR9BV7ekYCClKL4jKWkj724MWucL+buSEXdPXG7sCDbFGFju03BI8OsdmpdZL66b0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Po4jOEZc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="kNd6/yM5";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91144606A332
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 03:22:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91144606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Po4jOEZc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kNd6/yM5
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA0j7Ds764341
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 03:22:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K62i/P8PbkS4nusY5tpqbkn28J4X/MrUcVukoPMJY+I=; b=Po4jOEZcBUQbQeze
	GcJKCdD8Vk2MttFayOzP/2XrF34DaUEekOMLcs376n97OS2CLeT+X7yJE5YO3uxs
	Et+Pnmd9rqms35GCdxAS2OGpVdTAXNvXeVfcx3zBAX20I9vVQYBePeqLSw8sTnwV
	G+kN3lIFclZyEmcNgLgIE334Tup6oMIdlIiXOselYyo4uz2xTpTutE62q3ujXtVD
	9MqscxJBerS3erquUxCWkjqgFGgWmp/u3HIdUi52L0rmIEAkPsOfz059TVGnGolG
	MGxXEVlZsbVK3wwkPSnQGayB9POB9L0JurjHBqEpxKhjA2A7ssGEMXbzRd8VqCmQ
	07/0AA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hunwkh59u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 03:22:41 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b08364cdc7so1390371a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 19:22:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794280961; x=1794885761; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K62i/P8PbkS4nusY5tpqbkn28J4X/MrUcVukoPMJY+I=;
        b=kNd6/yM5YTMp9xfnb/IR2bgWSTAho/gl5SZ9VzMSXkfLTh05JYDmWkTp5bzw2uwsPL
         ecDOS1H3edATOsd2PvdrudW0/tRjWyzT3OlxQmrYHfeMJEkdmId6IoesyenS6806TGSu
         BjEBRUxHrf4RL0KlGDtfx45Q4o/9KkmEs6KajVRqmElA2LdP9gOjDOAiwRJ1kAI0I96F
         NBc94U8gO3QCkDg+Nq09FdflE9gJ48Osc3OPm1vhlDkZIOvvzgNG9a7zlDwhBQIEN/Be
         xDxHRzwg9FkB8R1lNVx4sa988E/1/CRssfGsCYubpZsdAhdsmBz7KVyTL0QMXHXlhPgC
         FZQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794280961; x=1794885761;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K62i/P8PbkS4nusY5tpqbkn28J4X/MrUcVukoPMJY+I=;
        b=skEZgZFCM/vte8RnuSu8uDiE0iB+ylMHV6ToUlFdJ66AETh+D4Cwu54BLr6LxAoq6z
         UNdjOmpw5u4FddYuF9oQe1zDFLo02sBJpdK4124o3IIo6ybax/JYStpmwwvy1YfsUUg7
         QrndIURyKCd8lwYe4EBYkcz75wQ6uhx4yEXD4PZT2Kw2py1oOWUCIvYGCPooK5CQhvFB
         GMWpHDjjAS4fhwf9QEQTTGP1p7E966VNK60Z0cNhj6SmIWehyS8UEZWDlHZDplTmSbeu
         Bvyd9JE/0Ikyzf51BXcyHSKcVftJ2YW4cO5FPbWHPOcYt6L6m8tR9DZx+GAaOZrwFDQl
         D1tg==
X-Forwarded-Encrypted: i=1; AL+hErEiuMP8t1A8tNvumRvZwSP7xCTCq0Kk4r8b1sqyYBMNfLX/jV4HBeRSe/UY1Ibf9f1Xum4AhKx9p4mkYLpi@vger.kernel.org
X-Gm-Message-State: APuU4Z8AfEZH2gl1S170jDWEK7ORQrK2+FF5p9RNHb2q5i3OP0Slf5N2
	ZN9Gu83YUgBb73+/1FgHuvi/tqUt0/zbX50bUOA59/RoenQbI6r7CUo1H9K7ztcME2qifnpy0mw
	/l7FMBVHTq7iRqzg6v6d0PIGRoC5aWV3wkwWzEtipob/1Q0c+IjnHqKSha4nZD97IOu9G
X-Gm-Gg: AYBFou3y4sUQzH8mSRQ98PSksLzNPoYvOFj9i3dtBFPo5qGX2DhkLK0kn+Ap/ckeKlT
	P5gs+buFRgORdnVCvomG8It7LEQhSuD5ez90UcJnFF6d1GctNlOl8mm3IWZK8nuEnzTehk9bYp2
	VNaTms+0yVodHomiTszjFcBYsnnD4cZ3Lh0TWYE78HdBTWpRkn0kad14LaN34Cp4O/R/7TWrjML
	bsGOhlXZ6HP6efVdzh4wnpx4by27PhtqJA76UpyacDd14z4qMnG6ThlV+OGawQT3qFC2W0uD+lD
	hYowVhVujgzq0zfo75smXspJ3CIA+ypAtJ4AVMGi2EnGnXfyfBtMmhrfLfYzMvMSdpI4u1zZ6cd
	foGZln5RxtzFGTqFFuVkIqa37uFfhXHTjAUAVB/c8SSkOQK+npfqDYMJoQumt1t/5cgoxRyJNbB
	R5O1oLGGGiwQTyjCMK+NCiLZWKuDTRoUbXRkbK
X-Received: by 2002:a17:90b:3804:b0:3ac:7116:434a with SMTP id 98e67ed59e1d1-3b166cd72a9mr1611666a91.15.1794280960383;
        Mon, 09 Nov 2026 19:22:40 -0800 (PST)
X-Received: by 2002:a17:90b:3804:b0:3ac:7116:434a with SMTP id 98e67ed59e1d1-3b166cd72a9mr1611630a91.15.1794280959879;
        Mon, 09 Nov 2026 19:22:39 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16fea4243sm2341a91.14.2026.11.09.19.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:22:39 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 11:21:26 +0800
Subject: [PATCH v22 4/8] coresight: tmc: introduce tmc_sysfs_ops to wrap
 sysfs read operations
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
Message-Id: <20261110-enable-byte-cntr-for-ctcu-v22-4-05d48c0eb110@oss.qualcomm.com>
References: <20261110-enable-byte-cntr-for-ctcu-v22-0-05d48c0eb110@oss.qualcomm.com>
In-Reply-To: <20261110-enable-byte-cntr-for-ctcu-v22-0-05d48c0eb110@oss.qualcomm.com>
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
        Abel Vesa <abelvesa@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794280922; l=5197;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=Zyx/d9oIgPkQ60/304aFUQUx4sMlZWIw6sxJoMobPBo=;
 b=kpRNVhutXQ7gohFYZQCqNm1H40Kl3zk4+d4GQd1BPz4yWZX15elY/hEqALIMQRcM7mvFBSwB5
 ua4YckmM+PHDsJBSzHNttGsPiM+rvMRt9Tnl1YxkYUJOqv93jx9Np7o
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: nMYZ6ZjVG1q67vwSfJMVxM3LQTOeauvX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxMyBTYWx0ZWRfXwmPot70VEe7j
 a1TeK+Fw65wf7S5epNYrVRs0BiOr/hRYdare5uMwcbRzDFFCyYZgwxn951Vc/dTmCp1UnYYSGf/
 W/eEf+vtXNHtx8/oKIQbDMU8WnqI8U0=
X-Authority-Analysis: v=2.4 cv=TOrQ2Fla c=1 sm=1 tr=0 ts=6af28e01 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=ia3uihG--C1vaqsH_ucA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: nMYZ6ZjVG1q67vwSfJMVxM3LQTOeauvX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxMyBTYWx0ZWRfXyIV+TzN8l0OJ
 eSLjo3yTqKbqRsgs1j8DQAil6Ra4cWOeM0goY7rRuu7TbxMKxOUUJYYIq2xKlWH1BOegosSSltz
 wYEaDMzRVoZkB1utVdKZPt2kpxs42dHL5CWlDa9uay2ahW0StZ2CiqKBRZQ9zkKzHhFpovnAtOT
 QZWgZ7JGoYIXqKydPcBJEh9nTw0GC6QTssKXwSZVQIG3ou0/jV24aSUaWM6n0kXcl1aww1tTHYC
 oFuRB68Oq+fNdRZ7h36od7YdO1h9F+VfsNpxPodwLXiljKRfuHylldHiL0XAFCi7D6AABQ/lCkD
 WZy4NITD60CogSMo15k8MdTW2IDNKH/NYxqxWyAnZvoh5RVJXOTaREl62GUbfwmfVY0aYxbeUzI
 O6KRTwhR7bWNKnNVSzHpwTS6gbCNc2YJS9V1uuH/T/WHMoSeDbxefugK/O8soGhI0RtXbaBgNut
 7Ym87KSMwwqLQpcfdVg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100013

Introduce tmc_sysfs_ops as a wrapper, wrap sysfs read operations,
for reading trace data from the TMC buffer.

Reviewed-by: Mike Leach <mike.leach@arm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-core.c | 51 ++++++++++--------------
 drivers/hwtracing/coresight/coresight-tmc.h      | 15 +++++++
 2 files changed, 37 insertions(+), 29 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index bc7dd676da47..4b40b692be4d 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -228,17 +228,10 @@ static int tmc_read_prepare(struct tmc_drvdata *drvdata)
 {
 	int ret = 0;
 
-	switch (drvdata->config_type) {
-	case TMC_CONFIG_TYPE_ETB:
-	case TMC_CONFIG_TYPE_ETF:
-		ret = tmc_read_prepare_etb(drvdata);
-		break;
-	case TMC_CONFIG_TYPE_ETR:
-		ret = tmc_read_prepare_etr(drvdata);
-		break;
-	default:
+	if (drvdata->sysfs_ops)
+		ret = drvdata->sysfs_ops->read_prepare(drvdata);
+	else
 		ret = -EINVAL;
-	}
 
 	if (!ret)
 		dev_dbg(&drvdata->csdev->dev, "TMC read start\n");
@@ -250,17 +243,10 @@ static int tmc_read_unprepare(struct tmc_drvdata *drvdata)
 {
 	int ret = 0;
 
-	switch (drvdata->config_type) {
-	case TMC_CONFIG_TYPE_ETB:
-	case TMC_CONFIG_TYPE_ETF:
-		ret = tmc_read_unprepare_etb(drvdata);
-		break;
-	case TMC_CONFIG_TYPE_ETR:
-		ret = tmc_read_unprepare_etr(drvdata);
-		break;
-	default:
+	if (drvdata->sysfs_ops)
+		ret = drvdata->sysfs_ops->read_unprepare(drvdata);
+	else
 		ret = -EINVAL;
-	}
 
 	if (!ret)
 		dev_dbg(&drvdata->csdev->dev, "TMC read end\n");
@@ -287,15 +273,7 @@ static int tmc_open(struct inode *inode, struct file *file)
 static ssize_t tmc_get_sysfs_trace(struct tmc_drvdata *drvdata, loff_t pos, size_t len,
 				   char **bufpp)
 {
-	switch (drvdata->config_type) {
-	case TMC_CONFIG_TYPE_ETB:
-	case TMC_CONFIG_TYPE_ETF:
-		return tmc_etb_get_sysfs_trace(drvdata, pos, len, bufpp);
-	case TMC_CONFIG_TYPE_ETR:
-		return tmc_etr_get_sysfs_trace(drvdata, pos, len, bufpp);
-	}
-
-	return -EINVAL;
+	return drvdata->sysfs_ops->get_trace_data(drvdata, pos, len, bufpp);
 }
 
 static ssize_t tmc_read(struct file *file, char __user *data, size_t len,
@@ -764,6 +742,18 @@ static void register_crash_dev_interface(struct tmc_drvdata *drvdata,
 			"Valid crash tracedata found\n");
 }
 
+static const struct tmc_sysfs_ops etb_sysfs_ops = {
+	.read_prepare	= tmc_read_prepare_etb,
+	.read_unprepare	= tmc_read_unprepare_etb,
+	.get_trace_data	= tmc_etb_get_sysfs_trace,
+};
+
+static const struct tmc_sysfs_ops etr_sysfs_ops = {
+	.read_prepare	= tmc_read_prepare_etr,
+	.read_unprepare	= tmc_read_unprepare_etr,
+	.get_trace_data	= tmc_etr_get_sysfs_trace,
+};
+
 static int __tmc_probe(struct device *dev, struct resource *res)
 {
 	int ret = 0;
@@ -823,6 +813,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		desc.subtype.sink_subtype = CORESIGHT_DEV_SUBTYPE_SINK_BUFFER;
 		desc.ops = &tmc_etb_cs_ops;
 		dev_list = "tmc_etb";
+		drvdata->sysfs_ops = &etb_sysfs_ops;
 		break;
 	case TMC_CONFIG_TYPE_ETR:
 		desc.groups = coresight_etr_groups;
@@ -835,6 +826,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		idr_init(&drvdata->idr);
 		mutex_init(&drvdata->idr_mutex);
 		dev_list = "tmc_etr";
+		drvdata->sysfs_ops = &etr_sysfs_ops;
 		INIT_LIST_HEAD(&drvdata->etr_buf_list);
 		break;
 	case TMC_CONFIG_TYPE_ETF:
@@ -844,6 +836,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		desc.subtype.link_subtype = CORESIGHT_DEV_SUBTYPE_LINK_FIFO;
 		desc.ops = &tmc_etf_cs_ops;
 		dev_list = "tmc_etf";
+		drvdata->sysfs_ops = &etb_sysfs_ops;
 		break;
 	default:
 		pr_err("%s: Unsupported TMC config\n", desc.name);
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 30b15c38b080..36c80918958f 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -263,6 +263,7 @@ struct etr_buf_node {
  * @crash_mdata: Reserved memory for storing tmc crash metadata.
  *		 Used by ETR/ETF.
  * @etr_buf_list: List that is used to manage allocated etr_buf.
+ * @sysfs_ops:	Read operations for the sysfs mode.
  */
 struct tmc_drvdata {
 	struct clk		*atclk;
@@ -294,6 +295,20 @@ struct tmc_drvdata {
 	struct tmc_resrv_buf	resrv_buf;
 	struct tmc_resrv_buf	crash_mdata;
 	struct list_head        etr_buf_list;
+	const struct tmc_sysfs_ops	*sysfs_ops;
+};
+
+/**
+ * struct tmc_sysfs_ops - read operations for TMC and its helper devices
+ * @read_prepare:	prepare operation.
+ * @read_unprepare:	unprepare operation.
+ * @get_trace_data:	read operation.
+ */
+struct tmc_sysfs_ops {
+	int (*read_prepare)(struct tmc_drvdata *drvdata);
+	int (*read_unprepare)(struct tmc_drvdata *drvdata);
+	ssize_t (*get_trace_data)(struct tmc_drvdata *drvdata, loff_t pos,
+				  size_t len, char **bufpp);
 };
 
 struct etr_buf_operations {

-- 
2.34.1

