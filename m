Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795718306;
	b=dV4A9nbmMg66v/SFHD3NLLE8z401C82UIpio7ARAU3nkIDLJ0iA5W5MiY1+3bzouTTs7
	 B81uGOrpDcgaTtWunu7iCm1Xf+I/b6FWHdwu3jy/RIrm25xD2I72gbs/fz/jFVtdrbVgG
	 BFi1DSIm8yEQI0mwk3Ds48d4olwRPvoXeHGL3b50sKHvnPUd4DfIbgYsVjprRjgBHJBmV
	 f6apW98hGC53I34XeiermFvuDqt95sWq/XTp5qIZKhB+KJknVk0Jm6NYlgUn0MsGexcw4
	 bIclprtQowVWcCL8ll8uQS8YCCnGaiKPgEI3tfS/cYqMB+SJvD6MzkSCfbR2Tu446kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795718306;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=nH9UtRA+iyb2/vmAvJC8ZOQys0hsGZoyHduhbYNsrOE=;
	b=SEhUFurQm7aEbGp3veNGD9yjLAsl3ltl37fzLqzjMtSg+K4V11zZRKlGBoCDbjsbvSD7
	 fXPhdb5JeQdhhK6TxFVOfzJ/4lGmFCNOJR6u9+qeFGCUHVLgLW8w08RiuKFvNoTPIGUX7
	 GJVr3o1+nzcK9M+uVKQbVKdH1CuWFA8HgmoshOiQ04HeTprKQtchZpz6d2g2EjTikSXCe
	 7g+ack4w1kK08/fVc5sScE4k7ONd3zglgrT3Z8QlpzZMjikMQXKXBrVFlZpyiB/Ucp6+M
	 NFb8HPHOWVmMAKjVLhasIsH85czTu42I636khGNJKfpOCiZkzfv/Jn9mYSUN/GSLq+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WW5cN8+2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JiAV9ePP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38730606A69A
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 18:38:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38730606A69A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WW5cN8+2;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JiAV9ePP
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQGcE1x596877
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 18:38:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nH9UtRA+iyb
	2/vmAvJC8ZOQys0hsGZoyHduhbYNsrOE=; b=WW5cN8+2V2noCVEsOBkEE5TPXCh
	gTqFl2XcpTGncgwWJWlyGdcRs1G5/mmhUqkCaRlMFkj8pMJq/PLusOuMvxKdzgEm
	4zKw4r/5qo+qwYSDtDoskm3Vqe5tiIsRPQBxTZmV4whQizrAIQot8udq8kciREIH
	DEhwbTZJSYd+GEpYnCUX+kCAF1en799LPpx8B31lcAaRWtCteI3xAuD8mz07QUmb
	LUBfknojAU7TQrkAsMXj6SxX6DkBO47s+7QjHFjW/Hajcz5WNPvP7rOaHISku22+
	+8zVr60NUoK+R+fmSO0JQsq9jTJ2J/kAgaacdV3C1k9e0iFoOGtxJvprc2w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6rf90c0k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 18:38:25 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9496ff065bcso979212885a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 10:38:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795718305; x=1796323105; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nH9UtRA+iyb2/vmAvJC8ZOQys0hsGZoyHduhbYNsrOE=;
        b=JiAV9ePPBkVuJnLJU/i0dQLFehvSbMjSEOK+aPzzohQrobYxtC3JG5VVuBZ7hWkFOs
         E0+BI+pqpdF9sj1ZKCxWEGbqnfChdfd3WOnNHM9Yf0+fN6M2nAe7W89QEAGFoxGzLCuq
         5SQEzhp1/70vbIa2iB2HNt+Wry35sIjpkfKo43pH9IE3AOENpq8S29/hBH3IZFArnw/B
         VklGy3tmNCQZtFoGMiq7Jbz79de+IiFJvCGdj0waBOJtDu+1yUSxzaAp9xBEEQqNptHP
         zgQAQTK0afJH1+6s+9B7DS6xgwt2c4ACq9ghkMsgag4WPRZBQa1moFWkQqo5RTcCgBXG
         SN2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795718305; x=1796323105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nH9UtRA+iyb2/vmAvJC8ZOQys0hsGZoyHduhbYNsrOE=;
        b=FeXrzVGx7uCYoTOOJb9tsUC8wgI1RvIYzEvd9WYWJ9Z7wlcF6RxE1roXrNMPUC5mAf
         3cwOh5e6Ywz+zu2uxbYZkkVzxtwtCVHDeJt/2szJcPW9i1QYh0Je4IjK3+NdTRHCsQVz
         Aswrhqtn6NutV7OaQoj/sEY8VWc1fv6qtdu18+UVEyDsi3psBRjn+gUH/K9mNXXFNoA0
         UUGxnfFVYyrJha1INCCkV37tE/D1uBQ7Or0W3eZLWSKYzJaxoJxd0iZj2GTT/GGi7QC2
         n1gouJF63FvYlj1q3HHj1Kk/Rp3WFAIVP9PgJlu7HD9pcBYlsVnFHXdtA3UDW/XhTa9Q
         6PQQ==
X-Gm-Message-State: APuU4Z+oxgkHetOYhznP9K2BFTl1ofg2MvlgDp36zA9NLd57qVeI7png
	e9q9VNCXVQtlMvku7UmF6sVCiY9Zi9Ir99AvEKErpAuF6SbAs1aWeMf7grd6owIPefGj3QjhV1r
	bR1RiDyjgq+ZWC+lwbqLmuQMGvrHosOo9Djcq0Y7lO2j0PsCehckSqprgslnlADBthcfbdx5Itk
	+4
X-Gm-Gg: AZFdTZeWREC1CNKqlk6yYjISNhDXEnfIcTz+7w8I95z0AwA9U9jtPunNMZoJ3b6kcc4
	gczV22gZOFqwQHBy4HF0nJ3q+W+nxZ73k2tKbZKFwkTICzmIdNJig9rbEDfo0T+Fqcu15VFP3LV
	i+SBcjDAEbmX+C3kr0neKFyjPtkWtTfdzcihIn01ZQkGvcdKRJfakpLMkUPw4ZVdQ3Hlj0co2F+
	+VSBtA2ScLRNZ2rmHjmF5KzY/dmUXTXjwOm1n+5/MgpyGQ7Tgva07XcStbdKnxjyXyWUgFGpuYs
	/C3b8tVHhk/ixgYpJ90Dar9rhThqRb1wNM3+jlsLPA4SoHrGuAvg95HJrvumcc1N+4NYBZ9Akcu
	KEhNHU0ASWVVCzreJr5GyMcMG5JiaPLcgZt1ew8UiIkkNzkH8XNF+XJUbz9Rn5W9a
X-Received: by 2002:a05:620a:1b81:b0:949:6a66:66dd with SMTP id af79cd13be357-949ba96e873mr4223073385a.21.1795718304571;
        Thu, 26 Nov 2026 10:38:24 -0800 (PST)
X-Received: by 2002:a05:620a:1b81:b0:949:6a66:66dd with SMTP id af79cd13be357-949ba96e873mr4223069685a.21.1795718304127;
        Thu, 26 Nov 2026 10:38:24 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb895f7bc1sm239659035e9.3.2026.11.26.10.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:38:23 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, konrad.dybcio@oss.qualcomm.com, abel.vesa@linaro.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 4/7] arm64: dts: qcom: glymur-crd: add DisplayPort audio DAI links
Date: Thu, 26 Nov 2026 18:38:03 +0000
Message-ID: <20261126183806.172485-5-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261126183806.172485-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261126183806.172485-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: XQIB-_arpMpj_12oaVIat1RQ6DEami8l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA3MyBTYWx0ZWRfX9jYMCSNYp7IH
 Jovv9X9gVP4+sRoGSR7SgmM1HBP3hWbY3Lgq6vIetyYKi6SXWY0w3AOx416a6DFY2CNTnoVep3k
 kCvwa8OgAGgA1INZL6sMIbRNbDeS83FMHkusViMdIyHHd+82qRR6+Gzi6yx0FCcwCf0KkO0c8My
 EZ9tiZ7JVC20xRHiQCpDIXuDnt6fd4heTbmc8tykJtdJmcfNexft7rIEIwfnYw2vnn2+BUu0UC+
 DFKCRc92ORQs3UDGgvHJmjx2SicHXO8arLYMrq4F+FQAoXCDPQ+e8fos05kuC0TtCcOfRKLnuY1
 bKKiK+Ac8U3ojT97oyhlu92rsXbwgjRA5zrtSx14Xc46zU+dCo6P+ejJv6R1OCj1hE2OOVFNRA1
 9cBx/OC9x8ftt0cEBTR+5iCJMZGSOyjcYbCBvV8t3a2pwwuKxFb3ADBf1617EfERE9XqEmwpPy+
 iCrs+Soi2Lc2kdwVJRQ==
X-Authority-Analysis: v=2.4 cv=cpkOAF4i c=1 sm=1 tr=0 ts=6b087ca1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=7VYxjO81rbqYX6bM38wA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA3MyBTYWx0ZWRfX9LkalVgAhLMG
 WzPZj/rsgTZ9nMsCK5WeOP+TqPVYx8UWzmU2QJg0O2o9WitGpuStzrIVI6ld6QVZR393n+JpdY1
 +vdmmLi0sHFlkDUepwKO1DuTv2jFBIM=
X-Proofpoint-GUID: XQIB-_arpMpj_12oaVIat1RQ6DEami8l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_04,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260073

Enable DisplayPort0 and DisplayPort1 playback DAIs on Glymur CRD,
matching how Mahua T14s already exposes DP audio.  DP2 is not wired
on CRD; DP3 is the eDP panel and does not carry audio.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 32 ++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index be0a2cf10f54..5428c6a45ad0 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -298,6 +298,38 @@ platform {
 			};
 		};
 
+		displayport-0-dai-link {
+			link-name = "DisplayPort0 Playback";
+
+			cpu {
+				sound-dai = <&q6apmbedai DISPLAY_PORT_RX_0>;
+			};
+
+			codec {
+				sound-dai = <&mdss_dp0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		displayport-1-dai-link {
+			link-name = "DisplayPort1 Playback";
+
+			cpu {
+				sound-dai = <&q6apmbedai DISPLAY_PORT_RX_1>;
+			};
+
+			codec {
+				sound-dai = <&mdss_dp1>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
 		va-dai-link {
 			link-name = "VA Capture";
 
-- 
2.53.0

