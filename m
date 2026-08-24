Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B53425867
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 11:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787572581; cv=none; b=ZF99eG/9PKymvU2fk1cSBwXaTW3UmlSzbpxQv94RmjNaILiVsX5NpEkpcNr4tJnIolqWxLojrvtZYslLgGOXVWsyFrtIPq1eQGC1OrC0WOdUrLEukA9grmcFSUXZTnydZE/hGizc3uHA/U4bRFPqq9JAuRwyawkDLGJxw50cRw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787572581; c=relaxed/simple;
	bh=yQHDVatt72dxAqTGiEP/fVb8h6kq5JRi5hP7B73zVGs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qezBOtnfFsdZ0PEHz0SDpwpuzsvxDR8gM/VlKGkna5/RQqYjxuFX0tBqFZfjmQlW75VdDNZvTPoAkzYZXOf28BOBhh/7NqQCzrpDI/XmVnGQ8nGE9wF5nZ9vElCL0AlTNrNYc+X0m+90vLNTYqSo4nahn//h88QFILiGVg45lzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ceN1EG4H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C4T71mlE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ceN1EG4H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C4T71mlE"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMOrC1800137
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 11:56:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yaQDj8IK5FlNVRz3fBTcniF5ZIYoAPkZqKgLTw2UT1Y=; b=ceN1EG4HzrBeWHZ3
	pLhwF1kA5ana7QYtMU32MCh2sWYWuuGki7/JFtnLujWLwsRA0V7FP8HGHBPpzYji
	O2a/cSKQKLQPks3c1Egy7aUwY0AjYOBsbXnyYMI+kTPz/QImqM8BOfoHOhKYhW2i
	NG871EzgtMGaKF4CyORxo2QlMW7aVy8pzDqIXAXVQxZQSVVZFZeY+TpbnZYBJW3J
	FB6TQQhYCz+bovJ5bvFBR6uFKpJKD3rBvXURhffgYFMbcPWxPgcTztheZkGqUpuA
	nQpNSHvk0iFsSAAVOEcUEHSK6Uuq2A6fcGWOb49McryIK7X+GTSL/fLXwtSeGYcc
	T/gEbg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8kv78c4r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 11:56:19 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8eac2620cb0so35379326d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 04:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787572579; x=1788177379; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yaQDj8IK5FlNVRz3fBTcniF5ZIYoAPkZqKgLTw2UT1Y=;
        b=C4T71mlEXUob/gGW4rbNdFjJgMHrnRJDbeW4HjASCzNSJi6nve6TYUyiOnA4n3e64a
         lWpaI2Lh4L+uSrfseklOcmUzrzAx88ylVqOGSeQU2SFXihfdi+Yo5t0FRG/uyQOZJDL0
         xa1VOyJTX7tJK0r+tpdZTJLWyvtWhN1ratHIBhv/SQjqrYNqOm4rAHRqmknRkXT0bZOD
         ceIs8Uw4bTodePUB9DS97LuTFbNyhF2AWpzH/XrJ9WCMGwLP1pMaxcHSJlcekaaQvxBn
         2NAmWYStnObQPRpctZXpsQhrgQlSkFKrtJ7qAiHtfYFzLDM/XxUj4VFRvFhI+rKNAiRX
         PHYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787572579; x=1788177379;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yaQDj8IK5FlNVRz3fBTcniF5ZIYoAPkZqKgLTw2UT1Y=;
        b=oRCUT6CESh+3i1SwUVLzoqPBzbDSMzfXUCC841rt4/+cXcS0hrtVtE3oXXb48ut0WB
         iajO4Y3qq0plaoZXkttQv/WtNWsJgq7f9IsgiLyYExTgSWrYzaFCqaOQKhM0tzvWwYMn
         m+OwpGRktz2Hlwc91EP5VFpel6IteKEQf9Bz5IDFDGmccWZob5dOv7OkeZ4RYrcSt9V5
         XzmDX6T2agA57f+aCeyhhehREto8Zxg5wlzrj6fT34r7XCVRi5lmctDtZIgDGu84c+DC
         RfOXXt3Nhy41CbFABXZMrvQebLyWgz86MQioGQFuSHwCLQlv1S5UOTQBKnbeap/lN0ln
         WDZg==
X-Gm-Message-State: AFuF++nm6DruMgQntyrK3yLeVevwaQ8QwruaScmBhSZeIQa0X7VURFLM
	HLU+1TchtbT7HwH4O76t2iSA81IVpDuje3tV9dtosrNGDuPCI9P2iJxxl+UnQYR4ZGn77aQbvis
	U6J4f4GhuLmX6FTFZ/nouEmQsUC27iGsNQm94CfTUwqbpjX61DNH+H2rTBbO8UxAbcuFJ
X-Gm-Gg: AR+sD12jMM2JxE/h7D04g7ItGKgYAp9nBxnNzmn1xcGgc0QJRysAhvu910TMP9SwsmY
	F2dYfis5aYcTkgpHWmB8TCEakdieg4aLsfMps6IiJMXb7L3PSPMX+qM0HvsLKhrqc1s+yixLGZP
	l0/yct7qBxCcikRwszYbjiPMRaesG/GWCY4uGCWyeoqzIgmVul6nj63Ak4BTLssG0RL1TpJ06Z6
	OUPD9gm2ChlsjBkTIWitUcowpOZ6YVn4SvjKU3u+wLYc976gALDpLYf64TntPdmVkjusQfthSOh
	jydbTtKArGMWLYF1SnyYKBms62+vkSQa48WlY7nz2n9iKtoDky2inVZMNj/bW6GXuNCD6xY8Hlf
	syS2sf5am
X-Received: by 2002:ad4:5ccb:0:b0:904:1bd1:e002 with SMTP id 6a1803df08f44-90c809444c0mr239096356d6.3.1787572578598;
        Mon, 24 Aug 2026 04:56:18 -0700 (PDT)
X-Received: by 2002:ad4:5ccb:0:b0:904:1bd1:e002 with SMTP id 6a1803df08f44-90c809444c0mr239095326d6.3.1787572577970;
        Mon, 24 Aug 2026 04:56:17 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629563dsm1259990366b.17.2026.08.24.04.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:56:16 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:54:19 +0300
Subject: [PATCH v3 32/47] arm64: dts: qcom: kaanapali: Add GCC CX power
 domain
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-qcom-tie-cx-to-gcc-v3-32-f1205a92682b@oss.qualcomm.com>
References: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
In-Reply-To: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
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
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1073;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=yQHDVatt72dxAqTGiEP/fVb8h6kq5JRi5hP7B73zVGs=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqjDD0u2wyDj+t4GgWXlB3Lj3y8OoRDBcNi9UoG
 RvyDLYiL7mJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoww9AAKCRAbX0TJAJUV
 VtoxEADLjePLkDhxcEq8FshGE+2Sai2V5ws6NE0r9lAeZWiY+D+ASun1QbfC/EKHXuuoI3XLvG9
 0t5HALj3EgSLTYL71IAzH19RkqhVikdEiAOL82J4muQmwOte4YLpx6V2spvN3DQVHjnwfvcRiZv
 sW73b4IS39u0Y4npx2aopZ6jsB7cZXYSLF5KU1ITQ1ZX/Wpjb2hUDvKt8p3uqMVRKcbUyv3XHzg
 QdLb8hcvZEX08vBMOp74Bg6R8vNYPNmZSJouhEovojm0gx09PH6GclN6CT2bUm5OELgr8J5QqXJ
 SPYgPQQH9rmcY82hB2HsF1zSngCCGWQupsPiLZdxpNnLtyTCpFuIR0t3C3/uU3ZeDHpiQZvZUre
 CCMYzSAFGHfzHA5Sj0oTQnpe2RqDkwFzouOe6/zPrCM57ESCqVfqg5K5SBsmCNWdyu15xbX+/Ux
 OO7w2B4yLH1x+nJ6KH3oMILszWJU2lqOKHhcgBZueWYagYtHs8mUIwXTgBdYv8Z/4eRSAeltGcr
 BD1pc6ExGoNNoGkfhvzriAqs3XxN8bvY9n56EmnLocObYKF7cZdlZqpJbrFv6MAvdAuHaQbxjo4
 V8tpkn3Fn5pBLrdXvhkMwGl2IOhbFv1nmXHo4i/ILgcf6IJJotYS3ncrhRG+C/WR/+TLeMHhRA2
 v0n9uwVVCgPCRRQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=Cfg4Irrl c=1 sm=1 tr=0 ts=6a8c3163 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=3K_yQeBcBf-sZL04j2EA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX/vD1bexNFf5Y
 f6ybVLNhJIc5jVcQ6HB/m/sZ3ik7it2L0SWAqZi8g5oshA91pmwxbxtFIOZWJOHQ2cDbE7M8LAh
 Jkdnxqkg8bWTOJ0X5HHnqyx3y82lQRE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX2gTllzqXOj41
 A9HCXWosUK3SjcxJMN6yV0Ur0COE8MVlzLlW00Pj8VlDTb7OR1IMd0NgFHRFa0Pwlaivz5AdSbB
 s1fKzeL8YDqzLrZ5EnFXMXy7Oi0AJ6xtK5gwr5A1qlFkhis1oG8fz34TGLfR2RvZJPvox1wOLHo
 LtwCEIarX9kOo6E872tHO0Aer9u3e7Q7mjH4vxzbEYOg9yYjlrAaV+ymEmwJaupIwaYhmypCdLT
 +2ctbLF2AUgeMWT1bQFVvn6Oixq/oeiX6WXRYkCXpo8roN4M2USw81OcFUN4FQLWy7j93P6/gYY
 SAEbDQAGJqWNdHdUIGnrXuKf2kYayRTz3QWfaQJPLqFZnb1AgQpIiQp4P6shYgHMEQbPRg+yQyA
 02QbQjkXXKCM2U2aVZP6XG7RIODwxz9QLund3oYdw/i0khcbWC2A2I0i+Vm4uuykYgZuokdHjzc
 oXCVmbLPRBjmRVrH+7A==
X-Proofpoint-ORIG-GUID: vEW5v66eI42xiPTIgWapuKAZbZ8zO6hx
X-Proofpoint-GUID: vEW5v66eI42xiPTIgWapuKAZbZ8zO6hx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240099

The GCC GDSCs on Kaanapali are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Fixes: 2eeb5767d53f ("arm64: dts: qcom: Introduce Kaanapali SoC")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 131fd2a16c54..c1528cc8b7b3 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -552,6 +552,8 @@ gcc: clock-controller@100000 {
 				 <&ufs_mem_phy 2>,
 				 <0>;
 
+			power-domains = <&rpmhpd RPMHPD_CX>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.54.0

