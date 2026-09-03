Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8334A0158
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 12:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788437287; cv=none; b=WH/JJndAXbyretoLRXl8EzsZQ7orrE+IkXH32ceOVqg/eADyiqvHQZWnhJQHWPe4CZ7ane4gE3GYcaa9iSq1G0BZVN2PD5hFxIUm3R9A/ybIkYT1fYE4+ch2uLPUSrmCFIFS1tphDojosf63mF92h0W1oY8IA8xErQ7mBRepLnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788437287; c=relaxed/simple;
	bh=qhduGvxSd60XUwOZ0ZBtDftmYc7RtmVI7jpRodVUmA8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GvNp+wDanq7XIoOmj0UtQObJAuG++VL2zGKZGZPxMNvfsB6pAMlDZ0mKWb9PfvxfwZ7fIYPgcv2/D3fhFAxLz7Uy+MGu6HwDLq7iwP03KlFpyDOZd64EAg2Iq2KGzkhqzLSuV+nokEN4NszelY/hd1DdforION8AS/dLK4IWBBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b311SuWF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cEFxZPO1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b311SuWF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cEFxZPO1"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683BTK94210354
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 12:08:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K7U2dd669vcqeaSKivEBKNQUkMuI1kF2iV4ulu1l3Qw=; b=b311SuWFvsuI5pL2
	D9G60txHDIqooV+rMRDQHAU2UiDwG1j1Ari+akr3sYEVTjp1NcHAA1rFhXFP79bT
	W4f7u1a69D44EyYvpp2/5FxO9m/j2/JHECbN9d9WRpt2TE1R1oyk2YjNLUUMKScj
	11TBo/ZZYDPn+zwf2LO4q5Jod+I6nkKGPtjgYXWBjfQEDFe1R7nCJVHZpMiHDNZ6
	RnTgeq1m4W4YVmn6HaJXRqtiMUHo+DVD2gf46+QcLLy9TNiso7tIhttUIaS4vhE8
	pXoQ53LMl1A/dQmfI6e+w1WFvBc4JxnX/MkHaZCaEE5EP4M29PRiivMu6B+PsYgO
	rdubbA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf82k84s7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 12:08:01 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-73a8aba30a4so794336137.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 05:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788437281; x=1789042081; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K7U2dd669vcqeaSKivEBKNQUkMuI1kF2iV4ulu1l3Qw=;
        b=cEFxZPO1Mn34rvVSIdnSGiO2XKMho4seRfSmioy7QvbyjpVl7hwZLqjgdXDa0dN9og
         FVp+t0Jzn/bJv9d36u7Z7eQj7MhNM5d7uew/l6cO97cJed2tM8ZZp/9qc9dSdvbxIoMW
         i3TtX/KD1TGgfTRQrYOHHEdsmHrkEUpCY0W7hCIigiPMUb8W21SU9QlwNrefCvnvnBXD
         SWBwUKNziGINTJZgVUPNcsbhy7EdGgwt4c1nqWBgALE0NhN5TbzI1Q4ak5GKId9V0xgB
         zV1Z8nQXpiGCg7WDXXyqORfcpPfkMmKv2sa8q0aFw6X24J1cXpewwZ7tqCgnMX4Wa+Qd
         eVMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788437281; x=1789042081;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K7U2dd669vcqeaSKivEBKNQUkMuI1kF2iV4ulu1l3Qw=;
        b=H8tupxrjDekg9TCV37ue8WVlJeoepbhkjlbfhgHKA46lhfvkzvReIgPwElfdr1BZ0B
         l2oxrDKBeOoZfuiRdEotqVWhExrqsy3H0YOladeLO7Kz6fyUaFRs4AxiAlvqZCsSh0oM
         lDANe6p0LcU2CqV864+007j/I2ZMuZpBy5D7Y6HTwxQ0ko85D9JYKQE1MXwb8DVKnPLH
         XE7T1irnOKi/JEeZbWFL68xNfGZ+zEB07VE0dj5hb6fy/XZCrrli2HSiHjFNXe+0PBVI
         J8jN910qof1SQ1DDY5R+73tGCHREn7hpKXsZdh714u/O/Itf+u2NAcKDPwbb6E0WetQP
         NLXw==
X-Gm-Message-State: AFuF++llDBKMwvZGhMBUt1f723oom9V3SOF0N3HOPmhsR7ei3vRnOfkG
	g/gzfhe6vfrbSH29XT5rWmbnuwCBgdugVjeTDtph1EnJ06CPADMrS02UAUoky1EZy7IQ3vyY/1f
	GVRCqm1Wdv1aoi1L53TiJ/6ZpbJkMOo+deHRJ/3u7F8KVHIEGQCCN+4EUFy3McUXAckIwBGqCxq
	CT
X-Gm-Gg: AYBFou1cr85TQPibx7pJdciJvBOU/HPE+HkjQtXvUKcNqjMwYGCT/e+xbGLFi9RTJmt
	ZeoeHrqIydw/w++3TiThjRpnz4MWhFSiv1bNm46S0KJyxmnbNqIHX0MGtY9pjjmfSJBaJBA2bHv
	iF2HxjfA5JLdZpT8AXHEVRnQeLEVu46fN+lF+lR2XDHVDaYpSzqveYG1qDJtxq5v/3i/gMN2RM7
	KCtYhXTTMEoRa2RDGtetQKPsjcnk5AFODS3KJMOSZbrHzmW4l00csKiULQnFfyyulb3G0Vnc/eG
	ype/NdqFLRLoz1Bf0iygk9d58BJIzRAtm4tUue+J4CCDEyfsKA8wZ/+MadpAbIhqKUCZ69Bu342
	Hztw2BWL2fmSGrSQpQnpw5tQ2Jryj
X-Received: by 2002:a05:6102:84d9:b0:778:6695:2f71 with SMTP id ada2fe7eead31-78a2efc74e0mr1126043137.15.1788437281101;
        Thu, 03 Sep 2026 05:08:01 -0700 (PDT)
X-Received: by 2002:a05:6102:84d9:b0:778:6695:2f71 with SMTP id ada2fe7eead31-78a2efc74e0mr1126026137.15.1788437280614;
        Thu, 03 Sep 2026 05:08:00 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:1c7d:412b:f9d3:3bfc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5d587csm72143115e9.4.2026.09.03.05.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 05:07:59 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 03 Sep 2026 14:07:44 +0200
Subject: [PATCH v3 3/4] firmware: qcom: scm: introduce qcom_scm_clk class
 for clock management
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-qcom-scm-code-shrink-v3-3-8237f3a654e1@oss.qualcomm.com>
References: <20260903-qcom-scm-code-shrink-v3-0-8237f3a654e1@oss.qualcomm.com>
In-Reply-To: <20260903-qcom-scm-code-shrink-v3-0-8237f3a654e1@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5395;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=qhduGvxSd60XUwOZ0ZBtDftmYc7RtmVI7jpRodVUmA8=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqmWMWKjsfLDVFquC4sq1MYX9dQWCAUXm2cocGi
 VyqSWA0wdWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCapljFgAKCRAFnS7L/zaE
 w+AoEACFXckJe4k4VckvyIBNh9F9o1BjCEbRyVe9HCqOrXkVqa9r0+aXdqqqo7yy4ZRk9mCzYJB
 Xfvx5e6UZrRyyEc6mqb6cWU8dCf1yHUSZvoquLLrbV7ZfE1LI0tddaoR/2xqEzx2ZpyaNMXZDQK
 GVFCEXhokA2sTtn48T47VSbZaPuaONVyCD47QMIWKPC6aONdU79COJUX9s5h7zXEvCCGB9YHH/I
 GVXsv1F9Fxn+dUP3rR7NvXkbf1Tp1hvy5K7CZg6Iiss+TStDp6RjPBBq+3neqsPja6IDDRF2lkH
 V2FdLlNHMmeBpHewrlbsPMHKon9vzt5bYXvaQF8NaX2Auq7vp5YTViXs+uw9IQh6kmmS1Vh9pHk
 MvS8Me+sLqaRychtUwNf2EpUswwpxRKBhoqb2e77YMKWzPg/veUHDU+sK3ajsztfMckAU+Pf8Ms
 uTy2swyys+NDh6JwS3AO28gPxe83BxpRYufT+gyLuozMFNVckyLwNSUgHwg6KL8mSaqemkVbQwN
 H9e9XmnVKspiCaKc+YIpbVwxmAXQ4zruKsQTz2qygiF5FlZdSYWHxx0q6D87qHM6FxpV7RXb9G9
 Z8JN2gGruXx7bDe1oxoHtci797y8eb2O8SrO2hajW0Ob3MJwUj9kVVOEIHK5s4KuIf3Kr5wyRNz
 11RHqhoImciI/3A==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: eu7EiKrTOe3k5RjecAU7Bk3WhbvQCF-D
X-Proofpoint-ORIG-GUID: eu7EiKrTOe3k5RjecAU7Bk3WhbvQCF-D
X-Authority-Analysis: v=2.4 cv=OuJ/DS/t c=1 sm=1 tr=0 ts=6a996321 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=t9k0K3iV4HLebYkdnPwA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEwNSBTYWx0ZWRfXx7tLGtQWA/No
 Kt6wTG03lNNGgJKPZvKoaGI0jvO5M7CkSg9RPa8/OW22ZfufM1t/EFHgvFd7G6nI4s/Na0D0Ien
 RrEh5IsS8rK7Hb6pNza8hFLEg1OvB5LCyOhYA0LB+AcxT1qnqBuJpaY12iaVSYNSMQkn40DiDPP
 MeYIRGoPusi8PDRYqzEy8/3Ak0yozc7j6ZerLJbyuJ/I29NY81LJIycShb2fncY12l3CwI8Gce1
 AHJ8ZOTejTbZWl7BnyEfRkf97tsjNQvACZDQWFB3rKsOD0Vtiu8b/7XURxmjNkMcQabKYPevPpW
 JVouUtpNRv23g3q7C2SEYKnsuEKp4K/RME6s4mn5ROFjTsz+cWHfcG35pNL+hpfNjrZAIIOnhJU
 XoSNzmmPmxGXKGwjiQWGJKy8waF4+4Me6dfVYajujy2QwGCmX8icWph+izNl0YbTznJkvZ/5qxM
 3aWQGky/TXh7C2nywWw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEwNSBTYWx0ZWRfX3TWYL9vL6B32
 Cfl+IGbce6UwwXTmyQP9EwPYo5bGww8nbiFjqlMv6v0QCChe1dkCaYOVO/3Zecwi8U3SikvehsZ
 okNDLIMZMynFY7KMCMBfuIDxA/tKKvs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030105

Define DEFINE_CLASS(qcom_scm_clk) that calls qcom_scm_clk_enable() on
construction and automatically calls qcom_scm_clk_disable() at scope exit
*if* the enable succeeded.

This allows us to convert all call sites to using
CLASS(qcom_scm_clk, clk)() instead of the manual enable/check/disable
pattern and to remove the associated goto labels.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 89 +++++++++++++++-------------------------
 1 file changed, 34 insertions(+), 55 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 7320d3cfbb9930ca1ed5de38294f871b472f6f93..f0578f0f55563c34a6875377e444dbb674fc61b7 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -209,6 +209,9 @@ static void qcom_scm_clk_disable(void)
 	clk_disable_unprepare(__scm->bus_clk);
 }
 
+DEFINE_CLASS(qcom_scm_clk_guard, int, if (!_T) qcom_scm_clk_disable(),
+	     qcom_scm_clk_enable(), void)
+
 static int qcom_scm_bw_enable(void)
 {
 	int ret = 0;
@@ -509,13 +512,11 @@ static int qcom_scm_disable_sdi(void)
 	};
 	struct qcom_scm_res res;
 
-	ret = qcom_scm_clk_enable();
-	if (ret)
-		return ret;
+	CLASS(qcom_scm_clk_guard, clk_guard)();
+	if (clk_guard)
+		return clk_guard;
 	ret = qcom_scm_call(__scm->dev, &desc, &res);
 
-	qcom_scm_clk_disable();
-
 	return ret ? : res.result[0];
 }
 
@@ -589,22 +590,19 @@ static int __qcom_scm_pas_init_image(struct device *dev, u32 pas_id,
 	};
 	int ret;
 
-	ret = qcom_scm_clk_enable();
-	if (ret)
-		return ret;
+	CLASS(qcom_scm_clk_guard, clk_guard)();
+	if (clk_guard)
+		return clk_guard;
 
 	ret = qcom_scm_bw_enable();
 	if (ret)
-		goto disable_clk;
+		return ret;
 
 	desc.args[1] = mdata_phys;
 
 	ret = qcom_scm_call(dev, &desc, res);
 	qcom_scm_bw_disable();
 
-disable_clk:
-	qcom_scm_clk_disable();
-
 	return ret;
 }
 
@@ -699,20 +697,17 @@ static int qcom_scm_pas_mem_setup(struct device *dev, u32 pas_id,
 	};
 	struct qcom_scm_res res;
 
-	ret = qcom_scm_clk_enable();
-	if (ret)
-		return ret;
+	CLASS(qcom_scm_clk_guard, clk_guard)();
+	if (clk_guard)
+		return clk_guard;
 
 	ret = qcom_scm_bw_enable();
 	if (ret)
-		goto disable_clk;
+		return ret;
 
 	ret = qcom_scm_call(dev, &desc, &res);
 	qcom_scm_bw_disable();
 
-disable_clk:
-	qcom_scm_clk_disable();
-
 	return ret ? : res.result[0];
 }
 
@@ -777,13 +772,13 @@ static void *qcom_scm_pas_get_rsc_table(struct device *dev,
 	void *tbl_ptr;
 	int ret;
 
-	ret = qcom_scm_clk_enable();
-	if (ret)
-		return ERR_PTR(ret);
+	CLASS(qcom_scm_clk_guard, clk_guard)();
+	if (clk_guard)
+		return ERR_PTR(clk_guard);
 
 	ret = qcom_scm_bw_enable();
 	if (ret)
-		goto disable_clk;
+		return ERR_PTR(ret);
 
 	/*
 	 * TrustZone can not accept buffer as NULL value as argument hence,
@@ -830,9 +825,6 @@ static void *qcom_scm_pas_get_rsc_table(struct device *dev,
 disable_scm_bw:
 	qcom_scm_bw_disable();
 
-disable_clk:
-	qcom_scm_clk_disable();
-
 	return ret ? ERR_PTR(ret) : tbl_ptr;
 }
 
@@ -848,20 +840,17 @@ static int qcom_scm_pas_auth_and_reset(struct device *dev, u32 pas_id)
 	};
 	struct qcom_scm_res res;
 
-	ret = qcom_scm_clk_enable();
-	if (ret)
-		return ret;
+	CLASS(qcom_scm_clk_guard, clk_guard)();
+	if (clk_guard)
+		return clk_guard;
 
 	ret = qcom_scm_bw_enable();
 	if (ret)
-		goto disable_clk;
+		return ret;
 
 	ret = qcom_scm_call(dev, &desc, &res);
 	qcom_scm_bw_disable();
 
-disable_clk:
-	qcom_scm_clk_disable();
-
 	return ret ? : res.result[0];
 }
 
@@ -924,20 +913,17 @@ static int qcom_scm_pas_shutdown(struct device *dev, u32 pas_id)
 	};
 	struct qcom_scm_res res;
 
-	ret = qcom_scm_clk_enable();
-	if (ret)
-		return ret;
+	CLASS(qcom_scm_clk_guard, clk_guard)();
+	if (clk_guard)
+		return clk_guard;
 
 	ret = qcom_scm_bw_enable();
 	if (ret)
-		goto disable_clk;
+		return ret;
 
 	ret = qcom_scm_call(dev, &desc, &res);
 	qcom_scm_bw_disable();
 
-disable_clk:
-	qcom_scm_clk_disable();
-
 	return ret ? : res.result[0];
 }
 
@@ -1695,18 +1681,13 @@ EXPORT_SYMBOL_GPL(qcom_scm_import_ice_key);
  */
 bool qcom_scm_hdcp_available(void)
 {
-	bool avail;
-	int ret = qcom_scm_clk_enable();
+	CLASS(qcom_scm_clk_guard, clk_guard)();
 
-	if (ret)
-		return ret;
-
-	avail = __qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_HDCP,
-						QCOM_SCM_HDCP_INVOKE);
-
-	qcom_scm_clk_disable();
+	if (clk_guard)
+		return false;
 
-	return avail;
+	return __qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_HDCP,
+					    QCOM_SCM_HDCP_INVOKE);
 }
 EXPORT_SYMBOL_GPL(qcom_scm_hdcp_available);
 
@@ -1744,15 +1725,13 @@ int qcom_scm_hdcp_req(struct qcom_scm_hdcp_req *req, u32 req_cnt, u32 *resp)
 	if (req_cnt > QCOM_SCM_HDCP_MAX_REQ_CNT)
 		return -ERANGE;
 
-	ret = qcom_scm_clk_enable();
-	if (ret)
-		return ret;
+	CLASS(qcom_scm_clk_guard, clk_guard)();
+	if (clk_guard)
+		return clk_guard;
 
 	ret = qcom_scm_call(__scm->dev, &desc, &res);
 	*resp = res.result[0];
 
-	qcom_scm_clk_disable();
-
 	return ret;
 }
 EXPORT_SYMBOL_GPL(qcom_scm_hdcp_req);

-- 
2.47.3

