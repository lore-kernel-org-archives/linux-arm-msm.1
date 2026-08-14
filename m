Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0426933D6FC
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 16:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786725692; cv=none; b=pK1f3UHdZZdt1t/eyNJYQU6J4iObvsz+uPYXuyy1kXFjdPM5zHSQY2Y1zinix29e5QVXCpBA/hDAPAP9ZP/vABntN73csutykFX4hXLk1BO0FXLCE0DRfg5mcpZ63Bvyrjw+/psYxS/IvAQyJRVQqs064INQJnz3zEzJDLV4XHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786725692; c=relaxed/simple;
	bh=PBkqG0mC49of6x2zySPvx1BtDSrcl/Dp8nAJPFrxieY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L2+EheOJTcpuknoHEHcHaXv8MexLbjaFi7tzJsfCeEkPuJgWAp7gXQ0Tssdu4G5CX6OKcN2822H6uM5uCPIedXkL5vbMTXn3Gouhr0p/EaPVDsAQ3QYPYjvY9Nzt3lrWQfgvpTsO0ah5TZtukY65uGxUOtAw+YNAUI3euyUWsGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D+jO8Xqo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TncFIbXe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D+jO8Xqo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TncFIbXe"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67EFCE6U1731558
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 16:41:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=FLl5j633yGnhRW4yq74ExUx3+uVkWVFtDN+
	vWUXMeBc=; b=D+jO8XqouvbmqKwDUFyXCNmJLIklptwk2tuYTZ2O1JGS3MKICqT
	6b0/4rVoFlLtCfn4i+OwNqREBwPzW62rw/my5rYzus4jcgsDJykFmp08vz1odRjD
	6uyqmIcdc9xX2eQdF1mG/c+Ec6uRQngmRpjiDsFrE4nmjke5xKUaa6f0AQZfQDaD
	8fLTsOZAYHw5VNm+lg34BNFmjAImYjf4Cd7OE0hr/9ppSxIu0vmOlMEJ2ReKxH+T
	NaPqaN9Kyfug3W80y0otefWPPYvbOL+e27b2phVR1uKQh80erfGmZdGVhDPqkyKt
	VH1S4YqM+Oq6vfN/uRatw4pWaXItBcdqhBw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g25f1ge3g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 16:41:29 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5283df62d68so15009331cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 09:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786725688; x=1787330488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FLl5j633yGnhRW4yq74ExUx3+uVkWVFtDN+vWUXMeBc=;
        b=TncFIbXeQO758VczYtYTH1MfScKPW6cTpzenHrUM03V+q+M4vKPqV56DKpn6CkpFcR
         VAf40NK3UN/8BmIxnV/z4gm0Ou5loyPn30pYA4WspLQRdaTDDX9KHVUGvmpe01LDdqD8
         dVM004tI0oDEB9QlLURjtHPjkGADGoi5VCAx034F5WoUGtSUac+4XrsOqDwczzokmWu1
         lsX36vTTIVc88r3hbKXnbXP8S27LiwYUyEUxQfPbIjsI0YTs9xrMquuIB23C70E49eM7
         jrgXRZJ/chzN3zDYLKj0Dnz/zKbMvvEe18CLCgkUYQXBUkC12thiReNz9Hv50u4RFXHF
         B9BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786725688; x=1787330488;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FLl5j633yGnhRW4yq74ExUx3+uVkWVFtDN+vWUXMeBc=;
        b=NeRxNBkhXik/oeGg+1udFIQkMBoEDpcPjWyO1vnwbRWNQRPxfibDgLAyQVSAOjCj19
         gIAc7iu4NfrntT/0AeDw5Y8YQaKdSmlc5ONEJI/vv5xAVn1FAiz8G3SCx4oW4KUEgx9G
         cAxJwuVfwfOu37fwBhkm4SrDwLO6bnL33Cj4E0fFtx72v8Y8uMz2Url9vvAXo7JH0NIK
         GVUGf3MGXkl7TpsH4EGbpZAHiNT/9HgEzBjVSjkRunhw6foeoDggLFcQ0MXSoCFmV6Sc
         NAb1qvcErLldMidQAANZzZZslD+2qMRUoEkvzU3CWf3kkyJcUBJgS2d2u0g459dP6Czu
         lQUQ==
X-Forwarded-Encrypted: i=1; AHgh+RoLfDTw3o/gWVK61d1r3yCKTA7xBw2eMsn0uBMSmbaih1WcTm9DTB0TufVslE9GZV969wa7W4yXW071DZhK@vger.kernel.org
X-Gm-Message-State: AOJu0YzzaTGRNrfpKBdYP+J0sd5xLWNqUY7sMwd8Do7TZXuliJ0bJ30V
	5yg1Ag3j6x7MfRB5CNnMIHtnIqwr0iqu4n6tdkBPY16h80FQ4HDy0rjSN1OnV1QletI37bAsTki
	fK+ALsE4yP2S3D9pa5rNr8xXN9do5CxcU2CqBAoPRwkPEYD0S3cjyjcIVbpxwfG5m+xX5rzTz/Z
	QJuUo=
X-Gm-Gg: AR+sD12lzji5WeSy2mVfD7lzWZQHCpKW43j2J1Ucqk4L7mO5Zh207vyLPBPZ7TTa0K7
	lemz3OnFypAFNy8MzOg+0ok+AHKDM4bld8YrV7LCRDEAlVjRFHmA2gpETn8wfLIRsVNOPcBtwM3
	9jgQc0pBlD3NSuuFSua8QdefpzfqbMGTnZoDKIH71AO29RqFxjEmucF/Orec1xjxbB5Gd5Howdq
	42LX44b5VOtM07U5FAcgJESTXfghPa9zDPXi6d4XCl3bnxbWhAbb1Vmgz3q0zJzZF4gxIS0c/p/
	FS78eH7NTI7TfHk2WdFnsFTJeKPmwmH+wCuf/nFGoGWsXEZkIfSr0OHak90lKlLx0hPk9Y3Y3qT
	m4B5X0l0AW5347VLn29u1nujSIGIKngq3j+aQ0h9l
X-Received: by 2002:a05:622a:1e13:b0:51c:6e:ef23 with SMTP id d75a77b69052e-52d8551d1d8mr90293771cf.32.1786725687896;
        Fri, 14 Aug 2026 09:41:27 -0700 (PDT)
X-Received: by 2002:a05:622a:1e13:b0:51c:6e:ef23 with SMTP id d75a77b69052e-52d8551d1d8mr90292781cf.32.1786725687335;
        Fri, 14 Aug 2026 09:41:27 -0700 (PDT)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c21234b7467sm128309366b.15.2026.08.14.09.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 09:41:25 -0700 (PDT)
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
        troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Troy Hanson <thanson@qti.qualcomm.com>
Subject: [PATCH] accel/qaic: Add support for AI200 virtual functions
Date: Fri, 14 Aug 2026 18:41:25 +0200
Message-ID: <20260814164125.3652876-1-youssef.abdulrahman@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: B5zesIYgmsrNgvju509oSVoEbFBF4TaT
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDEyNyBTYWx0ZWRfX4BX1wlqFWJU+
 wC6Z9PYIKTLVqovZqXVU3X7/3mBb4u/Iq6NLToFvxviLtASBv9DYkfr/rel8NPxnygSgoS+rj2y
 VO54K6bqz6bUf99O6xhPUSfFPry/FjA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDEyNyBTYWx0ZWRfX/WgrxK5iPUoM
 KSEsU/imK4JNylVbKwxFsRzgk++mpHDPYsW/uuAAkT37lyEI/QQDcGiXBcO2J2aJ3r8GexthHbX
 A8wnF71PhvSQwkH6eWdCNfbVJLB0CrAvGLBpEeYb5IW8umCmi1GZ3lGyT+nyXGmQDSxZarmob0y
 uyd9WaNBtLF+O5e5uXMFbNF1IAc0itoyQWpmBWsSkOxEjDmiPdLW0/GzbD5g2Gz6Iie2eKaWVty
 KEbVta/6WUimW0O/su+6QbjrS8w7oPH0l1QFMqtflscDqtwzPrWk9YNUeaHVo20QpA8Ytog5OnZ
 gxJn3PNYNGvC99YSOpgEh4YuluztJPWEF4ps9oH8HuUWe3zDKIpW7fIbVRXKCmToUTUouVYywfy
 5rzmianq2xZvrJn+fyV/5ciJMc0T0Igrs4/+FzBW1bRt1xyQ/INqPxbT0lJjopsRFrhplIEXsNt
 Yl2DzUz3+hvzeH3ylYg==
X-Authority-Analysis: v=2.4 cv=Z7Xc2nRA c=1 sm=1 tr=0 ts=6a7f4539 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=OXodVWOEbbvTmevkwmwA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: B5zesIYgmsrNgvju509oSVoEbFBF4TaT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 lowpriorityscore=0
 spamscore=0 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140127

Register the qaic_pci_sriov_configure callback to allow VFs to be
created through AIC200's sysfs numvfs entry. Additionally, define
a new MHI family for the 5 channels supported by AIC200 VFs: NNC,
Telemetry, IPCR, Loopback, and SSR.

Co-developed-by: Troy Hanson <thanson@qti.qualcomm.com>
Signed-off-by: Troy Hanson <thanson@qti.qualcomm.com>
Signed-off-by: Zack McKevitt <zmckevit@qti.qualcomm.com>
Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
---
 drivers/accel/qaic/mhi_controller.c | 192 +++++++++++++++++++++++++++-
 drivers/accel/qaic/qaic.h           |   1 +
 drivers/accel/qaic/qaic_drv.c       |  36 ++++++
 3 files changed, 227 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/qaic/mhi_controller.c b/drivers/accel/qaic/mhi_controller.c
index 40e6d262ef21..c720b70b1e0f 100644
--- a/drivers/accel/qaic/mhi_controller.c
+++ b/drivers/accel/qaic/mhi_controller.c
@@ -23,6 +23,7 @@ MODULE_PARM_DESC(mhi_timeout_ms, "MHI controller timeout value");
 static const char *fw_image_paths[FAMILY_MAX] = {
 	[FAMILY_AIC100] = "qcom/aic100/sbl.bin",
 	[FAMILY_AIC200] = "qcom/aic200/sbl.bin",
+	[FAMILY_AIC200_VF] = NULL,
 };
 
 static const struct mhi_channel_config aic100_channels[] = {
@@ -691,6 +692,159 @@ static const struct mhi_channel_config aic200_channels[] = {
 	},
 };
 
+static const struct mhi_channel_config aic200vf_channels[] = {
+	{
+		.name = "QAIC_LOOPBACK",
+		.num = 0,
+		.num_elements = 32,
+		.local_elements = 0,
+		.event_ring = 0,
+		.dir = DMA_TO_DEVICE,
+		.ee_mask = MHI_CH_EE_AMSS,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.wake_capable = false,
+	},
+	{
+		.name = "QAIC_LOOPBACK",
+		.num = 1,
+		.num_elements = 32,
+		.local_elements = 0,
+		.event_ring = 0,
+		.dir = DMA_FROM_DEVICE,
+		.ee_mask = MHI_CH_EE_AMSS,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.wake_capable = false,
+	},
+	{
+		.name = "QAIC_SSR",
+		.num = 6,
+		.num_elements = 32,
+		.local_elements = 0,
+		.event_ring = 0,
+		.dir = DMA_TO_DEVICE,
+		.ee_mask = MHI_CH_EE_AMSS,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.wake_capable = false,
+	},
+	{
+		.name = "QAIC_SSR",
+		.num = 7,
+		.num_elements = 32,
+		.local_elements = 0,
+		.event_ring = 0,
+		.dir = DMA_FROM_DEVICE,
+		.ee_mask = MHI_CH_EE_AMSS,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.wake_capable = false,
+	},
+	{
+		.name = "QAIC_CONTROL",
+		.num = 10,
+		.num_elements = 128,
+		.local_elements = 0,
+		.event_ring = 0,
+		.dir = DMA_TO_DEVICE,
+		.ee_mask = MHI_CH_EE_AMSS,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.wake_capable = false,
+	},
+	{
+		.name = "QAIC_CONTROL",
+		.num = 11,
+		.num_elements = 128,
+		.local_elements = 0,
+		.event_ring = 0,
+		.dir = DMA_FROM_DEVICE,
+		.ee_mask = MHI_CH_EE_AMSS,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.wake_capable = false,
+	},
+	{
+		.name = "QAIC_TELEMETRY",
+		.num = 16,
+		.num_elements = 32,
+		.local_elements = 0,
+		.event_ring = 0,
+		.dir = DMA_TO_DEVICE,
+		.ee_mask = MHI_CH_EE_AMSS,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.wake_capable = false,
+	},
+	{
+		.name = "QAIC_TELEMETRY",
+		.num = 17,
+		.num_elements = 32,
+		.local_elements = 0,
+		.event_ring = 0,
+		.dir = DMA_FROM_DEVICE,
+		.ee_mask = MHI_CH_EE_AMSS,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.wake_capable = false,
+	},
+	{
+		.name = "IPCR",
+		.num = 24,
+		.num_elements = 32,
+		.local_elements = 0,
+		.event_ring = 0,
+		.dir = DMA_TO_DEVICE,
+		.ee_mask = MHI_CH_EE_AMSS,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.wake_capable = false,
+	},
+	{
+		.name = "IPCR",
+		.num = 25,
+		.num_elements = 32,
+		.local_elements = 0,
+		.event_ring = 0,
+		.dir = DMA_FROM_DEVICE,
+		.ee_mask = MHI_CH_EE_AMSS,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.wake_capable = false,
+	},
+};
+
 static struct mhi_event_config aic100_events[] = {
 	{
 		.num_elements = 32,
@@ -721,6 +875,21 @@ static struct mhi_event_config aic200_events[] = {
 	},
 };
 
+static struct mhi_event_config aic200vf_events[] = {
+	{
+		.num_elements = 32,
+		.irq_moderation_ms = 0,
+		.irq = 0,
+		.channel = U32_MAX,
+		.priority = 1,
+		.mode = MHI_DB_BRST_DISABLE,
+		.data_type = MHI_ER_CTRL,
+		.hardware_event = false,
+		.client_managed = false,
+		.offload_channel = false,
+	},
+};
+
 static struct mhi_controller_config mhi_cntrl_configs[] = {
 	[FAMILY_AIC100] = {
 		.max_channels = 128,
@@ -744,6 +913,17 @@ static struct mhi_controller_config mhi_cntrl_configs[] = {
 		.use_bounce_buf = false,
 		.m2_no_db = false,
 	},
+	[FAMILY_AIC200_VF] = {
+		.max_channels = 128,
+		.timeout_ms = 0, /* controlled by mhi_timeout */
+		.buf_len = 0,
+		.num_channels = ARRAY_SIZE(aic200vf_channels),
+		.ch_cfg = aic200vf_channels,
+		.num_events = ARRAY_SIZE(aic200vf_events),
+		.event_cfg = aic200vf_events,
+		.use_bounce_buf = false,
+		.m2_no_db = false,
+	},
 };
 
 static int mhi_read_reg(struct mhi_controller *mhi_cntrl, void __iomem *addr, u32 *out)
@@ -864,11 +1044,19 @@ struct mhi_controller *qaic_mhi_register_controller(struct pci_dev *pci_dev, voi
 
 	mhi_cntrl->fw_image = fw_image_paths[family];
 
-	if (family == FAMILY_AIC200) {
+	switch (family) {
+	case FAMILY_AIC200:
 		mhi_cntrl->name = "AIC200";
 		mhi_cntrl->seg_len = SZ_512K;
-	} else {
+		break;
+	case FAMILY_AIC200_VF:
+		mhi_cntrl->name = "AIC200_VF";
+		break;
+	case FAMILY_AIC100:
 		mhi_cntrl->name = "AIC100";
+		break;
+	default:
+		mhi_cntrl->name = NULL;
 	}
 
 	/* use latest configured timeout */
diff --git a/drivers/accel/qaic/qaic.h b/drivers/accel/qaic/qaic.h
index 02ca99000e2a..889fa51da7da 100644
--- a/drivers/accel/qaic/qaic.h
+++ b/drivers/accel/qaic/qaic.h
@@ -35,6 +35,7 @@
 enum aic_families {
 	FAMILY_AIC100,
 	FAMILY_AIC200,
+	FAMILY_AIC200_VF,
 	FAMILY_MAX,
 };
 
diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
index 0acf6cdd44f8..cde8eb8c7a71 100644
--- a/drivers/accel/qaic/qaic_drv.c
+++ b/drivers/accel/qaic/qaic_drv.c
@@ -77,6 +77,13 @@ static const struct qaic_device_config aic200_config = {
 	.dbc_bar_idx = 2,
 };
 
+static const struct qaic_device_config aic200vf_config = {
+	.family = FAMILY_AIC200_VF,
+	.bar_mask = BIT(0) | BIT(1) | BIT(2) | BIT(4),
+	.mhi_bar_idx = 1,
+	.dbc_bar_idx = 2,
+};
+
 bool datapath_polling;
 module_param(datapath_polling, bool, 0400);
 MODULE_PARM_DESC(datapath_polling, "Operate the datapath in polling mode");
@@ -761,6 +768,34 @@ static const struct dev_pm_ops qaic_pm_ops = {
 	SYSTEM_SLEEP_PM_OPS(qaic_pm_suspend, qaic_pm_resume)
 };
 
+static int qaic_pci_sriov_configure(struct pci_dev *pdev, int num_vfs)
+{
+	struct qaic_device *qdev = pci_get_drvdata(pdev);
+	int ret;
+
+	/* Qaic device must be online to process VF bringup */
+	if (qdev->dev_state == QAIC_OFFLINE)
+		return -ENODEV;
+
+	if (qdev->dev_state == QAIC_BOOT)
+		return -EBUSY;
+
+	if (num_vfs == 0) {
+		pci_disable_sriov(pdev);
+		return 0;
+	}
+
+	ret = pci_enable_sriov(pdev, num_vfs);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to enable SR-IOV: %d (requested %d VFs, max %d)\n",
+			ret, num_vfs, pci_sriov_get_totalvfs(pdev));
+		return ret;
+	}
+
+	dev_dbg(&pdev->dev, "Successfully enabled %d VFs\n", num_vfs);
+	return num_vfs;
+}
+
 static struct pci_driver qaic_pci_driver = {
 	.name = QAIC_NAME,
 	.id_table = qaic_ids,
@@ -768,6 +803,7 @@ static struct pci_driver qaic_pci_driver = {
 	.remove = qaic_pci_remove,
 	.shutdown = qaic_pci_shutdown,
 	.err_handler = &qaic_pci_err_handler,
+	.sriov_configure = qaic_pci_sriov_configure,
 	.driver = {
 		.pm = pm_sleep_ptr(&qaic_pm_ops),
 	},
-- 
2.43.0

