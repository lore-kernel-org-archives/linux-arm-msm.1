Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616AC481257
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Oct 2026 12:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791204858; cv=none; b=mE3wx8eaH8MxZpDr1r/BJwoUIpL3v2r2+h+rGygjHQSfkiG5VcRnIMCqAH2zPqWdOFzsYYlGP//m5Pv5xMxVajUs/tari8KvwuOzpOSMzS7O+0wH+Hn5wSobku2i/Lvu3KxzX9qY9XL5xzZ3onsDhZLnwCiAb8obVXcn0AkBIGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791204858; c=relaxed/simple;
	bh=ggi3edH2klsPzsxW2XWRtaHeVgrW9jclFLxw4x7UpQI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iVtXtLtZ8ysUkp9D4c1HxE7D0Gai7xFHjlwdnDxB1axcKxOSxtgejSnVrZEZaq2Uc9EgY1q3uDYM8KEPVBmPo8Nr63MQNXEXEQFywmGvDx7c3ZQks0i2eMoHVkicXLvk7UbpG4z7DnS5pffLwwrrejMjRMWxoRwemy+Oqcg9PWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DhkYmXq4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U4y/MPxj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DhkYmXq4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U4y/MPxj"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695CFZri1892795
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Oct 2026 12:54:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=vVrgrn112DyIlu6tiZbiEtrGUAFwMDOUCgX
	pzhVzQV8=; b=DhkYmXq41i5fLaBJS/tNsSBH39EZTaHw1TK4m1wNF0SONUsIqPL
	F0+aZoOfVooxfz7mj8DNwu7Lv3VAaHcOg4A4Ne0+7O4F4W34F6QZ+/Ddkw5uZvmo
	ypwwpIvmbxAyrtVhUeaQWSZ11neqmsJexhxVLJdmdl6BgjOIF7ks5Z65RPFzHdze
	SLvPuZylWB66cjv4XvcvtEseqJTH2mDBCduVPlsyaX44OFMQy6a2+I5EbnL/XFe7
	idVlrTEC7ikqsnLumLbYqWqzVAJyAuPJB8ixJBgjU8aut66H6eSkyvgNdClpONnc
	IOXPQ2ye2lKCy1qLiA6jOZYkYyOIgdHc3tw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2ssudw6r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 12:54:16 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5337f26ee19so50008021cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 05:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791204856; x=1791809656; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vVrgrn112DyIlu6tiZbiEtrGUAFwMDOUCgXpzhVzQV8=;
        b=U4y/MPxjYdP7d51DW3QfMLNiy5jdwbhXnj2YIEqRt7PkbkvVRzT155vSUxpeKz8Pi4
         qmbqKawbQjpKx/OWEXYgZaFzKTfTGGbL79g8D7dj1AyxObaWMy5/SyPdfhamhIthpHQh
         vX3+bPo7Gtf/tjLDlH85r5OhF+Dt5hLVANj01SDKSa/Rjl1tGRsHT+caK/KKPPYfBN+b
         O47HB0cqdqFmtIY1muTX58U8uwyeZagy5TNAJi58gWUM09w89sS/TSxtm3iy72AtZPUh
         5voXG3yA1FnPCpThji3a6Nq3TZYVKr5/4lRVPCmHp3SbxkPC6aOsMnOJEWDN7M07NddW
         ZjWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791204856; x=1791809656;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vVrgrn112DyIlu6tiZbiEtrGUAFwMDOUCgXpzhVzQV8=;
        b=tmj+0BdhEwkMBi18KXuLtWA5inQRAXyXZuEQ1AIMGsMjdALwfYgFJuIQhzv+DE0PvC
         6yS0BC5yvEers4LA7EBBmhKPgYj4kDtvvF06FtH4OzkrzaVEBClxj0idhfoCCbuv+nYa
         ZoH3n5Y1rVgwcGy9y8jmFks23bMKjLaZyOC4/JYTnFaqNLttryMNR5l32rd5OPk18vUf
         SBq34I+UrYitQxNSLspsV0vRglb8FAQdQypM1ysaf44dx7RmfINYDk2RT5fnQQtGGI19
         Jujwx1ta8mYkNLQVqVElmeQYG9LnCzLhYPQnqrH+seQ2uEAUSgPEkYhFqG/3O4NrZWUg
         vypA==
X-Gm-Message-State: AFuF++nCE3bK34tAoysV5X/iFXmQ8o7AJWkyd+oET8AuBksiaEiiIzte
	rrSG7ZD4gDwmlqA5k/7/HQFzrEAwgO/g4kt1KQUbCBJ+EEYIEmng56FG7e+rVbOYPjVhF3ap4Qm
	7D1/SYLm8r1WJhX/27+ylipoAHm0/HU4+UiXHsOhJvfGhIoXrG3Z7YwDSLlOswIWroaDM
X-Gm-Gg: AYBFou1/cEn2ERccnQcEK/VDepEhP2qSUD27sQO+WQI+lhnB8OJlBgk7P8+F4f9GV0t
	cLFrkObNQzcZdWpeQAt8m1o36oXnpnelvG0YbwGzvBJYOPyNAeun0enuIaZ1Qwvl1RYIHmFrrN5
	4/UXoG1CaxCej0viHMtn7yCJy6WtGLkJZA7+oVLPV1C04hyH2I2x2DL2witbKbtcOhZHhemF8HH
	yDyQ1BskiO2kDlgY//T0XDNEXA3BEC7f/fhUjkihnNvI+eTA3GBnL5l5iPkgJz9Phv5et6oW84k
	zl4EyrtapaHu48ggvhAjqGQdGlNymtSxx43xgE4ZKzBVl8xnjExzjklgTsgAfPLobfnr0QCo6bY
	hrRYH/P3UsXfvR511jI7LgGFalHCpoETj5w0LaDJ5SL6x
X-Received: by 2002:a05:620a:4013:b0:93e:7ac8:fec6 with SMTP id af79cd13be357-93e7ac915famr259559085a.39.1791204855528;
        Mon, 05 Oct 2026 05:54:15 -0700 (PDT)
X-Received: by 2002:a05:620a:4013:b0:93e:7ac8:fec6 with SMTP id af79cd13be357-93e7ac915famr259552885a.39.1791204854938;
        Mon, 05 Oct 2026 05:54:14 -0700 (PDT)
Received: from trex (5.red-79-144-193.dynamicip.rima-tde.net. [79.144.193.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c62270728sm3508733f8f.12.2026.10.05.05.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 05:54:14 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, andersson@kernel.org,
        mathieu.poirier@linaro.org, konrad.dybcio@oss.qualcomm.com,
        mukesh.ojha@oss.qualcomm.com, sumit.garg@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] remoteproc: qcom: pas: pass no resource table when the firmware has none
Date: Mon,  5 Oct 2026 14:54:00 +0200
Message-ID: <20261005125411.2151326-1-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA1MCBTYWx0ZWRfX6ivW2CDExqwa
 hQGH1Mm7T+s4DzkEjpFBSVCOKbShtSrSNdWLPuUbrQZDkEDBhcx060SuxJ0jJYopo8vJbBIPEpp
 CCEpW8BCqEJN0cKiVbfg9rfTYi78ntU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA1MCBTYWx0ZWRfX8Wsl4ZyJmf7e
 PAgu3r9p4Lhv02hNM36Nr3XE/lSiAvEZhEQxRcFhrMRI2O9GSVs8VKgmTw+fOCuqVdtGStSiuHo
 17TZNPEses+EeAptU3kdp3PPskqYAMjDGKpPOpd7Vw3sRyEL/3NaOrHH849tLfUV4K17raatV1d
 N35QdfF4xM3CWFh4q5KHMZA/8U/m8Diow5sazKaM4PNyXpG/Tw3DI5AzfrVdkX9fLFmD/E3f+S7
 8UQwQw9PgSFoG8sg8+MO4SjhsnHlM5t6Lh6C/5ecMN59/GbuZ8UgekKmjBFgEGSwIBqzwskSNIP
 syN/eggu8Dw8EdfnF+JnKrd+3yXFDKPXj5DsWUt7ojvqYNgH1iXuEWLW5ui6pQARMX0Qlmv+psc
 +6ntOFHU6B9l+93UdOza556OxEyNfEGUjGRfJSGOpPaIiU+QrstWqXXMwk3IiBO8BjKkbVVxyNp
 9pB5HQbzZkbTYgiR06g==
X-Proofpoint-GUID: RMk4X5m5LFB13FpAg_VroUbwUYEa8CkY
X-Proofpoint-ORIG-GUID: RMk4X5m5LFB13FpAg_VroUbwUYEa8CkY
X-Authority-Analysis: v=2.4 cv=FryQbGrq c=1 sm=1 tr=0 ts=6ac39df8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=nno+U714v6U58lXnMUU6PQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=GaOYwgbrjy_8eysdYG4A:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050050

The firmware resource table is passed to the PAS backend even when the
firmware carries none. This only works on the first boot, while the
cached pointer and its size are both zero.

Stopping the remote processor, or failing to start it, frees the cached
table and clears the pointer but leaves the size set. The next start
then pairs a NULL table with a non-zero size.

The SCM backend substitutes an empty table and hides the problem. The
TEE backend copies from the NULL pointer:

  remoteproc remoteproc2: powering up cdsp
  pc : __pi_memcpy_generic+0x110/0x22c
  lr : qcom_pas_tee_get_rsc_table+0xf4/0x25c
  Call trace:
   __pi_memcpy_generic+0x110/0x22c (P)
   qcom_pas_get_rsc_table+0x38/0x60
   qcom_pas_parse_firmware+0xa0/0x100
   rproc_boot+0x2d4/0x380
   state_store+0x40/0x100

Fixes: a4584bff63c8 ("remoteproc: pas: Extend parse_fw callback to fetch resources via SMC call")
Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index a005546c265d..e871e03ba794 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -463,7 +463,7 @@ static int qcom_pas_parse_firmware(struct rproc *rproc, const struct firmware *f
 	struct resource_table *table = NULL;
 	size_t output_rt_size;
 	void *output_rt;
-	size_t table_sz;
+	size_t table_sz = 0;
 	int ret;
 
 	ret = qcom_register_dump_segments(rproc, fw);
@@ -476,11 +476,12 @@ static int qcom_pas_parse_firmware(struct rproc *rproc, const struct firmware *f
 		return 0;
 
 	ret = rproc_elf_load_rsc_table(rproc, fw);
-	if (ret)
+	if (ret) {
 		dev_dbg(&rproc->dev, "Failed to load resource table from firmware\n");
-
-	table = rproc->table_ptr;
-	table_sz = rproc->table_sz;
+	} else {
+		table = rproc->table_ptr;
+		table_sz = rproc->table_sz;
+	}
 
 	/*
 	 * The resources consumed by Qualcomm remote processors fall into two categories:
-- 
2.54.0

