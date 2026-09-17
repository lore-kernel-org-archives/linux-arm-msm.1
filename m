Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED594CA79E
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 11:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789646152; cv=none; b=tAylXUit1yfNVbjpX889nNWH1hoTCF7UsKgNtkegX009yPIOUk6rrAoPqQkIzr/0Ea32GVJvnv4ESQ2ciZmhPytPEcly6BjHDrPXyqu8nPFjzp28m+MnhVGK5zcxNdXsIB5T9y1hTummjv5mj+lneQMHMQV3olHmNxAgSWm+R08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789646152; c=relaxed/simple;
	bh=8Y/Yryr+3XGTC2KDLJAw3X2zoXN+s0VBq8d1yH/B5P0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HRiT18RkafUS++Y7cZsGEekHnvX3nOuWoH7FWudGK5tggvJf5BQrF7/ZZNmsg+3YNKAu8fBQ0KF9BUCBi3YZk5GeCo0pFgW5tudcxv3VooQD6AaYkUSnl1eygskCxoqp7HRK+OpYQOZ9YhpWKHsS6xxdA5jwn1T2FSFnkE4vlks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IMjuAFEI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dQqjzrTF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IMjuAFEI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dQqjzrTF"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9a39X4187018
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 11:55:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YX/BsQHJpnY8xAxQH/LA2hxSGp9XpFZNKiB39FJZvKA=; b=IMjuAFEIcHErP1OZ
	6Y0w5pTMYElrDTM+N52jMVfJ1KDuHQv8tSkD8ytlFtYrNs9Zw/i7rfN82chXpii8
	1UJI5vuRl9Vk47eoGlR9wwWYe2ZKL+WAyEH0XelTr2nXwrySfYqAWt6QqDFEAkqj
	pual5wExIPfLlTkd4Y5ngEy6H6b0zseJieMRc++45qXK6Fz8yp+M/6F13vbh3YNP
	voogxqu17Jo6cXHXaot8sWnEnVHJ6qMAB0urqj2ssBZaqMqJQdqxQnWWZPP4Oq87
	N0EF/Qm8qmacYo5pR8mDf3yptc63YveT4zY4LGOxgceBtmET1omLX4+B28ZP6w7x
	E90ELg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gr7uca1t0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 11:55:32 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb11535e6a1so622574a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 04:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789646132; x=1790250932; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YX/BsQHJpnY8xAxQH/LA2hxSGp9XpFZNKiB39FJZvKA=;
        b=dQqjzrTFd1Chzzgs3qhvXlyJRVjx7RidjepDR9A6cSx/XysmrOYv7E67ZqAh3OB+r0
         Wd85oBfh3UTqvST5ywUjLCKG1FVBfidVqFs+UU9ToB+LTLjLv9vkaHumc/ilyeeQ1jGg
         TTW5s+0FO5f48cs55RlHKQI2EJeMcWtpVLDN9GhXNFuBzw5z+8iiwfw4JABS32W+4FM+
         IqwLzWBPtSD6kTbTgueRP880NdNCRxNu7EurAnv1Fc5+RchSDI6JBPoNfqJ7ul4X79tS
         kcPBDMy8jLW/RBzRtZWJd3sXpFukyrEs4EWj0VbTdGU4krQfQEFDkgoR/K2O2aisw1eQ
         zDmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789646132; x=1790250932;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YX/BsQHJpnY8xAxQH/LA2hxSGp9XpFZNKiB39FJZvKA=;
        b=RTLOXb1lbapYxFy8Zh7m8sOGoEurqJ0fXUxHcZuZ5lWNT9OtbiWehxPz59ASyyk1PU
         YZeeiF9yUrt8f0jhd7Q0pwQgj84fPZrCLoIdRp7dcr5NOcXWR3VuKgK79Rs+5AlOoR+6
         FB0Hoij7oBLmRdPoC8LF7SW8xJ7FY9pN+DgFE7jomCzhpKjE6Mksqs+T+WqLkmtOTyNR
         RI4/6yZQ1VrpWRF0erkQ9r4D67HZ6Ua/Y4nADyiPqF+LoYUVdo7Ia0ujEKLjx3+8OiiI
         M9bDo9vQ6t/EoDmk2Zm8Nf1AngacN4i8cjfP18DAs7lXNZL4Y1pnZtqdr6mXW58tH62M
         hq+A==
X-Forwarded-Encrypted: i=1; AKwUvBwSUkngun4q+yNp0VOBr2LuzLhdZ//1OtJMSGpupyVkRpUqCUL3qaY7BdU6kfp++TxtIT2vKlS/+C8Yv28b@vger.kernel.org
X-Gm-Message-State: AFuF++lTt4BjUg/7b6IG18bn2X+Z5/efskkV13bxhc0wQY9QWduKKPu1
	h0J4J4OcqAtb11BNI+T0e0s3IfY2I9hyJyJ4/OukR8eAHda89u+krO/t5fzjFf3Iw05m1YIXYim
	8rRNvM++jyIn0S4V5W0yT2PeGsGRTq+38ZBU9n0JqdatR6JDwFp3l3XvkQDxGfHOUN5v8
X-Gm-Gg: AYBFou2lVRm6542oR0qQL6GvnMe+tyVqrIF0Xa1wOB7cI8BymnAhuYGy/puBgoZqn18
	Xuz2lF4Ft2jtX674g9BKmHZG+qoFpyGcwMilcCQkoeKcvlCQB7UPXxEZ0uo2ua4D9qveSmTfTKx
	WgcTX6J6X4pX+NQ4HyRUY0NqF5ngD96mCkjseSF8YbgDAEECP3sZAyayGU9xq709DsPilJcNwQ4
	m0ATvBt82y8iBjfE7+kIlA2sGL5n8cxzjrfU3GCzohJ3WPVodzN7toCZFixCsafGg70W2PKEHJ4
	IvrFYVCy3uLruNKrYsKZuBAnM4+RWd/2vFRCOs+6Dtu9/bUOpSnfUBv3t48AmGKXh2oi8nHJs7m
	a8ZDuTLPN4QBxViRq8/xPOZKVDn4zmRGF+g==
X-Received: by 2002:a05:6a20:7288:b0:3d2:89db:1688 with SMTP id adf61e73a8af0-3dd5f3f9548mr15987673637.2.1789646132133;
        Thu, 17 Sep 2026 04:55:32 -0700 (PDT)
X-Received: by 2002:a05:6a20:7288:b0:3d2:89db:1688 with SMTP id adf61e73a8af0-3dd5f3f9548mr15987606637.2.1789646131602;
        Thu, 17 Sep 2026 04:55:31 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf596e1f6sm18249500eec.1.2026.09.17.04.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 04:55:31 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:24:22 +0530
Subject: [PATCH v2 14/18] arm64: dts: qcom: monaco: Fix PCIe WAKE# GPIO
 polarity
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-root_port-v2-14-0d627d0856d5@oss.qualcomm.com>
References: <20260917-root_port-v2-0-0d627d0856d5@oss.qualcomm.com>
In-Reply-To: <20260917-root_port-v2-0-0d627d0856d5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
        mani@kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789646072; l=1812;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=8Y/Yryr+3XGTC2KDLJAw3X2zoXN+s0VBq8d1yH/B5P0=;
 b=cpI9en3kKAJMtgAoFMY30iR+tVDC+pXzwfdF+OhNFb6e6QqAwo5mbu/43qd0piDod1mXZM+aC
 vO15kKvM9yQBZxE8p/lGMEYh7g3D+jxsvrkLOjiKEB+Z/ZKdV7JTp7C
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE2NiBTYWx0ZWRfXxaCvHIbx9XST
 C7Bj4DUuu7Kscq4W1hsyYAcfMDvOUtf4IuLIwKliyI/cxyaRRPyUn5wzJxyUKB7qP4W70nYN/o7
 YWodbKrbYz/CW6NHxooXnhxanHUmhwLX6VQMkTCB6hVl3omczZsbUI0aj1z2DPHyuVrAapFLDzI
 RVJHPZSzsUnZZMB3qlVN0lmj5Dw8QFqa7emzLJ6VeSQyRy3LA1Z5lekprjKXy5kPWRxKiJUX8RQ
 c3tTsobMl18vzSba2A3iJ0Jt4SttAEio+mDfZU0rjfsZOX8vqx6vYj+hLLfXvp/+ra0zkDH7niI
 yJJH8BOtM33pNjUtHKQN+PHWKP4yZulM9coNpRmR16E/U11fpNPZA1Uf/2oaRhSuWwBP1a7xcau
 Mcs2Dm77MtC8K6cZ2UlDVFNCaGahYx41d0a8meUukcfZDxOrZ4kqHtoD6bm8sO7vb+tkAXUelRO
 M4CQqSEhs13WiwD6odQ==
X-Proofpoint-GUID: qkY8lyLwTAz0J5UKZz-skb9MHXjwyiBP
X-Proofpoint-ORIG-GUID: qkY8lyLwTAz0J5UKZz-skb9MHXjwyiBP
X-Authority-Analysis: v=2.4 cv=F9zC5ahN c=1 sm=1 tr=0 ts=6aabd534 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=_k9ig2nQFDp-gxZIyLcA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE2NiBTYWx0ZWRfX6MMDZOISLich
 cyX90kPgHIDS7vX0C0O7cYQeBpCSTwytHpHRsDsXoFLpBofGTgnBHLEXw+C0ibX3WnGNGXq9knD
 EouvzVN9hozTxdqCYaZGNf+uw4V6B2U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170166

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-evk.dts   | 4 ++--
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
index 9d17ef7d2caf..b30fc7ecdf32 100644
--- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
@@ -643,12 +643,12 @@ &pcie1_phy {
 
 &pcieport0 {
 	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 0 GPIO_ACTIVE_LOW>;
 };
 
 &pcieport1 {
 	reset-gpios = <&tlmm 23 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 21 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 21 GPIO_ACTIVE_LOW>;
 };
 
 &pmm8620au_0_gpios {
diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
index 1ff39530ea3d..2472df47a0ea 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
@@ -615,7 +615,7 @@ &pcie0 {
 
 &pcieport0 {
 	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 0 GPIO_ACTIVE_LOW>;
 
 	wifi@0 {
 		compatible = "pci17cb,1103";
@@ -651,7 +651,7 @@ &pcie1 {
 
 &pcieport1 {
 	reset-gpios = <&tlmm 23 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 21 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 21 GPIO_ACTIVE_LOW>;
 };
 
 &pcie1_phy {

-- 
2.34.1

