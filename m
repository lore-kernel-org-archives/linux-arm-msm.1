Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6735A364028
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 09:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788256293; cv=none; b=W1+7Wvm8TN9aBueql14ERGYRsJ1MSPPF75pBpnGCvke2rRZx7+HifPzefM147Q/HPEu1OxwqjIsP3rhh6ryjNkp9rqvoZR7frCJ5AWECKqOOROpzR6XPYk72ZectctYxAfEXbbTrsJ2wpwLll52oUwYpvNzpedbGhT8yubp/f1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788256293; c=relaxed/simple;
	bh=L7RQD5/LnUNN+s/Jecjvx7E25e68IWUWZrpA+5v3D2g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LxKfHmkQ3XFxADs5LMFNbZtmcQIWBqVdvfe049F6HhDYWJFUTqJ62CWn3g75DnY/J/gI8CEvPoWZoBsJ5UtxqZRa1vHeLBDOLJVvcKDHu40E2nj+KdbUn7tsHUhJEFBXeVmWTFVA5Ph7QCkYucBjDRVC2ObQwbejHaUVD0RHPS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QZGq4Hqc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZaZoP9Wv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QZGq4Hqc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZaZoP9Wv"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179PMM1282855
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 09:51:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Jb50+pYjwgA
	TQrbLAr/ZmgQJVjW8TG6fm693bt3UZ/I=; b=QZGq4Hqc4YPyRrfbLWdCcXuOA8k
	CdC1cva4qKtMD7gPP5Z5vyeEmXphN/AisMVePoDd60mOuhK3gQqevGi0XoGdgWC6
	/GuH+rqM2EhBiGKMa7wsRx3akHcSnJcZwFhG24P5Y0dKt/ohP8bAnKu4g5GzO/fQ
	XrfQOqtkfNZrsdnvKHtqJOt8PkbkzVPfJmg2L89XUm+BB4i+I4dH4i1zFX+uK2w0
	SWughQsGEK0h9hjQS0h/vbVREiFDJ1iZaW4Ux82TCeNgTfyxIymsUQa40i8fEKCn
	toRUmTnP1TY0SgpngHFqXjyXo8egpSybDKAu1ImzxQXgB4YnJyVGzMhJT8A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdndx9vaf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 09:51:29 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d70d8839f0so15445015ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 02:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788256288; x=1788861088; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jb50+pYjwgATQrbLAr/ZmgQJVjW8TG6fm693bt3UZ/I=;
        b=ZaZoP9WvVpDPWw6bUmnr6JSTPSsrzoVHbIj2tjtpIczLHxXD/rZlzj3enET06mK0j6
         PYS46vYx9jscySHgmJWIbZMrS4NnIv72tmrJhCui6CMANqoSPKGIv6EAjKHTybyoJZ/S
         sy2eECv6yYPT6fl3/UyHA3f7u87cwFqIzQEHAELkP5DNx99nih6OJPRppFOQ+K6E9xEd
         hXJUMP1dEum9PACX0uFVad4Wre5n0t0skgMVK+YuxV5YEhMkQVEzwbLr8cmXuuhLagoY
         e19y5v8B1lvtbE2csq5f1s6U/NUf28wiSBWbW47FrZXiRDHJeOZN+RoTTrZ5xorVo5eR
         Zswg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788256288; x=1788861088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jb50+pYjwgATQrbLAr/ZmgQJVjW8TG6fm693bt3UZ/I=;
        b=Ey5CwwUYr8JxYeUxT+4K1HEZjpmhYxrRqn8Qsql95bwZMEaoaoxzQb5jdtHcjMsO/M
         /+gEve6x/qchKXdPY+BVZO5DVek+2wNKskSrPoQ89LElM96ibebMz1ANB32g6OaiZ2QG
         YzGm3Mj7q3rbg3uEtZLK2X1iBKsxgQwkQLJ8P9KVkhOExlam2djvQGdEcgMEbeQbrSRi
         WjeV+vqtwS+zoPICYrCWKVtXgTrAWoFjE2D3yie4ufUNmjDEzquGnwk8dw1ToNNVH9Ph
         FEf1ZpUHKIkHw2wBzctM7ru7hirh3C4h9WDOMUtsckDQQhGFx9OYUAR2rCxXl/OWHvaF
         Xl+g==
X-Forwarded-Encrypted: i=1; AHgh+RolcAfCN7/hLdAM2qI7XFlvaiL9ZWnxRQmtsOhyH+f6JwpWTBl+BgSgf1w5VyHiZtzAQZiKRdWRYJdtRuYw@vger.kernel.org
X-Gm-Message-State: AFuF++kNJciC/m8u7hbYtqNnKmD4QFwo/6OW8gwzbWqsWYIFhGoQDK84
	gSMBcGvK0MR7B01N43DS7YYYCsUl46Ygk3zJv06R37sGXC2qNWaNBGvTvhhLJ02KiFZeP081Xva
	B+we4N1UzuMaX7DszjX1buuai0yrcJqf+YO+MoBgWRl5ju4eqHIRqpFJ51hpPt9jQ2Bdi
X-Gm-Gg: AYBFou04N0fpfbn0fyS17GZ4LrxwcRriYU2G3/3lw7+nA2h7AUZhTTPgIJSNTiYooy1
	3tSzqO2V4kALPxPxUVvjiMu2Q4c4NC0P825QjRNy4f7fO7mnLMNUB3QT0nQ9YOCtb2eFVL2BfPI
	L9EBiFjsXS7MSH8saQMxnknJErrQCr2oahqnJxFT6/QN3GpH6ffS99/4zBCEgRneIHbDvEY+L6K
	+SfWCcV+lGNk0DgspgdO9yiiX9hILx5rSUmFMCoXkeywAcfRB8wzS9h9EaveKctrJE6HWkX8KPo
	ZNJyI4jfw9vbYH0V++8bSNN3/XomcTHJ8so8U+gj6iAJ0dnpP1zM/yGcWiMTGcuLpsmLnHmlBW9
	oKEWAFxF3BKD5KC3pxjcSag4po4puacWmgw0M1hWX1G6G7SCq/swpX6K07z6v
X-Received: by 2002:a17:903:1848:b0:2d8:d4d1:313d with SMTP id d9443c01a7336-2d94a96836cmr113814735ad.20.1788256286360;
        Tue, 01 Sep 2026 02:51:26 -0700 (PDT)
X-Received: by 2002:a17:903:1848:b0:2d8:d4d1:313d with SMTP id d9443c01a7336-2d94a96836cmr113813925ad.20.1788256285941;
        Tue, 01 Sep 2026 02:51:25 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286fa37fa5sm40641466eec.29.2026.09.01.02.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 02:51:25 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 2/4] dt-bindings: phy: qcom,snps-eusb2-phy: Document the Nord eUSB2 PHY
Date: Tue,  1 Sep 2026 17:50:53 +0800
Message-ID: <20260901095055.42229-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901095055.42229-1-shengchao.guo@oss.qualcomm.com>
References: <20260901095055.42229-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: DFzhMNTJs9e7fLw_IzmuaNPjyqXmH-SV
X-Proofpoint-ORIG-GUID: DFzhMNTJs9e7fLw_IzmuaNPjyqXmH-SV
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA4NiBTYWx0ZWRfXz0LmAnb2+rV1
 uNDXNjT1609tUiZlyVL9MnpbRgvLXSHrToLYvRN1hZZ2AtmPyRDO6oc6egl+cdIsShMAxck05MU
 eUp+lU9IDX/ps+82u+U0BxNbVFlhRG4=
X-Authority-Analysis: v=2.4 cv=U8eiy+ru c=1 sm=1 tr=0 ts=6a96a021 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=aaKdBBw8xNbH9Tj6BHYA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA4NiBTYWx0ZWRfX5kRxrhuCXRzi
 MQqQLPIENrJt8fqdvN6DnY4JSEDjOV0WSEeBbG1x89Ci9pzL6kScG63IPBXIhInlyh5xEmUzSfx
 GRKeVPrtKp8rkyWEQy7ap5j6GAo6fRWO8FnEBTWwaaycTCqAO9iqsssURz1aej1ZjC7mf2mv9Ta
 4X47H2Ps1Jvag/1zOoAq+7Mfa4j1gsTgxTXSvYl+yY4rYD9bOKiXhssb8pBVRxOewBKyCtSdO7a
 EHKE5ItzPlNoMCXP6FEi/yHWy5c0wWEB3Ol7/QkH0RvBrQk2qZ+jgRxJXA6AKatNsuEx1TkAQ6/
 2MNOlgK+tmB0nCfWERhZ2hj4J7zGgQbCew/UfUMgT3NzFTKpYWmP23bnbVN9MwbtZdxfFCTH635
 z+uFVRACHE1T9IyZGr40UkAt45EwfRdJK8wptA4i30WqyAhOzpMivm/ljedEiKPUJ/K62DC1II4
 DmYkUCM97lZhYuB3cTg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010086

From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Add a compatible for the eUSB2 PHY found on the Qualcomm Nord SoC.
It is compatible with the sm8550 eUSB2 PHY.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
index 2140482c8e3b..7fe8c82db38d 100644
--- a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
@@ -19,6 +19,7 @@ properties:
           - enum:
               - qcom,eliza-snps-eusb2-phy
               - qcom,milos-snps-eusb2-phy
+              - qcom,nord-snps-eusb2-phy
               - qcom,sar2130p-snps-eusb2-phy
               - qcom,sdx75-snps-eusb2-phy
               - qcom,sm8650-snps-eusb2-phy
-- 
2.43.0

