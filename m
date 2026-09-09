Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77DE3FCB32
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 09:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788947366; cv=none; b=oD2pIPfJO9XHzShD0gOmS7QhjqxT+VUwdWNQBRq9hqbs3LEhi3fKVEm18M10/WOPeebkadUcPQKeQNoCSq+D6zQqwCmlKWReZd9ExDY0Q/j98pjNNKlE5LXJ8sPrGPbLqXRe5DxEGP4ANLS3O73FXv+e7eaR/R+opFSEN50MtAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788947366; c=relaxed/simple;
	bh=iZ7W8Vc6BInFOXywjm7gxiKNyzTM4xgG1/yMVyWCwiM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ppgqpSb+Yo5HkIwA50R+69vcoZwunFKvvYaQfu6LGkEMAU6OG9rqGf1OuP4L5eNRuIrRQbHAKv68y9Qx5v8n7OxBo4EqPuu/eJL36RbA83in2k4N8kir2mULGDBEXtFqZC7XrPfyUVdB6wVui+RR0/JMNGUA0d2jwphbJakqcqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U/c5n89V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dm/MZIET; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U/c5n89V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dm/MZIET"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6899W1pf3771143
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Sep 2026 09:49:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=whxfYKp+wUBGcLPXBbMpMg
	ilnHtg13wbcPBfV/6wxFc=; b=U/c5n89VTEV7+OQMeXcQHMybgvU2StnYb9B/4I
	c4ywaLNK2iRNyirZ2ba1a/M6lcsxmC5fsTEJUy2xK6wMr6vWB9r18/RcnNoQrgZ2
	konzbXB16Sg/+cb+Q3XcoECq61S3+MuvaxZdyOeWjX6XWXpIu87JR9xfAgZ0c3HV
	nbMWjfQiiBfBniT+UqMpyDtlxM9l3Fg5ozB3hjiB2DDvKaR69MoyWhTdg4NX9pu8
	j/YgGfNRVXRiVFRfBo37eNb3TvF+xQXp+yKN1AYbHnxA0o0cCRTG49vrm54JrmsZ
	voTcLjAnNupne6bAWJqt2b4mdHDMaRIzG1mWgSMewNhDUfWQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjywr1bpt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 09:49:22 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc18ced1a5aso9444143a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 02:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788947362; x=1789552162; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=whxfYKp+wUBGcLPXBbMpMgilnHtg13wbcPBfV/6wxFc=;
        b=Dm/MZIETm/mm4UCXcgSN+r7hvs3nM9lSVfHSZCFiBsmGl7iGY/xNDxEnzOcwQmNiGr
         3mdyAF1Y0fHSwIOTGLp3KNj62zFPzx2xaIs0aW5XMCAK7RWxIYtUVj/N4G3pziy8rgvp
         0b8Bq1UlbDC6zJfHVBC33mfMVtq20jsxLZL3fWDGnIQX7/ESm/oDI4popAhXlCI2j8ZU
         wHb7femyQKku/eEL21KID7ft2H0PFK0zXkRvllEvff3Hx0ptMijV32mcWixaTkfnHr69
         qnH3HBqEB3t+xInSysgHTaFp2xuzCJYXQ6/g34f1Cpt6mn4b0M0UT+ljmjLf6Qgc5YaY
         dljg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788947362; x=1789552162;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=whxfYKp+wUBGcLPXBbMpMgilnHtg13wbcPBfV/6wxFc=;
        b=Nlsu7qU40EEqlDqzF0oijXX/CwknywMZy5P9JJulFmEw+MwiYI2G8p7G6r5MywK3r5
         YCva0Xf7KdsksyGKuhJF1VxswaUYeZXn2Mi7p6lqVjCh2T7ALnWTZ6IMlLjM22klcRhk
         Tyu+eeq8fYon+oh6vFHlM0tKkSl7p/HzZyhM7Z/3dgaHw1EORMM6YxovwZraTPHSZkZ9
         U4eyqmXFth+jz21Vw1WeP2uTeVHSJKzpd6PFuDVbgwF53HqfqDkf+K41z07hAUmjHAk6
         fYdYmATBJYgMLfOmnzd2+BTH7OBZfqMklz+1rzk4aYAvfQA1Wgwz+SpXSAjfr0B+nLNb
         AFVQ==
X-Gm-Message-State: AFuF++nWblmexzofg12owXfGgVIrYjJnvL7TxFWCb5quSiKPeU3OTtWV
	2hP3mwfO+HFWRnZKgua3PUwxKK58YUoVrJ4KI03/m2sbqok8VamM5+FIR9J34Jyz/7IPtMXtY6K
	7ueW2/cB82DjXfr6+LKbTEx5fS20uOemfgCa7Xw2Uy33M0L3y1AMpovuMhLT7l36aUgC4S8u1jT
	+j
X-Gm-Gg: AYBFou3UCSSnyhPhVkdcjtmicBL0xcIit7uHehEOCQgAppnH9NK+qdU852mSQBJWutI
	oiCqIlr8fBTMHOI5emwfSPb6Sunm9WHmwwCJYZ5leM4sxyt7xe6PcXy7MIehc8sXnQmEoduGKot
	4qXVLDWNKxrJlQVLRWglm64o1zueaXAIKePbNWvEghhRhIe82GitHjz+pYsi5Ukmrknylbaw2xC
	GGAFOTeBPIGCioOVK3vsd9/7C2xVAsdz49cGinRymtmDwevloYh5lBA9oveO9c5O44FONpg0F6C
	2lGWC6JFhkMr7oEn7dBBPhPdflOyOnvgfnyRON/6mz5XHiQpunOg0mQW2h5WVBkzQ8m7jjUjRzH
	VWQWADbRZnOLpsDg2NnoJzdPrDTAwBloSZt+V5E6ROJa7mRDVvvnaAdVF/CLd4IYaz4us6g==
X-Received: by 2002:a05:6a20:7343:b0:3c3:88a5:83e4 with SMTP id adf61e73a8af0-3da39ee2718mr49984394637.10.1788947362059;
        Wed, 09 Sep 2026 02:49:22 -0700 (PDT)
X-Received: by 2002:a05:6a20:7343:b0:3c3:88a5:83e4 with SMTP id adf61e73a8af0-3da39ee2718mr49984350637.10.1788947361605;
        Wed, 09 Sep 2026 02:49:21 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33450e140d3sm36924949eec.4.2026.09.09.02.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 02:49:20 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 15:19:10 +0530
Subject: [PATCH] Revert "usb: dwc3: qcom: Add support to skip phy
 management by USB core"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-xhci-fixes-revert-v1-1-7cc97fa0f307@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJYroWoC/yWMQQ6CQBAEv0LmzCQL6sblK4SDrI0MBzA7iyEh/
 N0Rj5Xq6p0USaDUFDslfERlmQ2qsqA4PuYXWJ7GVLvau+ACb2MUHmSDsu2RMt8C/H3ApffXiqx
 7J5zesrb7s679hJh/R3QcX+9s9hx1AAAA
X-Change-ID: 20260909-xhci-fixes-revert-59e68fe3b641
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Val Packett <val@packett.cool>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788947357; l=3416;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=iZ7W8Vc6BInFOXywjm7gxiKNyzTM4xgG1/yMVyWCwiM=;
 b=Q6Q55wQEr9TxwCJMJS2zxvajrlosKtdVkG9whs43xaafxhpMxEqFraWaPqTP1Z8HYAnrsuCzd
 q/wAOIN8EC8BDle+WvyQqTNBnHghV1mrb5nGK3l7k4zQxMJ3kIy0VU8
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Authority-Analysis: v=2.4 cv=a4YAM0SF c=1 sm=1 tr=0 ts=6aa12ba2 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NfhF7w8bToBWIbooztAA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEwOCBTYWx0ZWRfX4Jl5Ymoa0C4y
 CQL3QjCThMyUos0lj3yCo/W3dRgt2ln8nb4AJ//i9CkGFBmzeRz4ujshhOIgQT9UBFc3wAMCrLw
 ynheXnhpv2Gd97NZprif6VR4XIbN8dE7DCnzozg4lmowbEj5dJg14i7QBFaU+nj/I8GHBQOP6kK
 vs9YFLy6r002Gppe9VhHNQASeVdT6/UWI3nama423kDPocrvmEllCtlBggO2KQs/+lImhmNsLvn
 klhTSqUM8W9CE0rfFTSYhXjQUSEDs9ODgCYA+YqsciZnsl6KgGyAdci1HPiJVO2TKEW61TM0U/m
 9N7pmwYp0ai/vwY0ic+dk/nHjVYFJ7qwdXfABe8bEuPdLzD4jDmMbL5DVhQdkjuNFc+WmHL4WLc
 IPcbPTOjIdKmzivAV7YDZy1ugNQVhgtYoBaBrz1OciSldazw4B+4t7f0XUW18CfVh4wAOEzHtfY
 BbMyXrjKPAay4DVHLEQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEwOCBTYWx0ZWRfXwQCm7Ud9Z+Cy
 19Wzge+HTqTmjZ/jnXrnjO1NdjevH9brb7ZO/hlnemFPQyyrpkUzdDsntsd29PejWgdnw66s4BY
 6BDkQFThNkcmVqyih6TG8/u+Ik02aBg=
X-Proofpoint-ORIG-GUID: ImQsHK42J5khGGv1u27BB9TwmcRsIvGS
X-Proofpoint-GUID: ImQsHK42J5khGGv1u27BB9TwmcRsIvGS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090108

This reverts commit be7b1c68cd3e4fc0f5a4e1b85696de1052f21f2f.

Commit be7b1c68cd3e ("usb: dwc3: qcom: Add support to skip phy management by USB core")
is causing a regression on qualcomm platforms.

During role switch it tends to cause the following crash:

[    5.620951] refcount_t: underflow; use-after-free.
[    5.621114] Call trace:
[    5.621115]  refcount_warn_saturate+0xd8/0x140 (P)
[    5.621117]  kobject_put+0x11c/0x230
[    5.621121]  software_node_notify_remove+0xdc/0xf8
[    5.621124]  device_del+0x1dc/0x328
[    5.621126]  usb_disconnect+0x1d8/0x348
[    5.621129]  usb_remove_hcd+0x100/0x2a8
[    5.621131]  xhci_plat_remove+0x8c/0x170
[    5.621134]  platform_remove+0x28/0x40
[    5.621135]  device_release_driver_internal+0x174/0x290
[    5.621138]  device_release_driver+0x20/0x38
[    5.621140]  bus_remove_device+0x19c/0x1f8
[    5.621142]  device_del+0x1c4/0x328
[    5.621143]  platform_device_unregister+0x34/0xc0
[    5.621145]  dwc3_host_exit+0x50/0x70
[    5.621146]  __dwc3_set_mode+0xa4/0x378

[    5.644535] Unable to handle kernel paging request at virtual address
[    5.644657] Workqueue: events_freezable __dwc3_set_mode
[    5.644664] pc : __pi_strcmp+0x9c/0x140
[    5.644668] lr : software_node_property_present+0x60/0x98
[    5.644697] Call trace:
[    5.644698]  __pi_strcmp+0x9c/0x140 (P)
[    5.644700]  device_property_present+0x9c/0xc0
[    5.644703]  dwc3_gadget_init+0x230/0x7b0
[    5.644704]  __dwc3_set_mode+0x314/0x378
[    5.644707]  process_scheduled_works+0x1b8/0x538
[    5.644710]  worker_thread+0x1fc/0x2f8
[    5.644711]  kthread+0x114/0x148
[    5.644713]  ret_from_fork+0x10/0x20

Revert skipping of usb core phy management for Qualcomm platforms to avoid
the above issues.

Reported-by: Val Packett <val@packett.cool>
Closes: https://lore.kernel.org/all/f9926203-ee69-4e18-b6c7-95261ba10807@packett.cool/
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index ba26e61df915..ac68b4218b56 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -19,7 +19,6 @@
 #include <linux/iopoll.h>
 #include <linux/usb/hcd.h>
 #include <linux/usb.h>
-#include <linux/property.h>
 #include "core.h"
 #include "glue.h"
 
@@ -420,16 +419,6 @@ static irqreturn_t qcom_dwc3_resume_irq(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-static int dwc3_qcom_set_swnode(struct device *dev)
-{
-	const struct property_entry props[] = {
-		PROPERTY_ENTRY_BOOL("xhci-skip-phy-init-quirk"),
-		{}
-	};
-
-	return device_create_managed_software_node(dev, props, NULL);
-}
-
 static void dwc3_qcom_select_utmi_clk(struct dwc3_qcom *qcom)
 {
 	/* Configure dwc3 to use UTMI clock as PIPE clock not present */
@@ -694,10 +683,6 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	if (ignore_pipe_clk)
 		dwc3_qcom_select_utmi_clk(qcom);
 
-	ret = dwc3_qcom_set_swnode(dev);
-	if (ret)
-		goto clk_disable;
-
 	qcom->mode = usb_get_dr_mode(dev);
 
 	if (qcom->mode == USB_DR_MODE_HOST) {

---
base-commit: 34c9c5517033a74039a54dfab24e7bf767a4e0e4
change-id: 20260909-xhci-fixes-revert-59e68fe3b641

Best regards,
--  
Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

