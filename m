Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793977334;
	b=JxNvM4cI66GwovmNTHJS4wal/EVW9NSt9V9CI/oT4OeCki6SJiGoGNX/3q+QcBsjEIri
	 8ouzn9EJi0JcuX9orwxEFW0I/3gHJCSrYywo5fpt5B9ZbgsqyGgaDKSUsCnX22Aeq1oKg
	 rCnkrLoXgsPzQ1j3m+UwkRLP6tRvrdf9lUfdgnrhJxhp814oBxoldN2fognGZ9U3VDuYr
	 wk8tFoZABIMhyT1BxxEtTLOpxYl1VKhWd4wjLGKHv005sIddfQZUQLmdZ6yLisdMJz5T2
	 6sNO/M2ZHoyXx0BtavFRPuYYH0m8TQJr6tq60P/a/wyqAtZJTDADSsArw9E7LykrDiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793977334;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=x3QLozfCyQOXqamzqmwUwQlpNil8HpltlRmIUwTug6E=;
	b=uMTwmW21R3Ke5Myub0/FoDLIeH7Z9nkWh9QlXPVktv78MAzKtRBL7FDfoZtbEm8InZqd
	 ztfg8Yhp1OPpCyNEWdfF06ehjsDe0/VmiGuZGv+/YQZQfFc/tjrkdLgP6irUq4z+ZkbYy
	 28MXOL/BVpL/ZpOcpFuihykdkqmUFVtQ83pJHsvOaRTO3wtDB4INmHFR9NvbzOvHQJCe5
	 r6/OnVeCWx1jhg3zz5e1/79dUQD+iBWzIVci03HlMa4b5uh5wmcAYY74CVbDlmYSD6sIz
	 WK/HH97HT31hT30z75kmeNk/WRAPOO6XvlwhgJrbtqPN4ccMFsVnQDXDZn7Y0kKmQZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xbh7m8ur;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fXfz2Dig;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101B7606A33A
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 15:02:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 101B7606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xbh7m8ur;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fXfz2Dig
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6ExvCN3324808
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 15:02:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x3QLozfCyQOXqamzqmwUwQlpNil8HpltlRmIUwTug6E=; b=Xbh7m8urGrHgjcfH
	C9Jj0JDKyF6sex7I0ecYyn8uOXYx+Mq+2o+q4OVZsIrRVYm8lvV+6wjoFJ8ZO0Hw
	gnGiNk4ZEi/a1e04is8cN7Wd5Dq7bSLwQXAebb3nxwvttQ8QGHPeJxH7uKPdolIL
	j75jc2Y+SxwndaEORzmN6/SDKfTvbIf9cXwHSqTpZILgpvqnrL6bOFD6xRBK1YjL
	ZJtMTjD6SPQhm5L7U5qKKpnW2qn/gGNOFk1t+CYjPRvvn4N3XMDlwu5BkoTZmY+7
	RtcHSR9+2givifm7yIsvFpecrhf/4J0GOmDpOVnlCeN5OavnN/fzVN+XSII0GZix
	Hmhsug==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9bb4j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 15:02:13 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3adc5b185bfso787627a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 07:02:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793977333; x=1794582133; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x3QLozfCyQOXqamzqmwUwQlpNil8HpltlRmIUwTug6E=;
        b=fXfz2DigYC9W6AZStwUIvED5E3+G9TM3hT/6b/mXMa3Fw5VUM4LqVETnXJAFTvuPXw
         iXwUURsT7GlR3NnH1ifiH2e+mh5qnA3R8LuNXAW9zORo5vExAx82UFfIY2ZoxrViSRU4
         UTCb7nOOi5MWhXfJ23EnaJj+04+QHVMvRnd5oK9hhar2/Mn7Zt3uUSjcgOmrBVkhbVjz
         DU97ehRMM80KqWdEx6aXURIDeWJh2DpWH1P9c8H2UcCq5ygG0sTNkhdUdLxmqMpVPs6q
         MrqZmdpr5aQD5gx8ftw1JfVHE5iadgBg3N4+1Lt8bvqM0T7Tan95yP2ON2aJPq5MFgW5
         jKHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793977333; x=1794582133;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x3QLozfCyQOXqamzqmwUwQlpNil8HpltlRmIUwTug6E=;
        b=0FDipfRnxpEpKn6YVZ6We9J0zGOJrLZjPIBD8/tDUb3cvkYgwqb1fguTpKGU9xwFax
         ek1ZmUIv0Ox9d/UN0m/7Uf4mGT6R+wInfT2VeSkHWTwcpUebw40nP8XrImF6NS6KsrkY
         8FseXsgWZm7Mu9xtCKubZmY4Kou7YVX2LscRPFbp6THFyglIPab/8InhN+JIRbo8TyfH
         E6fBQDwkI1kqr9/3yMWs/2dfdpwnv2fGr4qZDhGqVQD+ef57C847NMU7px9/a+G0crDM
         FT3BSLGbOLhlliPS7Dh1Ch/YJpv3oUs+BW8uMSa0e/iq9nvsfgcVK54kcDCb1dQaqS5I
         4grQ==
X-Gm-Message-State: APuU4Z/N8wdofBU5jiZKXjdD1c3ENudQK1hOFbejwsKPhsx6T/dzu4Mw
	F88zFJY/Cl6NZ1JtXewxQxdHS1ORQF1H2xitNW0R2/milRhp3iSUA5iiHEzU2XFyIVo/d+U9/+a
	+2cBsc4yAeW/lMaMuUMwrEwD+QCNHCzcqMHMLPXUjAwtTJ8XSoLVYq/MJe+Y6Vt2b6m149c2fxw
	bn
X-Gm-Gg: AYBFou2be5ibonzwPBn9BDKF6u5Wu753PBGMhSgIqrmmUUyDaVw93fliyliXhmJN12s
	BuZAgvTUIy7yGsEsmd2OPFGo14Zp5J0t5OouHL7eSh6ZVK8KwpZBZjCkl1DIW1VrT6vib5toVYI
	ijEpTov9rC2GJwaBaTE5FAcD1TRjJRn2J6p0nX4FM8wFwKpL7v49S/c3IDMB5oHXaMXVAtklgmY
	FHEMcLZ+BaefGahaDZX/EV2gRU5FLjUsqKQh/6SisCh8/J6ZnxBY9wMVOQjJuznUhZv3tG+trRO
	3p020O14osFLe2w5r5vhtAE46pk1Yy1bJP8hd31THKQgygkjdPlh/4QCE6iJJvdrq+W4SDp7gGF
	3v2xIaVr2JDJt+9mTrzOSybxIwIfvqLjNNKAAM3bezoTuVL6+61YX/lCGkAtZAqX7uRXvS81CLJ
	t1GmK22ZTP
X-Received: by 2002:a17:90b:580b:b0:3a4:b418:94ce with SMTP id 98e67ed59e1d1-3b0db5f6fc2mr2667442a91.1.1793977332426;
        Fri, 06 Nov 2026 07:02:12 -0800 (PST)
X-Received: by 2002:a17:90b:580b:b0:3a4:b418:94ce with SMTP id 98e67ed59e1d1-3b0db5f6fc2mr2667408a91.1.1793977331926;
        Fri, 06 Nov 2026 07:02:11 -0800 (PST)
Received: from hu-jseerapu-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0fc1bc1e6sm100032a91.0.2026.11.06.07.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 07:02:11 -0800 (PST)
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 20:31:21 +0530
Subject: [PATCH 3/6] dt-bindings: spi: qcom,spi-geni-qcom: Document QSPI
 support
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
Message-Id: <20261106-qspi_upstream_series-v1-3-21f43042dd60@oss.qualcomm.com>
References: <20261106-qspi_upstream_series-v1-0-21f43042dd60@oss.qualcomm.com>
In-Reply-To: <20261106-qspi_upstream_series-v1-0-21f43042dd60@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793977309; l=1658;
 i=jyothi.seerapu@oss.qualcomm.com; h=from:subject:message-id;
 bh=C58xMketS0t+z7bSIzaXbo2bSN49O8Fa6mvoWIRxlbM=;
 b=f9X8SstJaOTh1ZHqgsSboJwCtiukraMhFpa6kFNyRXhI0Nml5kv+MfcVpiY6beP6mpMSe9ePB
 g5MiXbB63ooDtkpJneWzUOrCzhZm/9MSz6TsCXjt2M5nAG0m68MBcuW
X-Developer-Key: i=jyothi.seerapu@oss.qualcomm.com; a=ed25519;
 pk=9vafyYsia0OnBKWSEwhmWe3hPVQfI2T1xOs5dPaFvEo=
X-Proofpoint-ORIG-GUID: qqNLz4Jaf_vYqZkzfmrsoXhRrYvXM8D2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA1OSBTYWx0ZWRfX+L0n7RBwgWU/
 XyiP5xNjDY93Z3OQtesiuF7MSmYvCpCJsSK+DCqx8t+rAvmrvZQ4DqxVe1ryodqbHvfmJs42IwC
 eu/7PEP8SCoRf2YohfH8T3RqFR3fUHZK/VtY0tIfPgq8Bx7mP7SiYG8DaoEDfYIIwURH+8BCDba
 xHaAbgE66yiAVTVFeJ+Q573XRHmYmB+jFY+LLm8WgZSo6t6GhWaD3mvmn4P1QfCwu7DlBLCBv5x
 1HslUQT6GH4O/49uGFO/R+lVqJkDGRzhMGB2bN2iZYbHWJMPVnag7e0ptBaRIULWkldwitHiHuA
 XbA9LanssJQBR/BvCJkDkYacNMWGAGgaYZzaW56/jX1Lh1271BgIiBqHwoP0010M43W7mJyFig7
 wfYQW0QODzuyDAcNcFThnrtgGYAx3TFMGMJKS3IOYjb/hG13U5gK7/bqQSlIMStYRgWzTe4+r9F
 J/hXhVi7/95l3+AEW+A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA1OSBTYWx0ZWRfX6kpKec1DJYBT
 +u3deUCAIcqKqzpVcwm77eK8EoSoOnnu+9l9MI1avuo3T9NaezUzpWAmk5UrJaKHsG4IGQD/ClA
 YrvJ6MyiDNNbA0d+HveC2cAD7k2XxCw=
X-Authority-Analysis: v=2.4 cv=WMzqzXsR c=1 sm=1 tr=0 ts=6aedebf5 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=KUikZgbwDMKjgD0mul4A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: qqNLz4Jaf_vYqZkzfmrsoXhRrYvXM8D2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060059

Add the "qcom,geni-qspi" compatible to identify GENI Serial Engine
instances configured for QSPI operation.

The compatible also allows the driver to select the appropriate protocol
firmware when the Serial Engine is unconfigured (GENI_SE_INVALID_PROTO),
distinguishing between SPI and QSPI firmware.

Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml b/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml
index edf399681d7a..e568b67d077e 100644
--- a/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml
+++ b/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml
@@ -19,6 +19,10 @@ description:
   SPI in master mode supports up to 50MHz, up to four chip selects,
   programmable data path from 4 bits to 32 bits and numerous protocol variants.
 
+  The "qcom,geni-qspi" compatible string identifies GENI serial engine
+  instances configured for QSPI operation. QSPI supports transfers over
+  multiple data lines for higher throughput than standard SPI.
+
   SPI Controller nodes must be child of GENI based Qualcomm Universal
   Peripharal. Please refer GENI based QUP wrapper controller node bindings
   described in Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml.
@@ -29,7 +33,9 @@ allOf:
 
 properties:
   compatible:
-    const: qcom,geni-spi
+    enum:
+      - qcom,geni-spi
+      - qcom,geni-qspi
 
   clocks:
     maxItems: 1

-- 
2.34.1

