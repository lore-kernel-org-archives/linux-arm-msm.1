Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8E847CC8A
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 10:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791887441; cv=none; b=VcjjC7/Z4QRoiTATq7ZBVJ/TbUEB4QN+O+Uolvy1GKeN3BwJbHfosBGOHx2RWJcTL3er7SHX55ETcNOVqlpNcYbo0mCTJ1F5JV0j2KlAp3nOXntkDsBGh5XHLOxOCvQ6pyvhSSCmwEGlbmF40SN7v+zykXa9+YqpXzaErtbIbX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791887441; c=relaxed/simple;
	bh=DY7jRWya1V7pBJnOdw6mxdVbCjyXXQemGfkmzifD/sU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j8sWiytXcb0yumz+/2iD6aqV/5GRvMMKSJkkKpdFRaoO5eo29iBcHnnKIAuki9RnQqIyMv+Z1hg7gUBledF0X4FvpOwNTzel5qbqDItJI1CDj9BqdbRGNs1o6isX3VOfkyIkVa5VARNDoy6S14MrTyGBhpJ79MAe7U0xqPLiI4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YeBph5Jc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G8Ujsg0W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YeBph5Jc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G8Ujsg0W"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8RZnR3907366
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 10:30:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R/JpQ5rbqgRLuJ+aASIPnJlmyhNkhvx8AwZ8tUDYUlk=; b=YeBph5JcmibuCWG1
	rnQBm8jJ+PlXoJR/DLiNdOAlFJMapHa2IB6fm3InchofTisOT/DsLAr3OFxl5b8K
	6YsAC2jfo+BNvBShKrvBt7kfWyk0y6vJpe+nv4G8QDkyamtzDr3bKa7dh8VYFjN5
	6qfdkEIOiJlWht9GsktSLWwuh4rgyShQ82BYhufQy0BwsXyGiIiA+ziiVnaHNXS7
	tCBY1zdc3yHZkvjysBO360gMwXjk67L6SDiHZliFActBxLiUwciSYevPApC7rslP
	7BBnquy23w1eEp3mB42CHxK4+QuU2DKts6AJIcap7AaxvWIcYejCoFc7MPN04Qcv
	jsBWGw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h95xqu2cj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 10:30:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb93c874bso922087285a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 03:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791887438; x=1792492238; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R/JpQ5rbqgRLuJ+aASIPnJlmyhNkhvx8AwZ8tUDYUlk=;
        b=G8Ujsg0WaQV222ryWwNXk5X4vuLJHUb9x32ExGqxaCgslSccezOAK3PSJTe7C6RKxR
         IldzXl60m0S//ARR9Soji/+1bWh0yDraJO9j9SH5igK6GbxNxtH757qM35YBy8A393Yb
         JjXXUTVjGwDc9FPUBymaRhjtA5AHsjTGBfS46f4FQHGVfvChkdXl6NR22+sSegcPCUnu
         cZq7bmL4/Fny91+ETvst6/ST3OQphYgxgMDv22dDQdrhs8SCmvZn+nhSoxdhZ8cJfIeG
         7AM7mtpMYkC1Lhv9gbzV/gHBR3ijLw4IaANmJFe3KkrAP0Pmrgrhj72m/VYVzV0ssD+K
         kk5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791887438; x=1792492238;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R/JpQ5rbqgRLuJ+aASIPnJlmyhNkhvx8AwZ8tUDYUlk=;
        b=mM1+kk8riLfR6SLNKz4P4+fNnXYJbh1vjMC4wuurxQ6mCS4xqUotNJh/NMhG03BpFm
         +Peh1e/h8sROi6bbhvIrt13ZVLyoCbZ3kfnAf/UzQEcYDxITCEaO65QdYYi/lNZmeZt0
         sX+Ehy7J2aqU/VDtS+lXH6lvcouPsAlSiEhApiTruWgTOtN+xmvweNcccBIoF+3xe+Hh
         QGScGu/yFLqXHCG+kPZOvHjnQiknFrwTkUkj+lZQkZuaky3KvJz7PFmzLcMkqHrJtcOJ
         GIa4lttO90nZ3Oh6+8IRurUSKf+cVzqq76RK3BPBDn/YU+K9kWByAZFp3Y/Oard1syWo
         Wj4g==
X-Forwarded-Encrypted: i=1; AKwUvBxDzoeWRYboKijINrJe/KltLIrxg5NjzdqMiBXmuz58Y8Ng2gygNO0Sj53r5sARW6vomiaCoILDY76p1Ok9@vger.kernel.org
X-Gm-Message-State: AFq9FYKhK3n7Ow4QB5trsdKb5KH5C+jJrCLmhDzERNMEuWWbOvcTxQ1F
	gkbRDb9Vn9ZSyFxX9qvdgoVyES6/P+hQvCTCCMSICnRiWMjxMW0ia8478YxNXJKluvctPu7Xoz4
	/J8dIwWa62CiVz4UVlDUON286skOkvXRLpItAAuobwGk2/fa5/u/3Fn60SNWrQAXOKV+t
X-Gm-Gg: AYBFou0vVqIm8UYlkH7QXyZjseQrpS7boXw1qHsUmRKJaLIdizYuHK7Hnjxf2NllE88
	h78MFFYOMr0TzNlwv7YmvP5Zzb6Qy8qFWZlUA7nVzG1IQbFR54f4Dh9Y6npoyzCVr5Pb2qmN87c
	K+cbAM8Ch7xbfn+FOuCqGqoQysV2FTUGUqXcSie/d8lVpMhEbv/AP6ZlgGsU+9XdVvdyxyK3ysG
	WU2QDn9S/6rQHDM62/IDpn3DhZ7QdsuVDJS5uPNcsTDqNDqMXScxaPi9HvdGmPlUKC2AYS7gsP+
	7XPKeasyPenNYENpUSu698CvT2JYdBmqG+xifqjhm5/xxODS0K3tfEq/ijFeKf1Y5HcwDTunruy
	ihHDlHIJ9ocVCXiLS54cMdYOzUuO2UIIoHigWWXI6vQ6LXsWj17RD+RKG3FbmaKeM3eIIY2NOfK
	WfVW47oLLxReknEVk5aUoMt9YadwORlIxUmHEk8EPY7a/7jaydAig=
X-Received: by 2002:a05:620a:2b4d:b0:93c:5952:5765 with SMTP id af79cd13be357-93eb93ef568mr1900262885a.6.1791887437832;
        Tue, 13 Oct 2026 03:30:37 -0700 (PDT)
X-Received: by 2002:a05:620a:2b4d:b0:93c:5952:5765 with SMTP id af79cd13be357-93eb93ef568mr1900255185a.6.1791887437013;
        Tue, 13 Oct 2026 03:30:37 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:d108:3895:812b:662a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18be964dfsm349955115e9.7.2026.10.13.03.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 03:30:36 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 12:30:29 +0200
Subject: [PATCH v2 5/6] i2c: qcom-cci: Extend i2c read limits based on CCI
 revision
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-cci-imp-v2-5-6873326b44a3@oss.qualcomm.com>
References: <20261013-cci-imp-v2-0-6873326b44a3@oss.qualcomm.com>
In-Reply-To: <20261013-cci-imp-v2-0-6873326b44a3@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MSBTYWx0ZWRfX80UoXF79PMtj
 93VXc9K9d4liq+Lw8gSVF2G0KLNew2Xi73TbCZSMgEXrf6L3eVyAhiC/HpnUNjs2Slyw8bKuT40
 9RxvESnqkUlXy6lniiJa7DMPLtTUj92rOztW+yr2cYSM5EZgXVjC9r6N9hM4yFEm90YYntrCs3l
 fjiS6O1FLi4wtv+659HUJ1UZ6lLOK2LOCnw3Z1fChXiIqOYMs8lhmtcqTPbESCEVCurwyFjmBNF
 G6pndIn1ja8TQdvPuXEGBjv7jZ+H35l3pP7SmqAdjr/aVK/SSVXpPnXDV7VwOc/eeMSQu77u68S
 slbl2su8+Mw+2YbkpVwVxgXxUP/m2ZbzLIaoP5m1b3QFPvcX4sOqKDnmPCKaIBX2cif5q+za9Sn
 pquHlPhRXELX50zDyJC7p4D/vjyJFJq8C8ujqOhk/jqSULebWHFAjSJqv3VCJ1L/DARXWVpvX2o
 LPhFTG2JOvzeYGSwfAg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MSBTYWx0ZWRfXyeFFXP3nBH/V
 d1wWY40MZxmyz5kftDcovZdxFb8+JnbaWP18I4cNQYGNeblPsGOUdnP8aPGrFDZmIkdxYQdsTdl
 aawWtei1nsLT1ZW8E1CutLuM5TXXKjM=
X-Proofpoint-ORIG-GUID: PQRgJ8HqoqY17jLgjr3JNcDOQVhrb5h3
X-Authority-Analysis: v=2.4 cv=EP+TQFZC c=1 sm=1 tr=0 ts=6ace084e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=Q-BVT9UuQ3EDAlpGIL8A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: PQRgJ8HqoqY17jLgjr3JNcDOQVhrb5h3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130041

max_read_len was hardcoded to 12 bytes for all CCI revisions, but
this does not reflect the actual hardware limits. Depending on the
CCI version, the maximum read size is either 14 bytes (16 - 2) or
254 bytes (256 - 2), corresponding to FIFO_SIZE - 2. Two FIFO
bytes are reserved by the hardware, with the first and last bytes
used for metadata such as slave ID/address reporting.

Add CCI_I2C_READ_MAX_LEN macro to derive max_read_len from each
revision's FIFO size instead of hardcoding it and adjust the
values according the hardware revisions.

Improve the FIFO read procedure, read the first word, discard
its ID-echo byte, then drain the remaining words in a plain loop.
Switch to readl_relaxed() for the FIFO reads, since the preceding
wait_for_completion_timeout() already orders them against the
hardware's completion interrupt.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-cci.c | 37 +++++++++++++++++--------------------
 1 file changed, 17 insertions(+), 20 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index 27bbd1e196f9c55c1af14168b83eb6e6d51c75ed..9a8d201c890622d6c1f7b6b7aa2e0d7c075008ac 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -105,6 +105,9 @@
 	(((qsize) - CCI_I2C_BURST_OVERHEAD) / CCI_I2C_WRITE_WC *	\
 	 CCI_I2C_WRITE_MAX_LEN)
 
+/* The first and last bytes are reserved - not payload */
+#define CCI_I2C_READ_MAX_LEN(fsize) ((fsize) - 2)
+
 enum {
 	I2C_MODE_STANDARD,
 	I2C_MODE_FAST,
@@ -484,7 +487,6 @@ static int cci_i2c_read(struct cci *cci, u16 master,
 	u32 val, words_read, words_exp;
 	u8 queue = QUEUE_1;
 	int i, index = 0, ret;
-	bool first = true;
 
 	/*
 	 * Call validate queue to make sure queue is empty before starting.
@@ -512,21 +514,16 @@ static int cci_i2c_read(struct cci *cci, u16 master,
 		return -EIO;
 	}
 
-	do {
-		val = readl(cci->base + CCI_I2C_Mm_READ_DATA(master));
-
-		for (i = 0; i < 4 && index < len; i++) {
-			if (first) {
-				/* The LS byte of this register represents the
-				 * first byte read from the slave during a read
-				 * access.
-				 */
-				first = false;
-				continue;
-			}
+	/* The first byte of the read is the slave ID echo, not payload */
+	val = readl_relaxed(cci->base + CCI_I2C_Mm_READ_DATA(master));
+	for (i = 1; i < 4 && index < len; i++)
+		buf[index++] = (val >> (i * 8)) & 0xff;
+
+	while (--words_read) {
+		val = readl_relaxed(cci->base + CCI_I2C_Mm_READ_DATA(master));
+		for (i = 0; i < 4 && index < len; i++)
 			buf[index++] = (val >> (i * 8)) & 0xff;
-		}
-	} while (--words_read);
+	}
 
 	return 0;
 }
@@ -731,7 +728,7 @@ static const struct cci_data cci_hw_catalog[] = {
 		.queue_size = { 64, 16 },
 		.quirks = {
 			.max_write_len = 10,
-			.max_read_len = 12,
+			.max_read_len = CCI_I2C_READ_MAX_LEN(16),
 		},
 	},
 	{
@@ -740,7 +737,7 @@ static const struct cci_data cci_hw_catalog[] = {
 		.queue_size = { 64, 16 },
 		.quirks = {
 			.max_write_len = CCI_I2C_BURST_MAX_LEN(64),
-			.max_read_len = 12,
+			.max_read_len = CCI_I2C_READ_MAX_LEN(16),
 		},
 	},
 	{
@@ -749,7 +746,7 @@ static const struct cci_data cci_hw_catalog[] = {
 		.queue_size = { 128, 32 },
 		.quirks = {
 			.max_write_len = CCI_I2C_BURST_MAX_LEN(128),
-			.max_read_len = 12,
+			.max_read_len = CCI_I2C_READ_MAX_LEN(16),
 		},
 	},
 	{
@@ -758,7 +755,7 @@ static const struct cci_data cci_hw_catalog[] = {
 		.queue_size = { 128, 32 },
 		.quirks = {
 			.max_write_len = CCI_I2C_BURST_MAX_LEN(128),
-			.max_read_len = 12,
+			.max_read_len = CCI_I2C_READ_MAX_LEN(256),
 		},
 	},
 	{
@@ -767,7 +764,7 @@ static const struct cci_data cci_hw_catalog[] = {
 		.queue_size = { 1024, 32 },
 		.quirks = {
 			.max_write_len = CCI_I2C_BURST_MAX_LEN(1024),
-			.max_read_len = 12,
+			.max_read_len = CCI_I2C_READ_MAX_LEN(256),
 		},
 	},
 };

-- 
2.34.1

