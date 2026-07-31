Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3B53845AC
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 08:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785484865; cv=none; b=D7p9pLPD0lT1B/l4rqSp8OOOgU9k6SaYyQ1YpJi8Hp8udhoahzGaPk24DGC3QfZ+RWMc4SZxUbAgRgm64RU08rWQAvQ4AHHaL7M/G+p/C5ICGikRI/ebtqRP0140NyvlkyfHURtpci7646EPilkr7ZkeLz5GkeARoFm9tD+jLVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785484865; c=relaxed/simple;
	bh=Hy8R84Eu/7OyDCxeYoL8X44vkHsNUdsxxCIRr88gZTg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q8QbBmmUx0I+rhYbNmDybhQXM6fm5mdfl9ArWkjE7sovlfe5BO866kBbZ2utwkd07LPQuO6JnYfn8rInELXx2yrKc7xKU/wI8uHGgmShwxhTvx7c8sCXs4atrqDugwNa8/BdPTbqam8ANbkXFYCpSJeF2xGwu9OyskYL4Z5qXDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bnQil9E4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fZxf4pEb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bnQil9E4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fZxf4pEb"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V7vOLj3305338
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 08:01:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	owW0wC+4MfMpqINsogtI/uNF/RUbm48B+1QB7d3un7s=; b=bnQil9E42o+ucRNZ
	C5K+bMIJw6RiDur+8XsGfhSjuAk2ILNMGr+NqwuvDTqRr/FSLM+2VepYJdpbP8yO
	JEXeYBluQzqyjcfzJkAAVOxpfKaxxWsttd/z16iw8JeET5WIsgqmKHb5oK7p+W5T
	7KdAyxqXlbYtgP2qFJdb7Ko2E0Rq3W7Vfig67r+9yb47O0U6vWKOrQxa2VM4Z8U+
	qWmFB4bp2j+0TUeIz/kCwr3qXga2uN8DhReOLdn3SbK6kps6eKOQkN5KsAHDKoec
	KSGzD4xAo4lz49valMI+WuiujJYjeuSX4c+tO6J0eFfY86Mham8Ta2k52vfs6uMM
	3gnvMQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frqbfg3j6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 08:01:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e820609d9so61624785a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 01:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785484860; x=1786089660; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=owW0wC+4MfMpqINsogtI/uNF/RUbm48B+1QB7d3un7s=;
        b=fZxf4pEbM0GoGGbPxhK4k3MWeOI4sLk5vH2H3/xplnPV1lVMMahqX1HikJvDxSHbzv
         4XqngwX+FHymedLqdSXW7NccwZkjxFQ8PIZE6d4tZuzS4asIcryTG6W5PuE/xT6Wg8QV
         WrcMI6YpP4T6/SP7V7ycNJO+0bVUUgH9kqfMS63IjFSUnR0YK0RTL54Fayl76L8jEHmI
         UsoZz2m4K3ZFSDKvrEFGhgPG3d7a/MuNYK9wuOuenBFFsCE4wjMHtnD5FOrnOXkctkgU
         2E5OelIyKgkDxySstlEVUit+CsHRC0UxjYeugKq45cYYra9mUTBKQReWt9mR44uP1en0
         9XyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785484860; x=1786089660;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=owW0wC+4MfMpqINsogtI/uNF/RUbm48B+1QB7d3un7s=;
        b=bIN0VRM0PoJNJdzMlugVRtbp3nqLzbV8CQfsETML74E5TI1rb4+94UcixogJRKLMPj
         VU064ZH7//W+2GL9DrPlhJrWEFS7anKavH3SRr3zosxLMgpBYjNSXtODjY8sOF4YlOqa
         9JTUtJsoWVJ7suUCpa+512LG8cYZFJxKxJf8qTPbrVEd5ZUzKros1MI09IgCb9AY+9Rz
         jzZP+AmmgFXSvYYV4y+WzHjIytXaJQLkfw6R6o23Bm9lQgozarM1vumazq7253fDv3ly
         SbBKGLW9v+jirCFLAICMqq4WloRhJGILkRWx4IvcK3wOw3BfNDxRnDUCv1JK5nxC7dJx
         sz5g==
X-Gm-Message-State: AOJu0YzH2wxZh28Zv/CKKOFBxlttluIVuTk5XOnIO+VFuzRg0/a7/a9p
	gqvhEoqKO52V5YPJq7yGnWF3JU2JnrkoDvgYPD5+zMsO6Xlbm0GXZu9uH6i/OwHfUwUrWs2rrXb
	1zAByygXsRFpJ7dLVKFhtTf1680Kdcoai/t6a6e0RtqlGRi4T4L5AU/9m62v2mnxZZOTU
X-Gm-Gg: AR+sD125S7msCUcxTNrXGtGhvWoXZzKTePo4eD4OB/mplO31K45iVoQVir4wIsZ/fUU
	jwGeuGAEpNrD5NREkGHCUPffnsDDKLF2tBt4+5tILqhBFjBB0WSyPD8cBpB7ZfDKNnpMHr2rSxq
	Ho/pJXlkomWxTU73/zR9v2K/dPWYNw8bP3OsgUdilcjVjyKZdIEHrEePBW/d5j6WMOLhVCzc7vM
	JBXdRe8ieZEgRh8a5ZH7ELtMmzt8OGCszlmJqprrwDO0Z0zy4bPPYyebvo3fFiS0DT9yRZeB9zN
	O+CZUuy0jkTJMQbSZfgzsQoTLNj9E2n7ao9WJ88TOcZ/0UMT9vCxszNTvHGFOfddA+xi4LMHTZN
	NaqVa/Hn4RR9U0xbJO+yXI/qfUr+Cng==
X-Received: by 2002:a05:622a:90b:b0:50d:9e8d:9837 with SMTP id d75a77b69052e-52b4afd83b9mr11875101cf.11.1785484859733;
        Fri, 31 Jul 2026 01:00:59 -0700 (PDT)
X-Received: by 2002:a05:622a:90b:b0:50d:9e8d:9837 with SMTP id d75a77b69052e-52b4afd83b9mr11873441cf.11.1785484858887;
        Fri, 31 Jul 2026 01:00:58 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:40fa:e8e6:4785:ce70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd4534fc4sm51032966b.51.2026.07.31.01.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 01:00:57 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 10:00:37 +0200
Subject: [PATCH v2 4/4] firmware: qcom: scm: introduce qcom_scm_bw class
 for bandwidth management
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-qcom-scm-code-shrink-v2-4-4ba76096915f@oss.qualcomm.com>
References: <20260731-qcom-scm-code-shrink-v2-0-4ba76096915f@oss.qualcomm.com>
In-Reply-To: <20260731-qcom-scm-code-shrink-v2-0-4ba76096915f@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4284;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Hy8R84Eu/7OyDCxeYoL8X44vkHsNUdsxxCIRr88gZTg=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqbFYx8H1hD7SEi+BQp/zxdaLa4SzA6rGax7Gr0
 8aiCMEfaKOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCamxWMQAKCRAFnS7L/zaE
 w1EfD/9mYdMefpsDvfF8dt+cnPsZDI5Q1bHogf7UAYOLbHWSoGSuPuf99HJIAQQFYYOPjNu7IRn
 nGVmAdrNAlNBVjQJaUTAzCKGT26M4DOJYlZ2obUck0A+hkY6HZi3RLXAZoSHj0X6/8fnBEPbbjT
 v/7ekzpKSd0bjLf0Qy6qKYXvMS8Udm8cTN0HFlWh2RZOguRxf2SOnwqzwP6HaPgxJWH9fOwsu0m
 0kkb8Jw+zLgnvTB8GNzJ3OStBlz/bfuxjREyIVpE5sFOejbCcaxUUBH34pFKw3yC//9z3tF626Y
 B4dHUeR2eCmLftTrUL+/54tVOCzexTjbb1mYFb1n11b2kbX4rZN/mRDAJG5/cTeAi1DQ+R+gXPN
 Omi6T43+9ihlMGqRNjsIoQC+t4xvbzhQpcqPTyatj771JzF1SKh8MfGK/UKHL/FTnxPlR+lDPDM
 MGt5x9KE6kA8GOdZCuvX/mMGRXN4z7AhUX0DKLH6V00+5Ero0Wh3FwU0bOKfNdVBwwEwMbnPI4O
 vCbZ1ydil2HQMxbbeADZiZHA36yBxrPUnPChb/f2scQCk1XMVyby+6/A2VYVfaLMvkZH97cvYxn
 KCtsgOELhELKZcTVhS7OP9LaSjbL+mvRdx9uX8myaAYjs6SFAhwZmmW2WIOGP7Jhzc28B8b/ukH
 h+P1h4ex8aaILqg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=MIFQXsZl c=1 sm=1 tr=0 ts=6a6c563c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=AJRLcc76jKkRl9dWX3gA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA1NiBTYWx0ZWRfX1qBfKrnzV8Pb
 jAYIzCefUSUFnmxmoSa2KBk6b1i7rjcDMPo19fttCBSm9rtp+KtLQ56gzg3PzI5zIM5wCI1+mDC
 Le5tdMtRcQ4de4YKgYQb78xVnQeahm4BJynyq8q3y/nlSOWS8xAHfVRZo3rIyYksbyFFE1HGBw5
 52dARrIlmZHVOysioMBvQeLA0ulICq7hEfnTSSPjTz005kqYkqkyBJmw3kS8QN3vo0BEtgj0J1d
 K9BP4yjccQpo2Fu6simQfJHkJr5MkEQQ3H+m7UgY3ErNqQA34qPiaFYI/T0B8xB6EMf8ZewOZJ7
 QMJ4yebEyXWnOA9HeXxc4ZNNxuFEBGcmpZ6Ne47xrYBUh0o+SHWIJTQI4fUMUgPMgP0nsY+UHwO
 tgKfTNbww4H78VfZ2x0NEJlXulHRZdgbKMWSEff4xthEsqpxoFA0OkX6U5xcEIE7imrh1qyZ1sE
 HS+BjutjVpOu08a2J8w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA1NiBTYWx0ZWRfXxXu4g248b0Tl
 7IZOIHNxxx5iGYJqJswPkCtPVO1HF742NDoJJkuy+Er630JzEtBkTb7FepODP8AebWOPb5J9HGo
 yUoEcRM0EAKkwjwiBapJYAKSCRuBiqU=
X-Proofpoint-GUID: P9FeZzpYMKWtzK-HeNP3rAdqTvMrtlqo
X-Proofpoint-ORIG-GUID: P9FeZzpYMKWtzK-HeNP3rAdqTvMrtlqo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501
 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310056

Define DEFINE_CLASS(qcom_scm_bw) that calls qcom_scm_bw_enable() on
construction and automatically calls qcom_scm_bw_disable() at scope exit
*if* the enable succeeded.

This allows us to convert all call sites to using
CLASS(qcom_scm_bw, bw)() instead of the manual enable/check/disable
pattern and to remove the associated goto labels in cleanup path.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 61 ++++++++++++++++------------------------
 1 file changed, 25 insertions(+), 36 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index bb213f64703a7adb9ce413ec00524a7d0a1d3856..512fc51fee3cc4da811bfe03ae79509af4888803 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -244,6 +244,9 @@ static void qcom_scm_bw_disable(void)
 	mutex_unlock(&__scm->scm_bw_lock);
 }
 
+DEFINE_CLASS(qcom_scm_bw, int, if (!_T) qcom_scm_bw_disable(),
+	     qcom_scm_bw_enable(), void)
+
 enum qcom_scm_convention qcom_scm_convention = SMC_CONVENTION_UNKNOWN;
 static DEFINE_SPINLOCK(scm_query_lock);
 
@@ -614,14 +617,13 @@ static int __qcom_scm_pas_init_image(struct device *dev, u32 pas_id,
 	if (clk)
 		return clk;
 
-	ret = qcom_scm_bw_enable();
-	if (ret)
-		return ret;
+	CLASS(qcom_scm_bw, bw)();
+	if (bw)
+		return bw;
 
 	desc.args[1] = mdata_phys;
 
 	ret = qcom_scm_call(dev, &desc, res);
-	qcom_scm_bw_disable();
 
 	return ret;
 }
@@ -736,12 +738,11 @@ static int __qcom_scm_pas_mem_setup(struct device *dev, u32 pas_id,
 	if (clk)
 		return clk;
 
-	ret = qcom_scm_bw_enable();
-	if (ret)
-		return ret;
+	CLASS(qcom_scm_bw, bw)();
+	if (bw)
+		return bw;
 
 	ret = qcom_scm_call(dev, &desc, &res);
-	qcom_scm_bw_disable();
 
 	return ret ? : res.result[0];
 }
@@ -812,15 +813,14 @@ static void *__qcom_scm_pas_get_rsc_table2(struct device *dev,
 	struct resource_table empty_rsc = {};
 	size_t size = SZ_16K;
 	void *tbl_ptr;
-	int ret;
 
 	CLASS(qcom_scm_clk, clk)();
 	if (clk)
 		return ERR_PTR(clk);
 
-	ret = qcom_scm_bw_enable();
-	if (ret)
-		return ERR_PTR(ret);
+	CLASS(qcom_scm_bw, bw)();
+	if (bw)
+		return ERR_PTR(bw);
 
 	/*
 	 * TrustZone can not accept buffer as NULL value as argument hence,
@@ -835,10 +835,8 @@ static void *__qcom_scm_pas_get_rsc_table2(struct device *dev,
 	void *input_rt_tzm __free(qcom_tzmem) = qcom_tzmem_alloc(__scm->mempool,
 								  input_rt_size,
 								  GFP_KERNEL);
-	if (!input_rt_tzm) {
-		ret = -ENOMEM;
-		goto disable_scm_bw;
-	}
+	if (!input_rt_tzm)
+		return ERR_PTR(-ENOMEM);
 
 	memcpy(input_rt_tzm, input_rt, input_rt_size);
 
@@ -851,23 +849,16 @@ static void *__qcom_scm_pas_get_rsc_table2(struct device *dev,
 							     input_rt_tzm,
 							     input_rt_size,
 							     &size);
-	if (IS_ERR(output_rt_tzm)) {
-		ret = PTR_ERR(output_rt_tzm);
-		goto disable_scm_bw;
-	}
+	if (IS_ERR(output_rt_tzm))
+		return output_rt_tzm;
 
 	tbl_ptr = kmemdup(output_rt_tzm, size, GFP_KERNEL);
-	if (!tbl_ptr) {
-		ret = -ENOMEM;
-		goto disable_scm_bw;
-	}
+	if (!tbl_ptr)
+		return ERR_PTR(-ENOMEM);
 
 	*output_rt_size = size;
 
-disable_scm_bw:
-	qcom_scm_bw_disable();
-
-	return ret ? ERR_PTR(ret) : tbl_ptr;
+	return tbl_ptr;
 }
 
 struct resource_table *qcom_scm_pas_get_rsc_table(struct qcom_scm_pas_context *ctx,
@@ -898,12 +889,11 @@ static int __qcom_scm_pas_auth_and_reset(struct device *dev, u32 pas_id)
 	if (clk)
 		return clk;
 
-	ret = qcom_scm_bw_enable();
-	if (ret)
-		return ret;
+	CLASS(qcom_scm_bw, bw)();
+	if (bw)
+		return bw;
 
 	ret = qcom_scm_call(dev, &desc, &res);
-	qcom_scm_bw_disable();
 
 	return ret ? : res.result[0];
 }
@@ -990,12 +980,11 @@ static int __qcom_scm_pas_shutdown(struct device *dev, u32 pas_id)
 	if (clk)
 		return clk;
 
-	ret = qcom_scm_bw_enable();
-	if (ret)
-		return ret;
+	CLASS(qcom_scm_bw, bw)();
+	if (bw)
+		return bw;
 
 	ret = qcom_scm_call(dev, &desc, &res);
-	qcom_scm_bw_disable();
 
 	return ret ? : res.result[0];
 }

-- 
2.47.3

