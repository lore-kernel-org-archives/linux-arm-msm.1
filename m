Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8283FD147
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 11:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785152698; cv=none; b=f1C9HQGM2ILVmRNkJn2bLBTaOTlILWT+ugmGbwhLpgYv3OgXjkmPHRanBvnP8aj94YZzvsDE6+/E6zvr2RQocbE/yNUF2GeUBG+5f6/vrcVDF31K55yuJPH3/6MdVH+nL5GYuAXFwhMS7Mkza9ck8g96CABfu0I1jArPgiXoSqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785152698; c=relaxed/simple;
	bh=hNIyiUwZhOPYSatnJ4WkxiE+x8C03xK8Iquoy+0mzD8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VpXF5o125zjlpzT9iSiovtyAHQFLQxgdw7LoMvXIryouEpOib5aQ9UdFVwt1BHStI+cpp1DtF+6yGSeOKDRfQVHaMvwMR5IHR2mixwCdGx1sE5fv3Cywi9/N6JbDZIUIoxvC7dR2iHwXGkbag7Mpryh6YjaU+bh+7HhFlxmHQag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DZfnzgxh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GPWzx/vL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DZfnzgxh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GPWzx/vL"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RAM3XK2948611
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 11:44:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K5KY3nNq7DE64d+oeLOd4ZdfCdILMoIvJ2/3c96P1oo=; b=DZfnzgxh/lPAi7fU
	/pT+euZak2wVK7uoYgHcEsFgSalgTZjuGRgPYCXupb0XjddS2RU1L5JNM2zsLC50
	BguGrpowMoOhPEcOQd6CYQ284tuu1v4lZxF5uA0nANpChy0PbARILv/GGsAlu/8z
	itELydgnfk8/raKWVQG6qQHBu0kRpwHD8C+WVPP4/2trcSMK+fUO9spjnHTkOyav
	E55j5iB3zXdLeWVZ3WoqMxiQdnBc4cOgEOor4I9fNJ+A8suGrZD5yeTOggGxXJi6
	TuQk8hmgzG6CfYvR+zs4rnqlF6hyu1HNdBS5JNmDgd6Wdj1wUf86ryfCDwF5QTh/
	Lwzkvw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4v68eat-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 11:44:56 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52827090cc5so33892301cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 04:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785152696; x=1785757496; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K5KY3nNq7DE64d+oeLOd4ZdfCdILMoIvJ2/3c96P1oo=;
        b=GPWzx/vLna+aRmOl9ewlzz8IunWDGA01CSjZTvZbXiFzpN0uZhwl/WnfC3Tk9teQ9o
         cM6AgQtOCzNKhwNXJ5c9apIOCMEw51STmQvuCUOMeYLVXrVdv+VCAhs+C+XqjgvKGNUc
         n1u/VRi6sJmxdE4Y8jqO3LEOwygsq9KkjeYfaEs94XlnH+2i2q1llTmc4aE11f/vlft+
         utKnVe++u6Kjpm1Ne/B/aD70H5CXefvabubfDkNW5mHT34auLYxFBuJ5pG+XvjKpRYdf
         LdosFEWuLNTXfBZySW/dug02OK3RqR3ggUfZmqZ5Wowe6SelfBeY+B/EH2w9ROcJkYwX
         CEpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785152696; x=1785757496;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K5KY3nNq7DE64d+oeLOd4ZdfCdILMoIvJ2/3c96P1oo=;
        b=PSXYO4NBssKx6wvYMpw5TH5bdnsFwt2er00xcLxNe3Kz32JBC5Ni2NoHu2uinsgeXN
         ZaUN+qiqTkX68JLkvxi1Rcjf62A7iumiNDSEoZCWH6n7GkyYm66V7odVryBrHakvUE7J
         3dcLSZEcEydZOMrh+cZuAyCMGWsABMWg0URGewp9csSVJqEaSQ7YSimvqORRzz6mjR19
         CrjU2/Osdu7Wunmky+aUO3oDRlCw7HAkoGHn1lrG/qLTJYl9RUdVBvJe2/hs69ODnGY8
         0NCHYBem1nBCwryOILmku8s/9Ae2MKnHdNvXueafVYvRDMqOAHzKGFH2VvHBgqYbwOjM
         7QEw==
X-Forwarded-Encrypted: i=1; AHgh+RrnrNRFLJBw44x91yCKZR9SIj3NxJ/+9V3jrElScejKIsRU3IjCo3YbZG7Uk1xFTB1kIt2W9uoXTJxNbIVm@vger.kernel.org
X-Gm-Message-State: AOJu0Yz04TYOMpKU0QiKqJrahTNb9F1pP6E2lKJMpLpxXfgibKU6982v
	ufwH6TfCE77Vaxy9CXzUc7lP4MnNHBDdKCy1BgleP6ILhKmXiMyPCBepAm5BkBoknb6CRtTiest
	tBXr00VtoGugL6OMwpKMZs2AqAvtq0Pdrp/dMRmaOWoHdkwoSJytfKwxEmMQGS3lV9fSV
X-Gm-Gg: AR+sD12t72PKV3YuiPxSAv6cCP00Jnv3xLr/v8UCYsUzi4a+GmuI5GN/Jd0L0qowl3z
	VYXkJflu54LXgN1T8FLJZJVawAEOoFidd8+zIms9RgouCJBSskNui4uS+8IfpPZ1nfT5RbslMds
	kk9wOxdTGr6Skf2DjUWikP0njsIw/aMf0Yvq4nkLFe+bcoUwEKD3jS/DLL1XdSf6BmHo4Eu7teS
	1QDBLOPjzZGduptUzz5AhoDycbsPZn9VUfVRSUIRJhAOYrp2hk7pow3d0ZDO5wGBiM4LZsjJj1f
	3A/TqxgPVXaDtclBq8YSk2cWg5whqzaz7t5NzaxhDu+d6k4c2e8M9b95EYgX9Q0vrR2V9De3YOk
	JLgHgsFdQzJzjI41YM+WVWlgq
X-Received: by 2002:ac8:6546:0:b0:517:9407:5c38 with SMTP id d75a77b69052e-5295d377f21mr107541271cf.24.1785152695838;
        Mon, 27 Jul 2026 04:44:55 -0700 (PDT)
X-Received: by 2002:ac8:6546:0:b0:517:9407:5c38 with SMTP id d75a77b69052e-5295d377f21mr107541041cf.24.1785152695439;
        Mon, 27 Jul 2026 04:44:55 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c6e9a2sm50301883f8f.35.2026.07.27.04.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 04:44:54 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 13:44:45 +0200
Subject: [PATCH 3/3] arm64: defconfig: Drop redundant Qualcomm irqchip
 entries
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-irqchip-qcom-defaults-v1-3-ed80ad83ca53@oss.qualcomm.com>
References: <20260727-irqchip-qcom-defaults-v1-0-ed80ad83ca53@oss.qualcomm.com>
In-Reply-To: <20260727-irqchip-qcom-defaults-v1-0-ed80ad83ca53@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=740;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=hNIyiUwZhOPYSatnJ4WkxiE+x8C03xK8Iquoy+0mzD8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqZ0SvXmFWTxA02Jxz+lYH8YKsuSh5qq3zjwiXT
 WyAJ6iz7OaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCamdErwAKCRDBN2bmhouD
 1xYPEACEJle5TJRaQYLQvJ06vZh72akTK/Uj0yZZBJNK9OL4z5NN2F7SiqhRJ54++tdexsE+ec1
 SXoAm/6p3244qJvm68aTgNei9Ey3IjPpenxjGic0Me2j+7jzD62U61GKHHuXOod1pJqYa1IrZ1u
 6jgURKN5eSNOjaEl0y/ad/n1YTwrZKtIKkE4j0LepuKwGiJRI9XnhaInU7pbgsQkAn63I6sQ3w1
 5rJBCTyH3y9rH/43ABQmPomqORbmE9MkHHR1+7LrvUppHQhGqxvgREpwIo/5dVwX2WUWJj4Ki3J
 r6sJWKdND9+W172IaJqH2/9kQjsZ/IFrIq8WCOaTvRxlBQmq4dsoqwgmN0tW9s+XbvHJVvw9KBr
 ZtNy1DAZ1ESZMDVAgimIkHK5v2677978bnCkn5ftbK3WeaRAEAzlM+QIo0zRlKwVyXk5kMIdm1m
 t6jUKPKSKgCwzFUd3NhvAAWHI5YlFnjVSVStg03oVgdn8Gfc8EMMZj744+FejME3Bq+V5RmbkHk
 ol7aKeFc1VUAXAbJ8tBlTGgWMuQxdgInN9TrW0LvFokNt+K6OuvI9cvSe0paPysEj3DxbjgC7k1
 mDhUuwiAfR5K6vylq2fathh0QUUOT24739LAajtVgN4E4gmumXcev1htUJmEKPTPeNYSanEwxyV
 tdepttBcYTFTtSg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDExNSBTYWx0ZWRfXxgM+1jgh0wCq
 u0oqOIiu2l31pmwQNGs5ATl049k3n0FbjEavuRS31kGgtLYhu7ANsbAJOG3q57hLsaDkm3sFNdq
 Zqbsd8J4RkdB0+Q0XOa9zYH/2babQ5A=
X-Proofpoint-GUID: fpBd1ist1yOgudxSM5bKkaIW6yq_1BaD
X-Authority-Analysis: v=2.4 cv=ev3vCIpX c=1 sm=1 tr=0 ts=6a6744b8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=cKvvBjE-lKIiJghTDE0A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: fpBd1ist1yOgudxSM5bKkaIW6yq_1BaD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDExNSBTYWx0ZWRfX74usyDVZGQC2
 4l6IY1qd8vp1t1xADyBCLzqNAimHsWbEg1OxoEGWTZ/VdySNLpXhB/Qcqn2pMeyD1z8X2L0afXz
 qqo7TaPWcwxiaPIS+pKNDXlQn79a/LXxYIIwfjsVV2h3jAl54o6yr6bfQY4uA+kAefs47Vg8NEw
 5nJPx9b4Oc2186+7kTbJbWBt0B2kvcet3msZfNqwg3FjQcXpoqJPh0w91i4B/JeK+cjvhufqwhT
 uvRFenG/R0JMd+HmyMzmHKsvyO1ihXnCuH8KYsddIfMAWZjTA0bRdYAPZBaiBgSM1hXvvqumwmj
 WNcDlUzQv5XcJNUkz1LUc06fFToIAAAqawp0SmxsTextsnKXaPZULu2aFqfgrS6NEHuFkWXm28F
 w5xV4ZcTBgo0haN/kffWV3lGEmoaUzU23N8vVRr9kOpqkjV2rlriLsyxCouy6sqgZYhEDGqk1WY
 CRmSNeDUNOOWINyxjjA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607270115

QCOM_PDC and QCOM_MPM are enabled by default.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Depends on previous patch - this can wait a cycle and go via Qualcomm
SoC tree later.
---
 arch/arm64/configs/defconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 6ec8d3a69c98..978e00891dca 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1743,8 +1743,6 @@ CONFIG_PWM_VISCONTI=m
 CONFIG_PWM_XILINX=m
 CONFIG_SL28CPLD_INTC=y
 CONFIG_XILINX_INTC=y
-CONFIG_QCOM_PDC=y
-CONFIG_QCOM_MPM=y
 CONFIG_TI_SCI_INTR_IRQCHIP=y
 CONFIG_TI_SCI_INTA_IRQCHIP=y
 CONFIG_RESET_GPIO=m

-- 
2.53.0

