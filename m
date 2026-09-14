Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012E8391E74
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789369224; cv=none; b=DW23kaVaLGXUY7B+CXWYQ1JfYRku+ElL5edjYN4iwHXvuckgPOcZAFG7BrnaP0ssbFrZ9ckSUAQyhppzYK7feSpx2R+4/mRdUPuglQOS9zroS3rCvjyRG9mqeEkdemm94sz/HBx0NDL1LzzO/prOL9Hj2Vn0aXXyYr0w08hUBI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789369224; c=relaxed/simple;
	bh=LPPvKcrZVf6V1b9tZTV3wLC8uA2hTSPQxi3N8BiqiS8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g022dlIrJdwPwC4lLg+yOvnYt3hWjCL3jZz3jC0hEiFvAEATxOvi5fH1WqqB3yrzCLsK8QjL5ySzBwBi3lYqwYPu03QPFaFy3w54lcVNZy9e5MG9+SPldq9uiDyI/qFrDEYHc2TtvdK4vvyQaJHruQ9ee4MczziCd4eoRC1NV8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hcNzPEMj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YZAZNhTx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hcNzPEMj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YZAZNhTx"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5j5Ul063770
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:00:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kd9NLJEZ3QWME+sDupDpN5Ruz9isBnmZ31KtXVG/7co=; b=hcNzPEMja0guthTW
	bPdxXJWnkoGV2nGbEPWr7knTjiYDDtA5h9AqjsLxC8eqhpl+XQD0Q8ReBpkVrLGg
	wCqlGESe6gcC703NAL0IkN5w2FFqLM9IDrxJ3Ng4fsFRqWFD/eHSmHWry62XKx7D
	oCrb/zzhAts+zoD82dUo8DpcMHkpPX+2SXJ1RSsvvkueftw+KNhF9+vKwfRPSHy+
	oP+ybfBP71+UYpJ4/ptJSynYDVcz+xUqeUuWK3yapwEzUSM//lVuWauIbdXNRjje
	Aa4SNh4TEmnfyLg/IQsweuvlUQ25HugeZtWm9PUPZahezFtFNr6GXUYbERS7rs6D
	iyPMlg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dnfhr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:00:12 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d94a158dc8so44272485ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 00:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789369211; x=1789974011; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kd9NLJEZ3QWME+sDupDpN5Ruz9isBnmZ31KtXVG/7co=;
        b=YZAZNhTxQ/asQ8hC38EE2DJ9L/5h5b7kDMJDt5GKudCplEBPGAy0rpUhXsEtKWqnvo
         1fBC5FFWggpqpMfjQP+37yL7fHO+rdruwTLti75SYDKGH+Lg11Z5/G8nj+G//XGTyMpx
         XbbN9BbI3Hqc/omuMmQlSA1525PlpxnB2h3aBG0YsXaMMADzjQ5Ls3YDNoDQ489TZmM9
         +bz6xbs63gypq4yk6o/mrp9UaHy0vUFN8oer7zgfRqwSw7hOL4mVt7pBc2SvqjaDpPJh
         w+ATLmK114rzU6IeRHbCR9l0Fs7lKFwnacduiNhSBCV0oHrUoKDo6CHePur7jaRKd4rg
         9XuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789369211; x=1789974011;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kd9NLJEZ3QWME+sDupDpN5Ruz9isBnmZ31KtXVG/7co=;
        b=Y6z//DOLVKcexzBfzGeLj1qi1WoqzOGh2U9tTXKoNx9W1MEgSiRaye8e1n+g0xJKNO
         5qENi6hHJuB6Wk+DrmexvhIDmXRYs6l9raBRAIkNQrniaetDMCDC7VF/CokLiYO9slF6
         6TCvHSBG4Y4V+fIeR189wQj1Cj4B9EygKX4JjWufrpqg8ODc5UihWMuUgQITtDHMQzAM
         ET4suSRm6U0i+68Y6jgHBz6WRPMa18SKJzz0eDmEeUTyPI7y4Ab9NmE6N7QB9Plh+qIH
         wQnqLRIOkadX6slp++BqV8NrJRT+fHAPeyts4FMkMXBMmmEvfFS6H0MvDellZFnDimV1
         57Ag==
X-Gm-Message-State: AFuF++n8HM9KcCEsZwyu1eEl34OYA1J4l3PWVme4ifmrljqarNoxEnnV
	c7M9/c4UTlbKtfGfhIiKHQFf5yNASafU8Hjj+lI2/NepH1Jalla/Fx3kVumlBTtxgSr+jgniujv
	zcfAGuzVeZB7DcgNeib4JeuUeVjFIpU6RudFAZux0SKmWuYX12YiPKlDwL7KdmMIF3JHo
X-Gm-Gg: AYBFou3bj2lQ1p0/iYDYme0QTqbkpGIsl6GMJQwAbmCj6Y4YH3IiVQRTxV9hngbY6vZ
	9pbxXgJaxP4J0yBl3d1klQLb3fn+f6xcGv4xdQCPyYMuvNEZ1k6g0KtcxGqrlzp1ZjPcW6cN6et
	syqZs4MX3CzK2i49l3BMBP4jOLF1NgePCxL1tpoSLZtAI8vbRY+w/MiH+b8DGKh9DNTfaEKLNUd
	HwsHiyzdAn8W4a5U6vge/SNIQU9VMLTxs2x0Ebqv7HMhj2DBqUauxtjRIOLh7x26ks3J572u+ht
	LKE5OjaMAIyRiHd1q2H9AEjewsEXly27PLkBPNjavBpx5i7SE7hWDIkGzZUeR7FMeRAKPDtcBwx
	WfKup8v15SU+Gqrj381B1Npue9CCA
X-Received: by 2002:a17:903:198b:b0:2d9:2149:57c0 with SMTP id d9443c01a7336-2dd6c78fc01mr29405425ad.22.1789369211105;
        Mon, 14 Sep 2026 00:00:11 -0700 (PDT)
X-Received: by 2002:a17:903:198b:b0:2d9:2149:57c0 with SMTP id d9443c01a7336-2dd6c78fc01mr29403925ad.22.1789369210321;
        Mon, 14 Sep 2026 00:00:10 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f55735sm25962177eec.24.2026.09.14.00.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:00:09 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 12:29:37 +0530
Subject: [PATCH 05/31] arm64: dts: qcom: glymur: Add domain idle state
 names
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-b4-idle-state-name-v1-5-660c31187819@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789369181; l=1106;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=LPPvKcrZVf6V1b9tZTV3wLC8uA2hTSPQxi3N8BiqiS8=;
 b=r/5QFOmiZarwnV8piFgE8vq40uBxz83uxjbp/ILTsQ4yBCbfeHHcUCcRKiC0n7tTlJZrBlgIF
 pmLT8COwNSiBpuw1UE4lEGOhENwYDlxDNWF1OANDndXqgU3Wir7kUT2
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfX7Cn8RICsBbYn
 ga9XJA5N1JOKKNJKOsdUaAoUdQv9WKqX1rEeUitv8fYlI9nabdSdUBJNy+vmPhFsZfXxOlCaLwo
 P5Jss5XGX167vuZ6KneSogXn5f5rMFSfotE4xC6djdBryB4HMni69ZfS+ilO6OvqA670LTIq5xM
 XIALBvMLQqW0JvjAHbKbR5yCXzlEJ9ztSk6sdquuzxgRXGzDNIfdHbvA46WPbeppFaw+EXaEQnE
 QZd6QMN9NxWcLw+ZpxHTylh2X5M1dj+TKAIaWD//So0QDEPoM/nmDV3RLh2R5r/skNkPLAgDo7q
 /BymmH2P5/igjKFy2myOEjfUP9XGSwvyVD2d5YfaTJKdg8TJCjq1vn93wbLInc3CR0/gUKhxDER
 P+Ao3KxaW8QKou/QJOM0NkdG3DoC9qe0A9Hk8oPwsJ2nG1mxzckwVJBxyHrqkM5K/S373qdpf7x
 I86LrepLCZuNKNJB7ig==
X-Proofpoint-ORIG-GUID: oQB-bC2oBXxfjBj871l1bQJbFqa4LkMM
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfXyWUwz8M1TZ3Z
 ovievZKhLXWqiK6ntquXvSMYPNvDjhjx0TWSgDJ1m2+3ElDH3/hHsGbLKorY0M4AVcj+qx/gzIa
 6OELnxUreW3X4H+HncSc1Hd30T7JPu4=
X-Authority-Analysis: v=2.4 cv=Y6htIReN c=1 sm=1 tr=0 ts=6aa79b7c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=a6KFA2mGowSrcUvabvcA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: oQB-bC2oBXxfjBj871l1bQJbFqa4LkMM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140098

Add the idle-state-name property for the domain idle state so low power
modes are described consistently and its name is printed in pmdomain
debugfs.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 7dedace8c3c4..68e06443e91c 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -369,6 +369,7 @@ cpu_c4: cpu-sleep-0 {
 		domain-idle-states {
 			cluster_cl5: cluster-sleep-0 {
 				compatible = "domain-idle-state";
+				idle-state-name = "cluster-cl5";
 				arm,psci-suspend-param = <0x01000054>;
 				entry-latency-us = <2000>;
 				exit-latency-us = <2000>;
@@ -377,6 +378,7 @@ cluster_cl5: cluster-sleep-0 {
 
 			domain_ss3: domain-sleep-0 {
 				compatible = "domain-idle-state";
+				idle-state-name = "cluster-ss3";
 				arm,psci-suspend-param = <0x0200c354>;
 				entry-latency-us = <2800>;
 				exit-latency-us = <4400>;

-- 
2.43.0

