Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13CC932BF5A
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785161526; cv=none; b=LVNWbEj5OiL+Te4WRjj5JJS+o4fHlp8Ri+kM3VZrygtcidnLVR85uLe5vlK7WQENJt+EbJpA5rruNvA2JlwRmw98x1hW8XHOqcqA9vMqZ9PD0JHssha6rJ85JkxQIhMO2BXPDQKuGySS3DrT8JUNqtuMYHpjH2dl2n4qpnzoJVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785161526; c=relaxed/simple;
	bh=iSZUnfyH+DVrkesuf/BtMSvD5hwtwS5ZUa31xFlmYh8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b2Uo9XxzAV3Y7JJBxtvUj/0wx4+LZyzo6sTIG93F99ZA7YlOhHypHe0kjeP/RpXHYPMKns5nlgqon02xHdy6WvfWhUuKGljf35IoxXR+NnCQuxFRfJQeNj8R/cTXfKjiWxmml0R7lI/wr40cpg0qkEoCVc9hubwrOZHdGHW+23w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RqnW/cnu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XMj1Bvmd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RqnW/cnu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XMj1Bvmd"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlWw93663476
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:12:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vKDjFX92LO1qwtn8nrc3KuBHe7b5GxwoJXERam2A4js=; b=RqnW/cnuhnfODFAo
	SGagn9k+UkIkOAnEvW2DlZqEX4MRMOzdi4WhHxMHuYyrhU+l09Yr+N3IWDU6rht6
	finiWOjY1ITOZwL9+wBevOPnTgfMSQ+ojXDbVcqdhHbze3Rpg/ckytG7N68O0rRg
	gw6dAJzVWVJIi9S/wkzIMSPG7oWsiBTkOXx7sqP64yIbYuiyRzw0CMA0djnFqFD2
	rT7tmI2VchODdlix3TjAMp+LNi8Hz7cF3Co0lMRL+yT7OC1NWADxI6LgZ1Mbpp6E
	cmCXxKxrR8GtsA9tRYaDoybMEx10Av/9EYKIze7L1nRaj5pOUSOvikmvRzqPlVYX
	3iUO1w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp2ashsuk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:12:04 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8485d853b08so7214892b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 07:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785161524; x=1785766324; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vKDjFX92LO1qwtn8nrc3KuBHe7b5GxwoJXERam2A4js=;
        b=XMj1Bvmd3tsNg6OEdCbBvXlogznTkby6q9JzYhHxgiwjfo5ibNZ/qM6sz2AOTJGaST
         kzE122L5uXwqnY0/maxczHfnCHQFNTLJIcbu8VlJeWCXrKmkxGcfQJ/IAUUG2IBsY52R
         B4xwxA5v0c/Gns9/lxBjes15jn+OUe7LqNKTycybBai9Wg9liIY7tVLxylejNA8kJJKU
         LY41Q8BEwDsQ22Kv6zgpQKOqTHEKU9II1Vt+SeA+sKDbvqUWLKtKWGnQeEqofs3M2P1N
         STOUsMXnYDj2DypZn8STKlxBSqCmNAb0fsCAZsviNYkbg8Vow1mU4R+9xHOHwcDhCAPD
         3V+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785161524; x=1785766324;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vKDjFX92LO1qwtn8nrc3KuBHe7b5GxwoJXERam2A4js=;
        b=OF4EpNiFed0nMOA0NyrPciqw/A43NzzPXUO5hT9jeSdCQk0DUfAcmF4gIjdlLRaSmp
         IqkhrLFJUFTTO4FK58hira3bonlIVoED7iiKUZERwoqk5++omzlFzGOQ9nG8EABswlzA
         BjyymkQMGVrFKubpams/9mabT4wrblV4Az1w49qz2gbu2S+BBfqyPG02PrAq5w7iZESF
         kFYxFANj1UH9ZhyiM/cEAi4hywrSVA8XkCwhMwRl7i86/JQIYNY1b/KpyUVPPojZxu6e
         2x4XegoEZH6QoWA4Ht+N3+gILV0XbsdXQiHAqml4g0WumaexUupvE7OLq0yKLdbOvWow
         jeTg==
X-Forwarded-Encrypted: i=1; AHgh+Rpvy4oEGSOuyDU9f+HZAoCI7yOcn34SnU64zOz5+jXRJLQoahbV+eQGzUoKey4kGNkt+qIC5RCpNBme506p@vger.kernel.org
X-Gm-Message-State: AOJu0YzdfjUp3b+UlqNIRWMvFXTB0oPYHTQR4gMnfoC2fOHVLJE67Syd
	asIpsKwvRMVBwSE+H+FdMT7Oh0zEhpxb3IqnKD33uTUrIBs9coL7U1vd0SmNMis394MxLIJnBk7
	1+t0yBfCYq3Vnxesaz1TrUWZsjvsqN2TaqwSNiX3jJ3KJ71v8Dv/cDd9HpveEezZkf1MkdATJIc
	5m
X-Gm-Gg: AR+sD10Ela/z8XQjBZyqJQGYr1tW5MzXepiDqFchnZ11YIny05LqShhVfibC8zveyTA
	DMdgV9wUdvzEgLoAKNVwlV7t1kqzvpR/i0qDg73uQrVZ5SKS3yXWmqwjk+grZsR6AzV0KlH5Czf
	07HuyjFT9Luzyampv6Yzsbk3MNQ5knTFo7fd12dG8stGSboqY2qEVyJDuKOUEA/izpYmoWwQWyw
	1XsU7iYJXD+3ZvT2SVZaq/LNEtBYfz55DoZCHoXDWdjPkxHfY6Fz9JYab0cIr6sDLye9AaBgoc+
	bgr33OX9sA4wSdrtZ2wBbctq7kKJnymahFU5+RXOdX1afZtJyf4dq+QpOqSGVBdwLK57Dd6DA/+
	EIMVifMfevo15nm/lwSgkbsoaE71AbtM=
X-Received: by 2002:a05:6a20:12d0:b0:3c3:7179:a640 with SMTP id adf61e73a8af0-3c67dae9754mr7826598637.3.1785161523571;
        Mon, 27 Jul 2026 07:12:03 -0700 (PDT)
X-Received: by 2002:a05:6a20:12d0:b0:3c3:7179:a640 with SMTP id adf61e73a8af0-3c67dae9754mr7826562637.3.1785161523181;
        Mon, 27 Jul 2026 07:12:03 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc44cb92sm53438677eec.13.2026.07.27.07.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 07:12:02 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 19:41:01 +0530
Subject: [PATCH 5/6] arm64: dts: qcom: lemans: Add support for TSCSS node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-tscss-v1-5-beed14e72510@oss.qualcomm.com>
References: <20260727-tscss-v1-0-beed14e72510@oss.qualcomm.com>
In-Reply-To: <20260727-tscss-v1-0-beed14e72510@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEzNSBTYWx0ZWRfX0BxLo1wpJA/g
 eVgjeNhJWWVBqEifqM1AVEDnNm3rdUuworwjaCuKEmwcIibFpTax9bHAvfe151GiX0w1hrJi+Vb
 SQjXxn2s/zwy0JCKBDN2rCLQhbTFu0N3syhghf6pvvCljSZGjDBNM6m+J8T5VeY2ZFKlKpK2TdY
 kZH4toBNFpNXg6qG3KKZRRSEcyQyjt4kW1qSY9CKpFKOKk5cdnV8J3XQEMNu9wMWoGHDryDUcxi
 B6smwuwmvLgyCsSXsgqnr2O84bF/rmeUtGHfA7wQjsrHvLotj4JAPZosuvHgpfnYNbuvV+sM9iS
 pcV1SbzUHQrDLMf8HBDBMj0KXXSqFO43YauiWeJyeF3U5qDZxfOi95joN6MZAUyUWQFzQRbCXe0
 R3+U+KGpArkPdhZBjry64GV3BbsHG+HEPuRHmdEYV1aNufV2DpMvlynrxd+53hygo9T7LY/md13
 VSLmvKzP//UoomuJpbg==
X-Authority-Analysis: v=2.4 cv=UPbt2ify c=1 sm=1 tr=0 ts=6a676734 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=cV2z5tzyjUHL2YBgtoMA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEzNSBTYWx0ZWRfXzxZlTZUaxRcK
 90to19bpJ2y61jPZmYxu5LosXZTsFf5XayTvQ9oCPMdZ2aDLxUZ+SGQjZZI9h5HdErQynTps29l
 5FSJNURbMGLQ1+jdSsjta/p5bn97XZI=
X-Proofpoint-ORIG-GUID: XXHcUE68GZfx6WJRq2gUF_DG0_aRyuh2
X-Proofpoint-GUID: XXHcUE68GZfx6WJRq2gUF_DG0_aRyuh2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607270135

Add Timestamp Counter Subsystem (TSCSS) node support on Qualcomm Lemans
SoCs.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 3b0539e27b5192582e0bc9ea248f1c0382e05030..e225292a1e41a5a313aca188ca04bb12474995e8 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -3023,6 +3023,17 @@ pcie1_phy: phy@1c14000 {
 			status = "disabled";
 		};
 
+		tscss@1c80000 {
+			compatible = "qcom,lemans-tscss";
+			reg = <0x0 0x01c80000 0x0 0x2000>;
+			reg-names = "tsc";
+			clocks = <&gcc GCC_TSCSS_AHB_CLK>,
+				 <&gcc GCC_TSCSS_GLOBAL_CNTR_CLK>;
+			clock-names = "ahb", "cntr";
+			assigned-clocks = <&gcc GCC_TSCSS_GLOBAL_CNTR_CLK>;
+			assigned-clock-rates = <15625000>;
+		};
+
 		ufs_mem_hc: ufshc@1d84000 {
 			compatible = "qcom,sa8775p-ufshc", "qcom,ufshc", "jedec,ufs-2.0";
 			reg = <0x0 0x01d84000 0x0 0x3000>;

-- 
2.34.1

