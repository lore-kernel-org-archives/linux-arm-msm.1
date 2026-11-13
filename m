Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794538276;
	b=lNsHSILzqLJyfw6ri6aL5OAXCdev5WjUqX7oI6eiwHvDXhLScW8NO8rBylV7zUZJVRae
	 LpuFbbeO+WYoCJEJ3MBiJpTBP7099bkSILiLyuNeLusk3z/YfPvAqszlwzRhPl4310Lvg
	 maq9T54Xas7S7Oc8mCsppUiQeFNpJ4KfRbgB117L7bML6aoU5ywXDbQtnwaoS8zlSE7pq
	 C00p7ccpJYpbVKC6BSi9YvwUytEyPsz5WceZ3UmdctDgMUaJR4CNAhSXQruCIoyDRMoLv
	 jAh40aI+//qLB7oxJ/sNcPgOzWvTLKYUufzfHR+LfzQx4LibNumKk/Ac3TOAAvnvtGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794538276;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZEX8rSEpBWZdgcEf6WCVHcit9xfrDrlIB/7NImIOIto=;
	b=y7ZuUN86xMl2XppviBhXqR1JM05djmwV1s2+nSf/mHbnPqU/YsWY6k2Pwr7aQEImOeyH
	 oS648zYMb19UK32YLySNV4FnZ3N6fgiWJ0zEjCn7dO02AFE5uxoYaJVGr3qCF3WHOWfK9
	 L8I3JtORoDmQCk3WsJ6X/8CAUXK8KiFJ+xvtYNXC4viHvbCGvHaSbmMcUnNgk137PK+T7
	 b+fjelutowKHuXPiN3paMIZHPvp9EQs21JR0y4+MlSCC5tV7cBTOodLrOLCxHw+SAdsan
	 sFm9Tn9oKDnrRA9btQ3X61uMfUF4NJs8L3r6Y8DHfZ4dbbUT0avx9XZ+bPX+un8A4tQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ecZSEPjS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C5e90wME;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5CA1606A332
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 02:51:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5CA1606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ecZSEPjS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C5e90wME
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD2KD313179517
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 02:51:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZEX8rSEpBWZ
	dgcEf6WCVHcit9xfrDrlIB/7NImIOIto=; b=ecZSEPjSz+Xx0BcNkgH8GnW1yu5
	ECT+XMT4eRrppkCHaylXfZ8HE7OyDtMi2to2b5Ggp1dsYub4BhP0ldNltwlI/gMT
	p+Wim5SBpPWQzoJNZ2YGMXYAzntRk5WPFlM+8dUr4Vh4bm6bM+vEjq2fP+vakkPl
	WR7TnxGGDt4y5TBt3rMi3+ELAnqES+cAnwbzfWBkwQekBHWNDFqKAGUNRiwVkrvN
	AvZlhdrkZ9ztyp20HqNxUT+aeKso+8kgMoBHzqnqqAjYDG6iglv+EaVdmT8UvuhL
	OLNDx6lV+yYCl4JmqrKVeyaKYnKTAVNs7lRNvSV+G9ZIWr0SloZ/loMDBlQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwh0aht9b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 02:51:14 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ea71803effso4491455ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 18:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794538273; x=1795143073; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZEX8rSEpBWZdgcEf6WCVHcit9xfrDrlIB/7NImIOIto=;
        b=C5e90wMEhA6m13JcBnVN7yU2AovpjUc4+S5pQQ9sgQ/2mqzfoZyS3v299+SWJeqLin
         Xp3IQqCVlOqi2hmahpVsbhkwkBM7HHQKi5cHIG8AiuLsyJzf7R43NtbbqautMgmFJG24
         q25ahp3+Mt086JE7yZRRQFbW2Ma3AJrGyoKLOkN8OE0uj1z5qPLhEogu2OWkBm7cANVq
         55bd39e3eY8JVf/D7m+4fGMQiEdUyyL9YhwDLn75SztACIP+DSyjFcQBEo1H5J1ZKi4x
         8K5PAMcvfV3cxoNdrtG8KHXpNqq0yKJtDqMeLLjrKrXzxIsbK1DYANcuSV+aN5O16vWb
         dNBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794538273; x=1795143073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZEX8rSEpBWZdgcEf6WCVHcit9xfrDrlIB/7NImIOIto=;
        b=twSe60aLpWmN2srpmEPJ6VOsDoo3pwKEjTZD/Rk6ZzUu7u1ws40aLJMgtg8MKwrOKv
         4KfTEgP0Gh8f+obKdE0ND1tiTRLYOhANT9cXopFYzQXzo8OKrcZ6QXmkU0aiFel9+SIX
         nZOrWFWJ6pFxs3ssdKuq2gqSlo/6eLEgh5DRRDyReEyQxWPN3BBdgpmreeJ5AObv792+
         NWcDz/ZRQKaIRLsXbEAYyuWGWdIniv9F15ax3ADeVryeA5RfEHuXPmppZqJwT94W7NQz
         tw+eNubA86oBcJGWeXADn2jt1YLllYikUdPGjL7eqkCLGtCkrwfw01XRf26zB4HLhTzX
         KQVw==
X-Forwarded-Encrypted: i=1; AL+hErGHmGoqPfPeLK5RNBUFTL0iearKQFggWkfUFPX1U3CGbWHSCkhaYeEEqZ8h3Txvp23pWbSHOVDnU4m0ojxj@vger.kernel.org
X-Gm-Message-State: APuU4Z+aIJK8uY+8nwWBkQLBzpYXH5cUUnUWaKRI4uAkagkh9IUb7dA/
	bc6uiBsd3w0c+E/ZqwbWMf0+r8mfVsWP6bJCslXLgO2R+VIoIdOObD2AFzLVgic2nw6oIixHMhI
	Hduol0crfb4pMsZiYSF7UXc443r96iA3+z772/FLObGqo+g0fTiK8v+8tbC3a1PvM6HJb
X-Gm-Gg: AYBFou2BwIZGK7Y/GefYMUufTdeVjEAqHmt9RzWukjrzZZvIAR/z7zkELVX39AK7iRR
	Yobryrk9egn2C9Z0gPPkKRybMRau+wQgswV43u2dh9eS7g5AokBovSnI9VfheCHCS+JppxV9urO
	yD84msYZXUOShCQS0U1EGW2rkqs29MqmkY69piyNC9dAsHXHNryntTFdRIkUjnJuJg60hO+uUrF
	hmofp6hTY7eT9ySXYvzG/Z8sDLohnbgPTGYgl9fIfWD5mhVBtKUTSaW2H/NBcKGkLAM3fW+udrR
	3cynhcQ1p1wnHa/fyLlL5/kgp1bTQ+OifNhmd/6GoMvwl90/4uXEnZ90EK9Dl0EJ5D+oY4lMOzh
	mWqaLNDKlnAWdWaSlfuTUrznCObgqNyZmU8t/8wasHhF2yt2li3qcZI+UxX6uiMenlxIyzdQ9kz
	yzD2Yj0Yc=
X-Received: by 2002:a17:903:1b47:b0:2e5:a355:56e4 with SMTP id d9443c01a7336-2ee0dc93fb2mr10638495ad.11.1794538273220;
        Thu, 12 Nov 2026 18:51:13 -0800 (PST)
X-Received: by 2002:a17:903:1b47:b0:2e5:a355:56e4 with SMTP id d9443c01a7336-2ee0dc93fb2mr10638285ad.11.1794538272687;
        Thu, 12 Nov 2026 18:51:12 -0800 (PST)
Received: from ap-cloud-sh02-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0fa0b3c6sm3044435ad.68.2026.11.12.18.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 18:51:12 -0800 (PST)
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
Subject: [PATCH v17 06/10] qcom-tgu: Add TGU decode support
Date: Fri, 13 Nov 2026 10:49:31 +0800
Message-Id: <20261113024935.3173715-7-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261113024935.3173715-1-songwei.chai@oss.qualcomm.com>
References: <20261113024935.3173715-1-songwei.chai@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAxMCBTYWx0ZWRfX72YkhZqta623
 zsWvlFQINXNc2dUqgnQkoqSTTUqhquOxMSipNEypKAvJVb4PY9Ht+y/BooBNf383DI2ZgdhKmEU
 XUXD+VOvd+RMeolXxBMtpg1e9KubzTM=
X-Proofpoint-GUID: aQv2pZPwJB8DOn74UCAwG1XPTVVEmGR0
X-Authority-Analysis: v=2.4 cv=N+e8hG9B c=1 sm=1 tr=0 ts=6af67b22 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=3nLtb9a6exle67ygz5gA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAxMCBTYWx0ZWRfXzzEQgqYSHV8r
 ulH9ArgfLslK6WCRZECd+jSiILEjpmTwVmkrQ2IKDyhOJKPBYifY6ve8+yq77s+1wN7Zaps+OBx
 BXgRyKQXin+7NdLXwUDXH6wXgpymk68JltFlNJcXsoSFZofrDK8gaxK4RVTqlLl/h4aNU/k9HHz
 mbvZp/oLKtE2J0jCPexWYuu72iuW+AwZdHNwmBUd7B+SF86JGZG7jePKpDzn9HvSji0r1YBM2PX
 avJ0R4evNXQcbnNfKTAx+Gu5TtTBZC3GlVNlZR0dMetacjR4R4s8x/x1yHv7NLb3JIQc1Tv4m95
 G4qYb55uBIlD912zBY5YqOPxWHj7D9IBcMa+2PDhZVocMqS+lqwZ49+rXrVLp06fNd4DEObLvAc
 vClzCVksVoypQKgvWjhUJAvIPwcTYm/5R6hGnZN41IYO2ge4lAn4QRmHzXRQc1cchCgU3+rEDZb
 WLnwSC5mdpK2ay/yWNA==
X-Proofpoint-ORIG-GUID: aQv2pZPwJB8DOn74UCAwG1XPTVVEmGR0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501
 phishscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130010

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
 drivers/hwtracing/qcom/tgu.c                  | 187 ++++++++++++++++--
 drivers/hwtracing/qcom/tgu.h                  |  35 +++-
 3 files changed, 207 insertions(+), 22 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
index 09370481758c..b94da9497243 100644
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
index c00e95e68214..72b98a96d7f2 100644
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
@@ -212,7 +319,11 @@ static ssize_t enable_tgu_store(struct device *dev,
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
@@ -280,6 +391,24 @@ static const struct attribute_group tgu_common_grp = {
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
@@ -314,6 +443,14 @@ static const struct attribute_group *tgu_attr_groups[] = {
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
 
@@ -321,6 +458,7 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
 {
 	struct device *dev = &adev->dev;
 	struct tgu_drvdata *drvdata;
+	int i, j;
 	int ret;
 
 	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
@@ -340,6 +478,13 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
 
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

