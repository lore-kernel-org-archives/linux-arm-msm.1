Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793612863;
	b=TR4iaFzyln9pws3JoP02kjNYfLg4K0vLFTRXZrUCNjTLGlGckrCtMqwTcOf323bBijct
	 5bFOcArOWhrv9qcF9eIYJ20q8BzHAaunVXkEju4JNvfVBm++/9JDmZkKFl59KJUEvUNuj
	 /8QBDs0LrEcRdTU22u1nmQZnNSSQSRFKcS6JlZO6DEly30IMc5dtEDcXGkXR12YIvrPUZ
	 hJHxCWDUnzM8on8cdeJ3iCiiFCXdWVZX5GFRX2iV/Aq0SqUoMxeveAD5vsZXGpCflaTA5
	 2VDNX7IdbVfs92HtZAhXfdf0m1lGyxq7b+fjqhpvrZNnycwNXIr2K/acJo6DuDRYj5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793612863;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=K62i/P8PbkS4nusY5tpqbkn28J4X/MrUcVukoPMJY+I=;
	b=K9Co4SxwMCc+sM7ufC98vg7ha/Uzjd65Hr3dPtcq5QC9GITzDO5VZ5b41t3GvZNfpFyp
	 CDQgVVOHLAtpt+kIEASGMo2+dA0FKd8uzv9NCo+dxFP2/iuhtXQgbj3HUBplAszJxHxV5
	 ICd6z0iZ9j3I762c8Ve+LxsaXb9sBHyYR5gNz8pRdy/MSlOxWU5klHpSU0TUctZ8K/nCL
	 Ypwibz0xx1gXUh4fViC9ljVSuzlaOUD4KdHP1StJgGDGk2ajFeC7cHt1/C+L7bKSLFcJx
	 9kFbUHbumHTI7KcGVgI8Ki4+DFKp1aD238aLkAQehookErYOST4FX3lX+pbo09Xgnbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RNJUqfs1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hXhF+0X5;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5891B606A327
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 09:47:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5891B606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RNJUqfs1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hXhF+0X5
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29ABKC260686
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 09:47:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K62i/P8PbkS4nusY5tpqbkn28J4X/MrUcVukoPMJY+I=; b=RNJUqfs19Sr+WHph
	sG8GJEuoIorB6oTdHRYnBL3CjwaUyMsTwJHoCk1DHgyOqlP3ep0vCNun1HXt/lww
	jd5BNpC4MWd68Qypmu+xgNPMzNGKQS+Wgu0I3O/XPf5r87btGZAcgvVeJaP4IKac
	VevRDpWMi4p3HI6prsN0ddgVJ27OMzjD1gpfkrGf3N7d6DcCHjF2Ee5j7Deu7R+Q
	m2SrraJCCpZFl2NB9L/XBTzM9jCRMMchfUL/WCX5ld6qmtgmN/6/u4geiIM91K33
	V/hAcQ8hPAATebK/O1mhDj6g0XBD1lTQvKYlQ2YxcUqh95l0BstczvPCv67e2Kmj
	CQyQgw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqmvr5kq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 09:47:41 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3adad90c894so3094425a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 01:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793612861; x=1794217661; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K62i/P8PbkS4nusY5tpqbkn28J4X/MrUcVukoPMJY+I=;
        b=hXhF+0X52so4HJEIfx2/5X0sAjV0rL2WBy7uu7KIZeL1B4nCqxyt746v9K0DD3+v0x
         vHsB5sTMHROQ1UxlHpx9cdagTzM95u8CUIF1sV+0wrpQpzdDgEUITBn/fcdw7tAY07wx
         L+Z3Jv7mGj3meL9uURAqLlfyiaIGxCgcionmBE5jEw6RmWuDM6m8HzuP215/8NEr3Wfj
         970XXnoHROjy49ubuDzQSllPNjX7ISoaxt0hUmUtuuq6wD6umouUDp7zMrwxQ7uxYGTk
         Yjuk5qYPhPMoz8A3Ov0ie3PhOow9lIIAB1hh6xtt5SviR0u9WlQdDmeOwvZazuwoBMGm
         /JHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793612861; x=1794217661;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K62i/P8PbkS4nusY5tpqbkn28J4X/MrUcVukoPMJY+I=;
        b=m7phH/S6yZtNJDJ7KMNp+quj+xKubgZAeRM7jNYgODcU5OclGq8Tk8F1ZxT7HyOESs
         IQFHM+Nu2ROzPpWesu/X+FyDJDi5/rJKa58UmyyNodgLD9ly156ndqOSwm1Yaw3glKvC
         VAfHMLrzzB7vJzbZXO41CxibM8aX8ykHnEao+5zwo81wvPDRAqsFNw8jutqe2SVx0dID
         56PvLStD9MmNTpQlduYSmDEJ8cCnsSKZMUM+zuZE6rj/7/PYIneoT/Km8x+wnGhZeN0i
         5Tu6ZWrlQH/94G0sWNkYRwZ+gbseG4U5sII7sJ5IeWk8P12jI8+rqHjuOzuSlbVGswzr
         gPMg==
X-Forwarded-Encrypted: i=1; AKwUvByCaLaNNVZRNGcrMOf7bzwDULEGsGxWUgnQAJSszHO14gxxZ1rbXYqEcrjOny8mJM5MD/Dqi09LcAGsAsHR@vger.kernel.org
X-Gm-Message-State: APuU4Z8BADrEJBg1OkAyTmZvtjADSMulnxasrYjiwUfX+VsanqVzUjy2
	GqTTAU3Tjfjk4MSEDvDfMsNQc2t2mYSA/5Po+9VN0/yMdkaCs+VDfCXKNC0WSHLhseHR5lkOx5C
	vTwqaz5PRWXHZq5O3FlKhyzQY7MjSBSZPS3lLAAJJz06QwkmU3X9MFqODN3G7mDDYez8g
X-Gm-Gg: AYBFou3TUz/7r1KzTfMzaInnuRVcAhLSUEQQtxbwfVfhynmaM02ucsHioXJYetBmXXh
	Dc/58M+/e5Yl7phgQrm6/kTDlAbuQ/4Q0Ntf0BCoZUDr+vzQPktxk2OUz310Y3hMcrTx72xgacI
	8e3+qUEelTWL6hy7SbeRpa2M7/dQz2QT1HoCUdBicA52KC3o9Mnpv1c2BvKLpN7VXxTpd428L7U
	ewpKvA3WkoYRVmPCZQkr1yISdKAG+jHqVzJjaqkCJ+vVh/XpLRaj/7xIWWAAnGRRdVVdI9ObAPK
	lmLr30HPXXAWDLlZZ7/IznwAz4ubGJaw55rkYoDjp1EsYXb/SjqAo6Gxugl7z4cpYTJA+79Q506
	HlUzXdMXOyOsZ16KKlTTy8cwvN6x5aMGRXND7RAP36jpWck0iExPAL88dlluOKZyy2uIWz+0zwa
	HmWwmOwGqoc+OxkeN33XooUAY/jyBEUi9VbDM=
X-Received: by 2002:a17:90b:1cc5:b0:3a0:bbd8:5ba7 with SMTP id 98e67ed59e1d1-3ae89879e16mr8145691a91.62.1793612860656;
        Mon, 02 Nov 2026 01:47:40 -0800 (PST)
X-Received: by 2002:a17:90b:1cc5:b0:3a0:bbd8:5ba7 with SMTP id 98e67ed59e1d1-3ae89879e16mr8145657a91.62.1793612860131;
        Mon, 02 Nov 2026 01:47:40 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3aebaac28c9sm5053234a91.15.2026.11.02.01.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:47:39 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 17:46:32 +0800
Subject: [PATCH v21 4/8] coresight: tmc: introduce tmc_sysfs_ops to wrap
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
Message-Id: <20261102-enable-byte-cntr-for-ctcu-v21-4-231e069b7853@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793612830; l=5197;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=Zyx/d9oIgPkQ60/304aFUQUx4sMlZWIw6sxJoMobPBo=;
 b=XOtbNXnqwviiXVD8GZTLVAet/X/Y4w+n5WKiPSE7hWjDS/8H+PbLlGjs1lIIlzUiBsF3QkomK
 sZNwCEDZXiZCRBkij9CKD0mQfXzZzsdGowRUGPYmnHp/M6nIMEmQ+/Z
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=TMDQ2Fla c=1 sm=1 tr=0 ts=6ae85c3d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=ia3uihG--C1vaqsH_ucA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: E79JtfzX-9yTercdvKkj4nPjOIYpnkLQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfXx9MYTURnl63Y
 mMI5/AEs4HwZHr++WZri0259W2598giYLA1f65y8qCUJpfprkBSuE2KxORurEjgJQsVzxAwk3w1
 oqpY4dCRyBKh7OC8I02iSXKm4b7ySBg=
X-Proofpoint-ORIG-GUID: E79JtfzX-9yTercdvKkj4nPjOIYpnkLQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfX4SlPPHp4SUB8
 e5Gnznhk6BFZrEnoTkQhHt2yBXXkfQClFUeTUbsmR9RFGlVljph1OhZH/JGitPV+4A0fWQWojm6
 0dbaXowVQaTgtmJ52xFMRSNa2cdsUuz8a4Mn9eJQV3W9p8nSNyrkZFRIwdwJkuXz5tUzCyaz4wR
 XG4LnhYWFM3DUAfXzAWLk10M4KE/dA2ixnNbK+tbZ2evKNqwLG6L5exq+YN404e4Ri/3/GQTbX3
 dVFrglPPjclyc3ucgmaUJ50DqGAFhQkaO2UnyVDzameW5BVjkS47cWpm0LsW7rayP2RMJp6oe9d
 /9rhQOS1ZI+Xhmlw+xDLVrQ9A7L+C6McxRR+S408YdFVAoNXK0s7xt8RAqdr5eikwQMqXn16sV0
 T/cNr+BbYF0S3VtKRueNNWNILqOeD/fPgxWVRF4QdewkzQNzpOdPJAZ9mFxWA+nclt5bRw1G3Ae
 9xBWk0v6ERzMBJXpqsg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020038

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

