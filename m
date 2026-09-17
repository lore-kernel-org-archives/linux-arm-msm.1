Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88034CA79E
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 11:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789646103; cv=none; b=Mr1PBNN39c7zjslOPLavf8qIe+G0S695BRu6FrDeR0AsWc38G1yo6j3e9kBFxGMUBvSXJWerEEZBIjr89O70mMHjj2oeTYbZ/buhSEOA//Iwy9eI/R9EylOLfO5zez9ropenhEjlk2uL+mz9+xNkXANT+QFbF9rJfc9ikiQM+uU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789646103; c=relaxed/simple;
	bh=PAXRXzls9pWtyh6XbNWJ//2jMSjeYQuXL8j0pgiVR5w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MZNhXjPOFWOVGo/TCA3KGa5ScRBali4OQuK4Q8XRQd/Dukc+lCj9BJX7LEupaHL8igeWXU0UlmTZoJstsK0xVepmgBb60+8mWla2tOEFekkwz++zHKaHiENcud+Xl6iS+RRQ5La3Z2DBcnojSmUZubE6RLw5L/9DrFBL6wCJR9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gOyza4Wu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OWsqYqY1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gOyza4Wu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OWsqYqY1"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZcJY746581
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 11:54:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6RtNUfMgxoXfDzqtvXdPeO8LA/ihdenu1rUXtBUowK4=; b=gOyza4WufWIjVpw9
	wnosMDDlpqxrFEAIL/AI4NtoOUOxGfyTRd1f/HVsEt6phkgQfS43xjURITZ16zNS
	akrqYJjtPr0RauTuVeY1PKrwFdtAvVfBn8d3Z58zZV97rujDwAFRbPFRZibr8FyI
	4wdGcTif8jC9epSkdYB4swOXOt+Cj20/FXVvbhyiIZ/kQpMnI/8vDJ31IWrZOKrL
	7RoBgtRbH3RhSHtxIOXD4wDskggJ0+nnktw3G+eWpnOWHsFaSlwZLHPSb2whcnCO
	k3uzHqZ4gokrhll4EfkyoBsWGwsKLHIUXKoVUZe9eOFN76pMiMmFloH75czblan4
	sUxC3Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grcra8t22-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 11:54:49 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39aee9b4cf2so1606353a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 04:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789646089; x=1790250889; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6RtNUfMgxoXfDzqtvXdPeO8LA/ihdenu1rUXtBUowK4=;
        b=OWsqYqY1nsoxYeIeXEQKJZRe1SXh0wFcVvz1kNvhUajclpT338QDgL3cqHBSsjT4bn
         6lPdGpgH0oA7GClBEhOpOi0vFw18gvCkOkoZS/LYUZax21aW/EJn5gAAghkFc9Ks8wiA
         3RcNhIRpq7nkcsgn1juMnyUvOGv87nWjW7cs7D/mL55+myWr/RJEz+aZi/+uFR2iSups
         7A8qLTM0jcDxPlLXwIj9GEjH4jaI8NaiLog5iy1sZn/ai+W6F6H+NXr5qaOiFDruUdsM
         bpkyaEVyaqRmu69M/YhKusLnCQkVVo6p/AZqGYg2GeIj6zcmf6mrdMIUjI9W3d6AhtSB
         NoXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789646089; x=1790250889;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6RtNUfMgxoXfDzqtvXdPeO8LA/ihdenu1rUXtBUowK4=;
        b=L8T2cFX5y+jYTLFCF6u4VdOV8xVRffvfSUWqF/OD700KC1mxJOvKLit2TIKXq9nNCS
         yCqCe5lW8LRfZ5BiBZ8qABFsgIDzybw58tHPI9OQDHM8A6tZsoWizn4dV36oG4cq+qBW
         nzILYvSDWRERB1V8/7XfZFKO3HNrUF9B3J+qI9hleBnC2FYytOTZd7ff/XXPICL3LqsM
         w3qyknQ4U7uqJmnvoFI0ZRwV0NiwilhvyWK8j4Ljly5drsoEDtWqCxgbuasL131pmCZQ
         7am/u0WYbgE4907RL6daquKGlOA/IBf0enDqQJt1vB+Su+Su95FPSf6RTo9f/hpxCw6I
         EiqQ==
X-Forwarded-Encrypted: i=1; AKwUvBynWV2Aw7xNjVPt/5vEG48Acx0fWprUsmBNpm4BH4iG6Kv/xt3SYduLHPyJ24yh6bhZB+mlMTz3yun1O5AO@vger.kernel.org
X-Gm-Message-State: AFuF++n6sCJdT7klvm3HGdWUBdN0gPI1tmIkGCVXwuJN4c1VRkO1P34k
	68gEEn9ofcxCYOiIllHPbSi2gUSqzbGZmSYvctY3x8VnFGdrNOKs6oR6XjucxRyySVdku/fIC5w
	L4cH4+iMK0odvQlr976V72+1hnR/lqPjlQ5gxFLMvn3txr+EhZMmXVM/g44AIN1lDKx1a
X-Gm-Gg: AYBFou3MIajwozf+xTOxm3h2MrL1zWS30F4L//Cr8QNldK+E37NCH6lWORtIZi1r3/l
	0Nnb225kDWdzWSW2vFa2kHvgEZglbfxmpSiJgHyRINeXAdX0xQon4J/HRZBJ3E+L328Hj76KJ0X
	ZlSEdfXBot0aOzL2eA9jqvadN2W+KSccsGdOuinWoXTktvWEHyuf+28agNG9xhvMx2mhy/RU5pW
	P2uKa55JaL2i2yg1XjmYuqogchqtaFkSSnYXJvrYy35jzn26dv0sHb4fvM2JY+LIdKpsMNA8c61
	zArtNSu0xR6Yj02NCc4+lz/yHf8W4PFMyc4h/QWaMIvisCnit+wr16f7iKbvhXSf0sLVo+CZaDO
	MhpEWq6Hh470WbGvUxop1Mf9XftHJ70nsUQ==
X-Received: by 2002:a17:90b:1a8f:b0:39b:61f1:8032 with SMTP id 98e67ed59e1d1-39e1e42497cmr14246398a91.16.1789646088696;
        Thu, 17 Sep 2026 04:54:48 -0700 (PDT)
X-Received: by 2002:a17:90b:1a8f:b0:39b:61f1:8032 with SMTP id 98e67ed59e1d1-39e1e42497cmr14246361a91.16.1789646088282;
        Thu, 17 Sep 2026 04:54:48 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf596e1f6sm18249500eec.1.2026.09.17.04.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 04:54:47 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:24:11 +0530
Subject: [PATCH v2 03/18] arm64: dts: qcom: sdm845: Fix PCIe WAKE# GPIO
 polarity
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-root_port-v2-3-0d627d0856d5@oss.qualcomm.com>
References: <20260917-root_port-v2-0-0d627d0856d5@oss.qualcomm.com>
In-Reply-To: <20260917-root_port-v2-0-0d627d0856d5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
        mani@kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789646072; l=970;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=PAXRXzls9pWtyh6XbNWJ//2jMSjeYQuXL8j0pgiVR5w=;
 b=d9oaK7UuoXWrqG3D8odo6LNc9cIGMxSw/aNGvWKzf8Jt4scyKMJ5ceFXvnhD0bnezYlYWTn7z
 1E/SkOVYraECQqsqSke3I/IAhJ/JOKG0scVSinHfiMbGDV5EsT/ydBZ
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE2NiBTYWx0ZWRfXwDSqmm2ZkRPH
 JBM6aRlsKz8KBsj7ZY3Z1H3HyE6COf8TWdw6ECAP5fkhiLjX6eNvVKfxYkHp6eKna+quRPZMegX
 A8D2dlxw425qptHDUFKZNTMrhE2AzsQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE2NiBTYWx0ZWRfX7VNUhVwlQZY7
 n4CzfBDz5USnemjP4quWnTXGKceb4e4+8lsKnblPp0btLLuMU14L+eeg/gQMEQ6KbpMsov1unR5
 mBCjeITwa51/RZvLUvU1uD9uKJp0sTP26B22UJovMnhkfH5Miac7v/R8MfTYdtU9L6vJ5bXodiB
 vAfbdgy4TvSWFblWJXD2tXMEIby8zdv6CPehzY2wiaSTMH0WnZI5LQOvxr/o62W829vszuNyO/Y
 2z1lWwlbiD73GqIzReKbFrMMUYwkB49X8er9lJYmOkWSJqLK2wZzlninoxHQheD4ajNjuM81O1K
 BUpFZIgqzGbkIJDiZIcj7w3Vq0aQw46GhBxzuxiYxJa3vSN0256bB3s9f0X84k2JblTTscWjS+9
 hIY675GRCClxFrYzPcFtIyAG8m9ODSh68khyNcYs+oacZHLw2DLL6kV87JAcITKDOR6fffmfR69
 l5WEbAw2O6sQB6lo2fA==
X-Authority-Analysis: v=2.4 cv=WL/qzXsR c=1 sm=1 tr=0 ts=6aabd509 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=bu6UjZ7a5GH_BZZocUYA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: _XHyCQeUkLWNctBaJn8CjbeMmzqC73i0
X-Proofpoint-ORIG-GUID: _XHyCQeUkLWNctBaJn8CjbeMmzqC73i0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 phishscore=0 priorityscore=1501 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170166

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index 846138149b2c..3e636926231d 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -619,7 +619,7 @@ &mss_pil {
 &pcie0 {
 	status = "okay";
 	perst-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 134 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 134 GPIO_ACTIVE_LOW>;
 
 	vddpe-3v3-supply = <&pcie0_3p3v_dual>;
 

-- 
2.34.1

