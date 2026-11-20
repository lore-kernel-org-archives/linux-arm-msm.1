Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795182229;
	b=z8xnW4NOeZT4CsN/y1Nj0Jt6kVFgY4+lxhfJ8H88ouQBttOmZ9d7+mi5SElJSjctirHa
	 H3XJAXPPf/Svqj232UlvVC2c8rHlRceoDvvaR0+SoZWc4JUCiGedZ0Jycmul5S5dswjIA
	 qrjXbqUVePKbQzTyZH9B1oEDHecsoCkC7A7rxaYhiqkEYPppHxl8juQ5S068X/UdSxUE3
	 IEQtTlQ6jzmQ0O6DpWEVskyvB2f4XwI7ZbzAIggaKLRY7S8HkaTomryS2+z7xdEm4KwRm
	 HHYs3h5DVBbo7p7WbH3r5Ax8ASLGiZR99YuQIOEQR9vkpvc9SLVP6d7mpTktZbdA9JQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182229;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tGy86xBzxOdtKe/pt5x0J8JCDH7VjEkzSSCaoMU+88M=;
	b=JWQ+7cEYQdokQe49OmWIw8p3FZXynDM+tE3brgSE0btzUE/eOWlgXNEv6ZVtqR6MSRlG
	 XQhd1rBq6PvNfGdA1g2WOY9cBfBBfhWCWqNv9ID47Kzw7WeLVchDdHZTNBmBy5/DLO1n0
	 Ehp9yJTBQPwGMASGESXUJ6sHNM6OZVHfUnm8yPszWAgmzUSw6J5wnBwHwvhV3y5GSRsX1
	 tGBlu+zdrFzEb/AEqkZq9n/HfkGsR97FqJ78vmacbv2W0WSNIDEYljCQQa6Mr/LaAGNja
	 fqthqDr/BXqhidMJ098uumgB6kqGtcrdH5xQORTdLGem+njxnsLvipCNA5r16ggcb9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YCsF+IDs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=awrz8g4f;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B87606A336
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 13:43:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93B87606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YCsF+IDs;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=awrz8g4f
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKCouhU1333741
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 13:43:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tGy86xBzxOdtKe/pt5x0J8JCDH7VjEkzSSCaoMU+88M=; b=YCsF+IDstQv6MIvZ
	xsCj27b5QrM6GVtFKhA+KTZ8aWrMjUB1690xvobTHxxplPXUy1Z5FnIZLbs2kkGS
	62YheN/JbLYl6x1eu7setWiTXCBncPR4/J//f4/OOXMPTGzDrFNIeDTGKCtqlRe+
	UqOdIZA2zTmxIcbgjIRT9hn2DUZ2vEJUTaz1mT5kpOuB2uZTUaXMBT7oa/hP6fxz
	LUW/S7MiERWNIFQ4Y4dTKeJMGAMdoUMscUNh+T+Xzqi4soHVa6zqO3sPgM3rEQ8u
	joaJQsAPVS5506TQmnNHOEk0sWdrytK+n6cZX21/EOwkFJ0x4U0y14ZNZtpR/uC2
	S2TSPQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27fykwwh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 13:43:47 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-38355b03cb8so856138eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 05:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795182226; x=1795787026; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tGy86xBzxOdtKe/pt5x0J8JCDH7VjEkzSSCaoMU+88M=;
        b=awrz8g4fAquAp/k4jJLch+V8uj9toCT38JfsOBIw0UxBPeoIgBxGwqJYzM6is4dMBM
         QhMVvsGgtnHvWPQQUMqzVQma+HAC1yDmVJuUTI1E4URjOUemhUjsuvxLnhtmS/cg9S7W
         f7Z7bLfuIwQ4G02xBqLS1gWYQKaudENDSMIKwrfvBvVsGWWHUbetofLGkXhHsaFaoXG/
         MdHOyJhhCDe/W8LDOaFWWxMcpxOpSG3nRinrtF2sslfISLFl1g8tyf+q7AQhqChgZXbA
         9ocpatQBOny5u7zJduS7OpxFRpARHgzpB0MXCi9x6Fd765WhNldy50I6kAe+AdaY+a9o
         UZGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182226; x=1795787026;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tGy86xBzxOdtKe/pt5x0J8JCDH7VjEkzSSCaoMU+88M=;
        b=bVfbd+/XCE4xW9PfaYJE6H0WjYy6/MbV5R8zwBFWqHTptiYLVlbZtr83y8cBMi2Gk6
         0xQ6PLb/78kPJFOK9rC7RPWLu6EjEjcWKp/rDeGh4e1OLAH4+U66gw8wWTX1Dj7emzsk
         RPGB6bjhyKiaT69KfClRBbUoyPzLb2RFnlsJ7oxD5vNl584IdwS4sdWlTlwgR0qH04HU
         auhHPnmu7T4Ll1SSW1mzXF5cb9WF1G9yDMJ2eTcHEVubsns4RfftpcY47CCSoXK35+52
         LknNJn7HA8qqgaBTndVoFKsTllDqCm4PcB/95L+OEoi1ABXaY2HKDLyYV5H171NhMB1x
         ggfQ==
X-Forwarded-Encrypted: i=1; AL+hErFt0v6sODn+kzgCoIO7p8Ud1IwDPsGnFi2WUyvKyvUq9vvFoHWVo+6s2yTRuAtWyvjDfSgU+I3hujS5UnM9@vger.kernel.org
X-Gm-Message-State: APuU4Z9H2UF0NCn0BBKEUnac/e/sEydNn9apUZCPkhpWEKQy6a5craGV
	cFdl/XUaYV6QJQfKm9fZSPN/tf54aqG1nJ5OZ8vUWCFgOB3fQ8hVNNe1mWxbabt3XKa5iuoqe5W
	ob5afhDkRrrhcXRjes7Uj1xiS4zpuz5ZhVSNZETAS0HH1m3UGea+vGHNVvzo9Pw+Fg5KpQpdMRo
	PU
X-Gm-Gg: AZFdTZcuyBi3/TAus5oTdLICEmadVGDqgcpLWUl3Fh7D27uAVVo5Fz1IFk+Oa8YgYL5
	icKyqtuWeezeHfcLGCneK2g7Z8IswSlEjWN4fa/0p6O7HjTNC8rpTSihCQI1Jmze13vQlg57L4/
	hWYOGwVl36GJBc4TAB/Ud8/EGLWrswisYbP4Eh0nfK4eOP/oijQeQdq5pkCZqpbnkX3jYtwQx0r
	Wavd3aM1Cvfm05KQIWJjE/z4inWXU9nf5iwV7gatcxQM2au/s9uaorRkHuAQf3BUBJd467DGDlS
	WyKqSK3YDxML2X497GdKNAMpPGg8gWyXw9izHv0DWS3aQ3cui52vQ327QL3+2d81KnhJC5iuqbq
	sir/CCr0xsGcS4KA1xuKu02biIPidBhxGnoPpFNvg/IzHVUfAxjDiSvuWiYbwLWNPtmwIDC64FB
	/JBpE=
X-Received: by 2002:a05:693c:8951:20b0:384:ce59:5e19 with SMTP id 5a478bee46e88-3856f257bd6mr2694911eec.6.1795182226360;
        Fri, 20 Nov 2026 05:43:46 -0800 (PST)
X-Received: by 2002:a05:693c:8951:20b0:384:ce59:5e19 with SMTP id 5a478bee46e88-3856f257bd6mr2694873eec.6.1795182225726;
        Fri, 20 Nov 2026 05:43:45 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567da4f85sm9379222eec.27.2026.11.20.05.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:43:45 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 19:11:46 +0530
Subject: [PATCH RESEND v4 15/20] arm64: dts: qcom: hamoa: Add GEM_NOC
 interconnect for adreno SMMU
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-smmu_interconnect_addition-v4-15-be30526391d9@oss.qualcomm.com>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
In-Reply-To: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795182138; l=1049;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=o8a7Ojp0eNjNzQ0rCM2WmCZSQ5u7xFkQL6aYtQmrXTk=;
 b=shWpSkfNSnmk/Jcw28HmhRNuejqHcOqrgMbIwuKPiGgefABQtWtryhrv+xF/ZuYuxLXp4XrdJ
 0EjfJJi5GtKD+6oXZONpBDOmHdTkkm4Cw/3B7UEMYg15dD4bavucvgu
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfXyCXeRpxgQdDP
 XcG4coTu6ZRuT3+X6/Td5IAc8iu7rslVkCoiGnPuwcS1Gx9ihwK/CuB8f9nJBA9qtMS+d/zK0QQ
 9UmsGo7qHnCp6GeE0wlCqDEOb/Ao4d0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfXyIXK/29ss8As
 EGdapHjkfy8+8Wj/+kyX3kLrqiyC42opbPGwvsu7cxaIFzNBftnIU2gOrY8TSlOfsim0tdz78Z1
 ZWccwQf4V1ST7bY5BVOWSRVBBXAouVjjrGtqauJMI8et8aDWUb+rl0eCbDo/jBqXmX4vxsTusoZ
 Iv+HeFh0Z3Hhkk8j8kvnAUsk/UG32AU+JVK8ECBKfYoDVHmlmNThJQ6/h3xPH23JEIxQ2Zxk5Gc
 rUipacRjmCQGV6CEEG65b+huCO+BvHKrUwHd/Jg0LZsXjBj+ZlT9NkVK9uAw7MRMu3Q9xxdDMPm
 7qWm/8S/ITa8x6oLToIxWu1bcHGwEskaSul8KUbi4JfsfBVlDMYM5TNPASispnxPUJZx7JWV86d
 A+pRr3/yXOL8Fv2/DHH9FUTk2tJl5CwThI1NtPGTMA1gCzthkGEwTBIE1+eXRPGEdxE2wfPZR5n
 9ocmopgQOVnleQwIOPg==
X-Authority-Analysis: v=2.4 cv=GZKCDgXL c=1 sm=1 tr=0 ts=6b004e93 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=WAcSZy-hVgrt5OVmuNwA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: w4MITiMUc4roqw8_Cjt0cqgrK7PYNQsb
X-Proofpoint-GUID: w4MITiMUc4roqw8_Cjt0cqgrK7PYNQsb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200054

On X1E80100 the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
interconnect bandwidth vote, the GEM_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 443c1a5c212d..f5b720d73a4e 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -4289,6 +4289,8 @@ adreno_smmu: iommu@3da0000 {
 				      "ahb";
 			power-domains = <&gpucc GPU_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		gem_noc: interconnect@26400000 {

-- 
2.34.1

