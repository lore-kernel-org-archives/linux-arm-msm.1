Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794988993;
	b=5FAEOTfUl4n4ZdCa9Bd0cGNEzQ0sPTBSw3FstRjVg3kXXM2DF28dJSgdUMq1bjl/Megs
	 NTgrttAmSI5ywrorU8NwR3WZhmwPUhVMcxgUgzddZAiNnZmLqaKcPP0pWLJZzSQeF7q2M
	 QAbQlncI07lyazRs4OejaPH2q6fhKJMdxeNEjtOlbgPLEqJ+m9cr4qEZBaboypYS5Sj+2
	 ZqJSCc47e2d4+1v2Dzys7UtCQ0VG6K7tyPrT7U8O+AnbIeo3dN9JePgn4W9t2t3ra+noa
	 EoZXsB2KGvN5GxJjEM67okrYtr/Z3wrjKHabfTj6ierqTWYIiwJ7KbfSLfnYVoNdc5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794988993;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=K62i/P8PbkS4nusY5tpqbkn28J4X/MrUcVukoPMJY+I=;
	b=Rl66sIb0cautdPs7xRAFBg0JLqCupJoeSziMOssuMnb4sq/Fd3w+RZY/3JJpxTcIbSsB
	 2yxSCWLQH7bsPVsly45bB/6YM5a1aLNRtAP/HNPzmz1DnGv68yO3JOBSF177L+x55IwMn
	 /x/s5wrgzf1UHJsOmhF2mX5Jzpa0WndqJb6GwNz+bM1QpfDDFCT3JhbT4AzAxqyoU/+Rr
	 bhjcABYvwdzres121YCE5hekJ0IYUP5/o/w8ycAIAG/9kx9nSbRGlPjRbKBDpIfMN12GK
	 Cu137hASHVjScRXEq9X6Z0x/sz4o/zDo23DXefLgY2yQptjo9iLrdbB+KVhmjwaySzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="F/ZWmvr3";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZMLYIwxh;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F69606A31C
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 08:03:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7F69606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F/ZWmvr3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZMLYIwxh
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2Uu9S2453525
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 08:03:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K62i/P8PbkS4nusY5tpqbkn28J4X/MrUcVukoPMJY+I=; b=F/ZWmvr3gHLaB7aC
	7taq5Brrls522PG+6WBczD3ri0pnjtCBxnfk63qHq5myOEijLIuARX6fyO5Z87+9
	/XPVeoNYYElacKxCvEbyzVcYf/HylsIEQbsg2LkjK3zLyTI7imBlZjMNA0iz3p7X
	32aRkV7zwv2GSXYOriba94kpwbGiNNNEywxJoou9q0lCJlz8l38z7WPGVNJ+GJ2r
	PkUyHssenkV5KhuMpmZ5g9fcpVyifRe+F8iHqz2xpvP8kzX1OLSO+mszD/ApbkhU
	+3kWk4AZWtgqxXAgn/y0D/tBzVJYuTvuW+gc6CsTm+dhssVL+/v48tYM6Y2sZBDf
	ye4dKQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv99wjc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 08:03:11 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b07b06027eso792465a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 00:03:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794988990; x=1795593790; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K62i/P8PbkS4nusY5tpqbkn28J4X/MrUcVukoPMJY+I=;
        b=ZMLYIwxhDQ1r0NNnGBtn0Fuv1MQzoEFvUcy/nbGYkhZ0VzlaQ7xmut7Xeip0ScZN2m
         BpsJxjP8QbAvwGShqsNqToohfx6nZU7qVbyRoLbruVSBh3ohrO69c+4A6oISM5XNgkyv
         vWfpaIIvAmEopmuuJoc5Q2rGVjTGraZAdPrVDsQ4Pg54AJf2Cz68xtmVK3VRRWf9PY7d
         blNqKp0wSnHh4cOrGZ2PqcDG0GuvARyNTaPsK+L9sgO77SeXsGO46YS+NgQn9NUQila2
         wHPGl4+338rsqKuC27yAnzhJWv7Xv3yxhiiLkven8e/mldhVI6y5K7v+jGecK+ieyFDn
         irNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794988990; x=1795593790;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K62i/P8PbkS4nusY5tpqbkn28J4X/MrUcVukoPMJY+I=;
        b=mJ3IKH1DcGIsvRVj/wkE3OJJi2AO+/9P6MDn6a2gHpjZtVYl5XbjGK6EtK9Xb1FDzf
         Z56U9izJICn+HXQ6t4GQtM8A+L59m6Zw/TnDVxOADTmXrG6fazYoSQqoxMUYaF+Bkwwq
         J+Eh7ICeHKv+/Qd0Mr3wbACSwayugcHehedDHJV/iVu6x11LWgpHCJZfBG8DhwTO9MCG
         +E+hDJy9+oqikmfjQwZVaNzKDT3XwYR2sLRYN+fR5nbgGa/FxrA7kxnNUQTm3tzPalMm
         eoHTE8xfq6d5aThqsjM0rXD7nULOEukGWAZOCLYWr3EwcqVYMWauP1DiIayw7phFmvq+
         8FKQ==
X-Forwarded-Encrypted: i=1; AL+hErHrJK0sDLwuDZMP8C53Pgb0bItdgE2iMSMNa5mmMI27+AsrUUPvRcc8zCAoPUJ5ETQP117Ddu4QnJDKi/yh@vger.kernel.org
X-Gm-Message-State: APuU4Z/nABDub4Q9DiSKON4kqV4SJTkWVYMExLShEZrXE65UGojhzR6w
	aKa/4z22sxKsOla1Ov6K2LaE6lfHxKbALBkHPnWUXYXrH/10NdAiEGkdzcuA0TfTzdnib8JPjs0
	XsFsEx4+7DqNckMToomKNRIm4XtMoEWwtzpYNQOPKNmuanslOynJkDaq2b/eZAVG1gdHM
X-Gm-Gg: AZFdTZe3PM0u1qFdN3h8zOIaCZb6vq+0ms0f1ZkJiJJW+HJt9CuF0gha8kJZH4/svjd
	RCYabXJEVgYKDWY6tVG8z+hz1ob7I2EVXB6YtKhvGHf2x47k3YYMVU3fcngANBJ7wuSvflzEr/f
	DwyItCALu21bvH6PHIqfR/UUuj2iejE9MC7TJFYKTs4hjUvf5oRnr2txGUKevWJmoiSH9UolKSf
	dXSP4Qrsd2k4jAU6fuY5iVpRA2OztzzbheXZgr73H58dIm19bwesGAmpgEk2TmqlcaDl/6keDUW
	WO9uloERiAyu9cZlvMcbS4imQTPGyjtAainA913ljfbysda1U4Snn9VXSdOsZXjw/awbdqsMdM0
	1EYaeb3pod/PYajRJdn5OrfiS+W9MGyh42cpeCqabgg3LpLDLuZhNJZu559P4lH8etaZhJsIx1g
	+H0ci5bdbr/o5uSPXOrQ0cLcXiasAh7YBXvxrF
X-Received: by 2002:a17:90b:314e:b0:3b3:c930:35d1 with SMTP id 98e67ed59e1d1-3b3d07c8421mr2112411a91.51.1794988990411;
        Wed, 18 Nov 2026 00:03:10 -0800 (PST)
X-Received: by 2002:a17:90b:314e:b0:3b3:c930:35d1 with SMTP id 98e67ed59e1d1-3b3d07c8421mr2112376a91.51.1794988989891;
        Wed, 18 Nov 2026 00:03:09 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d19b6adasm3004072a91.9.2026.11.18.00.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:03:09 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 16:02:25 +0800
Subject: [PATCH v23 4/8] coresight: tmc: introduce tmc_sysfs_ops to wrap
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
Message-Id: <20261118-enable-byte-cntr-for-ctcu-v23-4-67fd9db6bc0e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794988961; l=5197;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=Zyx/d9oIgPkQ60/304aFUQUx4sMlZWIw6sxJoMobPBo=;
 b=kOuLu8kjSDywN8FMrbAJZo7tMeThc9NJkXQ4XuLTGHWV4dUYOTk8r3WOkWc/BDLS7Mkb1lkQv
 jZExQ9Tf66VBq/jdoW9DQNg9+tY1FPahJTztA6bzr3YMcUoozC7pI9a
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzMSBTYWx0ZWRfX/chkvvyALGQC
 g/G/vn55l13ZBftwkzeu3m5t8vorJClsXK7oVNKHBwd406XZV6wJU5uNTW5UFDS/Jvq2Eq2/w0S
 NO3F4fOQVhe7iVS33jZDaqkwI5eR02E=
X-Authority-Analysis: v=2.4 cv=acT0Dhot c=1 sm=1 tr=0 ts=6afd5bbf cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=ia3uihG--C1vaqsH_ucA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzMSBTYWx0ZWRfX2pWRBGfydcfj
 GEE77gnQp7FdCTCALZ26qxkQwTNpyAEt9tTYsZWSxz+1JDzXx3uz+DkqWeZHpGT42xZXZLP53Xc
 MgvWUw9ZhD82K8z+MeQaSO2rKILwjGztpfJVt9jUSLMpW4/h2Cwft57v6O7Rf8cyZoHjC7ISgN4
 GmSJKBdnK1B2yiI5PWyQO0Ga1RDFnhaY6Mr9g4jrlVd4ytF1P2yV+BgoXlfgMAV5IdJW6Kf6VtW
 xC/Avka1tteNS3g+NYSK9enX/FdxcoSnRrt3zp69lg7JdHaNGJsMcMsvd91BpDHbBIp0bYlYAF1
 NRat1AWyfQJX4mpkddniUwwLQXGv3Yk+OEyskmCdCV3Vo/tzHjVJlANw6jxpiZXbsAR0aHzVoaX
 ylsPlreG1uCH+VkwzNy/eSt+4lQg+Tj2kGv++67jugAC0s+6QLLXXizS3sIGEAWyL1MkER+Xcz7
 w5L3NZXlge7HIjBZseA==
X-Proofpoint-ORIG-GUID: 6bNUQgPM4RiU-IJ9xP1ME0TW_2A__Wqt
X-Proofpoint-GUID: 6bNUQgPM4RiU-IJ9xP1ME0TW_2A__Wqt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180031

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

