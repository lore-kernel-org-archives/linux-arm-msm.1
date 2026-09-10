Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D735C48F842
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 13:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789046987; cv=none; b=NjxE0Gy/i7NhExU3n5/100TLTvcAhGPl9LnbdRkbGBu6hvePfgD28aaD2SzJJxkR4wdhV2vTL6kkjo4VnzEfFy0K+QQW38Z+4WjDHGG9jmq3iNVwEh3IDsYgt4fRQl7cBQmxnJh11OjTe4FlvFjlfUOmjPAYminVaMOIrPCacXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789046987; c=relaxed/simple;
	bh=8+4xmLOkorsEWAkmC/1FUibHOZhU94NEBX0Mwvgx1z4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H9RwY9xDYrfEzx2vsKnFhQQnPIGgA5l2SgwbU8iteQgLY1EDAQgNBU8lCbYceU6aBnPUBqN200XJAho+JzZvFQGM8Hy17R9DXVlYIeeuCwm0kiQLqr441pJTeqx5dr0wVZZXZakqZjVxUbgw7C9pYd0rVN8n6WkYiWnIWizDjlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QxKDa6k5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H1KXh6JQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QxKDa6k5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H1KXh6JQ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7e3k1440466
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 13:29:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3VP2laIwY2KMI10T3FmBbFvr4EihrkUSqLsipKOh/v4=; b=QxKDa6k51P7V1R54
	60TAiWt4ItSeY1EjYmpFOAbN2GQMJtcaD3wiwrOKMzO4ASBmupPs+KEyKN8Pgw8t
	rf//jOYPrRVRndwHK/SOcczOuhfvlyNIiQMWyEN4R4IkgUf87dh4WOJtx8VWMM33
	lu/XurP7td7KMCPpf5LoCqrlRUv0mAbX1f3iBe84gAU9xYffFE0OEaJIwoDdEPfA
	uiSGbbeU7EXz7wjIBcgp/YsY9fBG8TVl95Ya34B4BmVs08Oisjj9E3NmIQYOWO/j
	GjrfAeaGWbu/BBRgQ4JX0ODmEMQCgtnjHW+bjpQoaqdZ0xuxS+8+AVCQJJXbMgbO
	Eja7MQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkqsvsf13-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 13:29:44 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-395543dc382so3467721a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 06:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789046983; x=1789651783; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3VP2laIwY2KMI10T3FmBbFvr4EihrkUSqLsipKOh/v4=;
        b=H1KXh6JQvnJq8OGvJVEtoHdHYlFGy3NvW1iTr4MdFu/mMDoBm7mwMD2q0O5ecERoNV
         yweA2Ddg9XA2I1NPdSpKHIetMUiX98Y+ZFvBk0/K2zO0ymhCweedek0GhrKVLUtUy5lC
         nvRQtGAMih2GqPm2qPCXY37ZBgr1yFh9WVosD0PKsGbhJlYK6NM2cwHWE9ngM7vOR/OS
         2kN+N7JlLZpG8hLKWFqNxAFJpy0oc6H19PmqMai8wB3XV3f0XZEtNycJueVLT+zZqeMS
         u/UH1T+kozXrfjy+a1c50OigC9Z5TJKFuB26LWNUrFCh1LZt++6uMOVrcPvOOBfo4DBf
         3rsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789046983; x=1789651783;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3VP2laIwY2KMI10T3FmBbFvr4EihrkUSqLsipKOh/v4=;
        b=svkDWWdRYgsFRttd3UWQ671MzHMHyfQFdXttUrNqGbUD0+tI2q9TPn83ZsJH737T7D
         UoZq1l6goE1iGPIuMvunKd5+0r9OHL4Ou5bcJOicXWwag82bDGB/20W6WZ+d0IDDGsNA
         sYDgNYeRqW4zufiiPo8dQ9KPcrBV/xYO4rmp/73FKuwC31nlNrOoRgNXxcNi27Z4hIUh
         tOEIpgWMUjHmM9jz73IFgk3+Y7x1CepOSriLzFDqhyXfiEi0KWnew+G4mYWbmdDJZLNG
         PxfdBysVAQ0NwuDRE1dJaoCdsuMNDxE7XAHAJAxKyGJoZQd5rkj70d+/Bjqkp5I2zWdE
         /VDg==
X-Forwarded-Encrypted: i=1; AKwUvBwP7xBAnQEpR6A0KZh8/falNreGwEGmtmab7M6PBKGRT0gyzk81dubMe1L9ZimmOZ6MayvP7mHxRarFZWHX@vger.kernel.org
X-Gm-Message-State: AFuF++kiHwy1wuv519ajHRQ2E7B34GQI/sefgZKGjZgj7ycavQHnl1A+
	pmj52QudLdIJzOcIy4Hjm2DCZEqTZ5ovKj8JScL3lQsjQDAmprf6qsNXD9IVwBcWiYqguem1mQ1
	CEBkCytuv0LW1TcZojE8kcXw7w/p+rHlnH47oi+R9HvG2DcDdkhRtb0DOVHrLGDuSVsU/
X-Gm-Gg: AYBFou3EuvSEEC4pxLeBQN9d/HlZ+umh6htEkBGKLk+98L0un8bJDrZOywXKuIJskgX
	avETflleJIXP6VtTGkRNxMarEe0OIarZ6sgcSk/DwZKWk2sY6liLfyLF+PTqIT7OgILyf2ALSiE
	0GAJLrfUXZL7JXrqUcxDBhY5eHMeyEumJ2qlr16kt2kL2xYipzMJOgMBbq0Nodog8CoI733lJnD
	Z7/JY2GrRQwBeuZmPJpS90zpJIO/wnY/qq0bt7fuuIWkZ49+9PXnxSkHEHDj/NPoX5UY/G3p33p
	RqStBBphqsn4EkCUvlyBS+TjopBXR/gFb0msV2bivHnf5KJjGMI0MOOIMCjlTHj4K6uA9Zlfbh4
	f2/Wwlk7x7WjwgNZYx9ikVybEKNBhYRDveOw=
X-Received: by 2002:a17:90a:d44b:b0:398:d93a:b343 with SMTP id 98e67ed59e1d1-39d709e7326mr12719566a91.3.1789046983429;
        Thu, 10 Sep 2026 06:29:43 -0700 (PDT)
X-Received: by 2002:a17:90a:d44b:b0:398:d93a:b343 with SMTP id 98e67ed59e1d1-39d709e7326mr12719490a91.3.1789046982982;
        Thu, 10 Sep 2026 06:29:42 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-338f7bad290sm21568614eec.14.2026.09.10.06.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:29:42 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 18:58:57 +0530
Subject: [PATCH 08/34] arm64: dts: qcom: sm8450: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-root_port-v1-8-90a252ddbbfa@oss.qualcomm.com>
References: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
In-Reply-To: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
        mani@kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789046944; l=1321;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=8+4xmLOkorsEWAkmC/1FUibHOZhU94NEBX0Mwvgx1z4=;
 b=8oAYFNZil821doteGcDLsZWB30la3Nbwxl1GTzv0s6CzC03wosJausEjEkmd3a0NZxTYsC2lT
 ZVoAK0SARo9CQsGWy0s0SjgZaG9wdBsi+VrsmsfpylNIGyDDQEk9o7+
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=DdOCOftW c=1 sm=1 tr=0 ts=6aa2b0c8 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=_k9ig2nQFDp-gxZIyLcA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfX9CBNDk0Vuzxh
 CiOFHRpqJVq2jnJXfMdlFYaNvD5zVrKKhu2SSiZdh/nWMMzJ1TM8EMGqucCXdXNtBzk+UZ3g3bX
 IC403R2xctYMtFrnNBOCW59AyxU2kREa0eKJa0eSFqjO921dBMaZTolrfWGCkFk4rrMWU65E8Bd
 kl71wOOfe1S9vXqLawZ74yr9WxNshYFURqe3khO9PnD22kIGVZ0DeXaG13oUD/+z74EQoqt0qrx
 ZLqU8VNiHQp1z4mC0i0jV08xKtpazWNqcZWdjn8sj5wOlOsJN3o7dK+v2GMB5z91fPv2w+qnnJm
 khzhoet2jTIkekoGNClWdyDo6Ew9Nym0e1R/efHFLxmu0/E1jWg9JilBSbObeKrmSOMh61AuW4v
 t5u7wYsTCBfhve5f6q2jEJfhrupxyAtSNCxxC1eZdN11aNfhu+Si5cM3fG1tjx27l2ynJSnjopq
 h4nouzLIUp8Z9nifeyg==
X-Proofpoint-ORIG-GUID: ZhZpBRFz1Lh2Gt0Y3x-y97zXWj7nLJT2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfX4lWz+6kU3sbc
 3R0V1ihSq9ZyWj2fjRGZ5WaIXL4Yb4zCoZvEVxAKc97XNurGQXG4yh6RJVo9Sf8vkAH5wrlVWhm
 SdhniQifmgHa+uIggLQ3iWa5DuMUgyY=
X-Proofpoint-GUID: ZhZpBRFz1Lh2Gt0Y3x-y97zXWj7nLJT2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100161

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index b8793482b181..7bc5f85e7ebc 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -2021,7 +2021,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			phy-names = "pciephy";
 
 			perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
-			wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+			wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
 
 			pinctrl-names = "default";
 			pinctrl-0 = <&pcie0_default_state>;
@@ -2186,7 +2186,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			phy-names = "pciephy";
 
 			perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
-			wake-gpios = <&tlmm 99 GPIO_ACTIVE_HIGH>;
+			wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
 
 			pinctrl-names = "default";
 			pinctrl-0 = <&pcie1_default_state>;

-- 
2.34.1

