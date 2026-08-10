Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DFF73DCDA4
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 13:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786367039; cv=none; b=ecZFM5z0cyydPFTExvxH2/ROP4K004DzzN6QugJwrVdAtitfq2L+d5eHCiU7143P+cCoyXZ1AYAIRVzd5WWQAQBcEyNEGR6oVY07FFRFhFp1nbgzJ+vHv8sHwhNLIwumfjv3hkPA8M+3j8sur2OfcoWUqYdR5d5xEhiJTTD+znw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786367039; c=relaxed/simple;
	bh=5zH9MhKLaZum2KmKZSl5RInPW33ffUQGYHOoNnSZWAk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X86J/1xirz4tDzSLxsiq1nc4d0YHUdZaVav9kFQQvR1pwwT9Rj1phJsVKiAiEdlKhDNDNFKTWbwBRFYDKjJr5TPwOL0+oQImG80w7lvUnUyQIrbZrO/tqyD2TxWNB+51qODFSJ8fcrn7O9HRY41aRe5eX3nILXGnvzLCqMbijyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c8DJpnPD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NAoJa7XK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c8DJpnPD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NAoJa7XK"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ACj6eY1650635
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 13:03:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e0L6ragntubvXbBsjspOrbZSJXFtACGSMAqOSg7odQ8=; b=c8DJpnPDAlvPlVcL
	7Dnhm6XvC0rrrcg8ugIlaKPV++AbzZDPGgpmAdC3VLcxkhZP2LRF59X2qI9pVUUb
	roUshqxZmG8G6KBHVgDTsE90IWM8WqKA6egrcAg/3ZmeeACd1hgBpzQtuEaT59jD
	TyE5/s4ZPuFlvfGho495UNJ42fn3QeOMcDWcY8omE3mxL+ZDS7gQJVUEiNANBIP5
	mVE3NIPDnf1XGLaISlM30DmZWzfkHNqfmQ4d1+oWrE7+mWj9JhZVGhifHuAomRTv
	T7hDN1OhMoUHcyHSrTSqoJMMerhEburVZJDFRXR9XQAeg2m49WK/1b8ndyMsuXmN
	LRtJ/A==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8vhhmhc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 13:03:54 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6ae8d87a96eso957790eaf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 06:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786367034; x=1786971834; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e0L6ragntubvXbBsjspOrbZSJXFtACGSMAqOSg7odQ8=;
        b=NAoJa7XKTgz4IKILg9IOMsACSBJ8UH9z9/hb/O69WR4D9o/A3PDax8vVw3Ux0gA8DT
         YWrnSxdks40dOnVnbhGkZHNSq2zOA+Ovyg8ZayosjY+lH/NXIlm1edPMIUf+pscY9HD0
         NAbVI2mxLmZ3XS/FYn1f0nX8iBFhlEWfydkkiyMLZGBJraqZu2h2wL23fUBv0dJ8bjIB
         h9tpEHQ+8HeKKN3zHc7zDoyrJREaT1S5Cq5rP1ktl0jmROFN66JlkT5qUW+M9Pd5MziO
         1ADh07rYiO3W50gG216U8R+okT7pHsW6zlwtPeI71chP2dYGTn/LvLIVbq0wIfgEXtdK
         ClCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786367034; x=1786971834;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e0L6ragntubvXbBsjspOrbZSJXFtACGSMAqOSg7odQ8=;
        b=Hamuw68IYyqMhfUcecKxQGp3ry83mTmT1R993LwMEof2Q+rVZ9s0MtfMnAiwXQuP3p
         sWQhhY/zemxXzOaupb9B903UEBfnyoeyfbcJyZF/36lIv524tP2UMJdAZkAaZaStbpX8
         4JEVtqN/hwXswbsa0pi5WITxcrWKDco88zSegeqbyFpfLhRWwtlE0RKzCDNyeFMCzzfb
         wan2wql3gt3uhuvvUUw6gBydGBUjWW6JKZHjl2bK/DZ7KBOdijJTDaGNILHgIgy6aT54
         t0MQJvfpW1yixyzdbWNDdpSV37kp0DL4Q2a1NvHQo1509aAtbYznAnvwBdwGQwkMS9vS
         HgTg==
X-Forwarded-Encrypted: i=1; AHgh+Rr3CthPnJbYuPwonOpwtBA1KD64Igw628fS95p653xU4a6BrHD+u0hufjLCJZ5rH3sul9vV61OUEuWyVCfq@vger.kernel.org
X-Gm-Message-State: AOJu0YzIHdmgnbHs3/+7//7ju9MKPvkrlueE08wvYl78L4Ee0yCpZX29
	89q/jkPsMiVk0wutYIeBKVXIX0bxgNE0ktpxE9a1o36jndY4R9mg2xPCHGK7A47VycAJNf7gams
	Hv5aNadkhZ3wUb00CUCqavMWzK3P1CycZTSwtUfzWyQc2IljTSbwQC8Nm3zmnsWuUCK6R
X-Gm-Gg: AR+sD13aiqwsYHZX4KHlqZbEjpAA10iEKiSnqGLDq+2FWZl/q9HdjSN2UJxGDUT9Aem
	ApHQmYbqrnIawiBv0imkDheE1OzAKNOLyogKRUllvnRTRtLvvajPsyOCEm7vkTtJ6fo4P2I/eiz
	0vKUqwvfDW3jri5KsvO/gvqFKKLLXMPc/JiJRt/uIn3jdCAqNkBMV9Z+gGgMlx8XOddWLSiskWz
	wmaVS1UdNzuMuM2k6ILyHBpCMuXtddZS/G1X4MfLKSwl+RLf8+KRQRukVuuyX1dcQMCJRxQ0m8W
	Lpwo6JfuO3CgJXH9ZIjeXW9vDz8q62534vJ/xh3O4xdXxy+UW4CBi2Ms+TxRp7lM92GmTw6E63Z
	+ubnng7Jbcxcpd1QyKNAx0QBPwfyqNYfTvPl9uOkwul1NyIWXnjvUmOOR3VWQWbsK
X-Received: by 2002:a05:6820:c95:b0:6ab:13:b207 with SMTP id 006d021491bc7-6b0909c5b04mr824779eaf.27.1786367034057;
        Mon, 10 Aug 2026 06:03:54 -0700 (PDT)
X-Received: by 2002:a05:6820:c95:b0:6ab:13:b207 with SMTP id 006d021491bc7-6b0909c5b04mr824742eaf.27.1786367033611;
        Mon, 10 Aug 2026 06:03:53 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-459f1a9e431sm8218971fac.6.2026.08.10.06.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 06:03:53 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 06:03:29 -0700
Subject: [PATCH v2 3/4] firmware: qcom: scm: Allow QSEECOM on the Glymur
 QCB
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-glymur-qcb-v2-3-9e6ea7987b9e@oss.qualcomm.com>
References: <20260810-glymur-qcb-v2-0-9e6ea7987b9e@oss.qualcomm.com>
In-Reply-To: <20260810-glymur-qcb-v2-0-9e6ea7987b9e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786367028; l=999;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=5zH9MhKLaZum2KmKZSl5RInPW33ffUQGYHOoNnSZWAk=;
 b=51BWj1htH7YZOCECgS7ER6LaPV1JbRKMoqxwWQDMBP0DQmOXqLFAoNmY7AnTzI2r2mnbcTPHi
 6FSXVQjbMJ1CJY4lkblqz2B9atgs+yLgAgS5pQZHq20F3PAyE9ZsIaC
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Authority-Analysis: v=2.4 cv=MMtQXsZl c=1 sm=1 tr=0 ts=6a79cc3a cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Gf6kasYTCoD6TKqZ3V4A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-ORIG-GUID: jgja82YSk-Szusj13ABoGbBufMRpCVgR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDExMiBTYWx0ZWRfX667VomrfisXj
 cH4g6EOw92sVetVKymjlcnuEjcTux4Drn8sAVKALDWk8eG/COjFcMUEvB6q6BNV6QmehmfEtOye
 GV14cq45uyRFFQYkWfebybl4JQ1sTiQ9KE7+0pro1v9xI6ni8XhUMi9mAZ7xAb89CbeJMqUUZ9s
 g5ItZ0BDCIzI0uf7rXrpUmVGUgg9AwOxPG/no/9MBd8RYsQLzo2yjivudEnrouxpPoOdqSkMtA3
 VMl/Wcr2yMOKbmMKoq9FrTyK5G9ZoPWNDtMUvxDMLUiuEL0ECmX/PeTtwgEXof5bfFqCpApj6Tr
 756fvdVh4M8OQyE8LakNKkPGSEFTECLwUaoAukYnc61+b8a5FcCean1zX2Kmru5SNskxzbVRf5y
 rZvvzbD2FOQ/mU79R3fZnEOkG3spBi+/RFmb5P9ddQzCAyT3SK/JmKAgdo8onzB+AeiD2C+QARv
 8uldsrA7gaKe4j2llFw==
X-Proofpoint-GUID: jgja82YSk-Szusj13ABoGbBufMRpCVgR
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDExMiBTYWx0ZWRfX6gX8S2q4C6aV
 29gm00ycxMkKzMQJ5N5JD80K+P5lRIU1OV8sA+FLWNgTifPWsClcRwjFZPLhgDlRyApYJIK59PH
 hqdnlI7frWB0D4/vmByhRHJTM2c4I1c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608100112

Add Glymur QCB board to the QSEECOM allowlist for enabling access to
efivars and uefi bootloader.

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 3eaa4c9ccf3c..5ca1149a8438 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2327,6 +2327,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "microsoft,romulus13", },
 	{ .compatible = "microsoft,romulus15", },
 	{ .compatible = "qcom,glymur-crd" },
+	{ .compatible = "qcom,glymur-qcb" },
 	{ .compatible = "qcom,hamoa-iot-evk" },
 	{ .compatible = "qcom,mahua-crd" },
 	{ .compatible = "qcom,purwa-iot-evk" },

-- 
2.34.1

