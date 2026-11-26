Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795673261;
	b=qilv9fFn1cYiTyirapV/74+5xHu5BdTBriWCUnp0adcoF7D8ytZYz++krdeexhojgXrF
	 vJzHav0t5LJN5Fp8VDfIDC3qNGaCZbbRgB7SrFDfTlD+s8t7FgHyw83T7mDWWz9L42+UI
	 mStmVNtE04VcBWX5U4Iwjwg38C51N2e1grvMZiRkdxCreOJcc6CMVBfqDuFQGukRBdS/n
	 wAF+JEizeG5F99XwZzTmCIZ+gxFoaxsI95A0WMXOHaGvYPS+JY1uaKN8eeXSrPyvyUesk
	 94rIETaNYc6aXOIysLE7Ss0EW8cgHCq86htvfPLA6fkCMCr9dbhDp7d8Lo4TlFKJdwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795673261;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Wt1UcVx9IjJ8YEc0AnKHGmTetQKxa5XfiJ47YPzPmrE=;
	b=1/YBCLuygrN4dY+Vz0Vd+iPQS7nbIzymlTy+PBTp3tk5LqlKlBsHVuAZJ5XMEM6j773r
	 wCNHOaY/JrRfkTijbdcq8JJwTCBnO9Jr1ipfOFdTWelsdw6u5gOcpPZ2BmwbisXvdBYg3
	 jTg5pTkImmaYQiNG5v8ziXWQG8HaYeJKIFWLdrY93/Do/L4dIfDvStxzbpmn2kiAw3YL/
	 4hdayTfAvCNCBnYOvtwItSJtbYBk6yGAkfelSJVHVA/oNd8BU//viYxb0IEinqqaT+WM2
	 ceLJiV7FtfzYdF45qAdKDS6d1Xn7CUTYXtljdZqytjeC4lG4vjrXLhPixm20YHQ50OA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZxpGIW1f;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gHSVLl8p;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4195D606A31C
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 06:07:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4195D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZxpGIW1f;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gHSVLl8p
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ36gB82176288
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 06:07:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Wt1UcVx9IjJ8YEc0AnKHGmTetQKxa5XfiJ4
	7YPzPmrE=; b=ZxpGIW1f3wRwAsuS8fdnLkKWkmN1KsMQofzVlZLEtuGlYgO3/tw
	1BFRC0+Y9ODurL24LrqwIipXPPLbwXpJVBSmR+MmxWzKPYbGJ6QbF1TihBeYm21+
	O6ppnajcLDdMZuEXKVOMye3UjZULbCVkciC1yd6cpY9uIsjxdsX54Pz5Qh7NXUVD
	wyTg1Hle8WPVUNo1kPddkHocZEc9JoYDe3arNEsFjBQV93q48UX0FFdu1PSomkzs
	lrc4k1QicQLg0r/kCSj6SYYRXHmXEoBjfQP2XlP6/37Igr6k8FLRGjh+Li2SrvWc
	LAAKbKuJMh+vdqXj1qBk9B8sf04RVgByghg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vuhv7tp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 06:07:33 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-386177b0516so16735525eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 22:07:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795673253; x=1796278053; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wt1UcVx9IjJ8YEc0AnKHGmTetQKxa5XfiJ47YPzPmrE=;
        b=gHSVLl8pvHI9DIp0uzH/qZjVYZ6410FuWHBYAX/zuQcraHr/s0IniNDZeGR6P+TbCX
         MOmH5jlDyNmKEtW0CxZW5/GaryW/4rwH7S0jb2gI/nDNgfwR+6jy8CXXzw11sgllDYHy
         96MnJ8qFnDvmIc9L1s2IkXVcGycCQt7DzubTQxPQT6eaMvJdSGL+uJO1nLYwhKPKhR5B
         cEUZ6QjvRId27qCserLzTPUc07KMbX7hpg46o0X3Gh8magrkq4a2dBZv61f6nctx4Rau
         CRLSPCMEGXE0AN2/0yQgXFkOF7covQib9dXaprc5X10ecv9JLkWL9lwOlnuYtMYcBkWo
         TG8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795673253; x=1796278053;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wt1UcVx9IjJ8YEc0AnKHGmTetQKxa5XfiJ47YPzPmrE=;
        b=tw9LyU4ozIVqWYR/OEXfZzyl0VKnPPhTPULkM8QwdegPthNQr37tGrxJh64m9P7kaa
         kmNRi/kAMUN4tAMPYZK2IhbLNeIkl8e2p1paI5IyzOq2FQ2V6BOUhYGMyYUOAu2gZyHX
         w2Hydv/xw/w/MwYTsTzaTVNXT/ikkwI1Jy4caJNo1J8K7IgPSpEckwEaFThzCHUjdQM0
         kz3r4Vem5wPVgEE0F8aB/mvj5iVs8LOuRfElpt9C4d4K1dJGM9pc9lyIjGL0E7SMVedj
         m5+LQciMw736x+zW9nfS0OCUPqqrj/46ZmYaZy2ztvjqmSRBoms6ASHElW3Fg19EFafZ
         gXaQ==
X-Forwarded-Encrypted: i=1; AL+hErFA7FmqYnQe34jDtsJ9r0uv1JLBw2njwcktU3ix8RaNHrHk6F4baVn4TafInxkhOLTokSUx6VpVCcKGUq0T@vger.kernel.org
X-Gm-Message-State: APuU4Z8lj0AnxvL0ovm7qo79Eu1hetpBU4eYaDWDSbDIC+4M9wsvntd9
	XvrgO8WX6sXwl1qpyby0abTSNu3msucJBM/uYmZplQIRA0qB8ZLEp6TepTuumSq6ckleeQEBelX
	e0C3RMaacIjRZS4WGneLKqEUPx1FKKwTuy8ukZInnQvqTr+fjO9+3LWSV65HNcw2Tcq8R
X-Gm-Gg: AZFdTZcYsKni19rC9rxqCMk11/+Bs8yKul8UGgAiF7MYBXimmm6ONktmnRWT4liWM83
	7ylSPUE0yov7MgeHv1hyLDkwJpxZ69hSVLcGZ4cV5vPuBZpls2uq9yqzSfbx2QOyu8dpj/kdeli
	UfySXnB4EYX4r9AZns4WGNR6qlcIoRMgKE+pGNeee63WNvZKZFei2kxDRMCjsZ0YmMvODc0vj9b
	Sm1cmfudO3KXjiMGoZ3O+7+GmBdmDMo/dm4Am8crRaPaFqv6tt30aim/8hgo42d66YiH8jd1/ey
	MWuItRPLgrYaALHUY0qUzHP9ySwklYamrNMqSTCzd4NP6zfq4eRBkCa2jhYxIQZnTe6iJ0qJXTD
	4Bqhnk9fVj8XP7NaRw6UNer0DZBnVYoWvrql/gw2ZxfXeO43bqS/1xYA7fMLQob1Ofn1YlXML5o
	lARvVDjhUj6lfUM26Ijpj14GrAaRnJHtu2VZLWlA==
X-Received: by 2002:a05:7300:26a2:b0:386:b0ea:3263 with SMTP id 5a478bee46e88-386b0ea340cmr11418435eec.40.1795673252905;
        Wed, 25 Nov 2026 22:07:32 -0800 (PST)
X-Received: by 2002:a05:7300:26a2:b0:386:b0ea:3263 with SMTP id 5a478bee46e88-386b0ea340cmr11418418eec.40.1795673252407;
        Wed, 25 Nov 2026 22:07:32 -0800 (PST)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c0c1dsm66099113eec.21.2026.11.25.22.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:07:32 -0800 (PST)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Subject: [PATCH] remoteproc: qcom: sysmon: Skip shutdown-ack state check if there is no IRQ
Date: Wed, 25 Nov 2026 22:07:28 -0800
Message-Id: <20261126060728.784236-1-gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
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
X-Authority-Analysis: v=2.4 cv=FPmOVOos c=1 sm=1 tr=0 ts=6b07cca5 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=5-Z4-tGBdPLDt7CazJkA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: 0RFUR5O3n2mMlb-p-DPIqQ-jhin0lMMx
X-Proofpoint-ORIG-GUID: 0RFUR5O3n2mMlb-p-DPIqQ-jhin0lMMx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAyMyBTYWx0ZWRfXz4BXAufqAE8o
 Cjt561NCjNgl9yTR5rr0NRA5JlCtEAulbnNQjTcYg+JZd09JFZyrACNvGgaJxw2momv0KUmbKNU
 aPHp+GC/ZKNXqD1MTt/QWlBUIDtUTXE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAyMyBTYWx0ZWRfX7Dojr+pmScgz
 qoWWvma+vinISHRp10mueZwo7ogc4YZzjZcPLXLzhKrXiYTBhwkHigvFvCfTnNYHwkFBnNcLM4F
 ING/LCa92cmqrdawiOX5v3hOvZb9aMwqUG5HaZ+grleHRwNuLeCxiwtwRdLtlS6bTJna1pU00Pl
 9rlOSsh4NDGkw08YaGp6Sb6P6P7i+PJFANTerQQwlhSg5HW5Wpgc423qdSMbsmgbEOuBSgWbhuU
 9XpHsMUQGs1kXZR9KgiTbG7dWTvsZqGN/eRMzJ7Ms2iMDWZlNniaYDoytszA8oju3KEASsJ46wP
 3REJL3jWJleVv3L4/IEGwr3aEQ/ntpo0eoGxas81WJ0I7OTGtHhIIQgprHYpsW1GQwfll5sjXZH
 Bc2ypw3Quww0pVgpbVdxnmNEwRNp/0/cpKEVuXjNZZn4TNOQkyAUkkAbiRjgGz5ZK1bkv1JNCkq
 jfLgyy/MvSnq4IYx0LA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_01,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260023

Not every subsystem has a shutdown-ack interrupt. The SoCCP on Glymur,
for example, only has wdog, fatal, ready, handover, stop-ack and pong.
In that case sysmon->shutdown_irq keeps the negative -ENODATA returned
by of_irq_get_byname().

When the subsystem is attached late, qcom_sysmon_shutdown_irq_state() is
called with that value, irq_get_irqchip_state() fails with -EINVAL, and
the driver prints a warning at every boot:

  qcom_q6v5_pas d00000.remoteproc: failed to get shutdown_state: -22

Return false early when there is no shutdown-ack interrupt, since there
is no state to read.

Fixes: 16472c99f469 ("remoteproc: qcom: pas: Add late attach support for subsystems")
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_sysmon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_sysmon.c b/drivers/remoteproc/qcom_sysmon.c
index 61e1038328e8..1e6d6608bce3 100644
--- a/drivers/remoteproc/qcom_sysmon.c
+++ b/drivers/remoteproc/qcom_sysmon.c
@@ -739,7 +739,7 @@ bool qcom_sysmon_shutdown_irq_state(struct qcom_sysmon *sysmon)
 	bool shutdown_state;
 	int ret;
 
-	if (!sysmon)
+	if (!sysmon || sysmon->shutdown_irq < 0)
 		return false;
 
 	ret = irq_get_irqchip_state(sysmon->shutdown_irq,
-- 
2.34.1

