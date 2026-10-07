Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11113B47EE
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Oct 2026 07:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791356636; cv=none; b=RNB7J+GYwcdLcWz4ALVxUvSABAj/ZDK1JUcBKVDpOpwdc90oi6dACujTpK7hIncp1AOE3YykaJfHkMNJHhqmYRlgC5Rjnn27D5VCQSBKFsrA/rVQis0AKX7wyjMc2x9aotrq0BOh9pTAF75oTbM97O+Ec3IvXCxIGY3gFFLpQB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791356636; c=relaxed/simple;
	bh=HjuYUDFABlg93bx0E5FR9aos2mlqmiXi+Yk9EpQj0U8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=FrcI8DUqvBsAuC74OAxyNhVLhnZ5LB4sY79SqDsk9JbaHLaK55of5F/77yTjX74+70zwW6uKS0srTFXEDfE1Q/cTQehzQwTOey6S1urFAQtlwXyIBK3SU13s6ceLNoJPP5cdxszLg25EWAaU8XTRQWtoEfj7cuNvmlbCzpbgpJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V35SQ8/n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aYWenZGn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V35SQ8/n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aYWenZGn"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6974U0IB3923499
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Oct 2026 07:03:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=XIkmWxkSF3EfdpS7OvPs9N
	fKBIWqATM9qXoWWx2wO/4=; b=V35SQ8/nmPMPwSMF9vahCfBrQK6n5LwjKxh6VH
	sNa92CacywIeQgmYrwn4C3IyzdFynBlYS9TXlPc+d/s2FZ/lUiTsrqe3A3misWnM
	4UwGxHS3CaY14mtAev1vy5yvP9RvjteoP+8beY8uxLF/Fg3Wtq7tQ8A/IcSDEQJq
	EdSct9H0K8FhFN9p7LTAcDbLV7lJDgmFTYK9MOeLjS77VzDNtOe/dENKMb5Co6eC
	9D9k5d3GjEWpj4qgNcPJR1Ue5lCACDMzgqh5LIkfFYWXWKWbOuudMAUmzKayGBsC
	M2/r0DDC1QPgGXNXKloZ1M7ZKytzaFhMjzG+XHt/SsUDUgEQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c718yrr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 07:03:55 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3516711cce6so89238eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 00:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791356634; x=1791961434; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XIkmWxkSF3EfdpS7OvPs9NfKBIWqATM9qXoWWx2wO/4=;
        b=aYWenZGnjTx2fNIYh7Q1cX7LS0SuT+gCKy1oCWUwp1zdg+efn1s/uraGnrH7AGwLW1
         70TDFeNBIC+pd0LHFUip8LKopkx2Lu81U+/gS02kwe7svEjJXsfvpV2huNqlsrYvHGc7
         OEB36XKutxkO1ebtQNqCTxBWtavCiihJtj0s69qAcr+pDqWvW36LBZHN32+G9AuN0yt2
         0qAXCHCnm4y3JxLFGRzTONsq+uFlC3H1VhxHmT0BQDVgGch1yI4mIZ3Se+e6o62RQAQn
         EQNuHOAKfe9HV5u3cqnBptJ818a43jZInyhKNpDRJAKuARzO5sSuOG/gV1cPYkedBrAY
         ih1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791356634; x=1791961434;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=XIkmWxkSF3EfdpS7OvPs9NfKBIWqATM9qXoWWx2wO/4=;
        b=IFY6DRR9Mme8IIpIa5/3+Caxyh40AhRAbucBpV2cqKUUI9BhOrhH0kRHgHusmqpbqD
         8HbbIZ1CbFGQkTMtRsxo/OSOAseP/iQHYi7n3Qv4sfKZo6RobzNAl5gY5+qdrg5iBODG
         eELhIFW4uXRTvmxvvsN8fjtIcGydzvRVF+KNPwSuHkNKJT1nSb8H8BlLEi+Ka729h71B
         kCk1o7J217Ak1VD0fCoDtpmX5GN7/gdcPwXFHrixUuSFyoHtY7xT20JPCOpHfGd9jpkr
         gHb0GYubEmDtP8jnymNw0BPNufRzszeevwsBAShIC30fUCkzAoPgxCgldp/TbWvAXkZa
         AJ2Q==
X-Forwarded-Encrypted: i=1; AKwUvBxtNMmg7aFzhooYl14mMlMZZO9n1eecwq+jULUs8aS/AWeDqU+kcwQymJfM2Qm6ebD293oF+lQwvPSg0iRP@vger.kernel.org
X-Gm-Message-State: AFuF++lgiI+WkbbKIDBPAcBkbch+Ppt0tIu6M3xCjdsXK/7+IJwi6XPN
	aLXDmmcve5pi9uf/Dbaf0ib6u1EWTxrmyI6vpq6hgE+F42Pr3IKdW2srAqlkD77QsrKAIryOHWI
	FmwhVy7fjCMNE0Q6pjncFL2Comx8mTeOGCG7ngFe4gyQOskuygNIKEXyvLyJGUi9sG0MV
X-Gm-Gg: AYBFou2v0sPN5IcjLNex+X48Pj8A+uUq8jZwnhG87yfa8Ms8+TP5GZ8F4VSlGI9kVY7
	F91DsBhTJ1jXs6cteDaH2CqTOwH4UqggVFPRsEtH/nVuL89I2bpxLwDZ+xGAhENWswwcQlRpRo9
	VnBV1xE+be/QoshXx32GLI52HW7j0KpxgJp4M9ViorVDvFXpgVO2XZmKEhPZ4o8uZWZZ0nAYKP3
	YtFLgNjeZvgGj81Ylm49ZoPCYdo/s3vutdeeT1FiwhV32FX87gCrq1FKaN5nahCetDAtoQc7LAO
	1aY+PNremKbMuSAq53LRMDBAswu8hi/wCfKCO89aNG3dZRBy4p1bzsTzfRfeZBV2f8Keg0DPybt
	Iit9dawEEiILRDgtGm6Ogcb71TazHleS0Vc4V0nGumGLQchV8DMYNY28jJ6jzpVzlrIz5MX2fIT
	gWQVBGhY+NL8ECWmkoxg0c/Gv3AxVlE+ibyJQ=
X-Received: by 2002:a05:701b:2804:b0:144:f0c6:ddac with SMTP id a92af1059eb24-16207e73b0dmr959442c88.17.1791356633900;
        Wed, 07 Oct 2026 00:03:53 -0700 (PDT)
X-Received: by 2002:a05:701b:2804:b0:144:f0c6:ddac with SMTP id a92af1059eb24-16207e73b0dmr959371c88.17.1791356631815;
        Wed, 07 Oct 2026 00:03:51 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1615f1ac8c5sm7660585c88.2.2026.10.07.00.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 00:03:51 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 07 Oct 2026 12:31:56 +0530
Subject: [PATCH] cpufreq: qcom-nvmem: Add IPQ9650 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-ipq9650_cpufreq-v1-1-bb808da4ab2c@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGPuxWoC/yXMwQqEIBCA4VeJOSeo0Ii9yrJEuVNNhzKtZUF89
 7U6fof/TxApMEVoqwSBvhx5WwtUXYGb+3UiwZ9i0FKjktII9rvFRnbOn2OgXRhjG4WIurcDlMo
 HGvl3H1/vx/EcFnLHtYGc/8pWac9zAAAA
X-Change-ID: 20261007-ipq9650_cpufreq-779516662a9b
To: "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, Ilia Lin <ilia.lin@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAyNyBTYWx0ZWRfX9GbPm5Q7ldgN
 ZN7FgCp9Dr/fxaHJYi1vm4WcnqC77hgGo8+lEeYHvD8Twrfkxu++iauCeCkdZfyI7I85P5IIoFT
 420f34XCCAquERSTS01QWpN2J/SQjUA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAyNyBTYWx0ZWRfX6lFeB608qRax
 NctAPJhHxGbs1GMcF7/kIQSUsrK3KUD5Diq9wZtDmwJ3RUT1ILCKZQzVK7aEM/4p2Y7fhZqPQhP
 r/jCkwqb31mfo4HuirluMSJ2GF6Pxd0wF7jTymAZd/gNbALzOW78d0vYjyqff+Eu9EtujkJJ/rF
 NXUdib4RBO31Z0gO1JgmxP95ipMDzJajr2iPWcNyaqcb/TpZXN7ArjvzKe4qyykimSLypbsKdtV
 N9pc2aO+NLUlsAis5VbHkH4LCdaUjSonoedvuUhS2DCwNtB1/bSEhEMuAcUVIqet5emHb2rRSq0
 wrHqwC4iNx27tpgtOlj5mhvEcmwuNa6mm9BWkfgxf5K8kva9qXqEbNl0SqmDC/6pcJ/l2yeiFJu
 3UmtOPTpOo71kEh4IvvVMzKdpuF4AmezZ+5UlMheS7Zgmzz1gv121y0hO4iVB+RUEbe/2TJp5z5
 ACqJBS47MTtLWfQuKUw==
X-Proofpoint-GUID: Od80SZniA-6zC-HumFm05mzXFOne3Zfk
X-Proofpoint-ORIG-GUID: Od80SZniA-6zC-HumFm05mzXFOne3Zfk
X-Authority-Analysis: v=2.4 cv=LvYHWXdc c=1 sm=1 tr=0 ts=6ac5eedb cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=nPsdbO1t67SEeDNGNhcA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070027

Add IPQ9650 support to the Qualcomm NVMEM cpufreq driver so the supported
OPP can be selected at runtime using the eFuse value and the
opp-supported-hw OPP property. Also block the generic cpufreq-dt platform
device for IPQ9650 so the NVMEM-based driver is used.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/cpufreq/cpufreq-dt-platdev.c | 1 +
 drivers/cpufreq/qcom-cpufreq-nvmem.c | 9 +++++++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
index 574c5bec4831..bce4c87573a1 100644
--- a/drivers/cpufreq/cpufreq-dt-platdev.c
+++ b/drivers/cpufreq/cpufreq-dt-platdev.c
@@ -210,6 +210,7 @@ static const struct of_device_id blocklist[] __initconst = {
 	{ .compatible = "qcom,ipq8064", },
 	{ .compatible = "qcom,ipq8074", },
 	{ .compatible = "qcom,ipq9574", },
+	{ .compatible = "qcom,ipq9650", },
 	{ .compatible = "qcom,apq8064", },
 	{ .compatible = "qcom,msm8974", },
 	{ .compatible = "qcom,msm8960", },
diff --git a/drivers/cpufreq/qcom-cpufreq-nvmem.c b/drivers/cpufreq/qcom-cpufreq-nvmem.c
index efa766e98d86..375f12d5d11a 100644
--- a/drivers/cpufreq/qcom-cpufreq-nvmem.c
+++ b/drivers/cpufreq/qcom-cpufreq-nvmem.c
@@ -211,6 +211,14 @@ static int qcom_cpufreq_kryo_name_version(struct device *cpu_dev,
 	case QCOM_ID_IPQ5404:
 		drv->versions = (*speedbin == 0x3b) ? BIT(1) : BIT(0);
 		break;
+	case QCOM_ID_IPQ9610:
+	case QCOM_ID_IPQ9620:
+	case QCOM_ID_IPQ9630:
+	case QCOM_ID_IPQ9640:
+	case QCOM_ID_IPQ9650:
+	case QCOM_ID_IPQ9670:
+		drv->versions = (*speedbin == 0x4b) ? BIT(3) : BIT(2);
+		break;
 	case QCOM_ID_MSM8996SG:
 	case QCOM_ID_APQ8096SG:
 		drv->versions = 1 << ((unsigned int)(*speedbin) + 4);
@@ -633,6 +641,7 @@ static const struct of_device_id qcom_cpufreq_match_list[] __initconst __maybe_u
 	{ .compatible = "qcom,ipq8074", .data = &match_data_ipq8074 },
 	{ .compatible = "qcom,apq8064", .data = &match_data_krait },
 	{ .compatible = "qcom,ipq9574", .data = &match_data_kryo },
+	{ .compatible = "qcom,ipq9650", .data = &match_data_kryo },
 	{ .compatible = "qcom,msm8974", .data = &match_data_krait },
 	{ .compatible = "qcom,msm8960", .data = &match_data_krait },
 	{},

---
base-commit: eea3fef32a9cf36abcb5975a5a594e4135a6b026
change-id: 20261007-ipq9650_cpufreq-779516662a9b

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

