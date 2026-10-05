Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2DA35F5E1
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Oct 2026 06:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791182235; cv=none; b=GrSbdNHIVf0BHWYGU3g4p/fOt7OTHe499cT2yBtTnuBAMt6MDX6yawe3ADeIhXtYWwEaThOnyMFIv0dY1z5bFktZcJweEjNfT3J6WAIclGgy5a+qFoIg+/+kjkCR/oR7Eu1ASyYg1zeNIH3QaBt3k1omI12onwRuzzDCwSYPitw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791182235; c=relaxed/simple;
	bh=3g+p/+TLsOgWJR/fZcC79lC3qyFtFEfuh1Chjww+45Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f8w1rOQVCfDApkMVyZV4CpSOnwETfXzDQdJhApxn2Ddd0smkROqiMAoRLx77DaCM/BlV3hMX+Fl8g8pctgqO5otlovwJF0ZylwX0AX0mXgStFphK/+ufUJI7bhKNQCYAZDYMnl7/x8WPTnQKBDpUiurWCI46kuaEqA7bEDUTbPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DMIkyNKo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OXHbplpD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DMIkyNKo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OXHbplpD"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695109mE470947
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Oct 2026 06:37:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KEj9Iq84bNDgFjxx2TW4jH1N7L94Cfc45qqugk6RYqA=; b=DMIkyNKo2Xp2unci
	+gf+e2aWEBV7C+TcF9ESV56tGvfxHbriFDDVPX7HoBZLPKSMDFv4iygFhyn0ZnXP
	BCio4aO7pNDbbxUUB20WtWzsSop4iOKq3GzUoVV0jXj4kxsR2MtlD5HrnHFw/PrF
	1NPZbXURF+bo50E+Dx8TVOAltHLstStSzF1MY0o6WmE0NuYqqNtBLTbWS6rVUuBf
	WJfGY6mGEVaytdnba61UgndZuMcoeGbhE27pbwfC8VwQsEaVKd3nUSdbdZsz3ZD3
	v0oDr+EAw46CQncxfltuCduFsxcOtVcPN6NnZZtqNq+EN2gnuYD/qLSWd7Ixr+Oa
	r4KFGA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2ssucrp5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 06:37:12 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3510a481ae9so2712602eec.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Oct 2026 23:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791182232; x=1791787032; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KEj9Iq84bNDgFjxx2TW4jH1N7L94Cfc45qqugk6RYqA=;
        b=OXHbplpDd20emiR2dxrBm1Iu8mwT2FNlUE0aM98EjEdY5dTOlufTpGzLgyvlTVwvWN
         jIKFyeYODjyRg8rg+lLBl+1IKx+G4GY1jrkmoJnDuoa237ifAVI2vS2ElMl+ZfkRHegd
         JZ84kMsuGHN9d6+AVThDqkLzAzGc+JySJBI9SW962fUkq2sB5cPSXnisi0/09YllWGoP
         H4LPKxnfLTdx+4roemTydQdUM4P//HrLgqiaKzByaeFP9jt29s0h0Jp0DVY2r3dmDQwY
         6iXM4v0Z89FNUPw3CovbnmAWTLAfHUCJhZft78lHJj+DKRYoSSf7/GkstB+PsCEA2rtB
         jkSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791182232; x=1791787032;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KEj9Iq84bNDgFjxx2TW4jH1N7L94Cfc45qqugk6RYqA=;
        b=JA9kGh+s9uKPzuXlyLnNOY2HVnvS2pBY1FKz2vYL8ED6ODs1A+/olHndvW9xZ1uxAO
         ScnAjMAjjIsv1tAVWA5Tzdi/buPSv1ayTRK5iV/HLl8qbNq+Xf+3txxRoVJVNDtXEC1B
         lwsu8A6GsmSuKCMbbniNENxh4Ukx/LL7yjjEaDJdPtRJP8pBVDHOdFTsNB8OeLZN0FL6
         dSlUsVjzJpYfB54Ka5D6gX6Un87dVh2XUKPl9RSx2TH7D1x7WSLbDEPQD69Nt2L1lfUy
         H5aAO58SBEF6jPeYSEqgtKANi5l2w0sZlOeobWzcwrqjK7YMwbgc6dvm4hbu4hP+Ycop
         9x/Q==
X-Gm-Message-State: AFuF++nU3G+YIR7S3F4Okc3baByFLQFY6PI80980bBx8mgXavgDQGvMB
	r5ab4wj9Znt23MLdkqtJOP9Rfyko9f8VhE2KL4nTILTYk4CxFQdhMUb/8yDgFdZu03Z0xJNdzAi
	AG0J8iONrJFBeX/2/a1AjtTe7GfM0zDWIS2XCittmpMkmn7CupPArinF77nqLXB5/rXH1
X-Gm-Gg: AYBFou2EcO2z5YRXI3LkfuelYqPJCojSN7Fc+AUHwVtX/HSCki5d+uVGbFAok5cf2QB
	Z59ey109jUciOcq0Gwld338lnLBa24RgWixaiR1eTYnu2CdEXxhSF4KNO/42rNI1thripC9Qha7
	VY7QGnp7Y/NnjYTtRgQiuSQQwVGyULY8q/OLmfl9qW7TQEKi/wZ0lw0ZLT6s/wvIflls3OfNC2P
	soC6FusrS2DUV5gE1QcfXdH7EU1nB8dlEcX51HcpSmTy27vJrh3YXKD6Bt+4XIRP0WL6ssp7LV1
	aIftXZZ/qRnQ+Ia0NE/Hy8hV24sJ1ADOgLSUb2gMBKJ0Lr2/TKuFgNQjx5EmKErLYLq/r/uOW5O
	hCjx4nBAjUm2j5W3vTNr0wFP6tfZgUt58wlAdv0vEu4X/XODV/lWBU8WIOvSm/x6i9CMI4YaH8F
	kGUdKrxwtsPOifEJce/BHIZkPl2I9C
X-Received: by 2002:a05:7300:c00d:20b0:351:1230:508d with SMTP id 5a478bee46e88-3511230707emr9761599eec.13.1791182231776;
        Sun, 04 Oct 2026 23:37:11 -0700 (PDT)
X-Received: by 2002:a05:7300:c00d:20b0:351:1230:508d with SMTP id 5a478bee46e88-3511230707emr9761566eec.13.1791182231222;
        Sun, 04 Oct 2026 23:37:11 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3512718d9edsm11185821eec.19.2026.10.04.23.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 23:37:10 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 12:06:29 +0530
Subject: [PATCH v4 4/6] phy: qcom: snps-femto-v2: Fix
 qcom_snps_hsphy_write_mask argument mixup
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-phy-v4-4-b04c4123ecb3@oss.qualcomm.com>
References: <20261005-phy-v4-0-b04c4123ecb3@oss.qualcomm.com>
In-Reply-To: <20261005-phy-v4-0-b04c4123ecb3@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manu Gautam <mgautam@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <pza@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAyNiBTYWx0ZWRfX8xRsP/i9XruR
 Fo6TWnRlsbAfWv1M3+/VuHa56G7SU2Jj3P1ItajxUOnXS/Y1j0Dr601TpAWInmPUfNcPYEmBp5r
 8NhBkNFvmkl0QQkowDVDhYn6YQUvsL8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAyNiBTYWx0ZWRfXzK6oEYxkE/d/
 JP0go34pzQqDNS3xkNdDe9qoXbY7qoMa6qNG2wHAucunqnCNbpv7U1gVokSfsRhDMIdUS5vx6LJ
 zoII7Fx9BRTZewLB5S7VQKWvumECJ/w1lfZOasgfiNno88g1F2Eq9TSPVB2lhRQTMSCUhmUFdOV
 FeUvJ88cnkioAWBgdQGGGo+CQqt+BVhF9dQzuEjuVgEW6FxmMVR1iya9X+zIHriqSyB6my5T1yi
 D8Y7nz2vwAlAY46x4Ut9LGDTx7jmw/0KGybXSUQ09cmuywa12+usfojwUPYRIaszAUhvj4fDKKb
 1YYqo3hnlwSnBqF7GNR1aZwi8Kv/cHVyZm1q6gNwpy2/j54W+isCcQZMpqBmgrNYUw1fzlvzZ4l
 SGKFrPfbpRDA0+xg4DUdLkGK3AcPtsVTKIpLT+C/w2cSvm6aypItnu2sDavWqev6Bn4Mhc5SleG
 l2IsjZrJKHspWmYs0HQ==
X-Proofpoint-GUID: 3BAtOCYCkpvnC9eur7mH2PPzuCyGhsRq
X-Proofpoint-ORIG-GUID: 3BAtOCYCkpvnC9eur7mH2PPzuCyGhsRq
X-Authority-Analysis: v=2.4 cv=FryQbGrq c=1 sm=1 tr=0 ts=6ac34598 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=GpOyvZhAS4UUCrMfQdkA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050026

Fix the register bit field mask & value argument mixup while programming
USB2_PHY_USB_PHY_REFCLK_CTRL in qcom_snps_hsphy_init() and USB2_AUTO_RESUME
in qcom_snps_hsphy_suspend().

Fixes: 51e8114f80d07 ("phy: qcom-snps: Add SNPS USB PHY driver for QCOM based SOCs")
Fixes: 0d75f508a9d56 ("phy: qcom-snps: Add runtime suspend and resume handlers")
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

