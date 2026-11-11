Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794387975;
	b=g40kKabXm2ze/9flQIByym7+VPce4M80WUpkR3BhCZ4YT3MNMIv9rvwB06AB0q45fP21
	 VD2aw9ISbyax52pU1a7nMwH9m0BkYLyVOw8Ys92vCz/L6Im+O8Mp9kraebPKp9Im6ywpY
	 jjqjTmOexaGPao2MS0oRqB2Jt569/EF60OkuBzh4xrSEC+9aiTmy1/bu2WBLuUQ7IqMq6
	 21qkFfmlMuQ/BdTL9Xf95jnNY9W+aC7c1QYr8SM5TR2+0tjd3szoPDbschZbwrpyrgtEN
	 eH7Gv1TXss3frTOyUtQj8g1lLhAzJa/xtQ8AHpZ6hzqCT7CWVippN0prdIGircOCq/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794387975;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jJ1JsynB2e3MSVjtmDprF6rlf5Tt+xzmdqIVfoB7kqw=;
	b=ZBUXyXERbdxU17sfDVu6n/eDUeYxRpfEU+LVdRyP9DjOkoo8dQ6QTyuU081hxrajDHnM
	 CCHMMq4JfDUoPbD8F8E/tgwiIlJScH7IjGq5XjKZ/mNElGrkgnPNTkrSaNPHw8UySrNDi
	 4JX5gXyjFoxx36VxnGYu05D44+3kWLR317m4ESdwT2YOr/4O3pXhauo9Mcw7vnNVHeTs0
	 47TcV9XldMIyw0btTuL6vMLR4Fav9fmDIjUEFmnKMj/K59l6kdOVpFBed0/NWBkg2DlBR
	 Bz0h7YsX8Ud7LEaaqw/Slq/iQwgQ2O82Tr3a6N6dEoWiGeUtlPDD4SSCjqcJDyMKodg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XihccjtE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=adj0M2qh;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665A3606A333
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 09:06:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 665A3606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XihccjtE;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=adj0M2qh
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB5KJFY1369038
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 09:06:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jJ1JsynB2e3MSVjtmDprF6rlf5Tt+xzmdqIVfoB7kqw=; b=XihccjtEIN4XtxKD
	vRMPl+urY7YMWjchT//9LjOj3TLDp6PLFq0YFha1dzaWMPFP9CRiyRDgtpd/gAnB
	1GLPru7S83xGrutuFDuVy8hCC+pfCWpxj7oNTkbQFxVT7ZqrbtL16PemAk/htuOl
	nNx8wKWwaren12IBtH0zD70Vwa9IotEFHctnKf2DEunE6KlM9bxGqiTj9dL+KBUv
	xiv18RWaI6hbmZ1Yvzg3x6w+htZfl31HMIo0BMb0V66EsOxoGTrP8NOwQ6l1KL5N
	1WWk489iMkHxik0aIq9dgW97tGqoukzwnRMpetLtX6s2SvGGMPmnmAGZ3bTM5s+x
	+6SUmw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvcpehxrc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 09:06:13 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso5901568eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 01:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794387972; x=1794992772; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jJ1JsynB2e3MSVjtmDprF6rlf5Tt+xzmdqIVfoB7kqw=;
        b=adj0M2qhmEUYtVevODaBhqBffFSEcvVPJzlbMmwWTRl+SbMDG7T0eaYwZTVxf5vzET
         8UfccmIoDM5BG9CwlWTCZBUGKB3iauGk+rCqAwC53DQH70pmBVNwesZn9fksj11ftM//
         kOGF3YtgI+LhgF5Y2/B+ZCIdHoHpAaPLybKAQO3OAQucGA3HRlx4lTdTOBmqmvize6sG
         /cB59DyEY9MoDXX2fYIDSju1Nr9IMmypXl6Uaw2q/kN5IfI8ugxxTrzib8jgQ0u3hOUO
         BKuJcZKIfGjacs+NlA9UiyU5Pkw/T9oSIw2BlTUMrhKUnPKA7z/TpqD+qqbxC12zVgH3
         9CDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794387972; x=1794992772;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jJ1JsynB2e3MSVjtmDprF6rlf5Tt+xzmdqIVfoB7kqw=;
        b=pjIMHNh5FnFCyG1wj2PTHLL0Tg+qvFnPJ52sPUqaWmpWDrwUqvAjGeuff3lPW7AnuZ
         AcVpvu6Qix9bfhL2Ui2TOaZMuyT2N+7deQwm2f9XgE1UTohoxEeTu39Ta09CK1EBDyRW
         f4pDBs5XL8jOUJ16OypTbeK4k54s+2DxMDQ0x3s5Kzl1llhEB1YgWqDRuFmsLoHt2qAp
         bczg+GIC93fq056nfUlP3mawFwjoSwIrA3ZAC7htB1pK5GrkOiDek4jRQxmtOO28/LHK
         c9Bv1lgYfKRTuF/0leVJkCPoIHiI6ozDMrtJgVpeZIgx+CXUfSUGu66fnmbDyYAgbduw
         84lQ==
X-Forwarded-Encrypted: i=1; AL+hErEYhfgylyp8HEcQj2GUZxLcaIXAPgcPBUP0GzXJW8DlwshIOqguHWtGQ+fS1LqquaCWswlr650KRGAyFIPo@vger.kernel.org
X-Gm-Message-State: APuU4Z91RF7DR+Z86fuk041p00qAk/Oh8LptCYp9tCL42TB/3bPtrC7f
	ezs7O15MoiCHjgyxcho/nrLgDbPFr+3h49ZW8vSne0QQpAnlvgzPg5eodhnA92k5vbas0QbwKJf
	0WXHUpfmxsj3cMMFMISnK2ujSqnhxkiRwPS6Wx1xP+5nBtFjmqkBEyRAUc19OGuduH121
X-Gm-Gg: AYBFou2aiYxdjQMIayv9wi0e/7ECEQ1SIdliblJF0ox94WzFnNfrX5VSqCNemZBN+uy
	pXurru6AXN+U3HH886Kp65qG+VvVkmosqbnD4HFAPtMs8ArYawxP91jmOTpnfu8cBqlQocOkHhj
	HowRjkNm2S00GNGKWCVrpZ4npJbaatkskTPte7k5zTujphEaHM5D1BIB35rdBZD2d/CU5U7Lo1o
	H5Vx9ypebvH9IwRpe4xBhVH2vS79jPTaU0pvRuGdO9IyQTF2r5+NL1ZleK6/VjhwktyYHwDPbMg
	mWa27LFTHyBuX24cZYAN25+Sdlanl/ypObztjZ76zcJSVZsu1WscQcaoFrS+JBctLOPA11PJYPh
	A0pr7E2TiBCSiD+A9jzvXhwHYuQ8U48bMuwQOR2F1DqFlWiNgEzhj+1hcTRzvS+K4oGnQP1yNYI
	U2WUuHdA==
X-Received: by 2002:a05:7022:3c81:b0:15a:4155:3d9a with SMTP id a92af1059eb24-1b3c03804e0mr1486655c88.47.1794387971723;
        Wed, 11 Nov 2026 01:06:11 -0800 (PST)
X-Received: by 2002:a05:7022:3c81:b0:15a:4155:3d9a with SMTP id a92af1059eb24-1b3c03804e0mr1486634c88.47.1794387970925;
        Wed, 11 Nov 2026 01:06:10 -0800 (PST)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2ff3bsm16915277c88.11.2026.11.11.01.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 01:06:10 -0800 (PST)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 14:35:16 +0530
Subject: [PATCH v2 3/3] media: qcom: iris: Fix IRQ disable depth imbalance
 on watchdog interrupt
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
Message-Id: <20261111-fix-disable-irq-safely-v2-3-8e13f68c2ef9@oss.qualcomm.com>
References: <20261111-fix-disable-irq-safely-v2-0-8e13f68c2ef9@oss.qualcomm.com>
In-Reply-To: <20261111-fix-disable-irq-safely-v2-0-8e13f68c2ef9@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Hungyu Lin <dennylin0707@gmail.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794387948; l=4319;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=Pn+BycdBF2lPz8nDDl76Efbp4QHBy13sSbzbrGaycsQ=;
 b=L+P6AIaTos40tTr5PAhIMgkr6l6HSfbthXp0pc4dep8UZVV4lNLPCMS2Q1qSUDYztGXT8bSj0
 sY901x5DMTbBKhC+8JpiO4BMQ8WKUvECnND6WIZVlLWMhHBLmioyFMY
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAzNiBTYWx0ZWRfXzJ0j1TGQKFTn
 wuHBZFAQdT9wyj8Xw7xCdnIfhqM0nwEsjSGLgnRi3aLIvjnH3vULHuOp5mXitHb+uP4QywP1gHJ
 DVmeOh1Kt7PTNl2sqV7/6r+yiQ1xOmBwRkj7vxT5yf2CwB28gAUwV04gNxtZcjKXDmBLdozjyh7
 P0e+DM7Mg6C080f4wj9MVGcCPKvQvDExEAH6oOiTthwhJTz2EB200mECzrpW2bXta79T4eL2i7s
 SMI1ejBXGdkLHVuUsLLivu/m9HJ0PfuhgWAVmdoeNpbR5q7uOAPliv1jn27G97hLbPpxIaCFGmb
 WU94R3jiHIh1TspYWUnfDSZi4mfBNEDRheVPhgLOldYktU8PFKHCH93i28TjtJS2wbPEEAGZgMH
 kZNT/lRooGY4zAsCwaKfPYoaPdZomU0E9fbkcCrW3hvEMNfgVRaEa1bar5cMmErUVmPrgnY7SME
 vc7/LQPaTBO10mBULOQ==
X-Proofpoint-ORIG-GUID: ok-d26oMoo8E5hEjBf35SkzzvcxFIfku
X-Proofpoint-GUID: ok-d26oMoo8E5hEjBf35SkzzvcxFIfku
X-Authority-Analysis: v=2.4 cv=RfAFmFtv c=1 sm=1 tr=0 ts=6af43005 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Np8CHIPbezt7dn0wI3IA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAzNiBTYWx0ZWRfX2HoonN3eYSAA
 DonKSwUgqurOveUP1ALyIV+TxgCO85uiF98aMNuPjBYqK13fBQBPAD0hB3gGmQvL2UsfKO2HBgs
 6CUx5qTFpJKZnJakbqgOX23h8q0hCag=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110036

iris_hfi_isr() disables the IRQ for every interrupt and the threaded
handler enables it again, except for a watchdog interrupt, which is left
masked until the firmware is reset. iris_vpu_power_off() decides whether
to add its own disable from core->intr_status, but that is only updated
by the threaded handler. If a watchdog interrupt is still pending when
power-off checks it, power-off adds a disable and the handler then skips
its enable, leaving the depth one higher than the single enable_irq() in
iris_vpu_power_on() can undo. The IRQ then stays disabled after the
reset and the firmware can no longer be reached.

Make the depth independent of when intr_status is read. Power-off now
always takes one disable, paired with the enable in power-on. The
threaded handler evaluates the watchdog status once under core->lock and
sets core->wdt_irq_enable_pending when it skips its enable. Power-on
drops that extra disable together with its own.

Fixes: bb8a95aa038e ("media: iris: implement power management")
Cc: stable@vger.kernel.org
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_core.h       | 2 ++
 drivers/media/platform/qcom/iris/iris_hfi_common.c | 6 +++++-
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 7 +++++--
 3 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
index 0b1b9721e6f9..1909b91deab7 100644
--- a/drivers/media/platform/qcom/iris/iris_core.h
+++ b/drivers/media/platform/qcom/iris/iris_core.h
@@ -73,6 +73,7 @@ struct qcom_ubwc_cfg_data;
  * @lock: a lock for this strucure
  * @irq_disabling: flag to indicate an IRQ-disable is in-progress
  * @irq_disable_waitqueue: waitqueue to wait for the IRQ-disable to complete
+ * @wdt_irq_enable_pending: enable_irq skipped on wdt in isr, done on power-on
  * @response_packet: a pointer to response packet from fw to driver
  * @header_id: id of packet header
  * @packet_id: id of packet
@@ -121,6 +122,7 @@ struct iris_core {
 	struct mutex				lock; /* lock for core related operations */
 	bool					irq_disabling;
 	wait_queue_head_t			irq_disable_waitqueue;
+	bool					wdt_irq_enable_pending;
 	u8					*response_packet;
 	u32					header_id;
 	u32					packet_id;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.c b/drivers/media/platform/qcom/iris/iris_hfi_common.c
index dad906d03fdc..7a2969579697 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_common.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.c
@@ -100,6 +100,7 @@ irqreturn_t iris_hfi_isr(int irq, void *data)
 irqreturn_t iris_hfi_isr_handler(int irq, void *data)
 {
 	struct iris_core *core = data;
+	int wdt_irq;
 
 	if (!core)
 		return IRQ_NONE;
@@ -107,12 +108,15 @@ irqreturn_t iris_hfi_isr_handler(int irq, void *data)
 	mutex_lock(&core->lock);
 	pm_runtime_mark_last_busy(core->dev);
 	iris_vpu_clear_interrupt(core);
+	wdt_irq = iris_vpu_watchdog(core, core->intr_status);
+	if (wdt_irq)
+		core->wdt_irq_enable_pending = true;
 	mutex_unlock(&core->lock);
 
 	if (core->hfi_sys_ops)
 		core->hfi_sys_ops->sys_hfi_response_handler(core);
 
-	if (!iris_vpu_watchdog(core, core->intr_status))
+	if (!wdt_irq)
 		enable_irq(irq);
 
 	return IRQ_HANDLED;
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index fcf060a72c4c..0ce5094c0bb9 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -244,8 +244,7 @@ static void iris_vpu_disable_irq(struct iris_core *core)
 
 void iris_vpu_power_off(struct iris_core *core)
 {
-	if (!iris_vpu_watchdog(core, core->intr_status))
-		iris_vpu_disable_irq(core);
+	iris_vpu_disable_irq(core);
 
 	iris_opp_set_rate(core->dev, 0);
 	core->iris_platform_data->vpu_ops->power_off_hw(core);
@@ -531,6 +530,10 @@ int iris_vpu_power_on(struct iris_core *core)
 
 	core->iris_platform_data->vpu_ops->interrupt_init(core);
 	core->intr_status = 0;
+	if (core->wdt_irq_enable_pending) {
+		core->wdt_irq_enable_pending = false;
+		enable_irq(core->irq);
+	}
 	enable_irq(core->irq);
 
 	return 0;

-- 
2.34.1

