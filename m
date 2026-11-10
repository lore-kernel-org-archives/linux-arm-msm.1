Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280937;
	b=11invGpFMvyJn/Mj2PtuXEAyGM05Z6GXg0amISTD/IXSMzjwSst46IshaUpYBn/r0zI+
	 VIv79U0S1GtEStz9kRulxV9Qv+90Sm49s0pV3/WJ77Rz1KvnIn/ABsCR/swUDXcug1AWW
	 R955nj5LRAyZ+Ldn9ywhz3NqduInCSW1ihtQKgk7SGfLVCS9q/Xb0b7odn5fiDGCIP0AP
	 2m85+gIcWEVd7kCzfBYzAGvgA+/7OzAZOBMK81wQVFD3VInmHOtN/G68cSmfhmKaxKmnU
	 pFmaltSgst28cOKkbnfcj6dX9lpBQNHeNA7FwFP8OMZcm5RUCpT9KVEGd8cYmxMzNcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280937;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=oRHoL0IowPBtdkXq6acf6pO5kP7NbE/jHqMLo/D6VFA=;
	b=Ah4119gzCCjbOI/8idEGAoUcIboZx/mrL6Y2zVFlsDhnBnIi9HnPiK79yc41cxSAVHT7
	 xNkjC9t3wjF1D+fjm6VQocwLUk6LLMLoFRPbl+up/hmxK2H4G+LRq/vKXlJlppBLj4wXk
	 Vj8fjVUNhpYzjopt3yh6DKfcubg3VTj+4b34d5bXdXL8wwTJE2cb3e9oopV5N5T37nzz/
	 mLXPwzvLl3+deIyQ/CBlrjqd8idJQwIxP7qPHHjjmDgYhq+ER95U9nQhBrQKqXnMkZf83
	 zfZCvB5iC5YH/tZxCBoxmcfNzF+XbnZ7idCPUjPodQIaO6TmpHOH//vmofGK341+UGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Cbaz58si;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iTNwGDwt;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F129F606A32E
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 03:22:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F129F606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Cbaz58si;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iTNwGDwt
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA0j1jB2481044
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 03:22:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oRHoL0IowPBtdkXq6acf6pO5kP7NbE/jHqMLo/D6VFA=; b=Cbaz58sibwWzB0b1
	DNPpR+nVrWn/Ft6CSpW8EdtDjOw51AeZKZdb3xxiO/rKgWhmSQWg/+6B6JLvAKTE
	44K4Qr3b7gO32xf+a6jNs3RVPt0MRA24MbnEtLlhxDrOt4R8ej7pSW2AD9q9ZfjI
	AADbCK7GgTl43gWxRJRwqqMbdjVjBCndjjzwyRPP6pmQMkjF6Ux4YFdlwj1JFFN4
	Tyq/XJKn1y+BjkpITIhdhZQz48OPC/o1gK0u+ggse6RkV6+MbiQheyAWgc1FTzUC
	RrGSJRFMTkd4DPdXrB/aZ39AXsnZDrzTNEXR8MJsLMMsDbq21geBJtVOYyiUCaB8
	RMikJQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hufx82nvx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 03:22:15 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ed2803f863so16221315ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 19:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794280935; x=1794885735; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oRHoL0IowPBtdkXq6acf6pO5kP7NbE/jHqMLo/D6VFA=;
        b=iTNwGDwt8/Fa79UR5PY8rVcK8vUMDw7+xytCcgne8LC2yMICPB3ig9ahE/82MKa1+b
         geWODTA0+Hj7urNzhwfhUklh1Rp3vgHvvAsOLI6Lm2GYYek7tWm/GEsOIZKOO1fm4vZk
         GIWDlfLNV64LymzI2Jn+ONqn8X5lvq7IT1tYJFPWqnhwEev8ExdASPo6UbIkD9yLg1Sw
         gndp8ryyEQpRwexSL6LcSYVui+dB2vG8BSdI3rvEY4n2PnywghZwAq/1tCQGoYyIqziL
         jOI3sKYRSuy+m6JtX8luLHpAihbQrXWCaxNinoHx9YgAovluuMYo/kNfwCXo8KsAYUad
         zIaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794280935; x=1794885735;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oRHoL0IowPBtdkXq6acf6pO5kP7NbE/jHqMLo/D6VFA=;
        b=kNNogrnhHq1OK6XS1Ue77nSri50xiMMlnEVol/mllHUGRIETo6AWl2dfrKd/MfMt+a
         7QlQxBhkioceC7ZLt5pr4YOm/DsVMKgKO/XUNod0qOPIsx8zJTlIuXSKV9re6Z/glsnv
         X1r0Syl43wzUIIC2Uf353UlUMdKx75EDVxgHhvLUl4DpAoU7lSU1vcLsEeQr+kk4D7+K
         Cb0Lt1TzlEj2EPO9Y78Fo0xeMNN/3cdQCItrMikmnQgA2NWiM61BldvPH1OBjflfSHTP
         tiV0JGYCXppO2NAHfOr+yLGseg8ENkgdekE6CX5A5tnL2sPcnoY06vpI/CQDeNTX1USW
         HzSw==
X-Forwarded-Encrypted: i=1; AL+hErHalR/xjEKRks/hgvEv3Ye13fUGxNybG9mIRNPG0yGh5rVU8UwUi2173gxxG1/dldJw3AJolQl4ZisWE8xF@vger.kernel.org
X-Gm-Message-State: APuU4Z9CQFxeh4MeN4hPlvuOKC+CJdIGG9u4hIN8aPS38Y2N5QWOPI95
	8onVJe8hSiEP6+v4GON0IW1n9dAVzckAXXSAUCc4kO7fp+/Q5iZ5xI/f+J+I2eFylSfHP4nZ1iX
	fKGUoyfPlYLmAzga9pbYnhag+QduEonnwE8gxAFENb6dkqangFx3DnulR6+v/ZE42R5pDmVRRd4
	3dyAw=
X-Gm-Gg: AYBFou2h7pFaErBM6+w2/BiGEseT6gAWWf2HX+lbubd/f9BIliTYWiqU+IumCFfwwey
	Jty0JBf2/3GC+LIBT1NOVnDSvHI0V3TBNLy9qfTVZaOv3K2VT6xmBZXlSJRhiCnYavnWGgR7Dvs
	UJIdSxtfKiNzjYBPNjRqea6JcfVQmViuUG2JcB9wTdTxigALs913j3w4LDmW68iKZMQu85CfW38
	TfDZ/r3XTMeAmu5lMjhxIRDwOw39w62cmNwyk05Ub13RMnk0L5n3Qr+7fFkREK/3oCjol4HBN2Q
	BpPgdf302bF0sPehNKYKHo96Uql9nnc/NiVT88SlsjNg5Nez7UCDziITJyZ5LL7L4LadwgXYkHa
	8ljnKX6pgpkcVSrvnAT/z9MfUMmdcQhH8xTMoVkkzwkqI+JVtOO2+U6q3fVVnMYIFRjzM+066Y3
	iZXtPFfIAQlpC4CLgz/ZQH1qIwSYiiplrEbkyc
X-Received: by 2002:a17:90b:224f:b0:3a7:82ef:bcdd with SMTP id 98e67ed59e1d1-3b166d0512cmr1671702a91.41.1794280934775;
        Mon, 09 Nov 2026 19:22:14 -0800 (PST)
X-Received: by 2002:a17:90b:224f:b0:3a7:82ef:bcdd with SMTP id 98e67ed59e1d1-3b166d0512cmr1671676a91.41.1794280934315;
        Mon, 09 Nov 2026 19:22:14 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16fea4243sm2341a91.14.2026.11.09.19.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:22:13 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 11:21:23 +0800
Subject: [PATCH v22 1/8] coresight: core: refactor ctcu_get_active_port and
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
Message-Id: <20261110-enable-byte-cntr-for-ctcu-v22-1-05d48c0eb110@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794280921; l=3915;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=+oZshRSJK34bHEGxdoF7ktkVcnA/k42MY2hxHJFiV/4=;
 b=f8pPXp/NPBBf5arnW7j1D7MGNcEC1eM9jlHACtmmEjygK2LstAzouhm035tQzUlqqjXVnDHmY
 b3+9dIR3KzYC8O8lXd271su0g5mYtW91OCUj4q9M46oxk+UYGuVE43H
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=AbYkjHXG c=1 sm=1 tr=0 ts=6af28de7 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=lyq7_Muqgj1vGRpOYO0A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: MazVC2-7ffpMvOHGhMRxbjC6G8wUgEHe
X-Proofpoint-ORIG-GUID: MazVC2-7ffpMvOHGhMRxbjC6G8wUgEHe
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxMyBTYWx0ZWRfX243Lh2jHgFN1
 dItBHe+7QOjCMdK4/LvaBTQt41kGxfS17T/CW3cwaryDsM1cYNkjZOrNaJFhIbbmiqmk+tENooo
 3p0rVTfWMs15Z9E7XOtbc3MBxA5IAy0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxMyBTYWx0ZWRfX/rcHTdD7qQFV
 h/ZnydzmtRmF0ZfDpxt/4pSyB7pH8JLTAF7Q1+So5D+FmPMm4JsSfFKAejbXtUHyzk7zE5wu5RW
 zll2H6jCihwVQULfJVXgluNuQsmTIb4shFvhlpkZbeAMH824cgBXdUtIfvoF/A+GgLrwD0yhO12
 j797b2yB0f2vgIcccH8BKktnypAj2dXwxGAOhtqazuULc89PMTEnCLuUQ6BtftKhSJ6WHcFzVWt
 GjgLwwVWIe7RDqtqtb/H8q2n5ASFeXgDVbi8Kju7vo1+qFmX8a54ak7q+zQBJ8BY+DcL7CtZwoY
 LNlLOmdOlyv8U5G+N4RWTogfYKdXhYWVepZsOTWT2Z7zsNGXEA5Sr//Zro6Mt0A9wlPVxb8Mdfm
 UfCDTJPejdCP9A7JSfKcaNotNc5TF+ATvmuS53Dbk9Ablw+hr732YQf/XI3jML0igaCQsJ1Vc0i
 pA4zwgixI/gFNHb4LIw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100013

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

