Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795719597;
	b=jA8OKfvZGbAR+NCs/AdsgduQH77j9I6BAW8iRvIVgxjyTewlqybBilREf0cD3dLhzNL9
	 hX+LINJBl205f40AlqukWlBPBwNwAkXMCLwtHwJBvExLhWAD/gufQggWCTO3LYyuvl6De
	 NoNaJSSwx8vrOMCxtNLwP0JhGckaE8edDCHwYlIMMaaAPcogd+uZVoksRZ9jFjDlGQHHj
	 HWNHjsbKDClmgT1CDfQlSeffYdIY7VziqTybVghXTbFVmOT/CoR3J1DpUQu3FRd2I30Fp
	 rH9Mmx+CZeH4QNh426sYRlQ6RADtKfobAarzuznRgW9+OReXjEmKba49NOU85KWXCSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795719597;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=/00NqReDgsN7DpEOL6VOh9ns6kcq/8uBglgUysJara0=;
	b=EPT9kAiHbkovvMqDUMscR7PIeZ3xVR1/rwovaqZLPuZvwq/NKlyknedXDCMtNnEpS8iJ
	 cX7bidjS1mAxRfqA6wrLQtEGXX9tkCz8v1ul5fvC2kTrkuhdJ2Nl0evbXhyU4i2iJts35
	 117GIp2H8fRR26bZLc/siXvx2xtP83bWYLoC3VFv3N1gzAHHVgwJk3o8DdtmxKpY5Vyj2
	 5hlu3w2vl1Q2OsNhja9lITeKRA174PQ7AO+FsCjOphk0GtVNwRJtX6kmZQ3PwuQzvVP8h
	 yEYoFROBM51307RFsBD7FECTRTXnKap3evahFfj8VxB/2UxZS+m7zvoQNC3nL8CTLdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EuCqEniA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=acmWy3sq;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7064D606A323
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 18:59:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7064D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EuCqEniA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=acmWy3sq
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQFu9k0275257
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 18:59:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/00NqReDgsN7DpEOL6VOh9ns6kcq/8uBglgUysJara0=; b=EuCqEniAuaycpS+j
	QAyhLkuo95LaWZ1vhIxVcP96OjX57gFDo+foNWMeoJQlj5vjDv/WKuOlh7xvDlVD
	3Iy2f4BnNeIOnXjudnz1p+CmNnTuT2tKhQQN/H7ORm6kgASgScdB2f/eHJTmTDaT
	5tGBhEqmfaow4nB9bd7Mi1GkGOeEj11gv4+Ga8v1u7qSwku337TrNk/m/YMXaZtE
	OY1xY8Thz67zyEtZsF6jj9B1GKlrT0kn+m8tLhvgTSSZzsiFhMS2/11XgexFWiVw
	mTAJJ0rHOFQeSqQHM54PkN1bKCqMcPDIKxD1S/eB2NfTX16C0RylWND3gdSbPJ/K
	UxMdMQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6hm8225f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 18:59:55 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-386b8624cf7so5052177eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 10:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795719594; x=1796324394; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/00NqReDgsN7DpEOL6VOh9ns6kcq/8uBglgUysJara0=;
        b=acmWy3sq5XAUOhSRIvAKpjUEuXIVAdv96s9ET7FVYcn8yRWVuapaFnGkFUNXAAzLbU
         lt1KG3ZAo1OW51krIM2BltPE6OURiMKW+u5Z9NAhTNJmZR1hVKUbDO0AGHtf0edC++0g
         cmIrR3eHPdPaBCFkBcpuCuEr7pSa6aYXCaULgPoHUxmmOdFg63EqwpRmSsJ0jxG8PlBn
         TViUEFD54aRIhz4OnHthgM6lvDXvrN948YbeJ8xLOc8WnkPWvI7+2y9EnaXZ+MGLiF+F
         b24yiNLLtdUMEJSsDCKhQ4QjiSt3YOxOvrP5arqL2pOzRRb+Q3DlMcepCqYfgZejxZkW
         i1ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795719594; x=1796324394;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/00NqReDgsN7DpEOL6VOh9ns6kcq/8uBglgUysJara0=;
        b=tR0tYr63cdepwr0Ra1707IjqroPmUwy42l30i2oMJ28acvZ6tIIjooOOEIFX3lmqI3
         4Ff2O4XabXlq3ea8g4LmqbQVzEpVK0phMbnjLHUFh1+8WV2fpmv/kvLU8j18RPJin/KC
         J46OcvuMzny3y2Hu9fLju8RATSGZ7xJ2CfMCPHvA3ESj6ppI1ioE494otiK4f7gLGiNI
         cf1S/oBGY11WbvlPyyH5fMtTK+PnTICiHVq56KSibsci7LBKplfxo9kEsdV8ts6JHlhV
         5VnF2VmoFOq5Yv1TPOntsSpqWNP7doooeB35ElKwnDIr3StxHvZk4C0f7mIuT+ptJAXx
         laRA==
X-Forwarded-Encrypted: i=1; AL+hErHXksDdI3GVdUotV0mi4sS/Srir3UZG6Fy+JmkPgR3rl6QnFLhduM+sqUfMYMv1mxXM41VICGGrMPdbPqB0@vger.kernel.org
X-Gm-Message-State: APuU4Z+Xg5lBaAeEYJgI9Y8djublJ/tSXsdSatBrSUHVlnznkRv1vXim
	PoVm+F8cMG+rB3zB6LBXnSjBDozEJhoShGmYfXpURdcrquMQtR0lcavYpNQpPHL2TyzOaxQN03O
	/DP2q60yn2dDnTpFJXnk+H1Ub0L46ZnKUvLHimaDIJ28YffJ/HVqDP3+WLhSGih0WviAx
X-Gm-Gg: AZFdTZeOB8qLUOdOHVIFXvFZdHKS63PMOI1tW3qVU7d/d2OrWcGmWgUtGivbt3yYCJh
	SAF6qNI8gnVmr0AGM0rl3f41AXzzRepCifSKmafjMq6n3gyRkN8GtK+D3KVcgN57m74zCs4THhy
	eVhOoCLoeD96ebDl9SV6zaxhfNnrK5SXkG/f/URWE5Q3sEu82GbRNcJbdZenzgHZMUgY6ts2Jvd
	oYdgks1L62oWpuBJrXA6zbMoqc2uT5t1r6UkrUSz6qlTIds4z0TfwXCoUt6Ec+T4qt6eXA+maWl
	Onm91w1CiqZEoVtUnXCg5g4J/qDENi976RYKicXLdYbrfChbTxchSkpGapc1aOjSshAV4xoal7y
	pAF4xcF9VEZyMFV46wSHrWxD9FtjgC2lZh19Sz1qvdwjWOa6hxi4XhuOlP4oPly89JRFBHYFuwD
	UB1DKT
X-Received: by 2002:a05:7022:1583:b0:1b3:a9c6:b293 with SMTP id a92af1059eb24-1b5568c0198mr23679987c88.25.1795719594260;
        Thu, 26 Nov 2026 10:59:54 -0800 (PST)
X-Received: by 2002:a05:7022:1583:b0:1b3:a9c6:b293 with SMTP id a92af1059eb24-1b5568c0198mr23679971c88.25.1795719593789;
        Thu, 26 Nov 2026 10:59:53 -0800 (PST)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ffa8csm60868190c88.7.2026.11.26.10.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:59:53 -0800 (PST)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 00:27:10 +0530
Subject: [PATCH 2/8] clk: qcom: gcc-glymur: Register set_hwmode_dev
 callback for USB, PCIe GDSCs
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
Message-Id: <20261127-usb-pcie-gdsc-suspend-v1-2-485a08ffdc6f@oss.qualcomm.com>
References: <20261127-usb-pcie-gdsc-suspend-v1-0-485a08ffdc6f@oss.qualcomm.com>
In-Reply-To: <20261127-usb-pcie-gdsc-suspend-v1-0-485a08ffdc6f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-pci@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: wNttVQU0ZnYYjeHsyrODbnf_I4vCwNaz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA3NCBTYWx0ZWRfX7u8mNG9NFlH/
 7gh6A917y9JKQPp0AstcgNTcEOtwh/FVVYE4kUd6c2nm3k4SUK99no7pltzGUYnHqvthrSNe15G
 uyC/OtBi7epp2uxTML00IrGAzFIWnuo=
X-Proofpoint-GUID: wNttVQU0ZnYYjeHsyrODbnf_I4vCwNaz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA3NCBTYWx0ZWRfXwp1dormEGHx+
 1olSDpIAxk9ChJX6FQbjSttuW1/0svvFjx5NZ+825E0ecx8+Uk2aAO8jym2YF8hX8njPTZuZUoz
 Kg01GtcekHuFxdjaSo7P6vU31XsiCnCeTE7FeCrQ/RCZrI+S9eXxjnU+jMH8/PT1/KHE+g99JCd
 x1mNp0L06QE2KyFQw5zK/XpjI0BAoKJiSG9n1AY5ggFk068GCVfVivxgI1SBCKhW4oGK91w7wIk
 Zrb1pWzEmRLRQqwtivlY76634qiD8aAGXgftnIFHq9O1w9lC24Bd6RMIMEq6j95KVus/efo5wzj
 FwUPq4QRt1/gYquuILy0QNAEYDorvKb9Sbz3xWWFWB1ookAo3YF/GJlJLMOhXs2nIiiGZMr6aaz
 zyojUTKfejBPUghYzqdbm+nbXW55b1fvh/vSii86wUvUuuhJuH1LOC3tpmpsxqNSYAp4Yb5QmXD
 ZEsd97JFyW1PcRzXLJg==
X-Authority-Analysis: v=2.4 cv=O/usLx9W c=1 sm=1 tr=0 ts=6b0881ab cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=DIGDBJpTELtvEum99LgA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_04,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260074

Register gdsc_set_hw_stay_on as set_hwmode_dev callback for USB & PCIe
GDSCs to allow the USB & PCIe consumer drivers to keep the GDSC ON based on
the requirement in USB host mode and PCIe non-D3 cold usecases. Also drop
the PWRSTS_RET_ON flag for USB GDSC's.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-glymur.c | 46 +++++++++++++++++++++++++++++++++----------
 1 file changed, 36 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/qcom/gcc-glymur.c b/drivers/clk/qcom/gcc-glymur.c
index d8d33eff419eeb9885f8560c2c7c71d542371658..73013133fa27cf0b908a8e5552a6fe981ab197d4 100644
--- a/drivers/clk/qcom/gcc-glymur.c
+++ b/drivers/clk/qcom/gcc-glymur.c
@@ -7557,6 +7557,7 @@ static struct gdsc gcc_pcie_0_tunnel_gdsc = {
 	.collapse_mask = BIT(2),
 	.pd = {
 		.name = "gcc_pcie_0_tunnel_gdsc",
+		.set_hwmode_dev = gdsc_set_hw_stay_on,
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
@@ -7571,6 +7572,7 @@ static struct gdsc gcc_pcie_1_tunnel_gdsc = {
 	.collapse_mask = BIT(1),
 	.pd = {
 		.name = "gcc_pcie_1_tunnel_gdsc",
+		.set_hwmode_dev = gdsc_set_hw_stay_on,
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
@@ -7585,6 +7587,7 @@ static struct gdsc gcc_pcie_2_tunnel_gdsc = {
 	.collapse_mask = BIT(3),
 	.pd = {
 		.name = "gcc_pcie_2_tunnel_gdsc",
+		.set_hwmode_dev = gdsc_set_hw_stay_on,
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
@@ -7599,6 +7602,7 @@ static struct gdsc gcc_pcie_3a_gdsc = {
 	.collapse_mask = BIT(4),
 	.pd = {
 		.name = "gcc_pcie_3a_gdsc",
+		.set_hwmode_dev = gdsc_set_hw_stay_on,
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
@@ -7613,6 +7617,7 @@ static struct gdsc gcc_pcie_3a_phy_gdsc = {
 	.collapse_mask = BIT(5),
 	.pd = {
 		.name = "gcc_pcie_3a_phy_gdsc",
+		.set_hwmode_dev = gdsc_set_hw_stay_on,
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
@@ -7627,6 +7632,7 @@ static struct gdsc gcc_pcie_3b_gdsc = {
 	.collapse_mask = BIT(6),
 	.pd = {
 		.name = "gcc_pcie_3b_gdsc",
+		.set_hwmode_dev = gdsc_set_hw_stay_on,
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
@@ -7641,6 +7647,7 @@ static struct gdsc gcc_pcie_3b_phy_gdsc = {
 	.collapse_mask = BIT(7),
 	.pd = {
 		.name = "gcc_pcie_3b_phy_gdsc",
+		.set_hwmode_dev = gdsc_set_hw_stay_on,
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
@@ -7655,6 +7662,7 @@ static struct gdsc gcc_pcie_4_gdsc = {
 	.collapse_mask = BIT(10),
 	.pd = {
 		.name = "gcc_pcie_4_gdsc",
+		.set_hwmode_dev = gdsc_set_hw_stay_on,
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
@@ -7669,6 +7677,7 @@ static struct gdsc gcc_pcie_4_phy_gdsc = {
 	.collapse_mask = BIT(11),
 	.pd = {
 		.name = "gcc_pcie_4_phy_gdsc",
+		.set_hwmode_dev = gdsc_set_hw_stay_on,
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
@@ -7683,6 +7692,7 @@ static struct gdsc gcc_pcie_5_gdsc = {
 	.collapse_mask = BIT(8),
 	.pd = {
 		.name = "gcc_pcie_5_gdsc",
+		.set_hwmode_dev = gdsc_set_hw_stay_on,
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
@@ -7697,6 +7707,7 @@ static struct gdsc gcc_pcie_5_phy_gdsc = {
 	.collapse_mask = BIT(9),
 	.pd = {
 		.name = "gcc_pcie_5_phy_gdsc",
+		.set_hwmode_dev = gdsc_set_hw_stay_on,
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
@@ -7711,6 +7722,7 @@ static struct gdsc gcc_pcie_6_gdsc = {
 	.collapse_mask = BIT(12),
 	.pd = {
 		.name = "gcc_pcie_6_gdsc",
+		.set_hwmode_dev = gdsc_set_hw_stay_on,
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
@@ -7725,6 +7737,7 @@ static struct gdsc gcc_pcie_6_phy_gdsc = {
 	.collapse_mask = BIT(13),
 	.pd = {
 		.name = "gcc_pcie_6_phy_gdsc",
+		.set_hwmode_dev = gdsc_set_hw_stay_on,
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
@@ -7749,8 +7762,9 @@ static struct gdsc gcc_usb20_prim_gdsc = {
 	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "gcc_usb20_prim_gdsc",
+		.set_hwmode_dev = gdsc_set_hw_stay_on,
 	},
-	.pwrsts = PWRSTS_RET_ON,
+	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -7761,8 +7775,9 @@ static struct gdsc gcc_usb30_mp_gdsc = {
 	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "gcc_usb30_mp_gdsc",
+		.set_hwmode_dev = gdsc_set_hw_stay_on,
 	},
-	.pwrsts = PWRSTS_RET_ON,
+	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -7773,8 +7788,9 @@ static struct gdsc gcc_usb30_prim_gdsc = {
 	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "gcc_usb30_prim_gdsc",
+		.set_hwmode_dev = gdsc_set_hw_stay_on,
 	},
-	.pwrsts = PWRSTS_RET_ON,
+	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -7785,8 +7801,9 @@ static struct gdsc gcc_usb30_sec_gdsc = {
 	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "gcc_usb30_sec_gdsc",
+		.set_hwmode_dev = gdsc_set_hw_stay_on,
 	},
-	.pwrsts = PWRSTS_RET_ON,
+	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -7797,8 +7814,9 @@ static struct gdsc gcc_usb30_tert_gdsc = {
 	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "gcc_usb30_tert_gdsc",
+		.set_hwmode_dev = gdsc_set_hw_stay_on,
 	},
-	.pwrsts = PWRSTS_RET_ON,
+	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -7809,8 +7827,9 @@ static struct gdsc gcc_usb3_mp_ss0_phy_gdsc = {
 	.clk_dis_wait_val = 0x2,
 	.pd = {
 		.name = "gcc_usb3_mp_ss0_phy_gdsc",
+		.set_hwmode_dev = gdsc_set_hw_stay_on,
 	},
-	.pwrsts = PWRSTS_RET_ON,
+	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -7821,8 +7840,9 @@ static struct gdsc gcc_usb3_mp_ss1_phy_gdsc = {
 	.clk_dis_wait_val = 0x2,
 	.pd = {
 		.name = "gcc_usb3_mp_ss1_phy_gdsc",
+		.set_hwmode_dev = gdsc_set_hw_stay_on,
 	},
-	.pwrsts = PWRSTS_RET_ON,
+	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -7833,6 +7853,7 @@ static struct gdsc gcc_usb4_0_gdsc = {
 	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "gcc_usb4_0_gdsc",
+		.set_hwmode_dev = gdsc_set_hw_stay_on,
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
@@ -7845,6 +7866,7 @@ static struct gdsc gcc_usb4_1_gdsc = {
 	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "gcc_usb4_1_gdsc",
+		.set_hwmode_dev = gdsc_set_hw_stay_on,
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
@@ -7857,6 +7879,7 @@ static struct gdsc gcc_usb4_2_gdsc = {
 	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "gcc_usb4_2_gdsc",
+		.set_hwmode_dev = gdsc_set_hw_stay_on,
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
@@ -7869,8 +7892,9 @@ static struct gdsc gcc_usb_0_phy_gdsc = {
 	.clk_dis_wait_val = 0x2,
 	.pd = {
 		.name = "gcc_usb_0_phy_gdsc",
+		.set_hwmode_dev = gdsc_set_hw_stay_on,
 	},
-	.pwrsts = PWRSTS_RET_ON,
+	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -7881,8 +7905,9 @@ static struct gdsc gcc_usb_1_phy_gdsc = {
 	.clk_dis_wait_val = 0x2,
 	.pd = {
 		.name = "gcc_usb_1_phy_gdsc",
+		.set_hwmode_dev = gdsc_set_hw_stay_on,
 	},
-	.pwrsts = PWRSTS_RET_ON,
+	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -7893,8 +7918,9 @@ static struct gdsc gcc_usb_2_phy_gdsc = {
 	.clk_dis_wait_val = 0x2,
 	.pd = {
 		.name = "gcc_usb_2_phy_gdsc",
+		.set_hwmode_dev = gdsc_set_hw_stay_on,
 	},
-	.pwrsts = PWRSTS_RET_ON,
+	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 

-- 
2.56.0

