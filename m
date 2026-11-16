Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794814915;
	b=Uu4vFt6GriOVcIsfZeF42cOgNkh9Sw8/otsV3raP00ovhsBVXVaPDrnCqPKnTLl2MNm2
	 /viWjrl5LNrygYxSQhhDKeOZoubuKfZEi/ocZQ7/M1E6L7X7BAAJGF5QnuZ1/rXjQkIde
	 j0RMSBDoF7Oc12z0X4Zouj0gJFYzexuHJeSgDBrRmplJzrtwYdI9taqqpNemyO01yr1tu
	 AVdOuffVJNugRF5hJVxLSr2cTkG6zfjwKDvqhzZCZzTEk7i7wxYTALwdBIqYWTnDK+CIk
	 FemPpEQQlsi6nsziRM/U3DPqPqmGht7cTkJOglgasKcGvBbCHejZ3cOhTSMQrCtEltg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794814915;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=mhn0OweQE+BnzisnAAjetj2cn38RmmRxnWKULiDUvAs=;
	b=obSRguT0ZZEnp6UIvt9G41sIPkQEjs8+CQBcvrD19BuGodsWjz3BtmurNd5RtUGKIVQY
	 M6xz4DP99G3JkPb6v5exSJMkFS+lqcZA6T2yCHOvBXKiOn0s86DQ8E+D+i6qWJtBW9c00
	 qP5whHRFagEeNJATsSYObdnRncXrqjPj+Ii2aeelnsewJ5PVHrqt/+3vvJQNzANu1tQC6
	 B04PO5BnEd1Mk0hJBaez0k/T3ajKRxpQqqtKHnnnZ/C4UL3ZzDkO9cYZPzncs0e1Bb754
	 xY+nuMZqB46+Wx2qqN7W4wKyTwugMF/S513uVLPgRPdT56brioDMIfHOdDa2QVl77QQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S1dyGf4u;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Lgyx/24A";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31615606A323
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 07:41:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31615606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S1dyGf4u;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Lgyx/24A
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG7ex2f3488793
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 07:41:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mhn0OweQE+B
	nzisnAAjetj2cn38RmmRxnWKULiDUvAs=; b=S1dyGf4ulRlIR3Afj5yJMqKU3qG
	fI6mTZZBgb4KuuOMEiCGZ8xAdKbHjePlMZZgkj6lCown1aEl0lyG7BqX41piEMZA
	kECW21VdNkMAC78exWNvbdNB9KfKqe1W2LJFa9+MJ2U9dL026XeNl+cD1M83u7G8
	5DeKD1qCHEFmyP1sZVJz26ct6dR9yQNHIxJasFxhnlginaZfw49HBJsKhINURK1g
	QgaLVLxYosg5eLSOtxRdwzbXdjVP7hrd3AVPJbVfwpDuDpqG2dEka5nNJ3Xehhfl
	wIUJO+SHuJL+tgh7HSBlFKU8LqKRQmo6nTRH7t4PTMRRbVgVtQQZ4hoBrkw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmcdb5n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 07:41:54 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36efb506f29so2354078eec.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 23:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794814913; x=1795419713; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mhn0OweQE+BnzisnAAjetj2cn38RmmRxnWKULiDUvAs=;
        b=Lgyx/24AIjUMvYrvJ/JvWCC0SroJaUprb3n7lpLtwlEFGKdE5WTzK8jqZpxdSAkLKD
         CcnpZAfKfxaxMZCMI7IkM43d9TuecCdXu2g8JLMD1YHuMxvdOi6sZNy82cV7bivtXrG7
         26GLSALXAnzB5gCQzWHaEtoWGn97ocw5rlHp6HeaaAd0BQVy6BYhOGB/7/QAlUgHOXFE
         DisVjCw4BDEXgHN73hBL1o/4A1BVIc6+3UOFeZNyOqiLoSF+h1JubpIbXFCjd4qb/5rq
         RKfMA7H0PZvNNrch5sPe4s8+WlkoqtyZLvDRyUH40mB8oqEa7n3UgfjQZ7Xe8Yk4INXL
         5Plw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794814913; x=1795419713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mhn0OweQE+BnzisnAAjetj2cn38RmmRxnWKULiDUvAs=;
        b=0csxRgkQMYE2Kr9bywg5t9QLTlGu6RNQz44tH/S9NYaMlfNbZakwK2hKl+NsrvG3en
         sTF6L6kfpnWs3uSCz6+ywi1h862jaiTxvvM4/1BWJQxybyEiLspnMoe+OBYycN/QhjQH
         eHHoinY/AEta8eFiPcotHNOADf+XNyHQMg9mwZKTErxaoSmQ9KexO0EBg0+s44NGOiiP
         U4Hi3pBhp6nojIVGd4hVTRzTzH1+xoo30MhUSWR/+4bZr5OxWdBJ8QShrsfPUwy9WxpB
         NuvnIMXzBG2t3zdFZ8lM+iiiWB2kz+GDY32OUBCZcuLJhOuHVU5RKb22ss8Z07sOMJ/c
         j3ng==
X-Forwarded-Encrypted: i=1; AL+hErFRpdEhqoZf0N9bsIp6sYIWexWP41eaU2GG2qwOlOlrYXwr7THEWnElj6C1RKLXl1ek+FhOIEGVpklflpVY@vger.kernel.org
X-Gm-Message-State: APuU4Z+6C3nkoC1yg2QslWseyjy1sjTxKdKGXZOD1Msi9KXicFenmW/y
	hd2C0N+twLkEDcvJAwujZ2Mak5uyOhrH/MxaoHmPAB2ezkBXN3GLHmoWuryLSApeYBM3xpZogrZ
	gzmJ4MqAbOAJ87D5blCUvviJxg2PI0FLVZ5f5aJ16T9Y7KpGcuM4Y0ghxoEMpVFFpCYVU
X-Gm-Gg: AYBFou3db30D4JPPELbtJpXB5Hp/23v6+34WKzrX2S1kI5cCN7k7joAI/Snk6GxvMMg
	NEm4hWBtt5KbWOIAjaibxVQ1xQaElXctyrK+mlPR1FBuRzThAnK2xCjvkxjxnD0Cj2vEeP+jFyj
	vUvzFqMFbMVskdxkjNcMk6pS5XK4oKF1PxjAbTF4UonpiZGs1IEPn4g46IMV9BWhgNUNseOsX7H
	F3HD7lAY2cCKND1P8Bao4CF1A3b1UwB6oh4h02meDYNInR4BZUVXxYTuV7b668+TFRdN+X54rLR
	IlKEzexyoEd9f9daw3onLF3l+zH2ONRNVKMxubtxIoTeDusbEivHufj1P5TNdhehF82mp7SGUSK
	kSMZmbxqYoMR3Mr98jUtHR3ev2FZJ//HfxFbYrv7LY79cKKkQ8qpKXvsnJLnBK5fsdzlahzOvVx
	0M592vgGljfBjuaRUT5i1TgJ9Miu/A2SOxdg==
X-Received: by 2002:a05:7301:5086:b0:36a:5042:85b1 with SMTP id 5a478bee46e88-37963376ef2mr10029330eec.2.1794814913276;
        Sun, 15 Nov 2026 23:41:53 -0800 (PST)
X-Received: by 2002:a05:7301:5086:b0:36a:5042:85b1 with SMTP id 5a478bee46e88-37963376ef2mr10029293eec.2.1794814912595;
        Sun, 15 Nov 2026 23:41:52 -0800 (PST)
Received: from ap-cloud-sh02-lnx.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379569b8389sm52137536eec.25.2026.11.15.23.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:41:52 -0800 (PST)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org, songchai@qti.qualcomm.com,
        Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v18 5/8] qcom-tgu: Add TGU decode support
Date: Mon, 16 Nov 2026 15:41:15 +0800
Message-Id: <20261116074118.822731-6-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261116074118.822731-1-songwei.chai@oss.qualcomm.com>
References: <20261116074118.822731-1-songwei.chai@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAzMCBTYWx0ZWRfX8ky0Yc5zCM8m
 l4cjTe3bZmHPBGGEQA5Fu4A+rskdFCIA0VNXZqpqQea6iHarq0crKPN0txTBkrDiwdJnc3EtnZS
 1qQ9kItDIIsziBZ/YB/ICdiYyIOG4SM=
X-Proofpoint-ORIG-GUID: d9v2wH6qPjGacsRljOkncU-TVpV3pj6-
X-Proofpoint-GUID: d9v2wH6qPjGacsRljOkncU-TVpV3pj6-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAzMCBTYWx0ZWRfX+MxEhztOdMem
 djNPIfdsslTaqesdcGNaQF9rk77Bh5myAOm/TseBYsAJzQGgz6rmimYywV1YWhrvt5dt86Rl9P/
 v6Ph8yO1qh7Z/LVcQwyq4AzFovosW0Dekb+59Z+KvgS06FJkPNpHCJas1ro99d5uI02/tezTsez
 4NxxRkd88dGYtO9vxRoiuAJs1Bt4vgZNKcJTnbRvv3DM+uTjGnwmTkjl2lYMQowcv5pS3o0VDzX
 DrJ23T6Lsf7Z+/GInbKNqfyr68mLDbXh9xsdcistIGuxmWmNAlUA2d8kIw8JU5QGlXHiTJYgO9w
 ATTnnVzazdjsv/YpvfKa6uX0kgMNZWW2uhQlOA7jtCdYaB8ryZ+EdvAm/Dy8stqQOi6n4gdXThc
 jlB/dwGoA1Y0C2cVevwgbM//d79Y7iCeNedzsfi2DoilIwstA97eJWJlGUMejpPaUXKW2ypxQbQ
 rVXyoSmz9VYp13SOcbw==
X-Authority-Analysis: v=2.4 cv=Vpy2kO2n c=1 sm=1 tr=0 ts=6afab3c2 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=YABCWhCaaoNg3nrmXDQA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160030

Decoding is when all the potential pieces for creating a trigger
are brought together for a given step. Example - there may be a
counter keeping track of some occurrences and a priority-group that
is being used to detect a pattern on the sense inputs. These 2
inputs to condition_decode must be programmed, for a given step,
to establish the condition for the trigger, or movement to another
steps.

Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-amba-devices-tgu    |   7 +
 drivers/hwtracing/qcom/tgu.c                  | 200 +++++++++++++++---
 drivers/hwtracing/qcom/tgu.h                  |  35 ++-
 3 files changed, 214 insertions(+), 28 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
index 3be0b912c937..c7e6f13da83d 100644
--- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
+++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
@@ -14,3 +14,10 @@ KernelVersion:	7.5
 Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
 Description:
 		(RW) Set/Get the sensed signal with specific step and priority for TGU.
+
+What:		/sys/bus/amba/devices/<tgu-name>/step[0:7]_condition_decode/reg[0:3]
+Date:		November 2026
+KernelVersion:	7.5
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(RW) Set/Get the decode mode with specific step for TGU.
diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
index 917d506cddf9..1809cca4a94f 100644
--- a/drivers/hwtracing/qcom/tgu.c
+++ b/drivers/hwtracing/qcom/tgu.c
@@ -18,8 +18,8 @@
 
 struct tgu_attribute {
 	struct device_attribute attr;
+	enum operation_index operation_index;
 	u8 step_index;
-	u8 priority;
 	u8 reg_num;
 };
 
@@ -27,11 +27,36 @@ struct tgu_attribute {
  * drvdata->priority is a flat [priority][step][reg] array.
  */
 static int calculate_array_location(struct tgu_drvdata *drvdata,
-				    int step_index, int priority,
+				    int step_index, int operation_index,
 				    int reg_index)
 {
-	return priority * (drvdata->num_step) * (drvdata->num_reg) +
-		step_index * (drvdata->num_reg) + reg_index;
+	switch (operation_index) {
+	case TGU_PRIORITY0:
+	case TGU_PRIORITY1:
+	case TGU_PRIORITY2:
+	case TGU_PRIORITY3:
+		return operation_index * (drvdata->num_step) *
+			(drvdata->num_reg) +
+			step_index * (drvdata->num_reg) + reg_index;
+	case TGU_CONDITION_DECODE:
+		return step_index * (drvdata->num_condition_decode) +
+			reg_index;
+	default:
+		break;
+	}
+
+	return -EINVAL;
+}
+
+static int check_array_location(struct tgu_drvdata *drvdata, int step,
+				int ops, int reg)
+{
+	int result = calculate_array_location(drvdata, step, ops, reg);
+
+	if (result == -EINVAL)
+		dev_err(drvdata->dev, "check array location - Fail\n");
+
+	return result;
 }
 
 static ssize_t tgu_dataset_show(struct device *dev,
@@ -42,9 +67,11 @@ static ssize_t tgu_dataset_show(struct device *dev,
 			container_of(attr, struct tgu_attribute, attr);
 	int index;
 
-	index = calculate_array_location(drvdata, tgu_attr->step_index,
-					 tgu_attr->priority,
-					 tgu_attr->reg_num);
+	index = check_array_location(drvdata, tgu_attr->step_index,
+			tgu_attr->operation_index, tgu_attr->reg_num);
+
+	if (index == -EINVAL)
+		return index;
 
 	/*
 	 * Serialise against tgu_dataset_store() and tgu_enable(), which read
@@ -53,7 +80,20 @@ static ssize_t tgu_dataset_show(struct device *dev,
 	 */
 	guard(mutex)(&drvdata->lock);
 
-	return sysfs_emit(buf, "0x%x\n", drvdata->priority[index]);
+	switch (tgu_attr->operation_index) {
+	case TGU_PRIORITY0:
+	case TGU_PRIORITY1:
+	case TGU_PRIORITY2:
+	case TGU_PRIORITY3:
+		return sysfs_emit(buf, "0x%x\n",
+				drvdata->priority[index]);
+	case TGU_CONDITION_DECODE:
+		return sysfs_emit(buf, "0x%x\n",
+				drvdata->condition_decode[index]);
+	default:
+		break;
+	}
+	return -EINVAL;
 }
 
 static ssize_t tgu_dataset_store(struct device *dev,
@@ -73,12 +113,30 @@ static ssize_t tgu_dataset_store(struct device *dev,
 
 	guard(mutex)(&tgu_drvdata->lock);
 	index = calculate_array_location(tgu_drvdata, tgu_attr->step_index,
-					 tgu_attr->priority,
+					 tgu_attr->operation_index,
 					 tgu_attr->reg_num);
 
-	tgu_drvdata->priority[index] = val;
+	if (index == -EINVAL)
+		return index;
+
+	switch (tgu_attr->operation_index) {
+	case TGU_PRIORITY0:
+	case TGU_PRIORITY1:
+	case TGU_PRIORITY2:
+	case TGU_PRIORITY3:
+		tgu_drvdata->priority[index] = val;
+		ret = size;
+		break;
+	case TGU_CONDITION_DECODE:
+		tgu_drvdata->condition_decode[index] = val;
+		ret = size;
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
 
-	return size;
+	return ret;
 }
 
 static umode_t tgu_node_visible(struct kobject *kobject,
@@ -95,22 +153,41 @@ static umode_t tgu_node_visible(struct kobject *kobject,
 	if (tgu_attr->step_index >= drvdata->num_step)
 		return SYSFS_GROUP_INVISIBLE;
 
-	if (tgu_attr->reg_num >= drvdata->num_reg)
-		return 0;
+	switch (tgu_attr->operation_index) {
+	case TGU_PRIORITY0:
+	case TGU_PRIORITY1:
+	case TGU_PRIORITY2:
+	case TGU_PRIORITY3:
+		if (!drvdata->num_reg)
+			return SYSFS_GROUP_INVISIBLE;
+		if (tgu_attr->reg_num < drvdata->num_reg)
+			return attr->mode;
+		break;
+	case TGU_CONDITION_DECODE:
+		if (!drvdata->num_condition_decode)
+			return SYSFS_GROUP_INVISIBLE;
+		if (tgu_attr->reg_num < drvdata->num_condition_decode)
+			return attr->mode;
+		break;
+	default:
+		break;
+	}
 
-	return attr->mode;
+	return 0;
 }
 
-static void tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
+static ssize_t tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
 {
-	int i, j, k, index;
+	int i, j, k, index = 0;
 
 	CS_UNLOCK(drvdata->base);
 	for (i = 0; i < drvdata->num_step; i++) {
 		for (j = 0; j < MAX_PRIORITY; j++) {
 			for (k = 0; k < drvdata->num_reg; k++) {
-				index = calculate_array_location(
+				index = check_array_location(
 							drvdata, i, j, k);
+				if (index == -EINVAL)
+					goto exit;
 
 				writel(drvdata->priority[index],
 					drvdata->base +
@@ -118,14 +195,28 @@ static void tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
 			}
 		}
 	}
+
+	for (i = 0; i < drvdata->num_step; i++) {
+		for (j = 0; j < drvdata->num_condition_decode; j++) {
+			index = check_array_location(drvdata, i,
+						TGU_CONDITION_DECODE, j);
+			if (index == -EINVAL)
+				goto exit;
+
+			writel(drvdata->condition_decode[index],
+				drvdata->base + CONDITION_DECODE_STEP(i, j));
+		}
+	}
 	/* Enable TGU to program the triggers */
 	writel(1, drvdata->base + TGU_CONTROL);
+exit:
 	CS_LOCK(drvdata->base);
+	return index >= 0 ? 0 : -EINVAL;
 }
 
 static void tgu_set_dev_caps(struct tgu_drvdata *drvdata)
 {
-	int num_sense_input, num_reg, num_step;
+	int num_sense_input, num_reg, num_step, num_condition_decode;
 	u32 devid;
 
 	devid = readl(drvdata->base + CORESIGHT_DEVID);
@@ -153,12 +244,28 @@ static void tgu_set_dev_caps(struct tgu_drvdata *drvdata)
 		num_step = TGU_MAX_STEPS;
 	}
 	drvdata->num_step = num_step;
+
+	num_condition_decode = TGU_DEVID_CONDITIONS(devid);
+
+	if (num_condition_decode > TGU_MAX_CONDITION_DECODE) {
+		dev_warn(drvdata->dev,
+			"DEVID reports %d condition decode regs, clamping to %d\n",
+			num_condition_decode, TGU_MAX_CONDITION_DECODE);
+		num_condition_decode = TGU_MAX_CONDITION_DECODE;
+	}
+	drvdata->num_condition_decode = num_condition_decode;
 }
 
-static void tgu_enable(struct tgu_drvdata *drvdata)
+static int tgu_enable(struct tgu_drvdata *drvdata)
 {
-	tgu_write_all_hw_regs(drvdata);
+	int ret;
+
+	ret = tgu_write_all_hw_regs(drvdata);
+	if (ret)
+		return ret;
+
 	drvdata->enabled = true;
+	return 0;
 }
 
 static void tgu_disable(struct tgu_drvdata *drvdata)
@@ -212,7 +319,11 @@ static ssize_t tgu_enable_store(struct device *dev,
 		if (ret)
 			return ret;
 
-		tgu_enable(drvdata);
+		ret = tgu_enable(drvdata);
+		if (ret) {
+			pm_runtime_put(dev);
+			return ret;
+		}
 	} else {
 		if (!drvdata->enabled)
 			return -EINVAL;
@@ -234,12 +345,13 @@ static const struct attribute_group tgu_common_grp = {
 	.attrs = tgu_common_attrs,
 };
 
-#define tgu_dataset_rw(name, step_index, priority, reg_num)              \
-	(&((struct tgu_attribute[]){ {                                   \
-		__ATTR(name, 0644, tgu_dataset_show, tgu_dataset_store), \
-		step_index,                                              \
-		priority,                                                \
-		reg_num,                                                 \
+#define tgu_dataset_rw(name, step_idx, operation, reg_idx)                   \
+	(&((struct tgu_attribute[]){ {                                      \
+		.attr = __ATTR(name, 0644, tgu_dataset_show,                \
+				tgu_dataset_store),                         \
+		.operation_index = operation,                               \
+		.step_index = step_idx,                                    \
+		.reg_num = reg_idx,                                         \
 	} })[0].attr.attr)
 
 #define STEP_PRIORITY(step_index, reg_num, priority)              \
@@ -280,6 +392,24 @@ static const struct attribute_group tgu_common_grp = {
 		.name = "step" #step "_priority" #priority \
 	})
 
+#define STEP_DECODE(step_index, reg_num) \
+	tgu_dataset_rw(reg##reg_num, step_index, TGU_CONDITION_DECODE, reg_num)
+
+#define STEP_DECODE_LIST(step_index) \
+	{STEP_DECODE(step_index, 0), \
+	 STEP_DECODE(step_index, 1), \
+	 STEP_DECODE(step_index, 2), \
+	 STEP_DECODE(step_index, 3), \
+	 NULL                        \
+	}
+
+#define CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(step)\
+	(&(const struct attribute_group){\
+		.attrs = (struct attribute*[])STEP_DECODE_LIST(step),\
+		.is_visible = tgu_node_visible,\
+		.name = "step" #step "_condition_decode" \
+	})
+
 static const struct attribute_group *tgu_attr_groups[] = {
 	&tgu_common_grp,
 	PRIORITY_ATTRIBUTE_GROUP_INIT(0, 0),
@@ -314,6 +444,14 @@ static const struct attribute_group *tgu_attr_groups[] = {
 	PRIORITY_ATTRIBUTE_GROUP_INIT(7, 1),
 	PRIORITY_ATTRIBUTE_GROUP_INIT(7, 2),
 	PRIORITY_ATTRIBUTE_GROUP_INIT(7, 3),
+	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(0),
+	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(1),
+	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(2),
+	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(3),
+	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(4),
+	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(5),
+	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(6),
+	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(7),
 	NULL,
 };
 
@@ -321,6 +459,7 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
 {
 	struct device *dev = &adev->dev;
 	struct tgu_drvdata *drvdata;
+	int i, j;
 	int ret;
 
 	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
@@ -340,6 +479,13 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
 
 	tgu_set_dev_caps(drvdata);
 
+	/* Initialize all condition decode registers to NOT */
+	for (i = 0; i < drvdata->num_step; i++)
+		for (j = 0; j < drvdata->num_condition_decode; j++)
+			drvdata->condition_decode[calculate_array_location(
+				drvdata, i, TGU_CONDITION_DECODE, j)] =
+				TGU_CONDITION_DECODE_NOT;
+
 	drvdata->enabled = false;
 
 	ret = sysfs_create_groups(&dev->kobj, tgu_attr_groups);
diff --git a/drivers/hwtracing/qcom/tgu.h b/drivers/hwtracing/qcom/tgu.h
index d769379b8421..7d88ad8e730f 100644
--- a/drivers/hwtracing/qcom/tgu.h
+++ b/drivers/hwtracing/qcom/tgu.h
@@ -16,7 +16,8 @@
 	((int)FIELD_GET(GENMASK(17, 10), devid_val))
 #define TGU_DEVID_STEPS(devid_val) \
 	((int)FIELD_GET(GENMASK(6, 3), devid_val))
-
+#define TGU_DEVID_CONDITIONS(devid_val) \
+	((int)FIELD_GET(GENMASK(2, 0), devid_val))
 #define TGU_BITS_PER_SIGNAL	4
 #define LENGTH_REGISTER		32
 
@@ -44,6 +45,7 @@
  */
 #define STEP_SIZE		0x1D8
 #define PRIORITY0_OFFSET	0x0074
+#define CONDITION_DECODE_OFFSET	0x0050
 #define PRIORITY_STRIDE		0x0060
 #define REG_SIZE		0x4
 
@@ -54,6 +56,7 @@
  *
  *   TGU_MAX_STEPS         matches the static step0..step7 sysfs tables.
  *   TGU_MAX_PRIORITY_REGS matches the static reg0..reg23 sysfs tables.
+ *   TGU_MAX_CONDITION_DECODE decode region 0x50..0x5F holds 4 u32 registers
  *
  * Each priority level's block spans a full PRIORITY_STRIDE (0x60 bytes),
  * i.e. PRIORITY_STRIDE / REG_SIZE = 24 registers, all of them implemented.
@@ -61,15 +64,40 @@
 
 #define TGU_MAX_STEPS                  8
 #define TGU_MAX_PRIORITY_REGS          24
+#define TGU_MAX_CONDITION_DECODE       4
 
 /* Maximum priority that TGU supports */
 #define MAX_PRIORITY                   4
 
+/*
+ * Values for struct tgu_attribute.operation_index: TGU_PRIORITY0..
+ * TGU_PRIORITY3 select a priority level, TGU_CONDITION_DECODE selects the
+ * condition decode registers instead.
+ */
+enum operation_index {
+	TGU_PRIORITY0,
+	TGU_PRIORITY1,
+	TGU_PRIORITY2,
+	TGU_PRIORITY3,
+	TGU_CONDITION_DECODE,
+};
+
 /* Calculate compare step addresses */
 #define PRIORITY_REG_STEP(step, priority, reg)\
 	(PRIORITY0_OFFSET + PRIORITY_STRIDE * priority +\
 	 REG_SIZE * reg + STEP_SIZE * step)
 
+#define CONDITION_DECODE_STEP(step, decode) \
+	(CONDITION_DECODE_OFFSET + REG_SIZE * decode + STEP_SIZE * step)
+
+/*
+ * Neutral ('NOT') value for the condition decode registers. This is the
+ * driver's default so that, before userspace programs a real decode, an
+ * enabled step does not spuriously match. Used both when seeding the shadow
+ * table at probe and when clearing it via reset_tgu.
+ */
+#define TGU_CONDITION_DECODE_NOT 0x1000000
+
 /**
  * struct tgu_drvdata - Data structure for a TGU (Trigger Generation Unit)
  * @base: Memory-mapped base address of the TGU device
@@ -79,8 +107,11 @@
  * @enabled: Flag indicating whether the TGU device is enabled
  * @priority: Per-step, per-priority-level, per-register values staged by
  *            sysfs writes and flushed to hardware by tgu_enable()
+ * @condition_decode: Per-step, per-register decode values staged by sysfs
+ *                     writes and flushed to hardware by tgu_enable()
  * @num_reg: Number of priority registers implemented per priority level
  * @num_step: Number of steps implemented
+ * @num_condition_decode: Maximum number of condition_decode
  *
  * This structure defines the data associated with a TGU device,
  * including its base address, device pointer, the lock serialising
@@ -92,8 +123,10 @@ struct tgu_drvdata {
 	struct mutex lock;
 	bool enabled;
 	unsigned int priority[TGU_MAX_STEPS * MAX_PRIORITY * TGU_MAX_PRIORITY_REGS];
+	unsigned int condition_decode[TGU_MAX_STEPS * TGU_MAX_CONDITION_DECODE];
 	int num_reg;
 	int num_step;
+	int num_condition_decode;
 };
 
 #endif
-- 
2.34.1

