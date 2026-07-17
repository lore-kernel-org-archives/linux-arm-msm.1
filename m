Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E5F394EA6
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 11:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784287598; cv=none; b=NVPffgF1SCNLirs983AEi9PXlIEYkMlET0tL9DRTTH6SEjFo59OXJj+gPMZEv3THAin6DPJg5SU3uc3Vqcwd8jjvho1rjhxXo26/9KbTTTl/ckU5SkaIJb53ScybttzP4jLxV7Y9krdtxEwyOlD+U1oSzpF0RE/KWeeDbBmhPEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784287598; c=relaxed/simple;
	bh=7DHD6sF6jdqNF7o3/oZNHxjqqzN4sJ5d0KCyGYiKKiU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=n/UIJFUHLaKeyctthqFefILAMdFxTUZANiss7uiIOoqmcpitairq3yC4Rkoe/lq4dzk8/ud8S8AgblyYBuLAc3p1w+Md9Tg8zeamK4anbHLi0AJGKdxCBPudnF43gYP07EfjwL6cAM8fJzO1BWc2m5yc0ViOgZkDp93Lcl2spYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XmYtCBdA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xk7UyskX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XmYtCBdA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xk7UyskX"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HASnOL1348813
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 11:26:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1DCmfAQlPKoWgymsulNwEO
	u0w3/DzpAA9VDwyawz6Hw=; b=XmYtCBdArzM1aCC4aHxzPa4wBPD/cmrMBd1k0R
	TrqA2mrhiIjUioopjgbySq12HJMmWw1EWHXk4NS2zS2fpDVnJy0vcTBDAZFmIvbj
	G1jm9NY/ZCO1fOlpRtARje1C1kJMWziyI5yyahYlQ0SEaK/oYvwHx6xt+m302sL7
	H08TBDZ/DaT9mDvGjgTs0lNiQyLopx+9TPntPTGJyH8d4vU2Q/J5usFaYrtcCPa8
	Nmg1MFmtX/iQ7wmGEcY+RcaG0b4KL+r8ajmq1N9/m1cfMlwOfCpAH5SVszvXguEP
	TxvLK4GSu07WfX22FyGbrTpyVv/S7RqAyBFl1j22VkpxCXIg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fffag9141-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 11:26:26 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38c7de7baf1so7933531a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 04:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784287585; x=1784892385; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1DCmfAQlPKoWgymsulNwEOu0w3/DzpAA9VDwyawz6Hw=;
        b=Xk7UyskX3BJPEycLKjfmWXajq/WidmTcYWe2QUYwXJx6m8zuWQ9OQTH2oOm+qzrYtj
         AGQcGnntM98t2J451qZEyfy+rW9cn6cGt0zgttzogO04zMdU/eaOWWrVS1chSpbxOcTy
         XQpjybH4yTumWh4PbcU7r2Cm+PjCg47DsUlRHWF873KeF2dyJ4l0wbNB0ytZWfLSOrIF
         jaF6dAwvXIXyrm1MNO5X8jCCVhqnKfQ+KoCcyHHsejRmTj+AGuw2NdQJWY0vDbJbQ8Ft
         EGZqqW6uAhIyy+KCbxHEyixHgiDESpaD4yx+HVZ3zp8o2HRkEhc5W/lKbsClSFiVggYT
         287g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784287585; x=1784892385;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1DCmfAQlPKoWgymsulNwEOu0w3/DzpAA9VDwyawz6Hw=;
        b=f25l5Mc83xvY1wbvRlAe1pUVt37p9TTJS6N8J4se/wt72vgtUlHQrKPWO1C8u9mmZf
         o0S2jskvOAyZpBaFSUfheBClv4URM72xx15DWRkYwGMHV3lsT9miRb2QheXcNykAosYi
         s7tFraj3rJsxwGSWQGTfXd/2yXCgCtGGVqA7L/DtWpgNf4HMTSFBCyqrl+AvEuKBzkkX
         YbBHtZjiSN9yvZw79Byg2/dWOnP1/yhLJpaIPuIr1YqDLhuri+p9DfhO5NOInF8fhEni
         OjA1RqLC8QZjRMWs3dmSioIUxnk1rA9sRvy7jykz78EGJgjsEk2pbjq/uHKtQle9za4R
         4wbg==
X-Gm-Message-State: AOJu0YzjA4uPEipdn4UdSLUuiCEYSNcnNQdquhM3Z6bLEzI99fZzwzx3
	jG+5ruPe5RrVuqND/ioPAEPvb3jW/AupJ4UTXljcVd2vqk78Cx8zUu1/Mcyaqod3/+TlktdhVq6
	z7yCRPnhS4Hmq002KTQG+4c68AupUIibMonCBwJKRGOTSwBwHxn4XswnT4y5Z3oZjev1S
X-Gm-Gg: AfdE7cnNqrV0nnaJEW1gNEl4QQkXRxd69XdQ8MjspZhFBHc6Ma18wqbC6zifQnBA6wh
	ymicyP4kd2hP8y7DH9FUQLATgYnIKkka+N8Wp8kVXoouITeTgBfWE5JN8w0potVIUi0R1C4qRJB
	1GRp+DxcKFHSjzJKfqtrQcnytuadf+0LbBp6ngEpYj4uDOM2V3/DhO0O9gdKceQubC8b8K+kaE1
	fkrE0zgkECuT4B0gbn44ADD1i9zLNWbaDsmzbuDncLjWIhmTL4JLfBvdcaF8rW05fbwzQdriMxZ
	MqpUbj/c9rNv0/yIFK7QNyOcZcdj7Fx8NKDcU7PhGLGhO8glE3CjH1QKRh4nyr7WfP3swvdIRde
	e0v1iT9Q12iEFsoSFqP3yUZqcQSQ=
X-Received: by 2002:a17:903:15cf:b0:2ca:c68:c554 with SMTP id d9443c01a7336-2cf34a22678mr21776175ad.38.1784287585577;
        Fri, 17 Jul 2026 04:26:25 -0700 (PDT)
X-Received: by 2002:a17:903:15cf:b0:2ca:c68:c554 with SMTP id d9443c01a7336-2cf34a22678mr21775695ad.38.1784287585013;
        Fri, 17 Jul 2026 04:26:25 -0700 (PDT)
Received: from hu-mahap-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf346d9b00sm9179345ad.53.2026.07.17.04.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 04:26:24 -0700 (PDT)
From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 16:56:13 +0530
Subject: [PATCH] drm/msm/dp: add .shutdown to mask HPD IRQ before system
 shutdown
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-dpshutdown-v1-1-b062c2f7dfb1@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFQRWmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDc0Nz3ZSC4ozSkpT88jxdAxNzS0OjtOQ0M4MkJaCGgqLUtMwKsGHRsbW
 1AJrgirBcAAAA
X-Change-ID: 20260717-dpshutdown-047912fcf60b
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784287580; l=2608;
 i=mahadevan.p@oss.qualcomm.com; s=20250923; h=from:subject:message-id;
 bh=7DHD6sF6jdqNF7o3/oZNHxjqqzN4sJ5d0KCyGYiKKiU=;
 b=GSf66u+dk25WN+0jwRQaVANoC5putuu0JyPC8zueJU5M6/QUUZyAi8edlsA3tPh0MzbsGUEla
 gaZ0fAJJFlWCGymLGyF8k8XxxD46LhZCnBu17n+R249nZgpN5x0hxlF
X-Developer-Key: i=mahadevan.p@oss.qualcomm.com; a=ed25519;
 pk=wed9wuAek0VbCYfkANx7ujIG4VY0XfCYrffFKPN2p0Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDExNSBTYWx0ZWRfX9p1WrJlv2dY+
 U1AXi7AMZdsRqWnZH8rDB8f4HgQamA50ObnmnrKKxd6znhZzN1mTSumyKeN32vqdA+8n1dXMZrc
 C6w7HAOnj05+DGnIm51oLbduQoYHFC7Sg/x0tjKx7lskbQxl9G9YPgdRMp4MYPDTXGdfnTKxt1y
 LNkPDNyl+7Rv7+d7pgDc4EQ3XVll0HvR5xMlXM0U4swNOunv4oxq1rsU+hxK5iva3pksXZUShc0
 Ks81u5r4HIGBf8pmRdOsQpR5sCwBkt6UQKsI+dUtY73gjW2hXEp4+sOoLx35FL4QkaBQc4rV5lY
 dIq/8NXiipEZQOOjSWxjCf5vjPYMZ5btALgba8bHQNG1AXUcLEtU6HdO6yajE6exNsluCvP/i8q
 sD6x3IQKsS+5rzG1d/Bo99gsCLlfqepqrPqGmKCiplSPSDN+rXQumdbiu1NAf1HSGKycYSwOicM
 sEgKulia9At6bR4ALww==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDExNSBTYWx0ZWRfXzs05IYtOdpHj
 9d+OfeudhJrCXN4XBdlNU0gBsNDOcJyRb5hKuv1nJ8iN3gS7mE2Hl3d1VARvfRPw+BLrHlhJyEg
 RXB3xrEyCaqP2OYVoazw5/QUWSJDISo=
X-Authority-Analysis: v=2.4 cv=KZfidwYD c=1 sm=1 tr=0 ts=6a5a1163 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=0qqa2dpHJvpZ0q8GZ_YA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: eI1ZrDngFJ_3oK9AAZvxLwJHS6pTEJzv
X-Proofpoint-ORIG-GUID: eI1ZrDngFJ_3oK9AAZvxLwJHS6pTEJzv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170115

On reboot, a late DP hot-plug-detect (HPD) IRQ can fire after
apps_smmu has already disabled translation for the display
subsystem, causing the HPD thread to kick off a new modeset that
drives DPU/DP hardware and DMA through a stale IOMMU mapping.

DPU's own .shutdown disables all CRTCs first, but a pending HPD IRQ
thread wakes up afterwards, reads the DPCD, and fires an unsolicited
hotplug event that triggers a second atomic commit turning the
display back on -- right as the IOMMU is disabling translation:

  systemd-shutdown[1]: Rebooting.
  msm_dpu: drm_atomic_commit: committing (shutdown disabling CRTCs)
  arm-smmu 3da0000.iommu: disabling translation
  msm_dpu: drm_dp_read_dpcd_caps (late HPD IRQ thread wakes up)
  msm_dpu: drm_sysfs_connector_hotplug_event: DP-1 hotplug event
  msm_dpu: drm_client_modeset_probe: DP-1 found preferred mode
  msm_dpu: drm_atomic_commit: committing (unsolicited, re-enables display)
  dpu_crtc_commit_kickoff: crtc94 first commit
  arm-smmu 15200000.iommu: disabling translation

Mask and flush the IRQ in .shutdown so no HPD event can retrigger a
modeset once shutdown has started.
Reported on lemans-evk and monaco-evk during reboot stress testing.

Assisted-by: Claude:claude-sonnet-5
Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index dc6f33809ca5..b4fbdeebf952 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1207,6 +1207,14 @@ static void msm_dp_display_remove(struct platform_device *pdev)
 	platform_set_drvdata(pdev, NULL);
 }
 
+static void msm_dp_display_shutdown(struct platform_device *pdev)
+{
+	struct msm_dp_display_private *dp = dev_get_dp_display_private(&pdev->dev);
+
+	disable_irq(dp->irq);
+	synchronize_irq(dp->irq);
+}
+
 static int msm_dp_pm_runtime_suspend(struct device *dev)
 {
 	struct msm_dp_display_private *dp = dev_get_dp_display_private(dev);
@@ -1253,6 +1261,7 @@ static const struct dev_pm_ops msm_dp_pm_ops = {
 static struct platform_driver msm_dp_display_driver = {
 	.probe  = msm_dp_display_probe,
 	.remove = msm_dp_display_remove,
+	.shutdown = msm_dp_display_shutdown,
 	.driver = {
 		.name = "msm-dp-display",
 		.of_match_table = msm_dp_dt_match,

---
base-commit: 1a1757b76427f6201bfe0bf1bea9f7574f332a93
change-id: 20260717-dpshutdown-047912fcf60b

Best regards,
-- 
Mahadevan P <mahadevan.p@oss.qualcomm.com>

