Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793340103;
	b=lJPGpjlqmr8RdCMBtN0pYBSjW5xy/+/ZOKzS9BfWCChMqnwQwXNsL99F310qhbpMNgpC
	 x3y96M7Aj0C0c1TjyQH7WJYq2yqU2Y99MVu8zr4fInUEBpZd/Z5eidNqeaPFKjVrohZe9
	 td/GR32KC2ieKiBZfkAL6mLAL1L3f0zGISwOwPZnjDwpXutgjSvJOK4va4wW+Zr8JguFM
	 GEIrA6N5J/FbZJSqUtS4nhpJFPTHO3+VZ9X2NYE7NxubleOAOJ5wRjZnSOtSmBBjVh/Ff
	 6x8TOxRVxaLSKkPEH9/e5zLKah8GrCAh4ZXE9YKrDt2klYVXWcSo7LUH1ycWGWb0BuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793340103;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=C4m/o41K5fL/YEM2+crvUsuSSJz0c2LF9MIABocLHis=;
	b=rveSrMHwJXmTXmoedD3a9UiDfsHaRAHPGTpdASyjmsN/JMxvhHgW32LJZmVoOZV55maf
	 AYUkoZFiUt3XIWdOAKhSEMByyGTl1gNtgju3+buKQjKaB36yqK9ThvjkehY3Yc5mDE57R
	 ZnzE9UwQBisYIqQB7K/EFeeu7WyI1N+OGDAhZhZmdlmaboODPgxmOws/WPSdLiG/r7a/H
	 5JGsjx07eiFZfZA8jqXi9kG1Wj7eF6RPaLcZiZi+DU51HoYKk6japnPBKcjxSaRusi1+g
	 6jMLoiYyxn9taEPYjtkd+Sg4F8c6CJaXow/y+Sea1LjjRU2l87x0pXH9hcsZ70WRMOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aYR70t5J;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eL2fxupU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31772606A321
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 06:01:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31772606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aYR70t5J;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eL2fxupU
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U5F5Tq2287043
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 06:01:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C4m/o41K5fL/YEM2+crvUsuSSJz0c2LF9MIABocLHis=; b=aYR70t5JduIjjGKK
	G5+PjIsWekmlPVo13zV0JqgAhuKErTeN826gNYJAI4srNX/dVGIKAmYIBb44cHoV
	KyfINgEFGYRzlsJce/Iti0eMQ1foMfaKd3Z0yDZIQJjezL4UvVtTN8mmTfz33+RG
	gwjI4SX8uCtjW8dt66oBg1FeFNmd146psQ4DFdBh2kTMxf6a6cJa8owg6jqF5BV5
	44Zp2KJqyTBf2DO1K9cw4c7/dXHayNAfnfWAteHq/pdgDkVSk4gGeGt7nkBWIU9u
	CaR9q3bnkBNHaLYZbKpgHq7pLEyqHswcbP0wLw2mxKD8gAVCCocVS6zjJY3xTmnj
	GuqgmQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qheys-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 06:01:42 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd5ca3840c5so383337a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 23:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793340102; x=1793944902; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C4m/o41K5fL/YEM2+crvUsuSSJz0c2LF9MIABocLHis=;
        b=eL2fxupUOM1drAujwN+DSROYaMI3fb2CwehHsJARql/LEF4LiWIcVa0FwkbgSYw8/X
         lEaMAa8hXOgo86FXLpMzsmcuUA6Evs4Kpx8fBXwThJTXmk1FQ9jZhF2BNWCR6kPMVEb3
         FcbUasJjJtbB2CWR0liMpDDM9drzqtBbfLtKv6WGk+g6bcEojG57h6L9rTN5J0hY714+
         773DN1amJqaaSIwS1yX+8OJQnGNkIrLktd3bjmf3ejL6CFqWVLy2djkDaX/JItljhVzW
         qyIcLFbubg//B+OqcPsjHD+sxWFwarmKZviAcXpbP7kQ/M91dVD+uM8P/BP2GXai6hLG
         t4rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793340102; x=1793944902;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C4m/o41K5fL/YEM2+crvUsuSSJz0c2LF9MIABocLHis=;
        b=QjGFfFyan3NSXiyPx1Ngz1Sp0hY1QbrWD7iEZLdxBEbt4rLSnAzrqblqHcMTZ0u1+1
         7sfhCV9hAY6HM2zZMrwKghC6JvlrKUWEe+lGKus9IoaJK5S5vll/qu5BDyWVPY1CNCqw
         60mIGpYi3EQ0lQ2ShFAp19GG/yepJFF2mMg96OdcS+niD1HL/PTW+5XllUlH/K/PzEac
         tGAvk0lBL/FWCe6eGVOH6ositFPQD0w+Yb6B/wFX/sDa0nxJgXAE2D6dUm7uQhtk/nks
         3rpxKZlzdg50cLlfzMLoZ5pIfxXc3wPUYsjSBbVOPVtvUap7CzYQs/XPSwS6vPW1VtR2
         aB3g==
X-Forwarded-Encrypted: i=1; AKwUvBxG030IxdxXZdMf1m0ZpntImVaRDcqlaDhmbAMuEpItAZIJDZgiUGQcOfAydHWMPwbZwm3gPaSYMLk8mzwP@vger.kernel.org
X-Gm-Message-State: AFq9FYJhBASSc4H2nKJE3AsfnUslcmblnYSCyFU8TVi9BKCX5kpcVd/Z
	KfuPQj85Ixs1dhyTJDtYeh3sPmpOfYk6v+gEdDJemOiahjzvFX3HqXKXT9Nm294E3ahMLTVL2tM
	8qus/wjn9o0PRcON26U+Il0WOUxjNj+xUF2FvHUBdnxFuQg2L+7NB2bV5do6mN6a/OFwS
X-Gm-Gg: AYBFou0MY/piRCiCK/22OdF3A0Au8lfgQFxAbfGZe7crCzKNfANNyXyjd1YZ1jzSA9f
	81XZoiZyu9DMQUXE5Bs8bQoYA4s4ar6EA0bfDlxDP8DkvPKMnsiBLhH1cxRnXru4Z2kF669gj81
	Tzt//+BXsMDuVp64u/pp+6Q4fyIJvE+jyg/JhRed2NagzXTd2YdK+izkaOIaOkp/DL3PiW1Lc0G
	PkuU4NLP6tnhLMXP7oJ+D0jx7SaWP/YC8Z3b868QEemQA3niez20lDwmKueUxlk5g8+BikY0Aiu
	tAEf6VJE/hCnNWesOCuoYh3VAQ7pg9HTXWFa2VTsTY3g0aBWRmor3swiqeQzu61ol6G1oR7nZqb
	399t8MSm2KHI5P6VDU0JaA4qcSvdtfwbW73eYlGg6JC+mEY+BPtWQx68vso8Q4RN8LnSviwvffE
	MpnGeav1pg5Xws+YV3eNuxoI2+kOILiLOqyJUo
X-Received: by 2002:a05:6300:49:b0:3de:7dd6:ff8f with SMTP id adf61e73a8af0-3e928a07d14mr1355919637.50.1793340101760;
        Thu, 29 Oct 2026 23:01:41 -0700 (PDT)
X-Received: by 2002:a05:6300:49:b0:3de:7dd6:ff8f with SMTP id adf61e73a8af0-3e928a07d14mr1355893637.50.1793340101300;
        Thu, 29 Oct 2026 23:01:41 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb09706f01sm252292a12.20.2026.10.29.23.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 23:01:40 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 14:00:27 +0800
Subject: [PATCH v20 3/7] coresight: tmc: introduce tmc_sysfs_ops to wrap
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
Message-Id: <20261030-enable-byte-cntr-for-ctcu-v20-3-bd5c3ac9f916@oss.qualcomm.com>
References: <20261030-enable-byte-cntr-for-ctcu-v20-0-bd5c3ac9f916@oss.qualcomm.com>
In-Reply-To: <20261030-enable-byte-cntr-for-ctcu-v20-0-bd5c3ac9f916@oss.qualcomm.com>
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
        devicetree@vger.kernel.org, Mike Leach <mike.leach@arm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793340076; l=5200;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=tijaxrXD7Cb53GGSRhRGBOVQmb2AQTa3/Hi3VM9v7z0=;
 b=lcngeArK+hG1HE06QC4drcK1PNcAswiCJ2SXbCLp9OlqC78DzI/2TEz7Ri65PNIFWhwa9GhsR
 vWpbYYov41RBSFEu0fHHTijKJIDfJdQCcRv37gOuFV4U6Moqa3kcLpt
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: Ee9AbeFTdOHDAy9EbPU26CVaeOL6nsey
X-Authority-Analysis: v=2.4 cv=KLzPn1Fo c=1 sm=1 tr=0 ts=6ae432c6 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ia3uihG--C1vaqsH_ucA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAyMyBTYWx0ZWRfX2P2w6lIhM1Y0
 ITIEGRs7+VN7sTWXaDB6DKhQpOfgMhKwMxzUvi56NliPo17b1xkEo5B+7ZJfYG2e2lAed6h525D
 vJO+t40+MlOO0rpEWb7zFcU8RmpqDY6UaLE9IfMyDLA8sD8JxD9wWDAkd6toSHpcg/TAwC7r+Ig
 fVfFeTgFNJUcC6yWIyyOr/p2THSLcZKioeV4jRBJ19Goz/KEx2uj3bBW5kV6k5IQAc5gi7wNsHt
 gUiTMPRtINUChTJL0nwkqmMyJpnhbB19bAvuWP0lScqGzx3a4NNXRI79ScrFIYfql8JStUfi+Oq
 ptzq3dtac3QMMtlfjIoKoMxSilTK58mhIsMYm/jM5V/AC9fdquc84IrCmU1MzNtheNDorz9BvTa
 eP+f4n9SWliJcmTBhBv/OoH/Z3hUOsRR8QULbzYHNm8RmrB10RQfJv7Lxo5io9+AbxBUaeZ6y+Q
 6yzBjDbjAq34PcaPhOg==
X-Proofpoint-ORIG-GUID: Ee9AbeFTdOHDAy9EbPU26CVaeOL6nsey
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAyMyBTYWx0ZWRfXw/Lh3wd6GBkT
 LLCv6GJw/4eVlmr3ImGF3DJrEZQWKHqJA6yGaMj7oT5yWdHFv+A8ikVTjjSYYsi+Oq/NCG0HSOi
 CJ6e0BtzYwXZn7eQZNzxidH1IwoIBtU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300023

Introduce tmc_sysfs_ops as a wrapper, wrap sysfs read operations,
for reading trace data from the TMC buffer.

Reviewed-by: Mike Leach <mike.leach@linaro.org>
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
index 6e994678f926..a14645b04624 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -259,6 +259,7 @@ struct etr_buf_node {
  * @crash_mdata: Reserved memory for storing tmc crash metadata.
  *		 Used by ETR/ETF.
  * @etr_buf_list: List that is used to manage allocated etr_buf.
+ * @sysfs_ops:	Read operations for the sysfs mode.
  */
 struct tmc_drvdata {
 	struct clk		*atclk;
@@ -290,6 +291,20 @@ struct tmc_drvdata {
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

