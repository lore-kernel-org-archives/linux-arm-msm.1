Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4B2334688
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 11:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787743515; cv=none; b=Tr/Y1QhM703kPc43IuszuRLYpakz6xSA3F22raLZ1nIAhufthohsH10p8S/QXOY1c4THvaY5KWpcP6g8cWKqmRbBzZKYXCJBpsIza6eAVue/q+vmRlUqEW+waj8K+PfVjivKpHCDaPQaWv+NGIrsUn8Z7miXNNSjumrJayP+rJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787743515; c=relaxed/simple;
	bh=s5UHW8nUbq/7hgmFCDIKqkQC1x8VXgcvo2BrY87L9/w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AVz4bk4/bxg6qEbpI89C8E8zjglp1dRX/TB/BFsHnnG/P5A7T+wIYNdKVhM++7vlvN3tU0dzBxybwuoB3R9wCRfcEEc0WHipeNkO+4pPqfUWpaDr3Un1q4chsxXRPqQh6dm7m1ecHNJn3zpcWAa7uxpfXrv5JjNaknakmIfcqGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GHT+zt3W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WZAJFvqD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GHT+zt3W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WZAJFvqD"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAGkcG1210057
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 11:25:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vSpMK4EcLgv
	jhrVHZv48Tx7awWhR/G6iWmu1dCEi58U=; b=GHT+zt3W/jsfOKnHfLV5wDaIXhk
	EKIlTFW/P/bf0gZ8zyNEDyb7mVR/0WqkuVgyuwkN1PBCUU5Nje/2RPOFU2dAiGsv
	Y97xL1496XW0GoFRcoai9m8oYrFajkO8lxazeTVlYeRrTVZ/R74srwFxSpPjdOu/
	RfQj6i3UrCbT40QiUbDKQNai2hC9osCylb29HXTdImTlyyyM2GdstotXHkQktjd8
	RQ9oBTvSgGdmQlDHmJfDIx8cX2IDbLDaJX5vUR5sfqNOd5XRUG/OlsO8it4JlP2a
	SLwHcObQQrZlmC6HOiIkHmviNwiIISyMQurb7WOkoHFVaxklf+KWRPrav9Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9fgxkmvw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 11:25:12 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39533bb224cso1646093a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 04:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787743512; x=1788348312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vSpMK4EcLgvjhrVHZv48Tx7awWhR/G6iWmu1dCEi58U=;
        b=WZAJFvqD7MCEyIfTFDlVo8/J0Y7bsAn6m8DjNyUYCtVcw2wfwMABBgKvOnpGnmhUSC
         Zq0WJgmGH9tmsm70uN1r4GrpkSxQnyGNUxOGQ0T+UZp+G5Cgs39A3vZQUHL3s/FaloNO
         GztRLlfkOiFO3Cn+ybF9Y1YQ67DFlDLFWctBHhVysOKfi5LdKOr8tYDW/2pmptRFGKG3
         2lRzQwTxBGR/cel/pVKypZ5e1oM7obtolid0192kyi2h/ONwn2Uy7AryB7Ieb1enka36
         oG06vn8uiR2BGUaDptw4DU9njoZAwvtMq2MnLIcEqtr17rSqmpAfcRqj3CBqznKAsxWa
         VJSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787743512; x=1788348312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vSpMK4EcLgvjhrVHZv48Tx7awWhR/G6iWmu1dCEi58U=;
        b=lhc2XARWh/UOQIRTmgm2LAE0oPDM1yHiT7m6ccyGJpifNKMrlXZDgYLsVwGHkkMGB7
         +leb/14X/1FsnC6vc/ywirvKnGHx3rIrlC+UpoSS5eqfr5xT44tSiOtSDS2ezkCPMHPI
         /dmbYJOqoTYH7G/yHYD8ROyB/HJqfsk//aR4GdcwMowmbVD9ZKdATRvjDx+6aYt26+vc
         Aldn8XauRThdo8sc1J78/RlQdOq741svUI4OxPZO9sa74EjCmHHntTLnQdfAthmvgZro
         T7W8jwaF4Mdj4cHHmEx35REjSdwh773uFMp1hSe1XB3dRkoIEQu804kg/bKMg2r83N3e
         4cpg==
X-Gm-Message-State: AFuF++k/U0pw+ZX2uWGitXheBW76haORN4GGYA3SQYzorTyz7n/jTTxZ
	8oQ5i1kxJOJjSUNczJ9rAxc+mdUMXCD0vdgEvKwpLfH19DY8PdOIYEJzqU+HYHv0Nd7gPOM+0nq
	SSErjYHe37rQwqk+iLtccc9ss5FUirsQGhZ+26b65oSncDzWm6w894AmjzWPk4vF2yuRD
X-Gm-Gg: AR+sD10Hi78nd9i4ia3lquMoKGkpvpwUO3AjuxZg+guSDmHoPvNOw3iY8Qik8aaiATo
	roFCGaTHiJi4ASa1y5mylM6sKu6wN3TNfeML4pWP/mLDiSWUEcvkcyX3aFrOmz8coASZBs3p5HS
	+MzYSijbzouJtyOkwcF2g0QsoRnHlPrOQ2ZA9sk+sRoTBCD6iUa1MdSo8u/K2xMG9x1zhwQy+pU
	7nT5FQMWxhFogYK/DCKrLr0rqj2tMTSJDBUBXLnkEOOiePDfn5EThFzUD2B9+Z7IPOobawpewu5
	L5fgnlrIgekekHTv+NvfNKLDa0l1HGqo9mvEogLlp7fR8q7/qxqt+WWEPuzSRpYMSl7lJdtmIBy
	5x+i1xtu6c+5fNr5b1ALiZQKgL/3FQF/+s3E=
X-Received: by 2002:a17:90a:d2c7:b0:38e:75f3:ad4d with SMTP id 98e67ed59e1d1-3966d1f21d1mr14435623a91.7.1787743512346;
        Wed, 26 Aug 2026 04:25:12 -0700 (PDT)
X-Received: by 2002:a17:90a:d2c7:b0:38e:75f3:ad4d with SMTP id 98e67ed59e1d1-3966d1f21d1mr14435509a91.7.1787743511876;
        Wed, 26 Aug 2026 04:25:11 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39645d31e8csm7521016a91.9.2026.08.26.04.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 04:25:11 -0700 (PDT)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sarthak Garg <sarthak.garg@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Shiraz Hashim <shiraz.hashim@oss.qualcomm.com>,
        Monish Chunara <monish.chunara@oss.qualcomm.com>
Subject: [PATCH V5 1/3] arm64: dts: qcom: monaco: Move eMMC CQE support from SoC to board DT
Date: Wed, 26 Aug 2026 16:54:54 +0530
Message-Id: <20260826112456.482982-2-monish.chunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260826112456.482982-1-monish.chunara@oss.qualcomm.com>
References: <20260826112456.482982-1-monish.chunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=MqZiLWae c=1 sm=1 tr=0 ts=6a8ecd19 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=aGigY-oVRoDAAVteN7sA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: hCdYv6vaxr_wzlBRhiF3yHL-s5aEqNKg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA5NSBTYWx0ZWRfX9IBRgipHXNhP
 Jg3cEXXsDhmkiu3uViq/v1n1df6eyCkMG4Kr60XUAV1IBPAJKHdDg3c9TRB70Gw9xlXF+xVF3Ls
 gANBbHkqDd35LpQD8/XU0R11zOS9w3vY2Rs4hB9wezkJufkI6cxaxVNSefn92LStA0wdrXavE5B
 vSEAlc6z9Ek0dEaZxLyful6VpPD8hkrf4uYXHJiSMvsnCPwqWl90ajMlbuZnovyr0dlhsZ4lhdl
 OtLNL/rknkHdClzRP0k5ERKJlQ4BCsPs9XY/VnCokr2XRHtXjEhGkTUdhgn2EAX4gvmPlChv4yG
 ua+/DvvZq9eSUmfM1Ex4uiO0a+mPDx0Ly/KoAPlY2DxR/iZQ+c74QC9k2JKpZ4WIB1+FGPkdyY1
 kFvFlWLR7dTd1hwExry1SUcIYoerkvUIAKtI4P/RLUPJ50kg4MCJABHVKIAaeSl4onJPDp4axuG
 eo9SpvtOuVa79M/YTRw==
X-Proofpoint-GUID: hCdYv6vaxr_wzlBRhiF3yHL-s5aEqNKg
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA5NSBTYWx0ZWRfX/Kg8njyKeIWl
 96llIZhXFjvweIxFkQkCSTZU4uOQsHmL7X9C1GW8KF6hxoIj2lq0VdPg9pRA+TytlMSykkeR7TX
 rZZiPj4wPBMTXxB8LTPWXDgLEhvqUYA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260095

The Monaco SoC SDHC controller supports both eMMC and SD cards. However,
the 'supports-cqe' property (Command Queue Engine) is specific to eMMC
and conflicts with SD card operation.

Remove 'supports-cqe' from the SoC device tree to ensure compatibility
with SD cards. Simultaneously, add the property explicitly to the
qcs8300-ride and monaco-monza-som board device tree, as this board uses
the controller in eMMC mode.

This ensures the SoC definition remains generic while enabling features
correctly at the board level.

Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi | 1 +
 arch/arm64/boot/dts/qcom/monaco.dtsi           | 1 -
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts      | 1 +
 3 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi b/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi
index 36af1ad2105d..a489932c7b1d 100644
--- a/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi
@@ -275,6 +275,7 @@ &sdhc_1 {
 	mmc-hs400-1_8v;
 	mmc-hs400-enhanced-strobe;
 
+	supports-cqe;
 	no-sd;
 	no-sdio;
 	non-removable;
diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index cfe39f923224..1c6d2c31820d 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -4842,7 +4842,6 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			qcom,dll-config = <0x000f64ee>;
 			qcom,ddr-config = <0x80040868>;
 			bus-width = <8>;
-			supports-cqe;
 			dma-coherent;
 
 			mmc-ddr-1_8v;
diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
index 1ff39530ea3d..4f9710587e71 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
@@ -719,6 +719,7 @@ &sdhc_1 {
 	vmmc-supply = <&vreg_l8a>;
 	vqmmc-supply = <&vreg_s4a>;
 
+	supports-cqe;
 	non-removable;
 	no-sd;
 	no-sdio;
-- 
2.34.1

