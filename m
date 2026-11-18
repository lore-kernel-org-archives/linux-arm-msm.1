Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794988998;
	b=Wb0/OoGYiJ5gkRF73fAE+pY6LsveHHHI/wvejoiS78bMIIOTmnFFCj/XRPNjVw06Fskn
	 tjcD1NrzPkgI4F7zEH32MPbq7mZmPdw9jcQngOhV/O/n2+6d9NmpqB8pzBeYEvRT//4bb
	 0qBw87Vh9xXtRw1AWCjQbiEQxdthb/Aewqb5gHuGNSOGJXSka/oyDMweZJIuwEVdN8qAz
	 V/+rmXy/AqV6HAFMtlCp4FXX4R3vL+dGVyUn5mXlRE9eZE0Qc4TNqX0ChEowUdts/Y2lT
	 uegQKF1UlAlXVOrTJyYNzCMMgtYD+cJRlunEpC0io/LlG1Pxo+hN0heS/NoCWjdhAsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794988998;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZuqNEpDUlfFbdnNWjZAurd0lzCiaAXeLtHn+BckMIRg=;
	b=rTjywBRiS6a728GRgWtrYDvnKerJ343Q4uII/f4VPvV3QQqKeCUC0Rhn4vLyxkgDGTf6
	 WF21J+8W5dp6z5gmAJWcuRxIdGZ62j95e+f8dE3JQbche2awx4t1lR3uNbAyoDTTjUnVn
	 Z2l2pn6jg4vqcXGwFkdzwQ8ew7EA2wDXW9eKboLCF5IEeuYcY+SOdIcDxPnodjhjkoyhZ
	 +6IHtGpUA3jhRyfsNamyNP+f3xtGWDW5jEv4ljIW9mDVDY1wc7t884WxiOMiHLrwFpr/i
	 VvUUZ23p8y683WYFL5+J/rhIycHjNBV5nnPfjdTXe5/UFu2dGa4eBCAT2u/Q9CpXkmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VZ7LyWkF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AIeXtnCO;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2798606A32C
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 08:03:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2798606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VZ7LyWkF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AIeXtnCO
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2Uvkx1959712
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 08:03:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZuqNEpDUlfFbdnNWjZAurd0lzCiaAXeLtHn+BckMIRg=; b=VZ7LyWkFNR/adFAu
	rvraIXRtjke8TzSjKPCW6Mm9i+kqL4gkm3hTDZRuTOi/9KHmL2E5b96bseF3sumr
	QeY4im95/oe7RsHw/vLecTJMC0WbztHhxSc2Fjg8+699sUak3tmoP0cjgkPXcnYF
	R1f2+QWFe5rNDITKCPPVGROa2+keExyRO46hL9I6eSQi+nF6zxRxgcDwma0OFRAP
	pW30sLVvFavP/QOXKjcaEkCJLdVOya7bCct3YXVDQNhloQ/t7aQGg8rWaCwrlV1Z
	zMnZV8UeXGvhQuP0ae+MiCxWO7C3tq3KbMxdHYz0NvkvwEgu2+jqlb0aYzq6tg21
	d9NQRA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9hws8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 08:03:16 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cdb8e8bccdeso393899a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 00:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794988996; x=1795593796; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZuqNEpDUlfFbdnNWjZAurd0lzCiaAXeLtHn+BckMIRg=;
        b=AIeXtnCOcYkAGq/OnFcbSgo91N0GjreNNmMNxuRpB2kshhJGEBdY/hqcLTuIFU8kUi
         c9ZgY5FU7woMfF34vZkKUs4gCtIyvIPrM0+f+DNwGLdT6KtIUFH0F0cR3HtWVlnVuVOP
         zTXfkeJqjmlmnsEyZTXmGcIDRTwyo/R+buJ5ctaKl/MmMCI3+YF3j/PfCbd9doFmDvg4
         cZqF9V0v9LxrbqyWtc3GzmZb6KHSW4Da03WeulqZBFc54NDhwq7YoG6R4BG0cY1FMbAY
         Xl7nIZPwYDiFNoz2LAJhCbpdVZppE2ZzjhbiH2uvl2W6hceOD8ZFiOg3fqTJYUy2QwZD
         HFig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794988996; x=1795593796;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZuqNEpDUlfFbdnNWjZAurd0lzCiaAXeLtHn+BckMIRg=;
        b=1FbCXt3e/96AQuAdxgU3WSNIeplYCxoPZyFs/kEdGpxYhUje4NkwvpnjxxeKV8dX36
         N6DH/twayGmm1yrbje53+YIimfOkKRm2d1jadDDNfm3jyLxFDMEGOX5eHsK+Ey+ClrQo
         GjXwhsxl+xIYT0vbHcweR4mhIpqaS0EKtwgBJVg1FbAjwR7De2Ihsf8vcCA66fojHWdT
         SkgdhOo0iI5ptfn5MOscQtHu7zJMkbkAesNBjuue/Pm+1dEzGHqFt7ICq7oBHFTMwWuG
         GBI7l7KVwoUmvPXMGGGu6dC0Zcygd8btehXBQkhmdvooI/i4dEtTHquGLd2JScWGnoud
         7uRA==
X-Forwarded-Encrypted: i=1; AL+hErHxAUOuCobYT4GoyhjTOO56dFd5/CWv7go4a+WMvo//pVM9V7NgNWOrVnjhIx2Uaq67xmLdt8xxA3esTpRn@vger.kernel.org
X-Gm-Message-State: APuU4Z9gud0wTIM6PnDoxtpkOBREmtJ2G74Jo4hRRg1c3Du8D+BOspCK
	28LgFI1FzwkZMoCB57S86LD4YBQMgObTtwTYN35Gudc6EH3a1SIEGG8FQcqiJzjw7R9h//vK1uI
	EM3Un2JBRppRf5ZYZv8sLOYa0a/IeJ8faMp21Cnyr97onyBJLfPTK0Cvr4UrSU3VxDKsi
X-Gm-Gg: AZFdTZfAZZ6SKjOIx89pnazrJWkkk1eBwpUGFF6Az36VXNmbhtfVsSmY2LFDJZKAMuX
	KTosmjyEmuHzF6FaiC6acF+aSt+C6rwuiSpxlpuyX0Q7GG6tpciJkRMY/o+nEjS33wH5tQ2ZOkS
	ZMc/ZjIPlbtHdT1nm3zWYzrQ49F2tPJllmenkY5ZvWKn+rF+vXH8RWyNwz8Wpyn6JPQZPx2oIJK
	YQbcCuab2Jv2i0AL63PbLncn1IMjRb11HHArWFxg/20nds29WPuZO4fBak8tGHWg427pDOeEmRh
	vjeRoBG8aayOuUGbMCO3ZnJjsuCB7ZXY914nD8HTtVrL/VB760WGrRvX4ym3/fN+n2wFSoVgJQM
	t7PfQ+VwBuM5XJ3dpempGvGvzThZkpgONvvrVm/GQfhhZJWU7TSpqKI6HVINKFU5qXAlSoPcdex
	inUPt4epItMomTWG5bZc5Llev7I7yrIcBo/yDq
X-Received: by 2002:a17:90b:4b86:b0:3ac:450a:fa22 with SMTP id 98e67ed59e1d1-3b3d06a254dmr2025391a91.2.1794988995976;
        Wed, 18 Nov 2026 00:03:15 -0800 (PST)
X-Received: by 2002:a17:90b:4b86:b0:3ac:450a:fa22 with SMTP id 98e67ed59e1d1-3b3d06a254dmr2025342a91.2.1794988995479;
        Wed, 18 Nov 2026 00:03:15 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d19b6adasm3004072a91.9.2026.11.18.00.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:03:14 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 16:02:26 +0800
Subject: [PATCH v23 5/8] coresight: etr: add a new function to retrieve the
 CTCU device
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
Message-Id: <20261118-enable-byte-cntr-for-ctcu-v23-5-67fd9db6bc0e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794988961; l=2348;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=Y/FvSaBbedQq8aKjgsZpsJQaVI9vU9ZVyO2kbtYJAR8=;
 b=v/Mog1KV7xh6PV68yXz5es3jTQaT/IlBXzKBN79xPwXQMDsGepiTTjA4syW53LI1F4XU7A2FD
 rIV2BRtqNLZDKZJI76FHVufgwKArL6AhegcEcgtHm0dIas07ZAuy2Qf
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=QenzLcbv c=1 sm=1 tr=0 ts=6afd5bc5 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=FuIWbRVyn4pKkvqW11oA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: XHu2touc2ORDSPdwlZClyObc5_o6ktLk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzMSBTYWx0ZWRfX2CgjXr6awNTI
 XQE8B7cuQpdQ5WA/szCgNf10pb3sc9UpDB7pB+itTkBaB7X+n1QDTmAE4C99+7SZNyMKy7uG+ok
 c2l3rqfmWwH/y45X0mfMJYaT8Fc8wFbbcA3mYPH4MDj2OcT05vlZpXo0XvNI2ai4b3NGJe3npzT
 XIdR+NwpGBFDhB/rbTjX0MG3Z4gESXcpJNa6f0vnity64ZUT/DyriidC4jFCCWX2fxtXJNl7nwg
 znHk57C41VGV/QUtH6ueHm2DgDQxtPTtd02CP6g3AImFlxmfnxIftAm0SgkWfAxPEDc3LZKCk0H
 NKFuIOuX76L4TAQcvARFzdq+e5jGC/UNgNgD+gbQHUQvG6M1CF4OjiwaVRqIf2NBia9n7grFNpr
 53pZqjNEGVaFKAFJllnYFAiALZwQyhB0DDZ8QGRT9RH5SNWBrwDEDidKX93+r/2WUZH6GgI2H/I
 EjaJXEZzQ8Yuulr2xcA==
X-Proofpoint-GUID: XHu2touc2ORDSPdwlZClyObc5_o6ktLk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzMSBTYWx0ZWRfX8Z2vrgs935Ys
 KSjH3fFLVd44n8kYvDYP70xkPlqLUlIrxpW0BzWHOuBJFszesrX/OQjAoZ7h1i8n8Ixx/TKzfdo
 x6vBhZq2DbsQ4CaIi9/SnCjZRLqOTpE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180031

Add tmc_etr_get_ctcu_device function to find the ptr of the
coresight_device of the CTCU device if the CTCU device is connected to
the TMC ETR device.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-etr.c | 24 ++++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h     |  1 +
 2 files changed, 25 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index 5032f5598e15..cc341cdf8d8e 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -865,6 +865,30 @@ tmc_etr_get_catu_device(struct tmc_drvdata *drvdata)
 }
 EXPORT_SYMBOL_GPL(tmc_etr_get_catu_device);
 
+/*
+ * TMC ETR could be connected to a CTCU device, which can provide ATID filter
+ * and byte-cntr service. This is represented by the output port of the TMC
+ * (ETR) connected to the input port of the CTCU.
+ *
+ * Returns	: coresight_device ptr for the CTCU device if a CTCU is found.
+ *		: NULL otherwise.
+ */
+struct coresight_device *
+tmc_etr_get_ctcu_device(struct tmc_drvdata *drvdata)
+{
+	struct coresight_device *etr = drvdata->csdev;
+	union coresight_dev_subtype ctcu_subtype = {
+		.helper_subtype = CORESIGHT_DEV_SUBTYPE_HELPER_CTCU
+	};
+
+	if (!IS_ENABLED(CONFIG_CORESIGHT_CTCU))
+		return NULL;
+
+	return coresight_find_output_type(etr->pdata, CORESIGHT_DEV_TYPE_HELPER,
+					  ctcu_subtype);
+}
+EXPORT_SYMBOL_GPL(tmc_etr_get_ctcu_device);
+
 static const struct etr_buf_operations *etr_buf_ops[] = {
 	[ETR_MODE_FLAT] = &etr_flat_buf_ops,
 	[ETR_MODE_ETR_SG] = &etr_sg_buf_ops,
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 36c80918958f..2345bdbb0b9d 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -474,6 +474,7 @@ static inline uint32_t find_crash_tracedata_crc(struct tmc_drvdata *drvdata,
 }
 
 struct coresight_device *tmc_etr_get_catu_device(struct tmc_drvdata *drvdata);
+struct coresight_device *tmc_etr_get_ctcu_device(struct tmc_drvdata *drvdata);
 
 void tmc_etr_set_catu_ops(const struct etr_buf_operations *catu);
 void tmc_etr_remove_catu_ops(void);

-- 
2.34.1

