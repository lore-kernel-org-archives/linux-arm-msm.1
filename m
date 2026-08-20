Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4323E0C76
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 10:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787220953; cv=none; b=hHm/xw2Eaw+9NoOpFflmS80BhhJvl109nzpqcqo9nci4h0Nqd3eDyXWA/06Los6ZKvH5z0D6/g/pfv5OkITHCeJZK4qQIUQBpo85Ufd1k2Tp8Lvx4/9d4yLwfT4M8X75znAWqMhCrncAT1BIefCr1HLktyWpLmXL+nivSHjkrvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787220953; c=relaxed/simple;
	bh=efBjfGOsvP+ouDw0Cdkr+P3tV+HFKOcqgBXTrfJplbw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Rok8yiM6yn3PEjB9GqMpQJja6l1L/XyBKbVtAPJXcyDsWdfpqUwSbREISBpTA+bPcHL5yqnFk+eyaci8gFgtiiZa035MyYD9uciD9UdWvKv3QJ++m8JaW1FO9H7ltCxrWKnO9cZX/MiMi9VwYYghWDDZcCe9Wh8LSNosXjl6JvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d24KRiQT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KfWlztgB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d24KRiQT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KfWlztgB"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K8th8I3515818
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 10:15:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HTXHScq3jySAp1LrX4Fz0QmrP9cXMZf3LmxSWbsjGSo=; b=d24KRiQTBx5m1AXx
	F+fSdMI3CQNc4A7h0xU4MdnSYkgxB5qkf/0Rq0WnFulPuNkk7/RV/qQuINshd70p
	5NUSQ13xHiKQ0CY9AztD7YVI+Qxm1jsk64OV0T+kqPsapzmTHp9LwENBAihu2dx/
	GVExUF+UL8JmLr41X4uxWpEqvRrjqBFpwmgYV8eFZ3mSxN/w3HOx1CV3WZPEYkkA
	dU77CbbNVtqSCe6m2EGGBXUU1QWPERobLGn+cGilU5QVdaXTVkWgg4kx7Q51MAq9
	VHmZlH9Hzipti+oeHBfRyJuK19uT8BhEoqUbMrqufy/vWKva1btUT7ZAAo7641Uj
	39AsCg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5xgc8aw6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 10:15:37 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cc5faecf01so42626745ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 03:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787220937; x=1787825737; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HTXHScq3jySAp1LrX4Fz0QmrP9cXMZf3LmxSWbsjGSo=;
        b=KfWlztgBriZ9mmFzIbBo63Yj2ccPszIqWpXf6xCKh7xEAykPRe7qZbcz9IEylwqU6k
         YXafF3Xg7fNwOJi6UaB+5m+o2Q/nF9eq1F6/RMokzmW5cuTrsZtAvZpjxMfRBPgGLeSj
         i3PST6bC1lGCjBUJ59Gu+S1yNxH0zoesbnsXIIXnvyMkG8ZB/yNd5iD3YgJyoiTRJ0b2
         MfF9aLlqyeOaCWvOOvOnrfrrnzR/e8cMxd6grsyzI9aK8wcN9elK4DaxBKZgdK+gMGbX
         IKxiN3vwbN9+5l8x2oB81ynvCN299V7Lv5RvvJ5VmmjBHI9lrtg3P2oswS9kLclt/orh
         /2Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787220937; x=1787825737;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HTXHScq3jySAp1LrX4Fz0QmrP9cXMZf3LmxSWbsjGSo=;
        b=IvCAQ9bIWrQUxSXOoeQlPfe2U7QObA6XgZwWhJM+XDiqXr7p0DymoaEdKVf7YA7DdQ
         CMwHN3qFnCiscWoWnHWZFdWjHMz6JJzCcEMM6+DOBnm1e1WkdOIiw4Zm3yWQOAIp1JUK
         i6goej013RKRI09htxSNyLgrnH0KHDfZ2dPbu/wTou1IlQn13jfUQqxKkLiNT5uCQ9pG
         keWchv0gocrjz+LOvaAXm+MDNSL86GcnehDvEfonk9B9xrY3iUgD2ha9XJkTtJJ7FFwV
         w0bIC0kw5PqmJPm2rnz2+bTCjMOKovS6keYXjvXmR+y/Skq5bguZfb9ZhhigmCl2+Kpu
         M0Qw==
X-Gm-Message-State: AFuF++nYGBb50j4TqjPX2Vu4y+K2fPSDm1Gros5kMmi5DNIeYrRsInDs
	JYrlKmcaZkZHhoVVvfn0mMKyqh++zLZUhzZrpf67qDjQytj9Nj2K4LGCu/LaXkpiSccNVTbEESH
	xLEjxljFrJ1qyhKNp2thT4WB62AeEMrH4A4WhZMJKhDcfq0P2UbDhXvWOE9FO8Y8bi8e6WVYKi/
	aWLCilNA==
X-Gm-Gg: AR+sD11UK+eA4D4/7P9Ikgfh0+NHy8m8QpxHOgwg7YLD3tR7FMD2zL2GgLLtvw3WWfL
	ExCBFaVPdBSfsvKY0b/MubPsIE7mw2aUYmliNvHVDm6esqwp3dnGH+0MbKTo7IPKoiP48/OOxDh
	iWL4SVS/BTC6E3uM0sFI5g43lse518psimi8gXRzMp1n1PxtKYQqbgE0DvqQ2ysfClQGnoStwsw
	3ebVivEAK+/Gdo31JErgUocCXNL784vBotpflnSfWysN48koaNC85r1PTbjar6qtUSv2xQpgg1B
	ilFBaW7EGaQO18M13bUVxlR+uIpqHgf97y3zzR4yvMa6dZeSwYbmuZSySIO9dM70a6uFpYlyRZ/
	8pundPOHb
X-Received: by 2002:a17:90a:d60d:b0:390:8361:a532 with SMTP id 98e67ed59e1d1-39580bc9ad4mr23004587a91.7.1787220936997;
        Thu, 20 Aug 2026 03:15:36 -0700 (PDT)
X-Received: by 2002:a05:620a:4142:b0:92e:8a84:7041 with SMTP id af79cd13be357-9371e204e49mr974226885a.8.1787220543906;
        Thu, 20 Aug 2026 03:09:03 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa1755b2sm134966935e9.11.2026.08.20.03.09.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 03:09:01 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 13:07:13 +0300
Subject: [PATCH v2 10/16] arm64: dts: qcom: sm8350: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-qcom-tie-cx-to-gcc-v2-10-e67ea30d8b7b@oss.qualcomm.com>
References: <20260820-qcom-tie-cx-to-gcc-v2-0-e67ea30d8b7b@oss.qualcomm.com>
In-Reply-To: <20260820-qcom-tie-cx-to-gcc-v2-0-e67ea30d8b7b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=985;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=efBjfGOsvP+ouDw0Cdkr+P3tV+HFKOcqgBXTrfJplbw=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqhtIC7aOoVhqMKAKNLuRzQ6hQToZB7qHcsAm+S
 5vIYyT7YLaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaobSAgAKCRAbX0TJAJUV
 Vn+ZD/0edF+jA4FFWsIbwB8znExVCFrPOBpW8EqPhTPsLwEHddD8lwMvnYIfdj5s4FlWNJayh0k
 WMGZmDQ5tYz3HXBE3twNCfSb8cwU0wYBmTA2iDp55miiGzziQU2g26922N2pZsfBi9rjdAhF8xX
 Aam9llXyVPXVZj7VHfmCvJnrVv5kDkZ0EBCWcwyiMC1IcGIbU5i5c7tnrry9h14SFtv/ebcQ+i8
 yU9WceAi+G7d+2WrsEoonayTqUzkg0IeLY9d/F9mr8a2RUEKc8ZDKkCQdKpFJQoyEniZndkh2j+
 UgTNUBr158xzRqphZmlSwa6Wbflz5YZWYL8LmGjZDHVO7S5Ikz30HnABBnN4NRSoJMOwlm7cbtJ
 6ALXNrzSkPmJaX87un+B2GGOrPg0+r8MdTO/eUp06Chgi7BsmxkHqgtsfY4DTq/blv/UzZWleVG
 JxIUhvcKXI+0N0L4h+r6M6bbD3X9Ue4sutlW3w5KJvHD3nFL6KzuBzDOWWX1sLmoZVMm3JRF94G
 FUvIZl4zdG2FAcxA/H05OkzQF1rkYC/O70iB6WGwOOVI1EjV1rWrpbUrfIVF9Gs17SMa7AtNGkM
 HGKz7sCxgshJuSfEgEr8RZuCW5ljv271ZGINgK7haQVIwsV7tTfBedCRSJqwy2PWYayhSg4IQdO
 ytoJBxYLUaLfF3Q==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=GPM41ONK c=1 sm=1 tr=0 ts=6a86d3c9 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=S9gNOWPKAuR5AUhlrlYA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: CMF0l4UUELk_JwccEZE-I9f_FLpk9ziX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA3NSBTYWx0ZWRfX/jmphkGw2JTs
 UHIuuFePJTrzUC1PBazi6maCMiyeMsaJXVIdY/GbwKEXBELwN695uRh14vJuXpYhA8Q62eoqTyI
 Yw6koIYftre1f3hKt5vp/n8sHnBlU0l30scIFz+MdN0spWL/U2Q7UmJvxTWfzDE3yInO63VpwgC
 sHBYeNmUBhz3rER1/xLuS+5vUOdEzBXcLRV7e3g5Z2MJIrVEDZCwIFwg4rfzO9YMPFtcp0iiy1b
 FB/PUKJlAkHpb1xjrQFLw7VOL66164qxMx8rJn3sl277t3sFdj+2o15s2UBumrlfEgO3Zc9WLVb
 By+6tt56ZaO7incS80CT/TnyugKZgksdiGhm2y6rimXrbpwuuByJJm7nRITVJGJAl1X/3LZJ8iB
 mNS1kertvoHCzFG8mCPuUgQB4z01LP22fVmc0baXPLeaymKXaJUBeI1hjvST3Sgs9ZsgeyanIZr
 iNg4IQCzzFfI8yXoOfA==
X-Proofpoint-GUID: CMF0l4UUELk_JwccEZE-I9f_FLpk9ziX
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA3NSBTYWx0ZWRfX0d5kkGZ3QdFf
 6nPhrU7gVqsEvEjUovijjsSPv9h6MCVt5W3bPsndrtF1Q0uoFuGxqynkq6joKejJV1+YKgTZnYp
 TOzEl36J0EP3mnxTcMG1cv7cSNhE3wY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200075

The GCC GDSCs on SM8350 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 32b47f5ec1f6..84012a407c4b 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -699,6 +699,7 @@ gcc: clock-controller@100000 {
 				 <&ufs_mem_phy 2>,
 				 <&usb_1_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
 				 <0>;
+			power-domains = <&rpmhpd RPMHPD_CX>;
 		};
 
 		ipcc: mailbox@408000 {

-- 
2.54.0

