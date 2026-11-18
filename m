Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794985417;
	b=bHgJ4D3QH/d5XOoSPAPW90z1uKIJDr6dHho4QH0eh2ci5DwanGk1qUTu4RyCS/tS+3NP
	 IndEijCNH5TzaDRHzBhPtfq4Ybrz9rm1Nv6DuBeI+4MaXyeODX/ySVHiReWhxLCtNT7k3
	 2UXfnoxhxaBPae9N/DKbrvq369RE7J+IoRIGajLx9scviXEd6g7q5dwvbItRtJj0d9fzh
	 W/j8zLJFsxzODH8qO2L7lJVDNwQ3BG6dPJAgp+52UWC8LWv+I+Mmn62iB3/UCS3z1lafL
	 CWnKpKSXDt6bY0oMwfMwLjHgVU6uo+8XGu1quyZ76nVVABVCgF7sKRoWqjnsG692FQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794985417;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=nYudl4zTAefEeFizlvHawbzEC43k5HGyy6GITX53aNQ=;
	b=XkO0n6wAGnbfeUCvQSHf8tsiJKjHu3znOGAAmFBvb5xHMdxzeM80P04CNFvVMtheP8IF
	 sqI6WGzD6Sxnfw5n6gqQCJhCZM4ID/VBud3qS0iRrbMrmI5Q6sRbsTgM3FfhXEkbeXcnZ
	 OflxHm4CkB2xpK8VwinRoeM/hqBO8OSx4TTbegp7I53hmvnQi8ypxvq3ZnHbJKRcAZpSF
	 x/sfhuMwgtP/HmOEpDg3R733gUdqCp7Vs++IMrjDRhORdndwbd/38EEmYAWIhOgQ6Q3sd
	 FJytpXSEuZXMz8cVh0lJN8RYJ22Yd7tlWKIzq22t9iyAOCa5hQBz1ZfhPPxWaXiglqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l5Jn+c3L;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GotCe56r;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B23606A32F
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 07:03:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93B23606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l5Jn+c3L;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GotCe56r
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V46l3121892
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 07:03:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nYudl4zTAefEeFizlvHawbzEC43k5HGyy6GITX53aNQ=; b=l5Jn+c3Lbvj79i1y
	26zcJSCI+fpe//GE1FNW8WYQBNsA+DE6eNgrbBl19vLEgJDzVE3dFgv02SFAR9vj
	LvcvlywwqXi3H3LjQvR9fy7kDb0p2sAinGgb124MRydFwkenJdcLPOIUCIKFYTb8
	jGbUW6l1gDkDExd9eRCgrjEvGzWD9iroHMSXMw728hejvbmFlGc64+HF8jXr+psV
	dOGrALCqa3TJutq+wZ9PBVu2+4x/L9tf7nzDnJq0MYL9dP7P2JnNimsHUgk20UNQ
	wplLK/G+VNRP3FEMthCB7cg25enSD9XQI/mIiLt0TKBp2m7f+NraTI7YKo+eaDyw
	8tQaOw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9hp9j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 07:03:35 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2edd25534afso5298445ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 23:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794985412; x=1795590212; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nYudl4zTAefEeFizlvHawbzEC43k5HGyy6GITX53aNQ=;
        b=GotCe56rROXBTUPIhpDdGC72KsiC9eG1NQvQICEdDrx4ZkLwi1Jpkbt/Zvrs5cSnY9
         Ao2Q33L48r2AjhIY9z1GBkAJZOUWpeknihXppk+pE2fTr7YP5y3OTZIdd29Sa9LMYczS
         E7hgxV/4yLD4uOFnMBqwda6/7+Ez1mTzpwclFl7cS8+jdAcUXDEn/1wae2L/dR2g7qws
         iU0RAt/o9FXCuAzBzDuvm/OmpmdTjSjIroZEJv4ltvpCnz5MNFB7fUGdM5GUoXz9cqwi
         XXr5s+WF/D7vBU43EIpzWHi3qK5bn1p3bBDpOVNcDWvtSIhorNlLnciTgUyz876iR66x
         2rhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794985412; x=1795590212;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nYudl4zTAefEeFizlvHawbzEC43k5HGyy6GITX53aNQ=;
        b=jcu9aqOGYtHpdvrR/GGPHedq7drgv2kFISiOSNJVk5zieHzE845S7It4GMbJhhePef
         KxXxOajdGV0EXo79lX8qp/ruqxRXYM039RyKckZ0XZPTKndhqDf7LA1tR3Pd9gbfQYoc
         luFWt6Gh3x2ZgYm1eNgSktM3CC9ypY4OGPKDj37e7kLAcEPkhMU4dIar8BnC08QRwVYn
         paUTLzzneWnieHdCfkVuRbHU1MQQJuXQWq3ZRa9X4WqP7/zDCsNYeI+QMzH2biA/3lw9
         nVQKQIL87DayMzSGqYpwTIXkGjI+d3jmF6UuUa7o2wMOyaoQ2Aq2iT4gOGk51HJtcssb
         m+Jg==
X-Forwarded-Encrypted: i=1; AL+hErF6IyDYhsJY30DBXARFN8YSdP7p1fzag15fHAaZbTikq0YnXysrg4R5DCNMZ23U45ZTEMmv8pC655FdSqjd@vger.kernel.org
X-Gm-Message-State: APuU4Z/lkGxIhZI5CN25A0gMmPKKGy4MejP3CHPeda+f6BpEaPQc+b/x
	fI60xqADOaXquoIMM1YumcDtRCgHoedovh6nMmMuzQ0qwo8i3vx54Hiqm3UDFkSUZUtnNIT48vQ
	Nkk3RzBMdrdv7Ff3dUReeHMPQ23B6EVeBBTU5f1oal9SJLoE20v+RKA9hTQoUzd20wO1n
X-Gm-Gg: AZFdTZeFuTIqz46eDrjEhlAFFvGVghhkjaqxdJwPY71Re7w1pMOOOQ8tTLwnNTZyddh
	QFNHWWb/bsBVEtYbBGC0f+UnNJflJNmmBJIR0OXwl58CFs6DBQGUBD83t8UEbIM5Dgp4X9/245X
	0LEAIlF6G+yMeyFnrLpUrbNXaD7E2ERPnf2eTr5cp+Mey85GNi9Hv/AQ1q8FDyZZKcl+ZCYipkB
	GH3WHiiERQvpZmK1tSMPO5RygC2Iu5lScc6pw2ACiyRNIu6IxqbrlDKxkDit98sUDx8pl7eKvjJ
	hgHT7SQo0vxUNXO1cT2CX9V8P00fCUllJ1axpfp4u9t2jzZTfi4F/z7Qm1ZXv/ZmYB0XFg4fhTo
	SpXiO89P2Rm8ID4lxg/LCESRHoahCXK+UhK1DcPOGdkCdVWrmApqRpdknV2lZwLJbLopIJamPiF
	oggyyIk6C1sJr2jU+ghSEdmaAuVUwIUs+TdeyO
X-Received: by 2002:a17:902:e842:b0:2ed:45eb:51d2 with SMTP id d9443c01a7336-2eff753ebb5mr17146005ad.47.1794985412386;
        Tue, 17 Nov 2026 23:03:32 -0800 (PST)
X-Received: by 2002:a17:902:e842:b0:2ed:45eb:51d2 with SMTP id d9443c01a7336-2eff753ebb5mr17145685ad.47.1794985411966;
        Tue, 17 Nov 2026 23:03:31 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff6181433sm8341825ad.29.2026.11.17.23.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 23:03:31 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 15:01:43 +0800
Subject: [PATCH 1/4] dt-bindings: arm: coresight-tnoc: Allow
 arm,primecell-periphid
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
Message-Id: <20261118-fix-tracenoc-probe-v1-1-0298dc5f05ac@oss.qualcomm.com>
References: <20261118-fix-tracenoc-probe-v1-0-0298dc5f05ac@oss.qualcomm.com>
In-Reply-To: <20261118-fix-tracenoc-probe-v1-0-0298dc5f05ac@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Rob Herring <robh@kernel.org>, Leo Yan <leo.yan@arm.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794985401; l=937;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=TeVraIqhbDFHZcEPeLmrE50XglecDEumWkgYuypCThA=;
 b=byINxjI5qiUFjrVT8Bd6ZQoPOic+g2n5taWi2o8FjBhnbse+GRwC2RK/L16P/24gQhz/+MsYT
 yuyGYk7udgmBt9gJSil/WahGpzjntj7Es9LQKr4S183cz/GRtlfCrHm
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: I6YCAZ9-LDzkdV7UWujkwYykEAXOcV5h
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNyBTYWx0ZWRfX5vAfRRkm/gaK
 xTr0lUBh79fwyiFXvOPo5if4XTlztphfU423eo6d7XfLHhFVA7nLdOfUP8ksf7dIGGy7ITk+/tI
 m4GT4nBk+9SJO7ldt91TtY1aGooly6M=
X-Proofpoint-ORIG-GUID: I6YCAZ9-LDzkdV7UWujkwYykEAXOcV5h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNyBTYWx0ZWRfX5niaTgejtIrg
 MWTyaluY9810N62RqNxnJiyMTtmmBbyv7eKzmIqoSL9sPoZZLGFJBJcWFk7Zp75KisLn1lgh7s2
 bay4Go45KstBm++iNdXMqBIuIPbGyYUAAbCyc5BCRSfhIc48RuTC8wcTkgMU6jfr3GTXCYKqmjt
 TbOefcSppV+KJ/ewfKWbyl42/VRUBioW78n/5LtfedLF6KFUt9o5Vyd5oBs5SqvXkqBSKL3swzx
 SWXry1k213x70jnW4IC057Y+MnijOf5fIeKlkVbjWkOqHbTAt4gFvGltQcRJRm81LlinXnYPVpF
 //SQVyKYlRGUAtlUofkGb3NavLfjbttpKgQHT/bwvSlIAFadOJ8TCOmauC3wc9hDtyJ7NvD+mw/
 RozdlUvwSq/MXqLUmzSVdjPJ6ZYz4snpCI3N8vnfK+zhQJeVFf40g4l4aZVdztIGJtc9yN/+CVN
 IgZQVbt0ev40c9z2MvA==
X-Authority-Analysis: v=2.4 cv=RYIFmFtv c=1 sm=1 tr=0 ts=6afd4dc7 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=bweLdJAXwlOP5iKYJ70A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180027

Reference /schemas/arm/primecell.yaml and switch to
unevaluatedProperties so that the TNOC device accepts the common primecell
properties, including "arm,primecell-periphid", as the other CoreSight
devices do.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
index 37147124449e..99ff8d30f34b 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
@@ -78,7 +78,10 @@ required:
   - in-ports
   - out-ports
 
-additionalProperties: false
+allOf:
+  - $ref: /schemas/arm/primecell.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.34.1

