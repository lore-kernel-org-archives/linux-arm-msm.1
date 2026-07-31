Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 140542C08BB
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 00:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785457935; cv=none; b=nVpsvQa3J4NRPfR0yajaZzsMfAlJaQpWqNoVtzfQzlszGlh9aN1yxXmso1h5ygKFjyN9fh0D3lVJOvxHW+HN1lOpAjKXPv3fsfyxHY5RKjeJ+R/SwnYM55axgqYeVVqXaIQ7KDKGgDCONVqAl3kiCU/W1IGE2wShtbcwj05kk1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785457935; c=relaxed/simple;
	bh=UTnwS/2KKMHvEnj1G5hWv78QxtNSfDbjsv+TIRCZ8q0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rbD9V5TUG2Kc1RCEYtEHkbO4apLD/RY3XJ60eYvbPsoT6jy5IZ7oHQUr4TXNNyPlSDth9wgkYs90WRggX2h9ZnnjsZW9uYtxpRugmSoYSQNajJHQd3vFgTO1971CwNmD7ffZqI/acdZfWw3c4+Gr40gaHqFxMulr781ygHlKq4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WmAOihVd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ku85ieRN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WmAOihVd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ku85ieRN"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UNIgRq1759769
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 00:32:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IVKIsROaFLrBTWGGnB2cmBVxI+DUX5fudtaQeIbEl+s=; b=WmAOihVd/qdE7Me5
	pjnb+kgRM1KpWULzNSUdQCU9bbnkeUFpV8i6X34noTvjsn5BGYyaVEJf+q2+ZWUr
	l7C7GuS/DlkebekZ6NC3R/Wlhg2RLpQw/3r7Ocn+Qi8oYSSMebOfwBooGIaJkWx/
	9MnvCvgEizR7bFvCqEzPh3Du0Y73ErCXWJ7mMX5BeW9PH0jX+pCi7hiy0v9Lw6OZ
	RHzYOFR3JJikFsRn7ShOx0ouoHY7DEbzmCFbwwb479joUOAehlJIQjnao/RDeUfR
	DVwaml4lUqI4o3aTLNbREHrduTlsaYnpSHbaQgQk/WFEGNroHMhmfXTYBB6I5VMM
	fmGq5g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frg5v862c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 00:32:13 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1d30035dso2778671cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 17:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785457932; x=1786062732; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IVKIsROaFLrBTWGGnB2cmBVxI+DUX5fudtaQeIbEl+s=;
        b=Ku85ieRNk1gI57h7boe5FGbD26zTcglsakeM82EX0pS6JgETijAwDMvoQdPvcJ0o+M
         DaJf42sA0Y8KsiMDyv/g/innahpW6Sb6Kx/ZsOSYCO40GkRPLdPIWChRDqvY8TlYgC5B
         zYRKZeohnQlXeHhh9EBpaEAbw3JBtgwDoO7Nk90uzYDXCa6+cL8MEZppwB+APIIVHbb/
         yCqwv7FdaxRgyev/Vgu6Ruo/4V7nbzQq/8uu9dYuUwEr1oKZjYOE1TZ2TOQmwwcMuZ4o
         jWMLa0jiFCTSlAzMngt9Jvsmq/j8OGYJ2RBum6ES719w1NvO/R4mD+Zkb2KY+WsFog7C
         DUgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785457932; x=1786062732;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IVKIsROaFLrBTWGGnB2cmBVxI+DUX5fudtaQeIbEl+s=;
        b=PaLNia8g39Rfnbl/KYfi0DybcJgx/VxK97A9YEO+JjBVLuMqbyvvKvFYHM4x630Mz4
         avxZmyn8AJdDnKa/TKz/L8nvoeVcb0VTj5obHKlNwlvTR+k9tSmipm2nla+zljSnWmHq
         X1pi9/SNCBbNLOqxnAV7CUlgGW9z7qjEiWm3aBcIi9wHdEfji5glakN7zqXcY0DA8CAU
         5HngZwcuNpI/xyVp3huSz7bcKS6RAgZEPyWdebKeEXT8QYl/aHi3yYSSMeTBK2rN4w3H
         Ey3EUCB/DNKCQIKgRUbLTvEsYkp3Wl3pFRga5eB4WkIpryphdx10MFA+7MROyrpzEAAi
         s0Kg==
X-Forwarded-Encrypted: i=1; AHgh+RoyrIwLxLn2nTr30SWnEXJdaXYONtub0Il6neZTEsrBpSxlzPsCmSMdkDZKgS1uNeATP4tg9ps6hiyka43/@vger.kernel.org
X-Gm-Message-State: AOJu0YzoUGNYPS/3Y2BxW/QbJQg1W3rbnS9hEc4FIOg0/MkJW/Y07xMs
	gBM81SI1PjcrwfyoLZykG5RrRTDvf7Q93G59eZkqCX+kDp4TyPUjilebods/Hl3SIwNKlSG++h+
	k9GpWF4odg2XV4flKsDXNPkQVyS0dYIaD+6mLK2pso++viAfzIJTWWiOrh/GiMBoIz+bO
X-Gm-Gg: AR+sD113+Ez41nYoU/MmCCpVaKpIbyq2xurrWHM2bu9JugSXEwR53C7I2TeWwSVZvTz
	T18RHh8zSUt4c4e0nbK/ppNsUi8TKx5Zf4RMy6E+YWZr7KfNjk14qEAugZuIF+OMHBx7NDTIoBy
	gWTHFWmCsa67XA97NGzTLWCLdPOBcqrO85R7Mlc3WBpNnPZTnV/U69XfelPb9MEhD6DpWziRUAZ
	uNkbc0lxELbxbtkl6Pbw4j5Xr8NSRAxsmeetUQ5p5yb5ic30et94Y9uod/FkbDWgCbZxBeLZBbh
	RmDkcRf10RZTgS1RZNBpSKPtzdo0+6gsmjemm62UxdHHwR+9xdKwV9iqbLBBVrJEE6pKH2fq2s9
	K3H4/nhB1YLR6oB+iabsXvA2D03p+aCV1qr5MmYfsC9+HjuARa2abN9ibaQCy3ro9Ab+s5OU9Ye
	wpKosbsWYgNRxreg==
X-Received: by 2002:a05:622a:2509:b0:51a:8c97:9383 with SMTP id d75a77b69052e-52b4b07c9c0mr964391cf.58.1785457932286;
        Thu, 30 Jul 2026 17:32:12 -0700 (PDT)
X-Received: by 2002:a05:622a:2509:b0:51a:8c97:9383 with SMTP id d75a77b69052e-52b4b07c9c0mr964171cf.58.1785457931876;
        Thu, 30 Jul 2026 17:32:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db9d2688sm620538e87.57.2026.07.30.17.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 17:32:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 03:31:43 +0300
Subject: [PATCH v2 4/5] media: iris: reject open() when the session limit
 is reached
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-iris-fixes-v2-4-94c002016a09@oss.qualcomm.com>
References: <20260731-iris-fixes-v2-0-94c002016a09@oss.qualcomm.com>
In-Reply-To: <20260731-iris-fixes-v2-0-94c002016a09@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Vedang Nagar <quic_vnagar@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2304;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=UTnwS/2KKMHvEnj1G5hWv78QxtNSfDbjsv+TIRCZ8q0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqa+z8pcYXFxCxQYZ5HVdyRAo+4mAppT+Dx+uFq
 z+/3vsTq3GJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCamvs/AAKCRCLPIo+Aiko
 1RbUB/96EDm0/+sFBiakv8N/d/MwqjNAj3xbQZgcnod2Mz46RHG23UrI9zlAotJhcq7K9JxEoNQ
 W8xVZLXCcuMFnXEzyeKDHZXpNF2VSlfP/jQlhv7v1MTuNedpnI5jr+qniO2/prGams3F/LJep0g
 7NvCfxRK6qFXdOXDWqx5PCa3Pi5/HIBCU5IlFMIOUwRdgCsCNCTogvH5qjWkmEUPsZonZxPXJEm
 zlMAbItBMOZTtJW0AepRvuxRXcWtRpfhunZvZiKRMfkfQYMUIV+38KT1Hz9GORoyWREWdUyiuqA
 fRTserw2he5KlEhODQhvZdZKJH9nVPiGJ1qQ0OWJUlOby35F
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: -rPg6G7BtNUag9P7aHWyViQsrsbH8-UZ
X-Proofpoint-GUID: -rPg6G7BtNUag9P7aHWyViQsrsbH8-UZ
X-Authority-Analysis: v=2.4 cv=JsbBas4C c=1 sm=1 tr=0 ts=6a6bed0d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=8bbKkYRu5Ug-Ka50F9MA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDAwMiBTYWx0ZWRfX/lEE6q9DOHHL
 VhIKwMKcJFRUPTxWk8BzFhw+JDeVMcsrcr9rW04jfu9PSokbU6CYBcxTJf4HQQAKgtzqVieR95H
 IdPpVPDdKulKRHK+dGUZ7apmrI1VCYe6x8wkfVNwFM91nnJn6XBzhkCZQhYXO44GWFBYRIHpuJ4
 P+i+m8cRZo3pOxmwcJwkivSoKktKndmr+vxQ7BoEFMBxwRjB3u/NJg+Q7ByH2LsnKUTvG1XI64U
 Zyzui9iXOzYfOxNSvAn81R19TsHw/K/DfwpLyHNVmanZOINRxmwQlmdW9VQNBZvY3M/cwrBX7aa
 I/K+g1idLQY6Gni1zcr2QbOuLL3ejrKwB/rGfC7uzg8vudv4JdjXjfx4HOEPU7jUD0pWxYyHbzx
 um+RLqvCYs0mUh4lPmRIX9I38HGrCxyeQUlRTNJq3TcR5gUCcEllS8Yu2UdVV/2K2SVyCmWNL6q
 XP5daEFzy8dyQY+N2UQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDAwMiBTYWx0ZWRfX2XWyTJffbsnm
 hsG3xDPMULLUwTWdnUEntm1vXC7RJLWv00uaBfXq1TX3IH86/Zq/ndv6m29an5BghuGG41+z3Bc
 7T6bi6i/sKTl2vd/+jOPpXkG7DUYzzI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607310002

iris_add_session() silently skips adding the instance to core->instances
once max_session_count is reached, but returns void, so iris_open()
continues as if it succeeded and hands a file descriptor back to
userspace. As the instance is not on core->instances, firmware responses
for it are dropped and every subsequent ioctl times out.

Make iris_add_session() return an error when the limit is reached and
fail iris_open() accordingly, freeing the partially initialised instance.

Fixes: 38fc8beaba55 ("media: iris: implement reqbuf ioctl with vb2_queue_setup")
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vidc.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index fcbc60016bee..4ca9185b3d2b 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -40,21 +40,23 @@ static void iris_v4l2_fh_deinit(struct iris_inst *inst, struct file *filp)
 	v4l2_fh_exit(&inst->fh);
 }
 
-static void iris_add_session(struct iris_inst *inst)
+static int iris_add_session(struct iris_inst *inst)
 {
 	struct iris_core *core = inst->core;
 	struct iris_inst *iter;
 	u32 count = 0;
 
-	mutex_lock(&core->lock);
+	guard(mutex)(&core->lock);
 
 	list_for_each_entry(iter, &core->instances, list)
 		count++;
 
-	if (count < core->iris_platform_data->max_session_count)
-		list_add_tail(&inst->list, &core->instances);
+	if (count >= core->iris_platform_data->max_session_count)
+		return -EBUSY;
 
-	mutex_unlock(&core->lock);
+	list_add_tail(&inst->list, &core->instances);
+
+	return 0;
 }
 
 static void iris_remove_session(struct iris_inst *inst)
@@ -206,12 +208,17 @@ int iris_open(struct file *filp)
 	if (ret)
 		goto fail_m2m_ctx_release;
 
-	iris_add_session(inst);
+	ret = iris_add_session(inst);
+	if (ret)
+		goto fail_inst_deinit;
 
 	inst->fh.m2m_ctx = inst->m2m_ctx;
 
 	return 0;
 
+fail_inst_deinit:
+	kfree(inst->fmt_src);
+	kfree(inst->fmt_dst);
 fail_m2m_ctx_release:
 	v4l2_m2m_ctx_release(inst->m2m_ctx);
 fail_m2m_release:

-- 
2.47.3

