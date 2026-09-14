Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC093EA977
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789369328; cv=none; b=dbfWNugFhzsD+UznAI79CzjtkScnOGd4JDSf4cx6wwCjJMn/rA3de/VqUrSX9PK08MJA/r2mCQX/wwDNVfCKH3nPpB45Blrf0e0FnM2fkzTtgdYERDiy0h9ZYReVXBDmDylzMExUv00yfqABlh8QFGiVfb3YtycMwp3sdny8C/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789369328; c=relaxed/simple;
	bh=7NIhEcx7ODWT/lfx4MtyRvEtHjxqBR7eV1TzixGc+4M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YfFsu39y9sPIZMQwg8EYwks/IK0n79W9Qd6sR4Ql8BIEFbCZ5E+EhTcJ8v/Mgy2yPflsmiG997BYbfTp0zRjP86BS5YXnGrQjN72Ihyhj7eXJBjee6NmwPKe0xred5yBN4pIEnBoVQPpAkYIETy6JBpsJHOabrn7tEcNwjv0x+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dIuRRwix; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JsziwBvp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dIuRRwix";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JsziwBvp"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5j2Wm543393
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:02:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dHbCaLAU+iQT7D9la1CQH9F2SIDHGPGtVRirtSFtv/o=; b=dIuRRwixVoE7UPV/
	v0RTVZbZJe5kXZuzGKQm2lOAgq13c5eKimNOUAMDOF8Xe+73MIN3L13cRbwHe5wv
	PZbPC9jiydc0QmnssWJDiVgzViQJOQQFqgqdqx3Kq4+T/QP0eqgJ/wlm2IU3L2Wo
	YohHVHWoCHDfbezGWEAIAIw7GBbNdx8bBfrpCMGmVwFZ0ewPE5d3dLxP0ksxBfHb
	AXQNNvf/gRyzylLDOryYTtBxlIt5YJAKE0SxsieKOF2cjwXRps+X17yuQi1G8sOs
	KwQim2e4MKpnQoa6L9CoUZMrZV/Ydd8YJbeQclAZlnU3+3UZ/HkIZzipMvUU+5yq
	e1VgnQ==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3k098uv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:02:05 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6c27804563dso2484725eaf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 00:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789369325; x=1789974125; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dHbCaLAU+iQT7D9la1CQH9F2SIDHGPGtVRirtSFtv/o=;
        b=JsziwBvpIhy4I0dEb9m7URvT4WKHoP2kFBnldR0QOSVJ9awC3LfDpnI0cUFuoRmqnW
         2viiYMqiGlaYZ+jeQnY6oRxsjjqrBOCAUb8g5eJrdISzxpkuMWio5+M4frC/eQWECBw4
         X3VYg22TeP2elkJUjkX3b2lQygdSbvzAPpj7kXxlqZF8Mucm1DIZeHXYXDx96zLzwJTK
         hRNjvKIjcB7MSHZOn22x78xb9WDjQHCkFUR9XOMVPWNIVvb0480HDAX3YkhS2wd0B947
         tFsZs6OCdt6V1HE4rZHidK5bbaJCHB7GZ0FoE6b5tHi/+5ta+DIyfTDF1CrBZTGW2VgC
         BpHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789369325; x=1789974125;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dHbCaLAU+iQT7D9la1CQH9F2SIDHGPGtVRirtSFtv/o=;
        b=Gu9nmvelcvN2oHAbKPqaUs9S8GP82HpEMcRv7I5XBlnO3Yfb1jVKu5KM4A1IRtltKH
         KkYr2wzmf5Pp/iiZF2Q6i9ytxwosXgUktM8atpj+T4UxJ3PwheYzJTrfrt2guGxmTvbQ
         0izMPpxEg2H68CYX3Y3vbc9qnYtA0LYwVXBGjNgIR/Twyx+7jQTRPQxDsOQ+q45Hyurz
         deG+4EIyrQKuJVGqOfnM8R5scPp6HYfmZ03IWKpcVBPiHFcIgejchlcoV4tXI0rB4kmC
         9x4oTz7NxXtzX0u17KP+nWsBmjXdL6gph8cfmHHTbDtrS2VGa54Fw8JWr3gOlkSJf8td
         hvSg==
X-Gm-Message-State: AFuF++l8ihWruK3EDWuIkoLSUfWZU9CRTtzBE0XRoeJ42askiz/ajpYf
	4m9TIQP35DwTAe/fxo8SRa5KGsPbIDGlGSJolRR1/2fhJU2xZsI/cuYsVTNLmvlr6Ed22rbtYEF
	QqyOeksigCyEpyY37SOSxrl1Vd9YdvdZsR9vYVN+EiDSarDpWeqcK3HpAshD2xWzbC/tN
X-Gm-Gg: AYBFou1hkYf6W/B+O/wPRQ4GVrA3ifFyN5UtpVs5gM6rTmjjFhw3gDexSPQxq1i+JtO
	A+Pyd1nU56SiCHZnwdQbKvu223PHIguPGCf+XYDp9m6kIR0bAVIaJBw/gBUKI5Gk2E9Hc3pMe6D
	nUO3DPj7AqLEEWiBjIyL8y/wxHdqbsDEq/SMwevsEVaq6b6H4z1ADxSOmlzn8tbtFWlnvMrpyLI
	aGLRDEwqZd9lx9hsIEhBMM1y6aB40pBRtrFsZ/GOWYzQtU8wGJEw9SIik8KIlA6AickLdRU+huA
	LpARE59TCnPMrzcoY8n8DVuvDlvW9SbgZuXP0KDWysT1xJlCkJ1huxqzUSj8stPjM7X+H2DG8r1
	+qZnR8aZw7FkitYzkzgDPSdfy1CpS
X-Received: by 2002:a05:6820:20a:b0:6bd:c88c:982d with SMTP id 006d021491bc7-6c53fe8437emr528792eaf.24.1789369324097;
        Mon, 14 Sep 2026 00:02:04 -0700 (PDT)
X-Received: by 2002:a05:6820:20a:b0:6bd:c88c:982d with SMTP id 006d021491bc7-6c53fe8437emr528751eaf.24.1789369323647;
        Mon, 14 Sep 2026 00:02:03 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f55735sm25962177eec.24.2026.09.14.00.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:02:03 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 12:29:59 +0530
Subject: [PATCH 27/31] arm64: dts: qcom: sc8280xp: Add domain idle state
 names
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-b4-idle-state-name-v1-27-660c31187819@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789369181; l=1612;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=7NIhEcx7ODWT/lfx4MtyRvEtHjxqBR7eV1TzixGc+4M=;
 b=IagOhcj8ZK4TwxhisUO7iLSSMV0YTrXN9zVlNDHjHCtd+lpTYqLpNudxUFmMne3XmQzeefFMN
 eGB81eXhRHyBVR9/hep7CDwJKB/n87Wx03W+DHsLEWJiEeX5YIujG/v
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfX+VXKxr1dU2SQ
 h0D8ze/NSCtEqrcueBtS4SV7Y6VZZg66fTukk3vpuIluDAqPt/NiumWCuo0s66+7ovc3kJpayNz
 7c16/7Wek9QW+GSmC8ejCFU4L+3mwD0=
X-Proofpoint-GUID: 0cpFmyA8Z4IlAKgEcw2rVl_0wi3kuUc7
X-Proofpoint-ORIG-GUID: 0cpFmyA8Z4IlAKgEcw2rVl_0wi3kuUc7
X-Authority-Analysis: v=2.4 cv=BtAIUoX5 c=1 sm=1 tr=0 ts=6aa79bed cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=4Z_S6MpAyjS2sx10nrcA:9 a=QEXdDO2ut3YA:10
 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfX7QcJGSW3sGsv
 o0ONgWpMAU32EVNbPy9KI/RUz/DrqGyvXMqLUHMi10Ss9vIYTQGouyAegcbBL7hEexVYyvlw63f
 7/sSdmX6CswzYWry8Ue7suId0Q7XSbtzn3/flUfXoNoP0K0Cl7IRFyjiCzRmMrDzN15+DpDPEGj
 0Ixq1p0WkU8WlCfKvqUHpv5cMksIA2+HdUCY/IZgfl80KPhLlzd3quyiCENx8JKxCv/g2yO3XmI
 Vk+DCbz4VAXdt+pgIPY2Zox7knQlV6Vf2f7VfXxNaVO39S/tUmfE9/drF8ZqMAqM2STvOUiD2xt
 QO9iIV4gbhe874BdY7lOR8IY3dUZ8z62JYw/c+PbOc+eljIdjf0AKHLjvOoDIMSgRhUcHdardu0
 i9HwMetsO1U4srw6sHmxRUs3CRXrq8L6eqQaNuoMxajJJQVJIp7YmJ/rlL/oeAulrStqfFhz+on
 tID69ri7TRRm3v/HhJw==
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

While at it, update CPU idle state names to match the low power modes
they describe.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 874265f49d8d..b1e48b5ebe88 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -279,7 +279,7 @@ idle-states {
 
 			little_cpu_sleep_0: cpu-sleep-0-0 {
 				compatible = "arm,idle-state";
-				idle-state-name = "little-rail-power-collapse";
+				idle-state-name = "silver-pll-pc";
 				arm,psci-suspend-param = <0x40000004>;
 				entry-latency-us = <355>;
 				exit-latency-us = <909>;
@@ -289,7 +289,7 @@ little_cpu_sleep_0: cpu-sleep-0-0 {
 
 			big_cpu_sleep_0: cpu-sleep-1-0 {
 				compatible = "arm,idle-state";
-				idle-state-name = "big-rail-power-collapse";
+				idle-state-name = "gold-rail-pc";
 				arm,psci-suspend-param = <0x40000004>;
 				entry-latency-us = <241>;
 				exit-latency-us = <1461>;
@@ -301,6 +301,7 @@ big_cpu_sleep_0: cpu-sleep-1-0 {
 		domain-idle-states {
 			cluster_sleep_0: cluster-sleep-0 {
 				compatible = "domain-idle-state";
+				idle-state-name = "llcc-off";
 				arm,psci-suspend-param = <0x4100c344>;
 				entry-latency-us = <3263>;
 				exit-latency-us = <6562>;

-- 
2.43.0

