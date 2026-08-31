Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C8D3E3D98
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 10:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788170599; cv=none; b=EZggMQsWzcSYms3mSqkFVbdMX3Frygas3biUAyOpWjL9DbZ7XhV7UUPvV42yiEV55QQxL396ZK8KMfeVazPvxwOppWNjxZBXF8M4O5w6XkdtMs+YKygRBLsXw1TIEtAM6xU6InnfYaj6wWM5L7q4BJ05wGOGrlWdLbUXffauvt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788170599; c=relaxed/simple;
	bh=E3Bl7IOJLWC2ncwLiiHDAe5gFUZwRKnRj9M4ZT8jOpM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Po66q2Sk5wEOkWK1ZAijFvTUCceNdeFpcxWIBCcag4j3VLidVL+BOzTb7Dz8Efn67RolQLic7ftyV8NDKpVKDn4qNtII4qHnK/5gNsOumzi4tSeJFV2jH0GY8XT0S7ZHTmA1kgb+P1+wkaSwwcVPBAT5rkhi6cbB5nk43t+COsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fOerb1an; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WOxfTU4t; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fOerb1an";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WOxfTU4t"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V8vh3j3302660
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 10:03:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1QWom6wqkGmwAYXK96+Qp7vhh3Al0ftle0VXl6TTN2M=; b=fOerb1and/kf85Cx
	GTjt61gvSOwW8cAkisoDYx8FA/uOWPhGQcC+70l/fmvR1HYC9xSOE0EzbCiqWtki
	BZyli4EKdO3JxjI9BMmYb2mp8ZUsdj52Htk7uiZjSG6WgpPO/BqYQEyyk6P6aWU5
	VdXl8mRQPfTjCQiNRAJxmdGRtqHoSrJyojnkMEfBEbnDgJrrnfshEkk/IaGEpQvB
	+zqG/a0CEgu+qzzaveqgY5IxblEFI00JyQCFAG9gxtkCjAgzmEFzBwpAjmPWqvlF
	cO/1yPsAno2i57ZqndnoSyeodDeoPBKHW8PFba+tiwciEoR5y6ArMGmBPsg4EglR
	aflE6Q==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6jgg913-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 10:03:16 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c683ca769dso368412e0c.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 03:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788170596; x=1788775396; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1QWom6wqkGmwAYXK96+Qp7vhh3Al0ftle0VXl6TTN2M=;
        b=WOxfTU4tvj/jjmqH7gR1jaEmcK2BEByyrdCuCO7Yh9LSjyTdGgDOL8a21akEC2Ta8P
         PUQge+FKA86AmoEFmztqhc6M3QBcwu8ntThaqfMpA6vipxe04BddPuuPSJ+iqss99iAS
         Ge/IqOd0gD7IWRGXm+M3Z/FNZ5yNDFLs35mIcvHwmvRBiPRyA65JnSUSZz1FIZfaox1n
         KFQYz8H7xsQByIOhrbRbcBxWnLIzVfpEXMhK+LKm20SCW9DR2r3QdlfK6xgbftCpJwD9
         I2mh8Gk3foAvzK77sV8jNmoTWByfIVbGV1G614g6KvRVusSw+lvtqfNuyisA5Oa7TNob
         +ClQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788170596; x=1788775396;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1QWom6wqkGmwAYXK96+Qp7vhh3Al0ftle0VXl6TTN2M=;
        b=pTeF08DpMyUVVdspWX7KficWYe0IOEESmsraAXuPRi6DPFG6XKBJHCqWmZLXh9WW5+
         bmC2ykV2eJZKnn+xt0XY8kk1kEMrLNqxCQEG8ElFh/UAE1xRlOPcRX/mijWyaCwcQyc2
         LYVlYFaCrQutRZ9QzTXMScWUiw/skx/deRYd9TVQh8WJg7FFnfJUSdQNciBB7kTsJBc9
         VaefDboHLCEeO5I1toHRKHb+tdeM3x47TMN33GE8t5Vf/Tx1ko54Dp9tHS6bR8u6vD+f
         4rr3rDV7vQhwY9wSYKk91Dmw9A/lkhq4Q479DafaMSPnOcwzBtKFm6glDVGLwVkySTs/
         HJ2A==
X-Gm-Message-State: AFuF++ke8oooUB6AD2KUSpFKssPFgyTeC2aX8T084FWdNwIDZuNiDgcW
	KJlSGyMSqHSqne0igpAC2xxLDXSI/zU1aZ4hL/IwGHzSdCTz0Sc8/4vNfAeJ3nho3Zz7rPMBLyE
	GsOz2QWHjW7sWq95Hlxkd1LnaQ3Ykz0BxxOpe+VFax8ymApL79zCrYp16EmaWtwJDZsvj
X-Gm-Gg: AR+sD12fKyFAgYKz74KPSuXUjJ0QLTtRFm9xpI22CxZhaKb+I+/DPxyu4uPl/4h47sI
	TqTrIgSE7uekQYSWioh0dszAU+XA4VS79v2K7ugO7LQcB4Rwf4VWQFJP+hxjlD5bzwmME67j6t2
	aKOVbUqdzGD+8id1Y54lZsd/d7s5q3rC/lC2uPTwF9MMm5Mal1FNEnH0F00yad7RwnFi7lwPln/
	z3S3FBqPlpw2ykIbuT7Nrec4P2vs3q6RZpF6B5aNWgpwXwrtD2dR1KAjnvv9FztGbPP8h8DPpOe
	PnGtj7sqvhaK7WURA/TcB6h06RQhk4z5gffvyIWcevJl/kD4yAytDqN6YV509RYg2O+0hwKuOv+
	/Wd4uKw==
X-Received: by 2002:a05:6102:2907:b0:782:de7b:eead with SMTP id ada2fe7eead31-785962b3b4fmr7225457137.1.1788170596222;
        Mon, 31 Aug 2026 03:03:16 -0700 (PDT)
X-Received: by 2002:a05:6102:2907:b0:782:de7b:eead with SMTP id ada2fe7eead31-785962b3b4fmr7225429137.1.1788170595657;
        Mon, 31 Aug 2026 03:03:15 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b9281772bsm131001555e9.1.2026.08.31.03.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 03:03:14 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 12:54:41 +0300
Subject: [PATCH 1/9] arm64: dts: qcom: x1-crd: Mark the EC reset gpio as
 reserved
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-dts-qcom-hamoa-reserve-ec-reset-gpio-v1-1-5b202de8c74f@oss.qualcomm.com>
References: <20260831-dts-qcom-hamoa-reserve-ec-reset-gpio-v1-0-5b202de8c74f@oss.qualcomm.com>
In-Reply-To: <20260831-dts-qcom-hamoa-reserve-ec-reset-gpio-v1-0-5b202de8c74f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Marc Zyngier <maz@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Konstantin Shabanov <mail@etehtsea.me>,
        Srinivas Kandagatla <srini@kernel.org>,
        Georg Gottleuber <ggo@tuxedocomputers.com>,
        Ettore Chimenti <ettore.chimenti@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <quic_kdybcio@quicinc.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=855;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=E3Bl7IOJLWC2ncwLiiHDAe5gFUZwRKnRj9M4ZT8jOpM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqlVAAZIyy7ye6ciOZ+4uJhM3RuNFexVLbi607h
 1ZU3xcKXXOJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapVQAAAKCRAbX0TJAJUV
 Vv8VD/9Z5GEo+B9eOGEodRBXir0ytlbuQJSg2gAPlEqbVp7+UthBwuBcwyJsRNQ7wQnwyAow0Bf
 pg0EUHsouEoJ/4wG1KN5kuwRbtLhtidpHAi8mjcUtzeSwVpKoHBBLWpppFwLqrPd5iaE/bB79wi
 PO00TrmIqAobR5kBGFVgBhp+5KAwvxim2mRcfR27C59yB/O7dmbjhCTKyqDXgmcRv+6Og1h5YgL
 qb72j0UY9jIw4GjPBSf+38+f0+FBj8m//qLDTo7q5x6+3/PIiDDUfA/S48XHXWUR3PdPSffk0g3
 oSVMmxkZcgQUUXLibbQ8ZOo7RusmQAgIfGW+njIWiu2BhNBfBkwDP3jws00lgw1xTbilND/uD+i
 E2lpIvxAaXaeTe3kA05ZCePuQTbO15HVe2gFbkpnEyzyRQ9EA4+paqabXpWaseathTPN3NchEY9
 UAfhWEko8xNyyiAqp0oHmmUUfVcMccLz22hPoyro4r5oWSYMW7zLQia2PYzwHhuCxhzr0H9tLma
 D5ri41f35pWU/A58duC9ANHqHUoTz7y31JcXWMthZROaresG9IUdNbvLT0zLNiDVsFFAjvDzqJR
 o4QQ3cZyCglG0aZjJPhkPASCMDDpCtUCscCpcJLOjUlTApb+6Gc+OH+nhEqoX9eNkxOo9qNYH7Q
 qTP/6EijT4sGBoA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: 9sVYPWY6QQ0KsFaPtgZKubRJMWjuFH-C
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA4NiBTYWx0ZWRfX7ISL+o4omfkJ
 KjyRVzphMZoEqB0RBP+hJ6N2PKxjNo8IwPPuRF3G5nYjrmZNTbBhT/fJ39ICQSVFnvF7Pd1y2dM
 DX1VgIbx0pg6m1bDcJQvAYC1Ie/wS1Y=
X-Proofpoint-ORIG-GUID: 9sVYPWY6QQ0KsFaPtgZKubRJMWjuFH-C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA4NiBTYWx0ZWRfXxA4t7CEhuVcP
 QjOOl3PUzwFJ3SZvQ9EsNAp25tGnSUzlXgSgHvWXVqRgfTK3zu0Wg0eEIERyDUWgC68EgcHLZu5
 DhWnC2b1PcLFfTJJrula1HVLi2jq55gbxZZN5kU+U0R2CKeoZooIHsf80TjNBYWAdcEPo+4z+t6
 R5iF4xvApM8qPYBqQkXYVkt/GNiLZZFQ7u7V3owXC1xla/TB0uebLoTihEjDyF7/csp9NGMp8Zt
 4Yh7nDlx90heTdXSnFaNtuC0/9KnHJD+B1BIpPIWKKb/Tvz2U/rI5LT6NoXRr/6siEJWv2zeuC6
 diuthudmF4PPrNYg+g1IFgKSC/P2Oi2MmpRA4isC2TYBQkuhQUtcu7M2acMLatWWv+sEb4If0hU
 2S/JNbOl2engKWPpI52UzYDH47XYcXlNolKzprJPyOHSkQs7zZhGtOYdTyQNjKrhqIlc2rstJcb
 /I7YR5YH0K0UOpAbuyA==
X-Authority-Analysis: v=2.4 cv=YsY/gYYX c=1 sm=1 tr=0 ts=6a955164 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=nR7Le_ho8Ysjy6FeGUUA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 suspectscore=0 phishscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310086

GPIO 65 from TLMM is used by the Embedded Controller as its reset line.
Reserve it to prevent Linux from requesting or reconfiguring it.

Fixes: bd50b1f5b6f3 ("arm64: dts: qcom: x1e80100: Add Compute Reference Device")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1-crd.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
index 60db83b8985f..d1bed84725e8 100644
--- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
@@ -1531,6 +1531,7 @@ right_tweeter: speaker@0,1 {
 &tlmm {
 	gpio-reserved-ranges = <34 2>, /* Unused */
 			       <44 4>, /* SPI (TPM) */
+			       <65 1>, /* EC reset */
 			       <238 1>; /* UFS Reset */
 
 	ec_int_n_default: ec-int-n-state {

-- 
2.54.0

