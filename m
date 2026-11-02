Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793612852;
	b=HE7p7nWZ3JcWbvuOtffyd9nOKpZdsHM3Ih6Yz+F1O96XFovNL8Vzhb7IA+mf9t9l0D58
	 EEHjch9rwjSQLqEgVmXFO0poVuH9izxL4R+QyzHxvc/w7q7nltsEUTedP6cOPIpKkDwDt
	 qkdGnrAEKyEBJ7gvhDhEgt+3za37j0H4McabZY4nZaw6/0OhRXWk7F+eTswOSE1YyQfSR
	 gNfENaEfnBFIOIIrd+rFR1g0LUZXV0GWlqFO4Kl6eo+kyQFDcX8oP+IzhSIVRV6n/O40r
	 0w+SJxId6IvVsvrh31Ql1OQxd2FU5sAxODoND7NzKaBnZyddmSdNQEAbJJ1rvPIQn/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793612852;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5ej3BUKV/D55FTj71RKQtUigbOCPEzf5HQ+6ednEf2A=;
	b=Sl6FeoaoePFywXAXxSz02QcvztLD7tE+Ztd13vxeqfJbmKp2GI08ocyEJKV/aQWYAGHy
	 +CLZgPkhELl8mDw1NqMsld6xadW3rtNkJr/dgcQnyLrkv7Q8ldEse7FyzLEVhU+eZWMP5
	 ZcaL+hxG7aYw+iupm81+qfJjKz5DfD0vPtXEXSXaRcAaCxhG682p9gF52ok3//5brfslP
	 lTZvBLOsvqg4xygUObPTaNo0xdkgCGSbxOVX+mbnZiM78ziGkTi8aOqBWWaMP2bfnCWLc
	 7QcCekf8EtGE2y14EPcVBEcBxLvAo3i0378mdq/3gtMoFKI8mt18X1JXFkMclSd6HJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Oj2CqraL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dHYpVGEU;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8576060A263F
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 09:47:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8576060A263F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Oj2CqraL;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dHYpVGEU
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AQS72361160
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 09:47:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5ej3BUKV/D55FTj71RKQtUigbOCPEzf5HQ+6ednEf2A=; b=Oj2CqraLaDhAzp06
	odyQ9N/V2DCq7MZy+JXyExeneR/5ClSTgnhXSvFLXtHxxM4DlN0CR5PfaHXNzKo2
	1cU2JG/11kxMaU5DWnI72/dTZsNW7ixS2aE6Vs30MAF8g9GatMDdAZoM8o3HEc1l
	+LxwA1tzvpQlULFkbRUUy9VSwJo4hKa98caqwSfof2FTz02zR4ijHZSYVuvHK7do
	FgL3tN9LYiDV6ui5hPSrjyvov2ZW4kNIQ+YNFGw+JNaadIJrkl1Uvu2xc6KbDJFo
	Xtmj+7T11kn+FMnuIKugFiwBfzlRFRCf51FpI5WvGmFkzC4OvEqHJ8mj1+MIp/K7
	sWQNqg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8q7x7v5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 09:47:30 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ad704d4760so2602634a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 01:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793612849; x=1794217649; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5ej3BUKV/D55FTj71RKQtUigbOCPEzf5HQ+6ednEf2A=;
        b=dHYpVGEUgekXTmRT8GVSDsm5gMJA3+bMX+vnCMcUgTyT72KuGXbjBHUNtNLvP8iO5u
         r6qFXU/NfsXyNqYwxt7Z8vQLm3s/8nZD17fcdJq1sU+0oJ7gKYVLWyHA2LU8J2EYTDlG
         ofCBM/mtK/6fUd8700mvEwJADMGfclOSM2cV6TZU/c8gzFkyDr2gr9r7R6nb/cHmL81D
         ss30dX1m89p7P8309QIMijirBrUlQoPz2ikAHKtvnmeJU4e85iMOpRbte7GgtBqi7Z+T
         MFrok/n0OaJc04D8Qi20hKxNH511aeLEbeUYN5aDLV2kvn+UxdUAwEbG4EWAvZ/X7zXg
         fRdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793612849; x=1794217649;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5ej3BUKV/D55FTj71RKQtUigbOCPEzf5HQ+6ednEf2A=;
        b=x8jMYLSm+MzEZO0XVdYg+wtlcKDJ6lOBF02KutiCygz31JaLRl3k6W6ljxQTRnibwL
         6Drpd+O9C5L2HXfHaAAwgfP9HL8xL7sNA67jLoF9gT5xPTZjgilRthmwHd7+Nf3P26VC
         IN+ig5WatBVlBbzwImLhjMU5fCjpb2i8/Xb9fhpCNKxsa4rTiHvlLWrzeKytIYFeSX2c
         kqNrADRdy0BnOfW9NkUdKB/BUpPqw040/s1taOy4anSgf2FLZFvRtqA1cdQ1z9EDMnWZ
         TsykPx5DP43/3lo6/fiGMAlVdf0yoWUYYTPPoBeJuJVBxqjF/kIdDF5di2bby4uyy67v
         vdNA==
X-Forwarded-Encrypted: i=1; AKwUvBwi14MB/9Qg9jegnXRaX56fyugUr7G5AdU3wiNvP7dZn6vu0ZYeqnm2+ISUvI3vz+RK19wSmmkrcc0BDyIB@vger.kernel.org
X-Gm-Message-State: APuU4Z9kE78UAZgxOajDrEPAAyO7FBKUdfFWbRGLMhcAZJxRJN7qYpm0
	g/U8lGNXXMCqm7FKoiRufXBZqJtqBxCDWUOB4ItkmPnGuIGCnp245piJDJbg2NyZQ5jJ7H7zR0x
	UwdP96qNQcCq26yAgCZoBxFxWbdBkqjMcslOqM+1fPR9OpDWLBXSIQmbvdz6eJldyXjS/
X-Gm-Gg: AYBFou2mlpSBl3F4ICYrj/edtfFbUtoVC1nRaEpe605073QS5hfB9oqTPjkcogkWlsY
	TIcydCS2KKNQYQMV2OvM+JJD6t38/8H9c4CPQNNfwSMW6MvgHVnTYtsPux+Fk5YPU5WVQ2Yb1eu
	yZOcQA5RyY80/ubVGfWt8rWK2rhqM+Rb+DMxtSxkWIu79rHar47j/Dyd8H+1pjsjpfZpB1wJHdp
	NyiWW4iGxAphsp27aKHaOZazrbmR49W+eYpeiGTBEkWCgo0CcLpG4UDdAxSRpx4in/V5I3/4BMO
	qtiG+3in66pe8Z8paHuprmDCJ2nqN/icyLZ1gCjuzBmKA0lARj+pXehpzDC1/BE0N6fNMIjVDjZ
	rkBbQCMcODMFxRbuQyqXjTvsE0rAFlSXhwdkg2w0kqrKYc8HLloTyjIMcrc5PxB+kwAC7y0ws5G
	YSxgiKOBoyhshs9WZF4EMKjwZMC06ZXjAqbJI=
X-Received: by 2002:a17:90b:264e:b0:3ac:8ee5:e007 with SMTP id 98e67ed59e1d1-3ae89735e6fmr7098768a91.20.1793612849401;
        Mon, 02 Nov 2026 01:47:29 -0800 (PST)
X-Received: by 2002:a17:90b:264e:b0:3ac:8ee5:e007 with SMTP id 98e67ed59e1d1-3ae89735e6fmr7098752a91.20.1793612848920;
        Mon, 02 Nov 2026 01:47:28 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3aebaac28c9sm5053234a91.15.2026.11.02.01.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:47:28 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 17:46:30 +0800
Subject: [PATCH v21 2/8] coresight: tmc: add create/clean functions for
 etr_buf_list
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
Message-Id: <20261102-enable-byte-cntr-for-ctcu-v21-2-231e069b7853@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793612829; l=9853;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=po6CmB+GnfquGFFNOGPW6UKGvugvj03f+WZ5mRtsgtc=;
 b=Memf5L5EAJy+JGNmOhwdCPx38VwHV5Se1V21eqALBs89D09xh99O3b8vO8S1Dfd4Vr7OA3qYv
 8h1OedZOYqjDUjZgVTAphiugebbTAXiC6tU3jEcrItFi+PrMYix/Qis
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: YaIiAMehNQavZeq1e45FBToF31iJ6cPW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfX8EKqDHjiWV5T
 5QL8LdeNIzdDG+JjJO9r7cEcGaewa1VRW/Vwn3JLDyE0BASZN+jSAeUukaTPUg0mxNOmMVgThSj
 mj33EbVXiFM7SwI1177+d/fNSDqPvxI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfXxwoInv3T0HOz
 xoJK/fFwYnhzfpyrxlz4RXyFc8BxKS6JF8WT2E5YFjrhTxpj/5UwtBx0WlNlJR1MZBYl6ydBrDS
 TLILqyKH53kg36s8DK0G7iUv4nH0iZeWCuXnpTDk/p07qu9xBd9pk3yRFhK6o0DeAIooWmmqn7i
 7Pd8OlbVYAy/83Sl/RJc7rDqaH4x4aMV9CwWw8LCpjN5r+AAub/l5UVLO3KxhNawu8nAyD12boq
 0DPBDJQpy7Zayp9r13PlrwYJt5OXU7l+S+hlz+XgCJT6+A7UZnyAQRi6gzDWfQToOfjF5MZ7SbD
 31OabnDVOm0aWKoWP7kwd7Tz4XxlUlszBIbvBo6Af9wM878Qf1W9Qd4xsOP9dYegq/JDt3URfWt
 19g4hnLaGfyNXFHEoIOiYGUj2ZcLBUqZhbImIz+u/txJuzS/4+iSl6S5Wa5nandDGBQ9+CrBpbt
 3dfhiciEQ0sM0lBhvhg==
X-Proofpoint-GUID: YaIiAMehNQavZeq1e45FBToF31iJ6cPW
X-Authority-Analysis: v=2.4 cv=PucG/AM3 c=1 sm=1 tr=0 ts=6ae85c32 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=IMKm-w8IxaDUVTpkAdcA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020038

Introduce functions for creating and inserting or removing the
etr_buf_node to/from the etr_buf_list.

The byte-cntr functionality requires two etr_buf to receive trace data.
The active etr_buf collects the trace data from source device, while the
byte-cntr reading function accesses the deactivated etr_buf after is
has been filled and synced, transferring data to the userspace.

Reviewed-by: Mike Leach <mike.leach@arm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-core.c |   1 +
 drivers/hwtracing/coresight/coresight-tmc-etr.c  | 168 ++++++++++++++++++++++-
 drivers/hwtracing/coresight/coresight-tmc.h      |  18 +++
 3 files changed, 185 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index bc5a133ada3e..bc7dd676da47 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -835,6 +835,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		idr_init(&drvdata->idr);
 		mutex_init(&drvdata->idr_mutex);
 		dev_list = "tmc_etr";
+		INIT_LIST_HEAD(&drvdata->etr_buf_list);
 		break;
 	case TMC_CONFIG_TYPE_ETF:
 		desc.groups = coresight_etf_groups;
diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index 361a433e6f0c..eee98a9269df 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1268,7 +1268,9 @@ static struct etr_buf *tmc_etr_get_sysfs_buffer(struct coresight_device *csdev)
 		raw_spin_lock_irqsave(&drvdata->spinlock, flags);
 	}
 
-	if (drvdata->reading || coresight_get_mode(csdev) == CS_MODE_PERF) {
+	/* The sysfs_buf is owned by the etr_buf_list, don't replace it */
+	if (drvdata->reading || coresight_get_mode(csdev) == CS_MODE_PERF ||
+	    !list_empty(&drvdata->etr_buf_list)) {
 		ret = -EBUSY;
 		goto out;
 	}
@@ -1918,6 +1920,167 @@ const struct coresight_ops tmc_etr_cs_ops = {
 	.panic_ops	= &tmc_etr_sync_ops,
 };
 
+/**
+ * tmc_clean_etr_buf_list - clean the etr_buf_list.
+ * @drvdata:	driver data of the TMC device.
+ *
+ * Remove all nodes from @drvdata->etr_buf_list and free their buffers.
+ * If a node holds the live sysfs_buf and the sink is enabled in sysfs mode, the
+ * node is removed but the buffer is not freed; ownership stays with
+ * drvdata->sysfs_buf.
+ *
+ * Locking: must not be called with @drvdata->spinlock held. The spinlock is
+ * taken internally to serialise the @drvdata->sysfs_buf accesses and the
+ * removal of the nodes against the ETR sink enable/disable paths and the
+ * generic sysfs read. There must be only one owner of the list at a time.
+ * Must be called from process context: buffers are freed with the lock
+ * released.
+ */
+void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata)
+{
+	struct etr_buf_node *nd, *next;
+	unsigned long flags;
+
+	list_for_each_entry_safe(nd, next, &drvdata->etr_buf_list, link) {
+		raw_spin_lock_irqsave(&drvdata->spinlock, flags);
+		if (nd->sysfs_buf == drvdata->sysfs_buf) {
+			if (coresight_get_mode(drvdata->csdev) == CS_MODE_SYSFS)
+				/*
+				 * The sink is still enabled in sysfs mode. Keep
+				 * the live buffer owned by drvdata->sysfs_buf
+				 * and only drop the list's reference to it.
+				 */
+				nd->sysfs_buf = NULL;
+			else
+				/* Free the buffer below through nd->sysfs_buf */
+				drvdata->sysfs_buf = NULL;
+		}
+		list_del(&nd->link);
+		raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+
+		/* Free the buffer (NULL is ignored) and the node out of the lock */
+		tmc_etr_free_sysfs_buf(nd->sysfs_buf);
+		kfree(nd);
+	}
+}
+EXPORT_SYMBOL_GPL(tmc_clean_etr_buf_list);
+
+/**
+ * tmc_create_etr_buf_list - create a list to manage the etr_buf_node.
+ * @drvdata:	driver data of the TMC device.
+ * @num_nodes:	number of nodes want to create with the list.
+ *
+ * Locking: must not be called with @drvdata->spinlock held. The spinlock is
+ * taken internally to serialise the @drvdata->sysfs_buf accesses and every
+ * update of @drvdata->etr_buf_list against the ETR sink enable/disable paths
+ * and the generic sysfs read. There must be only one owner of the list at a
+ * time. Must be called from process context: buffers and nodes are allocated
+ * with the lock released.
+ *
+ * Return: 0 upon success, else the error number: -EBUSY if a generic sysfs
+ * read is in progress, -EINVAL if the sink is not enabled in sysfs mode or
+ * the ETR is in the reserved buffer mode, or the error of the allocation.
+ */
+int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int num_nodes)
+{
+	struct etr_buf_node *new_node;
+	struct etr_buf *sysfs_buf;
+	unsigned long flags;
+	int i = 0, ret = 0;
+
+	/* We don't need a list if there is only one node */
+	if (num_nodes < 2)
+		return -EINVAL;
+
+	/*
+	 * All the etr_buf of the reserved mode are mapped to the same reserved
+	 * region, so they can't be used as separate buffers of the list.
+	 */
+	if (drvdata->etr_mode == ETR_MODE_RESRV)
+		return -EINVAL;
+
+	/*
+	 * We expect that sysfs_buf in drvdata has already been allocated.
+	 * Wrap the live sysfs_buf into the first node so the captured trace
+	 * data is preserved. Take the sysfs_buf and add the node under the
+	 * lock, so that the ETR sink enable path sees a non-empty list and
+	 * doesn't replace the buffer.
+	 */
+	new_node = kzalloc_obj(*new_node, GFP_KERNEL);
+	if (!new_node)
+		return -ENOMEM;
+
+	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
+	/* The sysfs_buf is in use by a sysfs read session */
+	if (drvdata->reading) {
+		raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+		kfree(new_node);
+		return -EBUSY;
+	}
+
+	/*
+	 * The sink enable path reuses or frees the sysfs_buf of a sink which
+	 * isn't enabled, so only wrap it while the sink is enabled in sysfs mode.
+	 */
+	if (coresight_get_mode(drvdata->csdev) != CS_MODE_SYSFS) {
+		raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+		kfree(new_node);
+		return -EINVAL;
+	}
+
+	if (drvdata->sysfs_buf) {
+		new_node->sysfs_buf = drvdata->sysfs_buf;
+		new_node->is_free = false;
+		list_add(&new_node->link, &drvdata->etr_buf_list);
+		new_node = NULL;
+		i++;
+	}
+	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+	/* Free the node if there is no live sysfs_buf to wrap */
+	kfree(new_node);
+
+	while (i < num_nodes) {
+		new_node = kzalloc_obj(*new_node, GFP_KERNEL);
+		if (!new_node) {
+			ret = -ENOMEM;
+			break;
+		}
+
+		/* Allocate the buffer with the lock released */
+		sysfs_buf = tmc_alloc_etr_buf(drvdata, drvdata->size, 0, cpu_to_node(0), NULL);
+		if (IS_ERR(sysfs_buf)) {
+			kfree(new_node);
+			ret = PTR_ERR(sysfs_buf);
+			break;
+		}
+
+		new_node->sysfs_buf = sysfs_buf;
+		/*
+		 * The drvdata->sysfs_buf write and the list update need the
+		 * spinlock, to serialise against the ETR sink enable/disable
+		 * paths.
+		 */
+		raw_spin_lock_irqsave(&drvdata->spinlock, flags);
+		/* We don't have an available sysfs_buf in drvdata, set one up */
+		if (!drvdata->sysfs_buf) {
+			drvdata->sysfs_buf = sysfs_buf;
+			new_node->is_free = false;
+		} else {
+			new_node->is_free = true;
+		}
+		list_add_tail(&new_node->link, &drvdata->etr_buf_list);
+		raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+		i++;
+	}
+
+	/* Clean the list if there is an error */
+	if (ret)
+		tmc_clean_etr_buf_list(drvdata);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(tmc_create_etr_buf_list);
+
 int tmc_read_prepare_etr(struct tmc_drvdata *drvdata)
 {
 	int ret = 0;
@@ -1928,7 +2091,8 @@ int tmc_read_prepare_etr(struct tmc_drvdata *drvdata)
 		return -EINVAL;
 
 	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
-	if (drvdata->reading) {
+	/* The sysfs_buf is owned by the etr_buf_list */
+	if (drvdata->reading || !list_empty(&drvdata->etr_buf_list)) {
 		ret = -EBUSY;
 		goto out;
 	}
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 319a354ede9f..7c604b9f92e5 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -208,6 +208,20 @@ struct tmc_resrv_buf {
 	s64		len;
 };
 
+/**
+ * struct etr_buf_node - node of the etr_buf_list
+ * @sysfs_buf:	Allocated sysfs_buf.
+ * @is_free:	Indicates whether the buffer is free to choose.
+ * @pos:	Offset to the start of the buffer.
+ * @link:	list_head of the node.
+ */
+struct etr_buf_node {
+	struct etr_buf		*sysfs_buf;
+	bool			is_free;
+	loff_t			pos;
+	struct list_head	link;
+};
+
 /**
  * struct tmc_drvdata - specifics associated to an TMC component
  * @atclk:	optional clock for the core parts of the TMC.
@@ -245,6 +259,7 @@ struct tmc_resrv_buf {
  *		(after crash) by default.
  * @crash_mdata: Reserved memory for storing tmc crash metadata.
  *		 Used by ETR/ETF.
+ * @etr_buf_list: List that is used to manage allocated etr_buf.
  */
 struct tmc_drvdata {
 	struct clk		*atclk;
@@ -275,6 +290,7 @@ struct tmc_drvdata {
 	struct etr_buf		*perf_buf;
 	struct tmc_resrv_buf	resrv_buf;
 	struct tmc_resrv_buf	crash_mdata;
+	struct list_head        etr_buf_list;
 };
 
 struct etr_buf_operations {
@@ -447,5 +463,7 @@ struct etr_buf *tmc_etr_get_buffer(struct coresight_device *csdev,
 				   enum cs_mode mode,
 				   struct coresight_path *path);
 extern const struct attribute_group coresight_etr_group;
+void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata);
+int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int num_nodes);
 
 #endif

-- 
2.34.1

