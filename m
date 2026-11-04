Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793783292;
	b=NSVsL8YoBI3U15+SIc50+qxHf2fUDpKyVmx9FispXoUJU8KVUhvKOGsIZ1tgBc2w6Z6l
	 DMUKmH4hErXeVnY6e1r/BW4kxX0G53u6nWtWnhxLaqcOGvcjNvXpdisrVdyhIcHilc40v
	 EkObBN3EtzQfjs42n8ERxbXA8cUfiInVcnN4YzoBHATBNHB6/+i5ta+qFozD7nyvieuv2
	 yy+Zp6lj8chRaegKTay+sk/fJVTP5GYGDAjrwko+7AYmCtCzk5+D7Htp495Sj3PUVUfTn
	 0EOOI8I5bfylBEU1RPgw+QlURH32nJVrVXSQHULMFjTg7gr5Clzwn7df6C1gY3I9HEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793783292;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=D8me2QpoNUYpkzCrzP/COkjEOzARHLPsOFtTfm8ZtJ0=;
	b=J9dYn/4Bhfni2W6jKBuYuJ8n8+RwlbE6O7aHvKVhT3XzN9xDVg9d1Z1V3Bkfj/gA4TZ4
	 fzBq0qPlTCbJ6HpATuMBtxLq6oo5Y0HTnZquGp5MKZwuBc7kBCH1rGIFFFiC6AkcTp7/r
	 BE68PtKGyDm63clDNdAHdZIN/m2tw8A2+wge6Us/omZr3kRZJfOTmIu4QgVn9rhP9XF+J
	 sY39tbDS5urir17doH4RoEm5nxRgxDo3kJ6Wx7CXV2yoZ1ju9hn33r2gVORIuP9fCQYo+
	 p6dEVeYSZxZFV5G8ie16n5RlW6bbL1BqdBXbysfcc7xBOsHSrnFIGh9C8tWKDzdHUMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cOyzIDyj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d1Z2u0uV;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56802606D808
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 09:08:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56802606D808
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cOyzIDyj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d1Z2u0uV
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A48OnF9309849
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Nov 2026 09:08:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D8me2QpoNUYpkzCrzP/COkjEOzARHLPsOFtTfm8ZtJ0=; b=cOyzIDyj0a2Iuht5
	k9JzBA0s6Lx3awvT38wo9fsLbOjYVLkvyKWAW2Cv/RaDkQ6JtpKMkrIa2eiYE/c7
	9+QeWk80lsvgrjUxqee5ZXrmUpSWEd2zHxXnlwGT58DswAuXoHdfV7LdiA5W4/7Z
	YI3ExzuPi1esPo/dvGwmDWZk5XsrhkgmOSJFNWYw1KFWu00JnB4CNlzL32cBYfCu
	2HLOguKmaXxqXSp88HqLcctetV/TBCyHOB/yWwHqwuZyAbn93xYyXgM5b7CSDwXj
	Xps25NLLOO3LOWyfztjJYvIJjtrk1Kkeag6zjTndhhgYxtoiOE3aRbw80HI9CowI
	0VQ7fg==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr163g68s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 09:08:11 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-843c6807307so595496a34.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 01:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793783291; x=1794388091; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D8me2QpoNUYpkzCrzP/COkjEOzARHLPsOFtTfm8ZtJ0=;
        b=d1Z2u0uVUc6BBvhiM5lYH6Ot/Ywjl7cq2Ru/F7Y8Etbs1GqAfXE8fSKao3C3o8bMmI
         WgqB70Fmlv9bKHl27NQNjizYOEFUObYfpL5EHdpk1LVJPxTshtas2MtWYzRRbhv2IzxH
         zz7Tdam53M7exAa9F1KTBhIv/Mk4B0mE8gDpqJDeaDn1mXVdgasAXOOTQyQ0I85M8LbO
         RzWTAJj6gmqpeU5RhN+tklI87wEFQsGSz5urnaBpgL9s8HahoazhTVmkY6Q8Vvz0S6k6
         K5ewdbqbfmukULxzcL7lK7fUm2d70ABxSz/0x3YPSjL3aSogbQZddFqubmo5iOvji1dN
         0iPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793783291; x=1794388091;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D8me2QpoNUYpkzCrzP/COkjEOzARHLPsOFtTfm8ZtJ0=;
        b=t36gY+FVkhqSUyUOy6+SVTHZxhZNRrj0It3bx4s+lLmVfyfUDmIfSWhJJe0brz2DhM
         mpgMeZB75QbaYJ0jd0+NRd4sWGMH+X9ceyZeONU4M1KCHlixfK/iuUHmPNkPKHSKZTJA
         sTCaZaicnoJPfa7MLYEuwWdfGA/AsQd6wOpdlYHMwXK2mp5D9ICJxkLwTCACbgEx8iwB
         elQXV18hULdqNoYEql0KjzoATX7cgv7ZxB1OROlvrwAfooygF7CEksNYUVa57CquS6aY
         BcFGla02RfZsCkk0WnAWE+bFRjiAY7vHjuAX/8NKiWwb7+stvG3mYTDehAoyMysan0K1
         ZoXg==
X-Gm-Message-State: APuU4Z81uodSLHUokWhUwlIbhF2gJo0lmNa3/lYqfuG6riDVGABhqjOc
	GiZhUifU7HOIRNBk6Fgu8DE/MEjIM9gzaeoBCz9T3AMnsmyin/ApmywjGU1aMTTGPVrOIMaCyqE
	VpL/iaDD0I9dWes7rNCv332PFue1FpA3OV45+MQHMt1ER3Z1aF/r8vtYWIE//nqRnVWeR
X-Gm-Gg: AYBFou1dINgi6D/tWwnFlXVHD4pQAPoT+jKoqd8fUqi5vdX5fs2ErBbaxf/V1pC2pux
	zwlc9pcQFWJ0ziz93cT2A3mYig0Jc735iLX/bidUou/cRq7/JwwfP/1Ry3/xey3NqR438BR6In5
	qMCVVWbwj5IY+SdVdy6tXWXhZw5IwXuJtv3o7lR94yuhkoIfpblRd0YW86QtpuE653pAt0/IVCu
	tjsbGVRRUhDXM3WKZdpcq0cTFw/5NuW2yPWZMO2tGMmxb2PNnqr5syAckw1I+IsKzmJXAxfFPa9
	LudBtFhiCGnsIE5i/4wFLeG+cRi11JctUx2fFt+tysK6WYQba3IEpGBJ8sWrD8ku2CkG7NH3ZwA
	SBoivGba1r0BdBb91h7/4Y4UPca6dZk7ITAOXRWW4L35pBDIVDCOp/U/DLDZRLLyUKAmRrC2FLm
	//2N/OFZRKOeMDnrTMYTg=
X-Received: by 2002:a05:6830:2b0e:b0:821:c75e:5309 with SMTP id 46e09a7af769-85d3636e246mr12595631a34.7.1793783290890;
        Wed, 04 Nov 2026 01:08:10 -0800 (PST)
X-Received: by 2002:a05:6830:2b0e:b0:821:c75e:5309 with SMTP id 46e09a7af769-85d3636e246mr12595602a34.7.1793783290473;
        Wed, 04 Nov 2026 01:08:10 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85ef3d768c8sm1519846a34.8.2026.11.04.01.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 01:08:10 -0800 (PST)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 01:08:01 -0800
Subject: [PATCH v4 2/3] phy: qcom: qmp-pcie: Add vdda-refgen supplies for
 Glymur
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-phyrefgen_1104-v4-2-ba508fc6ab40@oss.qualcomm.com>
References: <20261104-phyrefgen_1104-v4-0-ba508fc6ab40@oss.qualcomm.com>
In-Reply-To: <20261104-phyrefgen_1104-v4-0-ba508fc6ab40@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793783286; l=2038;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=X0zqKLQgxtFqsdr2c8NqWI9DTymrR5SFOBpbqURcmZU=;
 b=jOmVb1vGw8nEqcFE5bWnDz1WHLHxQTvffqHoM0iOlxKkPjMbu0qP+0COeDgjSm43OG0So7hmT
 x3ll492AqDnDr+4Py0zhLe3Smv3XmkxJ/2pgmb3yWL9VHEsYZvwRN7a
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-ORIG-GUID: G68UzsM53JvAnx8jCkN1hoL3PvROH3-i
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAzNiBTYWx0ZWRfX+rpofjz29goe
 NJOHq1lRGU48D1IL0/HU7DMIz/6VbPeYNuH1gtRRWc3fVoGpS2m85UVYWfSRga4929TzfthQR9I
 5skQKexbdlqbUYeyHkAgXuOW/dgpSZw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAzNiBTYWx0ZWRfXx6nfSxtu2k6x
 tKXLxhG1l7qgR6tuPT8Bx+gAmb4Rg/229CeSn2aEhc1cAhRxqKB7N7t/RNSxrMyIriX1wsaoOoO
 5BPi9eV7MuA2pYq2ddPXjT1WQhweaPbUQdQGJCIJAvDtWL3SXw9yVbcMpSQrCRORK9COR0emx/v
 ucF/T+4KV7SCvJw/0dRXQ0sPlFVzc+GLDebvyN2DwsUmI6zmdbdHfTR9jnrkqJuMAuGFYRrwfBk
 oMbqVgQ2MNqgJc4+rhQ5c35ZkUHDEjB9EQRu7p6eKGR+y834Wy/9Z3sGqtfx278lRzv1OMhKKxm
 sDxDcqhqvYZB/r0fK7SvBs85oyZEWORNfIuh7Lxuq2dcHFKqxGX2KPITet/zAKtaGn8Gx7Fw7qr
 GrPesQ/DS6VT0QPtcOKzOX2RGSDdGTy8nyAHc80m/gddLCFlZQjeN5Y67pExa1Ft0PqfFBpF7GA
 bsYX+90Q7rKp2m8deyw==
X-Proofpoint-GUID: G68UzsM53JvAnx8jCkN1hoL3PvROH3-i
X-Authority-Analysis: v=2.4 cv=O5OsLx9W c=1 sm=1 tr=0 ts=6aeaf5fb cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=m2jQVEIWa0EwQwJFt7gA:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_02,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040036

The refgen providing reference voltage for PCIe QMP PHY on Glymur requires
two power supplies independent from the PHY's core and qref rails. Add
support for vdda-refgen0p9 and vdda-refgen1p2 supplies with a dedicated
glymur_qmp_phy_vreg_l list.

Update both Gen5x4 and Gen4x2 configurations to use the new supply list.

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index 9cfabf474fd6..e226b65ec7c6 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -4106,6 +4106,10 @@ static const char * const sm8550_qmp_phy_vreg_l[] = {
 	"vdda-phy", "vdda-pll", "vdda-qref",
 };
 
+static const char * const glymur_qmp_phy_vreg_l[] = {
+	"vdda-phy", "vdda-pll", "vdda-refgen0p9", "vdda-refgen1p2",
+};
+
 /* list of resets */
 static const char * const ipq8074_pciephy_reset_l[] = {
 	"phy", "common",
@@ -5555,8 +5559,8 @@ static const struct qmp_phy_cfg glymur_qmp_gen5x4_pciephy_cfg = {
 
 	.reset_list		= sdm845_pciephy_reset_l,
 	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
-	.vreg_list		= qmp_phy_vreg_l,
-	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+	.vreg_list		= glymur_qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(glymur_qmp_phy_vreg_l),
 
 	.regs			= pciephy_v8_50_regs_layout,
 
@@ -5571,8 +5575,8 @@ static const struct qmp_phy_cfg glymur_qmp_gen4x2_pciephy_cfg = {
 
 	.reset_list		= sdm845_pciephy_reset_l,
 	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
-	.vreg_list		= qmp_phy_vreg_l,
-	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+	.vreg_list		= glymur_qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(glymur_qmp_phy_vreg_l),
 
 	.regs			= pciephy_v8_regs_layout,
 

-- 
2.34.1

