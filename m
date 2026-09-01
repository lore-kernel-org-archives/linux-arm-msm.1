Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8138D472066
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 08:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788250077; cv=none; b=ptVY07VWAXbYFfuDE9ZRhbu2lnRZTpKRa2Jyojxyy0Q0ECji7P5OMStBiyeuw+lJYuGpLDN1Wl3BmglMNXgrdlAjs/B9FAcGyOa3ALeppcrovI83RLYohdTjgT4TJTQ+R0G6QaC0wPh1iqQhQcOAwrhxTAGt8IxPadxQY/oqkyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788250077; c=relaxed/simple;
	bh=shzWdUzwWey+4jXxXvIXmIwy5xgWoCV3JLd6EWxVgnM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nUzqgtsIygVT9Kj7mTCdU4jmPk/CrSwHF1dK5942fqai/S06TbIV32YNtXdtMOgC5xDIdP5swhtM7WGH2RUJgurXXSCfSIrIOdsyyijUfujpZDX5Vy/szcmDljDK8gGq28nM6/5qm7kpoLiT3cSOVAnYQ/m30YARsLcxd/VX778=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lut0htKR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NQAn7K53; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lut0htKR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NQAn7K53"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179CPw2061527
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 08:07:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rLU0ET7XGR/RhGPgsz+MD2O51qa40w85iZNcCKWj3r8=; b=lut0htKR2mPAFO/F
	c0NxpUmtjhklD0osucXFMWnOdJ7ibSCMBHoG3z31aGbv6UaXWgUMnpHnvNGeWMoo
	lQ71RHD8WZj3DikVhZuFN0oXTXjIxR/gpeNovBSTTQ+NCxvymzKmFa20lFzAXt4x
	gw0a0lzXVlTgdVUhkABzOZZG/vIwo8lL3XGI61K3sX2bNGEWutqAWtPP2YNnyRXg
	QP5bFiBpsmRql09fiZ/qLiyrrFqWt9l2g2Gf3DSLCe4XDyd7+rNILxK/L1MkreZ/
	7FW5O9StxPUMI+8nlVFG529r2v7nIM5DiFY360BmuI3iDAaKrebzes1zKAYUUfBD
	drukIQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdqbh0wtu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 08:07:53 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93494cce712so802299585a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 01:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788250073; x=1788854873; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rLU0ET7XGR/RhGPgsz+MD2O51qa40w85iZNcCKWj3r8=;
        b=NQAn7K53TV4ULaPVg3eTHKAr4pHvmURt3LVW6616LS5nz1+P7INIKHBr/dh4YWzyXQ
         p1NhLGz0dqCi2CyoKucW7h0nrqv+OESq7VEgGkroMuO9lJyR4HkSR41bI2XUG3I47paH
         yag8clpoXcq90Ln5ETayXCgoGNpnz/IEUmz9wsappkQR+aeMCSnsKI3jSXBop+DjOSdZ
         dCwU9IqeZ9yk5GluGiIfXjyH4qBB+i/ctKJBFwKPHZp8d+QaeuYRVQ63qmDFGIm25IVU
         tafNfv7E2BeqSJmqUOOiQicCeKBrAZQ5o5ix+c0F15vTbolYwhFB1gVdaTUgcs0hlDUS
         YA5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788250073; x=1788854873;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rLU0ET7XGR/RhGPgsz+MD2O51qa40w85iZNcCKWj3r8=;
        b=KXDFU498VLb6RrDmZ0PCUQ+jcGk6ep75vmDa+3lPZdEnuiucOQ0t9G4NK8M1UHRtDT
         dlKEgSK0dEx07Qyx/rdRoyLxzWkYuBuZptlZyRy22BhWeHgv17OkL2ZzeltRKDmClaYX
         VoKmniPVvqW1Dcl3AYg3BUE1SeDauaezfKx/zrSUIxtizCztUplUFgzcLa3jWHIsvFNI
         e5X7/xh0O3kZXiJAzSzoD/alZygeBAzaV2wKvQ2R7e0LDzvtCaUn3uyjN/+aFIX84TA+
         vO9ecTW0zvjDAnW9QMecYi6gnD/KpLe+Yockps1Dyv8bI//Sz4cnIEla/60d0PHovUWl
         syEQ==
X-Gm-Message-State: AFuF++nxwyVRgAcK0Fl4b4cQP0jEmmt3iLHrOYPUdcO/TH9ngUGcqR7r
	yAIw0+bfQRgjGQsMg7IDs/3ArZj0pl+wJWXvkSI+Qy76tVMeonBnF0VbhlSy/zbwH3q9bfiR+Xv
	8GFLR45imCGzHlR+B9k4ulv5qBlskdobc0DEqzfdSzNBn+hACyL71xtihOOtou2BonMq3
X-Gm-Gg: AR+sD10zhykOYNl2uAbDOz8kETghWqAISQ5BoHfwp7gCKoKnmooRBI9IlRK+3rpqTFe
	QvnmqeW0oDVTAhzK0OD2VjdSXv3kcVaqUaDupjtZrDgVxbJSpmJmb1ElnUeKEIYHMLWrhZ6BZ5K
	JhfZePPZqViczqwU9XVpCN6+Y//de6VremRBD9rzjsefCVFuc44a9gGF9cCPfB+319owZ8UQsdB
	CN43acBA2GTWoek5YCFljxVpgMmGPM75POncSWMy3+3YVcrafIn/P9UMlj/hhO9rgKYdQdWX71v
	t47L2kP/KnI9MnEcA6xnqhDYifNKODRWZ3pd6P06CB6wTvi7I/GHrnYm4NFTGhBmIZfQzYPHn3N
	3SLfz8AN1
X-Received: by 2002:a05:620a:6412:b0:937:7890:29b5 with SMTP id af79cd13be357-939481315b7mr918879885a.37.1788250073110;
        Tue, 01 Sep 2026 01:07:53 -0700 (PDT)
X-Received: by 2002:a05:620a:6412:b0:937:7890:29b5 with SMTP id af79cd13be357-939481315b7mr918870585a.37.1788250072360;
        Tue, 01 Sep 2026 01:07:52 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d3d2eesm3267776f8f.15.2026.09.01.01.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 01:07:51 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 01 Sep 2026 11:07:06 +0300
Subject: [PATCH v2 09/16] arm64: dts: qcom: x1e80100-qcp: Mark the EC reset
 gpio as reserved
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-9-f4ab7e4bb75d@oss.qualcomm.com>
References: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-0-f4ab7e4bb75d@oss.qualcomm.com>
In-Reply-To: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-0-f4ab7e4bb75d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Marc Zyngier <maz@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Konstantin Shabanov <mail@etehtsea.me>,
        Srinivas Kandagatla <srini@kernel.org>,
        Ettore Chimenti <ettore.chimenti@linaro.org>,
        Georg Gottleuber <ggo@tuxedocomputers.com>,
        Xilin Wu <wuxilin123@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Val Packett <val@packett.cool>,
        Laurentiu Tudor <laurentiu.tudor1@dell.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Dale Whinham <daleyo@gmail.com>,
        =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <quic_kdybcio@quicinc.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1018;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=shzWdUzwWey+4jXxXvIXmIwy5xgWoCV3JLd6EWxVgnM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqloezOkVMAQvi4NcePRDi35DoEX4ANm5C37e4F
 fyY0IOW0aSJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapaHswAKCRAbX0TJAJUV
 VjIPD/9WihE1vjTHrj3fuQr+foPxs+u6pcc9S6LLH26XRueUv22ulpRmq/DGUH8xjWsKHNb6080
 HHzL8CDQZipmtEytkhGQe/CeVqxw1O/aIB/YaD6+Ldhu6VsFh8kip/EtcDg1w3nS9ZY/aUAv4y/
 EVyz6s547cMdR/26qjYQOga9pfevor5qTTrZvAZ06WaGeb0EaHzP2bFM2qarITj/AmxRPoyuzXd
 mjywME3UfqbG0DYP9GW+aLlyfr/OL6gMzhoHj5RgIDiy12UtadIRvPkALkOCH1FLqoWHyAPmL78
 fdEaSbIS2a7mljrhMz2NbVQRs64GTyzlyIjVezlvRgqxJ79TPV2mqASNhWKZgVKPDdqQxA8LH3j
 0eC3YCG22BCgGF+s9lsK0HgghISpAlaKiT23OUd3/j8Vrygq0pJXDOqf6gjh+r1ScVWpkplDubI
 gs3nBo/MadWZYgFlXfxiOC32YH6ObbEfndnHQvx5JaJpvx+WgK4JUmTaUi7n4YTKzEviYjNd8KP
 xfTilLhZiknUC0wzWJo9rDhje3amR4ZYoAxda7R7YKgzPE8n2vJJHl1fdxcqvQbwLZuF42tfhzf
 T6YIi6UGgL1CaVBwtqkUDTcB5MRBYZ1NTM29CydMPOCgm/novf+Ampi6YCjB8qjlGjpU3LOX/bx
 xlFf/eJtiTa9FEQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA3MSBTYWx0ZWRfX5Miq9hMcbt3s
 3rV0ahDs/h/lRF94fv4wOGbOVvdOHzbVXV/8RVttwlwQ/+B6PRwWNi2iP374B5tfRZap6fCS65G
 ZN5a2P0/K1PC/mVseqhXjs/io4UiEmw=
X-Authority-Analysis: v=2.4 cv=R9wz39RX c=1 sm=1 tr=0 ts=6a9687da cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Hz9TZkmbOGt6frmL8bMA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 6Gyvn022iZJdbUBWtLsEQyCWHwUYoN1L
X-Proofpoint-ORIG-GUID: 6Gyvn022iZJdbUBWtLsEQyCWHwUYoN1L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA3MSBTYWx0ZWRfX0dTp2sbtSWit
 g8woqOsJ6f0ZhIU67MpRqIOWwHDVLcwMWntR7JnC9pWGp1FF6vIxWea5eGLTV9ePCWiQFv1SfMi
 PLCiOweVJNGkGHnslTf7Lgd0FTiy6RfrLQCN78Z0v8zlhR2oOpvVm6tsAGPSr634ZmULXpIMhsy
 vkOmF/oCosTdxZpexk8YrM6TUepHFN8jfIrXocio5zJCU5WPVdDVz/cvuk4hcU77MdnbfNMNXsY
 tA7bqJwXAgaZ/d97sjffZqkJdtvfFmBnxMbidiv6c2iPEcvruX2anC7rixtgRe3I3pN2v4C/5h7
 j7wag4eMm8LzMBixg4FdVADTWzskeAzAYk8dy6deosmQ0rl+Vk59YRTsP5Uf5OqgS5wag2rlJIw
 RZxZUWinwSdFEKBQB+zbJ3XSlOjoq2lYT8nfeqAWiNsnRtqd/ONbo+QwIEfiAX4E9ibSXTFOacY
 DcnaPccEbh4Epsdb3hw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010071

GPIO 65 from TLMM is used by the embedded controller as its reset line.

On some devices, toggling the embedded controller reset line makes the
device not power up at all, unless the battery is unplugged.

So reserve it in order to prevent Linux from requesting or
reconfiguring it.

Fixes: af16b00578a7 ("arm64: dts: qcom: Add base X1E80100 dtsi and the QCP dts")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
index 78380fec8839..19ea1add016c 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
@@ -1180,6 +1180,7 @@ wcd_tx: codec@0,3 {
 &tlmm {
 	gpio-reserved-ranges = <33 3>, /* Unused */
 			       <44 4>, /* SPI (TPM) */
+			       <65 1>, /* EC reset */
 			       <238 1>; /* UFS Reset */
 
 	edp_reg_en: edp-reg-en-state {

-- 
2.54.0

