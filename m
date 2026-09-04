Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90EA33D967F
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Sep 2026 08:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788509809; cv=none; b=Vc3gXyrTjK8q3Vhc5f7XLS6X3pBZjf99CxATr9geVhE1MWuROX4o2XjbErGCrXvoOAZ5lf6THKl6ilOROdTEBK2PY8uZgUP1wnOw/5ejof4tbEa16XZWPWjsdnWillZuKE6Cr9kWlqk1mLF/+PQAOPyGRx2zre4/VzLm/FXVMcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788509809; c=relaxed/simple;
	bh=TPZ2UeL9Yr3m3dbS1QU3Mf+DPrHdAp2KCtxoGMEFR0k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UHRLZmior4CCYah78sDZMKNdVK0WPuIYNoauk3fvU26Y7AS20qC0Ho38cFTP1PgrC9715zK6yBSkmg0jykTbXeyNAz2sUixpfGFO//MjPjhm4oRJMCdPjFGRTibKsfKcV/gjpJ5hfZXnYKPTNXy+MooVqEVUd7sDjr5irbWK69o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K6PpkZVE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bWrjTTeD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K6PpkZVE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bWrjTTeD"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6847ml6h1770402
	for <linux-arm-msm@vger.kernel.org>; Fri, 4 Sep 2026 08:16:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fXbYoRmgPzS
	A4gebf4xnIvSIMQ4UDRbdcKU6SjfVKsw=; b=K6PpkZVEeaPQoGj4nPuhqS1Wj2t
	Wsaq0ZQoT+8y3yRond7ARPSv3jrlHIsUmr8sxA+zTZZOyG4bnSfkI/snZzIf3CAf
	a9tl8HNfwbdSAzB4yEoYnIqJUBuonCqlVWU7Q7BSlz5vZu6nIqNqCS585ICwTBzy
	eOPs+Y6+SoaKjAq0DxCvCFWwnVGRo9hAoRN+6UJJ0SwLSbGJocg+vuAdYKsPCwek
	efYs0noPUzb5YXS9ouPDku0e695h3C6I99/Gunn7BzoSRcupZn2Lwkz5aZkUEyBx
	xWWdA4NvF1SGZBRgvkxOO6DytyBPDsw/u0vTivR3PfnNs5QOPEyA7sAFtIA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfpmqrsdp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 08:16:46 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-398e1fafe17so1159409a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 01:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788509806; x=1789114606; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fXbYoRmgPzSA4gebf4xnIvSIMQ4UDRbdcKU6SjfVKsw=;
        b=bWrjTTeDad7PmeZOoGlZVkqPv7BXF4FVkr6KcdeZuppI0OwWlGR0W7nSORqnl97kp4
         GZBIxXBiQMRoVl9PwSvXpFZtZPPjqh+oYU6kLxvx/xjjwQ8qILCL1dgoQXvwONCJ7yhB
         JrmGuRyGEt9u3X+5oGrCWI/Gh/OkLIRi0WtUjc1JaYMWMJIH1wyl90XMmmQhKudMbLtW
         /nwWxJrXi6/DT2gLerftb8RGkd6entMFzkGDM2kurAyqjloRRDB5THJ9rS7KO4PDYgrb
         sJeBGUUNXI0UVgnPwsNxlx9QUkJUKZ+3wE1z0RBRMIiv4AIkHDIARzEcVJr+wOh7R/BX
         K93g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788509806; x=1789114606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fXbYoRmgPzSA4gebf4xnIvSIMQ4UDRbdcKU6SjfVKsw=;
        b=IjK++ZjrdeSd9oNJjoD+dpgksqbc4YNzcOiiidmD+7lzAUplG7nfUlTcgHvC8hjexJ
         RvU2oIkAEEIZt3tIUjL2TCP9vRz6mqIeT3jn1MXj9tnD5eHNzHKynJ7E/HOjZ2FeaUaM
         aAIXJGmLUIFD9g2MCMQGjqooRDG55llfL6KZzgmvhXPRTtkCq0nj7+lRJFoGiQOC4+im
         gZMIy6lr2giG1iYOwZTj3apcq+oyCeeGpnOL+6TIcb3+NI8fdMQXrED5MP1pJYUPbweV
         05Dg4bcUbcxTBs0+QglcH7NHdPJQXfNbGXhjg+s4Dt8VopImlb9BEi+aoNJBERlfx4SC
         oX1w==
X-Forwarded-Encrypted: i=1; AKwUvBwKfqxiVRKnlVCXMsZtzn+L9Ll/oFjLKHKmPVevykhQiUdXAK0njzx1NdcHtnT9FjC7Q3k8SA8e0wyPKmQQ@vger.kernel.org
X-Gm-Message-State: AFuF++mi3UjpN923r5oPxwE4EkfkdZk/0u6OiNFlmGYk3OM1WcdfqDcr
	LPKvI/umGvAi9sDYtVbGSVv85nZYbh5+D9lKb9ba+uRQo0QmGGc99TWIFcWG/ilsYiCxXpax21L
	JcIJeNGis1uc/ISLs6w3M7QgsnHkrVw218VakxLfGoXRfJaNRUKbaRgQfA6OIAnOX9r/Q
X-Gm-Gg: AYBFou17Wph4kEqcE2PGwB/W4RHSfgH3P5urlM1PxQc+Yf3Nigz2qpf9j77QeCdiwL7
	Jm1FqtwzbOa81FEK2bcxSrHfuKGdS68G6a01wHilbWYekuqpBuy2i7FhKHT0TEe2RMLUMCa8ERe
	oiZC555djHiyY+hLvF3z5GaDgot2IjrRk9XQOWKYtrqa3zLe+Tygqur1OyeIF0EsHAGS+VPa7IN
	77Xhwj5as0Tzl8sThBewJWw7/8uS+3rLCt5iDd18DwBXBrVRjlqVICw+ZFT+FLKMPmNkfy2Me4G
	WFTRBSsWGlDtwapXhlCPr5wxjmt3gJgv5V+OoRZpnMHsgVEauIP2COGxRdVMioY29h6Boh12Gal
	Q9dY4UwqG0ERR++TNWKCdnrvMOE2XDOE1HpNNPUZo/rSVtBJJErYGdwDpakFu
X-Received: by 2002:a17:90b:54c3:b0:398:d6e8:f84e with SMTP id 98e67ed59e1d1-39b2612ecebmr7555895a91.9.1788509805919;
        Fri, 04 Sep 2026 01:16:45 -0700 (PDT)
X-Received: by 2002:a17:90b:54c3:b0:398:d6e8:f84e with SMTP id 98e67ed59e1d1-39b2612ecebmr7555828a91.9.1788509805313;
        Fri, 04 Sep 2026 01:16:45 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a534df1sm5466648eec.7.2026.09.04.01.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 01:16:45 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v2 2/6] arm64: dts: qcom: nord-rrd: Enable ADSP and CDSPs
Date: Fri,  4 Sep 2026 16:16:15 +0800
Message-ID: <20260904081619.593602-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260904081619.593602-1-shengchao.guo@oss.qualcomm.com>
References: <20260904081619.593602-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA3NSBTYWx0ZWRfX95yHl5OoKVuu
 9+gtey3cqGj2kGchOypLRt9V9AGC+L1jNiThZhcB7QHZK16V3BnlNmVeOkuiQPPkiJ3l2yLN0NM
 ld71niRG/2cUdUm+sL7OZLL4tIIkpqE=
X-Authority-Analysis: v=2.4 cv=eovvCIpX c=1 sm=1 tr=0 ts=6a9a7e6e cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=UZuJur8GfllDSyYqWHAA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA3NSBTYWx0ZWRfX+M2xyZb/2wdn
 inSNSSHzmAk19GZho4Fzw4cz4wiD2rQpfY2TU0WROmHe9TJ1IvJwy2iDjJqQbK5ZFKwsKatCJGi
 DB9Foi2yfTIexlQrUtSRHv0liOCDGIrq19HOyPuKpMofXSiRQbCMJTEPamcASZepwpMsfL1fRfH
 TgjjhQAl9Ey96URkHXC5SOX7Wkg7GRLHAK4bsgiu0n/gGTc310/t/jw6sQyPeh5gqccN8QnGLA8
 kbXwhbHOQlBNDQ4s0M9YpPNGQxToObQ1qkuO0edkMo7Hai0GunEoYWY6jpSXtXU5J5iqloYA5Q+
 +BqpCLaAyJY7RCuWZ0P6LGwW8Df/X/xwCvfwDjBpEBLc6ngPn+CnOKWSBXhl+RiIbwoikeJlad1
 Eagkx6uzHDJvW/zgHVjIxe1gNgnZRsgco6RhEP5wlZjY2TznnIZI54AL53PkNCmpkT/tTM3mSa5
 thG2onk6fbPY+KWJUfA==
X-Proofpoint-ORIG-GUID: EM7kczwDyoeqWgDdLHysmZrtYN79eJvv
X-Proofpoint-GUID: EM7kczwDyoeqWgDdLHysmZrtYN79eJvv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040075

Enable ADSP (HPASS DSP) and CDSPs remoteproc on the Nord RRD board.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-rrd.dts | 35 +++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
index 3673003c8b21..e4c3aee441c2 100644
--- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
+++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
@@ -393,6 +393,41 @@ &qupv3_2 {
 	status = "okay";
 };
 
+&remoteproc_adsp {
+	firmware-name = "qcom/nord/adsp.mbn",
+			"qcom/nord/adsp_dtbs.elf";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp0 {
+	firmware-name = "qcom/nord/cdsp.mbn",
+			"qcom/nord/cdsp_dtbs.elf";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp1 {
+	firmware-name = "qcom/nord/cdsp1.mbn",
+			"qcom/nord/cdsp1_dtbs.elf";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp2 {
+	firmware-name = "qcom/nord/cdsp2.mbn",
+			"qcom/nord/cdsp2_dtbs.elf";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp3 {
+	firmware-name = "qcom/nord/cdsp3.mbn",
+			"qcom/nord/cdsp3_dtbs.elf";
+
+	status = "okay";
+};
+
 &spi16 {
 	status = "okay";
 };
-- 
2.43.0

