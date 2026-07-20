Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76EC03FF891
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 15:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784561855; cv=none; b=sR0sH3iBgt2mBGvinPmkmQkpcoaJYgqlM2spI5uUR0vdWdIvHZOf+bAXgOOP274B/570GY5bNQCM2wU3atb2Q48cI0YzTybZMlx7UOojoG/IC0fFt+HpQE1YHxngnWB3VuzTbnCtwYfQGvDyqa8siq4KeaWzRvG8qtSe9LaJL8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784561855; c=relaxed/simple;
	bh=M+cOvocJ8K5dmYoG9bsRGxaN5PNHj3usbZfHoWLjrwk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SXV/8V5IRz+8iwfLfGt8Xbus20VafsqLdrwko3W/CcDopg7elL49OwhiOnltZI+0OaAaQsPPgyVS72jeLpY9KJ5RX+HLTPq1CQBlfgygM/C6nzWwxnCaFh2V7ruIIfNEpY3DEH4A8fk4qoOkUVjALgMBVtal2bsHpsiS/at4a9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dstzQmkT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LlUXiJXu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dstzQmkT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LlUXiJXu"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KFLt352820263
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 15:37:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xXyCNJJhao0kgWF8vvBz98GHDz2GruhfMdt7aLZC6YU=; b=dstzQmkTX2D9Hqiu
	MKFYxcHQf6JuVFsXrGZkbfuNVQKhN097em3CW25Y59m+Fgx+jVhxThjEIZ++kuxb
	vVLE9IVQPAcB7n783g/G+TNd/VEytvyHRGaIMwirP23v+t3gXxGRFD7RBpjD1rN/
	3Ahjz9MA2brui2cud1dOSEcbmzi6Wsvle3ZCdQmn9LZuWfY/ORBVuzmEzBfasZoO
	ml/LHbDhtaV251u6B9pqg0inHf/aZYLi9o8/+qN8isK1RKXFqza5GjhBZ43cDZud
	Y2Q+WbVm94L5jT90exGIoyMNSZ2cPkS1jbuJ7OhQze4GEHBlDUXPNH888iQm9iMe
	vDfhDw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhggg9wuq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 15:37:33 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cab041eced3so12376995a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 08:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784561852; x=1785166652; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xXyCNJJhao0kgWF8vvBz98GHDz2GruhfMdt7aLZC6YU=;
        b=LlUXiJXumxxYEOIBs18t4aUb6ppiCiD6OUaLZa8w7fxiVGKeESM3DJHwf//KkfI+Sv
         onrG9hldDYw2b6I2oD2Ebp8KdLD/u7tA1Fxl8lXQn5HDI3vkZXTBufy4bmsZjXOIYdhM
         4ybpz9vA9Jgj8CaeCZiOeoKt9jAv+AbEjRRnPr8lD6fzDHvgf5NfT77l7Qpk7TeWFJ9t
         kMBE8SwDjrETBjebWIbJdwBWJpV0k/6xa+Q1MAnUEWAeQh2o4WKLNdySEn8Z5HJ4vNJT
         MvJ9ZMLnuDFArWZ6GY5HjG9c80kfS/jQK216JsTTl2Y1IgxnQptv2PGrkvagM7yfmZ1P
         honw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784561852; x=1785166652;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xXyCNJJhao0kgWF8vvBz98GHDz2GruhfMdt7aLZC6YU=;
        b=l1tb/EuGeqnrxw3Wb0+yUfUpUH/QsZMbDtQF7ay8pDU3l6mXJo+uBb9tmSxcv/le31
         53Sqw/GwnP7pzAQtWl+wxHzOEp5baNB3rUpx2rAI1+Tc/oArq15II5SYAbZuxgaN02Bb
         CNbcTNf+qoZOxWm7eOgZK2rX2pTj5xM2cCHaGoaX/namzG/qgp02XPnQ8EVyxY6XVELp
         hjQ6AilHLPnzcM1HUc5Ren1n6LzKsB7sXA68qd7Lx011VQav6y7zXJe2XnfnQx0PSzLE
         BDLTlUWDKKubQXmLjDkujwwyUmlRJ/CFqlZsqKiZX3jGDxxVKe8GIsqZWDHSS5/SFf9h
         dxoQ==
X-Forwarded-Encrypted: i=1; AHgh+RreTLnf8nbDQyOWDwbubg8pj9YIigh4SGShAJHIPrKxewsGv1ojGEuhDFcO7gB4yV5qBfkNS/pcGdPrMmNz@vger.kernel.org
X-Gm-Message-State: AOJu0YxfBMRxE+Jn9pzZqU2F5rw7IbQ94Rgv+SlhStfB/x/Nn2rSfCBV
	sUMIddL5i8Y4ZhS4dBYL9i/IaWFecieaNS/qPDxipOXjJcbIAEJDqbLd4xU5ahFgMQKMwDXmr0k
	cwfrlOUBJ/AtEX/vV5YJNSpCkPsLAkQovjO1dQEsSqJDb/ejuOQs3WQ1pLnmgzWeVBWY4
X-Gm-Gg: AfdE7cljPe0t13ZUlW0V34+sKvPqpbT3g7Y3si00hpZ9NsbmJdTksSFugJHkzjuPqu0
	3iDcI1SXUj8VzzUPEbWb03GYdm+D0WdppLn78s1bSpZQi2PQUv4XGWNlzXF7kwn0in4nIuCWO/2
	SqUBEIwKn/wKwsFmII797qJK0J3DIJ1S8vb0586Y+s0ymo+lD5qjyTSxNA+p6pu2J343HmMZnSj
	wnOW6dXmraq3JvhpktT2T2sd5/39wSesFqWRt81mtHxWGIThxSgVlOzdr2oVSXH3Y+bdgl4O5p+
	jJI/stT9dYokd30yrJei14jkLpMOZkPmTPTBfrsyOU1rFzVlg6MSOsHoKSY9AoXYzZT3MdIbL5l
	qjFLojplF2abMnBDdpDpxKEMEhv+CPw==
X-Received: by 2002:a05:6a21:4a97:b0:3b4:8f18:33a with SMTP id adf61e73a8af0-3c3ad5d7a8dmr15764346637.1.1784561852281;
        Mon, 20 Jul 2026 08:37:32 -0700 (PDT)
X-Received: by 2002:a05:6a21:4a97:b0:3b4:8f18:33a with SMTP id adf61e73a8af0-3c3ad5d7a8dmr15764299637.1.1784561851798;
        Mon, 20 Jul 2026 08:37:31 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429cf22b3sm38572824eec.0.2026.07.20.08.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 08:37:31 -0700 (PDT)
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 21:06:41 +0530
Subject: [PATCH v5 4/4] regulator: qcom-rpmh: Fix coding style issues
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-b4-read-rpmh-v5-v5-4-cb93fb95f565@oss.qualcomm.com>
References: <20260720-b4-read-rpmh-v5-v5-0-cb93fb95f565@oss.qualcomm.com>
In-Reply-To: <20260720-b4-read-rpmh-v5-v5-0-cb93fb95f565@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784561832; l=1010;
 i=kamal.wadhwa@oss.qualcomm.com; s=20260406; h=from:subject:message-id;
 bh=M+cOvocJ8K5dmYoG9bsRGxaN5PNHj3usbZfHoWLjrwk=;
 b=9ZtWm+zMHbcTEslY/01MrX5TPH5A6EUzZkJnc3uGC1riw07p2w72+tlQWTMFLvYf76Knvuc6O
 S74B5o2u0gRC/Z54A160X/V7wHSx7iteb7h/vDblzXNIw6Qjsvoiazm
X-Developer-Key: i=kamal.wadhwa@oss.qualcomm.com; a=ed25519;
 pk=ylH1NxUZkBpYsmww89g6zVxpS0q8qthtzcORkYxn/Ag=
X-Proofpoint-ORIG-GUID: YYcGqwrEj4MXVnubKuAp1ZbIZ36NOA-j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDE3NCBTYWx0ZWRfX9tHI5XDPiwDP
 kHQr8Uyb11uxXEycyBn/+CZdhf1BofDMWqUkbS2DWxvtDdvmTagwH2FMnSSNOF4aYwvzZhIUZBl
 dHkSgv0KIApStQDdtByzMtf/xO3wGdpYbMRMGsbF3u2Y2ZyK94Bpi8pguJroPfs8gf0vvdumIiX
 3fbeWc5hr2r+sj1ixUBquSdeBlhHdSAde/hmYfQ1O0bdUXFMqnp8NlG3iINTsYjAUj8vpUSGxPT
 gjs6F5wiILZAzYlARy8PQa+GpJkjaHqu5S76G93qcW4N4fEM9AnFpa+jOTZKMLynP3w3HMqLWM0
 gJaTKQc3c8chdGnErli4HHs7jdUtzy6XU8lMHdLDzfR+EVYgBY8WhtHLPSh0rRYYGBhCszyYEdx
 HOoxLG2gCRubs3++cfPpltUDyILCOm6CyjZuvTrtF0vCtSRZf3R42zW7P2GxmS3cteJaM8NSE5x
 Aq1eH2tOpl23VWa+l9w==
X-Authority-Analysis: v=2.4 cv=RPmD2Yi+ c=1 sm=1 tr=0 ts=6a5e40bd cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=5CyPyIk1yY-pfn5d-v8A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: YYcGqwrEj4MXVnubKuAp1ZbIZ36NOA-j
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDE3NCBTYWx0ZWRfXx9YHCTGcjrTl
 1qiDBq5QFeShCeDU4uMHEy5lotD+Z5HlOzI4tg4QxlSVNXkzLpqOOzQd9yIDqB80vqcTkMNaJ/u
 +jtvokomL5poPHYY4PqWMjYZ2gFDjxI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_03,2026-07-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 clxscore=1011 priorityscore=1501
 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200174

Fix the code style/format issues reported by checkpatch.pl
script.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
---
 drivers/regulator/qcom-rpmh-regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
index 56a51f8893b6..1845c865c735 100644
--- a/drivers/regulator/qcom-rpmh-regulator.c
+++ b/drivers/regulator/qcom-rpmh-regulator.c
@@ -110,7 +110,7 @@ static const struct resource_name_formats vreg_rsc_name_lookup[NUM_REGULATOR_TYP
  *				regulator
  * @ops:			Pointer to regulator ops callback structure
  * @voltage_ranges:		The possible ranges of voltages supported by this
- * 				PMIC regulator type
+ *				PMIC regulator type
  * @n_linear_ranges:		Number of entries in voltage_ranges
  * @n_voltages:			The number of unique voltage set points defined
  *				by voltage_ranges

-- 
2.43.0

