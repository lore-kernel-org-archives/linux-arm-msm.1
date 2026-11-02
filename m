Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793619691;
	b=jo5sC0we24JtxziDIopdod1EGZ2rrqYRiKRkEbPcTAU1lOKBIlXyQ64aB028r3DG1i24
	 9I+a0ZBRwLk4WGvp5vWHxx1XkNHQYf2fAG62c/cS/E6fHhLxkkv2sJ7XG42yJ3f+ZIVjs
	 iYlCH5hAoM2wiii4uViqCB9D9YgUy4767f5Vw5Dc+XCrVFa87nGdqQnoT3SBrRd5nGxD/
	 GrjrYc37ePc2mZ2wmvc139TSzcbjbsL/SIcbPHxfpCtTI0nU5yBuCbbWFRkI/kMUuUkWt
	 tncr3Oy/vlZ7F7lX1jgmoXUYcvVzLPscyPPA0PTp2S1fwmU1VnxL0g9N0zz0bFA01NQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793619691;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DfILuvUDP/rD7AiORGLKXm/sfLDG2w5A0n5tcVIlud8=;
	b=O0/TP6fRnA8dpEgsLc0E5t659KYyEOgBSy+ZnRnHoCM2pw0I/7aHjLth/0DN9rms1LQe
	 ZqZG5Qa/eITnxPfgyG6E5R/TbL3T+EIBWXRpuLRYVaLQjioHQ2jyrPSOiRcY9gAOAJeke
	 YWEDf0l+TR7LEmjF64aZ1Gug00zbj3uuMESxOxNsxM1lFgnyyiIbKEpEBzJc2FP3L07aL
	 /rOLxJ6Qt8DDLJtYb9SLyVkkSDW8XjkMmN1VGlVfmuYKEt6PkbGYLHmrsmd7BD9EwTCzi
	 WLdCe/0hiiIwMtXdK3OVHSJyggkwSZJz3xQ75obKfQe1oI9OuN5OLluZScYvTL6TY6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jQOd2vIc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OEY7hCov;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBCF8606A330
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 11:41:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBCF8606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jQOd2vIc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OEY7hCov
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A7Xq260659
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 11:41:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DfILuvUDP/rD7AiORGLKXm
	/sfLDG2w5A0n5tcVIlud8=; b=jQOd2vIc0qSvFzdlIoWJFtraM0Wj2KSCXgKGds
	Xb879iAh6AtMO/ZtVvJNO6VM/g/Lb4mo+xbiUIM8MqpZgujL1FA0L3ZLxNDN9wsA
	RTsN9cO9hQSLGgk/n5nKM8cJquLI6LJvHkOnJZSwQESoGLK4nbP2kCzOIiSuEJL2
	1mQBRZ2hjreRZq6xFh829XNwbn0THf4vT8oD4Iui0mrzhMRAiMqgDmEBsqfdWxVv
	UQt+nvikhQi1W1HaowRU8H/fGLTnGaN+RysSsdi4P3To91dGN5UVVvQksmISSBnL
	x2TJFqDlNZXxo2sg6Y2+e4MG/GwKiLzUmsVLVlfTfXCQ2KMA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqmvrjrh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 11:41:30 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-980b637ed69so321132241.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 03:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793619689; x=1794224489; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DfILuvUDP/rD7AiORGLKXm/sfLDG2w5A0n5tcVIlud8=;
        b=OEY7hCovYWTKdNqHJmzc2O0JAXc9FTPYxagmtf1XQGjSg/koaOkJKfZFvGaCL7oWYV
         5r1FN4ZP8IQNv3IhCrA1t7T0DMzaWoqPY7v1brYq+MUfNQyPnrpAEtg/Yb1HVkIgafmi
         PV8FC3K59CSXStrGkD98vOONyDPvCyilVE6Swj1HPgsm615sGHcbHj3NADGDMJn9qoW2
         nBQSibwe/s0t1+ixlCLnefBJ6uXClLDEywcVeFtD1fD8oINf2jfEnap1JeD+cdnZdX/q
         2SXu20xY2OMlOdBRxInqSt6MMCBokKB9660ZT/5zTkZRGehaDNDjtOedIB+gX5u7mVtI
         gBUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793619689; x=1794224489;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=DfILuvUDP/rD7AiORGLKXm/sfLDG2w5A0n5tcVIlud8=;
        b=ItEhPO+r2Diwr0LfZPGOikZieVuyu4vM7xYaD4wwkE83o7gMLuIouXGR6wv7iKD2Qw
         WdcY996Uowey0FW5Fn2qUFfJDZLvCVbEB05AM7P6OXccpjndxjV+DphULrHmFsNRLdaM
         zbUf9xF68B7th6X0jof7K9cJ+Vp/aVmMwdn5ca9xFkzA9KyLdo7B8jGgdjbtcd9V/qkN
         t2TchcRyhNGZa2Mm7whJDW6go5Wrr2Qh2GHuDwCFrkcW14M5jBFV2FEtz07G/bd3GJiO
         037eDDxIgog6l3Ix4AYXVlOlpzeaVrhPHxH/sx6p0RW1tNFcR3FWdvCsxn3ZcXSoEYMZ
         D+/A==
X-Forwarded-Encrypted: i=1; AKwUvBztDDUp4zSg/3g5CudaGIv8vvXBRmbX1O7jinxmWCh6ZnYqOPOEsO/Xzbgi38G+ATe/qN5UJnVhOVXmKjl5@vger.kernel.org
X-Gm-Message-State: APuU4Z+oEewbL2WHHPQc+i0VzMBJPfbp5a0QH6yEmgf3NOKp7We01oeN
	N/Ujx2qsSocpyC9G240iRy7UnLKRt/PcHPkP3sJalJZfDmhkQLfy9h9LqcbBlBFMSCSRd2Ep0Oi
	zhiDkRsnyFBDbh28kDMWktGJbGQcXa6Y0QWoG3IM7FK/jMsZuzl5wElgWxLF7iKLxM41n
X-Gm-Gg: AYBFou1GY0ykxMIuwPEbHXocKxjhNihusk4CubCoT46oA81K1FMBo00Q9D0zpLbAEva
	R0jhMzI80EvUuqYlvMPoSosMN8qD/DE8DcXnfGQgwPBGd8WJKjc4k5gGZ3YVpv8uEOJTyXPgHer
	sk318zy3wdNxFF3TxMWzwjoKDssdNpWz2K6IpOuofNH4e1yFSBZXTi91yTG9jlHn2CdYF4zW6wZ
	Os7foX/jXqRgxys2qIRmgtJxOS5REXSPgAIGGcJwYVWluzkl/d8np06fMP87BZcQLcYyRTwi9+c
	gH04P5w2/rhz02wTigw5IEbF7O7dy6SsVO3EfcdCP6367NwY6IpeJJ/velIU7VOl5J88h5c/cBB
	X4AkaO1Dle22+x7wqZ+r2AArF45ENkJaj/12zwBwC7HQb7X3ioRwBpP5Ttw==
X-Received: by 2002:a05:6102:5487:b0:7c1:75c5:c4c with SMTP id ada2fe7eead31-7d072605206mr2815192137.25.1793619688686;
        Mon, 02 Nov 2026 03:41:28 -0800 (PST)
X-Received: by 2002:a05:6102:5487:b0:7c1:75c5:c4c with SMTP id ada2fe7eead31-7d072605206mr2815175137.25.1793619687806;
        Mon, 02 Nov 2026 03:41:27 -0800 (PST)
Received: from [127.0.1.1] ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d511sm19275953f8f.8.2026.11.02.03.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 03:41:27 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 13:41:17 +0200
Subject: [PATCH] power: supply: qcom_battmgr: Fix pmic_glink client
 use-after-free on unbind
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
Message-Id: <20261102-battmgr-client-teardown-uaf-v1-1-972fc5a5e0c9@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANx26GoC/yXMMQ7CMAwAwK9UnrHUhMDAVxBD6jjFCFLkuAWp6
 t8JMN5yK1RW4QqnbgXlRapMpcHtOqBrLCOjpGbwvT8613scotljVKS7cDE0jpqmV8E5ZsyHvc+
 JQiAK0Iancpb3bz9f/q7zcGOybwnb9gFbkk3sfwAAAA==
X-Change-ID: 20261102-battmgr-client-teardown-uaf-f532fdc44cc4
To: Sebastian Reichel <sre@kernel.org>, Fan Wu <fanwu01@zju.edu.cn>,
        Bjorn Andersson <andersson@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4946;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=x4fAiWwCWzADg3m0fRd4Wwzu9DytOUqrL7kGuWcpYQQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq6Hbleob7tW6ZrMlRVyafq9Zo2qBIBRsM3WdQH
 +kJcv40kJCJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCauh25QAKCRAbX0TJAJUV
 VlFpD/414DQ0ZY+4lpuTbLvFvdOUtv1fxWzc8zIF3CvpB2iQHchcbcLUDWmXA3LkmVOgWYqPtKA
 iJJTfht9oYaFJ7bKqbLKCcY0Mi2KPGxfvLW0wEvtFMBzZDT7lbG0c3ldAKIkmxa/ZuxSrdpXdAS
 9JsFRnzxfn0t6k/rRs+3jAGzTbmH3tdtozTzWJflktYMx74Mj1I1dmKcKYHI5FvfxK9qwt8gDQg
 HQzZxteuhyQ3cOKEpB9ZowIopN1B21XXSLqusz3pD3xOjOzXqJABlxN7YCMhUr0/YxSK8yfydZs
 DezFnJhgYZ20y6uS7heAY8aQQp/IOR2Ob7s3BjogGYaZhPf/0LeG5v/VIwu8rt5EcGeR6xC030J
 UrVhqHEK4ls3/D/u7fvE732ltK3r/SvfOitB+dpIVSXbYr9o9SpQqstE4akBDwrCtkcXIDK4OtY
 T2Mm4cWFjrhP2f3KK55IZL+yYCaMboNeaPwkG5nJm3Z/aiAqI/fuk2B/Jm27owzE1uazXgGCCpz
 ln/ZLWtm2/RebgxP9F94eKP655xBD6YncNnOgJS5P54zPCqBnNbUEuu5/H7s3HAvS4M+aq+hFty
 O+gj3T5UWzmZouOL5ocpJVf0nujT8f/ygirJYAAvuWBTq0k6yUCc2JD0ZP5WUn9obSoOA86xpJs
 OMeR84AMnxg9BzA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=TMDQ2Fla c=1 sm=1 tr=0 ts=6ae876ea cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ehDivE5OXch7XbvYWcoA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: twkCOCcvDadUOv68jDCEIbr6Y-Lr_hyz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0NiBTYWx0ZWRfX/g6GH39QaaQM
 LJYYeRlExmPpYg78f+QkSCMdyGQnTKXy3TT/O9EbblMU6tNhJ8B3mccHA5dAHBMG7dK/2s+0+OE
 svj/jvIr+e3h4EHyldRYe6BM4gGrRNs=
X-Proofpoint-ORIG-GUID: twkCOCcvDadUOv68jDCEIbr6Y-Lr_hyz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0NiBTYWx0ZWRfXwU95D61XxIGx
 HkZVfRWBQC8i2jLX+bStbCKyfU1gYlraFSb6ONmQF+lZ7GEA4DPqnGAtKRAqerm8FLKMGP6rKA2
 bWmX3aoIoRDoARA+HfAyEQTsNp4Kb41iGRpmTfMBHOxeyq1GU8rZ2dOb+dmEBbAnWMoLCZmh0qI
 4WMkbp08Xb79cG0Y1jMeq5EM8QuUt2I9Q8HBFGp7ibkQZDPnauhWdVHyDQGnGhLKB7KuaRteb7V
 qR57nguIwQu1Gd3GMiLNig+8qI6lWt2CnI56RyR34qjpoFNw9D8b5J8cwVWMIocojDyENEOCm9w
 nhrFGcdF1gO6vcM4mOsg32KqSyiHkyVBcSKYQHp8bqrLIsRHHpzTyq1tEdv1u1D3jXcUvIIKkcv
 gmWxb8XEI11GIPvKeKaPyE3CE183hOAtCQuZWuay92Hf+Aq7lP+8MxQsE8D2Qk93jmZkK7eB8Tx
 HwGnj1pjTfO/BtI8JBA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020046

Since commit 4e40befedfc8 ("power: supply: qcom_battmgr: fix
use-after-free"), enable_work is cancelled by a devres action registered
before the pmic_glink client, so that on unbind the client is released
first and can no longer requeue it. But a worker that is pending or
running at that point still goes on to use the released client in
pmic_glink_send().

The power supplies have the same problem: they are registered before
the client too, so they are unregistered only after it is released,
and a property access in between sends a request through the freed
client.

Fix both with a devres action registered right after the client is
allocated, which runs first on unbind. It disables enable_work using
disable_work_sync(), which waits for a running worker and turns any
later queueing from the client callbacks into a no-op, and then marks
the client as gone under the lock that serializes the requests, so the
power supplies fail any later request with -ENODEV instead of using it.

Fixes: 4e40befedfc8 ("power: supply: qcom_battmgr: fix use-after-free")
Fixes: 29e8142b5623 ("power: supply: Introduce Qualcomm PMIC GLINK power supply")
Cc: stable@vger.kernel.org # 6.10
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Found while fixing the same class of issue in pmic_glink_altmode. This
completes commit 4e40befedfc8 ("power: supply: qcom_battmgr: fix
use-after-free"), which closed the requeueing of enable_work but left
the client in use after it is released.

Prepared with help from an LLM-based assistant.
---
 drivers/power/supply/qcom_battmgr.c | 39 +++++++++++++++++++++++++++++++------
 1 file changed, 33 insertions(+), 6 deletions(-)

diff --git a/drivers/power/supply/qcom_battmgr.c b/drivers/power/supply/qcom_battmgr.c
index 636d6f6acecc..b37b2f665f7f 100644
--- a/drivers/power/supply/qcom_battmgr.c
+++ b/drivers/power/supply/qcom_battmgr.c
@@ -5,7 +5,6 @@
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 #include <linux/auxiliary_bus.h>
-#include <linux/devm-helpers.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/nvmem-consumer.h>
@@ -339,6 +338,9 @@ struct qcom_battmgr {
 	 * firmware, as it then stops responding.
 	 */
 	struct mutex lock;
+
+	/* Set under @lock once @client is about to be released */
+	bool client_gone;
 };
 
 static int qcom_battmgr_request(struct qcom_battmgr *battmgr, void *data, size_t len)
@@ -346,6 +348,13 @@ static int qcom_battmgr_request(struct qcom_battmgr *battmgr, void *data, size_t
 	unsigned long left;
 	int ret;
 
+	/*
+	 * Callers hold @lock, except enable_work, which is disabled before
+	 * client_gone is set.
+	 */
+	if (battmgr->client_gone)
+		return -ENODEV;
+
 	reinit_completion(&battmgr->ack);
 
 	battmgr->error = 0;
@@ -1626,6 +1635,17 @@ static void qcom_battmgr_enable_worker(struct work_struct *work)
 		dev_err(battmgr->dev, "failed to request power notifications\n");
 }
 
+static void qcom_battmgr_release_client(void *data)
+{
+	struct qcom_battmgr *battmgr = data;
+
+	disable_work_sync(&battmgr->enable_work);
+
+	mutex_lock(&battmgr->lock);
+	battmgr->client_gone = true;
+	mutex_unlock(&battmgr->lock);
+}
+
 static void qcom_battmgr_pdr_notify(void *priv, int state)
 {
 	struct qcom_battmgr *battmgr = priv;
@@ -1676,6 +1696,7 @@ static int qcom_battmgr_probe(struct auxiliary_device *adev,
 	psy_cfg_supply.supplied_to = qcom_battmgr_battery;
 	psy_cfg_supply.num_supplicants = 1;
 
+	INIT_WORK(&battmgr->enable_work, qcom_battmgr_enable_worker);
 	mutex_init(&battmgr->lock);
 	init_completion(&battmgr->ack);
 
@@ -1738,11 +1759,6 @@ static int qcom_battmgr_probe(struct auxiliary_device *adev,
 					     "failed to register wireless charing power supply\n");
 	}
 
-	ret = devm_work_autocancel(dev, &battmgr->enable_work,
-				   qcom_battmgr_enable_worker);
-	if (ret)
-		return ret;
-
 	battmgr->client = devm_pmic_glink_client_alloc(dev, PMIC_GLINK_OWNER_BATTMGR,
 						       qcom_battmgr_callback,
 						       qcom_battmgr_pdr_notify,
@@ -1750,6 +1766,17 @@ static int qcom_battmgr_probe(struct auxiliary_device *adev,
 	if (IS_ERR(battmgr->client))
 		return PTR_ERR(battmgr->client);
 
+	/*
+	 * Registered after the client, so that on unbind it runs before the
+	 * client is released. The client callbacks may fire until then, so
+	 * disable rather than cancel enable_work to keep it from being
+	 * requeued, and stop the power supplies, which are unregistered only
+	 * after the client is gone, from using it.
+	 */
+	ret = devm_add_action_or_reset(dev, qcom_battmgr_release_client, battmgr);
+	if (ret)
+		return ret;
+
 	pmic_glink_client_register(battmgr->client);
 
 	return 0;

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261102-battmgr-client-teardown-uaf-f532fdc44cc4

Best regards,
--  

Abel

