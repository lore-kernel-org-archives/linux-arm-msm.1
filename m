Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793612869;
	b=x+OLmqVyw4z1Oo4WKwIjbgziFNg5w6FxCMXcFnmPE/d0C5Ou6DiPN8nJuQCkDxXrqYqR
	 BmbrQbvNaxPQDvoDcIXJ/ZNjIx2pGI1bkLb2zjaCElO2uT/cUpfTj70K661rE5kK1yeRS
	 K5RTrtEDkIH9AoPOpKyofWcCAVthm42vvJQFInd5Dkjycp4iOeW2x4hrHbotc2KUT6su3
	 MBGgysC34THJwBtqQQye0CA+uLO6wkciI3o30/Ovml9blkpOU8D5Ua+Uc6Gzga9chlyfm
	 I9AdxR/6wa3RKgKTGgB6UpsDGxEyzu79NKAx4TCA55orO6Q4egAF0Uq2QudsKKLiahw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793612869;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=EopcEXVJlshc6fFdssRRk7Nmikd8/mCpBz6B8w6T8bU=;
	b=L8+sNSgaqmdhtUXWOSs7vqO0WXDLpmk/M0BVRrI3B1CMNmxoiJKkX9oj7P1SaOTfnEla
	 Ij9gQFOEtIjo/dGRbWuwyaWzSq64SXZfsVdOHsPlBq7XoQHrI6sRv9INavu3cYvzaFtVl
	 rK5GxXmsBWlS0xe/zLt24irUHeVVA3+OsJXiCtWFw/FXhwgUdeYQGyEM1xlUckUeFoJbE
	 vQcD/Fu1S0kOcWiEby/ZvU7NGN5R9P/hQAcPyq4X5APg02lleWnO+9XrPZIKWoOy5yz+s
	 5BZuYfgA5hmlxE4yXQOVMAC8BgR6cdFxD5RgTnDSdnL667UQ+NVt3q1U5+Yvg9TmMHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mHk190Vv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UmUQHS54;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959AA606A32F
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 09:47:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 959AA606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mHk190Vv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UmUQHS54
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AS6t3440496
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 09:47:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EopcEXVJlshc6fFdssRRk7Nmikd8/mCpBz6B8w6T8bU=; b=mHk190VvNDxCyjAU
	jOxW7DpEW2RjomncdQIKanJwYxnrHQJMQY9UmATTa0BDsg3mWuIOfYG061G6MVS+
	XejDBe+qkRtwJaoNrE7wd4SAwzIbtf6XuxD48nHNNa0aS/4ckAUgNhrYWLqMdvv0
	bi7qbkUGHA46QmGRANwLgMS/VN2AXkpYoHQNVOqo25kZR+mnApoM7z2cxK0XgWx2
	7s9EAhF3BXl8jJ25WV6ppjLBA9AcShdez45U/fdIBEHFEo220B7frMKWCN7Fm6W1
	2LHEUU5+NDs+VRF7f7+951XxvHmVJl5PaxG5Vx8PA8SJc2wC2AihKqig823GhfXq
	E/ANcg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpg201qxc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 09:47:47 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3aed37745bcso196312a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 01:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793612866; x=1794217666; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EopcEXVJlshc6fFdssRRk7Nmikd8/mCpBz6B8w6T8bU=;
        b=UmUQHS54WrXpI8T1A9R5DQMowWD8xbHKQIt+yflf9wnPSV9RhlufI1d8ul0lI1QCV1
         VWLj5kwQTyPIWDxhEBKRdsaep9oeqapG7ELaKngyvscTV5aBsaUhSxen9oeFp2VcO+F2
         ECFx7Z7bNXboRvjEzcpcfvKzqWTMdWp0CM51N72AJ/nBCmIvrc98LK6b0WWJV3Hy8uLV
         FLF6EHoyhKisGyP8ZwxbxfOofwJ2zDXM4Kx8Nwd3ax3HUY/WIHUJ+SXNuWXawML7lVHH
         UXpV4Hw6Sf8Tt1YTI2i7AsnT/OrPq6COHU7EPAJhYxvdi33HdPo17jpiwr3SzEBFU1na
         5CdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793612866; x=1794217666;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EopcEXVJlshc6fFdssRRk7Nmikd8/mCpBz6B8w6T8bU=;
        b=ePMPid4G1BxSC3xc60RZPm4Xzx8dzItawYWJiJ5HZNXO6l5Ks1EQQstzJxo6kNsQ58
         RDGCnAfnNldko7EnVjmZWvCQZI90oLscY4ud3DDiwmDdRWLTGO5DbkqXzQFNzwaS4xg2
         0genFx5Xj1rPHK7McE+jKbcyhbsGTyLal2pTZFPTYu/PV2d3fMtcqnzRkDFIH4KVlcE4
         suomoS5h8D/JRoFOIcFqlcCzh8a5/7MeFWHijybnoztIhUZgA3i4tQ6R9J8PLYLdK40h
         wQs+zQeTgIAjMtABnJbE3TNYO5vW4Tue+cefQXV9rOWIxB+TYHNGhfccTfhoqV5IUbnB
         3PFA==
X-Forwarded-Encrypted: i=1; AKwUvByJuzV3PU1o/gB0E88kY1GJ1hG1jaKzqHvKJRCsU9SERweqMSqF41M9y+P9EypDn8+JqQrJWI4VjaHUW1dX@vger.kernel.org
X-Gm-Message-State: APuU4Z8EqiljhptQ15r5wkPB95sY4AlJ92msL0yCWz1Mq52H7y60B7Ns
	n8sXABxgws7N+jZ3gzRGoQFyHjb5hLcnErv5aIOtYRFRuwEWC94/XLzyONpapaHa0JTRJSs1DPK
	v4HAYRzt6gbQe0+CYfXPkID3A6whNew2ClMV3rPeFLi+MZpJM5KEZwGJTAPaxZuSVHCzW
X-Gm-Gg: AYBFou2cli6hHuy2oy+2gTpItKnWLYF6HJvqgh8bCypFEIT5yo4hP2Jst5e8Kmg6zrD
	t4Y/9U2/0KsSvGJbH3PbJy1fGNwC2HdFo5d42wHLBr8T/rnTWMNx9Tzces1VzSf8HuWMLCHohoi
	otyJfqsJ/z60i8+eLmPJl6ZbJdRRCIMWK3i7jru19ejs65/7xMLTJr2o9ujxaPoN7zAyoyJi4nw
	vKJIhXBDfhCnVUaYlLjlhzyKrjmju5Du0KWimZpcjatSxXVpeMH8+HxSvwhfkEu1UrsMHRgZ8xl
	XVUIRJ6zLwsOzHcWSm/YzlDe9xHtbZez1Ua4zOXYVCxJUMGWVS2z91iPo7I+UmLUfOtCX82MmDA
	zBAjnWrIbTrN6JgGgCaHyGuR3ebYPRZK9cLaYTQe1hLRMKFHHFj4C46G3oHnsE1y0Qv49o4/Ou/
	EkkI/Ed6xT8Eyl4w7Yh9pZPXVJu9c5ku2RlT0=
X-Received: by 2002:a17:90b:280c:b0:3a7:a3c8:8f4a with SMTP id 98e67ed59e1d1-3ae8972a6d2mr5341897a91.18.1793612866221;
        Mon, 02 Nov 2026 01:47:46 -0800 (PST)
X-Received: by 2002:a17:90b:280c:b0:3a7:a3c8:8f4a with SMTP id 98e67ed59e1d1-3ae8972a6d2mr5341870a91.18.1793612865710;
        Mon, 02 Nov 2026 01:47:45 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3aebaac28c9sm5053234a91.15.2026.11.02.01.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:47:45 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 17:46:33 +0800
Subject: [PATCH v21 5/8] coresight: etr: add a new function to retrieve the
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
Message-Id: <20261102-enable-byte-cntr-for-ctcu-v21-5-231e069b7853@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793612830; l=2348;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=xCitoVuPyJdwSq/nLCm3rX+LYZy3JMTxp5Mg/VzmuLM=;
 b=5p2RYwhfoSCqZkty7pDs+7dTH+BH8Bgud1+7pW8gEyNinxJ/eqvEgnmt/bmLvWqgYdKb3BUd6
 JCRfQNfi86lDp2fsgLmxn7w0iJoIR3bLMMjDDYxd22InIfHVOXchugo
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: r-u1ftTqm3BVcGMeaZjaV0jvaeMCgsni
X-Authority-Analysis: v=2.4 cv=fZY4WEQF c=1 sm=1 tr=0 ts=6ae85c43 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=FuIWbRVyn4pKkvqW11oA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: r-u1ftTqm3BVcGMeaZjaV0jvaeMCgsni
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfX2wT4/OLDXf/v
 N/xrPaaUj3/NeizRPSZe4eVbftdMd5ylWqB2Z9A3NufkG94j/J3ZHVqdIMKgH+JNyKzy01P9JAX
 HW03GY9NjM8oEIwke4SG+lxBZLPol54moqL24dWMBXtmCXy6MA7IuzT/LiQZH5KC5U/o0L9ZhrT
 hRyAyiY2beGbuf9Un//tofi9f702ZtzZvK4HHfUPtcSKq7Cf2HuSbYhEj92tWvvlor/10G+LIHx
 cDlLw8zyTbLQqxCDeiZ+3HcETnYb+e3btgA2bR2WlldzxApBu1aR2vQiPt8Z6PnqW4xJ1Q6puAA
 wJDrdFT9J2ECdljXTwz9AhCYfZwWL1RiFvgDFEgR0CnIJLyRop2qx27DMAEYTjkEg0gMER6mkU7
 CwBKl/p4OMz7NmdTiOb6nD/ngGcRdXmgM9HneFyiVJhZbqmHVyDZI2Welw50OZokLfjjTlV1zZi
 QA8FNHhZNv7hVA9Qtdw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfXxyOmDbMrmDIp
 WHkMG/z6oEcnjNuwuhHb66DiQ6JpIuuYNfUoYh7FsySzhviaIo0cYJf+QfY5lPX6WFt18sVG2Ji
 LQokr3cpLQOKGJAu49KFlJBMwkcSJq8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020038

Add tmc_etr_get_ctcu_device function to find the ptr of the
coresight_device of the CTCU device if the CTCU device is connected to
the TMC ETR device.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-etr.c | 24 ++++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h     |  1 +
 2 files changed, 25 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index 2de31d73a4b4..bf4c1d8f7b2e 100644
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

