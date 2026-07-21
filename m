Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282E934167B
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 13:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784639159; cv=none; b=X78RZyUIn+zvRYHING6EzDKvJtYvunJfERUydBDpnXfbZSnyLe5vQeFCrPr8v/Xkx9qesMu+tW+Wv7s/Qk3oOoWQTt7t/41GB5yKThR3N4ykSR86iZy7zgPWsw0wOkjGLr/hTfQYfSBsTQrwYNZxZ4rIbr7Imu6cGI73Ww7b+Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784639159; c=relaxed/simple;
	bh=Gv4mdxekx2e8aCObHel7a/UqUQPMN/Dl1/vyDPxgxi0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gfAVo0PbbtcOaapXHHjgjmhMuKZ+TqaxJBck+bzWWGd0omvHNKkd2Urw2qfLRGGBNG1D15DmAdAVRcfrtNVjV/UuNdqGsfw5kA011Qlf1iDEtTwXJUSnRWQhEVdXwRG0ukEPa6CZpCPkj1fEnaEc4AHcDAYiVTavX9yZok+Mwk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l1XXiear; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LvQoehqu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l1XXiear";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LvQoehqu"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LD5i1R1853473
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 13:05:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ArevCzpRzOB06CCKd2tNeB4LMRjUeXNscgEPzgFVN68=; b=l1XXiear32KiBO9v
	W5xcP4duKlk8YwkOsrlPlAoxk+q7W+pb0WPtYMA7fUhbuAZDJqsD78JRbotZff8C
	8PFmT9i8WJncUA1YqWNnGWhI416GtsYShPYE1nz/E4GT4sG7+MJoL/OOj/waQ9Hj
	49nqarxfQgvozVnY6JmYesqp86NhpUcychte8HxlwNAQYSiBLGEf/bMIn0OhX6Js
	FMfBLKlWFeXs2qCVtsc3y6ebLtuq+X7/TbrsmbIgl1cGLJFSl7EVW5gn/N/f9vNR
	gY+fYYEwrQhW0BrEb0UUCR2wP5OOzFR5IfsWRH0WAOPwUx+6b2HR/o3OpVIWsPE+
	9o9brg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj9bs802a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 13:05:57 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9771482e074so2682339241.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 06:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784639152; x=1785243952; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ArevCzpRzOB06CCKd2tNeB4LMRjUeXNscgEPzgFVN68=;
        b=LvQoehquktRzss6GUaqNeDJIZRXMS1KwSnfIOsK5Lj4M/xQBk2gqeRNoCuDBov16aI
         6u4WrEVg8U2t7xzxrxIUpE/3U+y72daSYWXUsTqGUqnb6oaeFYZbNGCbvc9DBvJBz53u
         TtqwwiuuYxgkh30dtnPs4x7RvlFQkNS4dtrAaj4tiTPlK1AIbBHbme+gk0wBnGhiPuDq
         9KuWOzl9vLB0rhhVdZswLzoPV39ofmeBAO+Zuvk5HovKtMBgjTMMh7NodBwuGrlDGDhc
         V+KcceRzUkpL/ptURhWvQDUGTkBnYxNb9zmOVkxuebk2TQRNde5OzyTWKRfIhSqMMGFg
         zDaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784639152; x=1785243952;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ArevCzpRzOB06CCKd2tNeB4LMRjUeXNscgEPzgFVN68=;
        b=rWFw4VeQxKwpu7GiAg5W8629SVrfOw+vCYOv3sEMoq9+mtB46ybftoiSPWdRCvYmEq
         ZYsNzm0BfWCfPrk73tgyqttKqz/ZzsAkCLfMgEHcPM0lkJx0njkaTGJQA2bYbu+auJ9h
         omeu4OgW5TOHEaWj1Te1XobuU6/XaqNApeGMVOiY5drq5BP0WuXNcRAbw8gxs2Adrlju
         2091VRa74ErFrjabUlrjL807/bMeBhEhMRjHYcbxas0weVBrqidDu7QKjyiNoJHWWnS6
         e62WFJztO1UbV/6OTCzAqaiZkvQHhfDkfQ4GFQZ9tKqEVxBT4D+DA733SqP1GU9oTrF2
         iTKA==
X-Gm-Message-State: AOJu0YxhNJUasPBVH5LD0z1ng+kblSxcmaBCqTwKd8+K/RqWFctF77Ty
	JpPTm8GrnuNezS3EXtkhh/WG+H9IyuGApWY/M6SOGyREPysWhBNLh8DG6+IKKpVFxV2vBlp6+kW
	VyB28N+i5NKossN6G34Pjasj0velzzNpNgJ4qWbgYxElbrC3/CQTjAHaQPy1M51yaMopF
X-Gm-Gg: AR+sD12fVLvzkLM1RBtvNEdOZCUEUvOEO3gXynMGHjD7aJ5zXgPb4T+pDcDAaJGHW8i
	NyU9Qk6dFHUAHb5fkGKFqRE+d1sfeeTmM/tCY+EBlnZR7VaH8S1/RdMmZp3xDoU3PMBD9RnLW0x
	gbFFsj6iZDWhN43mKCK0pllcdQIzlcqB+jkzqVc7rp2P5nGG3LBPpbnFEwH5XeBcT8LCty/JRBn
	Wui/3XrUj8MxSo0Bv25Ut2OUty++xQnslfAquvtULT/d5sOMRgDis3yF2KUZmCq3VsrpFEKtXoF
	JpYdg0PuUp8W4sXsVK1XA0HubYhqROne+HCUOppakzLJxiAlUF8qp/1krJS5QKLoIqZy1QvLwbD
	ii9QqGpCQcvtjB2gK1sDhl86zsPKqwRBez3TJQXLZDk9LMzsF678ayUOdHHPprOtJO7MWgVWVWz
	LlcnmskWnWoAI0a+38YFdq3PNR9rQ+yRqNf2lD47pYD0/6qi0e29M=
X-Received: by 2002:a05:6102:1487:b0:729:affa:70fd with SMTP id ada2fe7eead31-747534bf4b0mr5780650137.8.1784639152411;
        Tue, 21 Jul 2026 06:05:52 -0700 (PDT)
X-Received: by 2002:a05:6102:1487:b0:729:affa:70fd with SMTP id ada2fe7eead31-747534bf4b0mr5780628137.8.1784639151990;
        Tue, 21 Jul 2026 06:05:51 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:751c:d61c:c91:60dd])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c17009ae04bsm591898066b.8.2026.07.21.06.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 06:05:51 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 15:05:46 +0200
Subject: [PATCH v5 2/5] phy: qcom: qmp-usbc: Prevent unnecessary PM runtime
 suspend at boot
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-qcom-usb-phy-fix-null-v5-2-a181e2adbd2d@oss.qualcomm.com>
References: <20260721-qcom-usb-phy-fix-null-v5-0-a181e2adbd2d@oss.qualcomm.com>
In-Reply-To: <20260721-qcom-usb-phy-fix-null-v5-0-a181e2adbd2d@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: 9tBhJAQm11mybM2-yTbnJZlFNDRta5hi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDEzOCBTYWx0ZWRfX7To+CRxkKpAu
 xlhr3T5D8N55uwwG9H5JV4wTKEeKBs78sNx5w6XFvjb0xnUf37jHl1vglqtXYSAYZ3wte0DAlbv
 k/vqZpRVR7f00cRMqGML3H0808vn/rbB2g7dNgt7I1V3KOWJmEFQSYxLTSxAmtrCLgNqdfQMjZc
 +JlxM9Sp4hJszUUhGKgsSCkxWKx5QlwfGlFVgwVtWiJvsRA2Pj43qKWireADCAjOautLm4yudwA
 +gtMVrQeNlnfWyddm901GhSeXXgqkUjDrbGYlMHuy7DZS0HxYK38V3oZIZzomiIucSWj3sMdJop
 sWGULEHx78q3v6xDdS6PUB7IheMa2slMxATOu+Lz/j7I3zCVAanVcU93wBHCWVlh0yW4di2VMpQ
 Z4qptjlzAvfoGmivuxeflVr50p59mZBoY6KfMyC1p+sA5/eeu87VjsCPxrQYJo1NDz2GLHoe/np
 f0j6yZv3YRAxfmAd5Vg==
X-Proofpoint-GUID: 9tBhJAQm11mybM2-yTbnJZlFNDRta5hi
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDEzOCBTYWx0ZWRfX6f/E+cGunXj0
 6i33NRk2lggjoKLqsk0IXTPJOzL3AHQV8gYhtaPHEhpXgA28YNNJ+Lp1xYM2LSvIacM4VG8mEqQ
 HEMijjv9dd71/zto/vn+nF3L4cDHQBc=
X-Authority-Analysis: v=2.4 cv=QK1YgALL c=1 sm=1 tr=0 ts=6a5f6eb5 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=PcYcMbZi39MCwOMHHM8A:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_01,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210138

Runtime PM has to be enabled before creating the PHYs, since phy_create()
only enables runtime PM on the PHY devices if it is already enabled on
this parent device. This opens a small window where the device can be
runtime suspended after pm_runtime_enable() and before the later
pm_runtime_forbid(), causing an unnecessary suspend/resume cycle while
the PHYs are not yet registered.

Take a runtime PM usage reference with pm_runtime_get_noresume() before
enabling runtime PM and release it once the PHYs have been created to
prevent the device from being runtime suspended during that window.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index ab3055bb5b0c198832ae06dfcd04fd34395e271d..4317224070fd8dec98090e9200ac7d0e97265979 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -1959,10 +1959,16 @@ static int qmp_usbc_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_node_put;
 
+	/*
+	 * Enable runtime PM before creating the PHYs, phy_create() only enables
+	 * it on the PHY devices if already enabled on the parent. Hold a usage
+	 * reference so callbacks cannot run until the PHY is ready.
+	 */
+	pm_runtime_get_noresume(dev);
 	pm_runtime_set_active(dev);
 	ret = devm_pm_runtime_enable(dev);
 	if (ret)
-		goto err_node_put;
+		goto err_pm_put;
 	/*
 	 * Prevent runtime pm from being ON by default. Users can enable
 	 * it using power/control in sysfs.
@@ -1971,13 +1977,13 @@ static int qmp_usbc_probe(struct platform_device *pdev)
 
 	ret = qmp_usbc_register_clocks(qmp, np);
 	if (ret)
-		goto err_node_put;
+		goto err_pm_put;
 
 	qmp->usb_phy = devm_phy_create(dev, np, &qmp_usbc_usb_phy_ops);
 	if (IS_ERR(qmp->usb_phy)) {
 		ret = PTR_ERR(qmp->usb_phy);
 		dev_err(dev, "failed to create PHY: %d\n", ret);
-		goto err_node_put;
+		goto err_pm_put;
 	}
 
 	phy_set_drvdata(qmp->usb_phy, qmp);
@@ -1987,17 +1993,21 @@ static int qmp_usbc_probe(struct platform_device *pdev)
 		if (IS_ERR(qmp->dp_phy)) {
 			ret = PTR_ERR(qmp->dp_phy);
 			dev_err(dev, "failed to create PHY: %d\n", ret);
-			goto err_node_put;
+			goto err_pm_put;
 		}
 		phy_set_drvdata(qmp->dp_phy, qmp);
 	}
 
+	pm_runtime_put(dev);
+
 	of_node_put(np);
 
 	phy_provider = devm_of_phy_provider_register(dev, qmp_usbc_phy_xlate);
 
 	return PTR_ERR_OR_ZERO(phy_provider);
 
+err_pm_put:
+	pm_runtime_put_noidle(dev);
 err_node_put:
 	of_node_put(np);
 	return ret;

-- 
2.34.1

