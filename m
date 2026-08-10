Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6EFB3C2786
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 11:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786362170; cv=none; b=IYuBrnvni8nis07dFPKBJ6rkvWimw2guYrsZne4IeyeUVYBPOVImeCO6fEdSvMJzJkFGG2M1cBUQUy2CnJYKSwZW3p844038BzG1oHgkjAjtYyEO8zhRzzdoQaXIhpCZW7vXcz87EDpnxOgQRcolRQ0N8E15tOQIDZuHQdwGiSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786362170; c=relaxed/simple;
	bh=Vqsw8JJWOi85POaWx2iCSTAfXxNNja11d4f23hwnU5c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TIz65SHffOtkKt9uTcdEvzxuV9pD68C6cYRED8ZmXS0fis8m2xEyyD8iKW9Q4mTyIlUSwjyPqNvqOhZ7eeyg95MbaM3b1Vk+71yV0dMUep/dYKgXfDMC8ppSxx9MJL5XbSIE1/hWaKlAFjME4fHWNUv5x+/IgTW7xUkNcJ/tcvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Oxxv2snj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DEL1Edtc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Oxxv2snj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DEL1Edtc"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A9SA6t1166951
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 11:42:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pcf8bo9ey21Nzk57L59x1vStqmDp0oasziFMD2pL3G4=; b=Oxxv2snjdA08U2BS
	oGd921vVd/0cgzuoMVF/x+CvfFMxrACHEsS5+UWcbhElVkk6eVpDP2QvQZbNi3Le
	Wsi2LqEiaDYhhJ7TkWykuMir77S6G/4V9mui85qhXw/9RMK2ItGBjNg7g6TMtLIn
	2TuguTbCn4joy2pyA1y0JOdyWdCyKM2WHJ9GKaCOtO/hp7dM1XHayKVFLvYftRMD
	tlNJ60fyL1y2mz/u4l5IrLpB/XuzkmPt4d5FT2E/+W0d5y0UW5cWzqlrGMVnY5mv
	6slJxWo8+FW/OjaO2CpN93wdkgs+rKW6hbxNmD3w44pShygAR2hVHMI18D4n7mCN
	an36VA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8vhhb3w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 11:42:46 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c26012cd0so16228421cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 04:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786362166; x=1786966966; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pcf8bo9ey21Nzk57L59x1vStqmDp0oasziFMD2pL3G4=;
        b=DEL1Edtc/sjopVmFJ9mRtilOT+sELqvr9c7UNeFus3FckZDMfCCOqImAXKVgNhEp+v
         rSWwmVcYi1Qyrym9AkzP2fGBCldp0x7DQp2zzbqdpIZzxSYrHuLmPJki+RMInQ/fbg+/
         lmgtl+K+5qp5h2BnJPKbcb0lVIe5nzLFsAVdE9VKUCLEsI03FdrioGMgWmqlv4RfI9Og
         +uRdzW4edxKdFr4ANo9+x/NWZKZp2y4q/4zaMkHyfozHbi5Um5QOgbhVemTZVU2l1fJG
         o/uQI+JMjKcBAbrGfIqvrwqa6PzMageGkdjVWcYm9byfo8XNpMfdqKSj7wBG4cKhBOG7
         jGtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786362166; x=1786966966;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pcf8bo9ey21Nzk57L59x1vStqmDp0oasziFMD2pL3G4=;
        b=a9dxmCSuShMslpB9B2M7oMlbRKdARtNm3a+V0VOHBtnNrFhGMB3lRAoYBNVfKz3ugB
         B/mb//nfp5Qc7+vue6xVEO00eWty32OXQ+hmfdXOObrzzSmL5NcTLyjQFTJ1UeQqW0Ef
         E91oUM1tDFEsjLtr/k+1KizL7j5/3ikzEfkV3A1fUi3/+gdFXjp/+/67osCnchK9gJpv
         E+k73iDQu6lcxCDibeL+CzN/k+zMoAzxPOZu+uoMaIwQCq2+vUT/R/8jRSJlEGPFbe/p
         F8/u25z8JW7yyfb9fHvPZMiajit5OEtDLnpj1wtJ+I6/xYY59CVJvWsOcXNGSpVI91b/
         acyQ==
X-Gm-Message-State: AOJu0YzQVqwiNqL7z0STq1g7w9ebUjSjTfKM9ZRB3+uwWufvO91vx9ZS
	una5Im2ROe1ag1+GPRks+7uQav/f9sqgw8dknaAGFujCpqucwkXUVkc3cBzpe5NmfZv39ld//Gp
	v7nNsElaxRrtIf3kqBNaB7QVoxq2qvsgmsYiAzBEY8qv67wlSVspOKmXEiYrA7+Zner2nH4zNJh
	ds
X-Gm-Gg: AR+sD111mV9KYvqQfP6ZTHk1gbYSjWz8Vslw/OeR7nHqsSGSBFWX3ezB5Y1abqSHRi7
	i9EH2nlZHbEuXsaHJTJerlxJCA2b8C2Y5C1aRkXc1pdN4uKpGgKXygfNAtKPcCqsEDWfWl6Ev5d
	0MmTPnR/OBW+FxDWh6ZKUZJF/eRU41ITNqf7du6TrS0CP9wZo+RGUIav/wSkiFzOOuIke2JyBEl
	uPIWi7cSznyjt1vFvhDTBj9InmEDkZxX649R5yoJz9acLTUWwHgD8p3Ggm7xfNhrqnnuFYOj56d
	kG7QPx4wP+v7VTqUidxXebZxNd5bI2JXKo2Ro/DxkW4c0VjWQg82F/yuwwcpZYYOaxGg1+iUI1h
	P2p7wdYnh7JEdu2bv/NKoWS2ClMr71526IpwT0Rj82EfSOkScXUJQ1Z1INxssQhuZCxmA/vCVFA
	D4dRRCH02O/X5VFA==
X-Received: by 2002:a05:622a:5512:b0:528:17d9:2d99 with SMTP id d75a77b69052e-52d4c26af67mr8542311cf.43.1786362165582;
        Mon, 10 Aug 2026 04:42:45 -0700 (PDT)
X-Received: by 2002:a05:622a:5512:b0:528:17d9:2d99 with SMTP id d75a77b69052e-52d4c26af67mr8541791cf.43.1786362165151;
        Mon, 10 Aug 2026 04:42:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39fddd67ea8sm21201671fa.28.2026.08.10.04.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 04:42:43 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 14:42:35 +0300
Subject: [PATCH 05/10] phy: qcom-ipq806x-usb: fix the SS PHY TEST_POWERDOWN
 bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-msm8974-usb3-v1-5-1a47e1185524@oss.qualcomm.com>
References: <20260810-msm8974-usb3-v1-0-1a47e1185524@oss.qualcomm.com>
In-Reply-To: <20260810-msm8974-usb3-v1-0-1a47e1185524@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Andy Gross <agross@codeaurora.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1207;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Vqsw8JJWOi85POaWx2iCSTAfXxNNja11d4f23hwnU5c=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqebkpuX+vOVLrzjxpiNNS2YkxPf3uqan6N+RLz
 fDpxGwaCuGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCanm5KQAKCRCLPIo+Aiko
 1QfPB/4iz+jf8SjAdNFZSm0aMTjbl+6rvr/pgSsoFIAr+D1trxTc1W3fTjUJmBF+pNfEWNwBZca
 Aq06bNbBr8k1OydR6xd+HzebvHxfD1/yOKF801JdwSUQYCexzfEc1djrDIXUCFcFjK34ADHu0gs
 g9Y8Pkh6c0nM74+r6elS2JgKMUiQfcyZzqhAOX6gL3B0NZZJXRD1Q4wM5Q6WRI4vaDCkHCpnY+i
 1WPMSzmmjSUXWvY6gcHiMMuzDjXdp6Nq4/c3GdMjXNgjrjvGOazyDqZm/Tis+KskmqVesaCt8uh
 3mbTOLt6/tzRK0TxhPzDS6qERKCQgapfahvyMTLaR9Hgpd1p
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=MMtQXsZl c=1 sm=1 tr=0 ts=6a79b936 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=dvWP00IZLZjrm0WsKW4A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: Ey9uFJToWH30SZBFY40WV6CRCXl4m3Mn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEwMiBTYWx0ZWRfX3ucpnWR+QoDI
 IzirO6Zomc2nlj4gHprjuXUh8Qt5r0lkOsntBhxLEDUno+dm9Mzdsy5wOmW5UF1aK8T2Z6vzN9R
 vjD2bSqF5hetNQqA7v4N/2AvbgA+VnMjmP6kccbHMnr8CNr8olmm8c0WOVlDNtABl5FzJyYo04K
 w2Aujq78UrnxFUif6K+A/0iGkkUw6yOTJRpy2rncs+v8iIR9t/5t2pqYHEbWmghJbn6ch5wdfJI
 cpre0okgvzQ/g6tImj8/NAZL4UOvM1cs18SrT9jbsWufG7HjDgs+ya3ysZKxM0UhGh2z4teXsJi
 g+y2VhgsWEiEnjmLqrXN3fIJEXJEhQ4FOwNjamWRQzBFHfPJekVexejy3mHPwn0Ldti0G92rEP7
 ef4uhAkuQBnk36qKBhQde7QkWHqMZcgfNkNC/0Rwr9aD7+ri0wOIHIOJYoR9qj9HrwhR6KO4fg/
 MdXyCkDascB0Atran/Q==
X-Proofpoint-GUID: Ey9uFJToWH30SZBFY40WV6CRCXl4m3Mn
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEwMiBTYWx0ZWRfXx+9/lFpMdB0D
 S1oD7U1iBcYFt4feTg0lgdulpZKKkZpe5pKQAtPa3pBKL4lJXfqv9HCSe2NlYC86GTcaCmGfmiP
 oY+0iFXJBn2ZvQM6LnO7rfaNa7FwtsY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608100102

The SS PHY exit sequence tries to put the PHY into retention via the
TEST_POWERDOWN bit of SS_PHY_CTRL, but defines that bit as BIT(27). In
the DWC3 QSCRATCH SS_PHY_CTRL register TEST_POWERDOWN is bit 26 (see
the downstream phy-msm-ssusb driver for the same IP generation), so the
sequence pokes an unrelated bit and the PHY is never powered down.

Fixes: ef19b117b834 ("phy: qualcomm: add qcom ipq806x dwc usb phy driver")
Assisted-by: Claude:claude-fable-5
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c b/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c
index 21b59d4ca8d2..cf77e0a66e20 100644
--- a/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c
@@ -51,7 +51,7 @@
 
 /* PHY_CTRL_REG */
 #define SSUSB_CTRL_REF_USE_PAD		BIT(28)
-#define SSUSB_CTRL_TEST_POWERDOWN	BIT(27)
+#define SSUSB_CTRL_TEST_POWERDOWN	BIT(26)
 #define SSUSB_CTRL_LANE0_PWR_PRESENT	BIT(24)
 #define SSUSB_CTRL_SS_PHY_EN		BIT(8)
 #define SSUSB_CTRL_SS_PHY_RESET		BIT(7)

-- 
2.47.3

