Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792797602;
	b=E+rQSLpw1C65ilOE0YL9Hw73jMBv2dZXNCRFJvHZ8S4G2X3c2uklexkkW7EXg+rWIA8L
	 xO6aODhGAwySn918y66KNeZvy6tRXn+wDdg2lN43czOSqaE/fIE4xnJJBuJQ1HXqozlGa
	 QjrGCOChqmp9GeTouo78gjWLTIhfd2ute/W+5u8FCaSS+BV6/w1sHrMTfEA/jwI6s9xgt
	 roAMppQ7IDBfV0689MjOlMVzwJoc4EIKt8zziIdb5HUx6DA49dv+JYUTdoS7VhiZJ7ELg
	 gZ6sEdcdIR5AMzx4hfr8eG5ZNZlIrOdw3GRJzrIjr1c02WCFdk4jP10f37ikQYEVWFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792797602;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=+fZhaZ82V4/5KLW1sTiPxhoM8r1KKvfY9E07z+Fr920=;
	b=snQXiAoc4G4p9QZeL53FvsnfwLQBCvMdULo2iqqzk+y4gsTEjfvo1iNizuB6qADBuH69
	 L3Zw/srXiCTw4JC0Na0LJHP78qUZ2IXK5Kc+ygHhPzV1dbu5d/4HZgfCR3GilOLKUBuIC
	 7S8fqPmEsZzKWjxPFYxXBS7Jn3iSSzTtPlx8n5hRs4i7BqpPxw7WtVrwO9vLItywWf3zt
	 nHXKQrVr7BlcLmE/xZSsXoVuWDs6Gw7NlrpqwqWFBvqIa4aI3OVFIL7OAU+BhE+5/7T4D
	 P1AjPpRvd7Xq5+Qihyn+h5VO0CF5IJcgCuDpm3T9pzZTBALjTZ8nqJHK88Q1eUJUvig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Aluv/iyv";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Hhb/S5+5";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17DA606A326
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 23:20:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A17DA606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Aluv/iyv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Hhb/S5+5
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NLvd41297688
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 23:20:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+fZhaZ82V4/5KLW1sTiPxhoM8r1KKvfY9E07z+Fr920=; b=Aluv/iyvrrIKRl+1
	/5SyUn54dDWT63KmrMF9ijQNx6s2cvN/L7S1Sihz9adCoj42OovdjAwWoKjR1538
	DJvuIQ6LyvhBp0hPCouGkkhy2mJ5he0yVM24Yda67h+Ycn/VIX1h+leBnoL/1c6W
	SRqgZR9+0iDYvsBiRf5dQjgum44a9DxSK74C02icYswxvC3P0uXnHKrqtqt+QZfn
	BQcfLEM/Se0ZqWy6GRCkZW2E8PVteDSzRcJKentGOcj535F4EWpSDtM3Uy8a5AR6
	JcZfGyabaYdfGK2wWb1hv804/B8v36UfMpDWJrNnl5lfu40Z81x6LSx1OzRfZCYN
	+UR6Iw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgaruhc0k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 23:20:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f32050e72so89154285a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 16:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792797600; x=1793402400; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+fZhaZ82V4/5KLW1sTiPxhoM8r1KKvfY9E07z+Fr920=;
        b=Hhb/S5+54NlgsFJtgUaZa5w2A3wcr0n0X8dGiYiHeTFMLUuKtG0MT4s7vW7XDU6WtS
         7w/dIOZTwJmyJYnU2ppNJF08JCrHzOY8dcfrQXow4Ol9jpGIZJnz7kW3lzX9VYjaebSL
         8EjzZTep8ar7NruAaGf4lIKXu8KWeJL3fgThmc/3zxGsiKfN0arrtE2OlR7sZIRfLMAH
         RM7yfB97gijUt79ZK3e8iFh09tQubf6QopZvgVCRFpTFsRedYc137J8b7nGk26a3iTYc
         8IaD2UIubmSLMCUZBjjV0fvKOLxfHs9Xs6Y5hKZbEeoyb85aC3FJO4PpG26XfXSBVhOa
         HywA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792797600; x=1793402400;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+fZhaZ82V4/5KLW1sTiPxhoM8r1KKvfY9E07z+Fr920=;
        b=dfgFOHRJrCDTck/qlUUQVbbJOwAnH3Uazp3R58rxM1fTxbO4HOoEdCvCc8IBgbpLij
         qksnzZKNg9LmusgX7Gk++amjgZZML008ZZtnD5vqgmjgSKR8pNRy21X3MGYN2b3vJsvY
         xLnbdUvEHfFF9YM465qibVaZ1zrgNP7YDGXoPkzMJO4Rp0GfW3ZApE/+plLjbgk/Tio5
         DFOOjOrq7IuStnGgotRAK+cpY2rg08+L1lCvHhYecfmHgI44L4LpmvBGQQxjs6ysY841
         oIhTexesiuI65ffCu0e1qSghKBbCB0p37qYY8+WWNn6jnufPnaJKY0OKQmOjy5V7kazm
         /eXw==
X-Gm-Message-State: AFq9FYKJFY5Ftkl7uVPLX6nuBCt7JNY1FVHc6dnbSqtGDdFbYvaZEYs2
	Wm7orVeBUodfJ8vrvlKQrKC7SbWNMJfcC9GU09hc+U3EYvn1QWlLvbjJEgQZhyzJvakQutyrmGO
	mqdaYe7PS/+YicJ0GkkSqAMztiXJjCGH8Qvqcmh3hUICPw9irPNacUK1ZeTPcLGHqEf7A
X-Gm-Gg: AYBFou2yWb1X8+XJ663vdXLPYkM7RTwXCtPOG88pOYZH3X6tp7WbLtZ4qBtjOno+ONI
	CI6S4UxX1KIPkKegQVXCYnm1DZ1KhNIv+2OQPBjX8hdF5cFrZmKc6KH6Tr75W9VRMMnr/qe0RA2
	BqnBrpaOEsm8yPlKZrBL2qxSg/FbMhuucBhEnetPnA3UsjPpW0mybP6UdGO5JOmh77FmuwS++bQ
	iyvnYzZpvSOgpBg7vsDqo0jIjK88/B7ZHEu3wZfFI2vYkdmjf5RcxwW7gxV0Hr3urPuJnRBPT6C
	m3FkuMwQ3f0z6Qi3uHD3ZDgvIKgBF4UdGSdB4mxEAtVYoOUtZ22EUnQcm5/pRPId/W6cnxN3UVm
	1paVi/C6wlzhIQtw2MQqcIuAB6MAP6Y69/V0g4JUSSB3gPJK3lOXJGRKYzzjHRqju3p5gXEBiv8
	z/98uvLLXXCSxk
X-Received: by 2002:a05:620a:4008:b0:93e:d7f0:497a with SMTP id af79cd13be357-940ef8bea57mr86709685a.16.1792797599864;
        Fri, 23 Oct 2026 16:19:59 -0700 (PDT)
X-Received: by 2002:a05:620a:4008:b0:93e:d7f0:497a with SMTP id af79cd13be357-940ef8bea57mr86707085a.16.1792797599390;
        Fri, 23 Oct 2026 16:19:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac709f3a58sm863811fa.24.2026.10.23.16.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:19:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 02:19:34 +0300
Subject: [PATCH v3 01/14] drm/msm: fail the snapshot init when its worker
 cannot be created
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
Message-Id: <20261024-msm-kms-destroy-fixes-v3-1-66a30120a5ea@oss.qualcomm.com>
References: <20261024-msm-kms-destroy-fixes-v3-0-66a30120a5ea@oss.qualcomm.com>
In-Reply-To: <20261024-msm-kms-destroy-fixes-v3-0-66a30120a5ea@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1898;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=WsQ21XZW4TA3F25Pv6HWJIhCOEkArUvMa6B6iciNKmk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2+uNWzv5sWeJLMJrumC5ZpaqGpCgFn6aRBMY1
 Z7whunSVnOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatvrjQAKCRCLPIo+Aiko
 1bAfB/0SiCwjML8FgRX7IJ9T+KYMFwwrg5nOqeAVTruHFCS6kMOf5truYmZeGWkt4jYs5xnCpIt
 6yVo2HP8aGa1yzqRHRfa6kCF9fij9rqA6QbmviKkFYFNDYwDl9w9lp79bdjSEsyhlURLUTWF91L
 h32BmF4jDdXrsGNjFCZiSojmJWcPv7Q38MJF2gKbDvWFj3p7GDmiQAQJkEwv8A+No/oIAe0gnZr
 HEkhBmym7QZ0ZY1DSl5rdKx6v8cP1GI9t90Pk8s8zqinebLsgs1QrxZKSIkncE+90R72dfaxgpr
 2ZCM6g+Ie/Qp0Yi5QohmEWzEbmeIYmmzK7IT0EI8i4v/HGAa
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfX+2OxZvooS+9v
 olCyY7fHHIKC5DXPThUEkiLOxBXpQXv0Jb2eI/2GJJGIuxEmHvfPfzALx+rbPAH/M+q/AE509fg
 n+woZcdB9VmEgCiGQeYokWZZMvAlY4g=
X-Proofpoint-GUID: 9ITE9R-XXqw-SJYfYljGUlwHtnimCOsq
X-Authority-Analysis: v=2.4 cv=SK7Xx+vH c=1 sm=1 tr=0 ts=6adbeba0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=D-zmcGmn4BrKCB6hg70A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 9ITE9R-XXqw-SJYfYljGUlwHtnimCOsq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfX8G2Xifv3ko+g
 ivXW7vZx7/DfBDL/wtzSrPJMvQ+LzLoRD25zR3bdpZZswM+HoSJhI1hiK4/VdIEm5/W4G6Z9W/x
 08RP0wvjj9aMQKqGnl8WZraJqwHvupa8lC/WUKWeCaa7G4wZQKmFEP7W4fEB3mN9RKQyU2EyfYg
 Ko4Kwim88lftMl1vw9/oHe+4R9wJ5RBkz+X90NOk4zaDzkMGR0GGhjHcKD0pQs/7WVztC5J8D9j
 mNATjIeZ9+YpRVCuhGdubyh4ZcSmXC+ihd1Uo0fRy40/TTGUuU/o6FnJJV8YhQqRs+pm9U2aGlh
 rvigqLJZ7xZSReYDDrDgH96awfw57HBNHNySP5OB6j7Z3YEyg3EeQAz2WctySqaQgA2KIbuI9R3
 BXwP7rDjFLq8fkZRzuYHxQ5CmzZKI8GYTop/odXIRvFJgRFqZrx0QDyCXmyVxUJvCFp6Enncg0F
 MPRX/lJev/k00pqpXQg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230092

msm_disp_snapshot_init() only logs a failure of kthread_run_worker() and
returns success, leaving the error pointer in kms->dump_worker.  Both of
its users then dereference it: msm_disp_snapshot_state() queues the dump
work on it on the first display error, and msm_disp_snapshot_destroy()
only checks the pointer for NULL before passing it to
kthread_destroy_worker().

Clear the pointer and return the error instead, so that the KMS init
fails rather than leaving a snapshot facility which crashes when used.

Fixes: 98659487b845 ("drm/msm: add support to take dpu snapshot")
Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/msm_disp_snapshot.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c
index d99771684728..d1b10656e41a 100644
--- a/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c
+++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c
@@ -98,6 +98,7 @@ int msm_disp_snapshot_init(struct drm_device *drm_dev)
 {
 	struct msm_drm_private *priv;
 	struct msm_kms *kms;
+	int ret;
 
 	if (!drm_dev) {
 		DRM_ERROR("invalid params\n");
@@ -110,12 +111,21 @@ int msm_disp_snapshot_init(struct drm_device *drm_dev)
 	mutex_init(&kms->dump_mutex);
 
 	kms->dump_worker = kthread_run_worker(0, "%s", "disp_snapshot");
-	if (IS_ERR(kms->dump_worker))
+	if (IS_ERR(kms->dump_worker)) {
+		ret = PTR_ERR(kms->dump_worker);
 		DRM_ERROR("failed to create disp state task\n");
+		goto err_destroy_mutex;
+	}
 
 	kthread_init_work(&kms->dump_work, _msm_disp_snapshot_work);
 
 	return 0;
+
+err_destroy_mutex:
+	kms->dump_worker = NULL;
+	mutex_destroy(&kms->dump_mutex);
+
+	return ret;
 }
 
 void msm_disp_snapshot_destroy(struct drm_device *drm_dev)

-- 
2.47.3

