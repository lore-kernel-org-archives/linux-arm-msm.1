Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0FF5377574
	for <linux-arm-msm@vger.kernel.org>; Sun,  9 Aug 2026 21:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786310977; cv=none; b=OVUPVhlNsDWRXImAPM4OQV8pkTr7AOGJzygYyjSKuGNydZyIdM8hk8LMHLEi4rGuG0q56jNSLibugdIPGZeOJ2uCgUcYwwvjAJtSnWMZTVo16NdUe2sRWUq8EPcl9xXP8b+Lac/d3OP2RTuhFtH8Ot3kPqNSz92TMWqvwGIomAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786310977; c=relaxed/simple;
	bh=jgf8SXZZdg8yn7G96UMAuhh5WZwvNapKXO0ftwAr1TU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hDLZEw3RDmf24rUHmTCmD2k7jMAD591j+fZSC0qwkTdBPijO+Yh+zBnA5tENWm9+kUsdGs/7Ey2HqhY/uEtQc8X1vyzhalhu/jYBlEHjVRaqFKyIoyiw+nY9XHYDxF7JizNg3gMqs4XJBq+/p2SoeVz9YPBwz5sPgJWJ0xGslts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SiNqxopQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A31EK4QZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SiNqxopQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A31EK4QZ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 679L6hQQ4105424
	for <linux-arm-msm@vger.kernel.org>; Sun, 9 Aug 2026 21:29:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cd3jtyg6s34A2Rwus7U5Bm7U3Mlc5r7JJzTGY72wPKk=; b=SiNqxopQ//VndxA0
	HLiXXfiFyZxQWAqk2xZsFy3pnm8j8A7d0sswjVlPqmxqHxBM2LH2dFFHcjOEY1n/
	jH2wSEzjF9PILMPM2v6X7yEdmwMkJfQq57eCurswhofgAUHUJ1g7QSqeMwK7Wgw+
	X1FCo6R3mr/zclAwL2kcunbYSzOjsi+2VWP/Y1gx8Y5qdc/ucB+Aj9358y4ZsRGV
	nwDjkEwpXf84Mwcjc4vZR36JH3yq7PYT2xCwqseSxX3B9y/oXvUutwioYVyyV3bc
	sDXhI7PyQZ7vyYM3uGDjGpMcyr6EuOrSEE7iLb1ehlLtZRKw++n77NrWDKEfcbAu
	9g0Qwg==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwuf7bndk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 09 Aug 2026 21:29:33 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-81ebb5e11caso36572017b3.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Aug 2026 14:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786310973; x=1786915773; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cd3jtyg6s34A2Rwus7U5Bm7U3Mlc5r7JJzTGY72wPKk=;
        b=A31EK4QZUdoogW8njkbNB3H8uHyxqDEjzOHtfQsT6wAIAh5FRx8t02EKjl1U8JsBwL
         odfY4t4s9W5/U1bVkVBhsqaN3jmBbdOmkrXtJi09kWRG6wZSwleijUXxVxMHXuY7p0MC
         TYA3eiEcML/2u/F/W1bKVplJUeWQxm1bC/UK2ZRky4eLoY37J5q88XTqQiTH0LEiDUz2
         K5AUQV0fW4qLaB0fvlq4zXUPE9ytVetPkYNKKzQFsizt+74NbYMpPhMuHmINmFK0fdVo
         gECnLW66mHniCz+LIoRxRNVUoDLR8OTFE/9Z8FVUcC/mjyKtJQcsLMFXbAfTtIlu+yMT
         pEbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786310973; x=1786915773;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cd3jtyg6s34A2Rwus7U5Bm7U3Mlc5r7JJzTGY72wPKk=;
        b=HcRDNJcRMcaXhhBLwCpasWXVa90W7QGiGFF97nXS/a7ZGOMFAPleaE3+YFVJf+NZvf
         g7AE1+ty8tokt9CWOM/SgrfDFE0OFqjK9qQBb5pDnIFaMDj7X+NPvo9VuunueaQGJEAO
         drncbXxs3BO4sWmatSx8zVNDyReOqwMzdzFOKQJGwugtyf4XcvTMWLSieldRwwB27bI2
         JNCWu3G1IN6KoZ4GH1O0UDq/TpkK8pGV2q+Xfr+9h8YeE6Nv4QFEOYU5eQ9WIj361KKY
         bF99RBjQrmjPbmB+3f4PMiwKPJ6mSbNo+GHlkoUW8X9GsaI/SaHCttiRTWqc8XuVWNlA
         MRFg==
X-Gm-Message-State: AOJu0YyN4T2Etx9GKJFKWkPONtDVG3m21JjxYeU5P5oA1UWVVb3PXJ7m
	6BFWgoK/KxBlPSRE4mPf6mBZkiRq1VdvJDFFAJRhEOPECVJQMrddXvcnUYotwDXIe1UkJJ/yt3/
	rQSiVGgFDp3lpzfTosDrH2SgaPt2JqAHspUee4ekgH4/9rtlTcMhUFrPNsP/MQP9VVZr4pKELlD
	VZ
X-Gm-Gg: AR+sD10ugV2+nCYLLEpQJm36j1b35c84EYvseZ3UmwI2iuWNsktX+qn/q4pifRQvVk3
	DRj1N1iSCZPMCZsRg4lZ50+rTnzNloB9dbqGdSh5n/rSf6C9LEv6BXNKA2yXWZ9270B6qiovm8D
	MHvMwuJ0cCnJXqzy7M40jkv2YeJtKcRDDw0kOJcnxHDazlXxCZkxefM8YOu92zkLLz/dzgOk7hh
	0U008zKtvwJI4AITfW86WqDsVgLyWGs6dTCL9PmEJlQMVKMQrutWImC95MrniicH/ir51APscD1
	+hmIkuXoQdeAJQG8n3Fmgiv3JgU6DnQiarn6yb5Sr9VXku7Jv0AGguhNKDkCYJDr/s3B7LZ++aX
	xVJsQEJWue4dfj2fVIGY/Mwl5yeQIyHlt21Rj9LLQ/g3Az1gPdcnffghhA3WRbVLoFj63oDkT7T
	Xljda8yfT+ozsaRbqoWM2M+J0d849PvJwNgK3BrWfqzYs3
X-Received: by 2002:a05:690c:4882:b0:80d:c9d9:e1a9 with SMTP id 00721157ae682-820229a0978mr225020347b3.27.1786310973215;
        Sun, 09 Aug 2026 14:29:33 -0700 (PDT)
X-Received: by 2002:a05:690c:4882:b0:80d:c9d9:e1a9 with SMTP id 00721157ae682-820229a0978mr225020197b3.27.1786310972907;
        Sun, 09 Aug 2026 14:29:32 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([2600:1700:b450:a0df:3150:772c:4c26:ea11])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-823f75c1c17sm45248167b3.47.2026.08.09.14.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 14:29:32 -0700 (PDT)
From: Jason Pettit <jason.pettit@oss.qualcomm.com>
Date: Sun, 09 Aug 2026 14:29:23 -0700
Subject: [PATCH v3 3/3] firmware: qcom: scm: Allow QSEECOM on HP EliteBook
 X G2q 14 AI
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260809-glymur-send-v3-3-2d1ed10e3a89@oss.qualcomm.com>
References: <20260809-glymur-send-v3-0-2d1ed10e3a89@oss.qualcomm.com>
In-Reply-To: <20260809-glymur-send-v3-0-2d1ed10e3a89@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>,
        Jason Pettit <jason.pettit@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA5MDE5NSBTYWx0ZWRfX6fxUwm6/5QiS
 UFTlxZfzf5tP1/4dVY3mm5Kn13mXPh4qcfFonF2cZCFFiFTbdBULcUEFBAEV7EEiwUQLMvMVkty
 J2eD5HPGYkTfQowfjAHHx9HD66apArI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA5MDE5NSBTYWx0ZWRfXx/dwcm1RE0hT
 3vjvVSnazFHQ6tVR1HO+U0uwSsnxsB/MuK38Ex2q1Qm1UZy0XyVvfU6gUvqNrZSktZlg06IAmvE
 eRA6KjRz/oWQDMdCRpWjhe++9ba8Ma1K8fo5v4p+WqJnBTZ8MBqo3dhraOLMnrLwPRMufQ9ZvpO
 WyPhTr6a4uofNeoVJpFWYBJpsCP3u/jvz5fiER0TbZdkU3l0pdcCFZtySMNPcGGmI0JoNx/8nmR
 twUniGWMahZbbub42pDpfuvID1zWXUYX9Yv3+BBu6zNeS0uo46jvALs5PYE2kReGxLFUyZA5SFn
 9HfcFoZdZka8ETFlwRs6Lo13eKQJ/ITx/89OkMtTV778uS+mFtbRjKHdcwl/aClDaJDKDuV6ht8
 JcRoIQM8H459Qr3LAe/asdM37l/usfq9jLpInkb+4gVN5FXlVVtQyT3Y4JPjCVxmKhWx4g8BBmb
 siKgpdHZb15f473Prkg==
X-Authority-Analysis: v=2.4 cv=ecENubEH c=1 sm=1 tr=0 ts=6a78f13d cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=UXNKUhSJZRFg4A5DIqMA:9 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-ORIG-GUID: Yvszaxq0-rvVsdnXPvrSA382_GxtZzzx
X-Proofpoint-GUID: Yvszaxq0-rvVsdnXPvrSA382_GxtZzzx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_07,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608090195

The HP EliteBook X G2q 14" Next Gen AI PC is a Snapdragon X2 Elite
(Glymur) laptop whose firmware exposes EFI variables through QSEECOM.
Add its board compatible to the QSEECOM allowlist so that EFI variable
access (efivarfs) works on this machine.

Without it the kernel reports "qseecom: untested machine, skipping" and
efivarfs is empty.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Jason Pettit <jason.pettit@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 3eaa4c9ccf3c..c44c63e1c20d 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2311,6 +2311,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "ecs,liva-qc710" },
 	{ .compatible = "honor,magicbook-art-14-snapdragon" },
 	{ .compatible = "hp,elitebook-ultra-g1q" },
+	{ .compatible = "hp,elitebook-x-g2q" },
 	{ .compatible = "hp,omnibook-x14" },
 	{ .compatible = "huawei,gaokun3" },
 	{ .compatible = "lenovo,flex-5g" },

-- 
2.50.1

