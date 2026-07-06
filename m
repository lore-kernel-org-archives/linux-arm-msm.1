Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C4347ECE8
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 21:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783374096; cv=none; b=WK7kqA014l6pLyylVpXr0HMmEfazwyRyROZ820HqT4V+9Ef5zUXJIzit9jcwI9hQZTF2FlbPvAJ6oZR69eJgYBA3Va175N6IuME+xyXkMGbkEc6wIV/4LChsQuXchJuuRZ0VC4g5ftOFXm11a+LJB8hknE+NUWdEaTWKYtrwBjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783374096; c=relaxed/simple;
	bh=vUUf0SFe8a51kmB8FPrJBDQ5H++K+t9n0PvwI74fWXs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bcaY9FA0v2N8SKtbtjggaZgo82z6fGtZ2kaMY0crmIhgGFcyhM64lIZrTRplz/6K2dgp/YwRigvym0GD97VwE5sw9Z34a8ekxatpKVmnJECzVGis9CUslEKFPCv1U15a5KHuq4wkW2IPjLgrKsY8KjHvMqOt712eWwkuqFrcCpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aF8cCuQe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OpkYzWeL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aF8cCuQe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OpkYzWeL"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666KEGh41505078
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 21:41:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C4mB77oGh7s9Y0Uqowh6UFsEunZgz5Qm0N6N+M/Go50=; b=aF8cCuQeNE/JRcAd
	bbZKBA9JgksxORNz0jvl+9V+WsgIqyei4LiWaABWQbKFSuc1ctnhTLNCBrqcGPiI
	NC455v2KZ5WRCVBTfiPwE031EFCZJrnYaIT61BxeEwlHjPkO3Qc1KqhC06XZPxef
	7Y0GASRkuIX2l2Ldcn8qEhv3eAmQZLSncEVUNNjE0I0JumatV4ZTY0i6fxOHt9Ib
	r9vCqAZclW4aTLVN2xklqwyKU0/9AA/PHLcAEszxSnR1uqaANj27lU20ZfyHSutA
	fBkS5gbEgxhclmFPZ1A/ic3Y7hAfaM+pCSFZWvFPUqNESZUxAhkl06ErXsETGFWT
	O19ZOA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a98jwsq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 21:41:34 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cacf17c7e0so41595695ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 14:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783374094; x=1783978894; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C4mB77oGh7s9Y0Uqowh6UFsEunZgz5Qm0N6N+M/Go50=;
        b=OpkYzWeLq5FVeU/TBW3Xp6swZZE4PaxtxGXFG8L/r9AEHF968/RMWJA5a/cNWcyGVE
         GnFE/oK/mu7t9r94ETpsMPa6e3nDA7QtmvSEjnn1kEwOnQuSINDpQCwgxXUWYviLlZDs
         /ggE2KcH4JF73qBSnJOZlZ/FTpYn5Py5DiXLHipIF1VLsIFtKAS7972Zfofxsv0ZrfCr
         C9fqZhInOF2K/ghL/+UD64eddsFeX5AuHGnEn4qS9uJXjApP0uhxRlnzpv+gJiFrFVR8
         yGyFrULWuXPSwrRW+QBw3g0yx87itD5/aihYFCVsFgD//28FvmVdO02GbLErZmXMQghI
         vmxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783374094; x=1783978894;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C4mB77oGh7s9Y0Uqowh6UFsEunZgz5Qm0N6N+M/Go50=;
        b=rc+ze5A7gv4VD6m9vk0ragalZRotpZOZCUOXN4uhjsfObN7+2uAF6CQZMIEMLm5pgC
         LJGdokGJyOBaSZ9gex11NKmyNnunjEWBoV0zQBa8FXFlRmEAT7RG3mPylev23bOPBcIg
         uLY5BX0jD0PabZOka9vJXCjs8dcR8GxrG4KI8mYp89+T0mEsOG8tMvv5lk1lVKyGy5/L
         zJwQnkIc7baBXywOfRn7ihJdYc06cV8R+swRA+oD55AfogQZg7q94vXx5teANqgW2hs1
         LqHPGWowNRlWa5/r+U4uwfKwMs7+28Rpa8nt/Ou4TKTfI7or4QtCk8JX6dveqq1RU9u+
         Fmrw==
X-Forwarded-Encrypted: i=1; AHgh+Rp41ywUAdqjt1SumuN2GQUWIFLvzZWS5av/oAloJxASyAc20C9vbF9JlRoSqqr6Z2zKCM125bYmd9yNkLn4@vger.kernel.org
X-Gm-Message-State: AOJu0YyPR7NQAQHZ3VlHb94TmCpFMn7xaKGPUZ0t8UlPGH1JH34r5YuM
	fI9i2yT9fW46ypANaU03pVQBd1DaR7eJriLqUXE723HOlVOvOEuHulGZjehwOKxPVzuApujZIaY
	daav9FWFMHm7FYD6BB2J3vKFbL/8aONsdMwwKrVIYOsYWeDr592FEyQa0WNC1UmAZhWQS
X-Gm-Gg: AfdE7cmpeM3k4OiMacuahg52TT0R+fkHtztdQlAGQKr+FVl0R/oKsSmZfOvGNb6wBqG
	ku9h5qsJcAJSOjZt2PjWVFf/fkhGvZZRF4JRMxu01uwKAoAP/EFQ/caCU6zqIWb6Izn7/GjHEtM
	+uAEL4+snsbJY/YxXbomfHdn9OWcdQ53NEFe90nIMBnzNMYcRARcwUUdC8VMF1azfTZ9askr6Df
	IaPz1cB18IDkUiRBOS4TElUwsXeuFLUCPF3qCFiLmM8iqRlSt00SQy66lMv8E/AATheHD2t5LUX
	u5pe154FBIc5mMNWtuj9o3aYQNbvNpGPMVzXJk+sziJxq/qRKdKsTorpJC9axX2TK/pWd+Wol96
	vy7JYfyxVkK2rJW4AQoWLU3nDtnkiW2jjG4s=
X-Received: by 2002:a17:902:d508:b0:2c9:97a7:f548 with SMTP id d9443c01a7336-2ccbf07a0bfmr24977805ad.46.1783374093645;
        Mon, 06 Jul 2026 14:41:33 -0700 (PDT)
X-Received: by 2002:a17:902:d508:b0:2c9:97a7:f548 with SMTP id d9443c01a7336-2ccbf07a0bfmr24977335ad.46.1783374093148;
        Mon, 06 Jul 2026 14:41:33 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d8da9sm901810c88.14.2026.07.06.14.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 14:41:32 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 03:10:24 +0530
Subject: [PATCH v3 6/7] arm64: dts: qcom: kaanapali-mtp: Enable GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-kaana-gpu-dt-v3-6-8dac9a60dd5c@oss.qualcomm.com>
References: <20260707-kaana-gpu-dt-v3-0-8dac9a60dd5c@oss.qualcomm.com>
In-Reply-To: <20260707-kaana-gpu-dt-v3-0-8dac9a60dd5c@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783374032; l=911;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=vUUf0SFe8a51kmB8FPrJBDQ5H++K+t9n0PvwI74fWXs=;
 b=aWOgXzjDLGOk6ap9wWT6nV8R25bUMhTcQZ8FX1FCMAyQ6W+IvA5VqINg1OxgXuse8gpeFkUWT
 zQiCbM3Ci4mBiSxjBmgJuTY4/9WT4cqs0AYsxWw6lJS2YMP3ONPEr6w
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=SpigLvO0 c=1 sm=1 tr=0 ts=6a4c210e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=VHn1p_zO8-rooJRYzQAA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDIxOCBTYWx0ZWRfX//+LnLK/XbFN
 ClBskiGrjQNTGRrOAuMZ9S8RAFy1rLK/0tj808+jin6bOu5irTs+dA8sHYZ1OPbev0hpUNiRHbV
 5AHOS7pJC6AJyrHDVDR/3+lG4bvUhfDcrhxjcl57g5OCnWCnutVTMCoFLSzyQo35uomvZCioMhO
 ftsFW7lr9AJtDyp/QxV/Dd6+DS274fFb2ZhLj7YaIQ/tXNSs+7h2xGZ96l6EpzltC97OkPT0UbZ
 VsroYKt4+rUDmpqa/0jw9Hm9rD0onaLmComgI4A8XrHvZ8Uf0x+zNBEj8VG65BmiEsMmzyk9UV4
 vMJXwOWxmuBbkebh3TitaJI8TAIA8CDn65Fy40msDGY4XAjWucjQs5V9IdiRAMUyVc5IoNrLBg1
 fxX3PRWO8gyWRTVXXRbCgqMY5wwQcMK0yEQ9YC898a6bvX/Oyu44lqKITRmWVlb+0jpLxIypB/Z
 nCyohUKq/RuMoV5N81w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDIxOCBTYWx0ZWRfX2ooX38J4vUoS
 tmb6pObQRIUFk/pTb0t8oce4cfRmfnNS7eatJkSvl5RhLp+RMHE8Zvt/njjgnrfmIY64YFdnQYu
 zqIWUrjK0sRYmGv1c3VyGEXSHSx52VM=
X-Proofpoint-GUID: 8_1wLW3gCBGvIaA4ThbV43Th6JC6p4yx
X-Proofpoint-ORIG-GUID: 8_1wLW3gCBGvIaA4ThbV43Th6JC6p4yx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060218

Add the secure firmware name property and enable GPU support on
Kaanapali MTP device.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
index f9b5b5718b90..ba256039dd3c 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
@@ -865,6 +865,14 @@ vreg_l7n_3p3: ldo7 {
 	};
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/kaanapali/gen80200_zap.mbn";
+};
+
 &lpass_vamacro {
 	pinctrl-0 = <&dmic01_default>, <&dmic23_default>;
 	pinctrl-names = "default";

-- 
2.54.0

