Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08462571A9
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Sep 2026 10:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788344586; cv=none; b=kMZvfRUNFPaiPbsMak9l2yK8XR8Ga5zl3vs7q7mIQzdHWH0/d5XtAAmaUDsDAWJHzjI+bbHVPTb+Gw3KDRaztTElCAeyzZjzWOqyiDlXMvIu8yA30cwreoJGDyuX0Vjc45/mpu50hs9lv+Wn+t/B6AeAZXgpZsel3McDm7IQbD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788344586; c=relaxed/simple;
	bh=VmzjOyCkiOfnSYJ2Nr9mmDf7QQmIgmq1fRFWb/nLmy8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dJ5QXWCA3eTe4d/FNhGNk8UCg0myNFdPmaWt1j5x5CBQdtGhfKTdcKcu717ZrDTf/OLmgTiDUzdQfD8eLXaycLCqMzzdBCuAdDxrkFE8ZB5WrXu7TdhoT0JVvvc20gnbHnFa1LNCNbU1MW4Z6GxVkv4N4RkcBiq4fxc6A1OWvBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hMWMXdq2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TrYgOUub; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hMWMXdq2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TrYgOUub"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6829MwFO4141459
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Sep 2026 10:22:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1vJApW9N+4cTdpwVh6JXp78+vP7bo/cxLmdb4Xr0wbE=; b=hMWMXdq2E1v7XRQ6
	g7uWddQf+NXMfJnAXljtbnrU7OfcBUCCknWCAQF6eb3Pfta6mAZJrmOQendlxMYM
	M54TV0xseqMqpqyhW3gqUHp87AzGtmqhMD5uKe3ltvgxAFzF5KL6+PsHpLVLhGmK
	jWJaP0kAwal41YqAud322cOtveO55iwtEs3dnWnUA5AJTGVkbtOvPcmC2Ixms11d
	X5s1TZk0fWbRCrgjKWfVvD5gRpYP38dKUGCM/fGjeQwaCEwH4PMzRnyy6TCpUn52
	xQtx5eLYag+LYm5sdhIM8rOI+5KQl01E3EskcAdxs+twJkoxytHrdkcRZPRKRbPL
	VivBhA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge39ckc0t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 10:22:52 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-385d2703b64so2371582a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 03:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788344572; x=1788949372; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1vJApW9N+4cTdpwVh6JXp78+vP7bo/cxLmdb4Xr0wbE=;
        b=TrYgOUub8VhAklfQ+QUPQqYftKz5Cvu+c+Vrsc3lku/qkDjccfdSwle5WN4DjMArrA
         a4JVTMkokAIxOA7OTbBRKizWc6nj+9NolfwPDcnjsi+Ynebkt4h4ghdSvgpgMEnaxlQT
         ZhXmlTzy8HBysmNMmF+8ZDSrW7NXWxcyM1e9qph3Bu7WixjmmarV8lpbHH/M3cbRIKRl
         DWm/ArpStLls/EnfBWhQ9v89aIJ0odEefGEayv9ffsaIh9aLpRQ9D1bEGzyjd0L5N5BF
         0wS/hbhdhhEuPgvvpOa5fZoxrMs/Q5bZK65DWEXoOoeP64+7pQ2Qjqw3HLeRG957yyJ4
         XxMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788344572; x=1788949372;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1vJApW9N+4cTdpwVh6JXp78+vP7bo/cxLmdb4Xr0wbE=;
        b=bW5iPFOnhkzbDNzz3MVJMzOv2yUr8POcmPHDwulp5Mbi/w/9b7tIQ/LUftcUukTG/2
         DkfFS+gSxRsVNJcY3g+BptH5eiWbXYUdyZOKG4D2gDL+StfNKJ4ReLyL2UqArGUgP6wx
         P4Nb2XfqjebH8C+GdRQ+gY7P6p8TI1JKalgI9Iinsec6MP0nM0J7D1R1ZW/fXQdLz4OU
         cUi0tYfKrbHR5vuM9mPNRVzHZCnNIIPdNmOUUJfNE6sezhbTH2xbCtShCXBF7PgnIDGo
         0ozAky37FcRQcivZVPkQEvS+xnX4Y+C5C7I6EfsYmRhM2/xsNliKOghLnoEy3mkszEE3
         kKvQ==
X-Gm-Message-State: AFuF++nliC1dDun9fKz53NkuHOYHFoVCKx97xwKND42BgtP3KfwwZwmc
	xfHmBPwhFABDlKIcZYIlHHNeXNxG1eX1BhfKRNpkoibbUhXTegV7fXQvNR+caVpqp7WsuliD9gX
	+famAIYWWBPU1zEQoIq4cUojezB1kkslzTGQrG9mkvKgBYNmovEHjGJcEcmDLRqavF7eU
X-Gm-Gg: AYBFou130Uf48f2oVWR61kQZa/9/fpy6Kp4KqXEBkmTMrqXhitjsYFKPmB3aSuyVzbW
	1uviERey4paFCqqPWJ6ViznoEjJgbuoUw1EuM382H7JN7ddJI8/dBShQnKTzsJjKKWR3pdGEn7S
	CjHqnj+FVQHtPW2hydieqKLCs2paltys6/O+jzc/7X+7ad2Sn/oY9V1CVBHYgs+Ch86ZCP5y3tr
	4zZqSvoC0vLGHo+GbOZqVk++T5Gh57zL+ZSs3juU/kXJOTtvSRERnH+UOi4ReGt5RgKd/so6fRr
	NlNHWLTLdvW7gY5BooaVKrzbsUCX+jCvMEr1Zoe4W9NW2efg0HA7yvHodBvJZGL2xBOlA6+z21z
	0c7um0Nc84iR94KFwaCxSzAbzfjlcn/lJL/H2QVaNM/A=
X-Received: by 2002:a17:90b:562e:b0:398:c6e1:dceb with SMTP id 98e67ed59e1d1-39af57eae96mr2571606a91.9.1788344571963;
        Wed, 02 Sep 2026 03:22:51 -0700 (PDT)
X-Received: by 2002:a17:90b:562e:b0:398:c6e1:dceb with SMTP id 98e67ed59e1d1-39af57eae96mr2571563a91.9.1788344571530;
        Wed, 02 Sep 2026 03:22:51 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32f079c0530sm5054861eec.3.2026.09.02.03.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 03:22:51 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Wed, 02 Sep 2026 03:22:49 -0700
Subject: [PATCH v3 2/3] arm64: dts: qcom: ipq5018: Enable mdio0 for
 SoC-integrated EPHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-qcom_ipq5018_mdio_pinctrl-v3-2-629c7bb05c44@oss.qualcomm.com>
References: <20260902-qcom_ipq5018_mdio_pinctrl-v3-0-629c7bb05c44@oss.qualcomm.com>
In-Reply-To: <20260902-qcom_ipq5018_mdio_pinctrl-v3-0-629c7bb05c44@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Luo Jie <jie.luo@oss.qualcomm.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788344568; l=913;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=VmzjOyCkiOfnSYJ2Nr9mmDf7QQmIgmq1fRFWb/nLmy8=;
 b=VDGSRjst9KK0a9RAVihDFxNdBFLoELPvsaHwng9QsEUX1qZwQ641Zq3/Uq+0yL/O+ZJCqujak
 1ZJ19LI8kweB9j3fViifwu59YItXjSZrsALNHRwMOYk5zmMdCn4W3k9
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Authority-Analysis: v=2.4 cv=T968ifKQ c=1 sm=1 tr=0 ts=6a97f8fc cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=3IJ44k9WFy3LD23BzYIA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: VhBrrRq2H2_lbJhI8Z2TRVvm_e1USRcU
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA5MSBTYWx0ZWRfX+Tk/cnlUM3wk
 lBAhhIozT9hn10sl7IbfJx/RpJF7DO8Q8pV8Ak9YOyDSNisy1eg0RTD2ML2RR4HypmSZ2qcQz9l
 ackYFRZuUS9N3IuJ39lQNAnlQtBBrwY=
X-Proofpoint-GUID: VhBrrRq2H2_lbJhI8Z2TRVvm_e1USRcU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA5MSBTYWx0ZWRfX4JJYntiQdhk4
 Qdv5YB97Kf+LySLo8wjAQStc/Ub4hdhDjtxFj1VwLqCbNCsOrvlfGtq/nWSgaie6fMpjO09forS
 fXzl8HAcvLzq2+Pjch/vqvTzxLS2SzUxsB+32/bu2EhDx3rgboXFtYZ3Fa+8POjhwaXK79CAekf
 MLTJhj9A8H9BZBEgQrlgyVTNZLI+zHl009+J8VHY8JyTTZLhUe+sXQCWDIM57s1n+M4waX8kk2U
 n6KipRIYjRX2TKRjcrD1EXkSeKvlxfYwdrddKwhyVKuZPJlTBYVb+1wbEUV1BdF6gYzkSn8i4sn
 7GHwfkvlan1UvArg5Oh0HaMoUpdJ3+fTx0f41ObKweJyeGYCIPhJPML8MlrHhHRebE8Aye96rs2
 dgf3se7FXp/TnbknphuNtwXmcnp+MNEy9fjlsjI5zk/sWHh5rQdufqp3Pw794Mu6w9PFyHV6OKw
 +b15fScOFdLfnaDBSWg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_02,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020091

mdio0 is the internal MDIO bus used to access the SoC-integrated
EPHY (ge_phy), which is present on every IPQ5018 RDP board. Enable
mdio0 with a 6.25MHz MDIO clock in the SoC dtsi so all boards can
reach the EPHY, instead of enabling it per board.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5018.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
index cb3e1202b582..fe1ed240de59 100644
--- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
@@ -222,8 +222,7 @@ mdio0: mdio@88000 {
 
 			clocks = <&gcc GCC_MDIO0_AHB_CLK>;
 			clock-names = "gcc_mdio_ahb_clk";
-
-			status = "disabled";
+			clock-frequency = <6250000>;
 
 			ge_phy: ethernet-phy@7 {
 				compatible = "ethernet-phy-id004d.d0c0";

-- 
2.43.0

