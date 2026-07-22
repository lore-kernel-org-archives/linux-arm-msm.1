Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C7A30D3E7
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 04:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784695303; cv=none; b=h7iKp4DHc/grCGcwLN5XN11FWykzzn9mrpr6NMVeEH6ZA2U6OUkyknGBRu9Kassol30pgKhs3mvxachz2JVrKtdvq3/7nNqNFVUpBau0N/QSPO9/3qSvfoBXFpwTRJpu/llv9QCSzrLCkSYKaKcY0a+z2+PN/C5rInQbbYWQKjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784695303; c=relaxed/simple;
	bh=H/d+FWyMvcK+pk6HRkkqa+1s+m7pqOiAKJbjNzM7cS4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=N/IPRzMiJza91UAwtmq7RCLObCBBgLIjfkwLD0paTEHGvufMeL3FNrjCbpqpNo8k93xeY32oAtfzdaMGFt8NBbVlQNhETvgZbFNdP26JDKKXyytepYZy7PvDA8jySq64/44BAF00Ncak53re03TvTxSp66eYSJRvhr+ib3ZTU4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e2QK2PGc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gVc2ibjc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e2QK2PGc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gVc2ibjc"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M1CCjo3650241
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 04:41:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=l8XGTYJw6/EGLETEkYeIqQ
	SOPSvLBXC7Looq0wWWPmU=; b=e2QK2PGcxZiEsldrV+aAN6FK2wx8SrO7PgYR6S
	uLcZqy3wrDjnRQbXcv6G9yxrR4kBQ/noFctvhVPLYxOpZLwxF+9cz2z5fc5wdgq1
	8avW3PAhYDms8j2V15lrxbjvY57aase7uHDq3CsPSXvG4dKMS4Ii8nvP6/493Gx8
	6HOe8yvkmXmfbBJ3re504y9xEG0V5/Me6HImcuB29EQN7hhpbqPodWCdWX3Pmct+
	Q31n6W+BcwwnS6STkhhwfjf7O9yxeAPPT2uqpNthOuf9iWtk4yOmQQX/kPAwB2OR
	+5xDOCPdMha4wHubbxccm7lvfURa2wn4vWIsT04GOwtaaMPA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6r3mack-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 04:41:41 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb48f41343aso4214731a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 21:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784695300; x=1785300100; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=l8XGTYJw6/EGLETEkYeIqQSOPSvLBXC7Looq0wWWPmU=;
        b=gVc2ibjcNRcXa+3pMwRWnNgVi41syrr8hFkMLgPaaDle/eAZF7cN45gh7eynIWkfKy
         RVkE/J+NOt/xZejPvy0jZxcOsWbMpvYyJ1S4WtZvfcCCuwKuZ0ee8iCY52CucNapa8jA
         SdBT8K08SYN3ZACBskhXAyGJ0/2UCQEeDugqtng5Fmsx5bzZ6o8kDnH0ZIlz2dUBPR6Q
         8L9idX62KBInnfTt9SVAW8/j0i4+wuZsw3yGxS4gNbQpQmiU4qQfz5Y++15Mg9yQ3N+V
         /l9kcUZP1hQBRMeAeeVsQFH0+R05z4n3JFQZQh92Orw8xPy+PmtVhauX2tJc8oNutIwT
         jKPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784695300; x=1785300100;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=l8XGTYJw6/EGLETEkYeIqQSOPSvLBXC7Looq0wWWPmU=;
        b=PzfNmqCNtJs24IgxZok8Q4vDn5WwUzwPM3hWUfu06yVIgKFyy1nSoGkxAM+MfxtYzT
         arpDK3rbUuP8eBO0JnPjty8hY5tNJ3dtnxe4X6dfQfhf9o8tpRzrv7YXp3ox2BV1cR6n
         zyKV6MZMxFMFKdXNxENjVNjQdiaCqmpTpB1OML8myf383zWrqahtIOFetLkhtW73yPwi
         NBpbmYjbAhLeMitHXCImxDtUBWjCoqUp2Hkislx9h7lirJYfmMpcbvEdk7ffTYGfolgG
         nHjbyDZLt8iFbeve79c/nDh60QV2GNQ7INa7oMyY/VOSls+tYqkmoWxN+BxVEi4ufbk1
         gCJg==
X-Forwarded-Encrypted: i=1; AHgh+Rox8JRZPvJHo0KUfYmQputvNgCo5z0Dv2hdROJpIkLj1iv+Nv/EYwlzjNmt0s8oTBEycuFBxZwyBE64kZKT@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8oBifcGqKdBfdNx7+DIkAQ1X1N/DLsDKFSTH9PFFnGt+xnQcG
	rCYvh2P42DMdtCeeLjdEpuJ4rrUFwbLTDkXBqIfujm6w05XCnRJ8q5gNSfh9VUOuhaBHk8pI2XS
	kbcCF4zi/UbLdj5WfIs76CNE2Tj6/xTb7GMsOhw754BbnyUC4Iv7jYVi94hU8X6+UsE8g
X-Gm-Gg: AR+sD13yrWMcQ9oXxDqQUKsnhf2cYUkTotmgtlujtyzky6QGjj5yL1Ggkymr6SB59NI
	1pjNXfqtPmszdO6BSSKbY8JD8vJUdenDVLAoOq4qCLz8GApMi3NZaleLBJq5RchoL7+vO8KCpC2
	Si72bCD9Wj57L76sv/fcyiS19Y0GfCyvYLyAodftoN60LQcuva1ZG9XX5JncshQzVXXPwf3JZNY
	+j3d3K10IRFs3Au69n3OVupIlIGtiGXgjL5YLdDnrZ/UlsEYbOzXPhxsNLR90C/vDp89i9eukns
	lG9KSxTqTJk5wdNzSNCg0RxApRvIFLKFR+fMgvMCIkW3dbG3KTUj7/RbKS0ueTkNJMYzZtPorGs
	d9nSNFBcceqw2zYq34/4krI/8dD/GIew=
X-Received: by 2002:a05:6a20:c90a:b0:3c3:8315:80b6 with SMTP id adf61e73a8af0-3c4294f17b8mr2449977637.32.1784695300473;
        Tue, 21 Jul 2026 21:41:40 -0700 (PDT)
X-Received: by 2002:a05:6a20:c90a:b0:3c3:8315:80b6 with SMTP id adf61e73a8af0-3c4294f17b8mr2449944637.32.1784695299983;
        Tue, 21 Jul 2026 21:41:39 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147df09a9dsm4262613eec.19.2026.07.21.21.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 21:41:39 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 10:11:14 +0530
Subject: [PATCH v2] clk: qcom: gcc-shikra: Add additional frequencies for
 EMAC RGMII clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-b4-shikra-gcc-emac-freqs-v2-1-2e480e2de8de@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOlJYGoC/42NUQ6CMBBEr0L67RLa1Fb88h6Gj1IW2ChUuko0p
 He3cgIzySRvkpnZBGMkZHEuNhFxJaYwZ1CHQvjRzQMCdZmFqpSprLTQauCRbtHB4D3g5Dz0ERc
 GpU3dnVqjnT2KXH9E7Om9T1+bzCPxM8TP/rTKX/rH6CohS1a1MVpa580lMJfLy919mKYym2hSS
 l+QYadGxwAAAA==
X-Change-ID: 20260717-b4-shikra-gcc-emac-freqs-2469d8b64a75
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA0MCBTYWx0ZWRfX3h1TIS2etCBH
 k8KgCsyFFq55D70L1u5nHlWL84hB3CEMuNzbrHjVmeKudmE5havZvDZd3cfA+6g9OOyN5RC8wg/
 Vn5EjQ0nGHo3gWy/rs3BnP9EO9WgQf9QCX8zhbNAPKXztrv7BdLdQiYgDzVd0QG/KXc1vDK2o8u
 ubPzQtl95OwumohpC13d67c6FXuTYLbK2BvcwLts2KycLOTuy6H6HEi/dEllnI+jcwa+rSmmA2q
 /9Rh/MinSyoyvcI0f1R7rEX+uHZM+R86Rt9i4AKTNqvnMcrCda7dnc16099tPuf1xR8pN/D9Z/x
 8TaqBQBKdZW00rNffyyEm0/VW3Y/qXO5jDxr7AfAVui96T5jQXGPr7CrNqrOOXOzwozRuHIftHs
 FSVIovXt7kXV3pFxSQBML09dd35RK4/Lo1QhWKz5gg0MT0pCM67cWBA9dTkK8JJBoYUp2YCDazF
 bNKlauphUyxA0z+eWgQ==
X-Proofpoint-ORIG-GUID: 4cC9v10Kj7KTNvwJqfFL-K9qIoBR_FB8
X-Proofpoint-GUID: 4cC9v10Kj7KTNvwJqfFL-K9qIoBR_FB8
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA0MCBTYWx0ZWRfX+dClw9JcJIZR
 pJGB33lJxX5/Df33YP8wFaKuGzy8oOmbnyXsBdSOwjm34ZO71asKqKJro59XixHeCxcIKg1rE+t
 JiZfQxE5KhrEISOlT/bQVW2NP/NpZHA=
X-Authority-Analysis: v=2.4 cv=SIRykuvH c=1 sm=1 tr=0 ts=6a604a05 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=aR1S6OqT_Anhih9h-SwA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_01,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015
 suspectscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220040

Add support for 2.5MHz and 25MHz GCC EMAC RGMII clock frequencies required
for EMAC 10M and 100M speeds respectively on Qualcomm Shikra SoC.

Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
Changes in v2:
- Updated commit text to mention the 10M and 100M speed details [Konrad]
- Collected all the tags received on v1.
- Link to v1: https://lore.kernel.org/r/20260717-b4-shikra-gcc-emac-freqs-v1-1-110966417ac6@oss.qualcomm.com
---
 drivers/clk/qcom/gcc-shikra.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/qcom/gcc-shikra.c b/drivers/clk/qcom/gcc-shikra.c
index d5222756f214c356214039f95a93a28fc542801b..f2ab50209e1c037cb84db67951def053880406ff 100644
--- a/drivers/clk/qcom/gcc-shikra.c
+++ b/drivers/clk/qcom/gcc-shikra.c
@@ -1244,6 +1244,8 @@ static struct clk_rcg2 gcc_emac0_ptp_clk_src = {
 };
 
 static const struct freq_tbl ftbl_gcc_emac0_rgmii_clk_src[] = {
+	F(2500000, P_GPLL0_OUT_AUX2, 10, 1, 12),
+	F(25000000, P_GPLL0_OUT_AUX2, 12, 0, 0),
 	F(50000000, P_GPLL0_OUT_AUX2, 6, 0, 0),
 	F(125000000, P_GPLL12_OUT_AUX2, 4, 0, 0),
 	F(250000000, P_GPLL12_OUT_EARLY, 4, 0, 0),

---
base-commit: 1a1757b76427f6201bfe0bf1bea9f7574f332a93
change-id: 20260717-b4-shikra-gcc-emac-freqs-2469d8b64a75

Best regards,
-- 
Imran Shaik <imran.shaik@oss.qualcomm.com>

