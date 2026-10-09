Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079A73CDBD7
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Oct 2026 04:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791521431; cv=none; b=dzT1MhuD3UWXCN0VhnD6rPIFsC0cELbXH0ZpZt+3uHtC7ChDCA9k8ueSQ8C5DvkCnQIolN4YkWzVee76vAIep2X9vndTYDNbfiunvbB3eRu6zfGZzMFu0cp6r07jvO66EPU1EI2Pndp6SVxJBQH7lMWX6XGL9M0HP0+eA6PnkZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791521431; c=relaxed/simple;
	bh=0STYxAxDE1NjmlumOdbThi5YeoSWS5eKyqTdJTbik7I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mu7GMSC1e1iM36vJizbtJPOTJImFjQcTCe1j+UtoCvL/Zx1YDKibrqRDFMFpCAYkAZAC9riAnNbKOmnKhki7lQ4D3EEyyyy68QW46O1s4kYjve3Lx3yVpV8l0y8qXDso66BSv7Xhgnj2i1g0/NEKnGuRpdWcqw0xOkv/1Q9XztA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n8DflUv2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=In4DQAYG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n8DflUv2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="In4DQAYG"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993HCCB1712596
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Oct 2026 04:50:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y6PDhPtXFIAM/ccyT8/MEF2gGuCNuVMLTbOdYMac8XU=; b=n8DflUv2GGnZ7OHH
	k0mx7cjfzL33RyK+vCD3SeAFnNxUkJK9vFtr+rTQPCV2pZZW0dElM8QB/R6oeUeb
	wWWF9RLUCSFqxaAivxamrp6kZWTleOJICgHKP0/cveiUSk07EzAcFI3bzDMQ5C4a
	WvIG4p7zWx+xbBEcGVpnRu9WTch/Kv6Q9gFXkeZ+oIkRPqL64OYmlKUpGgbbM5jd
	4dGPPJzYWG70p8fSHNmIHfIDXRR2pnzjSMSwkt7w8i5Uf2P6Q4MCVJzlZzbVU5ee
	gFsUFjCLHM/R5s6poIcyTc008GOGPn3hvGlsjIYa4pvMCxpldK1Ru5u2kUpCgixK
	oTRZaw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxw9xr8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 04:50:29 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-14373747468so6648505c88.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 21:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791521428; x=1792126228; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y6PDhPtXFIAM/ccyT8/MEF2gGuCNuVMLTbOdYMac8XU=;
        b=In4DQAYGrkre9Yknk3+QRo6/yXvp4ys0nlVyZO4Shp2dWjCcVn9tVtxpJrb5Axaorn
         chxcqsJipRaf0dppaHvklWTutlm+O0RpAFTUiHsDO/iXJkce/x3g3Aapud4SYhL8vzIU
         7jCSDCZszNPI6sU9fJ1E9suIGO3AH5PUAG86Huh3poZyGMzcyU7hswml3j+F/rLPz6N5
         slVQs/LPPCCBdSFmD1wP1HE+9z53V/ko/SQyX8FXQQkE4DdGdM7hXiNhSlMJzEHPYbRq
         cQtARWiIKU6LUTWROkMXTLN25KLniLRP8ghUBxSSiM2Tbd6rqTvLkFegmvttLjIFxNaI
         56cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791521428; x=1792126228;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y6PDhPtXFIAM/ccyT8/MEF2gGuCNuVMLTbOdYMac8XU=;
        b=PLv4bY4BrF1NQ1xQNT2uEeg/UklS7191sPKttTR+7XWRD6xadyCvbQxXmoEbzON9Ks
         7xR9GZGfxiTV6y6bVDSehZFedmVzJHW22J4Hu+zuRtzBOjjG9WbKQrIT1zEgcV8t3aiG
         FIvs219EvKYmmtdJrLkk2DhYaBUVpUk/kahwq1kNvUei4CY9exDxD6HXXWcaZspyCdg4
         jXH5oSiyNeMCDI3Yw1u/w3ijvCOTCmZarvUma8fkcGBJs8GOvv7bQB3jonnk14R6sFMD
         nzWWnAxhMOKOPv+0dSPtwYECByVHxmxcGwcb61Tg7Uzry2USK7focgAWDDcOH8hQKQQE
         /lMA==
X-Gm-Message-State: AFuF++lyd1Mni4gJF49FqBoFu8AHQY1DaC3im0ih27fzSFDwk2gUq8X6
	zvB/y0H30G3PdrEccoTDT7/bKHsVMK9PnyBZ7GEu1PSUbj07+uZ2cF3FMsQZfUlp575PWk83AAX
	s/LZ6FbVaSfSWgmOpKawPSUFRvcD4P1AlQZVYsKtJ98/QC7Bw6jWlSbPZvpiX0c6MJXFI
X-Gm-Gg: AYBFou3ZNj27j08lIVUuyUIYkFXa0KZjIOVIFNeGlEme+XX3KmGa3UhhENGJckGMEeH
	3CbWGiGYQ/kJL0gk1bzUl0BlH/cLzv3aUmUGalchg8/D96qT3W07yVbVgf7K6gLgXfIh27Jh25u
	stkigO4Vp9pogJ6SZK1IfDl2F8YLGJnHuyPG3g3d+OYHp7+CBHV3ijUnvPv3aNJCXACQpctrKFX
	yEjyCLST2w97l7JsnucQ+EslNnjf9e8kbCVxM3j/XVhHhyIDcYHuyMLz/yogaWFB27yqghUeWjT
	6p2hN3D74UalusWFtd35Ryu3E7xyZPwYumRnEjmDgfu6qr5GxmAgxGUSmewNjxbSxf8flxHhmaI
	IHA/z7JJAROh1x5fdnPVuKaag5akR6rGGsSUHsRT4HBln24hgH3zY2TSxhG0C0XLi5iWbvVYS5u
	EFE8cWmFo1YBAdzkGmbSAnPCzKGKEJ/A==
X-Received: by 2002:a05:7022:f503:b0:143:54c6:6a5 with SMTP id a92af1059eb24-16a6169583dmr868436c88.37.1791521428423;
        Thu, 08 Oct 2026 21:50:28 -0700 (PDT)
X-Received: by 2002:a05:7022:f503:b0:143:54c6:6a5 with SMTP id a92af1059eb24-16a6169583dmr868404c88.37.1791521427901;
        Thu, 08 Oct 2026 21:50:27 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a442956asm4151609c88.16.2026.10.08.21.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 21:50:27 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Fri, 09 Oct 2026 10:19:58 +0530
Subject: [PATCH v6 4/6] phy: qcom: snps-femto-v2: Fix order of arguments to
 qcom_snps_hsphy_write_mask
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-phy-v6-4-50408e45bcc1@oss.qualcomm.com>
References: <20261009-phy-v6-0-50408e45bcc1@oss.qualcomm.com>
In-Reply-To: <20261009-phy-v6-0-50408e45bcc1@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manu Gautam <mgautam@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <pza@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAxOSBTYWx0ZWRfX5ZwMqQJE801y
 td3Pix0ccytY9DbDNi+TiT3XpA7kzAFsbmOeMH64u8dU9lkAOwD22K5CQlLcj8P/7LklfvyvoNv
 i3gtFDqTzCfhTkApOvTnh04K8BS1R60OlQWolRa/8BdanaRXXZQqrfbIeq5d4sR8tr4ZAp9dwxc
 ykYPKafeI71Hme4OA3T1QYFtlKxBdM27ZHMFwXF5dwrPz2rx3bHZOcdaQSatyYGE7umAwYTppex
 KRkrn5dr6UA+U+2QhW4SWvY9TVqVoMQpL3ok0NVqpTKOKmWtPS1wMMwquS2H1Ap474mZRP2GgZB
 nB1EHCs3JXdMI3XQANtlprmnyzwvt8RHwQCXPXnVH62nYNhsJCyUwPSGjg8f3tgFB5WeQNk1ycS
 wqlvNLtnRcF/fccK6mbqCl6LqhoK8FmC30qTYcIsNtv9Pam0kx++7LtGUPTYsQx4/1Qwahdf0PE
 CKNDRkaVCMPY4Rd8hWw==
X-Proofpoint-GUID: hwVaHLrrSIZjgAnP9Y2vwjgBN87KvN9U
X-Authority-Analysis: v=2.4 cv=cMB1IVeN c=1 sm=1 tr=0 ts=6ac87295 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=GpOyvZhAS4UUCrMfQdkA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAxOSBTYWx0ZWRfXwM2gCmGb1q0f
 URjr4ct1OXCN279DLbCI5lFFo14771alyU5jRadS2t+8YGMCPL6FqwfAqSKbegw3gY5QV8gByeX
 Tzhe/LhgVLVaipy3KatvbXGOgqz1jm4=
X-Proofpoint-ORIG-GUID: hwVaHLrrSIZjgAnP9Y2vwjgBN87KvN9U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090019

Fix the register bit field mask & value argument order while programming
USB2_PHY_USB_PHY_REFCLK_CTRL in qcom_snps_hsphy_init() and USB2_AUTO_RESUME
in qcom_snps_hsphy_suspend().

Fixes: 51e8114f80d07 ("phy: qcom-snps: Add SNPS USB PHY driver for QCOM based SOCs")
Fixes: 0d75f508a9d56 ("phy: qcom-snps: Add runtime suspend and resume handlers")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
index 980ad1fb1e2e..0ead37c0dcfd 100644
--- a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
+++ b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
@@ -193,7 +193,7 @@ static int qcom_snps_hsphy_suspend(struct qcom_snps_hsphy *hsphy)
 		usleep_range(500, 1000);
 		qcom_snps_hsphy_write_mask(hsphy->base,
 					   USB2_PHY_USB_PHY_HS_PHY_CTRL2,
-					   0, USB2_AUTO_RESUME);
+					   USB2_AUTO_RESUME, 0);
 	}
 
 	return 0;
@@ -426,7 +426,7 @@ static int qcom_snps_hsphy_init(struct phy *phy)
 					USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON1,
 					PLLBTUNE, PLLBTUNE);
 	qcom_snps_hsphy_write_mask(hsphy->base, USB2_PHY_USB_PHY_REFCLK_CTRL,
-					REFCLK_SEL_DEFAULT, REFCLK_SEL_MASK);
+					REFCLK_SEL_MASK, REFCLK_SEL_DEFAULT);
 	qcom_snps_hsphy_write_mask(hsphy->base,
 					USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON1,
 					VBUSVLDEXTSEL0, VBUSVLDEXTSEL0);

-- 
2.34.1

