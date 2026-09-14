Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95F14968F3
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390222; cv=none; b=cnkkqoLmVJ1hLfXtDkNzDF9f0yFWjJ9TEV6BlvElXUpdp6wOE7W6m0tJ1lDIAauR2oqTo5ALn2TkP3IRvg0js9sTTG4enPKJgTaS1PU8Z7bzxm6wc7aDzzeDiX3F83qMFO5LuF8zcKw3/mDJx1pOyHBUpku636cLfZ15TZn6p9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390222; c=relaxed/simple;
	bh=mhtnRp9S+i0a7RDUpetDnrE4Fy6EZyBsZ7qeXAQQRiQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MfF6rRaTh2dGhY8cAwkv3ZhrX2kPxwaMqORn5cocJc+flYwE2TOxLhO1dTEyqX2zrvNkXVuHG47o7fBWyf1S4KKqS/tRl2jGYisQevR4yOhda1NiAgISQliL2Pu765SrOHpZyVj2R6WgnFITfULGYlRB47jD6Cpr9zaZP+UUHAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pmkpajkD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=akSWUggI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pmkpajkD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="akSWUggI"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAlwh73860401
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:50:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/1+N15GHXDbkN+QPbbGsdK4ea7My6Fg6Hl6am/QVbMY=; b=pmkpajkDi4WGDb8q
	Jhohj62IJvtISjtbm/Z1cpKc0D0PQj0cZa4YS6pvWJNHyVodHWfPKdehSTqduJ71
	FomyvWmQPN1OqhKfB/5/RSH8aPu5nYlx/LNfxQXhmd4CBKPWI9+jXXY8BoW6cK+R
	C6zebb4/uo07F3V/CIEJp0uhSn3Q8/HFfH3zHeb3VxRvmtM6u+Kaz0Ivltkq2NzE
	6e/abVJgo8Qk5A/riASYUBJ/A1tLD4u+CGHh56myHz6D3DL/ENBOU/LLrxUmqz+i
	EX7mlia+ecyBNc88CqielOb9sQxX5HnfOhjPRWHyxAdtA+SAdcL53oCRvxo/1rh3
	7tF33Q==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpd1f11kb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:50:16 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-79129463bb2so942555137.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 05:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390215; x=1789995015; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/1+N15GHXDbkN+QPbbGsdK4ea7My6Fg6Hl6am/QVbMY=;
        b=akSWUggIBlB/A4AHax3y2peYJHeDuNitYqB+s09+dBVB3xkG3hIeupy5xUcZr2PRjf
         n1ZTxkrfyaxulr9cIhBBTvxWOh/faTkTQC0C9Qx5vkY1XRbr55oaa3nUXz2hVHzVO9of
         qGq3OLnhRpYuHJYKV0KgRveEgaWb4nQ8TP6KEOI20oJYM8KDq8x5EufyUQ9SbfwyYFVm
         ZCDHS0mTiEF0GHlH6Afa/gIYpmAdWEGjmBE4Q1rhB9+X4dtcT4ZlhExwDK/VP0IpJ9Mb
         UJRRUS03Swp1zEl/ZVQgjcpfttW4P0MLHPxaGM/U+yJexYJj0AjKNkzReLOHJdLeWjO6
         XUmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390215; x=1789995015;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/1+N15GHXDbkN+QPbbGsdK4ea7My6Fg6Hl6am/QVbMY=;
        b=O7zK7SfscKIgN/y7slTM78pWOb81hMh23rKS71CS9lXv/j4P4eAyL5WcxA3o3G8sTk
         nau2Y65h/3GX5T4yePb1cifPfYW7U1+sUM5nxtzAlsuvBKm50cVnzUPkQ9CasVQvlsUC
         im+kcOKN86QVNoC/xJUN7TSz/TEZGGVcDdVlfMEN/9X1dq6QQlsICmxOSTOZaktsvcCI
         HejFFRzk61855zLpTZ4FYSrowejjICp6S2TM7RG0EPDKVmduRy1+n6fLbyc3E5pebvkw
         w2h7cGDcEq0WZm4lFsikHIvy2diP2eJGHDQmf84FxGMwJ2TSbegSh/ezGzpVbCvexqr5
         G1mw==
X-Gm-Message-State: AFuF++kADhWLle0cgyI3u8ltWfGqYmEnMvYV2x8f2I8W322IpExWYj8x
	Sbo8CyEd7CG1ViNLJ6TQyBWJ4ieeBiMieHsHJrGUAHrdq4U/eu7Kd+XodO6xU/T8MaumVK2eziA
	jEQto0h+svQL4HfvKqby3PuvrX3oS217HaPYADdZzYsV+tIYMqC9A5iqazteaGdOLNKtd
X-Gm-Gg: AYBFou05uuYTm7zUSsXdvLfW1B0BoS3O33SDOJ0BnWckduJMeuYvAv8fCoh2sYsD832
	IPbTf+QpqJuWQeLWC5glDBOd1Z+tC+mPd0lMaPgsuY6BEh+uhJKLyjiXQcDb9Ty+LgPZi/sOBD2
	Yt7eJrCf+qPtieSKS4uuHsE1MazjoSrRRDRJeuyKit82les24G+AVoym9jVyripDr82Qc1n3rbd
	Q4YMMaL/hU+eBuuHKt7aVVA3xZWUzO70J0XuZCB00cYUvaPxMaT/qXPJL5rbW4tlFOa3YEItusR
	ptC3CnN6S83d+tLAjhCRcztDtMJjGoubLZLUgeEdV9T/jvXZqZu2A9Fr5YmR1KtuAcFT7bTYyay
	3NY3St63+
X-Received: by 2002:a05:6102:80a5:b0:795:87ac:9cc2 with SMTP id ada2fe7eead31-79b58d7558fmr1433739137.4.1789390215401;
        Mon, 14 Sep 2026 05:50:15 -0700 (PDT)
X-Received: by 2002:a05:6102:80a5:b0:795:87ac:9cc2 with SMTP id ada2fe7eead31-79b58d7558fmr1433710137.4.1789390214855;
        Mon, 14 Sep 2026 05:50:14 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:50:13 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:49 +0300
Subject: [PATCH v4 50/52] arm64: dts: qcom: sm8650: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-50-9d5a606ada33@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1029;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=mhtnRp9S+i0a7RDUpetDnrE4Fy6EZyBsZ7qeXAQQRiQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+z8mK/oWSEVpRJwgU0xbo0T38BnOn+vWKHsb
 YJzITytGoGJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs/AAKCRAbX0TJAJUV
 Vq82D/sGnPkn33GHFFej/nprGeJVi2SFMJoCvR330SzAdyXLy1b2zg+6DU9CYwbtgm1yn4EkAR9
 i6B4Lw1XRa0D3o7AOSbh1WTcZWvoqEU4e6Ehl8DRy/iJVlvShznKHhL76QDowOXrF9WjHxXvkUc
 lO2MaH8ONXIQBon4g0NgknZ1FzLgBHnxD632dsU+A+dJ5gdgrGrLYRJyBdJLbTKsV/M9Fqy96nD
 fDaQXwsj4Ws+BC1kcZiUYZ4tkryHZQZ7vpqRjOMP2f7/llsgoIEU4ZdGpwcE9W5w5GALAv+Uz2k
 SNThHeghJ5+MCdY2saQrdBngG9QkUuUANkxsGA+vg+xI9U1+4hNNJGt8wWnmncSMHXMViW4rhCs
 x6yPERM8sytE3x9E2ckB4+BZQ46Y5L/4qfl2QwdJxuY4HTl7JvTtzOj+Ol7wrt6Fc72H9AhT1JD
 Sp5K1esqCgp1nuEFxzE9pct1DIqHRFmzc8OyrMY27Q3UzRZTYaRPLA5gE6awtyuYChpdplKOB4j
 kIpYEV0Se9ABMjq/tzlJ2sD+E1J21abZpBOnkStknU8qKxBmIyVASVZFvACdU8JA2+QMVpKX3WO
 AQswQE7c8HPtJ0jEmm2deExLf69+DTdTWCt29/DQWDuHEvZwV8Q+ywFJsoCeXMHcXaYoFxVjyDF
 khkXhEZsSvf6utg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: lWFB3D3YqCkYJ8BuHCv7DejB9om8AmAx
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfXx6M4wdZaiw3P
 WMGcdPRXwWMb83WCLL+hUzu1HSnU1cQorVn2N0hFwjHYBvmBDEaa4tO2u6OsRgc3BuXm+eSzHqe
 icx3icQbyVzYi2mCMSce9TT2MY/pCbw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX7dFInzyHq5zd
 ejTgPJ/4IHBIu2M2DpYtrjJPsC36213zHqK1gI1uVXF4QYGeqd/j7U2sCCizUbASRLVQJ0jr4Zf
 cnGoiSqRySLQkJHvf4MF/oqVJcjQoJQQp++r1MAqpsAWVTEODv7jGv+qY4xH23QNSzWL4Wtyhb3
 UCJUeO5Ae0P9XIjKZSw20pqoDxiEjDpLCM9yfPdwudQVnovDEnCyTCF5rQNvcpch11su51WYIZK
 aXOneLkt+pYfcs35aC0jIv73aTowrNUvaKp5ticvxJKdZg2aF36TS9jBoIM42KstUZGrvlTlF/0
 VLp0/ZIWGnIyrzPrCmjkTAMbJvqXf/GnM6Qjs1yDRuTA0R/7Mq0wKzzlNfKqPsS3LrBJ+2lNF6M
 owUNOnFRvBgbNey79DDdNtN3BuId8UyyVnpd+/4v90CPw49tlxdrhbRVli2fXpByUQV3lfrBuEU
 6+c98Gl0tXrff/6fsjQ==
X-Authority-Analysis: v=2.4 cv=XKel2ghE c=1 sm=1 tr=0 ts=6aa7ed88 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=dUfsX-4dSnU6X-0t-lkA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: lWFB3D3YqCkYJ8BuHCv7DejB9om8AmAx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140183

The GCC GDSCs on SM8650 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 99509305f970..9cf38a7e0b94 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -2018,6 +2018,8 @@ gcc: clock-controller@100000 {
 				 <&ufs_mem_phy 2>,
 				 <&usb_dp_qmpphy QMP_USB43DP_USB3_PIPE_CLK>;
 
+			power-domains = <&rpmhpd RPMHPD_CX>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.54.0

