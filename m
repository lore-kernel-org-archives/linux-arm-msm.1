Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27984BB815
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 10:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789552922; cv=none; b=i1w9I3pGU3HH/aBTuLq41Pnxjys19vA177DE9u+0/dm2ouOPu/DSwv4WfdcOZUWiPk7tmcyWfX37YZ2dHuspakitFDKAE1RwpxBKsUj0Itf5SY37VBgQWdJ/lGodHKKn3YfiHf0ITLtqnaJs08XrD6MPxfIVdXh9C89FNPCps4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789552922; c=relaxed/simple;
	bh=je47a7jlI+rI7fvwiJQVwy1hQYEmz88kJyW5vpEN1rk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=dG4ej/rKgCTAnIFD3xdJgxhd4PEbojRXh1gs8keWOwhd8KquELa+SZpwOMha2033gpWzg3CuH7FvYNOwLDeUvXZAPpdtzfFYodFilbRWdJ7FlTgCeq3dKJtsGcG3HBCmTgAWYhXX80YfRY0PkMAkHf4tvBVAiLiP+cszu5sm7d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eXS6SVX8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cr82jEo4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eXS6SVX8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cr82jEo4"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G930C1978476
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 10:01:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7//tLcxJPqzMOHfjhQ7X/f
	v4TViekpIWdxqhuUu2YIM=; b=eXS6SVX8j1hoDSzpD4T3eejGBQFcuXUHbA5hae
	IAU0WUGZboVJsO8kpw/Ia9UKhHrgWziEYkaxsIyqpt8JQNheBdjxzeGgwO0tqz66
	K7i9zmGq+GDCf5KUQUODEjBpU9m91inzLfT/f7VlKtMn0bv620s/Oeu5vBlh+rYb
	nVhJc43DRDKP/bGWbbkuR9IiP2I0BpK70Q3LkmIr4Cp+abqgM3/cSfZG/dg9k6PG
	QJXHMSdpkJz4tpJaC+C5iSmMbMfSw86lulQKfyuH11+shRadSkQba1OCmnyc5xoW
	nL6S9eIESLYqvdTJOCyOQG6L3qCxqiKK8nOZQmxSJ89dAodw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqqp3rbv2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 10:01:42 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7a04805f8f1so435348137.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 03:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789552901; x=1790157701; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7//tLcxJPqzMOHfjhQ7X/fv4TViekpIWdxqhuUu2YIM=;
        b=cr82jEo4UlInRBEqvVnXLgohWyb6vlGVQ27kim41exQi8QsWhbPnQF4yOtE12urdNd
         zuleNc/xsP8wjMSjhNGK9ioKr3EeBYRmEr6cS38QVHNup3Yhs7QzG32zk9bpX7Uc+OP7
         Z3IDWUt3kXm3BPZfScFglNDxnKv+F8XFFYv8ZANmdWXwkOXZXHkJchqLi3xnKw7aVBHE
         LYbxXfESgZLyLDVdItDQO/dGuGYRi5Bg3K3wD5yiAW+EVSM2ipdm7pWE7iKZQwNUASbU
         Q5kLc+Sw8TBcdUxe84IF0HnwlkW1Bri4JRTYv8fduYcWis5tQfNV/0T90NRMGYRC4br8
         k5/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789552901; x=1790157701;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=7//tLcxJPqzMOHfjhQ7X/fv4TViekpIWdxqhuUu2YIM=;
        b=mI2AXr8rz7HjZES6EtaTZ1gTWP9gMpsj5tg0oU5ueVDm+tvJOcs8XFFiZDofPBnKaP
         HEg+EnNw929qHvwhYnsNGERxgaZmFNWcJ6/123ruL3836j+rPu88thjW1c4ZsaNKG01c
         fEiFMuc/cmeBKJirA6v8MnMYB/OTLd4hXEbwTM7AOV0W0+6BSH/sCUHNDvwk9BJr8op+
         WbmfQdyXfOEG5CRR91mrtq4y6Hjoln04CFFbRQMTlMXXFsXYtLdOMHO2x5rIlqLdCI3W
         Tso0rhqUQl3a7HVN4PtMw53Q0EiOyehKRl8q7J3t2BjH+NCiW5SmzjpJDaR406tWxDSK
         7xaA==
X-Gm-Message-State: AFuF++nIyZqxTV05BtoXRdALDjjsi5EdxMtkSejnR/VnZYR7pwAc/lRZ
	3aXps05Ac7ZqicSnKymGpX14SG57AKq33AM8EAKNEDPrHQ/g5QXfL2cOmDXD+JDbWfZD3QdUKcf
	zfVfR5s0jPJdYF6djZAePqaKz4b28M1TXzPNSmv2bT0jUXsteSDhEhlOVpfawas3Q8ca3
X-Gm-Gg: AYBFou0hOAe6lplQYi16ZnU8f4kffL5g9G+L/HY8LVlMGmsgWjb07Kv2Lgqu1FaT/pU
	n0DVaYBQZTdvR2/9QnQL1Qen2RT3XdGKTyPcumrxxT5aCqscvD2Cx5OIjMXxPJC6jD+Hs37m+m8
	B5sp1NObawKc7wGXi3a52cSlVozyo3Pvr4+yigIdbizTV/pmQmW2+aw9xPNfwqxt4CdOin7gDE0
	xWO8+IoEiHyEp8CK4QinPCrZ56l1CGNXczyO81eIA5svdMHRVXBZety0R8WVCIQtXvB6fxNJuFb
	Cso7Ndp4WOXNGYS9P8niYvGhGk3szzQ+5KwxAEaLB/0KViGNiniE7TEignUJfar7CkpsYJzVpYM
	1EFZkk07e
X-Received: by 2002:a05:6102:5792:b0:7a1:83fe:45e7 with SMTP id ada2fe7eead31-7a183fe6278mr153275137.8.1789552900887;
        Wed, 16 Sep 2026 03:01:40 -0700 (PDT)
X-Received: by 2002:a05:6102:5792:b0:7a1:83fe:45e7 with SMTP id ada2fe7eead31-7a183fe6278mr153117137.8.1789552900350;
        Wed, 16 Sep 2026 03:01:40 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83fc3da0sm47619595e9.1.2026.09.16.03.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:01:38 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:01:36 +0300
Subject: [PATCH] clk: qcom: gcc-qcs615: Fix GCC_CPUSS_GNOC_CBCR offset
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-gcc-qcs615-fix-cpuss-gnoc-offset-v1-1-50bbe728f2d2@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAP9oqmoC/yWNywrCMBBFf6XM2oFmSCP1V8RFnU5ifCQ104pQ+
 u9G3d0Dl3NWUClRFA7NCkVeUWNOFcyuAb4MKQjGsTJQS67tjUO+3/DJ+YGBuQ51pkMf38jTooo
 hZcbsvcqMtCdnzWB7MhaqbypSj7/W8fRnXc5X4fkbgG37AEEaKCKNAAAA
X-Change-ID: 20260916-clk-qcom-gcc-qcs615-fix-cpuss-gnoc-offset-272641a49214
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1285;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=je47a7jlI+rI7fvwiJQVwy1hQYEmz88kJyW5vpEN1rk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqmkBc29bWbeMaLLzvmUQvZvX+R+TQNXE/AofO
 ZWj43HEwwaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqppAQAKCRAbX0TJAJUV
 VsTcD/4gC9RoYkQnsB5Wslf8Gh+Pdnp6rRUlUthBWvvtn8gRpL2U1Du5NfQUryvP4XdgO6BHPnj
 vllwVAxM3c3XPmXwJVDQDwEHj/LWXqhACs/6Zwrc+rd9uWBY4RkP0das2qIJxvGMsUmEpOf/5d/
 z/9O7gcrYLFmVlEL1bvYZ/BBM1uoNKqhZ/8CQcS4A3tsGHXBAaR3WJtBCDTXfG2OjKGjdSJ/6qP
 aUlu1CHvucwRXf3Q6uYFIf6Omg8malhCW3S8qPzthWYSJcppfjfEvNF6C9/vz8Ert1YVGSAYIE7
 ljrlH8Tz0QYjdnKra+PNKPIgTANGUGkDIFEcdSRWxYX8c1LpY3tv4TnZ+EUusRz5VVEgfAPenuM
 hrcFkpbTH0IfdO9FT14vzp5EsIJmHjHzbPKvrjz5UoeD8n6qmtgcGNkTMO0LvkrVbcgP03Y3uV4
 r4hyH7eMcCKZQQ89RbXhroZ1b/94xrCbP4tEwwRRXplLc6XlxWIS4iQYf2U0QdPO9VcR2CO7RpY
 lY8bXDc18/6U+qlXRNtseoFhLeSAAVj3s6s6vAIbMjeU9SJnHIh8tfHCeC9QxOlZsEQKnnbjhnr
 uYj/c/nFMJBajJzV5xnf2r9n7v28IzaAdC1WJcfvbJWKNpl0ouFOqp0nxoyAuX8/MGREcnVb8Jr
 OJJh62UToivj/eg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzMCBTYWx0ZWRfX9UOdARNHIhW2
 nVci/YBsaTj/rV/aFs8ZthHyVYrOjvbq0IECS3003KbASwXqbFkBwtr5hms+e4wg4gbatXKO+Tv
 ymXlYwPNeQ68gZgGVwxdyCgmcy2C6qIX5hvPDCo+vJG7o/3NBHJoX4VRHs8t5dgWRTW5mu7mDQy
 WbD4COpgi8vy1Nh0O9slqR9KnRU8PrubToQCtneEphXZ9ETn6E5TaPKOnmpVarvMP8lPO/bxdF5
 XsuStKwJVAcjEe3fFS3pf/V8tgCDZClKfzFRTDvO1zL1WDDyly5KSwxw5SP7py2NoLTsFgehK8u
 UCNzPzz01xdf4yyadUbq2rkD9WAO+5ymsxTLeqFmFXS6xAMZwf/5vH0AdxEwpEJ8Grxreer0kqz
 U5imOte90wq1sZiD/Hl8rVpXtw7bIYic2IdFTQuRpSWAuxiHRDwDW193p9dfY4Fg8/wef5x0udW
 74Nau05ZirUrMWiYzBw==
X-Proofpoint-GUID: STHM83solpwetL-B--LqAhldtwm_W0tP
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzMCBTYWx0ZWRfX2fJAZmxoWvi3
 3G3YN6d3Ub9Dg/X1SA3JPv2/avhoOAyAyNF95DD3m7y5Y0bVyMpQ8YhH7CBIctB+280sMHNOERF
 Bl0JV3wfdJgr0uUQ7YSFFtS/O+gBjak=
X-Proofpoint-ORIG-GUID: STHM83solpwetL-B--LqAhldtwm_W0tP
X-Authority-Analysis: v=2.4 cv=F/DC5ahN c=1 sm=1 tr=0 ts=6aaa6906 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=uLPiVhPF6TeGUxki5eMA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160130

According to the documentation, the offset GCC_CPUSS_GNOC_CBCR is 0x48004.
Drop the extra zero, otherwise we land outside of regmap range.

Fixes: 39d6dcf67fe9 ("clk: qcom: gcc: Add support for QCS615 GCC clocks")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-qcs615.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-qcs615.c b/drivers/clk/qcom/gcc-qcs615.c
index 57f8c80c6f32..1a6a1e74e805 100644
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
base-commit: e6e35979777d646fe3c7c94dca7dd32fb25d45f4
change-id: 20260916-clk-qcom-gcc-qcs615-fix-cpuss-gnoc-offset-272641a49214

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

