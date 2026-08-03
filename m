Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B7A33F38E
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Aug 2026 13:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785762565; cv=none; b=CdS0xBeiPXVR7VXZMuKdIdkfkDYl9EC83iH44GpDtWjIF02Ur7thOZ0OJYgfZV4M9FFoy7jqEqbsWivNyCvrcC91nqOERBOO/cMRvorcrtwPPYRhDGpzd95ksSBwXyS/psU59r/Y0KPxRnNtv2XjJj5PKcVcIikpyYVb+dJr16w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785762565; c=relaxed/simple;
	bh=Ao4k8UCAQ63pTsAXW+nwl6jaANXflQZYV4NF+HzDpas=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=R4Rv7Am2j4B2w9d7fXciVF1UcG6f5JjxkQ4EWxMZYJCLCfDZj3He1QfzXHjjei3Sgn+6w3Ista2KoR1yeMVSiClxbV+hwIkpBpVoruoZ2c/kNSLcR2Mb9viut8PzKtzqqIulrohnFQIbNcD8PEptWX6TVX6O1+9oZtoC5HPAroI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q4zX++W4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jy+PMJME; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q4zX++W4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jy+PMJME"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673C4dfA344367
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Aug 2026 13:09:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Tx+tU+JavHm
	9jlJKkOPRaMWM/yiGuddWBQeSbrpsom8=; b=Q4zX++W4DpOC2XJ2Hlyk3E51ssf
	KnA9bGQ8/Ln7WojVcwbba25OUr5BVB5g1WRiKiqyXbd/KN8uEJ0Q2Md/1SIUMK6A
	o1G9c753HmMVSfdebN0C3x9v/+xDVrlgqyujKQRKjVnJBna50s5Ho+qZRROFPGZM
	KRaAqlLBbaP1YQZ7OhSoz30tnEZGctYYa0LJphUYVrvMdx9oiGICqQJ4OPywV2sS
	e3ej0EWkdyVe7gmP7OmOvPH7WCRDZECSaFvgKhHRQNvbihYn5U3S+MNOge1J1ewq
	71OkQSjm9NDh/H6NwfYoUDQiyyzuFPWMzcK1+Gw0xTTpBhn69cLs0jpoGwQ==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftp4r1j4s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 13:09:22 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7f18aff8226so2767477a34.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 06:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785762562; x=1786367362; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tx+tU+JavHm9jlJKkOPRaMWM/yiGuddWBQeSbrpsom8=;
        b=jy+PMJMEqc49CHFp8k4jQrx2PoslU7Xq24aI+gt/XvhTV5z8biEfEsNtCAgCpBpZl1
         Bq3BOx5MpR4rH1nY54MpV77RJbeWf2ri5ktfNWFGqIyERpBHjMHsiIoHB7O1SVcLEqAK
         RzQhYvk+qLOOEDoTO4n9pzs0FI+EB2Z6TKrrkfDYCG0p4QnM3V4qSycWiMM7k0fmP6G2
         yRQTU2pdeiNEwoHC9NLCMRIQEnXdS5s3vNFKQugeelhDET0OS1i1wSadCizI5LulaItB
         Wh0+Vf0pjouGd7Wa2KXZurmO6//Lf09rFDJCB3jG2+Hk1SQdDE0RM0DEF1/xmeD2H8U1
         /UtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785762562; x=1786367362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tx+tU+JavHm9jlJKkOPRaMWM/yiGuddWBQeSbrpsom8=;
        b=pUFuqBd6q5GOI8siC0hbbF+nZ7TuCcIUp91bxUip3uWBImkFOPgDxszjPoyp83plci
         VSJoiOdg+xF9iYjlzgWSuwH5rnjLKGffQB/ndBQUzZNvEFDqCmep19W22ovFlVNM0Y1T
         kunpDZIcwjt6bG5AR5pJQoQTwfvZdDtCKiArk1h/xdyBCoNADKN13Ve3uBfw5dLylqqo
         TMeCFXPA91/Ut/3o/HeVW8HfY+xQyalKJ7kj18BK5hWU/NZr/XXkBYzVQsuMG+Jljdf7
         PIkPC36fRKoeI8zL0haLyYyO6FHdIzRriuZe7wU5IGwVeCDa70cn3+fqAkgPbERUW9Ef
         klqg==
X-Gm-Message-State: AOJu0Yyt+83QExtGUGkwHfh3hXj31k35l3jCf1ve3iOSKLCIPpP1tP8q
	nVNQDQpoRIAo1cvnLmlpqB33hdlYKuE/phZncLJhze4ZneWDhTUIeclymNqInuYy7+kDQT8+SP1
	MEjne1m+0Y64BormBMLVp/lZ/83E73CJMBKQkZDapucHKCuKynZryh71639oWMpqbf9FW
X-Gm-Gg: AR+sD11KofUsfc2LsJOTAPkLgQ2h/GMGLXzlVmOL/lAtayN7GxreYtJ1yujTz5F4075
	olqzy+WKn9/3bl4qQ9BiOBUd4ilSiZ6bFB2IkK+ldRFtLATMW/CrMAe2pg/KUvWLx4xX/5y7MAF
	sXVoWsvDj8Mfj5xMeW/LnRiHZuQfX+OjjWxYBt2UuYwmCt3nOR4Q/P/Ak/h4cyCYnejsQITtgX2
	wSdvcdvqTYxalGWOMKkMu7G6i5vWYG/Mut9EmymTQIu+RqWdNfrPOVnWrPxmvWqzT2f/yyPNkWA
	SigY2qBo5shqA+GYWFrajrfcCjSC0dxYmhAR16TtAbbU4UVh7E/kLzS9vCsiF/xzpvk2y+Q9uZr
	choOYT+GlZdMJb53pnosRL32vFO/0CPuh
X-Received: by 2002:a05:6830:8299:b0:7ee:3bdc:9205 with SMTP id 46e09a7af769-7f1970380c7mr18910195a34.13.1785762562127;
        Mon, 03 Aug 2026 06:09:22 -0700 (PDT)
X-Received: by 2002:a05:6830:8299:b0:7ee:3bdc:9205 with SMTP id 46e09a7af769-7f1970380c7mr18910128a34.13.1785762561654;
        Mon, 03 Aug 2026 06:09:21 -0700 (PDT)
Received: from hu-pkambar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f18f0d6ef6sm7366929a34.21.2026.08.03.06.09.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 06:09:21 -0700 (PDT)
From: palash.kambar@oss.qualcomm.com
To: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, mani@kernel.org,
        alim.akhtar@samsung.com, bvanassche@acm.org, andersson@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, abel.vesa@oss.qualcomm.com,
        luca.weiss@fairphone.com
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        Palash Kambar <palash.kambar@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5 2/2] dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Add Hawi UFS PHY compatible
Date: Mon,  3 Aug 2026 18:38:52 +0530
Message-Id: <20260803130852.1432714-3-palash.kambar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260803130852.1432714-1-palash.kambar@oss.qualcomm.com>
References: <20260803130852.1432714-1-palash.kambar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=X9Ri7mTe c=1 sm=1 tr=0 ts=6a709302 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=MMZtLZuhhDi3SW52_uAA:9 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-ORIG-GUID: hPAWYjaWC4NuxOLMA81gPMFhe7CF4QyX
X-Proofpoint-GUID: hPAWYjaWC4NuxOLMA81gPMFhe7CF4QyX
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDExOCBTYWx0ZWRfX6dba2Xh1/iT8
 g9yXUG4miMsHjetPVobSJS6clWaipTE7DE9vjpjDEPZZcDaI2Fh1aMVVrPZmkHofq3ApPdf9woP
 6h8ufxE1RuffSvBWY5zpUOYYU3q2xpg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDExOCBTYWx0ZWRfX31L9VaWE0zCg
 PxMviCy90QCrRyRWQcHFjvy+Kq5RS3xzTjr6+UNQ3hXcJzjja+oc4cOxf4c9hiqc+M0/KvHaI4A
 wJgcXwgRdFHPZ5LttQ2d6QVwRHVuCNU0UcbpplBuivTL02YZMzAXoT5hqg+wSh5gdX+33y5UsW9
 T8gYamIspXKQTE3Tdir0IUdEPeTQtPEIvyPLLb2vbpMMERAgpug8n4mH1iE/orNQKzk0A7CEHZK
 I4ZWXdSF9CwbpuHdwv/mdQA3bihVAC4ELMdyg91hd9mWzcwHPeisn7JZRLsnDwF6mXHn/WyfdCW
 dyJjTckNwLH9W7Dn8A12G+KyylDeH0rjEZ5qzToYWaYOvxKkWmoOU0vDSjxyBwKOkDKs9OBC5O3
 0uwBNBg2xTQGAS/sL2N/UjhpDfIyV4UQGXMKsvgp45Q4iL8xO2oz8YYY0leDNTAwRsCRcpVHeAu
 hJCSFwu7ClcqecHjfPQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030118

From: Palash Kambar <palash.kambar@oss.qualcomm.com>

Document QMP UFS PHY compatible for Hawi SoC.

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Palash Kambar <palash.kambar@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml      | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
index b2c5c9a375a3..4efe40c0dc97 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
@@ -38,6 +38,7 @@ properties:
               - qcom,kaanapali-qmp-ufs-phy
           - const: qcom,sm8750-qmp-ufs-phy
       - enum:
+          - qcom,hawi-qmp-ufs-phy
           - qcom,milos-qmp-ufs-phy
           - qcom,msm8996-qmp-ufs-phy
           - qcom,msm8998-qmp-ufs-phy
@@ -108,6 +109,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,hawi-qmp-ufs-phy
               - qcom,milos-qmp-ufs-phy
               - qcom,msm8998-qmp-ufs-phy
               - qcom,sa8775p-qmp-ufs-phy
-- 
2.34.1

