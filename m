Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36CC3ACA75
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 12:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789474084; cv=none; b=MEBLgZf9Wrts0CijooiDnZH+4ipSDnnlC6wNGKHZtgmvlTVevDTNX99+PqnTjhe1MMtJwnd0oIg/SdvA0AGRZKQRGu5C48AHf7ZFNLvZTKx+P8L1rfBwai5v7VtGReettPHY0RFQhHW44C0NWNHTunBl9HT3EV+ukulAOj2BvgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789474084; c=relaxed/simple;
	bh=q41Fzq4Slq5rEpTdIlv6qzewx5wVm5FY7Q13iS5rtK0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lgWU0pmhozmH/WfXImulGxbTobZeglhReYAX1obgcR7b20V55/Z3f40Pn5PvQygDNs1dbwigsJD0fKFY8AomWN2DQZeNsRKFho6Kt2NtUGIXse2HrS64GJM1hWVdcXGt7TVGi0yndnay33mb5PJmOIjitSNmmL3fmcn3NJ7ReeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YRj5/8Ej; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RjEUzILJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YRj5/8Ej";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RjEUzILJ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9hGOh3912042
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 12:08:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0tblK1aCJWf2NuMWTd4qfL8+zHkiZDE8bJsRN6uqNKU=; b=YRj5/8Ej6fnslHtl
	S3QC9mBvfF6cjZMIpu3XSaG5URUR+SNXNoNh5pfivx2IX7h1Pwnt2pt6lPEzIJmC
	BbRf4azVLQW7p44W6UI3RP+ltXkd/9jjpt29xv3P4AwrYkQS6vP9BzWPABHlAWH9
	ApIoFaDzsE9qlVbXtH4WLeLclAXzRN4XY6IOZcvpA2AkQ0bduRH0tO6cBn11jdxw
	kzFdgxNQt+dx/2Nh/2OKh5GUQpFE1tg6b97+NhmA6BQnykHx/oKKYoC9aVp1Ucbq
	FWoBbrQea2dbOPM8ydwakvGRi4m3nYV5Ev661xmoxVH5f5Ayq+6WqtiFXIJ3H6yo
	HKW44A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq0jesemb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 12:08:01 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d001671a54so85934065ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 05:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789474080; x=1790078880; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0tblK1aCJWf2NuMWTd4qfL8+zHkiZDE8bJsRN6uqNKU=;
        b=RjEUzILJcuOeLFiJ4ULacZW/87iBg9dmsydDSbU31IECkHD2m3HvbMJVWl+VZ8eANJ
         pZ+xNPXxnuj5aChAu0jFtBKKsA+jAcmZxcfiohKmiIBTR9/DDTYhOXkUCW9eEWIl5JaP
         GHjExmHxAdnXGYK/YA7T8nFBPY7l6tyguGhpdKaMm/QMrCuJTHASdMXVOBwOdcu6rNgd
         Z2FggXUHVTwElqq7x8rRW0gB9deejHtQAY1bHTsjd0MzmK0+VvHFxTtbjDqxaNQy6Fg2
         P4nLEbMuLe4E7nz4NTScRVh2XdgKJugqgb3TA+gqRVa9R52ApQxptp0zN1p3GzLui0/p
         tc4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789474080; x=1790078880;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0tblK1aCJWf2NuMWTd4qfL8+zHkiZDE8bJsRN6uqNKU=;
        b=mFWMFqsf2RcBvvZxGX+Qo6ApI+b6B/rQv3XabGhga/+Ut0/iH/jo0LuPOdTEyoAd2f
         Kh9EoH5xF0mxLjCVCYpJCwtEGxTd8Ezdmz2OG6Ua0TktW4xor5uyHBR+MpzKRh9QS0l4
         Ra8FqjxayIwzp8cJb1sq6PDmUiegDjN8/Ls5lfJ6ur9Apjaa4LZHpK9oRyL7sPl5l3tD
         rRh5wA3jIq5APrBHdwfkfJsrZIBo3a/Va8i3zB9MoGV/BnE8nSADDhf4U5OzkbJQutWw
         g9afL889pAZG0aQzxYQVp5VGJm4HH3g136QoNw9XbCcT2pnNeQ0uhCAyAyN5YgzlPZi0
         jJXQ==
X-Gm-Message-State: AFuF++mpZIKK4lhfMXHEfDyqg5UldIjVS8gqP7BzPGyy97NidZpHEIcQ
	Hni+dmR6QdQZCmgrzZGAxbw1uC4R+Qt1jOViD5e2kLDkCKbq15SDrCkMzJfIyLfUdX+nLvEt3IM
	lXkaG4+AkDH1TNIb3CvX5j9cjQKyZmVWx1pskMDV0I/xHbBYdSoeNWpu8UrQMAiv1DS+1
X-Gm-Gg: AYBFou3m6Mpvmjbmnmb+qKjcR0xDwFgtBHIW2suPv6YUHzKBeFvp0MWkR6OheVhYt4p
	2WttkCfFq4UWbMP+1q97y3YD0Y7KkQKX5w9qH1vCY0jzKD8cxtL5Bx5tDq1s5cSE9YOpXrruLeJ
	OwrIn5DMXR6Aqm1T+TFQRCsCc12wAfP0tpRREgHTzvsqw6MydhAYDbqpDLJvUEAhuDowBOJp3KA
	2imSBtruZced6kZeG2DGQcsyIk31OJYOkNu2VGcmcA2AKwiGjoW3zo+7afJcY4WEsvdIOJTkUbs
	uAjiH5/9ytf4yfFGWmW/CgsSf2u9aiPRkf4TEa6b0q/GIr0y51IptQG78T2NdIK6B5JjHsVkhFH
	HfP/jCE/y5oy05Q4A
X-Received: by 2002:a17:90b:2803:b0:39d:f253:5fc4 with SMTP id 98e67ed59e1d1-39df253b354mr12198283a91.17.1789474080426;
        Tue, 15 Sep 2026 05:08:00 -0700 (PDT)
X-Received: by 2002:a17:90b:2803:b0:39d:f253:5fc4 with SMTP id 98e67ed59e1d1-39df253b354mr12198210a91.17.1789474079962;
        Tue, 15 Sep 2026 05:07:59 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfdcb618bsm4905004a91.5.2026.09.15.05.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:07:59 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 17:37:31 +0530
Subject: [PATCH v2 1/2] clk: qcom: rpmhcc: Add LNBB clocks support for
 Glymur
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-glymur-ufs-clk-changes-v2-1-d0aa1c60c269@oss.qualcomm.com>
References: <20260915-glymur-ufs-clk-changes-v2-0-d0aa1c60c269@oss.qualcomm.com>
In-Reply-To: <20260915-glymur-ufs-clk-changes-v2-0-d0aa1c60c269@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE3NSBTYWx0ZWRfX4z+/VdRQW4Pb
 3UsIZZAZanG6DeS9PQxgEIQKjEXWfMP6n/iXReaH8EFN3b8rXfgD09CAjzhlZD4RPEJCogIrmOq
 As38FL6ejs6raeDLYJ64aeuaCw7/Awk=
X-Authority-Analysis: v=2.4 cv=Kr/YSmWN c=1 sm=1 tr=0 ts=6aa93521 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=XYjrdpVuIsIQvarJBHYA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: tw9l2IE0H6FS7TCO9q0ZCfUF2fj59YvN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE3NSBTYWx0ZWRfX3btbXO+D5X7n
 7Lch6+W8cLZsww6iIXcbZTfiihfXflRs/F/77+NHDcdO6JOcG66XjdzKz+1cfLauQW1yFnk2sjg
 1o+G4AUZKPug+Ah01zW5OXY1rEo+93U6JfBMNf76ryw/IywvuEnzJE+KNdRxeGRxNLrdCsc9tI3
 teEpujyd186/TtM2X2YfaPFKl9/bpAgDWmxybqm/x1OVXw+pOY/biSfhkrBpaFxjNgnQzUWv9Pv
 YE3/QyqDsj/7VH9KKGV/wttrOweg3Fm1Zh3uyzYjEaU4I4pZS8hh+yNqcgZWD6f36CFuH6PpyTb
 CKBS1CUGdyxqa0reUa8uIbALqYJH63jZCRPeHv3bWAF9yVQGLo8djFuutY6fh5CaILC3fxGbkEn
 lloJ/jUHkSEIsdGaM9nvH5uU7gnpEWmZ9U4BWRr0w4MWN3/SwO33YHqnUe0++ugACkI9Lrl2eAP
 1xJW/AprO16DafeJVgA==
X-Proofpoint-ORIG-GUID: tw9l2IE0H6FS7TCO9q0ZCfUF2fj59YvN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150175

Add support for rpmh LN_BB_CLK2 and LN_BB_CLK3 clocks on Qualcomm Glymur
platform.

Fixes: ebcb9db98bda ("clk: qcom: rpmh: Add support for Glymur rpmh clocks")
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-rpmh.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index ec8700b6186d8d6dd1911b7a33f086805770284a..3db81c709729b547f288eb10d4aa5dcf63d9e951 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -393,6 +393,7 @@ DEFINE_CLK_RPMH_VRM(clk2, _a1_e0, "C2A_E0", 1);
 DEFINE_CLK_RPMH_VRM(clk3, _a1_e0, "C3A_E0", 1);
 DEFINE_CLK_RPMH_VRM(clk4, _a1_e0, "C4A_E0", 1);
 DEFINE_CLK_RPMH_VRM(clk5, _a1_e0, "C5A_E0", 1);
+DEFINE_CLK_RPMH_VRM(clk7, _a1_e0, "C7A_E0", 1);
 DEFINE_CLK_RPMH_VRM(clk8, _a1_e0, "C8A_E0", 1);
 
 DEFINE_CLK_RPMH_VRM(clk3, _a2_e0, "C3A_E0", 2);
@@ -902,6 +903,10 @@ static struct clk_hw *glymur_rpmh_clocks[] = {
 	[RPMH_RF_CLK4_A]	= &clk_rpmh_clk4_a1_e0_ao.hw,
 	[RPMH_RF_CLK5]		= &clk_rpmh_clk5_a1_e0.hw,
 	[RPMH_RF_CLK5_A]	= &clk_rpmh_clk5_a1_e0_ao.hw,
+	[RPMH_LN_BB_CLK2]	= &clk_rpmh_clk7_a1_e0.hw,
+	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_clk7_a1_e0_ao.hw,
+	[RPMH_LN_BB_CLK3]	= &clk_rpmh_clk8_a1_e0.hw,
+	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_clk8_a1_e0_ao.hw,
 };
 
 static const struct clk_rpmh_desc clk_rpmh_glymur = {

-- 
2.34.1

