Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792549883;
	b=XYbA54OEOxtb6/zgzxnpf12bzZ/hzGnH6xwpgSklLIN5uuFdWugqBbQIy3xVv0WJgbxU
	 hUVKByxtiWLJBpmFRkaM8QNNG8Bb7J/+wm6wkpiQh72p7AlmH1ofNWcmS4JxO/l7LAfzi
	 NhrfvGCk+9HiXko2s/7G6npCOXFrhmp41KV2AM3FsHQAv6aklWcsTyoqyDZf72ews+CI/
	 v3GW70SFZruFZyEPesug9AnbvTCClNa4nyc0ZMSAN8PVNPRg8vcM7AGGTcto1HKEGlMHp
	 7VcJAK0kbrdI9Nnjym6Yg9JTVFmCXDW0uag+3gngwEgSI9gc4dPj9DnBOg6iB7VCy7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792549883;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=saQOMBXSCEtK+IXlca1nlW/5mPlZ0IBZFAsLGkEy3l0=;
	b=adIcu6GcXQQH3/vwtToV3N+iwfXccVGtrOQ4iG895qU7j2PteyRslcqRYGImbg19Um7I
	 TOqUJUgCw1c4PAnHHHywc0lhZIb9wzpOmTLTADcaPnFM3q3eFwFgHeQJ/Yx96mcW1a7N+
	 DQILH7EaJjwJ13o1fu3COC9dPJm/wUv9GMULPZencbamKHW5TJ1fdpcNONPp3cQmHub22
	 h5rQ8P/q0QzUwJYDqpZS6UKORnDk2P5WkWBJ3B6P1anLK05ZUuN9Na4GUNPUwcekXogNO
	 HN7Rt3eOhBeEl5OBTI+keqscHU7yF6Bd5WwrFbHQdOtZM5VxA6iVecpt2C+Z71mbw+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MK1kRLoE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="M5Gs/nlP";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A38606A327
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 02:31:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1A38606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MK1kRLoE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M5Gs/nlP
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L2F3tT3256706
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 02:31:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=saQOMBXSCEt
	K+IXlca1nlW/5mPlZ0IBZFAsLGkEy3l0=; b=MK1kRLoEHPf3kVJEjDSlbEodmAi
	EzPFRJk630tWP751H8rJ1wXu+hTqJOH9DirqlK2RW8+Redln8q4oSwRExmFyOY2j
	n3cmnwoZmHuEIGwkytlhxM2l2+sJzNPrd1142VjPZNSe+eaiXDaogtnD7gfNc0dO
	tOfSExYuw7n5uc9Bqwoqhmn4pCLtsFxZdBECVAl8sungyt4gR21LoCJ+I8ZTmGE3
	tDaI4l/nvpcTDh2V0GNyWtx2YLqQpZ0WNAltqfVuTqrzlC/ZJ40VWluqiLHTqdsl
	MyX+9vY52aAK/IrLA9rZmaRi9EELylGyor5uRxQtQOQBwi0Kr0S467s6HLQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9v1kga-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 02:31:21 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-154e9d2d94fso614939c88.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 19:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792549881; x=1793154681; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=saQOMBXSCEtK+IXlca1nlW/5mPlZ0IBZFAsLGkEy3l0=;
        b=M5Gs/nlPH8w6qFraNFRutnbanxyJ572nbGC4Y5d7nxuMthaM/fCf04hy9IUjQOYc9M
         zvedd0zUuz9CsS1Aefv8zTEWmYfgx+bglCElDd2o5ddM/E52Xv+13v2IpgdWNTi2NciS
         tACXLsdnVvzuqu3+ck8kiWNXyzrdyipvXOorKsyatDl3Wy0A3Rx0AAsO5SX5fw85RzOu
         2vwG/OwmLH8grQGbRJoLtF2RlazNLoXQogWlpBPa5Be3FlQmdEh8J1HNd4nzefTzeT+S
         9g4L9UJ7tkK7puXvTJJwepUGMxAA6CNogVybenMUWEeuck/5FHP5hDkfU5xr27DLe+YC
         kzwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792549881; x=1793154681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=saQOMBXSCEtK+IXlca1nlW/5mPlZ0IBZFAsLGkEy3l0=;
        b=J6sYlwdyCV3Z5CMZxIIHhR5ICmydjxm7AqrPuD67RSU5RSCzLARwy6aObvQj7aldtH
         +YBZpf3tene7ERA6hwAvcnPqh5IfEVYKx9IPRrJDJq5Dl4yOHTfHWW6sLjLeq4OOkcCg
         pQoUIx1W0fK3gZHbYV9GpoGnHoHNBoyYiVbLz4QgNbwIvTQ1uuaCgLBA/FwrSmj1eutv
         IVDKF69FURwpYSNP75sFb98nrdsdeGMR4wzHEvIRvits7HTyX8oO6MAXp6aSBINY2+b7
         N1vGDPY8lZLev4mNWTnSj3lkxC7hVRtzEoAJIDhYbAbb4Z1vPYlxXRJWN2rWLSHpdUAl
         ZpbQ==
X-Forwarded-Encrypted: i=1; AKwUvBwN7dE153anm9vmw+8rVVqvi2x0vED7mNNlgHzG6Rob6tK+8NVu7Imvg+1y7YW3fSrzrwZ8Hrub5vPMrc07@vger.kernel.org
X-Gm-Message-State: AFq9FYK6DKCA8VwcINPbidNLvWj5JDZuc0kFhIcotCQBYyjQ4BQ2n1Qh
	5lChl6XKWMlULnNIgC9IaEgYqDleedhLRR/kan8J6u2jdz0X8ND/TbJbPLku9JnbPg+Z62tPfUY
	VworG2MnjHjd04/4VHvXZIdMQoI+klKFaYrZKkMhUETG3XWPOTMgKAupOXgrmYDGkeycK
X-Gm-Gg: AYBFou3lPPuef8iMBtRiSawZEIZt9HK72kxgnwWJjebe25cDCWVpGfF4fImusX+CHve
	I5JtHY0pjQlqYMEzrYv6UH14s4AMyANjDXBm8X/aPBifO04TVVhA4Ix2MqLZLRPmTowZVPHXEQF
	qyZVrJu85YJCj/ZI7nJan0HZ11bdHr4EbHXGJ8esx7+Kvow+RLBhDH8cZd3KwYshne2sPK3qApg
	ej6wtLanYQ9UodtZtedPrE1YNgWlBLr77heQ1GQDibsI6DBx/x6vkkilrJ2op8x1s7dCz6kZOhK
	aGzZiaKeiKL1ujukj5CuGOXkSTTlTX/BO8FD+DY4ss0Y1wXEvZRr288+//G5CIyjqbHI9+ABHlo
	FWAoPnLats651wVRHUCBpROd75ecZInbVBPjiO+9j3ygbjsciZAr9HizywFk=
X-Received: by 2002:a05:7022:4589:b0:141:4a06:ad6f with SMTP id a92af1059eb24-190a465c25bmr1405318c88.8.1792549880396;
        Tue, 20 Oct 2026 19:31:20 -0700 (PDT)
X-Received: by 2002:a05:7022:4589:b0:141:4a06:ad6f with SMTP id a92af1059eb24-190a465c25bmr1405273c88.8.1792549879845;
        Tue, 20 Oct 2026 19:31:19 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903e02901fsm2395108c88.22.2026.10.20.19.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 19:31:19 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>,
        Shuai Zhang <shuai.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH RFC v3 2/5] arm64: dts: qcom: nord-rrd: Enable PCIe controllers and PHY
Date: Wed, 21 Oct 2026 10:29:17 +0800
Message-ID: <20261021022921.2053957-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021022921.2053957-1-shengchao.guo@oss.qualcomm.com>
References: <20261021022921.2053957-1-shengchao.guo@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAwOSBTYWx0ZWRfXwbDG0q/bjtcy
 Y7RB2Kau/udwtmBLmCNVMH+0i4CXURxu+UXA5Qi7jTXhxxxe7k+BJCK+5tgUlwDCTZ/RWJLRJD3
 uV7AhSC9kWBGG36mN2ks55HzhhSh3Po=
X-Proofpoint-ORIG-GUID: VSK-zt2T3pTs6ony_ssOpsRplJeXviw7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAwOSBTYWx0ZWRfX4iyCquTwI9Es
 UrThgeJtQyWjGq6+41BcJYvmxuyQagRLRC1A3+jcTVM/EaM7HrBHG3htZo7qHbvOtsic4n72ex2
 WCirWr0hr2AutKv8FflTghJCyACLRNk75x1L6PcYvoUGuWmvsMVpS1O2Xb/WToiwj2CJvA/Z2CM
 6q5Zu4tQMTBMazX3SMFhXjbRaE2gJOcy6IWcAcVohljUBWSWlWwPvrmH/67J1Qd7uC8yKs5BZyQ
 ztUrk1bia3+X+eaCMwOeRvh7JN2VSfNmlJHcdEUSKf7ugCLfLgccc0yWLMkMOjd7kZoOO/UrTrw
 i850teg6gbnG8C8i/oFYFuyB+/ON4aEVEXvzMARpPUkG10aBRjrdMTSjbJhXdjC7/KRdIZrmNt5
 GwpYJQ/tbNRUZEOfYy7+yqSPibCOgPoq1iAk3HYJeAvroGXwP5sXYw/Vr5SrE5VxKisKF0BZUee
 gOP7fc+GwkKFSwXtI1w==
X-Authority-Analysis: v=2.4 cv=I6zw19gg c=1 sm=1 tr=0 ts=6ad823f9 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=f6-OUQb2phOXiqkgZ7QA:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: VSK-zt2T3pTs6ony_ssOpsRplJeXviw7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210009

From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

The Nord Robotics Reference Design board routes all four PCIe links, so
enable pcie0-pcie3 and the QMP PHY, supply the per-port PHY and PLL
rails, and describe the PERST# and WAKE# lines of each root port.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-rrd.dts | 49 +++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
index 47978df0af92..08e73be5857f 100644
--- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
+++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
@@ -377,6 +377,55 @@ rtc@32 {
 	};
 };
 
+&pcie_phy {
+	vdda-phy-a-supply = <&vreg_l6a_1p2>;
+	vdda-phy-b-supply = <&vreg_l4a_1p2>;
+	vdda-phy-c-supply = <&vreg_l4a_1p2>;
+	vdda-phy-d-supply = <&vreg_l4a_1p2>;
+	vdda-pll-a-supply = <&vreg_l1e_0p9>;
+	vdda-pll-b-supply = <&vreg_l1e_0p9>;
+	vdda-pll-c-supply = <&vreg_l1e_0p9>;
+	vdda-pll-d-supply = <&vreg_l1e_0p9>;
+
+	status = "okay";
+};
+
+&pcie0 {
+	status = "okay";
+};
+
+&pcie0_port0 {
+	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 0 GPIO_ACTIVE_LOW>;
+};
+
+&pcie1 {
+	status = "okay";
+};
+
+&pcie1_port0 {
+	reset-gpios = <&tlmm 5 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
+};
+
+&pcie2 {
+	status = "okay";
+};
+
+&pcie2_port0 {
+	reset-gpios = <&tlmm 8 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
+};
+
+&pcie3 {
+	status = "okay";
+};
+
+&pcie3_port0 {
+	reset-gpios = <&tlmm 11 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 9 GPIO_ACTIVE_LOW>;
+};
+
 &qupv3_0 {
 	firmware-name = "qcom/nord/qupv3fw.elf";
 
-- 
2.43.0

