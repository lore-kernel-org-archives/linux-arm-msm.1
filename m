Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7D2442FD2
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 09:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787131944; cv=none; b=bg3bZ3GMOtScK88Ej8SNeO10tiqhq2Jd3o+w3wEnqGhvJ7EW31hm8Ej3dF4+L55QWneJ/D3mv1E/JSF6ZJtj67ysQkDRfWFH9IIr3q4mgUPLhw2I1Qdvyp1Pt9ljRGrQIyW4Qn9OY8jBSnyhtNPqZmM4uFZygubU0iz5eAQPK/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787131944; c=relaxed/simple;
	bh=TXkhaj/Jl6oCkpT6g5dVdv+O/7W0Kl0Yxxkn1XRDfDs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GoI7zo9twX8KAYXoFwABehF2ArFXiYuR0CS0ftPeZXiS59qUjbEiuSEno/hq41pU+AfnN3YV25Z7Xi8xZV6uDgUrds2kon572iOgq2USztinaDt98YviPzPzQfKgLwkwJYIdXe2fN4QzLFICWotbmcUVJcWyYVaPXa0tHE7TB4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eyOk6Iyq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QBi4iJ2M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eyOk6Iyq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QBi4iJ2M"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67J6ZWv63691944
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 09:32:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=DLMykc1Q8hx
	xzMIFfjk6jSgbJgX197Qfs4s9ZG7KS58=; b=eyOk6IyqQG7MTiiki4Y2lHHg5Xk
	l4ggwEvpyyVVGfmSQmMM9CSUIGNYzlJ5mNpR32SD5SD49Fs+GEj1BDEMT7OQACKp
	CCVUqK4Fm0RLUr6wcCwoLrtDb/tLDPzj7KjHVvcs1YK/GLzoScSHZ/ih9byrH7xW
	QxEKiEHCB3PAVMNibLU7X/ZEhZjBYoq7k0g6mR0cxnASMNC1s+RjajqSkdtt4SJE
	JpL84AdNwjCBBIOJDonBL0Zp/oQYjM3AUaVlOZaxFKLEDeMm/82WIy6xwzru8pBY
	OMRuUpD/tRsylr2NxAmK5k8fbeunS36NwgGqj+3qmSGL5HiReAA4zkKHvAQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfkaf3x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 09:32:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93494cce712so109789685a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 02:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787131941; x=1787736741; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DLMykc1Q8hxxzMIFfjk6jSgbJgX197Qfs4s9ZG7KS58=;
        b=QBi4iJ2Mn33hzCfNjRKzzDddIMK2AYyztc4p29j/9t8livM7OY9mFSdn7QyN2EJUo1
         nBs8+ZkHp1a3spBK3d4mVupneuvoex+d91qp4nsP7gnGafj5qV5uyB9SLnnTjiGShufw
         cUGLhZ64d35WkKbIzFT8/1LI1QXQVf58sDTzMMHMQZIa5amzZO+ivpvNWlyAA5H5acNH
         FZTOy/9cO7EU90n0uUBgZBamnLGw1hUuOZ2QNURPfjseHxkQRFDqww93H4U0y+6K1U2w
         IqnJYMDT53KJeErgX+aGz45JMBaaALrmrp3aYSbjgRAZWYVE3xvewP8Nh2k18IPa7OPT
         09AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787131941; x=1787736741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DLMykc1Q8hxxzMIFfjk6jSgbJgX197Qfs4s9ZG7KS58=;
        b=gK+KUzYBBtbegVp0VeoehHDb5YZHCzRgJwx1qv/LVFcu4h4Fzng6+qNlFYTHnrDs8c
         4YXdXZcnDcRvELwfzUgcin9TrvEa2By5+3/hZ4UKZuNp9kNXTqPJn1YX29pTG7OcBf4t
         fOso8/72DMIpfZr3oMNmaMRfowJYr6bT7ZGMb55byRaJrqmJxJKcEuNHLvcu3OelNXu3
         350QPo15McMDMutMnatscbHvN3M+JJHg7cggku+YyHaRsIZfZAjRku9on3w1Axe32tD8
         plpmOkr5hskVy8rMbBsEwgzZvl1jG3C+U+cTzsNNXGgmbyXdHG2dkPgLBEZwmpcLvX5H
         nxUg==
X-Forwarded-Encrypted: i=1; AHgh+RrAfw0FacIATYvctRWi4qNke8oixLOJV/Jb0mnb9exw/OPaJ1pMl7vEqaf1FgarVsSl0Tvc+u8Gwn5o1fhL@vger.kernel.org
X-Gm-Message-State: AOJu0YwpcTyFfeR5zNVPAickMBEQwckdCctnOF70c7npGjKPZVZ3Rvao
	u6JyvS0A81cdXx9Z4IAuFv3tsbwBPM6VC6JuAt6xkv1RCBPl6j05bBZ6dPf/XUCD+qTTtpcHHwR
	axbNB3LiZfp7nlFwEhnSmLTJlfefWSIgzsLQvWjbnvGg5rNFOppbiT+qQnR2IiCgK9V9I
X-Gm-Gg: AR+sD11HvZTZF7LAbVV/2P/9F7y3rASSO+chxIw8P6wzP9NcdJW6VQMBhsngIcnZdnC
	Dus6gPdp2WIaRVx3BitBrKAHItqQ1Z9jxdYnm7YPXHW7E8/swCoqoAACBKpWDGLNOHCOOzXBrm5
	LTbR3yccjUv8mZ3YR65L29gIl3Keh3kkl/ZVqI2ARzkWUStseXWyrD0QhNt29g4STOdiU29p/xh
	/38u9v+veGYhselveXx8JTy3pmzTNKHFPvoPGQw4+UZpkWFlEGjx3QpDCo4d/5yUFfO+Cx/RgAJ
	7kmDnqvKoQ2Ovs+cnMZxk7e9Va0OFAp+qpRN0N3NDWXV/L0lS2irouO1ekAd6ywq9pUzd6XBECa
	HdMbijR74p7lCmvddS4yhdsek
X-Received: by 2002:a05:620a:6cc2:b0:936:dbf1:f4bd with SMTP id af79cd13be357-9371e6750admr268879985a.47.1787131941082;
        Wed, 19 Aug 2026 02:32:21 -0700 (PDT)
X-Received: by 2002:a05:620a:6cc2:b0:936:dbf1:f4bd with SMTP id af79cd13be357-9371e6750admr268878085a.47.1787131940639;
        Wed, 19 Aug 2026 02:32:20 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14b8050sm4402835f8f.19.2026.08.19.02.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 02:32:19 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Subject: [PATCH v2 3/3] arm64: dts: qcom: sm8250: Add CAMNOC ICC provider node
Date: Wed, 19 Aug 2026 12:32:11 +0300
Message-Id: <20260819093211.1436275-4-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260819093211.1436275-1-atanas.filipov@oss.qualcomm.com>
References: <20260819093211.1436275-1-atanas.filipov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: xYH3ic-Xx_HixfVMoH1RtL9OwjQm8CIs
X-Proofpoint-ORIG-GUID: xYH3ic-Xx_HixfVMoH1RtL9OwjQm8CIs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA3MiBTYWx0ZWRfX/kgR0Oj3CeDC
 DB6zdNoIU1bQbM4+iXByWeOr1faKrulT8t/ctFpf7Dc2np/jSps1EHMXc94bqBBnfU9fTfyqjXe
 P+lcXslCe/IqEEdD1OU1MGXecEnuJO8HhntObAlvXkLwpzJZ6wiCX0qvPgxvHZ0yz1oo24KLrQn
 Q32QO8ykcl7xlupqB17GwnLvbAB5bdtU4sgrdg8lhqX599ShBv1R3f0OlPfXJNP6Jm2WlFMGlgn
 u3VhreJ+wHZm9dL0ObuS8vGi7YGTIm3HDxZ4N4j2ZeQThe7R55aaTaXtoraSAZL7uOIMJ1V6F+X
 AgTC+8S4QAw4uqKmrQ/7PRfHJMqwUaiHLdGrb6TJckkxUZkiOZW/IMzbMix9mTSd+C029uAzt2w
 kI/NNFSDeWcM72Td6pQP0X8CfJi/DLoJR4Z5S/sRV5IlpED2nG1T+eAwXIt052/aHEbAh/nKPY7
 FjN1+RmVt75tXoRJNVg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA3MiBTYWx0ZWRfX/H3MhNM402xF
 CTTHtqEkeGSPEfz1bQgyi2wptSwpheTEsmXpOxnv17CGCTlJ+7PKr2mcbmKaPBvXMY84ZU4sEEF
 VoEjJCC89MCEs5xt5lvs1odfC0LrjtM=
X-Authority-Analysis: v=2.4 cv=fvfsol4f c=1 sm=1 tr=0 ts=6a857825 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=2QlPqw1KTIhM0t8RAAMA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_02,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190072

Add the cam_virt CAMNOC ICC provider node alongside the other virtual
interconnect nodes in the SM8250 DTSI.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 7076720413ab..33535c83a4d9 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -11,6 +11,7 @@
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interconnect/qcom,camnoc.h>
 #include <dt-bindings/interconnect/qcom,osm-l3.h>
 #include <dt-bindings/interconnect/qcom,sm8250.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
@@ -377,6 +378,13 @@ qup_virt: interconnect-qup-virt {
 		qcom,bcm-voters = <&apps_bcm_voter>;
 	};
 
+	cam_virt: interconnect-cam-virt {
+		compatible = "qcom,sm8250-cam-virt";
+		clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>;
+		clock-names = "camnoc_axi";
+		#interconnect-cells = <1>;
+	};
+
 	cpu0_opp_table: opp-table-cpu0 {
 		compatible = "operating-points-v2";
 		opp-shared;
-- 
2.34.1

