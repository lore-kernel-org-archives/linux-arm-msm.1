Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E57E0483BC6
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 10:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246476; cv=none; b=R9hZyzGasGWWLVB0hluuFK/Y0D4o1B9cwlKILUKLtR3/eAdJWwecuCqwOll/uTlYcTCmkG8Z1XntDE/piqdQ/PmMbv788KsbdjDZDn7bW3NTv3ltgl+BNlM3SekkKkaZbbYfNdvjoWdw5HnIuLom5FZygY3W2iXIJ5Br0bmSCys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246476; c=relaxed/simple;
	bh=ABnh6kyCokdb5pwuCMF+lEUTPDZamtdijG5Bl1hQ064=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qEoGQim7I+gnQEvS3aNMXL/1zteCVD794li7qbyzgOHDiE0IlgcfSq/BnluD4acFPkTSXCu2N+035wynamQS3Jms41helP17UWDVVL8Cnxgy8YOALAWYM1MCaDKsvFzyaiJiJyI/aASZULPdUdKUJm2467GeM/kXqDKMha8ODTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RcD7B+es; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V6nxm9db; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RcD7B+es";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V6nxm9db"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OA3JNo2483628
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 10:41:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FVmzumdP1e2ihMql0qB2hUM5mPDwW3ln0MOGuRt5Y5U=; b=RcD7B+esCEn6Ixeg
	B48sqSIjPbpefP4TYA1if8nMtxmzEV3wCL9N33mm9wD/oRnhNSK2nSd5qWY1kkj6
	iEbgupR2Wjhs3xQOFaDD2TWwHgg6Z2fcjljT8u4R6kVwHSQNji3jatp6dM7UWjb7
	NoQ6Fn7jQ4C/J0ioojDMlgXgZWI155pYslcWjq0LmCo6eVABOeHwxY/E11D9YK64
	IgLG5OrhWlNTTmkVdFxKuO1Yne12SUstTE0EEuUeRAFVVDo5NI2inIrMtZ+sfUZA
	1aXwEFZMflIeRDr9s6i3jWo3nehsCaoT1bzzw51I9pRLIAjgYcgOe2UWfqV/Hljc
	IBFz5Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1s904fg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 10:41:12 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939f3426a7cso401735285a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 03:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246472; x=1790851272; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FVmzumdP1e2ihMql0qB2hUM5mPDwW3ln0MOGuRt5Y5U=;
        b=V6nxm9db4hFkPUGpL7iP8B4V4BEW9EgwVSU595P64VOpa+XjoWuMZOKwnwBteW4xDt
         JZ9ARQgh8L/6Wb5k2JlLAgS30cfeoRvva+pLbo9bh+wBBQl/5K9encG3uFqe4RQDvVgz
         D1G6B5IzK22r5Gk7hPidN/7VfdlGnxHnFefANAOuX75beNNRVUTSa1JySul7S/GS1hSU
         3LHXWxyeQaVVcrHw5MXNoOZSpR7/DZONZjBUdt9oENdU0fF2jz9V2VrD94fRoc7QMmos
         TczL2DBe4Kq7Kt2TtTY7yeYDnjQ5viEClLi2itvDKpsoFIfNmCTvNOE5Xeab62oyr0y+
         XbrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246472; x=1790851272;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FVmzumdP1e2ihMql0qB2hUM5mPDwW3ln0MOGuRt5Y5U=;
        b=qV7IYdmKG10X90gOhq/UmNiSfMxOuxJ/2IudoklvONazotWyS2OT5f/SOpxlOn0dEu
         Dh+U458Yzm6cm/p1aovW2PwWeT9A382BboL0yPbhuUQsR58cwikZmQCBdf19x7AMkMR+
         kq3f/MF6CGUrwj9Ffo2XxWtJfptivC89olPng1w4pXIWQYBiuhpfFhYUHGb8fQkPqVBO
         ONfG8TEWZWR+udZ9zQG1VnLaNJpKuu5B3/Q0CONU1gJUqtH0xYnWtjqiGSH20QjIZ9Gt
         aUGAa8Ynq9qD5TeSM9XmV23g+mU40DrsaG1bUy/pzC4eH9dDB34Q7obfikX8iVbRkSnX
         4FCA==
X-Gm-Message-State: AFuF++nItm8KZ8S52EKjPwldpT1mjnKy0y6OZ96uE1MCSXirEarB+SGh
	obwC4Za5qTaGNhVAJgo6VjYbWTa+dVAwcbQn4L0WnRImHZh4+t4i6RmYTLWWW+CuoTQm1rzdNqW
	baqPn3eog8GIhQtIpF7SZLaOs/D6NaGAfnXJ3ZJ58InPj0wt4YwyEq/zkBJRnNPAi1wQ+
X-Gm-Gg: AYBFou0iQn+Nli0dVbyUy0v9uWb0Tc8COIrRdSGuZ7jG6WKevHInBrGu9jNYjJxlRkC
	tW8CEjonc6skTdG9BHi+CWmFPYvlXM+dPTOEj9wC8I/NS7N6KUIq5XGV2lJJQZMIsUkpUDDtwdC
	DkzSVqAG5/UGmrh2Odqpo8QR0Oh3BuAUEIL7VpDeE3pbgW1ozoDWChuyRxkHm4UbAbX9EBBR3u1
	dvIQv4MR5eaarIHUxzROOZXLWC+AGIl4x+jCfJJHkvJQafEmzfAF5VWrcDTjLyQcAeOW8AFXRW0
	MxM0QZiyCSj1vDxySVOkm8nLVKYLda018w3/LoiQ8kJeLJ/0Kv7h5Fy+lCPtYyxCRraPQ3RxTnU
	F4UY14Vx6
X-Received: by 2002:a05:620a:c41:b0:93a:2a59:2b08 with SMTP id af79cd13be357-93c3624cdcdmr239990285a.14.1790246471612;
        Thu, 24 Sep 2026 03:41:11 -0700 (PDT)
X-Received: by 2002:a05:620a:c41:b0:93a:2a59:2b08 with SMTP id af79cd13be357-93c3624cdcdmr239984885a.14.1790246470751;
        Thu, 24 Sep 2026 03:41:10 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:41:09 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:38 +0300
Subject: [PATCH v5 22/42] clk: qcom: gcc-sm8350: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-22-38732033e5b5@oss.qualcomm.com>
References: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
In-Reply-To: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=826;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=ABnh6kyCokdb5pwuCMF+lEUTPDZamtdijG5Bl1hQ064=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP3vG4nsfH194PZmlC76CBDL9dBzDMUuqNSvJ
 US2lMfoTjGJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT97wAKCRAbX0TJAJUV
 VgaZD/9dkNE6VRFabvaro4kNjYnh5ElEk0vLt408lOVaF6W+Z6sxrGH6rEdrJfGJM9jXvLXSRt9
 Mw9yU27AcFl2IP42+bxUsq6Ll3NrrUyuIDa16s7nblo1IViAAFAie8toR2K87vaMnF1PdY+2U2J
 YGkTCr4SQjaXgOookZIQgnrYebOotQEKDCtm7PbraML4z5tI5r1rVoeZ7VQolGRKKApN+zBYr0a
 tPlEqTJ/wZ5WWyGF8tjbCNstcjw19t0dbq6sToMomRl8i1ermsVsx967T/cI0oe+yOMviOI6+8G
 mX6EgtvIU1qZn+NFBmOgU8IK7zhiCgY3YOoIpv6bftpGWzuQao8KY9GaYiD0pV4vmWqMtzrdlbw
 X9QsLRG8V4BILb4x0j0AVRwZ3yVnfMkc+UYNqoy/wW/yMYlsCYoJHvAHut6KoT7y9A5hOI0q0dU
 EYvzO101LsAMVRoXIXYycdrhVjQOFn0UIu6exLYqgi+ezmPAGY/Hh33fTpIejQIXoQnFC/qMY0v
 wwYenpRBl49ZiySXuMDtaER9FSVLZossD/EmeagVkXpafPflYAN85kWiv5aWmgV9az7fOIk0Wpl
 2J+V1SsisIFSz0ZBSatrGofx9VPYpGAjlK04Mdn1qiCDMusgHZX0/529eB/Nu+/Q59n31odT8OO
 y7TVMEzPQGzYaxA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX6mZ4xYClVhO3
 R5lywiu4I2wK3avCPQJaasoCFXcUhlCxl8w6I8wXerWr9pFue+/fXpdXB5atfh6OGRR/8jOEJiB
 tKN4BmFEnxZE2Ym8omqu5eZ38gImjOTuhWNoa1dC5ihRAlnigJfHsEuFEMOX36CaQxzZwO6Ty7Y
 JYNX/p/a6oCnV7s+jKdwHKmt0pZsqC7uyDT0MqMNlZwiStZE0XnW/6A4R66osvwSBzXFRGoQGqs
 FtZeaH1v9/2MEz0gw6BcyVy7S8OXw/5Vk8kDozpbrlC0e+w33taTXjhib5tQNHY5l5bIziPpVNT
 2YqgISQDjLtseJn/rbS7Vx6BflJ/JAI5voF0lu1UFE6WHpzdE8K6I0dKRKLLuy5rL6vMc0V/zUC
 /xpO8m3qUJGx0NkTuad8lJ8btheBUG99EOgHKs6UJ/6xghItDWEtHSZq27JBVBex/zz1L+Q+2Qo
 ulu1iG6sSFoQGr4gGRA==
X-Authority-Analysis: v=2.4 cv=VPxIDNPX c=1 sm=1 tr=0 ts=6ab4fe48 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=ESHVkgNwe3RMy11JppAA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX3/HAZz4z+kDt
 oc3qeqNVMqgXHJP0jsw5auiqD9OPGAxLXve7JcV2Ab3LNGZmUFwIQdSYh8qG4p0hbhUH9KeWFq8
 TPA7iP1STos6IYO9gn6zo1KXlFCPu3I=
X-Proofpoint-ORIG-GUID: NK16Si6AdecyhuYORD9_uazkm5KeXOpJ
X-Proofpoint-GUID: NK16Si6AdecyhuYORD9_uazkm5KeXOpJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240044

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm8350.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sm8350.c b/drivers/clk/qcom/gcc-sm8350.c
index cc6eb7ca9c03..ab4260f70b54 100644
--- a/drivers/clk/qcom/gcc-sm8350.c
+++ b/drivers/clk/qcom/gcc-sm8350.c
@@ -3787,6 +3787,7 @@ static const struct qcom_cc_desc gcc_sm8350_desc = {
 	.num_resets = ARRAY_SIZE(gcc_sm8350_resets),
 	.gdscs = gcc_sm8350_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_sm8350_gdscs),
+	.use_rpm = true,
 };
 
 static const struct of_device_id gcc_sm8350_match_table[] = {

-- 
2.54.0

