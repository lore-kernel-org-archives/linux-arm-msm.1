Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC3B3955EA
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789369290; cv=none; b=VspP9FMn/LhuuXnEnUe++5KuiTPYC79Yx5+bXCVR1RQfh8wL0/Jll/jLH7j1OesA9J7vv4UHLI5Kn8+MfseDwMPvWnFCOUoaR/EPpJeQuzZJ7EcYUsKcX1pCHrl3wu9cUHbE/jNf+C7FqcnBKEFMSKF+JlqCUGKURr7u0GuaQVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789369290; c=relaxed/simple;
	bh=OWFye6SIF+UnzHlpj/NXxpFD9oJT6W2y+uiXFKJFwuk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JVsY6f4A0/ug36LKjb6jp3qn7P0aUXRRyniFVyXTKR721Ln8ND1SutwyZ5KPRepTB6kRaW4Dq7iI9Tj+jWGAZDowoatr6u/V8/SdAS1TalvUPh4XeKWEmW+LGzf5rv60U2TgQGhRaDGySQr+ifPdKaFWO+DpPPg0CXfe5grZeag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j0qVs0Cj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YbqpJDdf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j0qVs0Cj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YbqpJDdf"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5jAZu543533
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:01:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jWm9FpdxhsiSeiVC9YPwc5/oMB/0t7X6Bgxd//+LRoY=; b=j0qVs0Cjf4aGmZbn
	vsdBtVdWy0K520OiGIuqkdvBZSeC+RIU9MSrg0b9rbXONTw3qUXjWb266NitMa62
	ctHJZ51Kx9CJjv+Savjvg6AnPUHSg0PrS39ewt5E+ijQB8E9458s9SYthGoYIrOe
	YTyDMLGcozjAqkcHJtpgTMfFi5n4AzXKbKMfYEpZkeT8KwR5M1S/ZtWXLwZ527GC
	Qm6P4+oixxkIhgY/FcvbYtofoKerGkivxg9CJRhSFomPMfGMpAwP3hqunh+JFd6l
	yBZMPP5fkMVc0jTKOKgkSyXH50DzuU87QKfQYK3pEP7+unrxWdv4kzk6cn6NC9Hd
	yna2SQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3k098s5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:01:28 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-ca8aee88725so4477295a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 00:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789369288; x=1789974088; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jWm9FpdxhsiSeiVC9YPwc5/oMB/0t7X6Bgxd//+LRoY=;
        b=YbqpJDdfysoFPqYyYGnAp7AZjXs6uNHc/Rw4hFeAMlmPlO7pFU7nXzQ30AokJcA0wl
         b59d0/jpntH15eoHtILR8d4B745Cd/HDtkwu8OWZBiXG0b8sMEg/g+OzDMC1m6nyAYhZ
         lHvx8jVB7M4eii07sygq1JMfIrDwlBus9JTQh31F8CcSdkBsyHGnT2xuG4qiWRP4TWzZ
         RF1BAm+J4Yi61//GLALf6MzSSHl5c4GR27IIJiPisGWdZsIvteindItqRJgOhBVFlWjf
         AqOgoZAQyNfR/idrByASFN6wN6bzOCnEe5OjIw6vIDp1GDJYA/WzsRNZ28dx2Ie/3eSc
         hsOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789369288; x=1789974088;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jWm9FpdxhsiSeiVC9YPwc5/oMB/0t7X6Bgxd//+LRoY=;
        b=tA+6/OV6MnEder4aXwRlJDDYGmZfLtPezBOJwwpsyZg39tTyuTZOgxWN+gPVHJuR19
         UpGvT+e0P/NUd6nOanhigxSD/3d+iaGcQC0rq7tHdSmPOUEhx6VmyVHkYWwkMUpryUgk
         Rc5KHajM+7pI5MViXm5G+fHjSbHXeE5gzQfdUSP5ZT1yNLr2pHsagVP/KBT8eRneuagl
         4Z2pS049ebINfJLyQl+URdFq/cYfteS9KmPxiRv40jX5p/a/9T/D0c33Y17U+pi+p4Np
         P6IRTzuC3ulmWsC2tvv+6TOOokXGiXXBnHz25RN6h6oRzc+4G4HaOo04aB8ARotWIeXJ
         WKcQ==
X-Gm-Message-State: AFuF++lQ9t9jNGOSHO/XYxRaqgxt5TdUN7/FOzoiMXjR8BjQdxpdeg1S
	uXCzksP9PRDkQpYGwpS19ojRy2RIvszWzGfC3Sb1tHwZTXA+H9FurGjEJ2Keun9bx5Dx0lzc2zK
	0wUM89R/e2lHC8KQDsDWQcyz4fTs7bWEwT7K3iEhabS1By5ihw+A7vwRRClgcXZcXiyAj
X-Gm-Gg: AYBFou1ew4tNGaJ+mnI6lfQD+Cxk1uczJzrhfnDCTUBK2VKqgwIswc1Gq6f5MVLBnBf
	vKWml7Q67bihVTfZNfOYYD+HOC3RnH9ar9t7cR8pD1kw92GZgmN3Ym0Gm+eWE0qtKzUWgpWLzUY
	b2VLkrz6UfxPXo6S6NMgGlnrUFONPMAbg2E/Iwn5ZkYPouqEpJtT9aGGGEZItwmwlQhlLyKubaG
	u1EGtD1A3kVIlg0WV5H6Xc94axRi2ZXO0MDFvaYYnCBZBIjT0HNii6E9iCpypG7kFthJYCEdTdh
	wp+pzznLlUPiVVpTsztmSQEUKpNJFJUM+DaRjNtP33QCDi2/522vX8FAsEjQxgjSfz7NqcpCgn9
	+GZ7CLWxntgdKokTW7a5ShqG6nnxZ
X-Received: by 2002:a17:903:3805:b0:2d0:cc92:f7a3 with SMTP id d9443c01a7336-2dd6c5bfba0mr28468415ad.2.1789369288255;
        Mon, 14 Sep 2026 00:01:28 -0700 (PDT)
X-Received: by 2002:a17:903:3805:b0:2d0:cc92:f7a3 with SMTP id d9443c01a7336-2dd6c5bfba0mr28467285ad.2.1789369287726;
        Mon, 14 Sep 2026 00:01:27 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f55735sm25962177eec.24.2026.09.14.00.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:01:27 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 12:29:52 +0530
Subject: [PATCH 20/31] arm64: dts: qcom: agatti: Add domain idle state
 names
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-b4-idle-state-name-v1-20-660c31187819@oss.qualcomm.com>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789369181; l=807;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=OWFye6SIF+UnzHlpj/NXxpFD9oJT6W2y+uiXFKJFwuk=;
 b=BOarSMTg6QUkU349Yjl+X1Y3q5uv/2wneJx9e8bqYEs+glbAHqcuxRu8FAf5DArXz58skz9TJ
 BoxiT+jvzUsDnF96I/MX3ewKud6PMVLftLp8faH8iDzk031L4y+6nD8
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfXwwp0Z7oVeya3
 CwO7OBkPp+izYJIkZwXgMAuxVwl50hByTkucvJlCHNbv288IBwJqHHbO5rPVuYpv1hVoLB9k8Ez
 5ANiS3jJnPJECUICOcIZTeCSxoIX+Lc=
X-Proofpoint-GUID: 6FOMCqGbCEoJ0vay9QJhkvCVHvRSZTw_
X-Proofpoint-ORIG-GUID: 6FOMCqGbCEoJ0vay9QJhkvCVHvRSZTw_
X-Authority-Analysis: v=2.4 cv=BtAIUoX5 c=1 sm=1 tr=0 ts=6aa79bc8 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=rGjSKMGomevJ4fbcliYA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfX8tRbznHKP9+F
 02e950DY0nhFxGt1VWm5Q5qF08/ifKj/RQCJNizM4EAui0Ytfn8h9cEAMmiZi109a5ncJ+DYQxC
 glILzF7i6xpYGMCc5tj3A8QqUi0uxdlSYNok0i+ruzbrbdjTRYkChKz759mLRcsLPkwl4rKI04I
 2P8ATAtGv3bnhU051oyKrz9iCzrHxK8WB4bqD7/oETrAMUM43HpjPJ6SjvrL1noaWDNOEcdeaTT
 6Kdc1otdUblo9gdeh/fdZzwpLX5OmmrpVAlxlwmFEXqgQP/SEzlSgdSwjBQ3Lu7LJczDSkzwLJk
 Ozl4LKYNgXE9W7vse53HQ8ecS8mjbbUcpDesF94ncNkx6hHqIevS8fatSc2Yn3tIyIUnHWkfCal
 V+USN937dOD10QwiYOu5hpfwLQ5yH6ZIT7KlcvqBP6xzxyTHRVSVx91pDKnziV0diNdXuDKCxg+
 J+htI1ME7vKHckKMizw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140098

Add the idle-state-name property for the domain idle state so low power
modes are described consistently and its name is printed in pmdomain
debugfs.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/agatti.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
index e7fed60a59d9..c226ef4aeed7 100644
--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -130,6 +130,7 @@ core3 {
 		domain-idle-states {
 			cluster_sleep: cluster-sleep-0 {
 				compatible = "domain-idle-state";
+				idle-state-name = "l2-pc";
 				arm,psci-suspend-param = <0x41000043>;
 				entry-latency-us = <800>;
 				exit-latency-us = <2118>;

-- 
2.43.0

