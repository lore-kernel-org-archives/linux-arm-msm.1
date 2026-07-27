Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8592433E73
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 17:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785173613; cv=none; b=gsSMhcPy3VFfWDH4j9/lK3bWvD0ss7YZTfksg3Cas/0NgkQXgjJlT7SqC2M9WRY3De6s+E1PRKp5LB4Q1B+SV+wB02iJmciUepQ4Ac7EJYUYnPVmC/Fqj0FFfXPm5dUqRpTHt7ev5YpfDP2erFIELtELSvHInjgyRjHZAC9GN48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785173613; c=relaxed/simple;
	bh=a1o8HqOjD4h+c/CGMqRhymDBYOpulGK6tSaU/EMrAWs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ivgpB+ktlyWQksWDWqRhj7nEkkNf32dx4yTc1erEJYGXNNvOYgoFb4u5nLNGncfd2Fb5I9azxVOfSW1AMYbmuO9mQ0cmH/UwXsq7cxnLDQkSp+7A3sWPXfybFQ0mv7KT+HPSAPuEoAK+A/toQfpBIMwZbjQpmuac7Nxx2ttsbRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VhbbGycb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cEeBPjyd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VhbbGycb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cEeBPjyd"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RHMXaq1359447
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 17:33:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Xrd7+mMUbjl+qLUo2m9xXeSQiJ457xxEDq2
	gJokXZ3M=; b=VhbbGycbI5Om9lPripyfCVxjpPAUivKodLYbtstHuWZ59Du22g2
	qHM84SZN6ksncb+BXmfx4doEBT8oDLpZba0dICNGHSxIC4yxvdOFs0lDGy+yDfPA
	Q1VV0JMOCluAISVAVCIoxZLrMhAQ0N+KL0AS6hwap/ispOFrQgnxynUXPVN9SWrw
	v12EStWcCsT2z7hzh6c8XJnmhSvr9KQAA/rlnQcLpgv3M85IbtpeQSd8UWFAcUqj
	jHvP81p8q3IIlM1nfjsAtILQZPabAw2d6a1PHDU4qL9siyppw8WUugiPw4brbGgI
	o2Ua456AWTH+trt3XPs5n4AzwAvbo/ujvAA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpbp5g1k1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 17:33:31 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8f39a46efd9so1757376d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 10:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785173610; x=1785778410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xrd7+mMUbjl+qLUo2m9xXeSQiJ457xxEDq2gJokXZ3M=;
        b=cEeBPjydH/kzbZV56F9guZiN7BeQeBvktH9JJfHJ0R797KuthxNbYWwCZkSYE6HF3J
         R9fbQ87QjUsWBw1D/WyfQJS+e2ZbsW498OwNBzLnT22KG2Ce/fkCkCcsHTUTg9+PC0gj
         fR1IOoS9qGhj60IIe4PwBeJA7yqRwAkYeAoFOGtZApnSaL/vBW9EMi4Q8YNbpwWJfQSI
         wYaGbVGfOCMIcS6tYt0wfMQNcxCNsMOOGv/yAFwCV+tJi+NEFv1VKXIAoTiNgw+7uIUu
         i5UdsQ49y9YAty7B5vPdYS0N4A7RZ2qvAxL4tHgAoGYJV/lofD70YCDWW4U4/UDNfZZ/
         iegQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785173610; x=1785778410;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xrd7+mMUbjl+qLUo2m9xXeSQiJ457xxEDq2gJokXZ3M=;
        b=Gxpbagg3ouyG83oFEiD4w4r7pDQexPy4mNIDErSvtr0gjCJ5yuwk2Hm9jI3A+jZkwF
         avUzYgHcG7lu/1n8BmsyJxrnHOzo9YPnzaPFh5e0geJ92dhYf09P/zSgnbGaXJMPy/Dm
         OwMspmP7cHFYJTGXvHv0QGpwtW6S2RBNHJySZnnuIKRZpwxzRBFYkTdQRJEEzioQx4yM
         AVwGKB6JtlXemr/g71PvoaQx6JBESE2LUcVwTIhqi/fV0EF7ehuh06XXD3GZCzLq0dEp
         C6aVAgrXGz+z9ohLsXDLNOul9S4LTjqqrSfxudZJZhmDhir74+BUiA2+ckdvqrTSVLN+
         yOgg==
X-Forwarded-Encrypted: i=1; AHgh+Rocw0OOdJ1hkd/4FFyxYMXzhQOXWpfDF+InLIAHmM4MctLTy0FHCd7fu5u/URlFWRtnUWQROBDnEHVKUpYX@vger.kernel.org
X-Gm-Message-State: AOJu0YwkYhe6nd5bFEhMPa043Ih97+gvu4H47IDGoL2JXzi2/qTx56HW
	P+PIvfOrG85FlkfLdnQGDWWo6mTT1Wkq6AcY0qLEudaOs9gAsytyx84mr9m++ZZM6x3wF7FQOR1
	Mro7seHdtAjRW/oBHrVu7EzXMZ2P+coH5GaJU2e1QilKs3707GWWtzBBC1lo6A2so6eKerIexsq
	YZlyw=
X-Gm-Gg: AR+sD10WzjqdWZh0SB0FaNcw6uySx0G8XYQZuZD421acOceyd9uTOGn0VBUTe2fJIdj
	FcrnKWwywTS72bcLGIhc6JvwVux1aOm4K5cIS04a9BXAffIfqcEf1uy50GD7OwSasQkjqnYtujr
	Q9KZhq6ZWRyYt9b6RZYQkOSLs0fr7xzgbr3cAfZ7XfF5Ijl5gRuhbCAbceAHBlq3ouydNjeC4NX
	B81g1wOn1QT0YX2pMMFuz/4cM6r+KlZ8jBquBbSoXxsJAqMV8OVl0mClST0j9JDO/jlxiXfMLnd
	SlhWKeYRu0riYP4pFIGCLlnD355DEJRVlYb+11954f8q7hW4b/C2kMsj1j4cg3kYD4quagiGPZS
	PAwQtTs9a46yygPgEjG+W3rrITUD2ITu2BziiTg2g
X-Received: by 2002:ac8:588d:0:b0:51c:7aa7:e0f0 with SMTP id d75a77b69052e-529d1fd79b1mr3817911cf.43.1785173610097;
        Mon, 27 Jul 2026 10:33:30 -0700 (PDT)
X-Received: by 2002:ac8:588d:0:b0:51c:7aa7:e0f0 with SMTP id d75a77b69052e-529d1fd79b1mr3817511cf.43.1785173609636;
        Mon, 27 Jul 2026 10:33:29 -0700 (PDT)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69fb5543370sm2945391a12.15.2026.07.27.10.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 10:33:28 -0700 (PDT)
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
        troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: [PATCH 0/5] accel/qaic: Add missing <linux/device-id/mhi.h> to .c files
Date: Mon, 27 Jul 2026 19:33:21 +0200
Message-ID: <20260727173326.2219191-1-youssef.abdulrahman@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDE2MiBTYWx0ZWRfXyZBiz48HWK80
 qhJTwk0dl1KyK1xFo26nnOAMEuD+fyh3Zm1vo9Yg13vaG0b0c68RyWH9bwAeXf6sMeXXTejhiub
 FQSgm/n2xcxyEazI5pKZOehJOErJZOQ=
X-Authority-Analysis: v=2.4 cv=XuDK/1F9 c=1 sm=1 tr=0 ts=6a67966b cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=XT_LLXgTnYouiiFBU3wA:9
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDE2MiBTYWx0ZWRfXy9rIFZl8h2b+
 WNNmtz/ffWA487dalevz5I9BKexv4btjxbon1JyiI+q4ombGmlZePcXf2Bb7tmTAncTJW2ncT5P
 TZvNEQ7k9kWkcH3xk5pu5H0wzlLOWV69+pohCuA4wsIFiG1H+FF/d93pwEDsafEITDZxepKpX5g
 5ZOOe4mbUDGz8TRgKvoyEFOz+W3bFrpqbC3qyCDGAMyjdpzdxn+VUHChyqg6TTTgbExyOTenHwX
 ghZBeeea3WJEvoHokHfdBafjsQksY1R8KdrKmLD5gUzE0M9WQFRdH8fX8R7Od7hUICC1ilPWkx8
 PzPWZtbEURAWiojc5bkJzriAPjOQyrE8AiEuLeKXOs0NIAmyQUt3fYEG0ef0QMvjTaTCOq3vryY
 L0uFcGIm1chqVc9LTAEFRZjSMvaFF3UXsaG7kjW84Xj88Yd9nMx33uoVU8t1dSpo4Ti5Imy5AZq
 B/e3dlcnrueYeqr1LhQ==
X-Proofpoint-ORIG-GUID: a2QgtrISgcj2rWADxOnXQLl3LHEPR-qr
X-Proofpoint-GUID: a2QgtrISgcj2rWADxOnXQLl3LHEPR-qr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270162

Although the qaic driver is using MHI, it is missing the inclusion of
<linux/mod_devicetable.h>, or the more recent <linux/device-id/mhi.h>,
in some of its .c files.

This series adds the missing includes to the relevant .c files.

Youssef Samir (5):
  accel/qaic: Add missing <linux/device-id/mhi.h> to sahara and timesync
  accel/qaic: Add <linux/device-id/mhi.h> to qaic_drv.c
  accel/qaic: Add <linux/device-id/mhi.h> to qaic_debugfs.c
  accel/qaic: Add <linux/device-id/mhi.h> to qaic_ras.c
  accel/qaic: Add <linux/device-id/mhi.h> to qaic_ssr.c

 drivers/accel/qaic/qaic_debugfs.c  | 1 +
 drivers/accel/qaic/qaic_drv.c      | 1 +
 drivers/accel/qaic/qaic_ras.c      | 1 +
 drivers/accel/qaic/qaic_ssr.c      | 1 +
 drivers/accel/qaic/qaic_timesync.c | 1 +
 drivers/accel/qaic/sahara.c        | 1 +
 6 files changed, 6 insertions(+)

-- 
2.43.0

