Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286C348F024
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 13:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789046958; cv=none; b=lDIK1ur664KaV4CWH6N8NscRlaA0/WxnP8MyIvOPOgpi03vGIImgJ5tn35KqeOEces7vZkvmeQlZQ8XgE/iaacIqoIaCraBBoNzNsKYutQHZ3BjTs8mbr7XXtUlz3iu6wUUbT+ilNPfAWihyDQ7QVJADAg4Es0nANEgqWVP11HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789046958; c=relaxed/simple;
	bh=o5+5tvpe0ZPElsvDSlWdf0J/aKPzIjOAQ/3OGEfPAgc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RhsOL2iP3L6MB0HZLvtw+XkaxED7dnwsWU6aZ2edu7HudubEBFWlAAQRFviaBe4Vcr9iAdnOU2WBmpwT84kfev0COQKbxXKZjVB9t0DBGmylPHO1qcuhztlncrt56L0N0RHwjzZKt2R7Pkf3n+hqZ9wYuIOkQbaskVoEBWn2mPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rhh4YQiF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WXgfLlcw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rhh4YQiF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WXgfLlcw"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7jZh1241995
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 13:29:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZC54jYxJJtuuW78KoOpMV5NKoYluv61XVYUBsfKb3t8=; b=Rhh4YQiFEq6MuANe
	hmLJHypZMuWHLSrik2q938NYNvX+8pMpuRK7VcMyf5TWFB3z1kuy/fW6SHoUhXDC
	SqNasbsYSJcO5kAhGe9KcieKxS13HV+ZVYdckoAazIwcn4KtwFtOqsLT8MaemKKA
	hV4f1NQbcChV+dh82Ztfl1iw3izSBe6JqGtixS2tt5rSN/AWmia46+TLoNGI7WAd
	2A2/U6y5PfaHIkKqKJMP1xvpYhaI7e78M6/oJH+tSe5/7PYTD5ikDyEDUJZ37KMJ
	dKbH6yWq0j+b9ZMt4j2K/EjQQL430qTe9vDSdOSMBBriULJAOjHlbAwJK0DxSfJ3
	DZsepg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkrcjsbb0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 13:29:14 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3965ba1ba3eso2916231a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 06:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789046954; x=1789651754; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZC54jYxJJtuuW78KoOpMV5NKoYluv61XVYUBsfKb3t8=;
        b=WXgfLlcwF2F5+4XUpkAawXiISrPCR/PXMN6H+yc0spHMvV+L/puUSnA9RL/jISwQCO
         VqK2jQQs0HvemrRItg1A6iwit73vpo9SgIDN7aLzdP3MoNMIugQE1xcJxSqeE5mYu2wa
         3KPqeLSGgOdXdXEPuZ37C3eYOA8/T/AJbZCJ04xzgReBXo7DwhHT7pwOnZhmXBmXuW69
         5G+LT8DNg0udBs3vS513EG1E77rYwlPCTxQXn3quFMn6iANgUG40BiwRPHc3a44ebIP4
         /m+PgFmdodTCQJhILzUohJ8Zp34Buv501ZN6DqcSsd23UXYQblaf5ccRZU5UAxcrmQst
         lGEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789046954; x=1789651754;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZC54jYxJJtuuW78KoOpMV5NKoYluv61XVYUBsfKb3t8=;
        b=bIMWcpD+lrusw6n7+GdBNPC0hARViE5t8IU8pxoKQcL1zpgqnNQOqg/JlwO9IQKYEa
         k9WGeqzfPB3wUlyODou9U/UUnD0V+yyXCB/ehWFz4rP1FXMwi7qm6WGhUKLGnz/OjzIk
         otf6fQmYlEsFi827qKMfJk2ra2ZVDkDxJPeDu+lG9lEU5G3uJ8ODUozVy9FwvWLGrvbl
         0MO1PnWI0+/iS7w39Fmc6CaHmQsezBgqVfdOFn3C9EOQsvdbSbaX2pXHD1kHvTARdIJT
         omsinEK4WTXER+0jK2vAwjsQCJIV06Y6CGZTSei0hx9YZT/PaXDhbgnvN2d9UV9gYgBp
         CK0w==
X-Forwarded-Encrypted: i=1; AKwUvBwePMub+Oz3kmQ9QrQjhSPu0EzXmopBhxI/2K4omDRknk0lGq6+IEtqZY171IeJ4Wo1A1REb6voZRNMobAo@vger.kernel.org
X-Gm-Message-State: AFuF++lccZcectbXsbQB/gXYWWKUeEjOY3SisSMYX8FHNp3DjP1wyySR
	/XlTuNG+GX8yLOkhyEs9uL0qCLgOyfcQv//yQIxkJgHiGN8BDET8Ub1XbfKf5nriJNkHFWBw1kk
	l1/udLyLXEIANCfL2LvKwUO3fIKXWlF8L5pNQp+s5LsiOTCxI2ankG4xmSa4b2+ilB1Ek
X-Gm-Gg: AYBFou1YATzVcOvfpyXbJbLqjp08e0Q2eI6uqSAgnLPWV6C1cFlcel1Om0OKwY5IQwZ
	K8ppWRXAKjEyA1PO7cXGfHJBcThNNR8RPmSMtpFv0yBUdvT9oATMSo2IPxZTUGtmgP5oOm/4w01
	VX/OwcSplqFefeSBmPHnCwNG2JVc2HdtahJe3izDfKqL8nFS6GaqoYfV9qSMIaz4HRsEqtKfzkY
	173ovSeZoKzFPIFeEt4UsNp7wd1xcz6YXhuiZl5JCZv7er3ch56HWRZLATY7e3C4DPRnH4aV1xn
	1UYtbkE+2TIsI8aDm9jFeihK43v2lDaz2jb8thNjUr2Au8z5FQnqZIzUu5GC/p8zgZGWd9TR4dn
	ZA1aQXvl/XDw8KCqmI8GI2J5GPwfNtzYqAxQ=
X-Received: by 2002:a17:90b:2b48:b0:398:dcf6:d40e with SMTP id 98e67ed59e1d1-39d70bb1bc4mr13342392a91.17.1789046953856;
        Thu, 10 Sep 2026 06:29:13 -0700 (PDT)
X-Received: by 2002:a17:90b:2b48:b0:398:dcf6:d40e with SMTP id 98e67ed59e1d1-39d70bb1bc4mr13342301a91.17.1789046953374;
        Thu, 10 Sep 2026 06:29:13 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-338f7bad290sm21568614eec.14.2026.09.10.06.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:29:13 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 18:58:50 +0530
Subject: [PATCH 01/34] ARM: dts: qcom: sdx55: Fix PCIe wake GPIO polarity
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-root_port-v1-1-90a252ddbbfa@oss.qualcomm.com>
References: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
In-Reply-To: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
        mani@kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789046944; l=966;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=o5+5tvpe0ZPElsvDSlWdf0J/aKPzIjOAQ/3OGEfPAgc=;
 b=4EzGTzN6xtP6B/5K7QQOFFKiTCJMJMMiaGE/wVMBLKuVIXIdrvTjii+VV+Mx25KjDdeTsGJQ5
 qdnJMlmAfSHCKEQ4x319D0vYj3soddUk4vS/LLbdP47lXZrL6DWsyBd
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfX9fDitITEmj2Y
 4qyp0w6ZnORrDZVQaRCXfg0TtWsmMMvyCCDPdARk1ZJgkXVG5qqn6xGqnyMNNK/t8zU4f/01AvV
 ++YYxFkfbvxHdRAb3lhz/5YYAFpyQa0=
X-Proofpoint-GUID: bFRtzjCy7vpj3nj7Klrowt0DusCPt_d4
X-Authority-Analysis: v=2.4 cv=aef0Dhot c=1 sm=1 tr=0 ts=6aa2b0ab cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=bRpLjHfgeuKP4GRv53IA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfX2oq86qrOEWpF
 l8D3OC34+TPKI3pmXaIliTa+WVXV6VNMHHpSCRgYyLT4LuqpUaDcTSF509lLlgwou1rI2nd0KJq
 j45FwZt0FugTiA/dVsZow5+98pLO1pwFQo2YJHbAtAvZWdR2Ha6dv/h4azvgswr3RD465awJ0Ai
 qeDnZw259+QHH3g1jvMrWDG0HnLqF3qekGJXkPKoSC1FxbIL9IFz6z1Zx/3gPvv+b+BH2Rj+lsW
 sNILR0sMATP6q9kkceJ0CIvPZThiyOJb28JzzE/qoYeeQv86WOF1aDijXkEI6qwOgYUaClixHy+
 ZLWXJM9uzhXaFNyVmJwlazeHQzdVNkGvtoe4xmLRuBSipgBqvVnk3gQuPBJcHvB2ukeT/MKCham
 HOuoW6MVpsnBPLiix2610OdZRYdl1vzcgk4/e4rTrt0IYLDYaGeyl6yyVV9bBDUSNJ+hZDTORmA
 UjqRzp8DV6DUhbtaE8g==
X-Proofpoint-ORIG-GUID: bFRtzjCy7vpj3nj7Klrowt0DusCPt_d4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100161

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm/boot/dts/qcom/qcom-sdx55-t55.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-sdx55-t55.dts b/arch/arm/boot/dts/qcom/qcom-sdx55-t55.dts
index d23b8ec08af4..0443a86899a9 100644
--- a/arch/arm/boot/dts/qcom/qcom-sdx55-t55.dts
+++ b/arch/arm/boot/dts/qcom/qcom-sdx55-t55.dts
@@ -249,7 +249,7 @@ &pcie_phy {
 
 &pcie_rc {
 	perst-gpios = <&tlmm 57 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 53 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 53 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie_default>;
 	pinctrl-names = "default";

-- 
2.34.1

