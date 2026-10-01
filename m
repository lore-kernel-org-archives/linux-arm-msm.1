Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D371515880
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 13:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790862168; cv=none; b=YZeQYvN4Va0wdC7TbSPEtMtf+Ys2cToeELy5ybtd/RBnKNG/vAYs0wqtR4ZANCbcagn2ByZkbRTkUJLMLI0UJENNhwCcZBDMkmNnLvzddHy1qaRCn/u8d4P7wwZ9pUKXsNUkvtU9SSsUnXx5oVSkHSO2kHetTdGo9FBpm+/jYEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790862168; c=relaxed/simple;
	bh=fGBRJDBK0Cbvg9UEwh16Hju6AGd6nlsNo6mYDzLTSv8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AyyTf3Aee2xpuCsVrPiwCqgxlmYWfqIpLoAZcVJE1Tj4bX5ztE7pqSo9x1thmFBiZ+831QDKGYOxrAIrXV6bR1li3/BDyf61XyuKUAasBIINsCJySwZyxaoOnu5NeIC54YGirgSewVehQmjuFiKucZRaAU4DoTVcWPhwBIwQGoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jakb0zVr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SDstbK56; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jakb0zVr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SDstbK56"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691CBiIR1661097
	for <linux-arm-msm@vger.kernel.org>; Thu, 1 Oct 2026 13:42:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ExqMwpA5mj9HNlIk0Jg2zQUbYb9rvPQQg5hznjs2lwY=; b=Jakb0zVriPt+YlTf
	q/0763xxZldHF4i6BtNeik5V9+UMNznbDmJwlWHnjnfVO3L0qH4xsstHN4XuqR1t
	ZPFO61fRyBolNvnfl0avFVp/QRnZcRcCxFwmJ2OTuUuqAdYTNT8VfGYQKUtON1BD
	S9BTspXD+qAHS6899ZFeQDW8idE+SulsNozEoYYRpHsOFvDFKHJMxUH/hSOo4Jta
	s1gd3PpiR3Go0LMlG8G+oAElEx9timlLZ9Ahx6zdDI8A6xorPGmj8pwQe0ZpQjca
	NDVliCsJWFA+YmcitMpd85OjiRkOTyBiPrhOonY/a9250O46BDCw/6Tx56YgC7qX
	jQ1aGQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h167pmysr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 13:42:36 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-144d4ba280aso528284c88.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 06:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790862155; x=1791466955; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ExqMwpA5mj9HNlIk0Jg2zQUbYb9rvPQQg5hznjs2lwY=;
        b=SDstbK56MyBqpo9zPAbXnh//1pXgIRRZKZ7D5hehvtAKYszvhL3NlXWg/7mKgTWsvs
         pBy2LOI16ujQed3czR9jzLDAruc6sctS3VJGzQiBH6vMirhBU24N59FEKM4IRzxOAQvi
         FwAAI6HLWpHjnKzPgcKWV3gaUgSSnp3+J2wz/W3BvNu24v7YSSyrOHIKdPjlwEZ310Di
         /P5C0o3Lstwnfvh7GZXBEnRnR6MdTvhx/AdHQCKE2WBtXoNPnWhE2kFlcTx5+FjUfGLX
         149kjd8lu3Vh8fDjBXqTeD3snneUzd4QzfPDCV0v1z/y6C29I8wzEixr1umeBbJeyyub
         uEJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790862155; x=1791466955;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ExqMwpA5mj9HNlIk0Jg2zQUbYb9rvPQQg5hznjs2lwY=;
        b=Buvu4qwUEmsJeKONhz59B9Z96/pddjHIrtGepIEm6/3blcUioVZcOr2bR/7n26fdS1
         ZJEe25BNrl/Mef+EMI6VW3z+VSYmhdmkPbQ9551Gm2nrDFjm5ibzJzLdkrb5RRmLawPY
         BXyKDix0GjBW1mSBmDf7vQLim2CH9kYWfftbD7t0VQbQCcfYcgsBGNeh5KhtKDN/tEe/
         R+h+3WYFNyWwyKhu/vaem5tfZStCfaJTbmMouabWse97iZSyeXUFJtAYSpQ8B5ujBc86
         104E6avDcSWuLjpw3hwR+/POi9ZluBae//pv5y6IZSfBEPpjhToZ+3vbx8Y0vXRYLh/M
         gTSg==
X-Gm-Message-State: AFuF++ny4L04TdcYMFRGrI+tbZwU8ODQaiezl5yzn+K+Cuw0kQNxpWsz
	zfGUyy6v2NBxJXnT5pg0eVhL68JlXt9UYenrSJ4XWdoeNi+VUBJB/uKGZchUKBB9nJ3q2SjldO4
	qaejFFnIOL9reJH8mls3NdnlVYur+UW4eLiZffwYmOwGk0qzGI/qrh8g89pBJ1jg44hgv
X-Gm-Gg: AYBFou0LBv7X/Ql2jBhTg/6njG9xpKzYyLfFpUZ/mfDRhalpAR5M5wuQc8fO3wlUqnE
	Yu5bGulH94rMIdS4/WDToFFm7FpsbxM/Dp3EGIu26eHiwz8GvSiOp3z9N3FOWfr/1p4jzgEy/wL
	zJhewvnnoLpxe419RuXrGsD84x67hxE/4vYKzulu4/6o4EyUNjDAANtH8/qfz/RQfpcleTNrTR+
	5UtLaKFvVoW/tBUe3+X8lMoSiGSdntUu0Hh8cnSDPeP2tX+jFc7jQXz44PuIc/jwYSq5AGwm99v
	Vg0uAr0TVzYBGpVLMRC7/d1WhO7F2uxzG5jME7JRLS6XSSXdOs1AaritWW9mmsQAfOYg9gBx+3x
	ArgWTIGHcXygxSZwKqn/mG/k9eO48uqMGpto=
X-Received: by 2002:a05:7022:1219:b0:14a:51c8:e9fb with SMTP id a92af1059eb24-14dd0ebf8acmr2802762c88.13.1790862154961;
        Thu, 01 Oct 2026 06:42:34 -0700 (PDT)
X-Received: by 2002:a05:7022:1219:b0:14a:51c8:e9fb with SMTP id a92af1059eb24-14dd0ebf8acmr2802727c88.13.1790862154358;
        Thu, 01 Oct 2026 06:42:34 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14df34a8385sm6668906c88.6.2026.10.01.06.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 06:42:34 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Thu, 01 Oct 2026 19:11:57 +0530
Subject: [PATCH v6 2/2] arm64: dts: qcom: shikra-evk: Enable Iris core
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-shikra_vpu-v6-2-37143dc1bb9d@oss.qualcomm.com>
References: <20261001-shikra_vpu-v6-0-37143dc1bb9d@oss.qualcomm.com>
In-Reply-To: <20261001-shikra_vpu-v6-0-37143dc1bb9d@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790862135; l=894;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=fGBRJDBK0Cbvg9UEwh16Hju6AGd6nlsNo6mYDzLTSv8=;
 b=478vIB2fD995pn3/LXb+i96K/TWTOuD+OLp4Pfol68uNF/1t4lIit0Ipq1SWmqbZde7IqeYlE
 0d5+H4HOCZgB86K12nWgjUxJ+LlkfaPvBBugYBL4WEe8+Qau/ZsKY0V
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-ORIG-GUID: njE1XVt2OQXXWgpw9GpESIZJTVDCA1Ft
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA1MyBTYWx0ZWRfX2ZsFfhJMf8rF
 k8LmgLTUNky5uaI9mF71yIxL3Wr0ZJa6qLNvoJe4T13FbsJPj4U+6ZaG7NaIHWMHErh+blC8KCN
 YReH7njmko7u2OcJdIJcJMRXARegVHs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA1MyBTYWx0ZWRfX4XSydqcePfIe
 9Q0scF8EfO8ZNTHVvB8tb25IF9AeoqoNCAy1x+vLIX78Vu1WSM+KLCWeB05piXSZVY1NcBDgHIi
 bc6T9aS/NpvxGsYyfPOMCZOddwLQ+v/juaGEJFRrEJPHfyibT88rsWh4Szb+BLDtK0PC4Dt97Gw
 OXdQIBQlVs9wCDNMil/tVHWRJ6MaRY1BC9+9Es2NE3av9TPSB8FxbC6eiKlEhOm9IjCII3wggbl
 T7Zc4R8u4cPm+XIpS4IKEV0DCAcjGHILP8U3OSrK+S3BjDJ8H74S07hyWhfR9YlChfvzrG2piUj
 qmwv0gAAJ385CSHD+VXmB06nkLyx+8fDQyqlJLp7aCyrWL1eAbTYKwSkLEdU8XMUeCMFMbivM8O
 37S5Yr2CNs0CbdZ6B/AaaPu72o96l91mxYCc1uw3KghPigaAVS3wgZdWHyp4HB1Z4gPihHncCpk
 E+4qKRmTeAIkNdfKLVA==
X-Proofpoint-GUID: njE1XVt2OQXXWgpw9GpESIZJTVDCA1Ft
X-Authority-Analysis: v=2.4 cv=WpC+otfv c=1 sm=1 tr=0 ts=6abe634c cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=1g85_AabptgA1iKMKMUA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010053

Enable video en/decoder on the Shikra EVK board.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-evk.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
index 7fbd6d1de19ad3d14e78f197e6c1d7e3ec5fd335..13036d8cc8ebd60fdc154458ccfcbbc4867e9f8d 100644
--- a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
@@ -11,6 +11,12 @@ &gpu_zap_shader {
 	firmware-name = "qcom/shikra/a704_zap.mbn";
 };
 
+&iris {
+	firmware-name = "qcom/vpu/ar50lt_p1_gen2_s6.mbn";
+
+	status = "okay";
+};
+
 &qupv3_0 {
 	firmware-name = "qcom/shikra/qupv3fw.elf";
 

-- 
2.34.1

