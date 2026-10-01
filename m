Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F45352BE3C
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 15:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790867503; cv=none; b=SV5JUtKf96qkn8Wn8nfIqDWrJo+YegvA14F7eK7y1r6nnjaFNzP1xOTFpoLRPG954G14XljAetXpigLXQdUXskd4x3W5wgOLt9vMTAVMkJs67Gw9VrlWjZAHUFVo/z+66hRYSlaO9xvXq7O6U+PT2PrIQzOWvMG+vfl4vOvm0WI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790867503; c=relaxed/simple;
	bh=/w0aJOH+xoiyalrUqU9wOK5XaE/NxE7TbLjMkHrYZPM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hPEXDJm5hzOz0jsby1iEhdOStp8QbA6uK6XjDTTTqVd1UqhNhMWljq/D+3ZGt8bKC+vzmrIPcgFY8eKJxYwyjrgun8WePvE6O9B2x0sm91w5dy1nWKLLsLrbZaz5HwPEOD9yaC5cUQO+rOwWXODfVcleXbsW7YVQeJ+5LtwGB8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CPwL6HVj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fB14PEpr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CPwL6HVj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fB14PEpr"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691DjHPC2825547
	for <linux-arm-msm@vger.kernel.org>; Thu, 1 Oct 2026 15:11:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PTzWQCCMyGuhdhfBCadmrc99Mjjl12xgtOGe4mlucRc=; b=CPwL6HVjIyHYBAZj
	8baBNSMXxkvSi5M/GwwVHOr99QwszEo+nBgRMDFpZ1A6rnCUMNLqMVI9qwZAoKKL
	5ocBqZIdHh1s15Q3NgGSPus7tmvFv9sDs6uwCOAd1kAkdVucaeGHK8/SQvBVjFuT
	3i88X5rG8m0Ws+nOqlTQ/I6PN68ZREuxuuwFrFPznz+Fx+DVMcW8pl3ajcMmCEdG
	HjoJ9BKVXbLYJYMZFEaYutZUw46L/zNnYbbJKLnaIGUt6ZUZv4jQYt1JxD76MlLr
	ZxNYM7h22x7TE71DI3j9mnON63zOo5KNzkWLJqPl4xOWTcocLEHylfOpkRSfMyKY
	5gTYQA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1jcft7hy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 15:11:40 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1438719cc1eso7885934c88.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 08:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790867499; x=1791472299; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PTzWQCCMyGuhdhfBCadmrc99Mjjl12xgtOGe4mlucRc=;
        b=fB14PEprU/kAjIwpY2kdO0MOxpWTzYrnW1dxbKyEq3crNyPdouZCIIfI1sh8E/vlzo
         6C6C4kg/0yFx6+yZOmn1haEYrNLKalKRo6dbi+xpEy0z61GGu4ptMJVrgHDyYJM4jz9+
         nddsvpy53BNZG2Zv9HcecvjGBlf+4iFR9qpWAF61rZkqCy1s1FeKUlOfIdmG8FA/MNAC
         LMqssoCbUebqLLn26+6gI/vFAK2Qaw9bl1nwC+wM5xT+U3CYwb/2qN/HuGIquz1kddNj
         yCh8oBNii27DqpKoUXypPw5y9reNV6yR2a91/brhJlBBD30GKTa7M3GYo2377Zqlu+PM
         Qm/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790867499; x=1791472299;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PTzWQCCMyGuhdhfBCadmrc99Mjjl12xgtOGe4mlucRc=;
        b=ooEA5ZZQKiS/HhVLcgLriCTsaeAmYvAZXd92uBKxfgVf/MmIZSgfOhro1dgOO3ekwu
         xekW9NCRZXPg17P5MxUCY4AF5LtynGwLRhxByKwznbNYtcIDNV70Ab+uJMbN3b8v49NK
         51VrF4eCWacf6IwUkbhApuBPLMvGy+v/55eKtSthfLJdKzqewAQXM67OaauE/42poMyk
         QazE93QUopgaaAXPq8Xq+pPnyESu8I5x/R3PRj6ySW+SsY1NCI2Y8BRRvzsGHh/62Oa0
         +BVY4lnVk/wr778dp1xuJD71dxMpexaIxBYbtYRusWHw5PePkhhbItbd+GHRrUz4UEG4
         ES3w==
X-Forwarded-Encrypted: i=1; AKwUvBw0bltNocax2Lc/peUt2bSWqMDSon7CvknlN3b+9bKDCR+h8gGSUw0FWjpzzPDr88YUMQJzztBamYt4PyKu@vger.kernel.org
X-Gm-Message-State: AFuF++lg6h+SdOR+HIgBZAIQTPxg50hqVD5fnb7kTcRyu+aFV6EGwmCW
	nr4hgplQxv70uqQXO79IzuVt7kfhmB4+0GcXK0DK4zrk/j1OBkTQxP9sfHuhROUogncPz9ixhFb
	YCbZBgYxTRhQi1zQU2RC5TspGf3sJKwbOJvx9bUVzDf+1N48xAUgHAR8DOUx/pQ9xuSuZ
X-Gm-Gg: AYBFou1wObmjRgoGjPDjh/FzuyERyPna5Db31ulLlwYxuD+G8DFCZgkRUstxveYqOMV
	O8wKq0MEhntXCNlhAavs+vFbbOLxk7PYThE6AhTaLDjEu6h0nj08eNzwRZGF4osJvPmWjRRuZTy
	zVr9tpi9WSk3ZjfqhJms0OznkQyOWL7R4vczDD3q/hsL+z/1KBAYxE/id6X3GcnquoJSNolHx0y
	qCXuzGbb5FMpczcV7zqusIA3R8YihvE4VPu4pkcyz3LkuH1G3O+hHFh2LPttVLNPeVrr716t+WQ
	d6X+lF8gkuDikEUK2S0oQUPkH9/qvX/gr3zGBUWOWwO1w/uMT1q1/jKgz9JWymbJKQ1/byUB7Yg
	Z88gfnT7Hv0lTkqAjq7VNSLb7xSuetzL1ZQrl/XtgQt9jUs6YYdh6Sqj+TQxRov4+2q1KPFyWh1
	cbmn7YMM0uCo2laXrZKREpeQqMflAT0VF1aQ==
X-Received: by 2002:a05:7022:158b:b0:148:4d6c:201e with SMTP id a92af1059eb24-14d33f3abd8mr5346554c88.23.1790867499121;
        Thu, 01 Oct 2026 08:11:39 -0700 (PDT)
X-Received: by 2002:a05:7022:158b:b0:148:4d6c:201e with SMTP id a92af1059eb24-14d33f3abd8mr5346522c88.23.1790867498484;
        Thu, 01 Oct 2026 08:11:38 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14f265d307fsm56159c88.3.2026.10.01.08.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:11:38 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Thu, 01 Oct 2026 20:41:13 +0530
Subject: [PATCH 3/5] arm64: dts: qcom: ipq5332: add the IMEM node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-imem_restart_reason-v1-3-79f516906010@oss.qualcomm.com>
References: <20261001-imem_restart_reason-v1-0-79f516906010@oss.qualcomm.com>
In-Reply-To: <20261001-imem_restart_reason-v1-0-79f516906010@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA2MCBTYWx0ZWRfX/hQAOSz+cPnj
 Yw3mq/gvOff3WOZOJHkkUPSv3Chq0R4SSL4Hat5XebhyB01gM+5/b3FPIbUyksX8f5ej9+n84Rf
 2Dvz6iKHmFQebIExVkb4YLM0VA9cjqM=
X-Proofpoint-GUID: zItJofzuJWnMNQuUym7fceGv0VUNHykJ
X-Authority-Analysis: v=2.4 cv=b4YncdGx c=1 sm=1 tr=0 ts=6abe782c cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=1EpwE-knX81bZyav7xYA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: zItJofzuJWnMNQuUym7fceGv0VUNHykJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA2MCBTYWx0ZWRfX3VRjueQwAVFn
 gTxnBUqozI4bpdsp4+cF7C4xM9tgbEIt3kuWjdKmg47ONX9BPB2K1mmhgwiPP/usQ3855Vj4bl1
 FmfL7p2iMgTA6sAkzMIothTvBmqsvcL9keVzHEZ4op0L084Znw8kkY0tmMDqMh4IPdAuQjTKYXv
 aDHau+ykrSkGdckJp5QqKYRZ0VtSpQS6fY+i8A+UzzW/FJcAv74ZtKL19teeD+ejkEL06EO5aOV
 dXMmRlhemic3P7jZiF6Cc9VrS+SU2c/oit7B/ED9BSrLMWqraOcOiWo8mP4+ljKU7uoaMO907iv
 Hpnxdq0BFKtKd7HME6DpRvzLxzRGcpEMO9Jk+IdHH0mbQAqW+FaUohEMKrr62jz3qqG5AAJsZsB
 YP1i8n6MOH4wlmxOS8dVS1Xrfvza2aWqWqJZMlsEaHiGpcRbP2x3BImWZGbTweEf+uFjuO5oHI2
 v7/UdGsDqkxepAlvhww==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010060

Add the IMEM node to the device tree to extract debugging information
like system restart reason, which is populated via IMEM. Define the
IMEM region to enable this functionality.

As described, overall IMEM region is 80KB but only initial 4KB is
accessible by all masters in the SoC.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5332.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5332.dtsi b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
index 74d9de8d7641..3e10f45e182e 100644
--- a/arch/arm64/boot/dts/qcom/ipq5332.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
@@ -493,6 +493,13 @@ qpic_nand: spi@79b0000 {
 			status = "disabled";
 		};
 
+		sram@8600000 {
+			compatible = "qcom,ipq5332-imem", "mmio-sram";
+			reg = <0x08600000 0x14000>;
+
+			no-memory-wc;
+		};
+
 		usb: usb@8af8800 {
 			compatible = "qcom,ipq5332-dwc3", "qcom,dwc3";
 			reg = <0x08af8800 0x400>;

-- 
2.34.1

