Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794548048;
	b=JXh1ydHw0Vh6lkS+kJrEX7qAAEg3xJvmBh9IhJ9j5v3cdvsVdWKnxLrhkAYTiBpe03gZ
	 GHL55ui+o8ECS3k2bY+CpwF1G1KW14K1dV78C1GUaiTpQYuxMZxanrFEVhSB5ff+ZdOOp
	 LOmkOuOxEahs4XDsLF2sqkby5WLSl/tIiV0YdHTguoKJWJp9LukjucZXGWUj1WH3MRrft
	 YNAArAsmDlsViLnO/bSE7Z52uOA6RYssLHDxGH51SER0YUJ7nm8nYioTyr1EEcFz7uLlp
	 6Ewapn9ia/YR6qNlhd1K+K6qB56EtXQQgigiF2Xb1s47mUEFnyarFFZBLyz4mR3PehQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794548048;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=vtvmwMJ33RWSUNmE5I11asHiWXJILMh26kLEbzoo09E=;
	b=ePmM3HdMcAWUXRUtQOKYaup2klbNs7mR/IlI06UnrbfzqvrwUwO0g58G+vC33zN0o/bI
	 jrP0iu8p2L7BtzXEECqRAmXqAKDMXdBwQdmzuFSX/qfYUwVsWFwD3JxvXEkNgka5kXId6
	 17e7491B3Jbh9qf50NoDEdtG/b8b5gaObGn3F9/Os0SiIUIGnZMI1Czn1mijCP7Yva6xk
	 iHzrj8i1kqqbT2QDSEIwIeK4K/jZ6DSvHm8M+Z72NNPWNUeZucT2MVNSVbeX27bVN1/Ga
	 RnL7+Hn6fVP6sWQ6qjpireQmVw4apdSgjjrsYqZmxU+n545P+VxxogxaIBJUxIapyIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p1PJah0C;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iD5FFwrc;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F4560A3816
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 05:34:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2F4560A3816
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p1PJah0C;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iD5FFwrc
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD57f7l980142
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 05:34:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vtvmwMJ33RWSUNmE5I11asHiWXJILMh26kLEbzoo09E=; b=p1PJah0CEtUdWkpN
	pnByS5I7/mOuo0ZDI7Hvsu9DOG9ukIw3sDDuisGuJmJ0cnM4HgLj3Uz5WEoJKEnv
	GOp3YF7YwlYQpjd6keOPySolviUmZojfgCQZoCWp9nvG+0r6ebEU90I4NiqEaWUo
	VclKAb4oPLBzEmQGClV7iZxVsDzP/IpkESkyhWShzyFpDcBQoeGAkrAtScuy/aAa
	3DiV9LnFZ8eUfihQM4CwIgrE1ioa88MpoZ7NTGbqQod8X+Io5FWSVdN0+2WsjlEb
	E0ulUCmKRoSfSyO3A25Hv8qdJwRdBzMmbL+b+c60cwV1WhIjFsplTXXVW2OXJCLz
	Jm49OA==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwc1j3h5m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 05:34:06 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-492f39f29c4so671758fac.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 21:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794548046; x=1795152846; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vtvmwMJ33RWSUNmE5I11asHiWXJILMh26kLEbzoo09E=;
        b=iD5FFwrcAiO2yE0NTXbJTE1NZjsLivUxy4S5Ulmr95lYm/ybIwRoxS2QwH5UCkEgBp
         lEttrgmt9zI6Du6SzOZcXOEMgSJgi1BLnZTKKZ0NO3WbzlPKZcV0BkbKNEWNmjODsXw2
         jBsivLTlQa4N3rQl8XcdAlQoDv9OFcS3jaonoDCEPySNmeK1B7SK607ObxnJ5wR1S1zu
         Wk3qUOOZGj1cSPm+jqEUuAF+7SX+vRvdWx9taQqW3vSqPZvWLgE9Kino7W6cv0TMPaeE
         W0q4Uj6PsuLYClLR0YdLhVVRio1XODQpCPyq4g2ow8NYsitmHhpWAiG7A54XW/BfUVE7
         jqbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794548046; x=1795152846;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vtvmwMJ33RWSUNmE5I11asHiWXJILMh26kLEbzoo09E=;
        b=sbIoVWtLdIxeV4qQ5BjJKW4GYO94mBOwltvT+GFo3sC1CmACum1SDrQedc/HalLBUO
         lmUg/rU08RvIORovuJRC6gxrBAyOyppdSVtk7jCvyBUq2kGFIfw3uL3wnErrT92yvQ9f
         gKKobXKyktFUZGO+vjM87lEwc3e3BJNQsQBbfNQDoOjMCN/1CO75RbTc6Oe8e/4nHhyV
         rLv9HftfPIoE4UaKqR0HUvIacTN89LJboU1lBFPk1iLFGYhqMihQxpJmiVhrVuwbiLL2
         H7/rfVx3HKwHyzAar/4ipi8EeLjApu7gAwMuA/QY2T6O97aKM6oDYRNgZj+OSQ+Dsl+R
         H97w==
X-Forwarded-Encrypted: i=1; AL+hErEPV4UZX0NnibA04WUQM5JL5S8DxB4s1RB0IKvatzuzVrEjEHGuqfwpneYL/fpm1pgKrCXkiCUvcR+zNOb0@vger.kernel.org
X-Gm-Message-State: APuU4Z9dZTmUp3PzBDSboUuET0eNL+lMAKtn/PQ/lhvwkhvGuvLDsuG/
	Q55jynygcPxf7guP7dgmNi6bUVPZlVWQXfKLBAugo8aBOkHKa5v4EQTNl3sxxTYZH/lEad22Gsa
	GZ/lOMTdGi4/lF7ST9CZIU759LmrDM7HIv+qrWbRVr6NcmBEG3L8U4H5DM/lWlTcnvX20
X-Gm-Gg: AYBFou3xcMcHBa1V3HEDX8jw6laXdh9qniL4LVbVe9ybdYg3XvQzoU1bkPNFbOnIy0H
	kXaLUWnwoBZuT2sisYpCYbnLF8baYfYDRXeVf/RkAwV7gRHyCV0e6g9k6mey1ObSFinX2zx+A71
	BapQe7gwFXzXrFhOaF/j21ayl26TflSYV3JfsBEVc07hMFExqNmc0VgZEMnKIw22BzO5/fmNn/G
	jgkhejPdoHLXb/Q3DUh6JeKnOt6e/xREu9uDzjuJ2PlBZxNumn8AUmNeUAEFIVEaatonZlO3vep
	kGfo3fYUBqTCmu0dtp86YsVofOxyqYKAi/Pww2u2t6OTVF7YSx+xWdmcIxYS82MoocGzmxnbAaS
	fX3aZj182ewHgMP0ftsKXG7t6KEwBSbyOVt1uYB77oe+pfE3TULf2cyEY3L/Dl6mE4CskVi+BGx
	4faC0EavqK6eqTHUCaVMXj81MIQETFSi8Ny+dvfbsapFg8cVYjbw4tw1VX0i5R
X-Received: by 2002:a05:6871:329c:b0:4ad:514d:b19c with SMTP id 586e51a60fabf-4afdf49294fmr1673509fac.11.1794548045752;
        Thu, 12 Nov 2026 21:34:05 -0800 (PST)
X-Received: by 2002:a05:6871:329c:b0:4ad:514d:b19c with SMTP id 586e51a60fabf-4afdf49294fmr1673501fac.11.1794548045271;
        Thu, 12 Nov 2026 21:34:05 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe22576bfsm803252fac.7.2026.11.12.21.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 21:34:04 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 21:33:38 -0800
Subject: [PATCH v25 06/15] media: qcom: camss: Add Kaanapali compatible
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-kaanapali-camss-v25-6-1d709f57f370@oss.qualcomm.com>
References: <20261112-kaanapali-camss-v25-0-1d709f57f370@oss.qualcomm.com>
In-Reply-To: <20261112-kaanapali-camss-v25-0-1d709f57f370@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAyMSBTYWx0ZWRfX1lPr2GeXwFIT
 zr2fTkTmESqQNgip1jYmPQoPo0EmfXH0OB7nBl5Pxq3w9VmOv9/JXQ+rLKrZtYk/IJZpqFCQMno
 MBfWZ5E6T4yq6BDhgz3vqC0ln/+vj7k=
X-Proofpoint-ORIG-GUID: 1w_aNDiQ16TG72QrPv0qT_fgaZeNHBHh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAyMSBTYWx0ZWRfX1sb3oNHHDGd8
 u3uCCI84s0F3sgx0LMpj9icTMcYDkkXbRup7tZbhWq0mYZeaQXHEQRzEGmLfImtPoxr6QMCLVhU
 l8SmdDN6ZOn6Q3yoNyf0DLbCDOPpkFJkAyi4s3CmAzsFpSrTpEQyu2u/kmos6Q0YPOH4nbmpk4p
 O5/HOPNUMGiXF+XLZW8XyaS2P85cb7uDlufp6Dhyjky2//EHseNx5y4I4pW6kjfqaBMocyc9K6D
 mzCWDNGoSDKGl3zw0BMBU/LrUhzSCWtXqvt7zoCJEkHWBoRcfF96D1ZFFQXclxaIilN/qyftE+/
 dQn9RZWpHCLzmwNdUYd+jv6KY9DD7SXytl0ByGKeUXBUZ1PeQLL/i+t3IEiVM1FBfMSnoQPrMZS
 cKY1Eu5L/ud36oQ5RhhtlWCxdl5alh2zO3sYWpDlGGJ27lc94CV6EV4goSHuIEC/AMXf5L74b4u
 iT515MFiRBNylax9Hrw==
X-Proofpoint-GUID: 1w_aNDiQ16TG72QrPv0qT_fgaZeNHBHh
X-Authority-Analysis: v=2.4 cv=Vqe2kO2n c=1 sm=1 tr=0 ts=6af6a14e cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Eph36bqoL6-XvbZcx_wA:9 a=QEXdDO2ut3YA:10
 a=vh23qwtRXIYOdz9xvnmn:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130021

Add CAMSS_KAANAPALI enum, Kaanapali compatible and Kaanapali CAMSS driver
private data. The private data includes the ICC paths and TPG resources
and sets the CSIPHY count. CSIPHY resources are not listed because the
PHY is probed standalone. CSID and VFE resources are added by later
changes.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 25 +++++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h |  1 +
 2 files changed, 26 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 9521301ec972..cd6adf749c6f 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -38,6 +38,20 @@
 
 static const struct parent_dev_ops vfe_parent_dev_ops;
 
+static const struct resources_icc icc_res_kaanapali[] = {
+	{
+		.name = "ahb",
+		.icc_bw_tbl.avg = 150000,
+		.icc_bw_tbl.peak = 300000,
+	},
+	/* Based on 4096 x 3072 30 FPS 2496 Mbps mode */
+	{
+		.name = "hf_mnoc",
+		.icc_bw_tbl.avg = 471860,
+		.icc_bw_tbl.peak = 925857,
+	}
+};
+
 static const struct camss_subdev_resources csiphy_res_8x16[] = {
 	/* CSIPHY0 */
 	{
@@ -5585,6 +5599,16 @@ static void camss_remove(struct platform_device *pdev)
 	camss_genpd_cleanup(camss);
 }
 
+static const struct camss_resources kaanapali_resources = {
+	.version = CAMSS_KAANAPALI,
+	.pd_name = "top",
+	.icc_res = icc_res_kaanapali,
+	.tpg_res = tpg_res_8775p,
+	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),
+	.csiphy_num = 6,
+	.tpg_num = ARRAY_SIZE(tpg_res_8775p),
+};
+
 static const struct camss_resources msm8916_resources = {
 	.version = CAMSS_8x16,
 	.csiphy_res = csiphy_res_8x16,
@@ -5819,6 +5843,7 @@ static const struct camss_resources x1e80100_resources = {
 };
 
 static const struct of_device_id camss_dt_match[] = {
+	{ .compatible = "qcom,kaanapali-camss", .data = &kaanapali_resources },
 	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
 	{ .compatible = "qcom,msm8939-camss", .data = &msm8939_resources },
 	{ .compatible = "qcom,msm8953-camss", .data = &msm8953_resources },
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 431afeb381aa..97fec24e6804 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -96,6 +96,7 @@ enum camss_version {
 	CAMSS_8550,
 	CAMSS_8650,
 	CAMSS_8775P,
+	CAMSS_KAANAPALI,
 	CAMSS_X1E80100,
 };
 

-- 
2.34.1

