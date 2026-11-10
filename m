Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794286616;
	b=FLYpqfC3Yoq6DYn7zW5HRk//xN01NMqEBsQrOahamZK6yJxmCux/HiVwin+126rQo02i
	 Xxvj636tgIq+EQxnmL4Zb6awZsAgktUSYZ5NElI+UrACHASeOgcI6i03bXxFDwqCaztKy
	 X3s53kaL4CHcx57fcSuJn/PLEk8o03p5vuzZgXcl4aBDmsWJBBXaGqa/yR8qdlhqvbZp/
	 nRmqjE0j8psZoaOXkSci0qgX6XnTFwCiaImyoDFXIM2y2kjuD5cT742mQiA9OqGuRHBrz
	 ulr6j5E2jhxpVq47YoZ/tP3ZZxf3dbtkflpaA4C/t9sH/8c59qh3hTFhMlUv/w/4j/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794286616;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kGmOSxaugPIJYRGrz5sk5TBB1f5tCohgbLSqz9Wr2Ns=;
	b=EYyaNi5dIJWvJMvkEjCnzL2mrNS0u/2um5/8vyxOJy8zRng+JJtN2IoJwzCNHctkCbsq
	 nGPE0hCjDr3xXzbSLoYFymip9/2oNs7ZJ5yCHPjL/RAR/G2DAiWyM1ZPA4ku/j7YUbOjO
	 vsb1F7Rzx7foyhD9GZ1EgS2sEnIi+E3PTnt4YhhfcWo1vz39W3t2PxmLGNpHctzmdZxs3
	 A3c3jZCU5kj3mQ/begJ0rMMvihEV32ivaYuF5uUzMhrlNZfZHH3+wZNPzcN8ncJJyLXcj
	 VLZs2zCMJ6AJnAKt5VfJruul4mnflVqVARsg3GNh2utQMAF5of37Gagbb8CEouvjAXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UhcPBz+J;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OshgpFUk;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BBF260A2636
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 04:56:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BBF260A2636
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UhcPBz+J;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OshgpFUk
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA49tmx1767193
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 04:56:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kGmOSxaugPIJYRGrz5sk5TBB1f5tCohgbLSqz9Wr2Ns=; b=UhcPBz+JTBasQSnT
	u5bsN9sKpht/QgsQk3IGSI49Z9aBYzIj2BSTrDCzhQMpreBYkqzBEwC2Vwd3VjyG
	vXCBSBGQ8m2adoWODA1ZhF7s0ysaliQC1siVGtJnUoY4J/9zLiMAWkZy6OS9q6kT
	U4gAM58xQoi+YWCpoGUoUVvDPJuS6H2jwkNTF2VZIsB4IF1uKW/Mdrp4Er8j6tUj
	vl9XM7ybuCNl3fFcvEMf+3LjO8QQPy6MHfp4WzzTJlQvklRDqwJxJrBFtCtpPxHP
	S8vE7EgoRhwRLwOkTiDG2MriYhCNYxr+XdUM9Dt/Ag+hETmcbIH8UK5V8xC9Xi9k
	l21MSg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huucp097h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 04:56:54 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91eb05c8241so31207056d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 20:56:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794286614; x=1794891414; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kGmOSxaugPIJYRGrz5sk5TBB1f5tCohgbLSqz9Wr2Ns=;
        b=OshgpFUkPhzW//s1i6TjZRM52G0cIJ/v9e2PNWk3YgkxBmixSWmW8KwpRo2ZOrSpRB
         DY+qquKngEZ6TK7LBhhVd1LAwqLJaRVwS29DuIkBzVyKRruXoBCCfBNAxKQr495YPwY/
         LxJyMgjSWJigqfByQciCUelsQE/o47M0IbketdnOodEso9Oc8EfJbVARjBPWNYMI5sy5
         EphyezuiyZuUO8AoqFqzlp/OstMhFApLANwp8c+/rXYReyJEr2JgFwHgutzMuhBk16k6
         UZ8CdMOBD3TPxgD4TxYgAbYDSJi/pYY8ObpiyGPFb9vJmkgTfFE0G111R9zoUAUfmqiE
         VlmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794286614; x=1794891414;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kGmOSxaugPIJYRGrz5sk5TBB1f5tCohgbLSqz9Wr2Ns=;
        b=xsgCahPr2HG0h81IQq0wHBP0xgbERpZ/0sWmKqfa1P7DZwZmcwtDDlso8A091XnLCc
         PzNCZbzZn2QgpqdB83GVU08T1Rg6ORPYxmnA0BPL3Px+SLZPX63RXsljKrJqhnm3HdKW
         cM53meVI4D39wlCOxNN8FmLXEgkxy0EtCDGOaWOoLRqiTYUQX8yVgFOKPcUm9tbu7QMZ
         UXxs4UmTHgkhrKxahWLPSrweZirXJoJQv5FfdacrlQ+awDF3ZTARYToPLrzt1RLxCXhj
         iY0EprkR5CCluG5lsjnR1zJ8ob4Y0STI1G8wYM7FU9h+xfNcKcjZv38l1PyIwHkb/UVI
         Q50g==
X-Gm-Message-State: APuU4Z8FmcqRac/MnETqbWfZHXA+vI+dHaXO5Agiv4fYeYs3BSbrRFht
	FODrfVxb5saBoxarvB0KXKSYr0Y0tMGwLJl7JldBaEkotrgZljHJwxl2DHb2TM3XacB0eMro40z
	JX9rRmXLTf8gnP62GWzKu/GIeZUPp1m826X8xQf4jERslq0Hu9yAC5WP6P01WDWL6Y1+t/cOXwq
	FJslU=
X-Gm-Gg: AYBFou2SAbxWEp6F2k/4GcoVkA/yIvyj3FjjSF1j2wfSBF/1fN3xLt3lllgpro1Fpdx
	uhtd1Vdt6T2enI50uuPq8fn6L0HypGeTeGMb/aYsbiDb3VeZYYA1Or2k109a39WLnQEAxoj1SgH
	bvGF9J/5kkRvtMa9S8MS9pYEUmdIFYp7bbRs6WF31W5VtiocSXVSfsxwscdL+GOwNuhVY664rfS
	3HbC0kWQ61KL4gEzDpjzcUj7lbfkO4pLvT7hVUSOkXFiW+FNVNtvkPdp7C3QZ1UDzTaRf2NJX04
	iAmvp7ihgkH90HMlfhAT30q92Fb3isSwEhcR/7EkEdpzaIYkwvV/h/7Xg7EGQSms7cEzYqlalVs
	Du8QBDYYgLmzf88/Q9SE1fAFyXHwjb1r05jxl73mwOlhBozo7rBJEKnICLzFEJ62nXdKl39hFLX
	Pej9xTsXq0gxMRMDC04o1nb6hhd8eMZZkEo0Dz
X-Received: by 2002:a05:620a:3194:b0:93f:1936:b229 with SMTP id af79cd13be357-9479f415639mr260385185a.77.1794286613920;
        Mon, 09 Nov 2026 20:56:53 -0800 (PST)
X-Received: by 2002:a05:620a:3194:b0:93f:1936:b229 with SMTP id af79cd13be357-9479f415639mr260381785a.77.1794286613468;
        Mon, 09 Nov 2026 20:56:53 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e73b2d2sm138653985a.10.2026.11.09.20.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:56:53 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 12:54:50 +0800
Subject: [PATCH v8 29/29] soc: qcom: pmic-glink-altmode: skip retimer reset
 on DP IRQ
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
Message-Id: <20261110-msm-dp-mst-v8-29-d040fb33db5f@oss.qualcomm.com>
References: <20261110-msm-dp-mst-v8-0-d040fb33db5f@oss.qualcomm.com>
In-Reply-To: <20261110-msm-dp-mst-v8-0-d040fb33db5f@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794286469; l=4115;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=6r0ejZlAtNiiuitmrFYzWgKZtKiCeBVKShHo1hB4+8c=;
 b=iOicxdJg8ziVZ+cp1bR3ru9Ky94fiUlHfpjmXgRiOzxB9jxEeGwu2qB+KpGq98y/UqFs+tMj5
 3gmwhVWZ2+pDIMzRE7Ud8+HPiIovAUOWjuCRGFvt/VR5AbsV3A+iw1X
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-ORIG-GUID: TLwdFaep0_EuyrVObYCODGB4uwYiEgPH
X-Authority-Analysis: v=2.4 cv=U4oHnuru c=1 sm=1 tr=0 ts=6af2a416 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=rzLW7fUJNTnmvIt_Je4A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxOSBTYWx0ZWRfX9VUOkDbgCDqA
 yYCQVCvS2HiMic1XLCA4tqq+MWlO0kHoCGtvHrayrmV450AXAJn5Ah5qboESrKYbLG7K6wAu01x
 Cg9e+r9zUnegze6PAVoBWEfLQvJnrFJgSt7F7CKSPjMeBtOU2Q9oCpCnZwEycin79lRIJ1av8XC
 NUC3tfx7vX6ZVrJjxNj+vdfpO2E/lhR/0fHRnvs3hrvcowxSsu6zlC/q6FVziJgg4Kmlg8oQbkc
 mq3eI55MkGZyEii293s+tLD/dvk4pRPcBNOjW2LK4NIMxpkuFvNe/kVb5XxA5m9fUUojCums5ex
 +jomphCO/4yTYobhCTjLbeC9K2/TuEdOQM7XAx+PPeAV59HacJrffH2Wo2jODamJY6QMNN+3PfF
 P387qoYulVrBHmyniq0MEWILdSXsKP4bEsSwo6TAkujR5ZxdhGWnzDsVd8JDUgD8C1qkXk3irNt
 OaPpizIHtper4WyN82Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxOSBTYWx0ZWRfX3JiZYGCRd4Xt
 gFcYk2OGMywc2MlaUOBgLA64e1AsVD82esZL7K5l9JM0kGDMSGpS55Aw3sddG85kTx9h/Vk5jue
 BHsYWGDm9ZKJBr5u9rMMVeNRS9rjyWA=
X-Proofpoint-GUID: TLwdFaep0_EuyrVObYCODGB4uwYiEgPH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100019

A DP HPD IRQ reports a sink-side event and does not imply a Type-C
routing change. Reprogramming the retimer for every IRQ can reset or
disturb its datapath while link training or video transmission is in
progress, causing intermittent DisplayPort link failures.

Cache the successfully programmed DP retimer mode, HPD level, and
orientation. When an IRQ arrives with the same state, leave the retimer
untouched while continuing to notify DRM so MST sink IRQ handling is
preserved. Invalidate the cache on non-DP modes and after a failed retimer
update so later DP transitions are always configured.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/soc/qcom/pmic_glink_altmode.c | 38 ++++++++++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
index e903d4910e9c..5ae554dc01d9 100644
--- a/drivers/soc/qcom/pmic_glink_altmode.c
+++ b/drivers/soc/qcom/pmic_glink_altmode.c
@@ -121,6 +121,12 @@ struct pmic_glink_altmode_port {
 	u8 hpd_state;
 	u8 hpd_irq;
 	u8 mux_ctrl;
+
+	/* Last DP state successfully programmed into the retimer. */
+	bool retimer_dp_valid;
+	u8 retimer_dp_mode;
+	bool retimer_dp_hpd_state;
+	enum typec_orientation retimer_dp_orientation;
 };
 
 #define work_to_altmode(w) container_of((w), struct pmic_glink_altmode, enable_work)
@@ -180,6 +186,7 @@ static void pmic_glink_altmode_enable_dp(struct pmic_glink_altmode *altmode,
 					 bool hpd_irq)
 {
 	struct typec_displayport_data dp_data = {};
+	bool retimer_state_unchanged;
 	int ret;
 
 	dp_data.status = DP_STATUS_ENABLED;
@@ -200,10 +207,31 @@ static void pmic_glink_altmode_enable_dp(struct pmic_glink_altmode *altmode,
 	port->retimer_state.alt = &port->dp_alt;
 	port->retimer_state.data = &dp_data;
 	port->retimer_state.mode = TYPEC_MODAL_STATE(mode);
+	retimer_state_unchanged = port->retimer_dp_valid &&
+		port->retimer_dp_mode == mode &&
+		port->retimer_dp_hpd_state == hpd_state &&
+		port->retimer_dp_orientation == port->orientation;
+
+	/*
+	 * An HPD IRQ is a sink-side DP interrupt, not a Type-C routing change.
+	 * Avoid rewriting an already configured retimer while DP link training or
+	 * video transmission is in progress. The DRM HPD IRQ notification below
+	 * is deliberately still delivered.
+	 */
+	if (hpd_irq && retimer_state_unchanged)
+		return;
 
 	ret = typec_retimer_set(port->typec_retimer, &port->retimer_state);
-	if (ret)
+	if (ret) {
+		/* A failed write may have left the retimer only partly configured. */
+		port->retimer_dp_valid = false;
 		dev_err(altmode->dev, "failed to setup retimer to DP: %d\n", ret);
+	} else {
+		port->retimer_dp_valid = true;
+		port->retimer_dp_mode = mode;
+		port->retimer_dp_hpd_state = hpd_state;
+		port->retimer_dp_orientation = port->orientation;
+	}
 }
 
 static void pmic_glink_altmode_enable_tbt(struct pmic_glink_altmode *altmode,
@@ -214,6 +242,8 @@ static void pmic_glink_altmode_enable_tbt(struct pmic_glink_altmode *altmode,
 	u32 cable_speed;
 	int ret;
 
+	port->retimer_dp_valid = false;
+
 	/* Device Discover Mode VDO */
 	tbt_data.device_mode = TBT_MODE;
 	tbt_data.device_mode |= TBT_SET_ADAPTER(TBT_ADAPTER_TBT3);
@@ -271,6 +301,8 @@ static void pmic_glink_altmode_enable_usb4(struct pmic_glink_altmode *altmode,
 	struct enter_usb_data data = {};
 	int ret;
 
+	port->retimer_dp_valid = false;
+
 	data.eudo = FIELD_PREP(EUDO_USB_MODE_MASK, EUDO_USB_MODE_USB4);
 
 	if (tbt->usb_speed == 0) {
@@ -307,6 +339,8 @@ static void pmic_glink_altmode_enable_usb(struct pmic_glink_altmode *altmode,
 {
 	int ret;
 
+	port->retimer_dp_valid = false;
+
 	port->state.alt = NULL;
 	port->state.data = NULL;
 	port->state.mode = TYPEC_STATE_USB;
@@ -329,6 +363,8 @@ static void pmic_glink_altmode_safe(struct pmic_glink_altmode *altmode,
 {
 	int ret;
 
+	port->retimer_dp_valid = false;
+
 	port->state.alt = NULL;
 	port->state.data = NULL;
 	port->state.mode = TYPEC_STATE_SAFE;

-- 
2.43.0

