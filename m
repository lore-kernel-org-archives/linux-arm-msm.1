Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D77349362C
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 12:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788782652; cv=none; b=hdsCOdRJ1gv43O10qjZOhdRwXKc4RQLXATTZrdUHQeWoLH3LKln3tlxZ0jVJxoQB+D+jzCk1vNGF3Wnqn34IvEmO6o5aEVR5v7uI2aTnUxgVaMauiDtifXSIr3HzLYVgHVZxVec+FRR7iMsgT4h6nKLtYKcTMsrxUpGqPE+JtQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788782652; c=relaxed/simple;
	bh=LryhUbfCI6kkeuVSJtTA8hln198JB6Pb8SSyu1QSOWQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M0xyGW+lEPz0Sz2WYuG8eupxWYp9L40CFjMJXFKc5YIfdJ3RZBmYbaTgH/g/vJv7JbivPv3b7loDfTePXHD3Bm2Y9306T4PzIxwN58sqb3QPUps892WJs18BjUO0AJ4IMVfb2pbfPkOLM/ZQaqaiCba1cBiG6LMcl0goT03zqmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=beKKEdg6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KDr7qVap; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="beKKEdg6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KDr7qVap"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687An34n3230471
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 12:04:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	82ofEcO83bQPd7jzXkJADlMmqIZYW+XTMWLKfngPHuU=; b=beKKEdg6vwhQqE3T
	7+WIzyyD4sT1MZMEitYBIcphABb0e5kf0yMdCxKwwXkyZUuQ3UAc9hXL03B59XgP
	rirRAMSIjdR4w/SOcYqYgP77tMkQBJQ0G7SkX/8aVSJ9mHk8p91xd4uyVYu+gLyS
	5wZv8SHqm2EsjZvH/iMVZGl/lPeWRSjDGQ6owi4TdVXg0l4ov/3CtMAGpYle6vdx
	EN3YQpzTkAfX5XJZHs0Y1WYZQzNOVvzQ1d2s4wyifx+qWq1CHEuvVKbjo8szUoT5
	6hMhLM7UibE0w02lP0HPLtAUniqsQIATjiJCHjNikG3PwlyzoPj1WZqilG9xnHY3
	jEzIjg==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghfxktk80-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 12:04:09 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4b388f7989fso2376122b6e.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 05:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788782649; x=1789387449; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=82ofEcO83bQPd7jzXkJADlMmqIZYW+XTMWLKfngPHuU=;
        b=KDr7qVapS07j5kzz6lGsexYxf09zbAF2itfYFJVCWMH7gzfJswG4wgOkWJvOigTUjU
         OtAoWUqy/6C/pKFkc2WWvi9BB5xdif8ceVQ9iqRUkxOJ4oKrnryCdImQMPwfzEQE8Zl/
         /zf+y0hDv5Ym81k1FRvbMyWlLl6Py9zlHHBKmLJC/AGPHdpZohF7/NIti7WPTcdnXYev
         osfDOt/5yWoZKGoO7/TJP3kQmHhhHxSRjs2+TvDWpgroMCc0CsdH8KhzggiPebIn6m3Z
         t3E3zvlwy7UF5cOV/Je/0xR1eDxcwaCM8rbKTOlXpocXwV827v4KzzHNO/C9Er+A2K8q
         3RnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788782649; x=1789387449;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=82ofEcO83bQPd7jzXkJADlMmqIZYW+XTMWLKfngPHuU=;
        b=CsxRLYWbq925pcYGI40Mp/Ph8HOFxjTDM0OuvuLgCFfhlbhBnmif9FOmbUDzaGl/y1
         TM3D148MR7RptxGPwe7dcE6E5XwwPut+BHtQRofAzSsZAwJJSLU9Xi01hPSdMWUQPE4h
         0u/O4DjMKuGLW31UNI9xk0wzX0j1zgDgkFPbHejG9ICGkLC4aXuo6Xy/ay637+9934Ji
         G4GhYpIJHTbu26BbI+/AXu034nnZ2bcOoZNG4eJ+VluSPddGk3avFm6n8bGEUIGgY+B8
         HPcRInUoEeOMzvEQbXfyWVc6Xkvm9RsrDE7Q2pYvRJf9caTIpZgeLf4PHbBeLFYUlqap
         bukw==
X-Forwarded-Encrypted: i=1; AKwUvBx5GQsyBKbACseIZXdad0NICokyO82jCUc6S+r7Ya7R5ZONJhhRG/zw9qzYxFLAs/B+yBC2+IBrlO3QBbGr@vger.kernel.org
X-Gm-Message-State: AFuF++kO43/oUUN2bZPBKYv9gLBfblG6Uc4tyYu6wrcm5bdfj8J4S7f9
	jyVhOxwWTPR5o9AItIT/E8mtwSvGXwpDS7RzgYBM8nvC/FawBLzbggz6/LVZ3XB744Qe7lDyzN+
	WFNxnDTjvueM1pg8FKjZBupGdlOiKkMSAgpEeb+hwWiNSlMAw2ZZ3UcAsiN88R8f755vf
X-Gm-Gg: AYBFou1PqDocf5Ew4szP9487MCvhRxqXdFcMp7lrdHe+DKDvlIA6oYkbskdOo2CmIfq
	CxSDdiEgHu05//FFsB5XDqYRKcu+5XFvjcKBhgUgYZbWBxr9sjLh8rt7h36C0DqMMaLSq/lzgn8
	f8G8UTdUcAD8yerGusf0swGu6aPxqI8tSPaIqc0R4lk2nZ5em4WlQnS1EzBqPq/WKPWJIqgzoA/
	WKIdr1D36dzPYb79EO9Ax/1xchhfyWaSu/sC+vOkvEnxDxGnhYEk19lebSFo3XS0IAFc12KLxxD
	jHoeqobc6xKoZjztstwqkSrAi3UFZSr+ec83udRAYIS47Is7vgwzobIek7wka8klItQs1tAN3An
	GLgyTp/p0oAKF/8hLLOMGi24+Chsrk+/VvA==
X-Received: by 2002:a05:6820:217:b0:6b7:8396:f3d2 with SMTP id 006d021491bc7-6b78396f8a2mr10733587eaf.52.1788782648680;
        Mon, 07 Sep 2026 05:04:08 -0700 (PDT)
X-Received: by 2002:a05:6820:217:b0:6b7:8396:f3d2 with SMTP id 006d021491bc7-6b78396f8a2mr10733525eaf.52.1788782648095;
        Mon, 07 Sep 2026 05:04:08 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-333959d5f69sm26345960eec.0.2026.09.07.05.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 05:04:07 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 17:33:37 +0530
Subject: [PATCH v6 2/2] arm64: dts: qcom: shikra: Correct QCE node
 configuration
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-b4-shikra_crypto_changse-v6-2-0676f61894b3@oss.qualcomm.com>
References: <20260907-b4-shikra_crypto_changse-v6-0-0676f61894b3@oss.qualcomm.com>
In-Reply-To: <20260907-b4-shikra_crypto_changse-v6-0-0676f61894b3@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDEzMyBTYWx0ZWRfX86pN5zcr+Qcy
 rFZ6f/S1rqS6LKsBXShaJZ3cC90IFa3Di9FJlU+zwiAdpKbyTG8Fp1IGCyFU22twOHacZzC7gHb
 FGJSd2R32oEMgebNR345Gw1YpdzlxFrL0Dq3F24E3BHW+BYwl4MZ7ZM3I9hWpw1YTQfC7Yp4F/8
 NQqvLWvG6bXjgwYZI6134aai65dB20rfJ0DKyh4pjWYBaP8A50StrXSpGzzjIAoink9hXncHKCB
 TQntd00+hMR84tMt69Y1W2vU6gL6INJDMPAWZDdrW2sS/kOQ/O77gSXouUXUz4PRGwYrZiBnM8e
 DxVpF7SIDVvhMmReqcIXJGM8b8Ye6zTRu2wTmG9wYbkHDD/cpafj0H++bH7CAC0MfOKAxW1r3+G
 JZsXHZKOGJ9ZeMymxxuxt96ZBstnriE7CAy7JjU1LLwgM+1XBWDx+47ShHM7EefeUFkgdM6Qn5x
 0bEjBkr/ieI1FlJADAA==
X-Proofpoint-GUID: YjzkQjZlPUqC99vmYqX28QF1z1-bSNdl
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDEzMyBTYWx0ZWRfXzjLQOREbPOXm
 kOCNeI2fbi+w9uszeYk3D85nGDoaCjsKnPxA/2AVLis3jwBnmqe2B7sLh4Q7+cE2APeQvPuLHDr
 xroeW6SNnmaGAbWwq5DfxjQVBZgHpXo=
X-Authority-Analysis: v=2.4 cv=daOwG3Xe c=1 sm=1 tr=0 ts=6a9ea839 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Oj_9Y9B9b6gWBUhzqToA:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-ORIG-GUID: YjzkQjZlPUqC99vmYqX28QF1z1-bSNdl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070133

Shikra is derived from Agatti and uses the same QCE integration.
Update the QCE node to match the underlying hardware implementation by
adjusting the fallback compatible and related properties, including
clocks and clock-names.

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index c1f06f692f66..30c7cabc058a 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -1075,10 +1075,12 @@ cryptobam: dma-controller@1b04000 {
 			qcom,controlled-remotely;
 			num-channels = <16>;
 			qcom,num-ees = <4>;
+			clocks = <&rpmcc RPM_SMD_CE1_CLK>;
+			clock-names = "bam_clk";
 		};
 
 		crypto: crypto@1b3a000 {
-			compatible = "qcom,shikra-qce", "qcom,sm8150-qce", "qcom,qce";
+			compatible = "qcom,shikra-qce", "qcom,ipq4019-qce", "qcom,qce";
 			reg = <0x0 0x01b3a000 0x0 0x6000>;
 			dmas = <&cryptobam 4>, <&cryptobam 5>;
 			dma-names = "rx", "tx";
@@ -1089,9 +1091,8 @@ crypto: crypto@1b3a000 {
 				 <&apps_smmu 0x96 0x0011>,
 				 <&apps_smmu 0x98 0x0001>,
 				 <&apps_smmu 0x9f 0x0>;
-			interconnects = <&system_noc MASTER_CRYPTO_CORE0 0
-					 &mc_virt SLAVE_EBI_CH0 0>;
-			interconnect-names = "memory";
+			clocks = <&rpmcc RPM_SMD_CE1_CLK>;
+			clock-names = "core";
 		};
 
 		qfprom: efuse@1b44000 {

-- 
2.34.1

