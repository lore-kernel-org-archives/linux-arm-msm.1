Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F20F4071CC
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 10:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784199567; cv=none; b=bw2xdoGKkpVPyS6hqZbuILfp4LTADgUpymbR1XcHrilMSmsyQjLVxkir7UjC/POq/fx+dpkuJzn78rqigEjYTg6cWXPKAaYFbnkPMUNLJ1QzPglo1a2dqKJF61SWHMWvAlQ4AunU5q3qsXfMuzQ1bEHgXy27w5ULg/+IgtjeUaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784199567; c=relaxed/simple;
	bh=+eulYr1rGL8hjIZswSmmoq8v2VwYvYXeWvf6YAu6DuA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mM6hA9s1tLAp0+n+Ij4TYS3kTvu0hDjPdsJjnNE+gNYg13Pa5vu3oDPzQxsO6l0RkH5UU+oTfgnGzjp/Po2OYlhg3WZmUFEU06ry+zsz3/2Qyr+hPpAYWMq9UVv3MY/b4/SzMsT6mhr5wbxKwf2k11Kq5Nsv5wF+iL01fS+jrXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KlMQRV4D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ezWY6WRe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KlMQRV4D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ezWY6WRe"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G9rWfI2378114
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 10:59:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mlX5vFzSI7emLH9qB+7+fqCqTFk30mwtEhiLVLLrF3s=; b=KlMQRV4DmKtRZSVA
	KTw4q6jnpC62l+AreJWtzIM2KE+hlH6CMRw0anYM9ivWlddIpB4tHQftSyC3L0GF
	FmXskLFn7ZJbt/H/ka/yyyDCWKFsW0EmO1LS3+aowNiwnIaOOnaDQaHF+oVv5GQG
	TUAVfhEd2nkmsyIqPBYbcePGQQ35L8qj1HFGGqF4LcMTCyt3JTJqcreA2Y09mrUU
	yd6wSkTIrO0cOFvsQ73OuDmYQocDLIAP0lPWoKCC1vb20/2pJOLsMweq+kaIL4Gh
	n2Q426gmWm9IfHMcMN2iKMkukRhsPI12MyTdk1Cq6JKniXEH12Eb/9s9+v81zmCR
	MSaBlQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feuex0qdy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 10:59:25 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c88aab7c1fcso15528335a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 03:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784199564; x=1784804364; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mlX5vFzSI7emLH9qB+7+fqCqTFk30mwtEhiLVLLrF3s=;
        b=ezWY6WReZ732eH4NdDUkxqtQfbgKq8luuGiySRbABXAQT1wGDzXSSKzJZV1DhYroYO
         5ucUh4Du4bwYG1/wkZ3U0dMw/pi37yk0yb0nwCH7PGI0/n3xSOjQPJEcMZP/VSAP4uK3
         tf/CXQbBJtKP6y0b74/FYDOxGA8HwcbEvnM0zzdYGoOJzmGGCyJ6MY+B8jONz7jP6cT0
         E4fJ3e9LboUt5bYnG5f7125HBmvK/YnwUrc0abZXsW1qlEVIDVWbB8JLIy60S4QcsZam
         yoQrnWTElhiyIhosNUFby4TniAQIRy+1dfyu0w40aeR+wafSKFTfKAA8iVQICyZUTI3Y
         uX+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784199564; x=1784804364;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mlX5vFzSI7emLH9qB+7+fqCqTFk30mwtEhiLVLLrF3s=;
        b=QEGiyAknEC2/Q67Q4jkufQQGHdKrvsq8O1x3/cM0DJdmRxURs2C8S/NGBNDZcvI8by
         IF3en7FV7r4T0aUPNRtPPxTqgCm8niYn+I9aYgVxpqY6c1+t9kfMKW+mzktjy+Ab/dnj
         tQitRGfYdVE5pgPV5kdAIKvLMqRYXUluCBQlvwYlcmQ0bQPWD4T9PbyiE6dbijXg2FWN
         CCn5+FHZsi9rFVlJz5qnHaVkODsKBIh9k+kGnnK9DMxrVfx52wERP0U42RMSCRjBlAx4
         QkxDkftsTVUCnJVOyge8XOmifYZctw83SKsv7tk8obRrFvsIocy1aCBnQ42JIFGpFayf
         VnxQ==
X-Forwarded-Encrypted: i=1; AHgh+RrRh49ShhB476o8HnQAX+1GJzfNsRACFBj6cmyMWWX4NRgk2QowokHGjICEPJEwYBJdMw6yLqTPInvaqUl7@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0SuiLOQeUbKOQkt+k1cc9Dpz+5G77dpb8iBOyEaOm5ScHZhuM
	WlbeRsRwjni43ge4G7QiKISTwbrJtzPebdDPfuc9/SIR1/XYxzJhVzn1+JlZckfQVyJOt5i71fS
	2Cth0yiQLgbBE9xagpKD5VgG/stF7tEHeSXxLdKk2+ZlLFOTmhp7cPjWfJT2ZJ6+F2zux
X-Gm-Gg: AfdE7clU7ihogbDDRQ5Qv+vumMolxg98m8KkzX1V9Ryxk2tTxnQQFSCPd1rqNjBYbwR
	gr8++6VbRbQW+tFGLe9iIl6C1Ln/wLbli9PaAj5B8leQx96Mg+/6SFcPnPHLoemC6Ppr94BtPs/
	d0hUvGHX4Gj83LvbO3gc6gsWvAo+6CVwgLgnFvJTa16fwpz0mYg036cSE0Qw4LQHLL6YDB8OYqz
	l2411pvj3ui5HlXPFfIzcaaM78oVbzgd6FC/cEvTWiL7y9WJNBVMDjTHXcpwLEWgfbGs2LoMuGm
	mqTLd+OVZMqrgjPXkqKka6nyV7YgyVCU4kJdivTHxrpwTwOWzAAPsG4Pvcie61jACSzeFBkGKPK
	Bdflvjk+ln0EmlVyxzZwVN1kW
X-Received: by 2002:a05:6a21:610e:b0:3c3:954d:278d with SMTP id adf61e73a8af0-3c3954d2965mr1398180637.9.1784199564130;
        Thu, 16 Jul 2026 03:59:24 -0700 (PDT)
X-Received: by 2002:a05:6a21:610e:b0:3c3:954d:278d with SMTP id adf61e73a8af0-3c3954d2965mr1398142637.9.1784199563661;
        Thu, 16 Jul 2026 03:59:23 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13cd432e848sm11175385c88.9.2026.07.16.03.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 03:59:23 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 16:29:11 +0530
Subject: [PATCH 1/2] clk: qcom: nord: use BRANCH_HALT_SKIP for PHY pipe
 clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-b4-nord-pipe-clk-fixes-v1-1-e4f583633356@oss.qualcomm.com>
References: <20260716-b4-nord-pipe-clk-fixes-v1-0-e4f583633356@oss.qualcomm.com>
In-Reply-To: <20260716-b4-nord-pipe-clk-fixes-v1-0-e4f583633356@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=JeeMa0KV c=1 sm=1 tr=0 ts=6a58b98d cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=8Gc3ZfdGl9KvgkgJgq8A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: lzYJ4mnqSHUI2lQugG7R0HJs4jmdSDk9
X-Proofpoint-GUID: lzYJ4mnqSHUI2lQugG7R0HJs4jmdSDk9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDExMiBTYWx0ZWRfX0DEnI5A2LYfx
 aUDdpZkiwoQgFa82Q+zUStDAkr0GA9+6e13UlW2Qa6+VvYpEf8bihlkpxEEtOLXEZW9fdA4K/Nq
 IHzCzmDb1rKFXTTo3QcShcksAPrcTa4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDExMiBTYWx0ZWRfX0fur7JlKTWl2
 emlVtXZqDIWKGIK94nJUnY19JKxvKcJTaixNsBKGrk6PUe4KJzr7JH4cbC7WEO3syc+JdKPRoaX
 rIrkBmhwyspyJwt6OyB4tvendLpPxVydfM28k9FAIfsFi/aPHgtK/y1yLuRBAJ9zJb0rhlzSt06
 hrw/QR2NGskPwnL8ZkzAYjQaobXhHbVScyhUFIYsXfoh0Jw/ny0MrIIAyb8zZ0udBFqwd8omzOv
 sxy7VSjlEf3Y7xIGpyv2lmj36/XC1zV71LpTrSja4p6wfEhUTfG/2KHh9usgqA3tbfBQunMAyQs
 OwfSHVNlUObQxuLxkWKPh60j9oJp4vYDBhfDSYLgEZBB/ossVsRVfP4qZF1i8YQumPC7RMYFzCo
 0D+64JfRY4GgWs+e7OYTncgZH7lctrU0ThEqWs2Mc3G8+YmqTGZOgbg3redL28BN1nw824JuvZK
 8ERNRO1N+zyxcQRXJmg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_04,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160112

The PCIe and USB3 pipe clocks on Nord are sourced from their
respective PHYs. The halt bit for these branches does not toggle
reliably when the PHY is powered down or not yet brought up, so
polling for it with BRANCH_HALT_VOTED can spuriously time out.

Switch these pipe clock branches to BRANCH_HALT_SKIP, matching the
convention used for PHY-sourced pipe clocks elsewhere in the Qualcomm
clock drivers.

Fixes: a4f780cd5c7a ("clk: qcom: gcc: Add multiple global clock controller driver for Nord SoC")
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-nord.c   | 8 ++++----
 drivers/clk/qcom/negcc-nord.c | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/qcom/gcc-nord.c b/drivers/clk/qcom/gcc-nord.c
index 7c7c2171ac965f396a000f34dcc15a3ba185a386..970a3e1a5864aad98f3cd3efb08efc429c65e94b 100644
--- a/drivers/clk/qcom/gcc-nord.c
+++ b/drivers/clk/qcom/gcc-nord.c
@@ -701,7 +701,7 @@ static struct clk_branch gcc_pcie_a_phy_rchng_clk = {
 
 static struct clk_branch gcc_pcie_a_pipe_clk = {
 	.halt_reg = 0x49068,
-	.halt_check = BRANCH_HALT_VOTED,
+	.halt_check = BRANCH_HALT_SKIP,
 	.hwcg_reg = 0x49068,
 	.hwcg_bit = 1,
 	.clkr = {
@@ -850,7 +850,7 @@ static struct clk_branch gcc_pcie_b_phy_rchng_clk = {
 
 static struct clk_branch gcc_pcie_b_pipe_clk = {
 	.halt_reg = 0x4a068,
-	.halt_check = BRANCH_HALT_VOTED,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x9d008,
 		.enable_mask = BIT(24),
@@ -995,7 +995,7 @@ static struct clk_branch gcc_pcie_c_phy_rchng_clk = {
 
 static struct clk_branch gcc_pcie_c_pipe_clk = {
 	.halt_reg = 0x4b068,
-	.halt_check = BRANCH_HALT_VOTED,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x9d010,
 		.enable_mask = BIT(1),
@@ -1140,7 +1140,7 @@ static struct clk_branch gcc_pcie_d_phy_rchng_clk = {
 
 static struct clk_branch gcc_pcie_d_pipe_clk = {
 	.halt_reg = 0x4c068,
-	.halt_check = BRANCH_HALT_VOTED,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x9d010,
 		.enable_mask = BIT(10),
diff --git a/drivers/clk/qcom/negcc-nord.c b/drivers/clk/qcom/negcc-nord.c
index 355850a875acb0973fbbc3865f83d6e4df4c62fe..3427a0375373c6843fd6bb02e0e05e51380b15ab 100644
--- a/drivers/clk/qcom/negcc-nord.c
+++ b/drivers/clk/qcom/negcc-nord.c
@@ -1641,7 +1641,7 @@ static struct clk_branch ne_gcc_usb3_prim_phy_com_aux_clk = {
 
 static struct clk_branch ne_gcc_usb3_prim_phy_pipe_clk = {
 	.halt_reg = 0x2a074,
-	.halt_check = BRANCH_HALT_VOTED,
+	.halt_check = BRANCH_HALT_SKIP,
 	.hwcg_reg = 0x2a074,
 	.hwcg_bit = 1,
 	.clkr = {
@@ -1697,7 +1697,7 @@ static struct clk_branch ne_gcc_usb3_sec_phy_com_aux_clk = {
 
 static struct clk_branch ne_gcc_usb3_sec_phy_pipe_clk = {
 	.halt_reg = 0x2c074,
-	.halt_check = BRANCH_HALT_VOTED,
+	.halt_check = BRANCH_HALT_SKIP,
 	.hwcg_reg = 0x2c074,
 	.hwcg_bit = 1,
 	.clkr = {

-- 
2.34.1

