Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DCF4525A94
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 07:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790063530; cv=none; b=j61JUMgxcC9lU0Y+nRomDOUs6GwfGIGde/hKFZnLgEWa3Ct+as+tIWAhO16bchie4s/rnhYn3kTkWW9seLwHGVyjXS45NWEdWOkrIpgedcb47V05iNMlHqeXRj182yeIM8UrafIcy5oXZ3Rycj6SnEHpOvoABVUUCcM9YrSgSQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790063530; c=relaxed/simple;
	bh=MXG5XS/+4BCQTMzaLndKsm/y3Bp827Iwa+Cw+2nxHZA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sSWQLtBiuVXYI8n328FCY3SEKVdcxed39NShwzeI2NjBe/bDFE5XTNuBLj8oFjneB3Es+c2YOPPFJS006O7qoV1dwK78QYoHOgsKqBq+m2ljdG10u1TwfiL7uJBKjGA+Ut83AgmrJUQLo2bSI5x5x46hiN0KdtVwdOx/5MxoNbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OpJAKZgW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IqrxJBqA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OpJAKZgW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IqrxJBqA"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M6u6c92165589
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 07:51:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jrg9f/q9rF7RMAcgkyXnFRKfIzTeJG6h9sR1u+OZIuU=; b=OpJAKZgW+3Py7w/L
	qhLmbTkectaMQuhKuYpk/n55nNo6iGWBEPdSwFEvKSx1WOlx4Td6oiIZQluiahXj
	kMLF4IE7OlEfv3R9qvT2NgB0RtIKqFU6UaJiKABKAEda70O/C2c3JotnWvPK6Vf8
	jvSrJ5mcFYCMhwnf23il+RNbOZJWGOCNLOUsoBozGPUrKdLCob9limocf61VFTVT
	BjaxBsvARrV7RGXWyUlEdbAEmvB/+ygMvE5fp5Rque/qOEcmM4z3CIUEf0t0wCvw
	ayi7wyn4ebCj+3BafmkQctk6uTBxKrbWrh18hZAkHpTuShe/FBBoIQ7+mtjQMIE0
	dEIR+A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu8xetw72-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 07:51:56 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a01d1d1b6so580843885a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 00:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790063515; x=1790668315; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jrg9f/q9rF7RMAcgkyXnFRKfIzTeJG6h9sR1u+OZIuU=;
        b=IqrxJBqACnCIzNZoBEUNU3WX/rKurDWLjgxJMLqf4Ya6YrAfhi1FvQvb2rPQw+VG+t
         sugi6rOjZ6OCXA1Y5WXgMLYkRRm+JPoaEzZbKvmZ/kSlLgpYZe8W4cvQBrJPtA1UClHD
         QemnOs9NrVpbPwHBYNQYQ/YBHS3sIAJMOX5xsAJTVO20Ya/VfBQX8YMRR/pcU1pH9eNe
         8u0V8933VEieELGNugT/nJrfLm64rlVvwyad9TE/eYWEdZgIGJEsHlj478+3hjOMIeW+
         Kt0UK7UNBOLq1xSH0Kf9AcAEDC80XFqGnpYHwkvdvY17GeeMQXWlHuOMk/KW+xdjg7Du
         SPcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790063515; x=1790668315;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jrg9f/q9rF7RMAcgkyXnFRKfIzTeJG6h9sR1u+OZIuU=;
        b=WVYnFUUsu7tVzehEnSu+aixsG0IjgaoQWQU2miO6E6eqECctVqOWQz8BXxbkKJZxAN
         Aj19SrkratI5yLPSbHt6MvLUwE6JKEm4Pm+7xUYYVI77mZNjebSG7+nOyOf9eYKea3hP
         CK+4w+oZDSJ2c6E4MFRR+WZFs7hKN1v/47//bmxN54tuMdE9UfORXe4CSjHIArI9CE7X
         7KClpklz7iwcvEHBL6Yr8iQVzXnacjUUVPpcpV7quI2UGV0pXn9C2JviCbhK1P3zdIPm
         ug3jrhXMlWu9vdUssC9Oc5o4HAy4canUUY72WJLfKfLeIK/x8ElQT63CWhl8cbm+DSTe
         5lhw==
X-Gm-Message-State: AFuF++lDiJMEGAzcyO3P1x6NQmE7fKCe0SjqpeJ+AgE6fGKOXfAPMutW
	gm1MLLsxpY6JFd/97M4L6Oc7/qomG0S0wMChkvQ1Ek1HvSFQrIbATZPrsNvOeRpPNfEm/n2xAiJ
	52M1RijeJYo+8vUBBnbl8TBLfkiVFlgHCOWODT/KKbtpZejhrRYZXrlIAcpM0vl3S/G9V
X-Gm-Gg: AYBFou1ozffiyOWDnzTj0jWFeodQCnA05fHw7gdXqPI5sqlgm2m82xmx74HoC0qCYQJ
	aaBJx3pjN/zGJEa71WfxI2hXfc495qnMZXL6vBBfu7Ihw4z/IQP2FYimm/SXPuBr+n1L+S0mTbM
	ukFMusFPXPJ/2DvkJelKrqOjJKN/6nLulKnFNwfqoL7gT6ljt/CxwpKnAZ/kciFlobotWQw4TZs
	XaSp9cDjrXmd2UyOHVNt0GiZIb+I3DoimgizxbHZoToOv0rGO95JnsqUxmFcNDZOQBF2f/e+iJ9
	D7rr/n+pm45pBwO7z3wLMAxAiHR49t13yxOVyZo3Ud8nHA8t/r05hZ7ma+dIDtwqV5Bg6phssYi
	rlY72rlW4
X-Received: by 2002:a05:620a:4888:b0:93b:c025:8508 with SMTP id af79cd13be357-93c197abc0amr234367785a.8.1790063515184;
        Tue, 22 Sep 2026 00:51:55 -0700 (PDT)
X-Received: by 2002:a05:620a:4888:b0:93b:c025:8508 with SMTP id af79cd13be357-93c197abc0amr234364485a.8.1790063514570;
        Tue, 22 Sep 2026 00:51:54 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48862789080sm3046925f8f.28.2026.09.22.00.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 00:51:53 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 10:51:21 +0300
Subject: [PATCH v3 12/13] arm64: dts: qcom: x1-hp-omnibook-x14: Mark the EC
 reset gpio as reserved
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-dts-qcom-hamoa-reserve-ec-reset-gpio-v3-12-fde7f8a53382@oss.qualcomm.com>
References: <20260922-dts-qcom-hamoa-reserve-ec-reset-gpio-v3-0-fde7f8a53382@oss.qualcomm.com>
In-Reply-To: <20260922-dts-qcom-hamoa-reserve-ec-reset-gpio-v3-0-fde7f8a53382@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1071;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=MXG5XS/+4BCQTMzaLndKsm/y3Bp827Iwa+Cw+2nxHZA=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqsjN9HvNb36IdIspCbybMd06yMA7W7FYdnuvZE
 SkTvt5NtmmJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarIzfQAKCRAbX0TJAJUV
 VuknD/44HQo4t0fyHRAAwj+mOf5V5jAK18wUoIIzuJKJqTRwKBjNoH/dfxoV//pgl7vm2OkRBj7
 TwTJbwNLny7bSRZILOmZ8UrJXL3rxgaWvvA4ONb0f2zwDoSiE3a/sGfL0sHp6eYueC0b7Mz1HnZ
 eTjtBB4ddnKSi7MHOBa5EKp7F/dIiU7TQ8Ho/mXB8rBhKLVj5waQB/DvnpCupnjQM6fKNQA9qEB
 ZH/KhLiFFEdtRigzM+IaRCTz5diWZ2JDsa5arkl2WMAK82YpduVz21XwhVYGcTsdeBq0MbsbHw1
 SmVbtyJden/4rclAnzf8bJCWRdLYXSD8ef+PaHCPyk6Sf6ufU4RclZZW+UCBCnCt0RIxxJa/fot
 NroZdUz/NlMMIfEBUzAv7pJYvg7hcSnOm8wfe8Ey0ovVwGyhdeomL0wnQI7LSXHVBAL5fQOB1I7
 y9HH6cXHvlbF8pWAbP2/2bCH/GADUEVQFUkyD9ioZcjni2FYrhQnkaJU32wcM6z8g0vpBGSpfQx
 ZUDFzTkYEELExpYG7nOY20iJuWcdK1m4tV3Jp1PfXoXvZVzuBA13oe8THETjXrZjPEVBYguUfTk
 XiJr0z+sY4rOuTtOS48r5/kxbFTIE4GrgNL9IzWZu4u4IQ4FldLoqoOa6VfemHvvldlw/nSOuFW
 rgSkse3DZtej4EQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: ROXFap8Z16mGEJ4akezaWIlSHc_buJaz
X-Authority-Analysis: v=2.4 cv=PZhqFShd c=1 sm=1 tr=0 ts=6ab2339c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=UFfQ5ueM2aPJ8qDrgdoA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: ROXFap8Z16mGEJ4akezaWIlSHc_buJaz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDExMSBTYWx0ZWRfX5tiwOkK6gA9S
 o3V6zt61w6akGH1W8pPKSOlwmr4Xquwt4U8vGgG/I0xUF1Xl8UYNYw5/jwE+Pw+zvk1gzAjNpDT
 9icycie8h4dDuDLsSHTddLxNpAe88KL8zNvdRxfSUtPPkKpoNtaov6BQPOcyF1M8i/+xy/D/FVg
 FUTzL0OU/VQZ9gNctSRUz0stb6KctZutn6kJtR+llH7rIyOhybaTZ8s/khMnhywKYM7eVlayRDl
 NaA/svTDvjB/JtVsMLo1nXUa2Rlu97Ouw95qiDz6HmaCNaGcpfZl5jcc1l8IjVOpBb+7DnXh9/P
 BXNjiAsijNUaQ501yuKdohZYLMOqcyuYBhj/D0w67lY9x2E0A5omAAkDAzP6+Qg0OHXs1cdl4ZV
 uMxRZIM9/pXCcn4KE1eqy8lsPMw7Dw0kmbXxvpgjs9h1FY26BlRvGaZph/btZpTSdFTcGu0gZ5U
 X3D2loXmc5aQRwEvUow==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDExMSBTYWx0ZWRfXzrTJyFAIMYKv
 eO2zjIpERK7vVD95BbeZYsqs1qLZjkaCAUKe3ttZYQC7SlHm4DjQKNdCbSlz9HU5ZqqMmd1nXIX
 pkiTATGWrN8uiWKQ4GZLPP3hG9uhayU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220111

GPIO 65 from TLMM is used by the embedded controller as its reset line.

On some devices, toggling the embedded controller reset line makes the
device not power up at all, unless the battery is unplugged.

So reserve it in order to prevent Linux from requesting or
reconfiguring it.

Fixes: 6f18b8d4142c ("arm64: dts: qcom: x1e80100-hp-x14: dt for HP Omnibook X Laptop 14")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi b/arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi
index 6b4b17acc069..443901a09d4c 100644
--- a/arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi
@@ -1308,6 +1308,7 @@ &tcsr {
 &tlmm {
 	gpio-reserved-ranges = <34 2>, /* Unused */
 			       <44 4>, /* SPI (TPM) */
+			       <65 1>, /* EC reset */
 			       <72 2>, /* Secure EC I2C connection (?) */
 			       <238 1>; /* UFS Reset */
 

-- 
2.54.0

