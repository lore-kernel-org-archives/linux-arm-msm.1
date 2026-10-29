Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793254257;
	b=5sg/xbA86xAepVeIy0UT/xVqi9NjAuhKNafv0MAfHONMzRIIWTEaz1cd2chWLwtYT+Ca
	 8uFeQpWccI22kKSyTe1u197SSdpVPeqG3/oNMbwUgOr8ar2lX+tUY1rQ3WfXt2n33I3jI
	 //wdAd3mj3GRvm+TI8VauMvFlxg1j69Z1NUHQypmxRKkWLiHTQZXxeYRCB5HuWbD8yfpP
	 1cTh/vZYLN4XKkgiSfMcOVFIC3qIJ5+RUSYMLRH88aM0pc/gExC+uLlJcMwfYWjfXzB5s
	 66ueH3cJeiUFpIDZS11EPNBknoe/pdB3wmbXfXKKy6+QjWgp9U0dyEJpjjs2W14DM0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793254257;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OqkXXGQXY2u3txgof/2HIibvpgoKdKYBIXMTYdCD0lg=;
	b=JUShaDc1hT5wAgeYsDKmGn4xIRM/wJBZqt3xdW/NIQfspilMg/UkCzmFY2MXHKpr5dU7
	 fCU1NV4jZLZS7BaK0hDHG7ahiQGjbAXXnQuc5KyFrqKK1e4ULy44foUmS4b5pbFIW61S3
	 7kXUA9+YBWhgYyEwobSoybz1ry1o51F9UHytTNf2VCcsK5rcOK3XgJ/RCM+QW95XkxhYv
	 5XW0BgiyqVrnjl3yP71aJTFcbIu7UVDYZI4OoC8ZGsHkp89bACRG+nQMrfTQQjJbLStHl
	 EJEldYEEZrjtydGj9Bl7bkc1jmq9qyPrzz99PoKWvmuFhvITtoFrBjUEUu+VeowPQkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NVzaCnig;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kdno4uMt;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E86606A322
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 06:10:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36E86606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NVzaCnig;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kdno4uMt
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T5GmhC204348
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 06:10:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OqkXXGQXY2u3txgof/2HIibvpgoKdKYBIXMTYdCD0lg=; b=NVzaCnigFFTiqhbK
	TjBOXbFdu2y/w5TWJJIMGkE8KGyH0dqiKBL2PKDAQ31g9hvRhEhbC/fzR6iiqVL8
	156LSevJkcyUj2C8Jg9BEUPDKChFf0VLsQgXJo09S/nUC4MqrTjxlj2ChAfpy3Mj
	pWXn0RmK1Dz0kH1JwiDy6PUbPjMmvJ6I2dmLliGpYqw9ry7s+FUes9og3BQsbymw
	UdKwAVnn8wove3T/Ly0Cz6gvOikhSDNSXa5ZLChiZnArWAy68HR2FUW/fH+WJdwS
	bynmozBwb0Q+BqpLDpb7u7dQar/nOBOq02CAlhzsgFrw7Kvzc0GLlW5eYqhPzKTp
	D+mE2w==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkneutfy2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 06:10:56 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36a3451ea93so499716eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 23:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793254256; x=1793859056; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OqkXXGQXY2u3txgof/2HIibvpgoKdKYBIXMTYdCD0lg=;
        b=kdno4uMtsv8ExUEcgvbpLX8rs4jO5NDo/8EyNSJUa5ySvgiy1LWxwhIXbgjf3/ZxMR
         qQcQRYrDuJl8bjMvLQAD03FbfjBwcKiJL5RgV8H1eXTxXKSKggxf+XXV3uZPInuYfiph
         Vz6lq8k4gEuToC6jgL211Vj4BJJOfUKaqkQOz2m5c2jgFYkD622JMn3mnvVenlqxgzX+
         7xwKT3XBsVE6LC0ywweXsMvtpnWBl7k8GNehdeNLSJPbBAFVxW6gTSISMEKt0UvS++r6
         K3KbBDQeRroai8ht2gk3d8wqwEFEPaMEj9/KeoyK4s60uv0W90ZuPenOUGMy+q6o0Rdm
         PPPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793254256; x=1793859056;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OqkXXGQXY2u3txgof/2HIibvpgoKdKYBIXMTYdCD0lg=;
        b=ubVXqpA/ZBKqUw0xp6Y5zoUqVTVTTpqUd4Ztf6J/QbceTqDzR1DKcwXjMO9SC3vHBy
         dzRpHWep72+P/uJZgFaLIGB3/E87wmN20go+CZFwG+Q9WmimApy7tPM9Ak/KEz5fRMX3
         7R6eEWRBeg8MKJtJXerlmc0h7lcvdBCZ8AL8XNQo4VDNfFfgsqj1q0v+36NmVyE0hmJl
         mnB9MOxVwPm58M5cQZTCGC/EVGdZgkkaQim49K2u0I7/6u88leA5IvOwm4B+tduDWkKl
         Bz3V1MgsF060veeMPZqkpjI+Paj8hL97G51GGoTQo5leC4uR7nEc4se6hOHssIYSLv/A
         T0BA==
X-Forwarded-Encrypted: i=1; AKwUvBxBXsdUdEqfF595bT3pWMCWinos4OCKRrcuounRX9zNIGeOgctBeHL2jcl8m0nPeGlz0neSF49JPlqBpYww@vger.kernel.org
X-Gm-Message-State: AFq9FYIm6ZPByEEJwakiSQJ7+WosoRwYddY3nQiBlQqJBNio1ToK1tWW
	StXnCQ1o4Bmf2Ic8YtkVuS/EkPjfsJjw8JPf7mDXLm6a3WWLDfkBkef6ZkmBBF++kARsmYkrkJh
	WO5vwah0sJovC7KegIMvdj8rgyBENKlgMTdwmf1We3p7IfygUtiqB+XyAy52gJhSPQ+mO
X-Gm-Gg: AYBFou1PcFOGD0/HfRCLmFkAkAb+0FW50UFnH35Ol3hm3VJ17Xk2TtTGuxdP1F39zk3
	JwEf2Rw509PbdYxPk/NGLyi8xgH8QMPB+0z7Vdftd6/atRswNmMPh/ODdeYtSVfGZ7dKpLPDq8T
	d/0pnggQXKUSRfz0Tr9a4YBqmO/NIwtclrrR6gU7wjat5/vbK9N6SpCYjJZfHjikzyZ4utI7+y5
	IFLgpSsIxVpSdzQk3oeq54pmucN73pEYXG1WDjVFvXDBiSh6NyXqHy+NNLK2TtI+vLct5fmInj5
	kMN64Y1/MsexY9a41PnjG2thyrinnvLjlNhQCR8CcyQca4wqY30DELL8a/GMore4aMxKNaep/ac
	r1/TPyidQvjCJPbY5FB6TapxH//V8Ll6E9bWrOYCQHLUnnobY8bM6BJuXigaLMcc25jv71PmNxZ
	t+382galc=
X-Received: by 2002:a05:7301:618b:20b0:360:e2e6:f849 with SMTP id 5a478bee46e88-36a20138550mr6987943eec.28.1793254255572;
        Wed, 28 Oct 2026 23:10:55 -0700 (PDT)
X-Received: by 2002:a05:7301:618b:20b0:360:e2e6:f849 with SMTP id 5a478bee46e88-36a20138550mr6987923eec.28.1793254255044;
        Wed, 28 Oct 2026 23:10:55 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a239a2e29sm14038935eec.26.2026.10.28.23.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 23:10:54 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 11:40:17 +0530
Subject: [PATCH v5 2/2] PCI: qcom: Add Nord PCIe controller support
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
Message-Id: <20261029-nord-v5-2-1a13c214e89d@oss.qualcomm.com>
References: <20261029-nord-v5-0-1a13c214e89d@oss.qualcomm.com>
In-Reply-To: <20261029-nord-v5-0-1a13c214e89d@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        shengchao.guo@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793254236; l=2732;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=Lw3570OqxcQHNzId2qfQIDjwIX3tpSz51KERraFXVRY=;
 b=q4A3SHVzw8pXcYpPKZ7EfYTFSjXX8WJ6IUqaPSCknJETuUzr1JZ94wS4sHh3iDD/HxZbR6arr
 dPjsM7cs6csAC4krwRmQ7lF7v0jApg4hzk5p3bmRMqMK+Q9fKHq1uHx
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAyMyBTYWx0ZWRfXzthOo5gDgXEd
 OCA79BGTBgOXtloeNVX4VKREbJ+XISQpVccaY4sVO7k46O2HcczwXt8uPP2qYAGXEgiJplaNDzk
 yK9lS8VVTlMsVuCo8AHXjnR1IaFuarNOUmko7Ftuibq3wHcmRpiaLwC3sn6s7MoNSwJrSxjxJ5o
 rdtSZGqqM07mrRVObc7w7sedezklswtnRMoyfK7iJYj86aIoBIUUWRjgrpUndJ8QV5RPNR9aziz
 l54xHbZLh2/i0gbkwPavIHF0GD2qfwUPmH4XW8oTN7dYLMq7GT85AykBLg4pp+5HfwfWHO+Ak4q
 xjonSn7IcJL7iCXHfhbcsLEUdnjdEu6zJixysG6zL3LkOw0+ED9g8vkN8M5+a54A7a+tTqhX1Tn
 X/5AdV+1+NIktll8VqY+wuHuJQk9Syz7mFBY6H0iYO4UcWw29STKYi5F55SNFTIJgHuJtpJr10I
 6mC4zF+uCWMiMS+Kc5A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAyMyBTYWx0ZWRfX5Ctf2+A8qvkP
 F3PzO3xVV80SxCeiN6L7hvgVUgfyUcfoTDwRUQm5IaZ7+/oK9Ui57LhvjLLmLPc7tYHFlzNC56+
 3WdLsdU4PC2pVdw5Hqruiv3sXIEak/Q=
X-Authority-Analysis: v=2.4 cv=LoAHWXdc c=1 sm=1 tr=0 ts=6ae2e370 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=fhppCylznReUS4Xj7DkA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: nHeEHRzUnWu4zXkUNXrUCFnzIx-1MfNy
X-Proofpoint-ORIG-GUID: nHeEHRzUnWu4zXkUNXrUCFnzIx-1MfNy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290023

Add the Nord PCIe controller configuration and the platform-specific
settings required for correct operation.

Nord requires the NO_SNOOP override and L0s to be disabled. It also
requires a clock-gating-control (CGC) workaround to address a PCIe
power-domain timing-convergence issue. Set the CORE_CLK_CGC_DIS and
AUX_PWR_DET bits in PARF_SYS_CTRL after controller initialization.
The SLV_ACLK_CGC_DIS bit is already configured by hardware reset.

This behavior is documented in the private QCTDD11972446 erratum,
which is not publicly available.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Tested-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index d903f10211c2..c62abfc7a446 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -300,6 +300,7 @@ struct qcom_pcie_cfg {
 	bool override_no_snoop;
 	bool firmware_managed;
 	bool no_l0s;
+	bool disable_cgc;
 };
 
 struct qcom_pcie_perst {
@@ -1138,11 +1139,18 @@ static int qcom_pcie_init_2_7_0(struct qcom_pcie *pcie)
 static int qcom_pcie_post_init_2_7_0(struct qcom_pcie *pcie)
 {
 	const struct qcom_pcie_cfg *pcie_cfg = pcie->cfg;
+	u32 val;
 
 	if (pcie_cfg->override_no_snoop)
 		writel(WR_NO_SNOOP_OVERRIDE_EN | RD_NO_SNOOP_OVERRIDE_EN,
 				pcie->parf + PARF_NO_SNOOP_OVERRIDE);
 
+	if (pcie_cfg->disable_cgc) {
+		val = readl(pcie->parf + PARF_SYS_CTRL);
+		val |= CORE_CLK_CGC_DIS | AUX_PWR_DET;
+		writel(val, pcie->parf + PARF_SYS_CTRL);
+	}
+
 	qcom_pcie_set_slot_cap(pcie->pci);
 
 	qcom_pcie_init_outbound_blocker(pcie);
@@ -1725,6 +1733,13 @@ static const struct qcom_pcie_cfg cfg_2_9_0 = {
 	.ops = &ops_2_9_0,
 };
 
+static const struct qcom_pcie_cfg cfg_nord = {
+	.ops = &ops_1_9_0,
+	.override_no_snoop = true,
+	.no_l0s = true,
+	.disable_cgc = true,
+};
+
 static const struct qcom_pcie_cfg cfg_sc8280xp = {
 	.ops = &ops_1_21_0,
 	.no_l0s = true,
@@ -2586,6 +2601,7 @@ static int qcom_pcie_resume_noirq(struct device *dev)
 
 static const struct of_device_id qcom_pcie_match[] = {
 	{ .compatible = "qcom,hawi-pcie", .data = &cfg_1_9_0 },
+	{ .compatible = "qcom,nord-pcie", .data = &cfg_nord },
 	{ .compatible = "qcom,pcie-apq8064", .data = &cfg_2_1_0 },
 	{ .compatible = "qcom,pcie-apq8084", .data = &cfg_1_0_0 },
 	{ .compatible = "qcom,pcie-ipq4019", .data = &cfg_2_4_0 },

-- 
2.34.1

