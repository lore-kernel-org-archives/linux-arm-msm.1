Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC6B5875D0
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 13:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788184216; cv=none; b=rpZXi9Web2GR7WMl/ly1TQxtPTslUUMEZrXoPQVLyJH7i24alul/MI98RwW1Ttr6RYKZepenfFmKsGpuKuwcuUFeGr7Hc6ozLRqf2rKe+6emZ2S/Ca7xpv9irrUyZEFRVZt92dbXkRUZbB950PimhBvObGyf5witpCnMjTDoTFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788184216; c=relaxed/simple;
	bh=E+Wg37Rq35UpnAM2BpBST0vedhI2lqt+Euyi3EwnGDo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gXsoUpwU4DCgYUZ+lH7ps6tJfl64HUrNlbcAxEw0Dw4Wk5xWQm3SI/sVs7NN+TgT2dA+t7x5Sv0tRYWyhiWOfXN7JwzCX4HVmmJ7cdFjrfmao8qmuPbk0ue60x2f02uIMguAdeCprvUHeUbZNWq/ktWBvINVEEj5vVVv6k+EYrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M7nRJRjy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H5waEVO7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M7nRJRjy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H5waEVO7"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VBANER3862595
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 13:50:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=4xP1VcGantMGkeDQEfjGUYkRZUtgcvT9SSc
	YlM7KIOc=; b=M7nRJRjyahS0S/+msLbdoLSK6N0vu5NcaS087ArgzqY3xSZfiQz
	f1KVkzGhmFhOkxdNcFYEVRdZtvC/34moxtfC/wAUJXY5hHSsnsJ1xZkUp59P5INg
	g7BvqJ1x/fm5k8/3nDOSXwb3JMvCQ4xUhNmfZsSpFkhTMnAX4hZj3s7/aaMr3AX0
	kzvS1HFVm3KHg70094Cp4XnsiZSkqa75nN8LNhEGBGjdrcNzR3yjAQIFs1xLsf9W
	mbi+h82l8+tbw0xONude+chIgW7qTdgky2K2Rmruuw1cHUhvJVGUE5Ze8aG9toaj
	qaV2NgPwA4F5Y6K4eYOKAXlA+Dt6O7FBiSw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd4pm9rmw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 13:50:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9308eafb465so882202185a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 06:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788184211; x=1788789011; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4xP1VcGantMGkeDQEfjGUYkRZUtgcvT9SScYlM7KIOc=;
        b=H5waEVO7VENVEEkSa+4IGo2ocbNXbedX1zXVbrEAVprnsrxFxNd0ZHb4sXz7xSlTXj
         KlrXvUDRaMPEh4nqut1edYw/uLRHzOAAqcAbem+mk8A5pnpZnbyWCczdHJ0IaET4HB4X
         7AcwZHw8miY9QFxNOCIhOOfmUbePAy1FDpFOcJlvUDShRHrcPH1lswul7KPddYAKVEDf
         eH8RnxCsgc2TusFUHgMDku+tW4vrgnKmmhOJyGkyS64S17z6eZKDarqni4HdVaQ/xpOg
         ECOddyWLBl7TqrdFjM4QVXcSchmdytHVK+JdKApb3Jw/ZGqgFijyk5oM+LsUmFwEM/4p
         jPQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788184211; x=1788789011;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4xP1VcGantMGkeDQEfjGUYkRZUtgcvT9SScYlM7KIOc=;
        b=il/qSmGRHJumcAx1wA7RWppWh0FxxcuyfgnoCXlKqqI8eMK/IuNqCoktsIG+tJW3YL
         s6V035lZ+qrmh4aytUmOSxdxWt0c6uOH0IZQZ8EtnVaQRJMYl0L1kapEqP4KOhRZW6cH
         Im9hXdC0J147QnpN2S3JlC2vpzbTHF61aoMEr2SFCKeODT7AQIg9YA8oFzXb4Z1pw/Ys
         dTS0RMgSOU90JALCjq2FuVBdd4H3dyj5xGDaftPrujbsEA2Dz/f0Es9R9r8lgvgIUTW9
         GLEZweQ4WUM+bIZ1mpCDnJinVrmdnlPrWzXdlMIh9mm1stxpOikPhLYQRDLEKj7IRexD
         M8Xg==
X-Forwarded-Encrypted: i=1; AHgh+Ro25Pw4qAsFE22Il0aeMAoFh0fRPgoUWVdh2rjRohMInhP483hI9boYzia3JZ/KnjScQg1OEQtoyGi+9sj2@vger.kernel.org
X-Gm-Message-State: AFuF++llT4ktvruI3//JDKLUeQXn7hUYKKkM1b9T+nlwQ7x/N9DIcQb2
	CUL9xvMwxJxxnLqH9kcM1PW+JyT/N87j3V7rggXKA8a+V8tBq/1YoIgMAY0FrZpTWlZ3KUFOdBC
	K9Ah490ysPLQy0HH7M+bQ2Tr5tCa1+WOH3i6i5CvlNfPS2pww7DIJU3ktOM+qil4pTwHO
X-Gm-Gg: AR+sD11mx5N8yBtr2Q/y7q6+EGqFxMB4n1Gh+c7XoKyImwK4BeXCXh2xpu6P0Wc9Rri
	b5nznQ/4CNFWIm5aBgFKT9lQ4kgEbgtMkNff6CxiNq14lfUJ1X/Cgv9pOtsKAeC79cwZSzpWIjs
	7y9AaYGeFOjxRzfkG/E0lCvKwx66Fp9cuJsuWoUy7Hoy1iy3a3Bb5+j7frhzKm5nLBnAjl9gJyJ
	sndm83QUUd5H+JJW0U504h5jgfC44fAJAW3XoU0C26OYVL+E+N3vfKoq6SRU+b7PVeppAT7hCyK
	PNplcmDnbidBfidx/vd27H0zDlIFWlnSjL3k6G4bKleTl9Mk3IFtZb8xlHBcZKrZ5g9aVWW6DRQ
	ODMuxus1rWnE//6kcqJw10qH8MrLBF7xAFmOU2RUX
X-Received: by 2002:a05:620a:19a8:b0:939:f89:3688 with SMTP id af79cd13be357-9391397dc88mr2709415585a.42.1788184211358;
        Mon, 31 Aug 2026 06:50:11 -0700 (PDT)
X-Received: by 2002:a05:620a:19a8:b0:939:f89:3688 with SMTP id af79cd13be357-9391397dc88mr2709407385a.42.1788184210744;
        Mon, 31 Aug 2026 06:50:10 -0700 (PDT)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255f1fa3ddsm431674366b.45.2026.08.31.06.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 06:50:09 -0700 (PDT)
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
        troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Sashiko <sashiko-bot@kernel.org>,
        Troy Hanson <thanson@qti.qualcomm.com>
Subject: [PATCH v2] accel/qaic: Add support for AI200 virtual functions
Date: Mon, 31 Aug 2026 15:50:08 +0200
Message-ID: <20260831135008.1418190-1-youssef.abdulrahman@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: UFsiEDmG9-9s4uvBMNPoBBbJtl13R1uw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDExOSBTYWx0ZWRfX8CWuvew4bK01
 SgTK41GsfxX6avt+Jsf9OWoYk5k8QwqCPmeRpHxQnGOe8Wp59xIsboqoDJweae2U9xBihGgIw/b
 GrLuLU+MyFvnrWA4mdnD5QRjmF06mwjhSuE5jruefrbHUnrqTXE4qltqeVo6BVgKDLlbfyaC2c9
 Lg+zq25Q249Y8KXYFr4aWbFtBWMqkfHnhq2XKkLdvRMSjHznlw3ujnAOzoe1u5hNwOIPqZBQ0nT
 PzqUkoMTwUbYiYTA3c1wigWGa0ZQjxg+caoC77xp1NyjOqWlh3XnXwkIvm+1ZfVe+uXJrPPuHfI
 MKgubKUF4feqOiAeFg0zF1UOnQmohnreYPFyW86qw/OUMmqSLO6DwmqTfEI2Ss2uLp/02VMQG7Y
 xcnAFUhUFVUR8jyerQzVfu8X1qfilTGv3Q9dtYcQRDRgySw/3HXmV2NsOqbGAmQOBd6vap7K0sJ
 NpbmOUffZXsDmXJmDKQ==
X-Proofpoint-GUID: UFsiEDmG9-9s4uvBMNPoBBbJtl13R1uw
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDExOSBTYWx0ZWRfX3OlizL1GtC/r
 afRO39OrzvyjpssXMbYwCIeahICLjBRWed8tX1LbjV9Ah8pxo2qQyadtvhK6YdEo96xX1PWe7+u
 k1qHKFzfKDI/kKaoq1UTGBd/UTriGMw=
X-Authority-Analysis: v=2.4 cv=GbQnWwXL c=1 sm=1 tr=0 ts=6a958694 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=k3vaqPubwSAPkb_bsAoA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310119

From: Zack McKevitt <zmckevit@qti.qualcomm.com>

Register the qaic_pci_sriov_configure() callback to allow VFs to be
created through AIC200's sysfs numvfs entry. Additionally, define
a new MHI family for the 5 channels supported by AIC200 VFs: NNC,
Telemetry, IPCR, Loopback and SSR.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/all/20260814165907.C76841F00A3A@smtp.kernel.org/
Co-developed-by: Troy Hanson <thanson@qti.qualcomm.com>
Signed-off-by: Troy Hanson <thanson@qti.qualcomm.com>
Signed-off-by: Zack McKevitt <zmckevit@qti.qualcomm.com>
Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
---
Changes in v2:
- Add the missing AIC200VF PCI ID to qaic_ids
- Handle teardown of VF in qaic_pci_sriov_configure() and qaic_pci_remove()
- Take dev_lock in qaic_pci_sriov_configure() before reading qdev->dev_state
- Link to v1: https://lore.kernel.org/all/20260814164125.3652876-1-youssef.abdulrahman@oss.qualcomm.com/
---
 drivers/accel/qaic/mhi_controller.c | 192 +++++++++++++++++++++++++++-
 drivers/accel/qaic/qaic.h           |   1 +
 drivers/accel/qaic/qaic_drv.c       |  47 +++++++
 3 files changed, 238 insertions(+), 2 deletions(-)

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
index c1bb6db78d12..9e1e184efe0d 100644
--- a/drivers/accel/qaic/qaic_drv.c
+++ b/drivers/accel/qaic/qaic_drv.c
@@ -40,6 +40,7 @@ MODULE_IMPORT_NS("DMA_BUF");
 #define PCI_DEVICE_ID_QCOM_AIC080	0xa080
 #define PCI_DEVICE_ID_QCOM_AIC100	0xa100
 #define PCI_DEVICE_ID_QCOM_AIC200	0xa110
+#define PCI_DEVICE_ID_QCOM_AIC200VF	0xa111
 #define QAIC_NAME			"qaic"
 #define QAIC_DESC			"Qualcomm Cloud AI Accelerators"
 #define CNTL_MAJOR			5
@@ -78,6 +79,13 @@ static const struct qaic_device_config aic200_config = {
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
@@ -610,6 +618,8 @@ static void qaic_pci_remove(struct pci_dev *pdev)
 {
 	struct qaic_device *qdev = pci_get_drvdata(pdev);
 
+	pci_disable_sriov(pdev);
+
 	if (!qdev)
 		return;
 
@@ -666,6 +676,7 @@ static const struct pci_device_id qaic_ids[] = {
 	{ PCI_DEVICE_DATA(QCOM, AIC080, (kernel_ulong_t)&aic080_config), },
 	{ PCI_DEVICE_DATA(QCOM, AIC100, (kernel_ulong_t)&aic100_config), },
 	{ PCI_DEVICE_DATA(QCOM, AIC200, (kernel_ulong_t)&aic200_config), },
+	{ PCI_DEVICE_DATA(QCOM, AIC200VF, (kernel_ulong_t)&aic200vf_config), },
 	{ }
 };
 MODULE_DEVICE_TABLE(pci, qaic_ids);
@@ -762,6 +773,41 @@ static const struct dev_pm_ops qaic_pm_ops = {
 	SYSTEM_SLEEP_PM_OPS(qaic_pm_suspend, qaic_pm_resume)
 };
 
+static int qaic_pci_sriov_configure(struct pci_dev *pdev, int num_vfs)
+{
+	struct qaic_device *qdev = pci_get_drvdata(pdev);
+	int rcu_id;
+	int ret;
+
+	if (num_vfs == 0) {
+		pci_disable_sriov(pdev);
+		return 0;
+	}
+
+	rcu_id = srcu_read_lock(&qdev->dev_lock);
+	/* Qaic device must be online to process VF bringup */
+	if (qdev->dev_state == QAIC_OFFLINE) {
+		ret = -ENODEV;
+		goto unlock_dev_srcu;
+	}
+	if (qdev->dev_state == QAIC_BOOT) {
+		ret = -EBUSY;
+		goto unlock_dev_srcu;
+	}
+
+	ret = pci_enable_sriov(pdev, num_vfs);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to enable SR-IOV: %d (requested %d VFs, max %d)\n",
+			ret, num_vfs, pci_sriov_get_totalvfs(pdev));
+		goto unlock_dev_srcu;
+	}
+
+	dev_dbg(&pdev->dev, "Successfully enabled %d VFs\n", num_vfs);
+unlock_dev_srcu:
+	srcu_read_unlock(&qdev->dev_lock, rcu_id);
+	return ret ?: num_vfs;
+}
+
 static struct pci_driver qaic_pci_driver = {
 	.name = QAIC_NAME,
 	.id_table = qaic_ids,
@@ -769,6 +815,7 @@ static struct pci_driver qaic_pci_driver = {
 	.remove = qaic_pci_remove,
 	.shutdown = qaic_pci_shutdown,
 	.err_handler = &qaic_pci_err_handler,
+	.sriov_configure = qaic_pci_sriov_configure,
 	.driver = {
 		.pm = pm_sleep_ptr(&qaic_pm_ops),
 	},
-- 
2.43.0

