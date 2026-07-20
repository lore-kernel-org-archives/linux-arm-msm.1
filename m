Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8CB3988F9
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 13:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784554142; cv=none; b=naqxP5+Hkd6uhkZa4LwEvOa4Vc6aLixvmJURSb+3176++CQkkwkkQfg8GxMQcapywYn41KglJW+ZBwmhXsB0ASTajie2EW00aT3iUH5oHk98YaqekQ+ACSZYqSpTzxM4taRxXNwyltg0hMN1bL0XhUp1Lh7LqgYCT5zmQ5c3bLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784554142; c=relaxed/simple;
	bh=II+dTbwufhbfpgEni9YnBXDjz7wUC3yKUbJoATs2Sy0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t3Q97N8DF0GAmMP+gqo1DbXnmscqehO6TLOmlsJwSUoF+f8coVfWKpxC/vjEKb4eeE6F0RZvGmuCr9FDD/QSTJXo8hiTW2nYZjau76x/hRfKKjcaxza74u6OeaCHuJvy8y+DKzu/EKMI8cY+KzZ7qUp+BzyeoRSMx6q7aP/4GLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TcyvTcbG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UAJy8Jzh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TcyvTcbG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UAJy8Jzh"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KBhx0U2449938
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 13:28:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EkTMhAJDZTyo/Hxe/349UftCygvvSv8znBEfDCpHsOs=; b=TcyvTcbGIiHHk7LQ
	E513ElA69Gqw8Cki99oVnEPtOkU00UJ2kS0wh+fiH22yc0tFha9yu2pKybTdRTm5
	XAcwpKCerWnmW9OoS20qqfxC4y4Z8fEcCAjxNHR9VpD84IDeua7+sDUL+J6YrK7b
	xHAHo8h1k1Yv4WLnG44nsf1GAM4OZG8T0WiSloW/ZuchfyJVrBEI1i1DV1no5wEO
	h1hvgv5Wnd4IRYeoEQnDBWpHIcWyk350Eym8quo9vv5SoAbr5v8JOVXE+TxTyUg+
	gAKPEMywwdRwKgpP5DQ4GHNAJJ0nqs5LTo1gh48c+7YCneo8x5xcaSfr1legxaYU
	kCOTUg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhk2f8daa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 13:28:59 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c89704da8c7so14504369a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 06:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784554139; x=1785158939; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EkTMhAJDZTyo/Hxe/349UftCygvvSv8znBEfDCpHsOs=;
        b=UAJy8Jzh6DsLwzewxYQLSKZl/oT2vMCjOoVhn9VB4ExRCrHX4WusRIOUKTGa1U0N5b
         WCwjIflbYcQRaIBMn9wVfbdlIQWRyPUWUpBaAr1w6rgmLf+4I78BMY2lTqR6r7VpxUEM
         y9szBlhonlccOYwTnL06dJY+ScTu3Y+9++lsjz9spitG/2oXOhvNC0cL01ybBKB6dXPv
         feTkBaBFzuoAYOIKac00CcqIlFdy6bysM6Mn/+rtsMPS+AqRWCKj/l2sabuoEpV7iQGy
         pvPX4JQKve0YGuL+hlYNyeqYshUPy4G7fLQ0Wd+eBdoLIETH+uUdoFigXmNJTEFOCafM
         AWpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784554139; x=1785158939;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EkTMhAJDZTyo/Hxe/349UftCygvvSv8znBEfDCpHsOs=;
        b=eo4Yz5xoxYCIcjrpYBJu2Mc3uxwRTsPz3Y8UbMwMEun+IrIxt0/ftYCc5ezMOefT+0
         lalUlHMt5rYQHEVxCzGwlQTBt5uqVc7b7x6kvFyg+gegLLnT2JXvmWsi8syB+oxsWPYK
         5hmcWbA+cOaYmUw4mF6aL0xErW+0OiYvT+V7rcQA1B+Ic+DsjKlJCD5S+sZRRbqS+DxY
         3pCIfw3iXowxJSNEszOcOpNXb6K7FUFuTMmuERn2nZsYTA+q8gw1Bj9CpGkIHUQjLaWy
         p8UZ5lzI3HAN481TSF92fF2eXcLEkxpappWDyYZWFnAJzWQBnWA9c/vTKJzo+WdHRcE6
         zAKA==
X-Gm-Message-State: AOJu0YyNCd7RSEYxKmeg41O2lKOmHQt30FuRuxtliSz9OD0e3KNznomP
	y3RAMtx+UJznTYvbJBvtuI+R+M8UGc+zqNY/jzTSV6bruPXdYAfrSCC3T1uSvZjL0aXOH45al9U
	1S5+CQtVnGl+CjAtNasX1Eh3kWR1ax/YBjcHOq2gdnxdTzj601vslFghMV1VDUzqD9wlhUyi9BA
	n8
X-Gm-Gg: AfdE7cmAmIa9GCGAuD4LZ2iRthM7LAMXfzIE6tHhz4lhclE4yo9n2jcFyhadr0BG0HU
	Rdsj1DxHFpP1IUW0wUBxtxvA62WrpdwgcSUnIbGjhtLfc7wrNvhKSC3A8Q2jdOIBLhhaIvVmJ25
	+PWNzojDlod/0CmYK+vzq14hU/0DwUTX6c55JTfYO0lnPelW7t0FHyTB9e3aUD4PK3q0L8AIplL
	nytkjpMJL/1NRQFfT4v2QL47NyNMChB6MbhDizmXn2BZKFuV4q+wpyhUzszEUj8gniO9akIuJO4
	q6moEwgxmT3XNC/HJEyyWXQkFAyNwZyjzksvYzp2DxgrGJR+Z6uITEvA/OXBQ8gvFY99RSOqM2m
	6zK27Myx41xY2Dids3L4pwVRJ46nOlWTRLeyRMpW7HjJp2xrK/PNxh2tP4bzGwJV//Sg+pVI=
X-Received: by 2002:a05:6a00:400f:b0:848:6ba2:4139 with SMTP id d2e1a72fcca58-84c29487c9amr13692016b3a.36.1784554138600;
        Mon, 20 Jul 2026 06:28:58 -0700 (PDT)
X-Received: by 2002:a05:6a00:400f:b0:848:6ba2:4139 with SMTP id d2e1a72fcca58-84c29487c9amr13691982b3a.36.1784554138122;
        Mon, 20 Jul 2026 06:28:58 -0700 (PDT)
Received: from CHUNKAID2.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2af6e3e0sm5628822b3a.43.2026.07.20.06.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 06:28:57 -0700 (PDT)
From: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 21:25:52 +0800
Subject: [PATCH v3 1/2] rpmsg: glink: smem: Use device name as IRQ name
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-rpmsg-improvements-v3-1-e7b6070186bd@oss.qualcomm.com>
References: <20260720-rpmsg-improvements-v3-0-e7b6070186bd@oss.qualcomm.com>
In-Reply-To: <20260720-rpmsg-improvements-v3-0-e7b6070186bd@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, chris.lew@oss.qualcomm.com,
        tony.truong@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        Chunkai Deng <chunkai.deng@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784554132; l=1360;
 i=chunkai.deng@oss.qualcomm.com; s=20260512; h=from:subject:message-id;
 bh=II+dTbwufhbfpgEni9YnBXDjz7wUC3yKUbJoATs2Sy0=;
 b=okIJZHRXPSjsp1sepbCVpZhksl4sbPqjPOxDXlDMhA1LOAVVf6pLAA0NFtNbxiGlBx/oVJ84o
 wRzFaUBrCrEDQqZImu0A64fgupq2EerEi4Wj3iTuvq4RMAXT8KLtlOs
X-Developer-Key: i=chunkai.deng@oss.qualcomm.com; a=ed25519;
 pk=NfifEElkZxgJ0ghUBxNu1RTaEqtoCGYDb0k5UzIRXOY=
X-Proofpoint-ORIG-GUID: IBzvLlwGtJfCCNS5XoFO2zrHaA7bI5RF
X-Authority-Analysis: v=2.4 cv=X8xi7mTe c=1 sm=1 tr=0 ts=6a5e229b cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Nqvb9vKcIXZEg_ORUGMA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDE1MCBTYWx0ZWRfX8sc6ZBBZJOuw
 JmumK5dAPF/wti0oNyI1QbkkZpNKgd0H/AWpCeOfEX9wmvWj5ZSCrQWcljusNHmB9EtiU8MO8P3
 tRL+D2EdZV3rvra2GanSI23amd5APyI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDE1MCBTYWx0ZWRfX/wYwFeneC/R9
 dgwylwv9JpVaqbcTwwwadXaPWNRD87NYwl3bZQwznHSItwaziACWP/5Env4QVOKdlSssU8xunhI
 2HDJ0wP9WiElwv6YZGH1nG588JWyLPnRvSk4nYX/tgjizMWLI+0yyd3+P5yQAyhhK6TWLRmvyVQ
 lZJLzaI0qhnaPZCx6ilBqVKw6nugFYkMqowDQv2zxANZC/ePv7/fpKqLfcfkDNY/sCAGr6aKYeO
 QaX8a8fTF9lawDmppUPXgkZXD8ovPC7hUuAVfnbTmh1swIaZFzUftm4YN+Dph8qrySPe7AqGQSH
 5btoG2OiQ6vpi4YksdSpqT4oYvAOhL93ZGI557VmtlAdfB2QKAKFYjVEjCErpuD9d39HgWsA3gs
 04IXrNdd5UZ4yM7gjc+1gY21x5w1TojThm1bXmRuAMofrumhh3qAoZG2Fkuim84O8RQetdEhkA6
 lr9RkbjSxtgQ2+YENvQ==
X-Proofpoint-GUID: IBzvLlwGtJfCCNS5XoFO2zrHaA7bI5RF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_02,2026-07-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200150

A SoC typically has multiple remoteprocs (ADSP, MPSS, CDSP, etc.), each
registering its own SMEM GLINK instance. With the static name "glink-smem"
all instances appear identically in /proc/interrupts, making it impossible
to associate an IRQ with a specific remote processor.

Pass dev_name(&smem->dev) to devm_request_irq() instead. The device name
is already set to "<parent>:<edge-node>" which uniquely identifies each
instance without requiring an additional field in the driver struct.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
---
 drivers/rpmsg/qcom_glink_smem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rpmsg/qcom_glink_smem.c b/drivers/rpmsg/qcom_glink_smem.c
index 62adc4db2317..edab912557ac 100644
--- a/drivers/rpmsg/qcom_glink_smem.c
+++ b/drivers/rpmsg/qcom_glink_smem.c
@@ -307,7 +307,7 @@ struct qcom_glink_smem *qcom_glink_smem_register(struct device *parent,
 	smem->irq = of_irq_get(smem->dev.of_node, 0);
 	ret = devm_request_irq(&smem->dev, smem->irq, qcom_glink_smem_intr,
 			       IRQF_NO_SUSPEND | IRQF_NO_AUTOEN,
-			       "glink-smem", smem);
+			       dev_name(&smem->dev), smem);
 	if (ret) {
 		dev_err(&smem->dev, "failed to request IRQ\n");
 		goto err_put_dev;

-- 
2.34.1

