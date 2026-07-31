Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71FF23C10A8
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 08:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785484860; cv=none; b=WamPJ7RScZ+fLW32yo6Hs94HdcXX4a3f1UHgiA+EuMV7fgTorsBjj1agyrXOHvUubK77m0yIshPvlmRy25H0KA1HsIbUpCxQfLIdS6iPH/T6yozjQ/wYFZJKZairINVvQOjSo70hrRd3yJqAzP5r/mdgkpTCtgI1wqLoQzRQqIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785484860; c=relaxed/simple;
	bh=0whSEe//CO94x6I24SwYVmeMkMqOL/rDwvKXMUEHhpA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kovdI9+qRG1Kegl3sK79UnYwK6OUU14XHAdVO5qdUwBSyigFHd7t//8lplP83GG54eQnVAIr2CmqJPr+ukA/pFGPJHPxYWLctodEls2pMCwMgyuPUQRLM48EMGP9pPAmMsP+o5OuA9iZiHL+Y13e9JwtBOaR57JGFID4rFeMbGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kAaKGbyX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KYaQzRA9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kAaKGbyX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KYaQzRA9"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V7vfMx3411050
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 08:00:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bBN8lNPPtt/lWpA/t02HhzfXro9jgXIJFZ+bjpHuviE=; b=kAaKGbyXE70kDKK4
	paf98PS4Xtt8nq6i/lTZl4Wu2XXSNE0D1/2hmSmBYKf+wqlvh5rDl1BliIEorO0n
	FIxHS6DA/g+bmg0dupGQ1bXEeiynybPJHRhLVg2FfriOVEvhBJOSZ5lzbskkHIaf
	KkuDbsnX/FwrliSPP+rXsiEbwsspM2DEVo5CvlZLq4+zgjayFrLJdLRDusOFJzGz
	bZYwc5e1VkMarS1Ov7JlYPYAAuBrih/ABl17304zpbaG7/9m5uEzS5aiXAHMq1Xv
	VanLlnptl1mlIeolGIMWeg1N2avPz/0oaB4S7Uf5HnY2gr6DRRL9HgYZXVcjBgkr
	cOeXDA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frq8f84rn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 08:00:57 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1eb52e1fso11979341cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 01:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785484856; x=1786089656; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bBN8lNPPtt/lWpA/t02HhzfXro9jgXIJFZ+bjpHuviE=;
        b=KYaQzRA97wmF6dkLSius7spb/uc8gLyHSkyGxo88td+UzuhcnbW/dtsuX5WzErUROm
         kkpCeEg+sjsTw7vMN20kO89M5ZZlehm2fHOrPrEiY/qtMVrhxLoIJlxlf5VwW+3p9CNf
         yQkhkbuhtIzJUeF2Hd8hOZIbJpDWFzR1yr4HqnWwWR6xRv9q7Lfgg8cN32hv4iJT6SFy
         4DjwRLnJtIiVD28mZDaCDTPPF3UNSXlnrtiz55NsPPMvXV+PmqEMbtpkDYw5ddJxGfw+
         tOHirhIviVoMYq71vY+ThZtzTXRe54Pt5C5V3/hVBhWNhESVbc9gR6r1FVoJOUzq8005
         tAtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785484856; x=1786089656;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bBN8lNPPtt/lWpA/t02HhzfXro9jgXIJFZ+bjpHuviE=;
        b=Dk+Xe7Ndp4FJvmM1LiMZKHWsTDP24sjb7B6Xveo0iGIP7KVjeOhzru1Eb+evwXdHIr
         KzwfWcSYhdqr46ypFCmC8q1UGi9jj1hGC2pQ6C0QCmgZVVbkVfbchzPOJLuebsT0XVfO
         KmXFLDF0sJknbc9D9Ftf4o25P6uFB6kJfVI9YzQ1V6nh+nGzMhOPMngXw1gi334Subav
         5gtAtB2XIXpLjeNPiOBMKk4YZ3+Nl5ZpH78+YPpkzaey70SFQFpV2Spv87HGRdIIV/o0
         ag1u78EytAt4s8HxlVbzvMqHwDNhyY2AtxLBnNDfbm9F6Hnmd8hsm/s15Xv2o9v7jNFu
         k71g==
X-Gm-Message-State: AOJu0Ywg6nLdB3B1KaEWpsFvFq5TzYy0eTIixiXLLcmGG2sTVYOY00Vz
	Qx4QKKdR/Oi5H8knbwHPOJHs+fuSiuXUjej+OQRx3jVh3cWha98/eTZiBT2PWmNPDu4+Vb0Z/GW
	x//iATJb+t/hSIcv645AKy+ODj53J7jeMrbcsthmLSClhnCpsCDJN6tARi/u4MzQYOTnQ
X-Gm-Gg: AR+sD13xaBSpsPovYvPgWQ/WLUA57otEfH48AzuZl9/VWiy71dLPC0qvxoQFSbOaIxg
	mPXar32I1ftDXQAR/ltIC2SQkcrJOF4umC7bfCS9Trbjz/iS5VtI9dOK4OXPagkr714HSFiBIR2
	uChfJ/BXI+HxeSyDo+pnQjQGHqOTomfICmEutvyvyQqR1gbOYAxoRzHAwiR62Kz39CyiVQizkWX
	vDmPLSsj1Z8KtOfqYKfcpJRYaHg9Bbw3c+BPuPPTwqK5OYBT+elp+U2FzyQ+C0r/5RcBnJNs/EZ
	5bskNt+H3KNssaL7KyOA79YL2cFl20wvJPHL6cow3We0QhbsVfEY2uVTYVX7Rtr6lQB+36jTbCv
	blP94NCffDBk1wnc/cqeEcMjwbhHY0Q==
X-Received: by 2002:a05:622a:4ccb:b0:51a:8dc5:bf89 with SMTP id d75a77b69052e-52b4af50156mr12263301cf.5.1785484856441;
        Fri, 31 Jul 2026 01:00:56 -0700 (PDT)
X-Received: by 2002:a05:622a:4ccb:b0:51a:8dc5:bf89 with SMTP id d75a77b69052e-52b4af50156mr12261731cf.5.1785484855596;
        Fri, 31 Jul 2026 01:00:55 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:40fa:e8e6:4785:ce70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd4534fc4sm51032966b.51.2026.07.31.01.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 01:00:54 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 10:00:35 +0200
Subject: [PATCH v2 2/4] firmware: qcom: scm: use __free(qcom_tzmem) to
 simplify cleanup
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-qcom-scm-code-shrink-v2-2-4ba76096915f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4632;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=0whSEe//CO94x6I24SwYVmeMkMqOL/rDwvKXMUEHhpA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqbFYvdC57id+KW2IrNR/Vy6bn3sNm70XwT2xnE
 k3SKhPHUO6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCamxWLwAKCRAFnS7L/zaE
 w3hhD/kBNwI5O4g83kNsrrFebtdNSFwptFwJQiobWN7OLss0AJarfL1GMQOxpNkv2agsr+O5G34
 EGQtyzEJa8YxlUSDmuth7dHmaPYH7US8X8WLi4gSBWFWj6ty8yFXCOI+eyjWFVhnQfNbjefKoJJ
 JeCWiKOR/c20d0EU4bHVzjVtsXhN7Ho8CLCvR0sIq0Hfe8ZzoU5q4KGODokxBEwavVsbPaSsaz0
 T66WG3x+1krwOdFCg10fPNGa5h4e4PTAygZU6tUwQmVxJ7CIKTYwa1PQS3ilXDxTTDamsN5ZHf1
 N2C3D8Y6FX6pHMVtXr6qB75lH2K7vA58iN/tgfF1imKZRdeQC98rBGBsURK7nB5qyIimeaLq8b6
 BNfqzym+JN03hUdcCQiH+9gsiv/CbOJ8PeR+/SzB/mS+EV1TjlG2eZgCmqskFSMo9bTQg9wNHLJ
 s0I00KbCxYrVps9LhH/Qt/N7LnKThbIvrr7TaggcxQ5bd95hESEOhhWIPsQfE6mHRsQc/aEbRVS
 ri84gOTaYabzaf+1t5rH1r0BkCqzkGK9M/VPaCl4wI7DKraFfRj2yTSAWl/KQM5t8Hwl/IQ2pR/
 7eStHqb6LMZx5i+71N3fGG1p2RAe7yTjI83ato7qY1dAaJpgcoUZFWZVZ99gp6XM5lzuWlkvuun
 ISAEqo/JBbrEVoQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: hZQ-6-1Dh27rtGaQnfr-xRWlHVWkacAZ
X-Proofpoint-ORIG-GUID: hZQ-6-1Dh27rtGaQnfr-xRWlHVWkacAZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA1NiBTYWx0ZWRfXzEJeZswXj9c+
 5382wpRNGZszYawLoV/tPbco72Z5pVWrQpbE6BGfXvddiaoYrhj+jIou/DtJeBcquzLotAipICV
 Hq8dBpeQ0F6INg0Yyv1UgM1SWpb/Zns=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA1NiBTYWx0ZWRfXxIJ+rOJbiobk
 iidkLfGzVPsZ+sZaaaLUDmFxpT76fXpBRHezhaR8qxuFvUoyJGOggwmnQjz1eOu/zuBnoC9nIHy
 Mt1SXFnegl3HSHLXyLlfnK9VJ4vuEnP14norCkHHOPZnZeRLUEy2EPLM0f/mwZcIx0akrt4RDno
 XUrFJwOmxjdl/F3/DOHS1z9rna8NQifwF9bJ83hC9JIm875RPKZVq9NLm4UANK6QHf2R+4/H8vt
 v57aqYzVwtZxSuroRuAYMkjEvY1aYg5Mhl5NqlAbRPNl5BIvtNy3iV7oROI9Irz17aO6pkth77W
 HdKBBMQ0SgWxU6nrVdZ7MpJlHnb0Q6eCQ43XsDE58TAP9vTea4MwCYaqZITUIJJnFaCKggJTx+J
 /9R/uiRoUNSaaMz8Lw+g908N9uZhtu6Y7HDKslgkbyJx1PN7bMF4ZA6NeB0yuP6UwRACP0j8/17
 0Rl6TZPrdYYlOiB6GGg==
X-Authority-Analysis: v=2.4 cv=K8US2SWI c=1 sm=1 tr=0 ts=6a6c5639 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=lzBMFA2zsglRjAhb4b0A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1015 spamscore=0
 phishscore=0 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310056

Use the __free(qcom_tzmem) cleanup attribute (together with no_free_ptr()
whenever ownership is transferred) to replace open-coded
qcom_tzmem_free() calls and their associated goto labels.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 49 ++++++++++++++++------------------------
 1 file changed, 20 insertions(+), 29 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index f35f2ee39130413ab3798551b4055228008222b4..10c79d2e59a14af0532c515d332f65bdfea05621 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -634,10 +634,9 @@ static int qcom_scm_pas_prep_and_init_image(struct device *dev,
 {
 	struct qcom_scm_res res;
 	phys_addr_t mdata_phys;
-	void *mdata_buf;
 	int ret;
 
-	mdata_buf = qcom_tzmem_alloc(__scm->mempool, size, GFP_KERNEL);
+	void *mdata_buf __free(qcom_tzmem) = qcom_tzmem_alloc(__scm->mempool, size, GFP_KERNEL);
 	if (!mdata_buf)
 		return -ENOMEM;
 
@@ -646,11 +645,10 @@ static int qcom_scm_pas_prep_and_init_image(struct device *dev,
 
 	ret = __qcom_scm_pas_init_image(dev, ctx->pas_id, mdata_phys, &res);
 	if (ret < 0)
-		qcom_tzmem_free(mdata_buf);
-	else
-		ctx->ptr = mdata_buf;
+		return ret;
 
-	return ret ? : res.result[0];
+	ctx->ptr = no_free_ptr(mdata_buf);
+	return res.result[0];
 }
 
 static int __qcom_scm_pas_init_image2(struct device *dev, u32 pas_id,
@@ -773,10 +771,11 @@ static void *__qcom_scm_pas_get_rsc_table(struct device *dev, u32 pas_id,
 		.owner = ARM_SMCCC_OWNER_SIP,
 	};
 	struct qcom_scm_res res;
-	void *output_rt_tzm;
 	int ret;
 
-	output_rt_tzm = qcom_tzmem_alloc(__scm->mempool, *output_rt_size, GFP_KERNEL);
+	void *output_rt_tzm __free(qcom_tzmem) = qcom_tzmem_alloc(__scm->mempool,
+								   *output_rt_size,
+								   GFP_KERNEL);
 	if (!output_rt_tzm)
 		return ERR_PTR(-ENOMEM);
 
@@ -796,20 +795,17 @@ static void *__qcom_scm_pas_get_rsc_table(struct device *dev, u32 pas_id,
 	 * be of unresonable size.
 	 */
 	ret = qcom_scm_call(dev, &desc, &res);
-	if (!ret && res.result[2] > SZ_1G) {
-		ret = -E2BIG;
-		goto free_output_rt;
-	}
+	if (!ret && res.result[2] > SZ_1G)
+		return ERR_PTR(-E2BIG);
 
 	*output_rt_size = res.result[2];
 	if (ret && res.result[1] == RSCTABLE_BUFFER_NOT_SUFFICIENT)
-		ret = -EOVERFLOW;
+		return ERR_PTR(-EOVERFLOW);
 
-free_output_rt:
 	if (ret)
-		qcom_tzmem_free(output_rt_tzm);
+		return ERR_PTR(ret);
 
-	return ret ? ERR_PTR(ret) : output_rt_tzm;
+	return no_free_ptr(output_rt_tzm);
 }
 
 static void *__qcom_scm_pas_get_rsc_table2(struct device *dev,
@@ -820,8 +816,6 @@ static void *__qcom_scm_pas_get_rsc_table2(struct device *dev,
 {
 	struct resource_table empty_rsc = {};
 	size_t size = SZ_16K;
-	void *output_rt_tzm;
-	void *input_rt_tzm;
 	void *tbl_ptr;
 	int ret;
 
@@ -843,7 +837,9 @@ static void *__qcom_scm_pas_get_rsc_table2(struct device *dev,
 		input_rt_size = sizeof(empty_rsc);
 	}
 
-	input_rt_tzm = qcom_tzmem_alloc(__scm->mempool, input_rt_size, GFP_KERNEL);
+	void *input_rt_tzm __free(qcom_tzmem) = qcom_tzmem_alloc(__scm->mempool,
+								  input_rt_size,
+								  GFP_KERNEL);
 	if (!input_rt_tzm) {
 		ret = -ENOMEM;
 		goto disable_scm_bw;
@@ -851,9 +847,9 @@ static void *__qcom_scm_pas_get_rsc_table2(struct device *dev,
 
 	memcpy(input_rt_tzm, input_rt, input_rt_size);
 
-	output_rt_tzm = __qcom_scm_pas_get_rsc_table(dev, ctx->pas_id,
-						     input_rt_tzm,
-						     input_rt_size, &size);
+	void *output_rt_tzm __free(qcom_tzmem) =
+		__qcom_scm_pas_get_rsc_table(dev, ctx->pas_id, input_rt_tzm,
+					     input_rt_size, &size);
 	if (PTR_ERR(output_rt_tzm) == -EOVERFLOW)
 		/* Try again with the size requested by the TZ */
 		output_rt_tzm = __qcom_scm_pas_get_rsc_table(dev, ctx->pas_id,
@@ -862,21 +858,16 @@ static void *__qcom_scm_pas_get_rsc_table2(struct device *dev,
 							     &size);
 	if (IS_ERR(output_rt_tzm)) {
 		ret = PTR_ERR(output_rt_tzm);
-		goto free_input_rt;
+		goto disable_scm_bw;
 	}
 
 	tbl_ptr = kmemdup(output_rt_tzm, size, GFP_KERNEL);
 	if (!tbl_ptr) {
-		qcom_tzmem_free(output_rt_tzm);
 		ret = -ENOMEM;
-		goto free_input_rt;
+		goto disable_scm_bw;
 	}
 
 	*output_rt_size = size;
-	qcom_tzmem_free(output_rt_tzm);
-
-free_input_rt:
-	qcom_tzmem_free(input_rt_tzm);
 
 disable_scm_bw:
 	qcom_scm_bw_disable();

-- 
2.47.3

