Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF9F423E99
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 09:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790328187; cv=none; b=teijlcDFlr62wouQrpRK+3lJUcJ0LGGKyekEY+VNQId64W2yPeRmGi2+xOc8I0gTiPO/C2Mg+kMeYeFdgFdnZVhWYMhdxQ+LyBdsJyu19KseBGYqIptz3u5OiliNdVDdLUOUTp/eIuY+K8pCMsdW0FKl0ImS0WwpISYyTqi39Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790328187; c=relaxed/simple;
	bh=1K3Py6we5fiOyv3lBbiQiqnDRg9t78ygXbnOMxEfISw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=YaFydB8KEwPh8qjZaXZlJfrbfHRCfpBhfjyRkJXBrmuFSI5WmY9Uqe3THJ3hMYzjcDxGGc2LFhn2lHNgMi7nil2Ww1T+qpk/xwg5ZKRnNMfGo5ATKpDqedHHTgxlWjiXOnB20agpUJ6Gv7pSSojRYcJe5omLfvjWpIlBGI68HGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ztf6pQyg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E52Sx7Jo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ztf6pQyg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E52Sx7Jo"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YwLE4103023
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 09:22:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=YrwhiYuUO7IOf+5JLjyeZ0
	9blpXIFVfo4O+6DfIs030=; b=Ztf6pQygkd3lyIz9MZ/Swyly0T22R+f8q/mPFf
	+kp+saA9C8Oc7ad0FuBqCJCahqqt+dzKySCkxS+J91It9JxrqI9Tbq88M7+oLP50
	q7mM6TbdaBwdn5nKznLl+v4kNYDg7ZSFLPAE++TVWTRNRuKulJIXNz5X1s+9iglv
	yt/jZTUx1ITilg65JOGNt9jwVTr4ZHSen8hVr6ojGtQEQorLJPZhtscfaULacONG
	14H+Gj0UMAUipAg8/WQYsWf84qLuM2YCpCYWCIfWzqZ4UHbgSH+FtHZIvyE8RHWC
	L+YVJJX4ieb7EJhwN6KSZdX4w8KoUPRLcw5rJlv13j/vbzYQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw5q8upsm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 09:22:58 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33713e5e6daso1062308eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 02:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790328178; x=1790932978; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YrwhiYuUO7IOf+5JLjyeZ09blpXIFVfo4O+6DfIs030=;
        b=E52Sx7JobGbU7Fn6qa8qlJyCRBoreKlq4qhfWIkk0nHjiJcJ34st7mIDofQyOpAjzF
         4LlTKlVTPIfKN1mkeHCYrIMnz00yw+J0FOhFw7HZFwdJM/fsCqULRS3EQYUsEzTZJiGW
         15FmnNHrdaZ4fJ5PnuB5TM6yk+H0SmZJ37S9oSO38sQfuUyTJ/7eSFD7fbAyZKxnpwux
         bVBpC0u3MsS6czxNtX5FrzJ9ZmXjJ2k0Y5ZGs8onHizZzqHDZnrtydc3kg65efsNrICm
         NCIuO+y4GfCleLN0K44vKfxggDM2zvn0E5VBFuCln5w1VEEGnbYw/sVCC3IFKn+SR+o6
         ZFAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790328178; x=1790932978;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=YrwhiYuUO7IOf+5JLjyeZ09blpXIFVfo4O+6DfIs030=;
        b=dqA8aEQr5CHgNmlx2yY/hGeqfbTo1Ep0UFEbLvOgdhVSo9x0M6VhjikF8xYOvUD0T7
         65W+sSVGj6kqiJNACrQPbg9NTkd5Oz7JWjsxat/SdXEfPpUzLpeBhFFDbB8RNYttNwZw
         fBh4kvpqEcAlOBx1lSVjza9XxV6dSX84lCX/P4kItdfyBIUaZHv7CYIrUrJPmLREL5QU
         Sz2MZGa2JlWP7OjJPUBXSW4SJdqGqPrrnNAlOrDAS0I8YyF3ZFKrw7hrEBLWVkp9DJCB
         W/lMaBU/I6L1V3vRx84agp0GAlhhl+xrWkWFkbYFkRdIc0LRm3/qr0y0Lko3gatA5jTZ
         +Egg==
X-Gm-Message-State: AFuF++my4CCpDJ6fLwYvnnJCgf5lbz8tHTG4/BU0Ul2UqAYOsn3a1IXx
	Nylpb3HwqIYWAjTo0Q5kCd1aG1c20lP38eR2ho4LncVDXxTfnP3uxJq5qOMZ3nZUMCaFFrUXsmJ
	GW7EmdFOCASaIR40/VEtsosUDiAXfvfZ4NZd/hgV2y/2oc0ez0OwWACdaZ7qROwwr0ZEA
X-Gm-Gg: AYBFou1057xX7/RXfTvH61D5pkugYdAI6luuMLdMgaEP3i2YHn6DkkoIsrrmwrcCE9w
	qDf7Dz6zJeC0GLWxfthYwjg5OnkZQOmSWphGJfYNaXS8ELmr0x862zMfVRhLzNKEquUIM8P/FmG
	DWE8Xk6o8Agt+/gqNIuilHUmZvex06qAaeCiqZUBXroC/322Q/lVCZZKumbpqCPFhvqGfDVAMA0
	Tt/PN5B6lxrQqS+FY4uR59mjoDsB9RuIIxAJMpn+ePKpc9m/LV+adCbmsJFeRK1j0gc+ujNISV6
	T7tM2nyxBq1gy1aeevcpjY/VRgQBZY4L1IYf9WvX/RgbeeLKL8tdzWbI3AcJ8gZk2nrRtzbgZko
	V02rxrOCvPzYKcPbdvSdD7khgRnE6P/apxOE=
X-Received: by 2002:a05:7022:28b:20b0:130:6c8f:5a87 with SMTP id a92af1059eb24-14503f2e50dmr4487647c88.13.1790328177610;
        Fri, 25 Sep 2026 02:22:57 -0700 (PDT)
X-Received: by 2002:a05:7022:28b:20b0:130:6c8f:5a87 with SMTP id a92af1059eb24-14503f2e50dmr4487608c88.13.1790328176628;
        Fri, 25 Sep 2026 02:22:56 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145ad8e43d2sm5391831c88.12.2026.09.25.02.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 02:22:56 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 14:52:49 +0530
Subject: [PATCH v3] slimbus: qcom-ngd-ctrl: Implement disable_stream
 callback
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-slim-disable-stream-support-v3-1-cdc8171f27a2@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGg9tmoC/32NwQ6CMBAFf8X0bElpEakn/8NwKGWRNUCxW4iG8
 O8W9OzlJZO8zCyMwCMQuxwW5mFGQjdEUMcDs60Z7sCxjsykkLkohOLUYc9rJFN1wCl4MD2naRy
 dDzxTJ60zkebi3LBoGD00+Nrtt/LLNFUPsGFTbo8WKTj/3vOz3H6/Uir+lmbJU24lFI21ympdX
 x1R8pxMZ13fJ3FYua7rB+FiC6XfAAAA
X-Change-ID: 20260803-slim-disable-stream-support-43599401607f
To: Srinivas Kandagatla <srini@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, mukesh.savaliya@oss.qualcomm.com,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790328173; l=5849;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=1K3Py6we5fiOyv3lBbiQiqnDRg9t78ygXbnOMxEfISw=;
 b=c5CNV1Jwmn2vZ+8AEs8zoYOulRBqOhVE48D9xuwl0ml872+r9M4SrFIMuk4zT25Q4ThdndrRu
 R2FiWeCGis1CWzgOb74EhXQmBA+u/xnq1sCpVYZd+MXhq7n4PkGxs8P
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzNyBTYWx0ZWRfX0Eky9Pkb7qi4
 teOnjbTVYaIKi/wDzEJnIO2u3xq5N7wQyJQe8SWTVjbAd0Gcwnql2BxHUEyN7SpXJSMDZ61MvBc
 1Ca9BeLJgx8KmnLnb33hItnBOO3Ymw8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzNyBTYWx0ZWRfX8jTkpkY8IuMd
 Xxpg2gvsPBodfAMx8Gg4Y/OkdPiD1K8IiR4Cmw6sEpEjMk6RM1CbMkLYn0TjckwcEaMr1ZsIe5t
 OVV01l4p7zlYsfIHmnvCIEfgPXHlwufKOmw08KDMTrAr0DR9t6BA5oH0JAiU93Avsx1e/ETUhth
 aDiVm5hgTQfFXhdqGc0sSllscUbMhyjhYPJdLaAq2heGvD+d2lyawZLW803WAnXAaLLFh/MM6vQ
 LU9UwtpRXtUYBnzjYOHLeW8vXCa0W744Jbjl4HNW2CjSC9BwUtbxjmNkonJRrpiRALseB46WfoD
 aNFcLJBlqX/b4TRZvNCLnaWyBjVlTVe6zxF3QYHxUAaLaCLG+Jz6wRVyQh/2uPX3A/784g+Mzxu
 JAM/wu2HQh+yJTKagl3aZmGI1PPzgTz2evYrl9vLhVxynTiicumPjXd+Uj1kY8mNFMArlLOMCqF
 lp5bIG7d0fAECa5C1sQ==
X-Authority-Analysis: v=2.4 cv=SYRi5fRu c=1 sm=1 tr=0 ts=6ab63d73 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=kKA2uLVnAdZqmg0bn4kA:9 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: CXdyfg-iiRGxeza4LO0L57cxXp977FJq
X-Proofpoint-ORIG-GUID: CXdyfg-iiRGxeza4LO0L57cxXp977FJq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250037

Switching a channel to a new frequency without first disabling the stream
causes the channel to be re-enabled without a clean shutdown, leading to a
crash on the DSP subsystem.

Implement qcom_slim_ngd_disable_stream() so clients can properly close a
channel before switching to a new frequency.

Acked-by: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
Changes in v3:
- Handle -EREMOTEIO as success during stream disable.
- Drop copyright update changes.
- Link to v2: https://patch.msgid.link/20260810-slim-disable-stream-support-v2-1-c2e8fcc3c99d@oss.qualcomm.com

Changes in v2:
- Rewrite commit description for clarity.
- Fix initializers: use { 0 } instead of {0} and {0,}.
- Use reverse christmas tree ordering for local variable declarations.
- Replace open-coded shift/mask with FIELD_PREP() and GENMASK-based defines.
- Add SLIM_MSG_HDR_LEN macro to replace magic number +4 in txn.rl assignments.
- Fix dev_err format strings: add spaces after colons and commas.
- Update enum slim_ch_control comment to kernel-doc format with @member tags.
- Link to v1: https://lore.kernel.org/linux-arm-msm/247e4ce7-1ba2-43b8-8a11-ec70f99a4fc1@linaro.org/T/#m3b50aa43a6493f8d3b607b1607b37bf14b199f69
---
 drivers/slimbus/qcom-ngd-ctrl.c | 78 +++++++++++++++++++++++++++++++++++++++++
 drivers/slimbus/slimbus.h       | 12 +++++++
 2 files changed, 90 insertions(+)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index eb0ccb31e907..f0a402069aea 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -2,6 +2,7 @@
 // Copyright (c) 2011-2017, The Linux Foundation. All rights reserved.
 // Copyright (c) 2018, Linaro Limited
 
+#include <linux/bitfield.h>
 #include <linux/irq.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
@@ -87,6 +88,10 @@
 #define SLIM_ROOT_FREQ	24576000
 #define LADDR_RETRY	5
 
+#define SLIM_CHAN_CTRL_CMD		GENMASK(7, 6)
+#define SLIM_CHAN_CTRL_LADDR		GENMASK(4, 0)
+#define SLIM_MSG_HDR_LEN		4
+
 /* Per spec.max 40 bytes per received message */
 #define SLIM_MSGQ_BUF_LEN	40
 #define QCOM_SLIM_NGD_DESC_NUM	32
@@ -1086,6 +1091,78 @@ static int qcom_slim_ngd_enable_stream(struct slim_stream_runtime *rt)
 	return ret;
 }
 
+static int qcom_slim_ngd_disable_stream(struct slim_stream_runtime *rt)
+{
+	struct slim_device *sdev = rt->dev;
+	struct slim_controller *ctrl = sdev->ctrl;
+	struct slim_msg_txn txn = { 0 };
+	struct slim_val_inf msg = { 0 };
+	u8 wbuf[SLIM_MSGQ_BUF_LEN];
+	u8 rbuf[SLIM_MSGQ_BUF_LEN];
+	int i, ret;
+
+	txn.mt = SLIM_MSG_MT_DEST_REFERRED_USER;
+	txn.dt = SLIM_MSG_DEST_LOGICALADDR;
+	txn.la = SLIM_LA_MGR;
+	txn.ec = 0;
+	txn.msg = &msg;
+	txn.msg->num_bytes = 0;
+	txn.msg->wbuf = wbuf;
+	txn.msg->rbuf = rbuf;
+
+	for (i = 0; i < rt->num_ports; i++) {
+		struct slim_port *port = &rt->ports[i];
+
+		if (txn.msg->num_bytes == 0) {
+			wbuf[txn.msg->num_bytes++] =
+				FIELD_PREP(SLIM_CHAN_CTRL_CMD, SLIM_CH_REMOVE) |
+				FIELD_PREP(SLIM_CHAN_CTRL_LADDR, sdev->laddr);
+
+			ret = slim_alloc_txn_tid(ctrl, &txn);
+			if (ret) {
+				dev_err(&sdev->dev, "Fail to allocate TID ret:%d\n", ret);
+				return ret;
+			}
+			wbuf[txn.msg->num_bytes++] = txn.tid;
+		}
+		wbuf[txn.msg->num_bytes++] = port->ch.id;
+	}
+
+	txn.mc = SLIM_USR_MC_CHAN_CTRL;
+	txn.rl = txn.msg->num_bytes + SLIM_MSG_HDR_LEN;
+	ret = qcom_slim_ngd_xfer_msg_sync(ctrl, &txn);
+	if (ret) {
+		slim_free_txn_tid(ctrl, &txn);
+		/* Controller restarting, the channels are gone anyway */
+		if (ret == -EREMOTEIO)
+			return 0;
+		dev_err(&sdev->dev, "TX timed out: MC: 0x%x, mt: 0x%x, laddr: 0x%x, ret: %d\n",
+			txn.mc, txn.mt, sdev->laddr, ret);
+		return ret;
+	}
+
+	txn.mc = SLIM_USR_MC_RECONFIG_NOW;
+	txn.msg->num_bytes = 2;
+	wbuf[1] = sdev->laddr;
+	txn.rl = txn.msg->num_bytes + SLIM_MSG_HDR_LEN;
+
+	ret = slim_alloc_txn_tid(ctrl, &txn);
+	if (ret) {
+		dev_err(&sdev->dev, "Fail to allocate TID ret:%d\n", ret);
+		return ret;
+	}
+
+	wbuf[0] = txn.tid;
+	ret = qcom_slim_ngd_xfer_msg_sync(ctrl, &txn);
+	if (ret) {
+		slim_free_txn_tid(ctrl, &txn);
+		dev_err(&sdev->dev, "TX timed out: MC: 0x%x, mt: 0x%x, laddr: 0x%x, ret: %d\n",
+			txn.mc, txn.mt, sdev->laddr, ret);
+	}
+
+	return ret;
+}
+
 static int qcom_slim_ngd_get_laddr(struct slim_controller *ctrl,
 				   struct slim_eaddr *ea, u8 *laddr)
 {
@@ -1625,6 +1702,7 @@ static int qcom_slim_ngd_ctrl_probe(struct platform_device *pdev)
 	ctrl->ctrl.clkgear = SLIM_MAX_CLK_GEAR;
 	ctrl->ctrl.get_laddr = qcom_slim_ngd_get_laddr;
 	ctrl->ctrl.enable_stream = qcom_slim_ngd_enable_stream;
+	ctrl->ctrl.disable_stream = qcom_slim_ngd_disable_stream;
 	ctrl->ctrl.xfer_msg = qcom_slim_ngd_xfer_msg;
 	ctrl->ctrl.wakeup = NULL;
 	ctrl->state = QCOM_SLIM_NGD_CTRL_DOWN;
diff --git a/drivers/slimbus/slimbus.h b/drivers/slimbus/slimbus.h
index 3a03993c3ac8..8e34f30601d3 100644
--- a/drivers/slimbus/slimbus.h
+++ b/drivers/slimbus/slimbus.h
@@ -316,6 +316,18 @@ enum slim_transport_protocol {
 	SLIM_PROTO_EXT_HALF_DUP,
 };
 
+/**
+ * enum slim_ch_control: Channel control.
+ * @SLIM_CH_ACTIVATE: Schedules channel or group of channels in the TDM frame.
+ * @SLIM_CH_SUSPEND: Keeps the TDM schedule but halts data transfer.
+ * @SLIM_CH_REMOVE: Drops the channel or group from the TDM frame.
+ */
+enum slim_ch_control {
+	SLIM_CH_ACTIVATE,
+	SLIM_CH_SUSPEND,
+	SLIM_CH_REMOVE,
+};
+
 /**
  * struct slim_stream_runtime  - SLIMbus stream runtime instance
  *

---
base-commit: 4c253ac4b29b8c6cc6fdef8f92d4facde62e63b9
change-id: 20260803-slim-disable-stream-support-43599401607f

Best regards,
--  
Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>

