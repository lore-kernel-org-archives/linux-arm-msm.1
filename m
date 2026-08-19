Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658B63242BE
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 12:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787144014; cv=none; b=jFJ9aOSAlaxLFPCLN4/FZIzwn8kBYoDrvx4m3brhDQZWn5Z1eoVi0BzqFARQVjql5kVL3zwCl/8warSlIIX7et7RXz/fZ1uSlUkRyzzeesMfHJZztvOGS3fSqQoOsTElyzC6GxxXbQF+9Zcu80AG+Hv/Kiw7ue7KlrIkWeM1/Bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787144014; c=relaxed/simple;
	bh=IvgrZJ8sAzvQ0Au3XWQhd4qgea8mcKU51+s+Ti1Pcl8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jiTMGluL5wPJn3/k2DJngHmX3h0rLJkQXC2moso/icI0yOsmqyKgec1kwkzHT59tyoiGnMxJKTlC1JCVDKwrLzt3xK6/fuqTNA7iFMMkXOoAKn+Vqyvfg6BSw3x6fdKFd8YT4K84GyIBObefvvGX1J9brpaYrUIE9YR8FPyI3eU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bkl1wGRc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WxCCHo4T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bkl1wGRc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WxCCHo4T"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JClBxx4016035
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 12:53:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h7zsfNcwOncPDcVbix5NwmBDOH4msPcXxm7UEKgyAQQ=; b=Bkl1wGRcSetWbtFP
	RRckJeJg+OVX7t5SSIHN3WQPTA8Gui/TTnjqIt2eAltdA+SjiYdxdua2AMNJ51uM
	pBjsjtkOWqKziltd52jjp+KRJY/uLeegXBjmbd0PdRoOdwYqaxeb5z0oRRbAd/++
	1/jGltwb3r+VS6iPPdv/Yf8ovaXcpSlYcg6hM2VtJhCjJElp2xrTUnx1EMl9FkSb
	AsT24Uvnqb4RW+vPj2mm+x2WYW6SH/qfDpfJJX4fZv0SI7e2mWfLe8PxjRBW+MfR
	aKKKGTcYOLwZwLYQzil8FSbe1VKzi4gsRQcXL18akpKN1HKEw4cJ21hHUKBlOc4O
	MHj56Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfkkac4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 12:53:31 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52827090cc5so12336711cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 05:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787144011; x=1787748811; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h7zsfNcwOncPDcVbix5NwmBDOH4msPcXxm7UEKgyAQQ=;
        b=WxCCHo4Tcq191BTV6/BWDlNM8Ikfm3gPoocCUdGUdMnhMTSpwVKSLuH/WDKWUq9K1T
         QJVXlcD/4rvDAowgKTObJmQJJQQA+0YR0Y6bAU6+NoXpE+wZUnVkvc3KiQaM6IN+fHaN
         tVqlodtV2jyHHGKx0WO9aXADgSgKd0jEQcpAHOU9302WOmllbZ4WgKV7Hnw3QcpUAdQD
         CPGxRu2FxlMxPYiHFwpe18vTAjSH1u60+U/lmjFIqzEy1snkflPJHQVgpzfrgCK8M0Hv
         I3BWm+HkmK+BZZQmEczaA252xL0Pg6y9TcD+SSpWHEMrkzodYDZ4XXayd4p/fiI4Od2f
         vz1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787144011; x=1787748811;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h7zsfNcwOncPDcVbix5NwmBDOH4msPcXxm7UEKgyAQQ=;
        b=QQaFq41gaAEX+qJCK2YTusNpkGDZ9I23nFVMUcblvluNYnv4OaIKbodrYv0YU0/rpN
         xC8PEwuoAWBiqA/kZlh8Cyfd2Kpy1+10erz2T2cfVbQg36TMkDDm4Aw5CyTEU+SRkdHO
         YLV1E+x5rhzERzUkQhsFMxUSVuDrhqAUOjuqPB3e3o3le9plgh3HGR+bjL/XkcRTygZz
         5rJFNqwKELqyr34r8HGIs+G42NVJnYYyKqSx9OXAomp0nyV2k/fuiF3sh7/rZJJJoBpz
         6vUKw62w7sbHGRPxsKKL2R2rIJmL2pyIFnN/Po5Ha2MZ1loCgKhxd0ztkPNblpQ1F4gn
         SN9Q==
X-Gm-Message-State: AOJu0YxrmGgU0bEGA3COk9a5g6YcMqF935SYe+2BD/WyxLjKjgTqi/tQ
	/ZvgCWq48z7M5wpj7sXjOjfpb+QVSMGAjou89LWnbBsRyYO2BGcV/U+6qabpCxK1VTmvlH/yz91
	rD8bpRwbtTjy2UMz93Y19dhcWe5NOyIrWY6gf4dCW59uAZMA+zap1MosW+i76vzJ4y1rH
X-Gm-Gg: AR+sD108WSiwh7fb5V7CWsZdsYD3tdoU+YkRcg6JpcPzJUlOzxpIEI2fxjmXChplZ/G
	6e/5cw9v69uQNhGkvYOxg0IMI50QKX1jAeSXXT/bvvzf0WBluFCtrQMRnp+f0SgKmEqGvtgiGF2
	pL1mhEi8b9xLG+fOPel9iQkEOlHIzPa1zkL9FQZkt9xlxhZNnsCEF214svJeEcyZPWd7nq28nz5
	6xA6rPXi+gKAYZcYoPOTjh/ikfASht2scr7qCV8ElYjPf6q5eKWsvzjp6nNKnmrVst/LMEDdbMq
	S3iJTA3WPl6EwhpQ4sflpe8/ISJXacaqQvFPhCTgw5U3P2ZXUENtORJGaKGqlNOzKRnN/MQf2Hs
	u8mwtucJu
X-Received: by 2002:a05:622a:1487:b0:516:35fe:5524 with SMTP id d75a77b69052e-52dd43e1243mr37127921cf.5.1787144010470;
        Wed, 19 Aug 2026 05:53:30 -0700 (PDT)
X-Received: by 2002:a05:622a:1487:b0:516:35fe:5524 with SMTP id d75a77b69052e-52dd43e1243mr37127481cf.5.1787144009886;
        Wed, 19 Aug 2026 05:53:29 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa0d6721sm77954795e9.11.2026.08.19.05.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 05:53:28 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 15:51:52 +0300
Subject: [PATCH 07/16] clk: qcom: gcc-kaanapali: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260819-qcom-tie-cx-to-gcc-v1-7-840034124e73@oss.qualcomm.com>
References: <20260819-qcom-tie-cx-to-gcc-v1-0-840034124e73@oss.qualcomm.com>
In-Reply-To: <20260819-qcom-tie-cx-to-gcc-v1-0-840034124e73@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=972;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=IvgrZJ8sAzvQ0Au3XWQhd4qgea8mcKU51+s+Ti1Pcl8=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqhacLI0kkn//xUP8e3HndmLgUoMnD2Cuj5U58v
 Mms0yHSyRiJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoWnCwAKCRAbX0TJAJUV
 ViK4EAC1wqkwa9WsSClSYL5ulyXSOsSegML5RaKoVWZ17uSqee9z8/Q3HfJZ9fuEyeSQZ/wdvpK
 lYIS8n2dfc2GYVBW8rXMpbtQV0sKZsiRLjAubtVGj4SB2HcZs4/yYPMk9MRgFsRQFl02qs2PGMu
 GZtVnDzrbCctbveljGJ/sHHO9Xxv7bBGmhPn2PR1cUxYKwBjp9X6ZHzjEH/UKmjLGGcwdUi1cqE
 Ts0AomjLQj+jKjj8H68Sy1NW/bjlHnYWksQl4U24yqJkwbJ4D0p3MyNCz2/Z5cnJxQjLRvgVVAB
 oI/p1/CZXuEeYbsk+1KyDOe3n1fgDEAyZqqjwzPfXMcotwcraGrye+srm9TQSmZ+CPQhQRWbeBq
 wYRQ2VX0XrWPp8WUsFtx3e9kT+KIYu19eiT0CWWApA5GCHT/dAR+jlhqKrFbM1XskysC+IJxX/+
 Fk+0RBMKZZcT0WWD9Wqs55L5HjjpFQilF7ZSiL96ClUXP7k6yZqah8RvUw7hEu3+LkZ+mkPFDsj
 1Y3iXYGaOL06pgU4AF5e2SWsQoh/FOLyWxIA8NmqdNKfMVdx8zeOJnyOoqzNWozdO9I+62O0xnp
 m8ISycqJEMRa+bzfTHxV3imqz/wfKkGjEkrcnfc1+gN6nJQVnfvXauF58AWiFc8WIoj5HFldK8P
 6osOYhwhjEaFfCA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=NoPhtcdJ c=1 sm=1 tr=0 ts=6a85a74b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=s1Yi9tfhbzEvHx3U_YYA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: a_vF665psCsjUfK4DIKlIpGxQm4013A0
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEwMCBTYWx0ZWRfXw4rFe4zJrz3g
 vf6+aoPdODu2WPYpp9Z6SZtCYOkHqDA6K3LXw1hf9a8Zr+zaxYmNbnyxTBbQ0E+lkr4mqq4xiGD
 E+XB6b/FNV9H2vZHnW9336stT1rqUBg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEwMCBTYWx0ZWRfX13REqcnDQQqK
 aofZvHWovsWcWk3fe68qIA/+kuU/IXdKIkHOv3hHCJ0dTP9DXqwDKEVksSeIuzhEdgoCEkKVV2O
 RAeNWKo8ow4B+9sfHAJDpPhpP8oVzVsKJuSVOvEmTnBLvqaSdP+PsZFM791F7XApOTbLaiAak8R
 0C2VAdOv5vKjG4PxfbotfKfWgQOXmC+Sq/MMIzNP9lN36dzLcoQcNy7Hg6yQzow3JOA8dVMfeh/
 qIQW8SUapeOk8A43NB3DU2nJe6IJIRv0i/0pNJUct8nf4Qjc1IFf0rRj+SVYur8/G5pXEEI8H/f
 n6KmGxYIu3XTuPWJfa2XER+sDNkDKtGBlxFHM19pDP91vq/dq0NuDLXQ/NDrRul9N5RNrUXbLRW
 1aeeoMXdmHShLyGbDFLZ3TmjaoLwTvJULzzFMZuZ1/8Fp01ITAGarAsJIQKT6MjB2feA5CfpQv0
 iZdbEW5fedje0k89ESw==
X-Proofpoint-GUID: a_vF665psCsjUfK4DIKlIpGxQm4013A0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190100

Enable runtime PM for the controller so the common GCC probe path resumes
the attached domain while registering clocks, resets and GDSCs.

This lets GDSC consumers propagate their votes through the GCC provider to
the CX parent domain.

Fixes: d1919c375f21 ("clk: qcom: Add support for Global clock controller on Kaanapali")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-kaanapali.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-kaanapali.c b/drivers/clk/qcom/gcc-kaanapali.c
index 5bcbcd178657..c40d2da1086a 100644
--- a/drivers/clk/qcom/gcc-kaanapali.c
+++ b/drivers/clk/qcom/gcc-kaanapali.c
@@ -3502,6 +3502,7 @@ static const struct qcom_cc_desc gcc_kaanapali_desc = {
 	.num_resets = ARRAY_SIZE(gcc_kaanapali_resets),
 	.gdscs = gcc_kaanapali_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_kaanapali_gdscs),
+	.use_rpm = true,
 	.driver_data = &gcc_kaanapali_driver_data,
 };
 

-- 
2.54.0

