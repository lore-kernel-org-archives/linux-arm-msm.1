Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0123AAF62
	for <linux-arm-msm@vger.kernel.org>; Sun,  2 Aug 2026 13:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785677347; cv=none; b=ErOjU++0VXTm4dRWJG2vs/OyOHpXdZDZXReaYvkDKiaN5p2AseCEgEkaD/nA+aAI2NQ76sIJu/l1TofBz7Rt/3RPeMsuhOdgIcLwjj9HSpqJKdTgETvSukUH9PO33Ro7TWL21cGK7QrCWmQjNbbfUgwfDHn8JlL5+eIa1idWw1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785677347; c=relaxed/simple;
	bh=7j6cDbR8ZhsKS84pGfZMbp4cajWaCjf/n++4Ujh/WNg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oTF5M/bT3AL6PmbhIRXcG7k9jr6RytybAw2c1ORgCBrro3V4p6RxAE0dm5KTB7XnlZe4ejHxmvrUFSgYw2rCXMmpDQMZmtfIdY5mDbbEaVIA5N09BOawR+pGBjC0b76elKsrBUENddl4FMu3hCISJGFzIDcRimj2BbEzefq2nzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YupWv5wo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DP8ZiKV2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YupWv5wo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DP8ZiKV2"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 672B6enR1506336
	for <linux-arm-msm@vger.kernel.org>; Sun, 2 Aug 2026 13:29:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OWuFxDG3GB3vQLllt9wjhHrS9M6M8QRdIWcCeT7gxnM=; b=YupWv5wotjJbAvYj
	vJcMuyqz75lU0mKfVB8CUTBtyKB8EYy2b8Izpd40IAaDVftCdHbIfpCptPx9W6nN
	sKIuZPBPzGb3CBVSQjet13P7+dYVUGRMPSVTjigKxCPEMQyjTh7zJ5e9R/ICGeoR
	K8mSAJZC5rf1XxRMC4bAPsA0siduEGt+s4NaI45w2RXEpKZ1tNeG7973QSBy/423
	8CBUTv6TChjYKTI+OsImEG7QyPgbFcghXVQ2rlNCqcAdy5qvaYD1zSyv8G2G9v/V
	hgxrSCxNhh4kobKjCEce42ZTy+oZ/XhE1CqOneVvk3dWvOPD+eqMhkU3HDl6NAiV
	2ycF/w==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8u9avyr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 02 Aug 2026 13:29:04 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c860544c077so5974264a12.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Aug 2026 06:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785677344; x=1786282144; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OWuFxDG3GB3vQLllt9wjhHrS9M6M8QRdIWcCeT7gxnM=;
        b=DP8ZiKV2VU+NT7+JDK2KYGIzIGqHdtEwKsdup3TNLDy7GwelBApEjURrUXPAkSUtpM
         +Uk4V/sB/6meAzZRnMoYOpfzHNk5OvCfTjqCD+VNBcCYgmb1Otc7n9eg8q+rPqd448FE
         y8Y23QXwlcx9N9wM3cGtE12+WUGYFTQ7F4VV90r8f7RsW0PiUktplQsQglVvs7YRPIL1
         eOJ6DpfKMEX7vF+2AJtj0nWmTQR3f7ftN+lHR8YqgNNyVC25xr5Z2RVC2n9JpQNt8f5Y
         2ab6s6Wy+99QGPNLcnZrSOLvVDrw5UEW0JsvVJZ9qfDwlsoWlEZ2pgTHUw204GSPWsyK
         EIqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785677344; x=1786282144;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OWuFxDG3GB3vQLllt9wjhHrS9M6M8QRdIWcCeT7gxnM=;
        b=NMMpI2zZu1yRdlIyB16NyGImXARCHYtC1IX/VCkPG50EVJ+OubAzRC+OzIzRsEqdQ4
         QSw4YX6WzyYp092NLjF8p/F3Kxpn7eJsD7VwfaS7ObmxE8Wd+ami7zXh/buyVqpHnOMG
         ohvpguNY9VHjkELuw4tl3guo5ZIIbkRHSth7EXNkWzv4jpxZeX7pdW2xD5ZbadZjGuq0
         +lnBSvKN8BUbfV420MaZPtYQXMQ4svADDWNjpdN9Cj9czuQ2LNjgCVT08/eaxdxS4C1J
         0zGHkaHousjbveZwW7Q8DOrCiv1dWy/cEW33B5bheotyLje5N7+CDOEf61mqOg17ISJH
         migA==
X-Gm-Message-State: AOJu0YxgpGD6tL728rXelLJcCVpmRtihvFXXtGto98BzctbfNdioyNQh
	ACHE/N0lmnPzh+5BgcJ0iZ7FaPKuyOgbs+brsH/Fidaa6jV0/5fs49CksnGiGk0x8oh6qFW7hX6
	PgDnLPozO0C7EJXU3PnKIid4HWlz7inCGVau/yDpb5zD2c5tR9kzZFn4JpgpJVOYGIBjK
X-Gm-Gg: AR+sD13mjji2BX5eVO1flWYRz0ir/YY7KXY1B6uEFOMeRWh3lRLSINLy55+jlKCKeYv
	+zZBJg6YuRfRLlGXHr67bnJTCI4Zjp3sPN5tjCu90haFSomlGd8wgQ0rlyC4D3bQjx2pXLcU0Zm
	RJkuiMm1nkcTaeC65GmhSM1wiQm8jHEXASG9bwtdHm9T0+q7LSRFpJfIgftWadT82EucrhdkmCG
	yjCoYdc41AUytZEBXQdZVXMflgRzqIWVoSmyVStSG7ETETWib2oSQfM6UaAfypbDi72iwrssK4t
	7XYAidijLo3bO+UJAeKCci36UN6u+MpuZgv2NimfRPmgPdtathKoaW5/vzjlYuZVjM2AfeXYUTf
	WymovlAEcD3Cme3f8HBNmrBe9wetF
X-Received: by 2002:a05:6a21:1645:b0:3c0:b4f8:bbfb with SMTP id adf61e73a8af0-3c92a5e15cfmr6219880637.22.1785677344031;
        Sun, 02 Aug 2026 06:29:04 -0700 (PDT)
X-Received: by 2002:a05:6a21:1645:b0:3c0:b4f8:bbfb with SMTP id adf61e73a8af0-3c92a5e15cfmr6219853637.22.1785677343555;
        Sun, 02 Aug 2026 06:29:03 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153db2f911sm30582951eec.0.2026.08.02.06.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 06:29:03 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Sun, 02 Aug 2026 18:58:53 +0530
Subject: [PATCH 1/3] soc: qcom: rpmh-internal: fix kernel-doc issues in
 rpmh-internal.h
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260802-b4b4-rpmh-kdoc-v1-1-0f5026293d9a@oss.qualcomm.com>
References: <20260802-b4b4-rpmh-kdoc-v1-0-0f5026293d9a@oss.qualcomm.com>
In-Reply-To: <20260802-b4b4-rpmh-kdoc-v1-0-0f5026293d9a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785677338; l=2743;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=7j6cDbR8ZhsKS84pGfZMbp4cajWaCjf/n++4Ujh/WNg=;
 b=oHR5HWEUpN7YTDM6E8WgMV5IijG/Ebgr88iMrwiURxu+cVso4uG86r5NiqtZNoLQldG8iCgo+
 DYo18Dq2CO4A+lw88g00V2h8+mEQbWAbuIVqCnwToUy23iOQyijP7p6
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-GUID: dWnNTlZZI5NJMts0jX2FQD_QKbTHcHYo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAyMDExOCBTYWx0ZWRfX3Vnilvcgzvl1
 Ve7GxtT+jabZ/pdrj7+Z2E1NMU3F+oorNmwp1QX3CZSiT3AFYQhVBHZ4QFxyXmlofg8Ns2No3dl
 TlStjI0q6zWr32VYFmMFWf6WYaDfuW6dne+DO8jrKTb4gumpIDzo5nyo/X0snsVFp71J86JUpQp
 5A8A5kMHApMN1j8jUQg4c0NOFS0H7M4IHZSfaRVNJ64wZKKoJJD1QvXycj2kdkeRQO52timxmsv
 Hzo80qA1I2QjXQLf+YLftL4SoRYbKSzgsU0MsEMFrkViEQt4c66eRT7m2EF9jRdD2KmEshm5Azf
 OET39XUKduN/bPtWzcYGgcP78d0kKhSylADgsiFaUmCmOVpwfy8kSDbx/0EjprL2HqvyEWPRmv+
 m/W4xuVNfQ9jVxGFJLt8fzJ2KGyxuV0jQ2qsfcC6L7o7dUl6CUUXakOyfl2XWrBZ/VfnHJOUZVu
 l7i8Pp/UFGLcA2RenCQ==
X-Authority-Analysis: v=2.4 cv=LsCiDHdc c=1 sm=1 tr=0 ts=6a6f4620 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=h0T-4XPPwEjqpx5X2ycA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAyMDExOCBTYWx0ZWRfX7fp2NRV4u/ZK
 Z0CPkumEJudArdsWkANlAgnMD5RbFVBpJCdFg2X0gflaYzM1HolTyZsp/me/eVhbBiAODIUJw+S
 wnDtWpS9oRjrR3OaYIpp5d2f3k8CHFY=
X-Proofpoint-ORIG-GUID: dWnNTlZZI5NJMts0jX2FQD_QKbTHcHYo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608020118

kernel-doc emits two warnings for rpmh-internal.h:

  Warning: drivers/soc/qcom/rpmh-internal.h:136 struct member 'ver' not described in 'rsc_drv'
  Warning: drivers/soc/qcom/rpmh-internal.h:136 struct member 'regs' not described in 'rsc_drv'

Fix them by adding @ver and @regs entries to the struct rsc_drv
documentation.

While at it, add a missing kernel-doc block for struct rsc_ver, and
update the remaining struct kernel-doc comments (struct tcs_group,
struct rpmh_request, struct rpmh_ctrlr, struct rsc_drv) to use the
'struct name -' format documented in
Documentation/doc-guide/kernel-doc.rst.

No functional impact.

Assisted-by: Claude:claude-sonnet-5
Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 drivers/soc/qcom/rpmh-internal.h | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/qcom/rpmh-internal.h b/drivers/soc/qcom/rpmh-internal.h
index e3cf1beff803..39441a25af9b 100644
--- a/drivers/soc/qcom/rpmh-internal.h
+++ b/drivers/soc/qcom/rpmh-internal.h
@@ -20,7 +20,7 @@
 struct rsc_drv;
 
 /**
- * struct tcs_group: group of Trigger Command Sets (TCS) to send state requests
+ * struct tcs_group - group of Trigger Command Sets (TCS) to send state requests
  * to the controller
  *
  * @drv:       The controller.
@@ -53,7 +53,7 @@ struct tcs_group {
 };
 
 /**
- * struct rpmh_request: the message to be sent to rpmh-rsc
+ * struct rpmh_request - the message to be sent to rpmh-rsc
  *
  * @msg: the request
  * @cmd: the payload that will be part of the @msg
@@ -70,7 +70,7 @@ struct rpmh_request {
 };
 
 /**
- * struct rpmh_ctrlr: our representation of the controller
+ * struct rpmh_ctrlr - our representation of the controller
  *
  * @cache: the list of cached requests
  * @cache_lock: synchronize access to the cache data
@@ -84,13 +84,19 @@ struct rpmh_ctrlr {
 	struct list_head batch_cache;
 };
 
+/**
+ * struct rsc_ver - Hardware version of the RSC controller.
+ *
+ * @major: Major version number.
+ * @minor: Minor version number.
+ */
 struct rsc_ver {
 	u32 major;
 	u32 minor;
 };
 
 /**
- * struct rsc_drv: the Direct Resource Voter (DRV) of the
+ * struct rsc_drv - the Direct Resource Voter (DRV) of the
  * Resource State Coordinator controller (RSC)
  *
  * @name:               Controller identifier.
@@ -116,6 +122,8 @@ struct rsc_ver {
  *                      slot
  * @client:             Handle to the DRV's client.
  * @dev:                RSC device.
+ * @ver:                HW version of the RSC controller.
+ * @regs:               Pointer to the register offset table for this version.
  */
 struct rsc_drv {
 	const char *name;

-- 
2.43.0

