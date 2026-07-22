Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F182F40F733
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 10:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784716324; cv=none; b=swHIFS/HtHy0SbeNd4VeJeUzG9BD9k7c0CrwSnW0wPjTLYaIvZXRCLmfTOxptVYmqPrjLsVLWnx4oDXYkR0fcZCcD48bDWCU7jXL1uKMz+CqVA972ZC4D/VLJ9/38SoaL/n2aSTK6p6A3OfTJo3B8OGnF04cQlrx22Z7yWO0ttA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784716324; c=relaxed/simple;
	bh=MvvpDV9Y6A38BbJrva9Z8EzWUi4fnWaUEGEJuCRfAeA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=G+Cw4N1QUNuhbLoWf57hd5Ur6QBAbNXzE7gas/afQBsxjIy3el3aVRfK+y41F9u0g2F+AhPjSRoM6PwcYeWO+S/j/xgn89cGmifIVLE51ex4Eurg01rYcPWeoIPF3QK9qQD/xScSg8dXXaYI6N6LozUZBP4NctsVL3tOK9qNl+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ey0FBdcJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aIj3QqT1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ey0FBdcJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aIj3QqT1"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M8x529383751
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 10:32:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hZf90k7XF9sKSnq+U3mbap
	X0xPnIxa5yOmPxj9jAkcI=; b=ey0FBdcJcJl+VCb6+qgE2egU/5VQZTjij5ww1X
	najZp+DVPzLFlPSc9dGloD10D5tKhqnuUxMo0qRfSLtZEuE+ZRWn/WLvIqCzoyLi
	hRpZtjCeWM+rpMc8Ka8hp8AIdE5deKHhUMYz3o6VeNTQDPAIuyShaICjx6V4A8F/
	ObbnZ/DxO4MoWac/PXXu8Q8/+MqpRqjUf+wZ9hdE3PSft+T3qVnjNCrQMGpOuScp
	qR+4dd+80NgKKfYtkNnFMnqpjSM9/c/7xKE8hWb5WWekbYY/nLNCW/9PlQKUWMLS
	xypZ3YsjFRum+oQkVyakf9lDqCfziEeuk+ay1z2dh7v+A51Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjs928ubx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 10:32:02 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3823dcc1647so15969319a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 03:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784716321; x=1785321121; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hZf90k7XF9sKSnq+U3mbapX0xPnIxa5yOmPxj9jAkcI=;
        b=aIj3QqT1mAL3uyaBbGE6NBB5lT8HyQkA0NiJb57oNxkZPWYLNW54oFwWMDQIyqMmul
         coVbea87M/N6jYkK6zy1j2NY9lcKDIP5OmBqJ/AKbgwSq0ClbV7F50J8c2GIXwjubNB6
         37RhNLbzY+midDFRA1mFm3DAA30DDKhwXhxtS8fJDBPUZ7XpjUQGELuYnKzV5jn/hHy/
         KmUT7JxbWleHs9c7PHxWm9m4w5oltvMhwzPNRQ8vvENSqLQ1MDnCG3KEbhqEFWIYysD3
         W4PEydcxur987HjOLYEMAnUQVXCp86zHCaold2oF2sHV/TdI+r4kGTHTXZ/RgDZspG0Y
         B4tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784716321; x=1785321121;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hZf90k7XF9sKSnq+U3mbapX0xPnIxa5yOmPxj9jAkcI=;
        b=K5Nc2QGGHMzo23VramsvHxk3EPT0f5zDmG0Tilsc/iQQU8sVP6TB1DyRK9GQ5ihoz2
         bSA1ANGbABcIshNaANgGiq3t0e8+qpvbdL0/1b0k/V1s70B8VT8m7B2ogftb6npw7imC
         6J5x9oC8enlymX8As5WdjUcB81UlJ0YGr67gFWjq2Wd3jCF1ugZzkiBf9DpqB7Y/ow72
         yUUxJMcBZiQAELhWdozBOGvELSPWJ6A07POQ4kPH4PYinqSI9NlpcVfNlCZBwbiRHA8K
         mhDX6diQS4WNPat5dOFIrEPjvM/x8cTgGWcNdKtjjDoBazcuvjSPSssBFGLxO+8IiDKV
         n9Fg==
X-Gm-Message-State: AOJu0Yxm5j5wN4U5KNYwU0fLt+72pzAHu8RwjlBP8fXtfcsSdtLJqSy+
	KtQxagtIc959TmGXC4c9pCXD20cS6304h2zKj2UcUBloz/pD/gUvHaR09ffHvIXdDDClsuvIUzL
	qSSNqisASG9S9DRnsGGUpmoGgJ+r5by8K4KqXh8Bl86ZOzfJEdaWp7dHOnIOnZxL+6B5fpDHkJE
	g=
X-Gm-Gg: AR+sD128XeQgniXRSeBSQAjlLfhePDEe7IgheJtzS1s3FvxJDWLE8RjolTaA/by+W8U
	e8dvmwXX4TldtHUNZ6HQ4H2FEvQAY9eSBH8yOEbwqpILRDx60LNJOozh/3l5WxF4QYDVVEMVAlz
	TifF1hv84zma8U9wsstSGMuuYgLZcQL1jOwA084Vvhe2QFOMw74fYQ2E7gWPaqbCc4SKkX1wu+I
	JuJjVVoQ6skc65ZgPNnG3WZ1EctNe4FscrAN97F6xU4fI8YpxTVNHvtrrQMLYX7IHtJ/NRluvuP
	tOYsdaxF1lPYlZrYbMN69OKDF/cPHLfynwAUlUTZSMCChvJvQ3AtS+tF2l/Q3A68Emron42QgGe
	Mdg3j89Icb62vSSlihsJ8XxRA/B8MbQ==
X-Received: by 2002:a17:90b:58cb:b0:381:5bd6:eb19 with SMTP id 98e67ed59e1d1-38e4b47765dmr22387173a91.18.1784716321566;
        Wed, 22 Jul 2026 03:32:01 -0700 (PDT)
X-Received: by 2002:a17:90b:58cb:b0:381:5bd6:eb19 with SMTP id 98e67ed59e1d1-38e4b47765dmr22387136a91.18.1784716321176;
        Wed, 22 Jul 2026 03:32:01 -0700 (PDT)
Received: from hu-kotarake-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e9399714fsm2814483a91.12.2026.07.22.03.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 03:32:00 -0700 (PDT)
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 16:01:55 +0530
Subject: [PATCH] arm64: dts: qcom: Update spmi-pmic-arb interrupt trigger
 for shikra
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-fix_shikra_spmi_interrupt_trigger_type-v1-1-1f8a13528cd7@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABqcYGoC/yXN0QrCMAyF4VcZubbQFVT0VURKtmVdFGtJsqGMv
 btVL7+L858VlIRJ4dysILSw8jNXtLsG+glzIsdDNQQfDv4Yghv5FXXiu2DU8uDI2UhkLhZNOCW
 SaO9Cru0QB9yPJ/IINVaE6vJ3dLn+rXN3o96+ddi2D8AYkcaKAAAA
X-Change-ID: 20260722-fix_shikra_spmi_interrupt_trigger_type-1baada5f9e0a
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784716317; l=1115;
 i=rakesh.kota@oss.qualcomm.com; s=20250919; h=from:subject:message-id;
 bh=MvvpDV9Y6A38BbJrva9Z8EzWUi4fnWaUEGEJuCRfAeA=;
 b=RRUkG9OTZGj6k9ET0NXYrIAPC72Xz9KTsQ+UiO0xoy96bwWleySwg4KOkY5EOZrmPwYA5pGKL
 uCXsGBNA7IKCn4mcc5SP7PZDs/DBmse5t2+kK49Fqv0tacJVq6Nrv/C
X-Developer-Key: i=rakesh.kota@oss.qualcomm.com; a=ed25519;
 pk=dFhv9yPC8egZglsSLDMls08cOvZKZkG6QQn1a/ofwNU=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEwMSBTYWx0ZWRfX3Dp9SQUQwK21
 c47/VIJGXSzH9UaQesDMFzaNZIeV67CNx3brww+ZLuq+2uHcsoT9xACGkz23m2mQCOEH3ucrFhw
 8+DG+hRh9TcHU2yr979n4S2yHs57C5o=
X-Proofpoint-ORIG-GUID: VPug1hglSpg13BI-hAcUfyQJZoAyg_QC
X-Proofpoint-GUID: VPug1hglSpg13BI-hAcUfyQJZoAyg_QC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEwMSBTYWx0ZWRfX3Kec8IOxngWY
 w8FaC7m4iARcJ/orSUYx8Yl3O7ur4RP1lypOITEJvFuubq+bIJ74c47gHb236addnPwFw/Xxqf4
 YzVGAPCagbcI0dcEVvL2DK5LF4uysFPLqZTzIX7tZkSPOm3gSYwBG/kfdV5NuIWkRcWMGZQfIrN
 IBBdBgt4C88cC7ST8tksN+IgU5Iphnek4yqZMjWOKSPJjv2rCM8D3ZXwwfzS5HNxKKYCsSSj1tq
 qQ00+KH8L7D6KVD3wOzT3hbgzexfbu96Q/ns7xtnnaTGR/N1WTIf7TseS1BvC5CI53WQBUpSGRN
 7h2rZh0j7zVPTn0gRHB9EMR41lFJtI1DUMjxTnZsMDKZtuwNCDLjRNQwREiFFAmpCy7I0ws+oCJ
 AIiKw4Z9uJW+XlMt5b8akOD3bj5PSzFVwRyMUnRzIkQ/havtSivOYPX9V1WIPqpHvQmTBYIQsjR
 mH8lia2caSOwkqRoKew==
X-Authority-Analysis: v=2.4 cv=QahWeMbv c=1 sm=1 tr=0 ts=6a609c22 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=5lLYUMFAHtOtsrg8WBoA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220101

SPMI interrupts are not working after suspend/resume on Shikra.
Update the spmi-pmic-arb top-level interrupt trigger type from
IRQ_TYPE_EDGE_RISING to IRQ_TYPE_LEVEL_HIGH, as recommended by
the hardware design team.

Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 4e5bc9e17c8e..80e8045282d8 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -511,7 +511,7 @@ spmi_bus: spmi@1c40000 {
 				    "obsrvr",
 				    "intr",
 				    "cnfg";
-			interrupts-extended = <&mpm 86 IRQ_TYPE_EDGE_RISING>;
+			interrupts-extended = <&mpm 86 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "periph_irq";
 			interrupt-controller;
 			#interrupt-cells = <4>;

---
base-commit: 290aaf24a551d5a0dce037e3fab30820f9113a10
change-id: 20260722-fix_shikra_spmi_interrupt_trigger_type-1baada5f9e0a

Best regards,
--  
Rakesh Kota <rakesh.kota@oss.qualcomm.com>

