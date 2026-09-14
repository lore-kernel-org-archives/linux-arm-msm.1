Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A575448A8AC
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390190; cv=none; b=kdwSYB4ytz7zqMHU4c/4Ae6VG3ybWctgnpcOg46x20iBuSTloSZ5NB8NMtwoRzcjc7ujbh5ek0NutmJ6KOlmyV3EYDR4cWpHFkQJZnr+rZlyIYc7oasZ0oC24wRPRWEeMuz+0TIW9f0x8ltGMQup/1rCI7o4s9oF+dU2dAfE14Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390190; c=relaxed/simple;
	bh=lQV0ldRNKcf/gqFd9CvCOCZHVi8E1tSUEkUVeUVD14c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jUrWMOLloMabxWPp269UR1678Fhk28dLkd0J5jQH+ff2B496exDMCnw0YKQ9bdscCtXgUhc8O68Q8+Fp4JoS7TxfU9mFMKwfuMdPFAHOaZwHyNJeDu+duPly+P0z6NAWqFQJ9K7d4XbUeCAf6JL5G8vI1MARA1f20Yj27SKsrkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mqfXL3Wu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SVDHUknf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mqfXL3Wu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SVDHUknf"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EBRFKU406579
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:49:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UmyJOOZgdqhPljjjMNEqZWEe3ZGHlmE2PquH4ZCuwe0=; b=mqfXL3WuNfTJan95
	0zEfCtCSR2SCfcngDxorQm40zSxOoNNzsOo3d15Oxo+oF9i8HV5K/8Tu60CaA8te
	saTApPnq8v3IymDZDJqiyuHThzvHs49pnPgB07s27plW5tFWGqx9WD5Y1fYssnbJ
	jkB3jmKjn3pRmDKsyohGAqxWlX5Fyfzf0fuVPSMco4od7zsSaCq5D4gV9fbkRc6g
	j3CAzB9Yg+5+W0ZKTbnRPYprHwn2XR79v+dIs7xhDmeaQVWiTW24PcIJ77sJtF51
	ZCQbO0JX6ezy3J8Ttn5tDGKkLzurDi8cQ10GcZJOXNzp7APJ6W4fBodm1Vn+2er6
	eizdaw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpg2kr8e9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:49:47 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-790de8f0cecso637541137.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 05:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390186; x=1789994986; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UmyJOOZgdqhPljjjMNEqZWEe3ZGHlmE2PquH4ZCuwe0=;
        b=SVDHUknfhMVmbgHAIAKKsP5DkQDF+zyGziT8zEn+YXu8ECtkjw3tV5mo+DY7rzgMX8
         zYgpy6m04ivVjBFbvvwH/gmSZ7IuASnKAOu356mPTZjY0hmBP8noDs6jJNVzftd1Q8Pi
         94r00oJO72r/s2GCfhPkqqAm9T0Yr/8Ptef0YQ15d6y9cueTogfIck8V8M4thKPENCn6
         EU6oYWOMTiLhOv3jffYVD6H+D7FVUh0+itDHHzpGx0K2NubFM/zMrskCLgaU6AmRdUZz
         06t/bORS75frB0M4sf6KlJuhEciGnkS3tfic1ZS5zBYWeH/9Rh4aDUReNGB6uwWeaY74
         HuZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390186; x=1789994986;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UmyJOOZgdqhPljjjMNEqZWEe3ZGHlmE2PquH4ZCuwe0=;
        b=IG5FaCSlZoL9Amz3OA/oZZQ9qTAsb+qKkhYjEaO3t88lQ3WtREmV+vKNGXV4Ifiq10
         4bfzBryPoLdI9L1w7zSgqgPkvBMNLwx7JMHArPN5FBrPvV3fK3lwRp+XiVX+pJOcwWqZ
         bT/dFqM4htGHygb7dCS2Fvm24yyv5sRXrztSfCUteIQspnLXX+FX1F9CCv8EVsdcNs99
         0M32YCTMURRopkDOxOeSWlIug7jxwckgfzlbwzqADtQ3Ji2UWQLtWGapr+xnMQ5IWAQp
         HxR5qsHAVV7f5XBcosriaRzpPyYD+VlqE1MoeeKgwv5hwN1cm/RNwP9OYoosd/gzQx3v
         jP4A==
X-Gm-Message-State: AFuF++lMaewR3T5zSKefPmfIz+s9x+eACOHtfhXR3RPWZ4pyVNnm/NbA
	LpaICxnwWRaPRKTfT+oGffxdNuS/neyGgPwbqd4myUTb7jO5w7huoNicUcxoAcTBIjX4CJRnn5c
	NeAfyIUdwKlaqts4wDohKru/a0kho3xXpdVw7Vfh3ZTSeBIMUGhgtTTGIDHNnZL+Xl1Ni
X-Gm-Gg: AYBFou1hK3TKSEOxoU+28aGhqer7NzdvXOLJarx5wFX9HkirbtP3SlLsGWthC8BFj+v
	oFef7EapASaNU4EKZTg8tDXN96XZOs36lUxmUsLdTl3LlHFruwRUPQdAs7e6TRsFe4Qnq34Speh
	eQYoJpswSTI9BJ0qRPzRB9NGhCS8mLhEb8h8xvu5tmImFbEkFyvegTrCDQuD1hlAI408TAUWuI/
	OtyVsmlrK9JNIIrNPNuTlLY0aUsmDb1+UPGjREN9tf3jqDP1s+ONy/hnL+n3/tvCPWo+/OnHnnZ
	Takf0Q7sU72E+JqLQUTP5wAsW/dMZAsCQF1/Z4GXD/bWBSAfEldv6M9b922zz8YqAvYlRxBY8v2
	QQ4XizgKb
X-Received: by 2002:a05:6102:5b:b0:79b:99d2:9cb1 with SMTP id ada2fe7eead31-79b99d2a141mr1030578137.2.1789390186246;
        Mon, 14 Sep 2026 05:49:46 -0700 (PDT)
X-Received: by 2002:a05:6102:5b:b0:79b:99d2:9cb1 with SMTP id ada2fe7eead31-79b99d2a141mr1030543137.2.1789390185668;
        Mon, 14 Sep 2026 05:49:45 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:49:44 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:38 +0300
Subject: [PATCH v4 39/52] arm64: dts: qcom: qdu1000: Add GCC CX power
 domain
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-39-9d5a606ada33@oss.qualcomm.com>
References: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
In-Reply-To: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=937;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=lQV0ldRNKcf/gqFd9CvCOCZHVi8E1tSUEkUVeUVD14c=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+zxJSxO7ERYqtGyj7fN2IDdPiwOFWv5pGud9
 E9RP59TzFOJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs8QAKCRAbX0TJAJUV
 Vu6gEADK+ZnLlsirt79+r2rHNUFSIyIdKSzliw0T9VVTxSZQg/YcDmXxbBRgcyPciztWvuzsNRc
 A9AqBs9zRv/SzjOf7LhY9bkQeuQ41lWNOaijRi7RUk62F6y9WkMESXTKcbjv8diQn20OP/htCnE
 thhXO/CawaLrWWLFWG+PflSCw1wsTbrO8AgGvuxeh1lcXqP8tHApuGeg/1QGf72wGiEsDCM//uJ
 PRPOSe6W4xwPsSO03TuZuBdsW2gKeRcD+Es4kDzgZwUtUYSA/mBSFYGZpVwkMLA4Bo6iG0YDVVH
 Or1REhoyOYeWjnt8NM9A2gLL9UjDAv2u3skL5RN7OPNp+OQZHIlmt0dSGGKQ66/zQtcOa54rk7/
 qx360t6svzgVV89k/46/F1Hrw5OFRnlFcvw+NbQ/lOhznpngDENJOzQ0ovrlWCVTyB+haespzmu
 sYAnjGUwahewVRaMxPKmqP0sWiMWNZ6dDgJmDjh//akP1g0PZoWItxefCbytWCdhqgxSY25+Xfh
 ZHScAmHkk++D1Hz9kftR5y0p4cD6mv0wSepWWx7OkTvqbQk8+xr+tBuJPkU8YJPGUI2XXL+7GPH
 VLal4DGVdTNLFmTO2zWvy3gdOchIMDrh0yOMsalSOaz1ajUrZXJRxYZqSz5vwunZuLZNMywS9AB
 4XE9OXUw4azug1w==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: 5L4MHFDaMidd-rpd4Gw4ZU2nYh8Vq-h4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX8kjXyLUCILWT
 BmXgFw7leFQyvC5dpaowFp80y+fiIltGmn9uQWcyP7mzNQgjj0u0Qg6vAms4M3uDMSv73FSpuAx
 vvEAE35+ehUDx1wFESfHLPitHK+P76WT0BkPlM13ro4IU8JUbhqV5QQ0HFow8q0wafYo/7o5BdA
 ki/t3ZclmbOPSF2jQvrQPUAu01ztMjvKg8gPbEd4NeWt7F2nanr6y04LW7yRYprMfQ6Z1DOCwIw
 azw+1r64Gl4yew4PjRJmoU6DgnPbaB591iwaFnf17IQ4WpB5bsZiltRsbYVixqkqnjECjp4iCza
 52017tj/GoruZj9TTj4gGohOgscf2ZbjBTGr7riIgl+oZd1c0AqIjwoMdWXVYhEPjBArBr5lEMj
 Gl6X36pL5eoJ3C3HaTfmKwTbwtKz5goN1MYjoZPgtvVItmeRHxopXZkKF3971tvsnYS62m+HklD
 koJyTjJKkrrFOmeJVPA==
X-Proofpoint-GUID: 5L4MHFDaMidd-rpd4Gw4ZU2nYh8Vq-h4
X-Authority-Analysis: v=2.4 cv=M7TYuCws c=1 sm=1 tr=0 ts=6aa7ed6b cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=frXxnpyXSSLf7P61oFUA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX6wLTuDgvgUTP
 iwfsgstFsC0pnkws3LrncCh16zPpsQMf72e4a3DhSewYCAAql9AjvRnjsWR6NnWCzlSrmJoljGh
 EFn+poAJQw6uQtRX/dm54a9DPKHcgco=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140183

The GCC GDSCs on QDU1000 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qdu1000.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/qdu1000.dtsi b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
index af106aebd30d..accb4b989655 100644
--- a/arch/arm64/boot/dts/qcom/qdu1000.dtsi
+++ b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
@@ -396,6 +396,7 @@ gcc: clock-controller@80000 {
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
+			power-domains = <&rpmhpd QDU1000_CX>;
 		};
 
 		ecpricc: clock-controller@280000 {

-- 
2.54.0

