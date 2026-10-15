Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44DDB5326BA
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 12:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792069176; cv=none; b=dEWh539JePlS2l68Xdk9mnjldHY3Nqi+sCtmx1i6WJgpz3tttEbnZSpd2PvuhuUF7lRLu/xwS51Gp/gfdMZQHWL79+gIxUmoHGk3y3G9+QODh5PvndZjlRBttQMyNS54ZS80rTcl3ILgL8XLaQR3QDaUP0Noxq00/ra4MMdO+dM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792069176; c=relaxed/simple;
	bh=zxv/tOpfYpH+UfjBHNK8c2X83QK5S4h7tBRIAl14o7c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UZT5PhUyuc5G7mmvpmKYlVx4IvH0pEJ4PilKBDPAU8UmD6D4534fqFLiPQoPSXKW2ov8UJ6nHe3fUPzhdmYYk1naoSb8BJea1D2kOdCVmx2mR5xjUXbd7tztJVZony4ANkB3lT8oYVK4ovP8Myf4gZ5CKhGJHHan0HBTnKmgkKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nfBV44gt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M57PslT2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nfBV44gt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M57PslT2"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FAPu6f1596362
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 12:59:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TJ9lcCAwA2YNgJ/aRnJ5p+xnr/IZHUqHYAEKHijPiyk=; b=nfBV44gtMF2g2fhM
	4y57hF/uetPeOJ5Mbi+9+p/OJwCOn7WnpsNrRwGerVNg5tBCnmn4c67LKb7dGUbK
	rxNS7z3jtTsKIioV1uDfIzoThmsKDzgdKZG8q+0ycV6iksIpo289qhSiIkPxGkuX
	k0KT7RFdns4S3NvTEhcuXPzn6hEwEr+C3Hmtqb2K2YwesCs2QC8geVX3HZ/0GT+7
	d5bu++pWXdteN6widm0oSv2DDbQIGD5qJCEoA4MnLIVndM+mAcjv4J9+tDH793IZ
	nLarKthIfsHy1fXA7RZd/KEsLdTmzUbu2bJPp29WAlFCNavtB+8SqsCUdU9Re11s
	DPa9yA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haw2v8hr4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 12:59:34 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e832c03576so86600815ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 05:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792069174; x=1792673974; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TJ9lcCAwA2YNgJ/aRnJ5p+xnr/IZHUqHYAEKHijPiyk=;
        b=M57PslT2IRiqXmP/f7Q17XIYLa/FO5UULQs96Xvto3FyF7xa1x+UFZHkySGRsLSrRJ
         OdEHjIIP7KxlJrvy9c7Lz2eKNhqLaVIqwFVXSQ94XmIb8h0etLgdwPIhh3jI1EVKawWz
         2DzQxElD1H9AhcPINbhxoxH9ODxed8CxVVaWMiNrXBAxr/hi8ZkMmstRojBcbNPMXcXq
         apEmZYG0mF8MJTNeXMcVQngZRvr3rM/kGYtdr+EsCknWHpfW3mjUWZkcZIonqvLjRkD8
         y4KRwSpIUFj1PNSGHFt4uLK/fyh8cwE4BV9Dz8Fd2sgsdAS5ZNnzkPOp5vd0GG6rr5Ar
         x14w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792069174; x=1792673974;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TJ9lcCAwA2YNgJ/aRnJ5p+xnr/IZHUqHYAEKHijPiyk=;
        b=0KNCOsJntYfq9334UphPD0p3yR/M5pq0bwtZc8mCagf2D0Z9nLSIK29hrZAhI759mB
         08Rvpi3sMP6Fuj7qsNsbOFUO0RZfUfHeCmJeobTqx7kiERYdKoHOV8dPlwU28NXwwonA
         XKT2t/E8ckWI0LKUAgu80/k+nRX2BDz8yV8G29OA0R0TDDTUb2gBbIxns7VhpyhwfjeI
         a1v0hXAMtbLWodlU/PtC7T2xZE8wV4UCiLR68e7NFKTuXhlvNSIfV/WPN4OmJrPAqyWh
         IzcvwXFgfpph5ug9xzkIcZWw5qqLnkvbUmluC/a0Y1tq8qlCN6EU5Rqidh7NKTsH3tyP
         cjfA==
X-Forwarded-Encrypted: i=1; AKwUvByYk+CF0o/cJl7wJpcCBTSAJMJVc8EDncHbfAiUHt9Ce98dLR/PlnRVHRqlmrWro6ZxbYvbw8eNOTMtLvNd@vger.kernel.org
X-Gm-Message-State: AFq9FYK/n3QPra2xtHyObC9+VsXCkVuYR/fVb7ljEC6fs3AosYtOdqXt
	Spgz1PakgRjZoE75QK1/eoyhjIQoYrrdTRqFaxxGoyeo41gigjzgRauiW2xLA+HhGkbRhJN1pY4
	CI3cpnPl74xQFjIcVefDpcwffJh0v92Nv4lBBSUSd8xJ1SpROukKFiVTboIV5Ag2CBRLh
X-Gm-Gg: AYBFou0+qaNJJddUjJdPP//fCMjyOvRA7s2VDaQi3+NfOOLB1AdH90dJHoSOofOoIgl
	FOk3WHvQ5b0nDGcjFqvQWqNdpJskh6KlpBp5W3WaQgZsusfx8w800V+ZFNn+96PCPE+QgrleQQc
	vgWhSNymy8YGTwCGS1TGdN/iwx+Io4DnJ6GYA7lKFfOQNZlz5D0q+1chCGhx0gXidlfOmDIpVRf
	8SGnWRxmKHHefFbM+cK0CQF/SXAC3r1ivgRDVouOfEd57nVfiAuC2ist1AufraNVQsjop/+uN8q
	Vo/ZIbQvyn/EAj3m6CyUES/77Uwfh9XzN4wqdUM3dvz4mtq3vbXRTNAEfFJDtdNwU3h2Sy9Am9b
	EHn9hGwLmzWasnP1Ye1+L1QDJ77Gch+fb0A==
X-Received: by 2002:a17:903:2b0d:b0:2e9:4121:2c97 with SMTP id d9443c01a7336-2e9412134d3mr44309345ad.13.1792069173886;
        Thu, 15 Oct 2026 05:59:33 -0700 (PDT)
X-Received: by 2002:a17:903:2b0d:b0:2e9:4121:2c97 with SMTP id d9443c01a7336-2e9412134d3mr44308825ad.13.1792069172776;
        Thu, 15 Oct 2026 05:59:32 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8d8dsm79691705ad.52.2026.10.15.05.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 05:59:32 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 18:28:28 +0530
Subject: [PATCH v3 8/8] i2c: qcom-geni: Use geni_se_set_rate() for setting
 source clock frequency
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-derive_clk_perf_tbl_from_perf_domain_opp_table-v3-8-5da1096243c9@oss.qualcomm.com>
References: <20261015-derive_clk_perf_tbl_from_perf_domain_opp_table-v3-0-5da1096243c9@oss.qualcomm.com>
In-Reply-To: <20261015-derive_clk_perf_tbl_from_perf_domain_opp_table-v3-0-5da1096243c9@oss.qualcomm.com>
To: konrad.dybcio@oss.qualcomm.com, Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: mukesh.savaliya@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792069108; l=3289;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=zxv/tOpfYpH+UfjBHNK8c2X83QK5S4h7tBRIAl14o7c=;
 b=umRGGcBDgxVtn4W1eXznIexvSccbCj15fH0VwHEEJtMhEaBMYiOjTww+FRoq2wJqe7zKEVUyo
 k2SJajw0GiSCLxiE66SbskhJ1JWW6nVQk07M+9EvDIAN8ieemIT3Tz0
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1MSBTYWx0ZWRfX+fzJyXPyAzCd
 Sa+8ytUCqdaT5aelBB/lC7McGuV+x6a35HK5GRD5UgP1IvKHMr81RAeVED4oPJOscFQNqPRc02l
 Turl6mb19/KxdpEGJj+zjBa7l+hQowAtmce/50H1Yk097GiYPBHtCwNbLpZviu3N+yd7OEKBRoF
 9kCwZHqdkR/F4f0ElqBdiOZlZ0NGijjCKwb76l9EHQjLOyIjx3UJSmTPvHiY0K5V93cUvXBNo6G
 SLruEmbIXCe2dTW6ulYc7BuXzgU14D7BbZsnsIyEepZNq0MOu34Fr+E3i3bos/SCgVRBUcZ20S2
 4/DiVIj2JwfpnnO2SEOGfi6p44SzSD5WSW1d9iTqTg3UvuD66LIWBrAqjx717iPlqMA7ZHx4wJ1
 FrpxNgut+lkUqSOyTPdvy7+di4uzhfeblDd01fn/l4OTg87Jt6AoG6YBf92H/NzNuCSfNXa+l4M
 nfuc4DQ0lqiToD2IBew==
X-Proofpoint-ORIG-GUID: _Cjv4cpRIVK5FQ5Tal30y6w0CleKgMgk
X-Proofpoint-GUID: _Cjv4cpRIVK5FQ5Tal30y6w0CleKgMgk
X-Authority-Analysis: v=2.4 cv=G/CJgNk5 c=1 sm=1 tr=0 ts=6ad0ce36 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=V8jFpX-JU2fdHFI84kkA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1MSBTYWx0ZWRfXzJQ0ec0y1jY6
 HEEFsyxUDd81YwV21P3+ZRb2LO0fCaKp62e1yXUWQ2rQfhfp9MvsOPZMk5mKabcm1A6KWPteQdX
 8QGuG+57QdNF1EeoP1kvpQNfbuiQuPs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150051

GENI resource management may be handled either through the Linux clock
framework or a firmware-managed performance domain. Source clock
programming currently depends on platform-specific callbacks.

Use geni_se_set_rate() for source clock programming and perform the
source clock configuration from qcom_geni_i2c_conf(), allowing the GENI
core to abstract the underlying resource-management mechanism from the
I2C driver. This removes the need for platform-specific rate-setting
callbacks and enables a common code path across all GENI I2C platforms.

Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index dbe344719b86..4879170a1257 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -16,7 +16,6 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
-#include <linux/pm_opp.h>
 #include <linux/pm_runtime.h>
 #include <linux/soc/qcom/geni-se.h>
 #include <linux/spinlock.h>
@@ -252,14 +251,14 @@ static int geni_i2c_clk_map_idx(struct geni_i2c_dev *gi2c)
 	return -EINVAL;
 }
 
-static int qcom_geni_i2c_conf(struct geni_se *se, unsigned long freq)
+static int qcom_geni_i2c_conf(struct geni_se *se)
 {
 	struct geni_i2c_dev *gi2c = dev_get_drvdata(se->dev);
 	const struct geni_i2c_clk_fld *itr = gi2c->clk_fld;
 	u32 val;
 	int ret;
 
-	ret = dev_pm_opp_set_rate(se->dev, gi2c->src_freq);
+	ret = geni_se_set_rate(&gi2c->se, gi2c->src_freq);
 	if (ret)
 		return ret;
 
@@ -1042,7 +1041,7 @@ static int geni_i2c_xfer(struct i2c_adapter *adap,
 		return ret;
 	}
 
-	ret = gi2c->dev_data->set_rate(&gi2c->se, gi2c->clk_freq_out);
+	ret = qcom_geni_i2c_conf(&gi2c->se);
 	if (ret)
 		goto out_pm;
 
@@ -1284,7 +1283,7 @@ static int geni_i2c_runtime_suspend(struct device *dev)
 		}
 	}
 
-	return dev_pm_opp_set_rate(dev, 0);
+	return geni_se_set_rate(&gi2c->se, 0);
 }
 
 static int geni_i2c_runtime_resume(struct device *dev)
@@ -1299,7 +1298,7 @@ static int geni_i2c_runtime_resume(struct device *dev)
 	}
 
 	if (gi2c->src_freq) {
-		ret = dev_pm_opp_set_rate(dev, gi2c->src_freq);
+		ret = geni_se_set_rate(&gi2c->se, gi2c->src_freq);
 		if (ret)
 			return ret;
 	}
@@ -1345,7 +1344,6 @@ static const struct dev_pm_ops geni_i2c_pm_ops = {
 
 static const struct geni_i2c_desc geni_i2c = {
 	.resources_init = geni_se_resources_init,
-	.set_rate = qcom_geni_i2c_conf,
 	.power_on = geni_se_resources_activate,
 	.power_off = geni_se_resources_deactivate,
 };
@@ -1354,14 +1352,12 @@ static const struct geni_i2c_desc i2c_master_hub = {
 	.no_dma_support = true,
 	.tx_fifo_depth = 16,
 	.resources_init = geni_se_resources_init,
-	.set_rate = qcom_geni_i2c_conf,
 	.power_on = geni_se_resources_activate,
 	.power_off = geni_se_resources_deactivate,
 };
 
 static const struct geni_i2c_desc sa8255p_geni_i2c = {
 	.resources_init = geni_se_domain_attach,
-	.set_rate = geni_se_set_perf_opp,
 };
 
 #ifdef CONFIG_ACPI

-- 
2.34.1

