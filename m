Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E74F4EE840
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 10:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554677; cv=none; b=i18lKvllT08icnDydQQQjqUFW0GKiuJPftXlXtmlP581ogXbiA3H90mqzGeV8cpt4bVzpIokjc38NxPX64AaojLeBDoM++k+2NKuxj3lHRwM/VodD1dBjAMMBgHJUnHcvlpoMsedPM6ZAJ0aE+vdXjq7U2VUyGvy47syskVP9kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554677; c=relaxed/simple;
	bh=ceySCAJ2UKzCOMrGPaWITOdmnUsWyZZP02Z5z4V1xcU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tOKbXDhp7HFe2KAdjtUN7RG/ZFG2AFM0pgrSUf4DELrT5Y2vM9khbyYdZaAxUwPknIjV09et2GtlCTzmqAit83ErNSWEI3sCUSDjnCNIUyH0glfxrInc7y+8kYySW2TsGsRpL8UP7hZALxfdWZfNMPKfKn+Me3NhBHZPmEyk7OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N97EmyEi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZiplyQVW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N97EmyEi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZiplyQVW"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92eB82348103
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 10:30:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tpRg3+sla39rNmV5CVX30fzQnRmtP0Sx9McGTSZpuPM=; b=N97EmyEirXHuBPaw
	+cVBN9i95JhL5fcfPVDMN2J+sLxrO16TzgJ+Of4tMXM9vY9q4u+0uRCJQx1gjIYM
	h3NIVPFKvUqKKxWAhyvE7LjU+1XTd4s/BJIV4yGR72K1BGep4Ilsw7DiJgzWvEcJ
	SP/DJ5z1YqAo8cDRtrhx1BrU69rQIaaJEQJ2DD3ZxQQd+k6svVx/jXy4Z3l1jgjl
	5x0HI9Fkoysue9bVq2jpM4+/mffTy35YBlL/2FfOBtFdHZRe6SHXIHcxeptf9iFU
	KhbwV/dCts4ITGXIIEf8rzFz5+afRmAZU8paE+c6LfDF8oGYCrUJuFalMy1U5sx2
	58eXIQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqdywas8y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 10:30:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-936aa34873bso968181585a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 03:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789554652; x=1790159452; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tpRg3+sla39rNmV5CVX30fzQnRmtP0Sx9McGTSZpuPM=;
        b=ZiplyQVWIjS/yiROCbeY7gLkFZBvpCdXop+mU2ZhdDfXfanYYShsnULJ0ntfmPXgnH
         Xy8KGtTRwSR5l1cejC/5JcWLZnxQ7Ij/coFzVlysin9cJc0KRp5JFpRpys9aV7Zf/kUM
         l80BIeTp8h8wfkxO7yL+60xlqxYhxrDk1WSe7p/yoLjO7W6CaI/hGYphSupnEQxteSXb
         LcloENvCRFfBEw5Bky+QJOf+AFdVqwMx2wUKG7DD3IzB6MXf6kDga7qkWcoDxgQslMdo
         sh1gIef3gGbI33+txREHkREYBTpImjw2eg4Gd6/0jjpBpeFSz0V7bxl+Ph7Bk11N6SQU
         /NBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554652; x=1790159452;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tpRg3+sla39rNmV5CVX30fzQnRmtP0Sx9McGTSZpuPM=;
        b=mHQ4v+6fsSCQ9IQzYgHtO1oxSaoZVNFUpUErO+vVNMOpPkyB1favErt4l+LArcVS14
         rJAKaXTSpHrSZV0gtUKBwjRK6JNQXTu2kt3RjW4LwtZg66OUTVBdshJTk/Omd4Ic+GjS
         JbS3CtbF2Pl0NwokoHFLOYbwdklsb5H4LlF/S5Y/gZZRIJpeYkGVvQ/nuGjnwAp3eZjS
         iksVGTg6enWDgKbVfLT5B0XLqjMZC3QlcMNrOSrmLLQiLi7G2R7eGIGa4kvKgsxa2LVR
         sUzwzSGS7Av8sm/2tDhRfxlYmEjL45Vl274/2H7rQXmrogLvIQLwPOKwWQYGbbKYQKN3
         R4bg==
X-Gm-Message-State: AFuF++mCTau/PflrBV5cXY5W6aaW/9q1r84vdLDHHBctzUZ7JIqY+Kzs
	E6xvblzhxAmLBkwqM6aglKlxmKg0j4Xo4/DCklyw19Ps6jfDiPz4Mje0q01k1JPTPRXUqiJ4AGf
	gW4ZdHZ3KW69bcMwF9HAXtfZWEtBD6l5tpa0au94WPH+EwV+93nyKudxeRBNQ8SnJK9yF
X-Gm-Gg: AYBFou3Rzv7hGBxz8U0fjrkBM/fM26u/VquZGwMvNK/jt3TBcnG6MOfV6GBPFFNAgYb
	GKn9iEywg1IfdI+fmg30miDCABC+LT+VDhgI6JAgvSEIXTaHNh2qGwxlk+/6X1bqf6BSYlIcrkk
	dD11XnPdgpxnjJGILh1gstHpFaUzD1owM+uJKBFjbzYOo3hlbOg4m+d1DxWEOK7yYaaOw9QV0OT
	qPEzP6ebCTaMx1tOLgN0W/wHswjJ4uVtwwQfXhYQXAA2IHJDd4/J41VPSWKl/TyeSE5zGBXh8ox
	OxY3koA+lTby5Dn1kofSVucA5aoOXbqj8QcYcAQXgJVjVfsufFfcMIaCM/h4T8pH4f5mVyWuFSb
	9bEH3zhg=
X-Received: by 2002:a05:620a:640b:b0:93a:344e:3d3d with SMTP id af79cd13be357-93bb7952c30mr299731385a.42.1789554651869;
        Wed, 16 Sep 2026 03:30:51 -0700 (PDT)
X-Received: by 2002:a05:620a:640b:b0:93a:344e:3d3d with SMTP id af79cd13be357-93bb7952c30mr299726085a.42.1789554651414;
        Wed, 16 Sep 2026 03:30:51 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dbb0c1sm71633805e9.14.2026.09.16.03.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:30:50 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:29:01 +0300
Subject: [PATCH 45/48] clk: qcom: videocc-sm6350: Use common probe handling
 for always-on clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-45-25a24e50f82a@oss.qualcomm.com>
References: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1619;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=ceySCAJ2UKzCOMrGPaWITOdmnUsWyZZP02Z5z4V1xcU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqm92lpQdDIVhwJtswhgBbYl1PCWCOshBFDv1C
 Hvt8eTpRqaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqpvdgAKCRAbX0TJAJUV
 VkCpD/9p25/TDcjmOxsChTCBndL0w4M0yWLJqolwW2LcmMwmcSJyyEd07FP88ANnK9xdj9ZE+0A
 IqAxoIaldFSuqUgpgXmNqhhnuh1rZifZNxEEfcmWUvgLFaGhKr0FpD7g3fOM+AEWGlMHz56i2pH
 y1j3pcF8YatrFAjis+aFLXxZ9gDH27Ipcpxi6PA8icVVXlaC2pzk9GBrHyP7J5hwGbwY13ywXbu
 SNkK3PocsYHTEGdLcLHuRn4U+kA2sla3RDDHYQ1Zz05oUQMVbHc8B1rsGFe56BDA90g1l9naTZg
 OmIuKzXgzEqSeDSA9WsV3sixeNUrSYPlLpsaRE4+GbCJuG4gqY18dujA/spxlY4i7OiyV7bsY8v
 +4DOYIU/VfFvRwu7Bu2M38rr3dgUNYE+EKuDRuV4al8IsNQcG+OARDOtnn7ngAK4iOVHIEFCvAh
 LjBVz0aX7Tu5714EOCZk0loAXf5WH4osv+q2NvBFHCmngOuNbyHEBmdp01c8Aa/QYQIPNBzkxdc
 C/lO1ufJ5cCXuvSmNKkPIrBsdA2egsr5A9OptTXILUA3MiJWSeQCa1BxHxxsNJwzOAWhpb7Kbpt
 7E6ureuuSp2oMvPQqYwt/ijs38X9zZAFYoPbwrat2TnMHxAbpt28NHK2zSmi0K3WwFzd7Qw9a/f
 KxsU0+3oFbUnyUw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: lfKt1jjFnBWbQ4WWjfSqs8RWDyeYeDit
X-Authority-Analysis: v=2.4 cv=aJ1lOr9m c=1 sm=1 tr=0 ts=6aaa6fdc cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=35KR4dZN77wT4OcJcwEA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX8Ykm7xi+H+Zv
 aORpdV1ZBojMBpSWCttn5zG4JaR+scgVxPAXq6OTL5IlXsn4IK4nCSNVQDNWH7iLqGrkNf4P45h
 i16wGc95yW0ZWTOm/yGHL7Fds9bCPQtcw5n2s4XASDSaUG6T4ACGuX2jN8UY3qyX28/83ccJjD1
 rJyac7kBqpNe34Ea8j7qKMio4BojaNFHN0A0WqjFf2Hdgwst5BYtFboXjyleW6oo/4dQDx2bVUm
 K1mNNKHLKkoC2uYOqT9PC81fQAQl9BPgoqnErrt689PkYmm7LC5PDDOUB8YNAv2h69xwnn1YvP2
 fco9doyCS9OklggLseGQIQLvAT9OYtgJn4ZS4jGkEYv43UfgBfyOpXifHEw6aQoTsDH/nZdNB5h
 Qd8GW3U7VywJtMjQI67SOoHEllfl94IRtIHDcrtDIAmSfC9TDYkABpPQ2/g5CsFMXCAdo4xQyi4
 EO7ar99Pg7U0nkpuY0A==
X-Proofpoint-ORIG-GUID: lfKt1jjFnBWbQ4WWjfSqs8RWDyeYeDit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX4oDp/o+jmCy3
 Kz9A+HNsi0jWQ3j9IpX4qztiIZ/DbX23QOhBdU8Dlw9iXxDaGPp7VMj5Imbo8FYlBpaII14Jyyp
 JaLipRqsvgNEvdyDnglTUMFYjKLH0x8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160137

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/videocc-sm6350.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/videocc-sm6350.c b/drivers/clk/qcom/videocc-sm6350.c
index 34bdc5aa865a..d3926f87497c 100644
--- a/drivers/clk/qcom/videocc-sm6350.c
+++ b/drivers/clk/qcom/videocc-sm6350.c
@@ -311,7 +311,17 @@ static const struct regmap_config video_cc_sm6350_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 video_cc_sm6350_critical_cbcrs[] = {
+	0x7018, /* VIDEO_CC_XO_CLK */
+};
+
+static const struct qcom_cc_driver_data video_cc_sm6350_driver_data = {
+	.clk_cbcrs = video_cc_sm6350_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(video_cc_sm6350_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc video_cc_sm6350_desc = {
+	.driver_data = &video_cc_sm6350_driver_data,
 	.config = &video_cc_sm6350_regmap_config,
 	.clks = video_cc_sm6350_clocks,
 	.num_clks = ARRAY_SIZE(video_cc_sm6350_clocks),
@@ -335,9 +345,6 @@ static int video_cc_sm6350_probe(struct platform_device *pdev)
 
 	clk_fabia_pll_configure(&video_pll0, regmap, &video_pll0_config);
 
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0x7018); /* VIDEO_CC_XO_CLK */
-
 	return qcom_cc_really_probe(&pdev->dev, &video_cc_sm6350_desc, regmap);
 }
 

-- 
2.54.0

