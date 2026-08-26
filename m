Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E9D2F7445
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 02:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787713210; cv=none; b=fTFnFiHwgPhlUbhLOT/s4lQgdMjz5WkYpXcrjfG7fEgDxAknloDlhkAT8YrVlMNfog1oLNWUwjbF4IDfz6OLGzl1wGQe94YKF0kiueLzU/mJRlO4+4sYat6gEp1/O9geEBLteJrou/NTjPvGRXNqtw2LzpYsP09Y95VzKoaQzi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787713210; c=relaxed/simple;
	bh=emcqKjjA8YxvBvQ2yvAyxulwp8CUcuixa8oCnAus4Mw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mIeeSWanTLcDbsIUGZX+3gVKcDjxBn6V++zq+zb/5In4eLFJx0Oup9CfA8u4lajYVglnGHfrDsfS/+3V2lawEEX5E6ccWlbK7NqAGSTX8gbqeI+bVyDbY729KF0GXC4swR+/m1QZNdo3li1ntYG/LIe0rk6B/fo0nu5fJrao4Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f+XVerus; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DbMegRfM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f+XVerus";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DbMegRfM"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q06sRM4047992
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 02:59:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	poT/h+sB0f7nJwmC2wll9lgofjFV0r2P1FQJn/NzcAA=; b=f+XVerusmTIaVlOK
	vBEoqODI0zkFprH+eDIU5HCNf5SnQOgiAlcDqQ4sZz2zkel2FwgPWqORtCAh2Qx6
	YAwpOyGaFiNAoilIM2I5lZxRmqPtfn3hvWT4pBDyPVJhH1i0kh89S0cu6bl1zQUz
	1KJprbGp1mBDXMKASqPu7mJMkqOifgvOOisUdXl3bVnsyjM7vQZKR5wQseKWaNYU
	H90FlnEuaM7rr0oj90AUnnfv09lhCu5c4ZzMg8iSdmcycLh0RszORg0yyRhwegni
	BHzokS7kIZBtQQTAKu0xdYFQ/YQBgXlIULWKSG69zJ9uZFJAYVHYwFV0uCHi7rw2
	quxMcw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9fgxhqtp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 02:59:57 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc18ced1a5aso898298a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 19:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787713197; x=1788317997; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=poT/h+sB0f7nJwmC2wll9lgofjFV0r2P1FQJn/NzcAA=;
        b=DbMegRfMf0px6RWFzQnpocIaEO0t92nZmcLHpuocl9t2dg8FeEMgXP/8pbeDuZewl/
         s1WI/x0b4l9s9ImE3lDgbroP05wsApkAc0jcCFQn6Zx/4Bs4rTeE6X5tmN1OhY9khNUA
         sEXFXKxj1XyxL5zHNaNH5fZMcPR28TS4gUfJoDmxNKeJvuEvPj8Cz+i6Md3QTSpIUKVA
         RtZtl5YoR34NNIHg5uu8RN1NwbZ+M5RYiHZI/r8PYxen+aawTWIJgVwxGPuZ3D28an0m
         BGtKNGF1ikFcD1keP/eGlF2Fq08Z8kaMzgLWUchxbjbN4QRQheJN1NyzK4YkKANK+rsb
         dtnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787713197; x=1788317997;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=poT/h+sB0f7nJwmC2wll9lgofjFV0r2P1FQJn/NzcAA=;
        b=FerJ3yyfHv2bc2zyoYfraKa3kmmeKHJHu4co+sGGSrrWbg0Ckmc94hhurVUqic6GI4
         l9vImXz+LDfAbvm+O6ah48WCrxbEYV9NfgcwziLL7akK/MjPFzlbsLCzMGfnLn+lLptz
         OySkbfnxgyopoQEQvgkC48RvTkevMrSsqdONyiuwaSP4HDplxK1ugmJMpJkxWDW1G4lU
         MUZE3lGtiVHidz/nUkbK5/veZB6GRXIW2HCtAXLtKmJel5ZYn3e53IOp2SK+EtS/FUCy
         ez1xkRGsHw4K9UmbUdi5K9QVWn7B47Y6gMPk52NiLO5iZ6K1T1DcfdZsfyC+RkCEdqFF
         7cIA==
X-Forwarded-Encrypted: i=1; AHgh+RpKtv6ko+8tyFo88vFF3ScCvXbRHYI1+Y05u9kgOzd0iOFHNxXfs6+Zm02uayxXpyhbDrkDJdt+Rz2bbr+V@vger.kernel.org
X-Gm-Message-State: AFuF++nZhdI9KSZk77pbMumsjqbR7wXVxZ5fIHXAhpyF8XHnipfh2486
	PQYYig8hCp1dR5bJYFvpnuh8+OlrLNudlTghkWvMbyMowf/smCqKJGUnwK2Ubv6eqqNtieVlVCH
	FYfDevIEZ5a3oDx18a+h6n9cLAv5ZyLm+kP6cDLFy4jSHHeIjVwWLE11LbSHF8xaigWtF
X-Gm-Gg: AR+sD133c1rLe2WBba/DpkjhY6d2EXlgDMSdvBh+VkYPwZtcP/66914EpYQWRtJIyiq
	wIME+Im+XwliSQSmanygcmE22Xa4aaH9SyBiGRF50zZnRDa6CLeBU5B6fcvPjUqkLkcK5ZKhEuL
	FvARSwAkMg5pJxcPO1BQM2ueneqH9JnSewUBSZ85VgNwLfqnzrR6MEd1JKGCK2m5NZeE0boGJ00
	b2OClg0fFA6vr2eTe69GKeyDM/dXyCpEn4z7EJIj5V8shtTzLMSHY4L0fDAZTB16oscsSDEvvQ7
	Hat022ICVpIDCn8DwUvmbmw85ySAItjP8OjNkhd25sx8qH3MVHPQW12n79Ipi0rFPXWaEEtvggz
	+NX10CVA+wlZW606/b5A2ucSg4zRkm9fTAqg4198dk6UZRIM=
X-Received: by 2002:a05:6a20:a110:b0:3b2:8685:1473 with SMTP id adf61e73a8af0-3cf7674c005mr4995083637.7.1787713197369;
        Tue, 25 Aug 2026 19:59:57 -0700 (PDT)
X-Received: by 2002:a05:6a20:a110:b0:3b2:8685:1473 with SMTP id adf61e73a8af0-3cf7674c005mr4995042637.7.1787713196950;
        Tue, 25 Aug 2026 19:59:56 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a8f20036sm5222405c88.5.2026.08.25.19.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 19:59:56 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 19:59:24 -0700
Subject: [PATCH v10 5/5] arm64: defconfig: Enable QMP PCIe Multi-PHY driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260825-glymur_linkmode_0826-v10-5-56ab597d77e4@oss.qualcomm.com>
References: <20260825-glymur_linkmode_0826-v10-0-56ab597d77e4@oss.qualcomm.com>
In-Reply-To: <20260825-glymur_linkmode_0826-v10-0-56ab597d77e4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787713189; l=720;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=emcqKjjA8YxvBvQ2yvAyxulwp8CUcuixa8oCnAus4Mw=;
 b=/E/5MDBf/jPAlWuaAkTIKYYWKy32h58F5KHxUpJ1lzRwwF7IPTfb+nnJGsBLeJSNUhVAsyC61
 9OV0pCAZ+CnAlrh8BQkiiYPmt/oPjirg0ZSABziTPFBvxICv1erxXwC
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Authority-Analysis: v=2.4 cv=MqZiLWae c=1 sm=1 tr=0 ts=6a8e56ad cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=VM4cYrm8JDUZXJ7KupMA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: Nbo85UViVDqPU5-HcGpLCJf7vESb6FSc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDAyMiBTYWx0ZWRfXyhJU5heEyuM/
 HP1TvCpy6spjjAEcCPV8JH4W4Uh426+nJLC1rBrzXp3nYDox0MOA6zGpCJAx6WiDTS8yHH5Q2BW
 A3tC7eqrR+tDIAq8Wascns/666Qw2ovjVQPVsG1m3VgntM/kUOTcvkADvjdpREPAwoeztjgYcVQ
 uumD/wWM/5XqLUhIjzb7s++A4kh9SMEyxhM1XxO0ptIP3KW8XYxxp9x0Us5V/yzZ6W4qrB23oZD
 2s8sLur130ayWlx+EWC7QyPGePFFMGqCzIWcq6Ly8oOjhUf20JFov2lS4SjQ/YUqwF5AonHqUDs
 /Zhufi/MSKMQGhp9+d7G1p+Eux2Cphn4179fb4rDf+R+LBqu/BUZpOocXxpQXZaoCzGuo2QsT6e
 cVMEQvV0aVq2O4817Uae+Y0GRFdO2SZkKfHnsKkV991RDr3iGugjqQii00dh4JH8m8HalGmXudQ
 RCgbCDd5RFw4Pmkh92A==
X-Proofpoint-GUID: Nbo85UViVDqPU5-HcGpLCJf7vESb6FSc
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDAyMiBTYWx0ZWRfX/sIKTLC1F0fP
 T07Rm36dbgcp/fp6sXg0WWM5oyb3BWndPAK/dmeWQQd7nUqMDbuwRW8VriCZqTyVBOKOiHelurr
 7LtjkeeEXpzpAH9jOShznvEY6WcrfQc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_07,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260022

Enable CONFIG_PHY_QCOM_QMP_PCIE_MULTIPHY as a module to support the
shared PCIe3 PHY used by PCIe3a and PCIe3b on the Qualcomm Glymur
SoC.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 6ec8d3a69c98..3f3e68de35f2 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1778,6 +1778,7 @@ CONFIG_PHY_MTK_DP=m
 CONFIG_PHY_QCOM_EDP=m
 CONFIG_PHY_QCOM_PCIE2=m
 CONFIG_PHY_QCOM_QMP=m
+CONFIG_PHY_QCOM_QMP_PCIE_MULTIPHY=m
 CONFIG_PHY_QCOM_QUSB2=m
 CONFIG_PHY_QCOM_EUSB2_REPEATER=m
 CONFIG_PHY_QCOM_M31_USB=m

-- 
2.34.1

