Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F4647F79C
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 14:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790000481; cv=none; b=maJTF+upiTLuo/gYtxsx4rFwAWFMt+Z6gSJqwyjU1vIG32IQlCTnijk1zVGk4gdSY4vuFcns7fMHXncTRgsOBuJsGyXS/Oxo8WzUwWaUlW6o8rc1B+aDCCHRdIoaF04Rtbt1pkpqz3QgW8fQj89oOq2qMweVFBuNrc5SrHL+408=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790000481; c=relaxed/simple;
	bh=YXdltogLgHE/UKFhQ5fzszTnWDc2QfoZ9Ww8AoRrxP0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=CMfGog50Sbim8h3zVhPUWyOz3w/zPLoJVO7/hrnJcGkUosAvOVlJLM6sYF/03y9JQONcwk5dEmAC8NXe17MJ9ZnHlGxfbDhEMi/gbQ5H1mFz9W9PvB4AtMTysbVuezX8/fIBK78qYd/xCyrDBKcEqiftIVADVhIq+9K2WgJ3+tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hIlIKnDk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=al+rcr78; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hIlIKnDk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="al+rcr78"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LEGWH92042077
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 14:21:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Xj9cgjyng5YDZxOJSlwipO
	W0qye1AT8gap/mGW9Ugw4=; b=hIlIKnDkJB7NNAaC7UXKap58+sup3g24YRiRhV
	xsMP6CFbpjFE1LxZXy4+tgIH3iA9rZE4fjeiPRgPpowUuIjq8JQseVAk+zybr07X
	YOW55c+Tmsbx7vuEPPm7l3uqVCGL1vXSb0nQg16n4kaESwYode/9SJLgWr4saHsw
	l7HpPV3mlJDEHSMWccLP9fyEoHmIqjQPqIw9BdJh8suwm+GHRn8+kyKGKoZRyTae
	e20am1CNie0TjAONLg+7Dr9uj/VJsyaf99DAIwQNy5mzQF8aQNI7QUxjACiXfqWJ
	QIvWTjWxtdrmsmE4yl5Gsw1nDe0pkctP+yyCFjnvxQrGi2kQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtysw1q9x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 14:21:18 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-868db1b2c64so5322233b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 07:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790000477; x=1790605277; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Xj9cgjyng5YDZxOJSlwipOW0qye1AT8gap/mGW9Ugw4=;
        b=al+rcr78WDgi/Z/zi5S/USoZjCA3Eh2tvca/+aF1UwpYjVUcq49C3elwD9l929iWOp
         f7lHaKcKUt9nOA2mpYI2BO6iDDcxUhZoMqX7riuXVTGWW2JwqHsJ+2LTffsn4dce9fHd
         sCQqHcdeLsUxrkVMX/BkWh94az0jh7YyGCImq5UhHMW4Mbx1szR3YGJYr/4QmakOZI4a
         ip/PVY5bAOJ/3+EfTz1aGKHQZ+6nb6mmxrd3Q+DVDs06adSXOE+STpYcOwc+3sr5di8k
         S5CTFjuweKFjQjd2wN17PhNnjA1RP8uPuHdmDcELEWFEmm3YvwmH+ewDzKmZpEOSfwE4
         yDJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790000477; x=1790605277;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Xj9cgjyng5YDZxOJSlwipOW0qye1AT8gap/mGW9Ugw4=;
        b=hGdm6wuI8DMWIq0eGzdjZbeCJ6KYlnDFSZZ33B7I3cxQ1zRKmolqkso3YjMJPK6l3k
         iv8RFkslYOfDYdW3HvHi4vFbKkX6utpFt9JswGDs9VI63N/24OAXmjce8Wkh4vKml0HB
         8Xlt0OiebVTYV00Bm6RmiMyXu8QgcsTmaIBqDpJTho/udmpYhCvDtjrYIeH/FbAExQm+
         y6k6BjZrRhixDwK/if87YXFW56g0r7U6BR8KdCzq0LJIwS5KcrnPLlbD/NYvJ8wF+h5Y
         YUG5gcU1F0RQukq1e4JzlDi3+Pk1yP/zCJYcl5AhdlIxmEciTmpVdxZsfOQvygBO8l13
         NrhA==
X-Gm-Message-State: AFuF++nbcUuJExuisHKcOttlH2wIsfqRvAY/jI0RqOlsV+gVSxyluMA1
	6/4InwFBM8gK8q4WjtQ58Q4JIsIHQj3qJpmQ6ZUzIerOMHxDZL6Ytq5EU8ep8n0CCeNsE+isNZv
	FSt8rUaLW8vL559SNrnH/FV2x1l8AEi5CUcRNLkyaD0ynsGbr1sMGmPEDwUp6O+1hIYa3lcJJuM
	71
X-Gm-Gg: AYBFou0JvpX1ERe/iHyvWD14vL44cVo9LG/C913QTbDIBbS7lBGXb/XvWVzaH60u/+x
	7PvtljhfGp7jcUwef+IFVO9nIxYVSbJ9on+L1BXo10KRwQsBbQv5OGRQ+9ytPg1Qa4tBaQ045Ia
	LI1XpimR2Ua0M2q5RzeYx2lIIarnejDeQcF4+bNgxWdDAAEl9G69rMZ0c07U70h4TFeRN7HUap+
	8P55XGh8aRCb5Xe4rz5wJaRVS0FX0udXDPMHCyzg1ioYi7trJsgGqmwqs3fX1hOWz31E3Knl/Qg
	quoyxtzO3KIU+zUfDF2j4ikkUggjxwFspA6GD4upCmbtVix2t8qtMXLA9ewxg/GaOsdBiN1STzz
	G/PbqXEkuuD9xJtQSf0fVZB7Ek4Jxl2PZoL+E
X-Received: by 2002:a05:6a00:23d3:b0:874:705d:f659 with SMTP id d2e1a72fcca58-874df1fbaacmr14780848b3a.39.1790000477416;
        Mon, 21 Sep 2026 07:21:17 -0700 (PDT)
X-Received: by 2002:a05:6a00:23d3:b0:874:705d:f659 with SMTP id d2e1a72fcca58-874df1fbaacmr14780812b3a.39.1790000476815;
        Mon, 21 Sep 2026 07:21:16 -0700 (PDT)
Received: from hu-anupvish-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a94f4a10sm3369582b3a.22.2026.09.21.07.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 07:21:16 -0700 (PDT)
From: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 19:51:11 +0530
Subject: [PATCH] mailbox: qcom-ipcc: Use dev_name() as IRQ name instead of
 a static counter
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-b4-ipcc_static_id_race_upstream-v1-1-6e2163e20523@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFY9sWoC/yXNQQrCMBBA0auUWRtoQhtbryISkumoI1jDTCqF0
 rsbdfk2/2+gJEwKp2YDoTcrv+YKe2gA73G+keGpGlzrfDs6a1JnOCMGLbEwBp6CRKSwZC1C8Wn
 caLvj4FPv3QC1koWuvP4O58vfuqQHYflmYd8/cQ36cYMAAAA=
X-Change-ID: 20260921-b4-ipcc_static_id_race_upstream-2914786b5628
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790000474; l=2114;
 i=anup.vishwakarma@oss.qualcomm.com; s=20260805; h=from:subject:message-id;
 bh=YXdltogLgHE/UKFhQ5fzszTnWDc2QfoZ9Ww8AoRrxP0=;
 b=XDQ7QEG/eiLkha9skhfuR9I4tbE9J+IknU0/7KFTssBM22iHkt4cvBsDD/WA9KWOKW856trKy
 zePU0IkPg2cChQIAmmqKUuSG/V6SEpLjt1KJjXtvdCwbuOOULhxyBD2
X-Developer-Key: i=anup.vishwakarma@oss.qualcomm.com; a=ed25519;
 pk=Y9ilCu91UQrzHOM14SG2IjnmQ1QSroH5uVeBSWEmEDM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDIwNyBTYWx0ZWRfX6IOf1ZOj/sTt
 N/Taq7VEm3i+OT80jqlHg1YVG6U9Lt/UBKezcg3ypv40g1eJZ/H/5LCyJxrGOZl/hEKbzWhl98R
 WQA8FPon3ij1uEG3pnj+Kw3/R2JiiVn6IqZsIfpPA27aq2ACzyBTXsPSSS36o7mDwjC9tJM/g78
 o+XzrhlCS4+C+PH8hKogAwRaOiV+TWnWN/8+xdft/DMpQee5UfY00as99NR6hLFmQ+iVCLhf2LP
 JyiRpzTK2iBRZOeThjUR2Zr7G52Nnf4S3y2OpMffbubYyAA2n8LsXpsIIgRYJaMrIGxP+j84z1T
 s/0sf01WIJGbUvDB8glGdMEhawSb6ryI9eJy7XcwUy7k9NULKoClTPM2GO/2DokQuCcSvIFJSHy
 I/1nBn4HiiBy3E639jNYB6uwrzkFHG6DQBcZkMfSwcQXNhCPwXM6508/D2R7uYpmKCZYmPLMwEi
 IuShKm8O3QBt2uMVJDQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDIwNyBTYWx0ZWRfX6T1NXcjqr6F/
 JLWryN0KJaT3xXowvrwWBQEfmjakLMyNxL1IcaET8xrtJ9MPiwBPbw1+zHOTqGnDidW4eOnBBNa
 4LXzi2ih1aW8SW6/CpcGLS6GrocxdkI=
X-Proofpoint-ORIG-GUID: asg5ylnwBU387cRjL7Fx2B2foQRZhq9f
X-Proofpoint-GUID: asg5ylnwBU387cRjL7Fx2B2foQRZhq9f
X-Authority-Analysis: v=2.4 cv=W7etxhWk c=1 sm=1 tr=0 ts=6ab13d5e cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=NONAO5duIdG_9b8w44kA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210207

qcom_ipcc_probe() uses a function-static int id incremented with
plain id++ to generate unique IRQ names. Under async or deferred
probe, two instances can probe concurrently and read the same value
before either increments, producing duplicate IRQ names.

The device already has a unique name assigned by the platform bus. Use
dev_name(&pdev->dev) directly as the IRQ name. This eliminates the racy
counter, the name buffer, and the devm_kasprintf() allocation entirely,
while providing a more informative IRQ name in /proc/interrupts.

Signed-off-by: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/mailbox/qcom-ipcc.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/mailbox/qcom-ipcc.c b/drivers/mailbox/qcom-ipcc.c
index 185b63f724d4..456596569bb5 100644
--- a/drivers/mailbox/qcom-ipcc.c
+++ b/drivers/mailbox/qcom-ipcc.c
@@ -282,8 +282,6 @@ static int qcom_ipcc_probe(struct platform_device *pdev)
 {
 	struct qcom_ipcc *ipcc;
 	u32 config_value;
-	static int id;
-	char *name;
 	int ret;
 
 	ipcc = devm_kzalloc(&pdev->dev, sizeof(*ipcc), GFP_KERNEL);
@@ -313,10 +311,6 @@ static int qcom_ipcc_probe(struct platform_device *pdev)
 	if (ipcc->irq < 0)
 		return ipcc->irq;
 
-	name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "ipcc_%d", id++);
-	if (!name)
-		return -ENOMEM;
-
 	ipcc->irq_domain = irq_domain_create_tree(dev_fwnode(&pdev->dev), &qcom_ipcc_irq_ops, ipcc);
 	if (!ipcc->irq_domain)
 		return -ENOMEM;
@@ -327,7 +321,7 @@ static int qcom_ipcc_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(&pdev->dev, ipcc->irq, qcom_ipcc_irq_fn,
 			       IRQF_TRIGGER_HIGH | IRQF_NO_SUSPEND |
-			       IRQF_NO_THREAD, name, ipcc);
+			       IRQF_NO_THREAD, dev_name(&pdev->dev), ipcc);
 	if (ret < 0)
 		goto err_req_irq;
 

---
base-commit: 5c4d4169604b335c38bbc79bc1fc03042981fc6f
change-id: 20260921-b4-ipcc_static_id_race_upstream-2914786b5628

Best regards,
--  
Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>

