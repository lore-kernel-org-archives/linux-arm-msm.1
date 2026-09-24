Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C11D47AF43
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 11:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790250435; cv=none; b=OaBrMhBsD4xHDw5TAVYoSsRatkrzRbhXqUKL17Q6X7L1UASIb9EE08OwhYXi8tc/w1Brg5EPZZcGcLHyNJghqkz21PXbijHw20xeHE1l3FJIks9T3ulovueK7IwYwaP7haGzm6DKVzqAr+rKqYr2Aj1WkGh4BrDPi0c4HROJZco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790250435; c=relaxed/simple;
	bh=+ZZoCETzWv0YK42XFmBQielvqyc3AJGlcA0l9tIyK1E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=mRFHh55cDOmzO3287WN7aSvWotCBBlPyePFmcuhCVEq096SutWIC6aTOteoZwGsxlXfyy6Nd39BPgkigxhsW850E/SS5zKH0mG9wyZW8BmJuoEvsBuenyF6EyZ9lre3H8+nNPczPyUZsP8QA/h+ZjHd81LagoOiReVj/inMjtdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R0dG4pHf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JQ2ijA6L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R0dG4pHf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JQ2ijA6L"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OA64Yv2332996
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 11:47:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=tAdxoFtPLUwbYw62OuSece
	gmm7KVlJ1mhus1j1hQCP0=; b=R0dG4pHfLXCl//cq/dVEfYem1jgbKcJW7dOqEL
	7OAoeD9TLqCVGepd9o+4HK4MgOU5e2eZb1umyBPDJOWrg48r1bMG4PKgnWDyje//
	KTTWcxFfXwMpTUUKhaU9tmLbSReJPVXmDViwBL0PEd0NIfNtvFbNf3FCA7xj1XKE
	zcBkDobd8ygN5U5wj/x3sBK43xzeH8jb7KONRY55e0WLhNKpjdZkf+ggDawtk0uY
	+lXqLlueItDZ1V37uguJ/elNKLMmzV4HWx1mlv1TeLhKB9Vs4sJANMOE4RsmyN5B
	5P3hBcDY3bo0yfIEmix8u2AvxQh7JEMRz2Qb3UA1ntx78Atw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1tjgbh6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 11:47:12 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93be1861d2dso297254685a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 04:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790250431; x=1790855231; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tAdxoFtPLUwbYw62OuSecegmm7KVlJ1mhus1j1hQCP0=;
        b=JQ2ijA6LZPqDJAv+glngLa36zBqzbTdmRhMMfmSBo5YNa69MH1uhj+A7WArOGctvng
         e5oXlELCcpb8Qx/JXkyBvc0SamzCVw+irdu9IizDsb7dvkQ6J6s/LfQy0GlCaggi0JV2
         8lx7XXoCHzW/JtRc6H0WIJ8traD9tJBWtBXzOQfp7S0eQgE132mKBQQGD1X26V+Ja3lg
         CDKF5SCPlgyX7t2l41Y+xMTPczG2FIyFobz4jTFthX9yq6isnl/TdqRrOZf+5yT5GXMT
         VmC0i2ahfPQ+N47/6dJy1t/+nG87u174JKm3PjF9s6DN+Dkrymd9ARdsj6lKqUaJp12L
         a7MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790250431; x=1790855231;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tAdxoFtPLUwbYw62OuSecegmm7KVlJ1mhus1j1hQCP0=;
        b=e4l+qM05+GwkvCli1ZT876G9SXQ2JfWRxDZrapdr+DlZwDdtWBPTLedzZRHER7uZdM
         dMs8i6mUJPXRGL4j1Jf9i8Gdbw6M9+Mu9EP0AZJtH8Bh35GT3mGrMUn/tImTlAUtWduc
         4K6WX4wzilutWuY1C7bME0TWfdYaq7bA4XBCysCX1OU0++G72eWAxhfNINj3ijUdNlD0
         tLTiBEsg9oO7Ix5DvfXybXzP0yJD7aPmap1sS9PRYwc+RuW8epHePXPmnJ3kejln9tgB
         3dheOh99wJFPHWuSGYZ+1vPuNUWGuWTShCkaR2eeEVN1kkN3Go0h71Skv4boUlH0dAGF
         Wl9Q==
X-Gm-Message-State: AFuF++mFug4rFMsCNFHX01bCsNVX8BoKz7qHFAHawRi+04kMADFLp1ZI
	dSoSh1LzphsyEUF4fg6mFnKJK5CIoIMG7nXwJ6LZfE4Sbwyl3sxWJaG7FSktkkrhNwBvOx/o4Wt
	TPw2nGqywNRNx5U5HOw395bLSUKj7z2mvhbScpK8PPwe0sS9HuZuq/owhr3wHvxb/cLuoKuDTZ2
	BH
X-Gm-Gg: AYBFou1/H/BcObnAZISHF25mT9gODatdQgW8Qtb/O10iG6NBkVHQY4sew+nVrFiTJbE
	VoWj0HI5TiH/9MP8yNYzkcP7ybFL1osXvDTq31J7Gz5MPcuP1lAXnvsBSBHFnyJRYsQA/DF4IGw
	dv/uCD2z3f+EJF00N67J339uhzs1/mXD+O+aWGndK3a6BpJC4QfiZiyYA3e2rTjQ2xvU6KOGrda
	wivblq/svsACYqZb2RlS1PxZpjCW7ES0V2OKGajwrKmAaP9Q1lh6mPnZNOaWzWTcGCjXd7ZooyW
	0nUI2H7BDiol/MfNiKgCea7VLYvzTrEOtEKrKwErQNafcDPBUc0PtSsWpgD+7akmyG2AuUOsTBr
	zfEHxxGN4
X-Received: by 2002:a05:620a:394b:b0:93c:2110:14e1 with SMTP id af79cd13be357-93c3638bdf7mr228846085a.42.1790250431168;
        Thu, 24 Sep 2026 04:47:11 -0700 (PDT)
X-Received: by 2002:a05:620a:394b:b0:93c:2110:14e1 with SMTP id af79cd13be357-93c3638bdf7mr228842185a.42.1790250430539;
        Thu, 24 Sep 2026 04:47:10 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5cd4d12sm58500895e9.4.2026.09.24.04.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 04:47:09 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 14:47:01 +0300
Subject: [PATCH v2] clk: qcom: gcc-qcs615: Fix GCC_CPUSS_GNOC_CBCR offset
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-clk-qcom-gcc-qcs615-fix-cpuss-gnoc-offset-v2-1-67275f94aaec@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIALQNtWoC/52OQQ6DMAwEv4JyrhGxIJSe+o+KA5gE0gIBDKgV4
 u8N9Ae9WB5p7dlNsJ6sZnELNjHp1bJ1vQe8BIKaoq812MqzwAhVlEkF1L5gJNdBTeQXVjIBY99
 Aw8IMde8InDGsZ8AUVSyLOEMZC/9vmLQPnq5H/mNeyqem+RAcicby7KbPWWaVR+4f7ypBQhKVp
 U7xarDCu2MOx6Vo/XkX+iHyfd+/7kKOs/sAAAA=
X-Change-ID: 20260916-clk-qcom-gcc-qcs615-fix-cpuss-gnoc-offset-272641a49214
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1623;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=+ZZoCETzWv0YK42XFmBQielvqyc3AJGlcA0l9tIyK1E=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtQ26X/dqRnBkkFCiHD5Oa+8Ih0/O9h9tK13Ym
 zN6QAhZhb6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarUNugAKCRAbX0TJAJUV
 VkiUD/4uj1sBVbAhgwdZuxZJD8jMTsv0l9vf935v4+GVb/Rf26d5NbW4Z/H3wdBPnRTx5PLocHY
 bH1arAJROojA8FZD5/BA1Oj3sUcVkaYSi9nSVpKFTrXIoqZiS7/ya9y68sdNE96QebvPLTUidrP
 H5RQoq6V9HxlRSjUeoz41pUiMGazesa29PP8tCVxWzAGwi5CG+u5qBn21gidcJjx6+/lexKMO73
 2gCPdUG8O740azgmEM8sZSnJzMarEZ4gbXNHbdVju+nqUIrdTH8+vbkIt6BpqtxdMGsnfowwsSg
 B1cVKPZ+dI9m4l7H77tVAo+MKBNDGAwm9awZQOoxMhwOqyJeGrmMz95yxmhW4vuwjM38eXULtzn
 /Z2gb8TzR5QghVljWBUeffxxpu8a+Oa14DjJmCClEtyB56FBIviovGdAmbOP/nbvtPAbrP5MhcN
 dvUf5/x5oUF60ODv2ktWFpbDnmvEqYf3d2y7NCmcAfHaKVqD248CWqK48B+8aE22ur5NaWL7hX6
 jPieTtxxwk+ikz2PXbm5zHq9ohDhd0LPxrA429QZYEwUti/Lv8DGNVMGNV1SdVttsSGJjxY8uqZ
 ctzCHjpaJwy43NXHc7XiWeo7LeebeSiDLDIy8bzERJuwRML0bERUB+KnsKPAjJJb6W21wOJLf6R
 8SfzxWBZmKPsXOQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: Lz04I2KkOW_JM4fKrRryYLXJOM0T8Mb8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0OCBTYWx0ZWRfX7UPd/uff32bg
 /YNIOMbcV9d3sBW4GVqJPMh0Z1pF7EesUQJx8Nvsxn1DQSUkrSjlaC3o0JV5G7xPTn1FVk1Lin1
 VyH/OWlsB54pgb1gtYg3fXSJsFp/XlUKiuSGS25LSs+5aa6oxZtUDzwfsAHWRTM8/dS9JQW0A2M
 xOw5KVbftI7WsWIQ8l49wKu/Y5+SNPi9fno7uOupf+KBeOm/vithES0+E41lJDohO1Mcv1Hi7ZY
 QBLyNob8Fmfv5C6mGAOQrpXbxjSl0XotvbmZHb0BSFRnuVZs/7Hdo0bjNgQLqJX4p51T6ik5D3J
 NFAbwN6PeiMHKHjihsBK5Ol8gjO7wf3QBTpcPiN5WssqmJDIZIVXGq8pnmuAWOFssY12/JC4aei
 QCWiXmRjgFiQXLOxmy8+CT7MdaR0UeMiuac5XkldFvZcKSCzs4SMTbtC2turkC602PSdyDJ6mQP
 w9ShBAbIO9JnQ7mDylA==
X-Authority-Analysis: v=2.4 cv=cK11IVeN c=1 sm=1 tr=0 ts=6ab50dc0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=uLPiVhPF6TeGUxki5eMA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: Lz04I2KkOW_JM4fKrRryYLXJOM0T8Mb8
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0OCBTYWx0ZWRfX0qsplxfcmN+k
 I99cCfRijf5EQlvorQWNNKEwCf2XvFu2O0Y3fRIT1h9tZfgoGwv2OZ8Kcu/2gHmMOKWLmPAmizI
 Mq9JZ/NbHsDYhE60M7zRZ4TLFv7sWmI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240048

According to the documentation, the offset GCC_CPUSS_GNOC_CBCR is 0x48004.
Drop the extra zero, otherwise we land outside of regmap range.

Fixes: 39d6dcf67fe9 ("clk: qcom: gcc: Add support for QCS615 GCC clocks")
Reviewed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v2:
- Rebased on next-20260923.
- Picked up Konrad's and Imran's R-b tags.
- Link to v1: https://patch.msgid.link/20260916-clk-qcom-gcc-qcs615-fix-cpuss-gnoc-offset-v1-1-50bbe728f2d2@oss.qualcomm.com
---
 drivers/clk/qcom/gcc-qcs615.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-qcs615.c b/drivers/clk/qcom/gcc-qcs615.c
index d19792027cd9..8910a8badc27 100644
--- a/drivers/clk/qcom/gcc-qcs615.c
+++ b/drivers/clk/qcom/gcc-qcs615.c
@@ -2999,7 +2999,7 @@ static int gcc_qcs615_probe(struct platform_device *pdev)
 	qcom_branch_set_clk_en(regmap, 0x71004); /* GCC_GPU_CFG_AHB_CLK */
 	qcom_branch_set_clk_en(regmap, 0xb004); /* GCC_VIDEO_AHB_CLK */
 	qcom_branch_set_clk_en(regmap, 0xb040); /* GCC_VIDEO_XO_CLK */
-	qcom_branch_set_clk_en(regmap, 0x480040); /* GCC_CPUSS_GNOC_CLK */
+	qcom_branch_set_clk_en(regmap, 0x48004); /* GCC_CPUSS_GNOC_CLK */
 
 	ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks,
 				       ARRAY_SIZE(gcc_dfs_clocks));

---
base-commit: 3d7783543c2646af69ad65825e810060494bea21
change-id: 20260916-clk-qcom-gcc-qcs615-fix-cpuss-gnoc-offset-272641a49214

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

