Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7107A4EFFD2
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 08:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792054749; cv=none; b=XJB66xBrM9jilCNZdm3QVct2VzmB9IJimWLTyYrTKE/vqtfN4G5uwkLyVCGS8x9bect6I6HGUNZFSXUNar136sPD9hE1No81FJZjuikR1K3mJHeEyCLv339Eq13rsAxhl0rszXXvrJIM9JcJ+t+GxcEezFiO5nwiW03mxmLTMyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792054749; c=relaxed/simple;
	bh=lcd/P+nruFRhQ358i4WAml/LB0EcL8s1zTEbmnwyMQo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uL+39tfU7f2f0IcRpGZoLfoDtt23g0u39J93+FXq2uayH12K9kQoF3bIu20ZIp2xb/uAwjNRgWqg/ERowBk0awIH3E9ctRjrQq2YqvPM1jFOcCd62e+Q47AmP7VEJ6Gsh2Jaq8XhvtRPx7bvkq2hcvJClNHPV3erI4757qTFgk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IRE9cK4W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y64R4hl/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IRE9cK4W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y64R4hl/"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F6JPxA644571
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 08:59:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nKB3HAwwUoMAANvcjYoiAe4y9aLaTkX2vWSxD+aknP0=; b=IRE9cK4Wt02FYXYN
	TcfC9ibQz4nJfFl5hJbiHxaQR58kdsHtAOmW24zga/73b1y0Qlp42u1KK/AFCrqL
	y4Cblkxh3xj8Wth3I3mZHtrMqwqRQCptPJCtO2YfGtQsgYMWCYFH2nt+vEACAKUH
	8+ua3b10WvCgafGwnJYUvwcQhYuJXMODtMhk7wKOnfGQeoSJBf4tv53LaFHIdpdw
	LIJmLsoMuPwzWV5NrZTaKKM7F/xUsflJua3vYhlCGfAmztU303X3KgDrselI2Hmb
	Ys3cDSmN/oB2AWTloUeNMUR4+HmdQrf2fUWmI1nZGgHtvkBZAJ0zMV3orBIalvIM
	0pFMAA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hajmya4gk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 08:59:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb93c874bso328436085a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 01:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792054744; x=1792659544; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nKB3HAwwUoMAANvcjYoiAe4y9aLaTkX2vWSxD+aknP0=;
        b=Y64R4hl/hH2Ew5EurFAUOF1LgxerXU8L1Ckf3xNQVzGaIF5JpGzVTEzVokfRAM8uGO
         527q/PWTL2LgapEScxtFbtoW3Tju1ve0pyTP7sNVK20hTo+Mz/M+H/jcAU0MRyeMdLeb
         AH+opthzbYd9zIccN4CXPRWkZkpKOeuK7TNOv2wgmpm0C4gPa2pQbPPV/DouU+FfyFWC
         aizOh5c//9NGHSR4TtB4eVxNbHT+QgnHhZVrJeRpw8U0DQ+UHvz+53snm8hAWsSwcbFz
         VKaTK3wLspgR8nFl9uTlrtKqxXIFZXUx0z1wNef7hRX15o0HIB8Y9MAquh9AjToRn1z7
         8V4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792054744; x=1792659544;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nKB3HAwwUoMAANvcjYoiAe4y9aLaTkX2vWSxD+aknP0=;
        b=E2lNYcycJdth3/I8nJtAThPbL9UWRWIM2vp1FY9Eb3IYL8lykdsjNPbDpIWnpENtuP
         Z2Z6i4kmq211LueFePQHjP73O67XSyNRbvG6xLDcr3nbZU4mvgB4NpM+P3+qu/ZEjIz4
         BcGn5kwoDAcXsLssdEEk6Tq3Qtq9VO49VVoI7J7Hpbbti8Ub+Dc+3AsF5+flrfDaAO4W
         ZnnqkQHmiIgTWXtVEo758u4jAPiGlQBsa3lZnFc19cQpMZV/D6fu2Q7BUocWSlqfmhpX
         c8S4UEJNe0qiZIZgTNF6Xv6DFHGejl5h8srU5os5TS9oW3A3WA9r84VZYT0kgNgGJls3
         +U5Q==
X-Gm-Message-State: AFq9FYLtG8sgCfIsJaebLBW/KPpYyl1O9umBZzKjzxZqwrWrZ5NH8p1a
	1/zNfL0Bk2NNrtj0kiT3EMzzz/cAIBKyKftabDp1DCvVFC5ZOnYjRIIUL3RNHvPpWPlfMqtg3y7
	g9C6nh/epRKUQmI6q/w0g2PA9V+9w2BDdqv1CJMWjZPCUOceezH0WOLAHluMLBsdKlqXp
X-Gm-Gg: AYBFou3k8eQ+QBJUVqsMZ3wSzJ9X8yG75XdtfUv0SrBTMxjDemzhguDXPF/Vtof3iCc
	X7TjSEEigPKVFSQHqRWjr0UtJM5uITGNn/r9G0BPs7I5o1D5gvi8Pou4ZYqKJcRQv3JTTSSU6Ja
	4Xhji9mYCocnVBQg48EUAKcnwUW0VtAmLcCnefwEicLqKfIgvg4mOZ9SWp/qxJT1AsG/eql2CBX
	6JxZn/sVY1kTIy56qVp6m0t4SQrCVgONc+zhUm1DrJBD4p8y/acNygyRJ5XvPbQprVsn2c+/1BD
	BGELCKpouF9saYzAvXFJQQcYCW2u6xPh/4KxqdfGvlDWheyGj0DoDYbygGSb5gy7/ZEHv7QWzj7
	7735swphZ/J+7bAMZYONiXqNyVx8gZAyGfM8h9i3UVh9W5kuaS5pkiGPCLEImrF5ZMpj28OKnfX
	1W2hJJSLPHczx9
X-Received: by 2002:a05:620a:2985:b0:93e:c12d:4ec4 with SMTP id af79cd13be357-93ec12d54camr2604347685a.36.1792054744274;
        Thu, 15 Oct 2026 01:59:04 -0700 (PDT)
X-Received: by 2002:a05:620a:2985:b0:93e:c12d:4ec4 with SMTP id af79cd13be357-93ec12d54camr2604345385a.36.1792054743810;
        Thu, 15 Oct 2026 01:59:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be3b51fd1dsm371590e87.58.2026.10.15.01.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 01:59:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 11:58:44 +0300
Subject: [PATCH 7/9] arm64: dts: qcom: sm8150: add MDSS reset
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-sm8150-display-card-v1-7-5c14928cef29@oss.qualcomm.com>
References: <20261015-sm8150-display-card-v1-0-5c14928cef29@oss.qualcomm.com>
In-Reply-To: <20261015-sm8150-display-card-v1-0-5c14928cef29@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
        Kiran Gunda <quic_kgunda@quicinc.com>,
        Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=826;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=lcd/P+nruFRhQ358i4WAml/LB0EcL8s1zTEbmnwyMQo=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ9aFqcd8m07PmdPRa/RC1X/HOQu9S8ms0iXHNl9mkp0aV
 TuvbeX/TkZjFgZGLgZZMUUWn4KWqTGbksM+7JhaDzOIlQlkCgMXpwBMROIE+z+lc+Yq0xUkOnq8
 V6yKXsqvqn6thMfq9NXmSs2CeleXbyv6vzbvUK37H8WaN6NVreJc1ksFT5PFM6b6/jwxVcbtP6O
 X05L43UFO0ReKTrk1f3q3eeuk8nCBzv3G1jqem7O03ZaGtWc83a4gryN1RvQWf5rK3nR/vr4YuQ
 6dI2WPP3tf2CFepi1RL+Ozk63Eme+Z6Kd8af9l2WLhdspLWEpKoybJrytyzT00Q3muo37pNmmhk
 Klvdldw6xgv0l5w+Eux+ox0xYsKPsuXz3B7oakQ2fqTPdr1u4Mxx5kVfRu3WLV1ss6rTl317lfo
 16fG9QncgiYBqfdjsgOS45Q1VMrWsBya1xprvvXf1hYA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: e3ngELRB27GEuyjr3XnvLruQhbXditsc
X-Proofpoint-ORIG-GUID: e3ngELRB27GEuyjr3XnvLruQhbXditsc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzNSBTYWx0ZWRfXwwELFAcpBy/t
 CkVlKfh/K1Qt6hR8ldm1baN4CsKD0mX3SPXHc/VMn4OkcVcrsOJy0v8ECXS+rvqm86v7N4iFJiX
 vLUAU+jPSWchR+aVBceKAdgliaGt224=
X-Authority-Analysis: v=2.4 cv=TbQDJhQh c=1 sm=1 tr=0 ts=6ad095d9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=Bz10KyuN3JYNdhx7gBUA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzNSBTYWx0ZWRfX/6FyEnj0/xM1
 XUZ4uPapvAw/6Qdfk4Q9dNQM1u+5uFpEyjaIwFh781oIVguk7ifAbmf06spY5IDIdRz4w9tc10C
 AvXMO0VjlAhf8IyMcdL8KUBAfl4lPuPPYv0UR+RAnqHvAN9FAPVmu09Vn/uTuAQwP/3VqhdwRph
 fNp1IDDMwxoJSBlBMr0moRIBhK4PIb4IR3nYiD34DdenawP4qPQLOzRhvgeAxDcoOTLB84UTaFN
 0SWp2tIfxYl//x6862DArlXzx8Ot79R3B3c6rgj4iN/N8nA3D5cDirt5roN/KqzjklEwO3/QGWu
 KxFalD4Fni5FITz1NPQLBAYL87ai06+d1HcgCBKZvsS4W+JOoxSoBSlMnL6faJsBHQ7Kh2XroMc
 mbMGWu28KlUo28gY4nGKzgweT/Z3ADYEKqUln1Dd1Bw2t3QgLlQ2oYlzJX8r0PFWQLl6+H2K3hs
 POBiv/1zYddbt7HzIUA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150035

The bootloader can leave the display running, as it does on the SM8150
HDK with the display card attached. Describe the MDSS reset so that the
driver can bring the hardware into a known state before using it.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 293fcbacff34..a2d6e6947c4c 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -3817,6 +3817,7 @@ mdss: display-subsystem@ae00000 {
 
 			iommus = <&apps_smmu 0x800 0x420>;
 
+			resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
 			status = "disabled";
 
 			#address-cells = <2>;

-- 
2.47.3

