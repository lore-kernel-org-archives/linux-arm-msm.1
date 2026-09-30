Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1EB4D1787
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 12:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790772391; cv=none; b=YnKp9XMI5GzXwal2iXmVQVuc2z4ow8BnfQjnk79Fum2IWy3iOObqHgKBRyf9OaW0Ma9L8KRPj/sw7A8uvMO1UnCgJat57Qs7rXZnxR6MTm81ELGEzIuOdra7/OsrcPgIgnvLy9fnBDohkKtUekKjsMla0zSwFs7VV2XSo3WDGbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790772391; c=relaxed/simple;
	bh=5nKDNvtW1OUJP6Sb+xn+Ybf82dLM6rIu3idQhs5Kwa8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HG69FHAiAKK1I0kJ3aEDUgocEEqPpF0y2mEp7xaDq07qePm69O/ka4Qye3jmDzrjyK/shDPrh4sQuuxiKBm+57WlVb9B+8uh3zY2BRTOJ3dEHu+PlR5+QD+U6faZE74YKQp+kM+L35TN+l98iXRm8teKpaTCy9lBHYwJANguVNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NXbfSCBf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HXBmjcDs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NXbfSCBf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HXBmjcDs"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UB7afL3547285
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 12:46:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CmPa0zk9SMg
	32eJGwCLcpamy23kmZhzKKd6gsfxi4hU=; b=NXbfSCBfg1porQtZtgNlqqDOY8I
	LSa7oSLIBODYUWAR6YoE6rlvMLv2M4OI6Ir74xbvuwxugzwKRYtnd++SIZRkxmfq
	RthS6z1AaV/Ykedc+fgIS6fwVJBgbaH5DM0eReMiz23rjxMg847QCS2GYIefDjyR
	U4elJ1IVPsIg3gy8yXSomjkD1gxTsZKeCSZf0o4GKK6iB8TWMCIJafd2nGterpGF
	MrjjZScZfTGYC2JkNyoXyYr1YZlGWq2wbhmpN/7KpvkPBLt2z4Z4k6YBhWOhWZGt
	wyTAc+cyUPBceUUQQg3w5KJ0ytWdytvDt5yty3IUgyY+JYJ5evWiTg/5Ibw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0w141m1q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 12:46:24 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7a77961b860so998405137.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 05:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790772384; x=1791377184; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CmPa0zk9SMg32eJGwCLcpamy23kmZhzKKd6gsfxi4hU=;
        b=HXBmjcDsWWPGvanLRCpnwD9N5lCL7pjEABXCJYG9ivuEnY3bikhd63/tX53oReTZOc
         byALpj7wyRpUGRBCnbgJBGwUlem5unB5Wlscr1Bj+nK5qjMGJp/uIy7d9w+gQ2zWtvTj
         c97Y7Re8euB899D93DT/yD+SAyYaXdSuNLMUqRAYTxFnlZmFEHSAkRXhoLVL+th0LhVD
         e8j9fQIiM3/nz24cw26XsiFRpWkCfcQj1uxPK5dGUAzM57qIg+FXQWTsYMuZvV8XWjfJ
         Dnl6BEE4r49nv2ZxP5cNHhBNChUOVYjww6o5yaY42YHGma0trGjmpZBf7UG0R5ROUZnF
         p1pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790772384; x=1791377184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CmPa0zk9SMg32eJGwCLcpamy23kmZhzKKd6gsfxi4hU=;
        b=W+e1kjrDJC+2k0vYPDoSgaca4I/zeVze8RzHpP/LuxlxiIAoFVVwe46f4kmR9ZpHTi
         /6ig7r6VxzsBN6OITxMXtdnb2Yps+NU8At2zvHHsZFlY+0zL8D3By9AxSmHfa5bpDyAu
         /UR9ZDky5pHEmP0X3XMb8QksMg3L6tCD0eEd3N4l/H78aYCw5R7pMU6bJ1SdFmGKPEvP
         0u22ppy1yokAnCjX3n6JsBjK0nLK/DN8KOZgbTv+aPvqMSppM6U/YKJMzSc2BCO8VVXK
         Lym4rFvTAUStIEwNy/QrwsYKKgC/GyrV7wztclXQI1dk5v7W0TCWlYZXTNNc+egBVzvm
         Rc0w==
X-Forwarded-Encrypted: i=1; AKwUvBz0G5DNDEoOXRI81PaNMNHDIl2kr9Ma+pwJ1s7g2b38BiiNehtsL/kTJjOgRf0nxeLQwlbThZ9RXyjKk9ll@vger.kernel.org
X-Gm-Message-State: AFq9FYLUFwkLvtHW1YeG3U7ydBRqra+uYbOFNYW+77djs74TTFsHGn4l
	/XdBsMjG063rgAeo+ZnEwpXXWVN+0uk6q6bFW1hfZhwH35ReyIu0pQ6KOcUhbPjktZlVbFJerOj
	jjJKu2DVL5gDw1hdQlD7aoUGwhqovuPIp8mSyK2/cdmBhgg7NoZEWzrecohG+WdgFUAKk
X-Gm-Gg: AYBFou3Efr+7h0z9Q5zSLbHt7EdhgkRD318YJ1+GMJiRn+eL7GqAo3GplQM86HT20rQ
	FsL8kXWsczh6PUFUYOqpm/DhN5iXRgcjezAhzcC57ZvImgrNBMrq2d/MBNRsWMVhFBTF3DB1AEK
	POCzoH0Ub5x0hD+xOLh7QMsdv/dG+6n8Q39ADEnlcZYoz0e5IhT7fl2zr3uyT5BCfyM3UAksqiR
	eYbBrGerkylSM87p6eepLP+0Dio55Kmu3rxvIYXAh5GIzviQulVH452lEVSL2PnX7X5dGhY/Nbf
	+4Zoi02hc7druu4YzABs86WhB9RBfpc559kuUt0kri3n5yrNQHOQbxpVaoTaZbsB8zq0EKqijE5
	RRpfLj+ph/bjJ
X-Received: by 2002:a05:6102:5cc4:b0:7a8:2a34:432e with SMTP id ada2fe7eead31-7be726b9215mr191788137.9.1790772383875;
        Wed, 30 Sep 2026 05:46:23 -0700 (PDT)
X-Received: by 2002:a05:6102:5cc4:b0:7a8:2a34:432e with SMTP id ada2fe7eead31-7be726b9215mr191776137.9.1790772383393;
        Wed, 30 Sep 2026 05:46:23 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01b1e7a46sm32549195e9.0.2026.09.30.05.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 05:46:22 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Alexey Klimov <alexey.klimov@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        mfd@lists.linux.dev, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v4 4/4] arm64: defconfig: Enable pm4125 audio codec driver
Date: Wed, 30 Sep 2026 13:46:06 +0100
Message-ID: <20260930124607.1109167-5-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260930124607.1109167-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260930124607.1109167-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1MCBTYWx0ZWRfX/TSeVY0zuYca
 lclUSy07uWh0j+WpgDkQ8vNKY+sl63+AilwDnaYcA5mQ8DQTbpLzzK+THpgxlTPvVRY034AOfck
 la3ssKdwuT/vdSnaQScfsGBucHOHObg=
X-Proofpoint-GUID: dB_LmtzL_2oEwSfbgU3Ho-1LFIF2YGJq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1MCBTYWx0ZWRfX73iFsKvs9GQL
 N7v9ksuDIRozMaU7gjbVDCL6rORcy4GtZ05SrI8s05Yht/U2Tci+9ffPcX1zRAB5gazQjhfZQsm
 PteLs7GLdmVgMGzRwZwPYRu23JNXWEC7e6ZmzvlZ2N01EUjQTwUo9Nz2gkQHYEYGx7bU+081IjI
 Fh02MOeWZLzxkk8DPPIcadhDJEO37xA9Odk6lgb8CwMcUn61kklCWNNBvXHSoFDJG0qogGwcZYe
 kBTSJuAWlo6e0du2pkSBYG2S0QXkpvfdPCZFH9Jfv1MiCjoG8Kyd6KQg8kPFjMFEeb5N8hb2DAX
 0LT3A6atySx5dmIAVGjj1KdTJg6vgIpb6oYCFwKqO3pooTlgldCR4JA9TM/r8b8iDV6xCXbsPmf
 qErQFDBQV98VuQpKVTpGlHiNZ0w16D2vRVjhYk2RzZgo2CKo7KQeT28CzFQEQkhn23TWwMt/eN4
 MtzRQQuEyDknRXotWDQ==
X-Authority-Analysis: v=2.4 cv=J8Q/fwnS c=1 sm=1 tr=0 ts=6abd04a0 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=I744n4YQ6ztvz6u6AXgA:9 a=-aSRE8QhW-JAV6biHavz:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: dB_LmtzL_2oEwSfbgU3Ho-1LFIF2YGJq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300050

Enable pm4125 audio codec driver that is required to enable audio
support on Arduino UnoQ board.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index fce418fe6ff6..6c41348d1abc 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1172,6 +1172,7 @@ CONFIG_SND_SOC_GTM601=m
 CONFIG_SND_SOC_MAX98090=m
 CONFIG_SND_SOC_MSM8916_WCD_ANALOG=m
 CONFIG_SND_SOC_MSM8916_WCD_DIGITAL=m
+CONFIG_SND_SOC_PM4125_SDW=m
 CONFIG_SND_SOC_RK3308=m
 CONFIG_SND_SOC_RK817=m
 CONFIG_SND_SOC_RT5640=m
-- 
2.53.0

