Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A086301709
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 02:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787713199; cv=none; b=daJbxWNp63sKtcBmf+LUL3Wt6TbUZJ13r6bU8LpTNiWFZNXycI7BKi41Yk+5q91BPPMva+QNA70a5Vd0rzDlHj9Nra/K+VNr/40nxMiZ6CPIZq3sPwA+6mFm9gNshfRu7X2p87o2+f6ZkGahqsXS3Yp1BBYO76hVxqxNMsdBdWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787713199; c=relaxed/simple;
	bh=pP32dsetZWgM8R4IBALdBlOECNOx2UcifVPZjkl82BU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nSplU3bZvaMzaTtknKr8Cf7npSLkv2YIQMBiPegu/yXSA1Y30A1T7+q6eUzso5klo8RnAe1W7hJ3yZPNpibfmidSJmRrKqm5YtbSC7MS/y5s9bE/8F4Pj8DvJPh706dSOuAcbfeGE69iEfNJAUYedMLHLBWZQGQ91VIuTBH5Tes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M8pZyrxr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dQK5sJ1f; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M8pZyrxr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dQK5sJ1f"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q06ldc302118
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 02:59:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zQeJ/yzXl35XsMHXzqnQsqjHiyjdbJeL/aUV0l/0acE=; b=M8pZyrxrUt3C4ivX
	vQFlCLFOZzBngnNjMhYpK5Tp2sqAwgTC8EnPKwoANTCnxeKYe0V7FUsIS8KTLxi9
	keqPhVaEFGpOqqsVScBY/wToy9ZPtSX2qAL8z/JF7uFAssda+yIHBUIdQUwVflU6
	UL8uu7HuH78YS1IW907dP79pemCOG7sv3oXgPe79Ru5qx5jCy9FnP9D0bERwuPUr
	ziENf8LPTsWcqej4K/p/8h1bc6EEUhlWIN6APHVg8JW2RGs3jgIqMJUKwcxrxpRQ
	C158FvDXJFlXmruTqBcpqY/qjdRyvowAUV8SEUQLHvrbZCYZIMySi70FG2wRM4nc
	5XeKgw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9bnjaxw3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 02:59:56 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84842381150so559386b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 19:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787713196; x=1788317996; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zQeJ/yzXl35XsMHXzqnQsqjHiyjdbJeL/aUV0l/0acE=;
        b=dQK5sJ1f1OUtuDPpkGuowtAatd7FN7rgZnwr5JX6Uyh5JH2PdBanh1/RL/YIjHTVdr
         fl622DNLCB6NhVR1Lt0P+UObD7LcPCAhohEucIQYszpDOzgyXibMy+HGLmTus7wbwyE+
         hE8vPg0bxjM3KdsCWMRky64EW7UEkfSbeLD8biPLFVKirCFpdRIkeM6HZo4CtM2uZCqb
         yxQmMPK0GI5/2JMqGlAnEgglArrGtV6f5LmcGYgcnJBvkyuLJ9NRlVbJwwAcrFacPoK+
         dLLlNFoCEugd323f+YrY+mw9qeAdqV8w3R1a/LVHUuKvE2i1A4k0c9ETLzj90JMXUSSl
         rPag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787713196; x=1788317996;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zQeJ/yzXl35XsMHXzqnQsqjHiyjdbJeL/aUV0l/0acE=;
        b=LU0580JLlkZrJ62P+4P7Qb4izeOpe7Sx029VPad9NJQiVa0NBUUVbQqCjFK6Z080nW
         iHhFRuoY97ljwCY/OswdNzzFEm0p5bkWXNdT5yVKs07X3b8LXNF9k7hM1eZcI8OEZicA
         dqjsOXZnbxVSPJOSTFf+fm+17als0OQ3pHmsNHiTap8jKpqLD/IdW+0atQ1oAMr2F42L
         VN16/3Y5AOsnyf+R3vAy/5aK4g9JMCimsrXZ+pR0Hb/a8n6rrULUJsTtMZILZHeg0h+h
         5WK5OLDS7F3100Oxi3m3d1QENj7Zhz2wFxko+mtlpXnKgm0Q0eW4tcE3Rk8XJ6f9GfwO
         pkBQ==
X-Forwarded-Encrypted: i=1; AHgh+RrCUeWsvZ+Vof/AUfd2eRFh7SCWiHyCj93Pb2WlAtugUHRj9sDXpDMlDTAjY8mBlGIYWqi85kdkG9XKShoz@vger.kernel.org
X-Gm-Message-State: AFuF++nDSJtOoxLwy6mPa5LwGE+g9W69ldlCbfDV/FaERHOpFNjVzH/4
	eDO0lK2oEL0+9QOqZsblHoldKGUCoFGAj1DGi7ho1n2tLXZlT/BRERvaaluXtXCeMvEUJF0wXqM
	avflkRQKHOiFTlNNj4GSvBJGYkL0dwOLvH/fY6aInwxAvFLGrorUqAd2MN6csyyehxYih
X-Gm-Gg: AR+sD10/CnJZ5uvsuLnAQg2WCx0St4TuHlMLuks3bTn+zk69dpZCa1aewmnh5508+PD
	OGxhnIDpMnQc0+iGYH8LCoLvEVcuNXHAqpPNs+5LqMV7ijkAu7sl+xu2cY+SkBpVuMU72LQVdxY
	vXMAsDfpS+8y6+tdJapChgz21+lgzNRUfUff51J3Snno54NBo5SRHNUoU20GVcNfb5XxCDV3fN6
	RDdZ2VccCNGHtK5DXxVsutSoVgA7bzzV6rXJFaMbAmCUFRL5LdUDaO67Q6rzTCkqAWWQ1JCjPja
	DaLmDxCouiFrD3tMInzTfhAFc/zXE7e6qXnLvu/P1VayQ0Hao1reQFZo+oPXebaDiADsN9FizzU
	UErJapRkuRoDXwJYhrUUN8DeHVDu4blcvTg9Kw1oTYagnDtQ=
X-Received: by 2002:a05:6a21:2290:b0:3cc:3d08:da3e with SMTP id adf61e73a8af0-3cf76286186mr6726808637.2.1787713196188;
        Tue, 25 Aug 2026 19:59:56 -0700 (PDT)
X-Received: by 2002:a05:6a21:2290:b0:3cc:3d08:da3e with SMTP id adf61e73a8af0-3cf76286186mr6726717637.2.1787713195706;
        Tue, 25 Aug 2026 19:59:55 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a8f20036sm5222405c88.5.2026.08.25.19.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 19:59:55 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 19:59:23 -0700
Subject: [PATCH v10 4/5] arm64: dts: qcom: mahua-crd: Add PHY supplies for
 pcie3b_phy
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260825-glymur_linkmode_0826-v10-4-56ab597d77e4@oss.qualcomm.com>
References: <20260825-glymur_linkmode_0826-v10-0-56ab597d77e4@oss.qualcomm.com>
In-Reply-To: <20260825-glymur_linkmode_0826-v10-0-56ab597d77e4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787713189; l=983;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=pP32dsetZWgM8R4IBALdBlOECNOx2UcifVPZjkl82BU=;
 b=IwcUX2OJ7/ZcU4sivPSVb929hN1zLaHuUZgeOWnKbQrlURS6QXhlfrgQdiNrdahWqaZEIN4LW
 v6S9XINQPDvDdsGXfFMi47hiOseaJnjsbJAOSwsWKmpAe6dlF5NOv8/
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-GUID: YGgMe1YfyZmT2YLD902CnFeMdFPkp4-q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDAyMiBTYWx0ZWRfX0DsVjGidt8yI
 /gDHJjRQ94fjyGOjMr6rPNecBl1mCTnoXAo7lQWkDMeV5/MJ9rROTbwa7x5AzsDZfco5pFWH37m
 EekBCHvyMYJZ7ngwDWsinKrZv4stX4h+7GyZy8BG5vzpkeU2qSs8HWRowq5dABZrZGEOfNTdDym
 kxEtceagyjZck6C0AOV0wslx0zp7ojlTmr48eO4uTjx1bQxmIX9sJxNoftLYkaMK0J1lCwRgOjM
 0/MBfl8s3G1yfKEaLe5FMeiKbwu6ZQJbxBe+IU2Q9+hWRlvzVoWmoBr3jxeok5kb8013TKRoVLX
 4DM/I32hOQOvUf5zqj32sjUaDholHzgwCT/y2IxSzLF+VnhfXuWHmeNhZQBIX1ZU/hE8NNu7tB5
 4rGlxMOHnLNQLqtU7WNZDuRaGtz75jielWfxKMB5uBM60/5Kw0XkL0E3XkWfuQnJUURaOrIFogC
 a2eOyArysuP9d0qHutA==
X-Authority-Analysis: v=2.4 cv=ZuHd7d7G c=1 sm=1 tr=0 ts=6a8e56ac cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=PkXiIDIAJHO3iIiOwRMA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDAyMiBTYWx0ZWRfX+bVBBnVNj7YO
 rnOEQN87zB7S8FjZrIw+Q4lJX0YgxhNnjQPV3hIemN+TD9cQ83M0Rzbo/BYuRZFwWFEcmT6mWhj
 TsKtmQMEkYU2YbBaN/dX0MFPHQg7Z8g=
X-Proofpoint-ORIG-GUID: YGgMe1YfyZmT2YLD902CnFeMdFPkp4-q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_07,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260022

Mahua CRD wires the dedicated PCIe3b PHY's regulator supplies through
board-specific PMIC rails. Add the vdda-phy and vdda-pll supplies for
&pcie3b_phy.

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/mahua-crd.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/mahua-crd.dts b/arch/arm64/boot/dts/qcom/mahua-crd.dts
index fa5229064b10..17e40f2a6259 100644
--- a/arch/arm64/boot/dts/qcom/mahua-crd.dts
+++ b/arch/arm64/boot/dts/qcom/mahua-crd.dts
@@ -20,6 +20,11 @@ / {
 	compatible = "qcom,mahua-crd", "qcom,mahua";
 };
 
+&pcie3b_phy {
+	vdda-phy-supply = <&vreg_l3c_e1_0p89>;
+	vdda-pll-supply = <&vreg_l2c_e1_1p14>;
+};
+
 &tcsr {
 	vdda-qrefrpt0-0p9-supply = <&vreg_l2f_e1_0p83>;
 	vdda-qrefrpt1-0p9-supply = <&vreg_l2f_e1_0p83>;

-- 
2.34.1

