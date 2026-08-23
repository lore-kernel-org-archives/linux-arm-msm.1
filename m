Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EEB33B0595
	for <linux-arm-msm@vger.kernel.org>; Sun, 23 Aug 2026 19:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787514483; cv=none; b=Zi0k5OZyLdUVE2FELp67SD+dMvOeYKMJVt+Hd/it1RPQS3bwmwx0j18qrf0IqhTcl/0JoeEvWdaU4OLRtwNHf3C9jwviArLY/XLnEk6LnC0kIIYnCb+Jw2G0DYm3bgV3/F5b3hABorChvULh7IkBbpSkHsrNsLtgWCFp9yo7G80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787514483; c=relaxed/simple;
	bh=gWTcQ2XEzDFY0k81S5RiN8Z8bxM3mkFS9yIkZIw67Js=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lYLDrXAqy+hRiIZa5DDC3B1SkQTS+56JBSvKri7PY6qzEj42GiVPAqgFu/JXQl86pAHSOf1eWmE105ntYQAu5mWoTLAKhCxjKWoyvjhHDltiP/txLvl4Jy/4344zkFtgIRlualb0pv8vaYbVaC8syT+1LqcMb/83FPPYIyaYaAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eeVwaun9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FGhhgQhz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eeVwaun9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FGhhgQhz"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67NG6tL23405167
	for <linux-arm-msm@vger.kernel.org>; Sun, 23 Aug 2026 19:47:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LKlVcGWgJkDfbVp+WF3KzIUdL8c8AJrsPsM7RduI1+4=; b=eeVwaun9MIrnVxtv
	ffuENyvCvT5XqyDyy2RK5I4ZHo9Vs7up6lFqVTNVLlMJCSCA+AqBNnFX/j1Lmqum
	Uo5G69F07Zw9R+0KqrUHcF533qhxnF7fWTGEsXLaFF67P/QS0Fs7G0DBEy2VB4me
	ITPufWFzPzVr74YjR4c62APsyFuJcIDI94pFZvOxFnlTgn9Gh7zFtnXOvFieW6dg
	5qOyatLqA+NbStBkGoi7xHzBJi1MI0S9VXMtK5SoqQy4v/7bjmnEJQAhHPjABVGg
	aJHBp8xE7Xk7IYkxR/IJmjcSZ36eElritqUiJkq7fUtFvcT58a5F2Sm4mxSdjElL
	ZJwpqg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g744qvc8k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 23 Aug 2026 19:47:59 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cbbb9c9bfc3so1917955a12.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Aug 2026 12:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787514478; x=1788119278; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LKlVcGWgJkDfbVp+WF3KzIUdL8c8AJrsPsM7RduI1+4=;
        b=FGhhgQhz3FilwCEe/v9LR8c069+xsD6uok1MGVO8hWzQ9buwhU8B20ufUAZXhd+zP2
         DqlrpisDwO+vOi4W+cBnuPtWRvjpdxuwnbyFsRdxkP2VY1ZTwt5kKpVgQCJifO2l5Jrs
         0SaGhCW2kYGL3AFEiE8BVT2RcL+DCnnzZrYlHnpGs5mxeU6jBbLyzQgfn8rfz62O0BmW
         W9z34xHkkxZRi/5VZ6Gbff3VAHgMucLdmkOISGB+2O2vTOrdHkyuuWUGRKo2H5oCYVt3
         pENACDpW6MpEyjEhmLGuwgkwMwKEOgKRUwUssCR2dDpaJTjZ/K9nd/W6U1MBDaqhTOY2
         TKOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787514478; x=1788119278;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LKlVcGWgJkDfbVp+WF3KzIUdL8c8AJrsPsM7RduI1+4=;
        b=AZuMdep5YidKl7nQR0lZlwGQxj7Br/i2yIQlwH6ABjcwe9n5Vc7u4NShu6LyTxhuJQ
         GAD7nvBEjwO2mA6ZQIemvXLpjzqpn6jvvPA1HXgpdhGZ5iCcoDUGNnNHjffjXAIa/Hjf
         /5TuZjZjMtcXeFK18Higjedz6yW/sWjeRalf1um64WpIxQuVlp9JwfWl0bj6+qPfg0Dz
         jERGzPdLVcN1B4LW+zocVChYgtQA2x3b7/CAIAG9i8tKI92/AW1xI0ZOdlu4JLjL6u38
         U4XmHg888qqpzzS5ppaCilb7dqS8D6ANnhMHGqVcQIdlK8APwdmHuiuPVRt7EFQ0AtWw
         paQA==
X-Gm-Message-State: AFuF++kawl4L3nXZpvWngHFj0ewt4qm7S+cJJHUz5ISnuahO6/VHC3et
	OquyM1pJTfDNmT5Mo8fXPBHsSpKAxdh8xsTv4xCCV9zmr9x/mE5bBM7i+JdzkdtiLSRuKElcN9k
	mi/3qhqUu9I4kNZsU3qe7NBIlWyIkcmIxsJgmq1EkI60POvheR5OpyDbERaNzhs2PGzMYdWmAg6
	VF
X-Gm-Gg: AR+sD136gAf9Wg3xiBfA7vMOuZPM9GBv+qXP2IWGFObOC1GRofRdf9abJnlkELEY4++
	Xpa/Rt18mgPB8OUC5F4rNhzSiREnUaxReMmNhn1MSuXhjC8JtzhXENQmBNbG8asd94HWg27gJJ1
	0Z2ils34VDcgtazRJo7edJrlyE2yuLFBcPzuIAgJKZA/OYYeXnILBKFHxXlJS8ahC5Q5P0yI538
	u6o/o3ygat0RlQPxkarBlaIN5amWnMwLEh85lJ4Ib2jef0r3escisBWsCFZe8DyBhSc4qELh8Bd
	WaFbgJhX3druLWeWrNP0aNbHyhEPwJGX6Mb/5DqVRhRkeE1+rUKCSNkecu7VPFWaGwdkcPfjfSr
	ZF+6q5tNNmPd8uSxzeyEXJLz1HIE2xCgHbJFt4A==
X-Received: by 2002:a05:6a21:710f:b0:3cb:d156:d362 with SMTP id adf61e73a8af0-3cd2fdae771mr40720126637.3.1787514478385;
        Sun, 23 Aug 2026 12:47:58 -0700 (PDT)
X-Received: by 2002:a05:6a21:710f:b0:3cb:d156:d362 with SMTP id adf61e73a8af0-3cd2fdae771mr40720074637.3.1787514477928;
        Sun, 23 Aug 2026 12:47:57 -0700 (PDT)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f925190fsm32321623eec.31.2026.08.23.12.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 12:47:57 -0700 (PDT)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 01:17:39 +0530
Subject: [PATCH v12 2/6] ufs: host: Add ICE clock scaling during UFS clock
 changes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-enable-ice-clock-scaling-v12-2-09271f583dc6@oss.qualcomm.com>
References: <20260824-enable-ice-clock-scaling-v12-0-09271f583dc6@oss.qualcomm.com>
In-Reply-To: <20260824-enable-ice-clock-scaling-v12-0-09271f583dc6@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: hTPXnmPyz2_f__nL3dbl_e9Td-Vw1Pim
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIzMDE4MSBTYWx0ZWRfX+pH2Eq4VQpt1
 Bmh0yixfIuWTNEYwiCzRtdhWigsQ2jHVnI/SoeKNrpo+1YxRwdav8/FQgkG0yMrd9DJPJ6Uf9Gj
 VyYF3PidTMj9ijKOx/J6nZl0TiwaANQMT56dPfpJbdu7CiFntzX6CAyH4x/+FvIldlICuBFBWDz
 dKUvAz1C61ASp/kco+/eJ9VTTJ5KjACrPN/x+LA9P8khiAPzFxDnYXfSnJQwlKIfo/XvJsMfAhX
 xjgNZ0mEGMyDypZw9ARY9kleWScxB9EIh52E56gYydz/ODK4CiJHJIGyFJSoKkpsbeHAQrT6EHX
 AxhAEzysNRa7OV9oPOgY/yL9C6w/un8nZEr3Tc4ddZaqqfbh2otto3YWh2W+9V83DZ5hpmxM5Nn
 ZBhyMQ154CVdFxiwF6aUA0qVrTen+KsyQ0BUNA7CtPU0E+95Fhd7Xxdj/wKlfNaUMyOCrj076I4
 FpwIDsfLzY49Z8Sa/iw==
X-Proofpoint-GUID: hTPXnmPyz2_f__nL3dbl_e9Td-Vw1Pim
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIzMDE4MSBTYWx0ZWRfXzq8nCyFrPvci
 AK5e4oYv9OHlKDVM2RhPMePtPQ68U20eErLQQRKR44vrK2VPgNH4u7I4IO7pg6R5PnostED40U+
 NbCI4rsIvtI3iHBRxNzF5/Xn/piKtr8=
X-Authority-Analysis: v=2.4 cv=BNuDalQG c=1 sm=1 tr=0 ts=6a8b4e6f cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=yPCof4ZbAAAA:8 a=4vEl8bdWBwuQafGpEzkA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-23_06,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608230181

Implement ICE (Inline Crypto Engine) clock scaling in sync with
UFS controller clock scaling. This ensures that the ICE operates at
an appropriate frequency when the UFS clocks are scaled up or down,
improving performance and maintaining stability for crypto operations.

For scale_up operation ensure to pass ~round_ceil (round_floor)
and vice-versa for scale_down operations.

In case of OPP scaling is not supported by ICE, ensure to not prevent
devfreq for UFS, as ICE OPP-table is optional.

Acked-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
Acked-by: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
---
 drivers/ufs/host/ufs-qcom.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 291c4344876481461ab958f3048db5405bbead62..dc15d7806c7b677d6890cd4b077cae4f4d5c9a41 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -306,6 +306,15 @@ static int ufs_qcom_ice_prepare_key(struct blk_crypto_profile *profile,
 	return qcom_ice_prepare_key(host->ice, lt_key, lt_key_size, eph_key);
 }
 
+static int ufs_qcom_ice_scale_clk(struct ufs_qcom_host *host, unsigned long target_freq,
+				  bool round_ceil)
+{
+	if (host->hba->caps & UFSHCD_CAP_CRYPTO)
+		return qcom_ice_scale_clk(host->ice, target_freq, round_ceil);
+
+	return 0;
+}
+
 static const struct blk_crypto_ll_ops ufs_qcom_crypto_ops = {
 	.keyslot_program	= ufs_qcom_ice_keyslot_program,
 	.keyslot_evict		= ufs_qcom_ice_keyslot_evict,
@@ -340,6 +349,12 @@ static void ufs_qcom_config_ice_allocator(struct ufs_qcom_host *host)
 {
 }
 
+static int ufs_qcom_ice_scale_clk(struct ufs_qcom_host *host, unsigned long target_freq,
+				  bool round_ceil)
+{
+	return 0;
+}
+
 #endif
 
 static void ufs_qcom_disable_lane_clks(struct ufs_qcom_host *host)
@@ -1946,6 +1961,12 @@ static int ufs_qcom_clk_scale_notify(struct ufs_hba *hba, bool scale_up,
 			return err;
 		}
 
+		err = ufs_qcom_ice_scale_clk(host, target_freq, !scale_up);
+		if (err && err != -EOPNOTSUPP) {
+			ufshcd_uic_hibern8_exit(hba);
+			return err;
+		}
+
 		ufs_qcom_icc_update_bw(host);
 		ufshcd_uic_hibern8_exit(hba);
 	}

-- 
2.34.1

