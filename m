Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D6C3F104A
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 04:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792037579; cv=none; b=Yjut/XlX30ffnhseYCpP5eFigkAugq2vzF5Ykw1L8EQExkmTL87j1w+wgwLcsd79RC3uysIQ5cMBkcbO+W3VB17FnhhcEuPvDg5spB/Wk0aFYzMburLtt5vNxjFdtx++SWWHXDt/ZVpYYwPz1gOZb/hk0mxDsV3YnM4GajAX+5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792037579; c=relaxed/simple;
	bh=afn1e/fW2PzgzGse86o5DRe5vliScLobnb1hHsTpKUY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o7oBhbcpXNiiDS4wOAkB6qbDL35o/dwHs+NzJzGhsKNQxqAiIdhr+pCiwMxXRRtH/V2vv9t0Z0UglwYaNV/6cy8K2s1gQ+Z05X11E6mGC+JBR5CMHLmoj0A0Log/F2b/ZZkSuS7Gjs+8wD/9CTEr4ElEvhU1l+z2v++P++28LCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SCDu7F9u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KayJCsGK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SCDu7F9u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KayJCsGK"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ENVBKh596302
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 04:12:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PsWl1HZsnwl
	MvuPPgNIxzplQvHxqyYwW76yfoJtMppM=; b=SCDu7F9uMaUOTP2iJVV7P6AAwjF
	kyJH9D+yRvU5gRQ8JQ+Te7He1P3ZMKoKGOw9ijbNqMyqyPedHDuC//Po4INnbrO6
	/nRZ9yc5r0w38hZ6FohjSwWagGOiRjJWhY8fksupWXcRhhkMABVzeNHelcgad+8C
	Pg9wIUN+fqOEl1taoluKcE4kEKzelMGrCLyBUIUboZuOWX5ZW7T/JpLD5JkwBrFY
	4wBtDKLq5Ax56s1vCcQcP6LjP9q/ejQUSe5t+CCc1XvTIJakbonxdL1KRx/XQWQK
	9C9CiIXgwGjXCIktEsS7qhDnCDKqXoln+2iEfVa3Iaek4sdTIiT4ncnZXxg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hakderukm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 04:12:57 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ac6971ab44so380706a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 21:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792037577; x=1792642377; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PsWl1HZsnwlMvuPPgNIxzplQvHxqyYwW76yfoJtMppM=;
        b=KayJCsGK3vVeaLMa1i/yNstfdnWxFdDh684j0dwP2ANy2WgZwmdXtgc6meL8Iw1+oI
         FuObDny6fYER8AtaTLhDJ0p4hTszVhZ5dEk5ttLazsezbVYFX/a6P+VAbonyE9chFCNm
         V+dO8McnEAPMJur8dR0VLihWzYutGkN+AMQqIxvnzHbto6EFpWJjCma1sPtTTGdMRkzb
         Q7GGGldyZ5rMBPtKLCRY50CBb+CGvPG2ylnJJp1o665J9HmaPQ1RuTOm1HQNM0YvsNQJ
         Bwc/868OsdCTZinauzUP0au1KIIiS/8sVqQ4uX6deQ7LNqdmxcggl4QcNg/dXyS++W34
         4veQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792037577; x=1792642377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PsWl1HZsnwlMvuPPgNIxzplQvHxqyYwW76yfoJtMppM=;
        b=RXTJ8zRDDAUUJlU1g/wqqqBGC/rYr+nDtSZLaMEeVT3i6NSt5FSWLIQ5znbgu33k+h
         rruBd9rGhOimnM/cZW+OHgEip2LF+k43+Z9hZCjFFCINGuITjnX9Gg5y1YQdPz5qFWNZ
         GTkSiktGjdNc0pS0dM3JiBQTiXGf5QwERtUbe4i24ciNkQn+daJxGSWoOOehtZPx59+6
         c2TGYXZMIaJ1W5m9UVoj5+/WiZKZkuIImmFh4rhaOOLT9h5Gf9XZGMHA6xNAKXv8ybid
         DyeUVfFBnD0QchuBDDkGkEL8e9NEFJ68KJK3imypsfqxrUZcOrCWltWAC38ssTv356Hz
         OMdg==
X-Forwarded-Encrypted: i=1; AKwUvBx22+rCERmywd9Vo+2hzt+D+euuGo8MS2ayGvJyT7OfQqADi71pQB+fxZUnWMjk0GVm1e6N8IegJ3jMQ8Uh@vger.kernel.org
X-Gm-Message-State: AFq9FYJAjslbYQGBx7oCZ39KgMfqK3IOa0YA5ZDK9WC+afJ+uM7Qpjlo
	ZIgYLlkCcoyFT62JvRQXbvtCaYwsgpo84YudCHayfacGrCHALfR+21PK+92g9b8ngRWudwAbfnA
	vjt257fmcqEZr30TPJj5phEnRd4dHlaTmnbpAwqU0Hpt1103CHRCQl8xu1AqlJ7EHPpWi
X-Gm-Gg: AYBFou0RblEjiQZ/LVUuTUA3wUtX47Rjl7By49qDQNOqxmsIIt7p/Mjz8DtJJu+kLZ3
	6dRJDQeVEIdmgJ4u6HraILpCJvnBr4SHIsbiv+xrZJsJ8VPmwQai6D1nMNowKW6WxMsoTp/CJjH
	nbUb4f1egA9zacZp/EVqqmJ0rBLIHbAjRGThI5j1ahvcerIBH0sm+4xyNnCDVad0gm4KMCxV1Av
	f+Mc2VmAnQ7bEjRiUWiHAu9ZSTNb2KTjNSG0BiyXl0WzXasrZyt6OoHqjHneQfTf4S/haypm9QZ
	Mgofd+w+zDBHvt0P/VLWMV1Q7ZgQm+VOct5EzTgMRe5s63BoVkr+W6QsVhNhQPjHsJl1kaH+Q2A
	z2KdHATBLh46nW6B4Qhwb7EaziOdv
X-Received: by 2002:a17:90b:2d86:b0:398:bad2:c10 with SMTP id 98e67ed59e1d1-3ab3ad0fb5bmr23884488a91.6.1792037576568;
        Wed, 14 Oct 2026 21:12:56 -0700 (PDT)
X-Received: by 2002:a17:90b:2d86:b0:398:bad2:c10 with SMTP id 98e67ed59e1d1-3ab3ad0fb5bmr23884443a91.6.1792037576053;
        Wed, 14 Oct 2026 21:12:56 -0700 (PDT)
Received: from sdciot-sh07-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac944af2f1sm2267762a91.15.2026.10.14.21.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 21:12:55 -0700 (PDT)
From: Linghui Wu <linghui.wu@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linghui Wu <linghui.wu@oss.qualcomm.com>
Subject: [RFC PATCH v2 1/3] dt-bindings: power: sequencing: qcom-wcn: document wakeup-source
Date: Thu, 15 Oct 2026 12:12:39 +0800
Message-ID: <20261015041241.2186521-2-linghui.wu@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015041241.2186521-1-linghui.wu@oss.qualcomm.com>
References: <20261014121910.1509541-1-linghui.wu@oss.qualcomm.com>
 <20261015041241.2186521-1-linghui.wu@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OdENnRTY c=1 sm=1 tr=0 ts=6ad052c9 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=brVOnVl_E7YOJ4RIXMgA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: Q4K3MibdUUoDdvN8sGHcoj95SXKQSwSA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAxNiBTYWx0ZWRfX22UY409qxQj+
 iEscqz1tUa/QTVj45x2K1tZ/eoX9dDNd6kyrGcc9SAAXO8RoTv8tXYvCVAoCj3zUtT3rKigNOHr
 TaX7iZrUDr6YNVGYGDZZ5zFyPVUkEhMbtfaAJ432Xyw/zsettjDcCjeZ2uhENKAsztug4sOBu2h
 teYkcXssY8W9b6XngKHvH+PXP9mPGLoMR6s919fAlgWcOR95KZuuQicwWtxkHtZvw23jhGjXWS7
 xxg3QXr8mdkreUKAGkQcBFzalfcTD7JgIY0wcp/4hOxDwZcBvv5Esv2feBdqhd73MvrTi/DFFqW
 1Pf4blD5W7K+gnyowriJ7p4+xV+TM0fIP7m94xJZ2tZuzyjMEt0xKUVFbafhql1bL0s8MWi6Wy2
 kgYZik02y++C9JBtVvMsMQ/p9IgfGHchL6yXJEIOKxw0sxKCkGPIeW4cKMpnHkNJpZw20E+M7S8
 oeuutfSfVRVgqVVqI1g==
X-Proofpoint-GUID: Q4K3MibdUUoDdvN8sGHcoj95SXKQSwSA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAxNiBTYWx0ZWRfXy6mZMp1sxwvT
 iNPT3VsN8yOboOkL/mTiEghS/GcVO3ja6mXMObn4BfRdgFh3KVftTS0C/4CkQrMH5fTEDX0Da74
 CozlW/WkCGSSAFXCT4Ru9hlYtArX6cc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150016

The SW_CTRL GPIO can be used as a wake signal on platforms where the WCN
device must wake the application processor.

Document wakeup-source and require the existing swctrl-gpios property
when it is present.

Signed-off-by: Linghui Wu <linghui.wu@oss.qualcomm.com>
---
 .../devicetree/bindings/regulator/qcom,wcn3990-pmu.yaml     | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,wcn3990-pmu.yaml b/Documentation/devicetree/bindings/regulator/qcom,wcn3990-pmu.yaml
index 9a7abc878b83..f0372e28c99e 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,wcn3990-pmu.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,wcn3990-pmu.yaml
@@ -42,6 +42,8 @@ properties:
     maxItems: 1
     description: GPIO line indicating the state of the clock supply to the BT module
 
+  wakeup-source: true
+
   clocks:
     maxItems: 1
     description: Reference clock handle
@@ -67,6 +69,10 @@ required:
   - vddrf-supply
   - vddch0-supply
 
+dependentRequired:
+  wakeup-source:
+    - swctrl-gpios
+
 additionalProperties: false
 
 examples:
-- 
2.43.0
