Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8CA3ACEFE
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 07:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784877591; cv=none; b=hWrDttjjPlmWjqf0cnLOQYMue485CtlKdcapSCY5xfBEv4ORM94m32Ij/XQedGwN6C/4O1rK7tnGdE5MPgsCSUdSuLqA2UXUgXrNqtWMSSWb2QCS6Z+H07eX2t6+nGvE9qIbwdHDUEeM7mt/wNW2V1WEmsxqmahOnDcM0ICkAGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784877591; c=relaxed/simple;
	bh=wZDWaODCyzp7t+O12ZO+CiytzMHhYNjkW2d/5Umhqnc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IpAHlZVpjgE21siG4c/IG3BhEW8o9lL7HJUPYFEKXQkPxSeFXmRFd1EJ3GVyCZWVRp5NVTc+Ptp+6HqAKMxPhgnr7UM3IDOiR2zM2EHMHsaNFG1Ilgqkp6DEFcgWcBfNpsUfBD/B2JSt9rUeIC03PHqtLvZeaTzgFYQwaWkEY80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SRfReoF3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GYFNx3OV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SRfReoF3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GYFNx3OV"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4lB4p2137557
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 07:19:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	85c6fMwpf5j2iCdGRa9j4fuKaRpGB/lUr0+dZdRrE2s=; b=SRfReoF3mUtI5cLQ
	iPa1Rfmx16lH4+oLCZeIV0lGWOxyE6tIQVHkKpCPQXUCzkD/zdTgTqbfSTlHOkXc
	Ss4E3udo89bT2J1Yn4NNVJs72qofDVhIpC5xoDYT3GonXUzZelCynprqMEg414tk
	HbsrwjIZFhBLJaFUgee9nc/uwLm+hngYoczJDGbQzTYvTEUepKY0fXLCKv4pWEzF
	8kuQoXKADivj9b2CSh6704160BqH6mdmUwZzk1poOWGybNxGb0nFZrlE6i6NEsQN
	WFoy9QEBwJpDxEjKw+F43/jjw0v6Ypzx6t3L+g0E2SbGU+YHfbPPYRrNvdBDOBOf
	1NPkKw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkqa1amy6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 07:19:48 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc86a9ef97so3266135ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 00:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784877588; x=1785482388; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=85c6fMwpf5j2iCdGRa9j4fuKaRpGB/lUr0+dZdRrE2s=;
        b=GYFNx3OVufoJmbsM/V7NOjuOIG7Yy9R/taAR7Wb6P2TAVDfTwq+V5qSaacKGeLFcGN
         B3zBZV3rcpHzBb6gDtN1Opp3HUXIe4dXgpmQiT/uAH7rGGvBDZxElCvyD2uONOgFmh0V
         ArmCVv5yEr1340mvmS+Zpv5H5rW9tzt+5x4eYupGoP5c2x3nYoOw//5CGML/ro+YVXgm
         dp/WViP9FqBNe4VdK6fScUc6eutYB1ReYIBvsSXHx7n3J7YN5v6mt6e1cbFcn1R3Fqcz
         0nA3L3e0Xfa2UBaWX4tKtVFnIbj0dQ9ZRRtq/52Bf6v3ZY1mvzw6PC17Dp2XJmtluzTi
         ekRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784877588; x=1785482388;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=85c6fMwpf5j2iCdGRa9j4fuKaRpGB/lUr0+dZdRrE2s=;
        b=UKgIIoI/lDt4g9s04VyYmZvKjsjVBnI24paoOnZ9kTd7/AO7zL8v5UC7M0G4DdU83t
         MaN4t/+Tx7JqFl9kgmxoQqedaoUuqvoamE+BPW35DlYv31g6XG2RBMWaFemdwHSh9Jq5
         IjwkQV0i14gZpV63ko9BXIYkkLMiyDY64jHr/iXOrvwXdhcyxrtBZDjXqZITnwDIiTt5
         ebUZWc3UXO4lJZId/6IWIpC/1ZwMsKt8G2wofz3B5eKAY5C8xz9MDVIY7/H8bETnGvsc
         v1dCs9//Xapp5ps4ylopArrB3EAHaRuUlUYFeqNv8a9hbHoeMkHbvlKbhOCl6CbwtQ5e
         6VCA==
X-Forwarded-Encrypted: i=1; AHgh+RqPcOW+QgEItZANDZZjypuajKVIcwztiOKuShNz80I9cqrHAFdnnGMMsxFz1sT9lp3rRqgyDzwVIrj38amO@vger.kernel.org
X-Gm-Message-State: AOJu0YySFz8upSv6I1y2ZeVFiwX4N4A+gaPQp9yKE5hwSqx5r9hAc951
	rUuPLX2usJhoP/ehVu49nnN13BbqCQyfYs1iVZgFMI0vhsnrIuZHpGEjlm6haSVzZhpo3UP/Puy
	gXdUgnm+K/6gxtVmXpD03Fqr2AxqDin5uK1BH4NR+wzZsMwlbRk010785J5VdJAMoLp36
X-Gm-Gg: AR+sD10qV1uhEQ6B6s6Tq17/D9aMxk4pdhRxRrr3wpX3SwdWmxZWAMxWd0J1TMuroKT
	2HF0nEBO50ReREdP9/MVygEMJN30zHot8JC+TvqApD5xqlvIYMELLe/BsfSbD1QTujYz0isCgIz
	kCf5P9mr7XCikBBTt9vB2Y0qRgxPJBIpG8zBroTueRAiyxAwe5+vMHsVGO9hFYQWAc5C7Valjn+
	gZcXO9uJLbsXMINRgsuMM/mK789/CLrcQM+NYkpgXmi1BwU1FlVepCAC546ahlCIpieKFjjnK75
	Q2mmLWy5I5zGWZk8pdd4eiSJF1QN9UyzlBUt8+em+LnuBxREP4YMOda3gJe7OLCqrhWi6u3zpgI
	IXQumzV6RC7havKgwRTKHkpt9vz5r99owtzc6Yt06JqbUR4nGxgcq0Nfh4mfeDWom3zdOGqXjCZ
	XCXd9HDZDHzE5ovtOG0SvjBWwjIeA=
X-Received: by 2002:a17:902:f693:b0:2cc:d192:50b5 with SMTP id d9443c01a7336-2cfa75078dbmr74555515ad.34.1784877587667;
        Fri, 24 Jul 2026 00:19:47 -0700 (PDT)
X-Received: by 2002:a17:902:f693:b0:2cc:d192:50b5 with SMTP id d9443c01a7336-2cfa75078dbmr74555095ad.34.1784877586957;
        Fri, 24 Jul 2026 00:19:46 -0700 (PDT)
Received: from hu-ppapaniy-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efe3afbsm45993805ad.33.2026.07.24.00.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 00:19:46 -0700 (PDT)
From: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 12:48:14 +0530
Subject: [PATCH RFC 09/10] arm64: dts: qcom: hamoa: Enable LLCC/DDR/DDR_QOS
 DVFS
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-rfc_v8_scmi_memlat-v1-9-cb732bcff1f4@oss.qualcomm.com>
References: <20260724-rfc_v8_scmi_memlat-v1-0-cb732bcff1f4@oss.qualcomm.com>
In-Reply-To: <20260724-rfc_v8_scmi_memlat-v1-0-cb732bcff1f4@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-tegra@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784877514; l=1007;
 i=pragnesh.papaniya@oss.qualcomm.com; s=20260120; h=from:subject:message-id;
 bh=8tKdt4fKJhT/tYsqDka1HLDRza+yiVyfZcS7BTSC5l0=;
 b=ElL7bMtCXym3FQCEHsNOAZ7OqHreyEim7+hA/4Ik410F2ff4uLS6Ygqlqda19xM3CYybnTvEV
 WCJ5kWpaYhwCMF/CKunvlKt6HUtpNwDIoAQtQGMSPWQdpDEw01Z8B8w
X-Developer-Key: i=pragnesh.papaniya@oss.qualcomm.com; a=ed25519;
 pk=09P9nFmZLXJ9+4Jx10ZK5rIW0Fmk79A/DLErm6aVA0c=
X-Proofpoint-ORIG-GUID: Nc0-3Nldet2fXa_zUw1o7ZQeZmWturDZ
X-Authority-Analysis: v=2.4 cv=L4wtheT8 c=1 sm=1 tr=0 ts=6a631214 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=8E_iI_7X9U7aA52Mj5gA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA2NSBTYWx0ZWRfX1K4Io5ccJnwQ
 63kSPzogfuVYumvPRemvzUEtDb46MoGeuqjri5oN2JLhwmIKOsuIhWJru2PKznsiqXNXOurIXLb
 DRhh8nixFn3hkopY/4vqIyPRaFfTxQUKUNyApPojiI5dTtJZrKHjqXt16l52Rhjd47j50w2s9YL
 U2Z/tP86EDclbe+04hWvkTPZKk8iKhMV8F5p3gofIR1GVQZ+cnzNAO/mllHf1K4RuYj9cxQ0ssg
 qtyH1HcT4LZatitS88RkQEaIA8UwGvucGxNhE0xJiSIjIMqIpjYS1sHb8/GAOXn35R5DMIz4jWF
 pTsG0lmI9XrQfLf4OQqVp506H3fzmfMrf7sNhNU2LaxQdCsvP0zXpWdvTT0jCILQiWcl+razk8F
 Svh0u68Zi7nMU+v9w56I2JGw2huovNGUX3Y0MAW8GojIg3NJblJxdqf7+1lgEJQqJE6R3WPq8+q
 vvpkNc9/E5m/snaR/HQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA2NSBTYWx0ZWRfXyJcPQZIjSM1x
 McEQU3F91rNL9hNoyvJ7+Fwo4qF9kZWndlPHnZfJTbCKfnLEq6mfreh2meKw9zEdd1vGtBQ/LvF
 siz5Jt3iIEcr0k45Y+mKUkfIacpWKMc=
X-Proofpoint-GUID: Nc0-3Nldet2fXa_zUw1o7ZQeZmWturDZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240065

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

On Qualcomm Hamoa SoCs, the memlat governor and the mechanism for
controlling the LLCC and DDR/DDR_QOS frequencies run on the CPU Control
Processor (CPUCP) and are exposed via the QCOM SCMI Generic Extension
protocol. Add the SCMI vendor protocol node required for the QCOM
SCMI Generic Extension protocol to probe and get functional bus DVFS
on Hamoa/Purwa SoCs.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 09527dcf9576..e9e75c4c4da6 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -340,6 +340,10 @@ scmi_dvfs: protocol@13 {
 				reg = <0x13>;
 				#power-domain-cells = <1>;
 			};
+
+			scmi_vendor: protocol@80 {
+				reg = <0x80>;
+			};
 		};
 	};
 

-- 
2.34.1

