Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C683AFCEC
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 19:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790020619; cv=none; b=mUTPdBUgGzONVgTZ6WRLJGV9OKFkfq88zEkLEyoKW+LDfMLEikI/HU7vLxKQpuc9C96IJ8tkMrL3LiD7Cy+hFEKoI90HE+zeLv5oteY/Btp877UOK7h1qHpy6jjloX3Bic0FAHMHYPl5hUbimBIorzueMA9D3d2obzjpgPYScKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790020619; c=relaxed/simple;
	bh=Z9bOkuLfy3RzqKggtHIZcjGGfv8Yvr7Gg6w1qAXnJi8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X7ag5cyC7GJaNPbM4BBaBoaWKPirmd9ACCaBceiJ70A6H40SbFnuQwg34Rux+mdtBnzDpX39WgZjK5tkFSKM1WldLd3HRY2dyuN+Akj53fwTerLhSk+GKyWOiUJVqK8kSJInqstczEz5ZpQLsRjVQ3Rc6Y87btkFVVyWyBvkth4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e/9m45Zb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nhlec/F9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e/9m45Zb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nhlec/F9"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LFApqZ1817496
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 19:56:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=J7OX0veYD74
	KLJo7swTaAO9kd1WG52FnKrr53CsUzYQ=; b=e/9m45Zb7f7d/DiwXNoB6muZUS0
	K18toTQgjOGmyX2ustfF0OSEkrewA2/QSO8tCzDoVMSBzzRSc1KYzBMS6+VeaVoZ
	GTAZ70n1hQJhX0gvRuF8J5Op1SWgRR+YhlOF65/moF5JEaQ0rrKhgo8n3g2w2nGQ
	OHPVRKIjIUtlSpFw4elgpEvP30imAVGS8F0Ep3ah7tBFi6IluYFl6oTf391FzcJn
	chDs1yi0tUn7My33eLbjFYKn3wWyvAza/FB5ZQrMqNblIj+plqa5jlhsMVrlxv2V
	nHWi62X8TWrzXhjZAYkukDW6DP8qa+jiUMCoz84UZe/Rw9cwQcKaEQTcsmw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu011b5dg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 19:56:55 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39b77130a7fso6077651a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 12:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790020610; x=1790625410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J7OX0veYD74KLJo7swTaAO9kd1WG52FnKrr53CsUzYQ=;
        b=Nhlec/F9O/MMSUl5lfAmCRQdlnLbWBOOg3JpBQdCTcdsVxfV4pRjXDthm4juJF49Wg
         bSZ4n9eUusxOrPl68kH5aitetWPAxBLJYAVnNKQC7BzUy5gvs5crRP+iMSjXwj/fEB4d
         HVfaWkXLNRkl0bwXBg2YZ3zsOVbRPw5Zcd6bpvjQqnizykrr+iTyclHjRkAyZe2pQ4cB
         x0578yVd/DJMWOcXOzgjI+wlpZ8ckFz7Ws+O16RtdyFPVCtM4IiStDeo7bgZUCSwDkxO
         86qXcR8pXHXmr3t8Nu6Dz+dRFD9hY1jBY9HzSFeZwkc/J7+/gvzXRcDru89BVpuIbU3V
         +Yzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790020610; x=1790625410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J7OX0veYD74KLJo7swTaAO9kd1WG52FnKrr53CsUzYQ=;
        b=lyFiBx6r2m8C50IXO0p41TjZsAeng/uTqJ1ruXRHcvSZx7++Wik+1z4nvcOW13oPxe
         Tlv0xLGGbUffm6cVNwX1rK8BWrHSkRLiyyTT2jLpPOMpbDbnOkhWnFQKm0WyRY3bCTAq
         r1Gfcwq1KeaKaWoDmYnkMiu/71SliMvUcp8d6Dw0lQyjAB/DaXCzbQiBvDNCk5LmAyA5
         kB8qykrAZdRGx99WwAZ5Z/jDylzARJ13iGfImkBzFgl+B8JaMNV6DwpDYGD2nB3AMJQd
         apkUJtryTFVqj7dCyaGtTOCpiSVgPYbhI0Er90EUFVhTLGQFtZhn4ACYfTx3LWQZqNha
         FWLA==
X-Forwarded-Encrypted: i=1; AKwUvBwjA490qSsn3qlzgejJYWDKjH0pkTyENTXLur4n7+TQSgDiXenHhaTM5WpbJIPfRXPDDPvWJugoC7K8I4oy@vger.kernel.org
X-Gm-Message-State: AFuF++kM6Ec7h8gnr939QpIxyDi3cFzbkk5Gde8hda0TKEqjRwp8WVEN
	ZthL7PAdquyGv6ZzMsmSxOrfZxUK6jy5kt9sF+hhm9HzGYwvFDyTWCZFH4odTEsGdAjJ2GI5BEd
	5KW0qMtUASsUu4tmCdoMRaH+R/ylTvWE3LYHP5RK7/m/pDH2Vc5GbZGyItv9XazhioKRO
X-Gm-Gg: AYBFou1oxzntAH6YBSVV1A30yxKO9RQc3NYm7/RmROy7FS3NXHm22gV3waPwz5VJCb8
	BHQAN6hQORgxqMFNrcPuNHHRw/XiAplj9mXchuUhNBGOsKgvkVYspcjKE6XlwyXK3aibaYT6N5s
	pja8vkuFRGXajFns0hAku1kTvhN3N8jnfP/M7si0a//cTj48chk+vXYIbTRfX8o2/2aGCYieTAD
	/SNYQUbWz9Ru9Pf2//l0LIAlTlFJ+TTWP3MED530nEaNFZEd3lgfjCMzF4/vRDbLOByZNk7GLIo
	MJFF45PjYL7BMLHIcwJSdLpJotBWkcFS08cnEPuXZjtbqDOza0ZeBNoW+XzQjg6aEVtD5TQFRwu
	Spo1Lf2wfKnJJDF4x+zCk94+8bQ==
X-Received: by 2002:a17:90b:53cb:b0:39e:4c7f:8b16 with SMTP id 98e67ed59e1d1-3a06ae46889mr47242a91.27.1790020609585;
        Mon, 21 Sep 2026 12:56:49 -0700 (PDT)
X-Received: by 2002:a17:90b:53cb:b0:39e:4c7f:8b16 with SMTP id 98e67ed59e1d1-3a06ae46889mr47211a91.27.1790020608914;
        Mon, 21 Sep 2026 12:56:48 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e5ec4e584sm241142eec.27.2026.09.21.12.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 12:56:48 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] firmware: qcom_scm: handle empty PAS resource table
Date: Tue, 22 Sep 2026 01:26:35 +0530
Message-ID: <20260921195636.1925869-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921195636.1925869-1-mukesh.ojha@oss.qualcomm.com>
References: <20260921195636.1925869-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: k0TVcuaOVx5L_4QD2YncusgzSDOnilMB
X-Authority-Analysis: v=2.4 cv=dPczC+Zb c=1 sm=1 tr=0 ts=6ab18c07 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=aAyslVjwNEohmH4VXmMA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDI5MSBTYWx0ZWRfX00Xb6h81VG5w
 adGlosmSRrGXXAGkEPgUGxgG0Z5nq5has6yQmtCGIxTOXcMcfBLhrlS+qu6Ygwvix6mXOuhKnEH
 /x2L/sUNKlZYqfqHXo+nH4W4rIONQHn0Prx1hSZ8/AoxZClD7t+XNhDHVisEPq3wbAaSjAUmMeC
 Q4HtC2XUUruXhFlo4VEYfAln6PIGEJjPm6SWANIpMCexs79c0q4wcZ6SjA9cMeCXZpWqLcQuC/6
 JBefcSUR0cso+yJUHXNhnM2lQuNnZnvZxFhQM1fxwuWJR0wtBBbfORxMxIWggyNxGHYTnvZqZu7
 3Lj/ovwGpy/cmD50bKbIsPIe3F0QciJwitnacJfyLc3sEwv2+bR+jhDmLgjPQiOt6Ltnr5krqvE
 yB++XOjm+QDU+A5E1umFlh6rNDwum8jVJu765aC/yEuvROBVVaWLZA8rFbrrhUAd05sxt9xZrHb
 QdkeQdkXgnjGF3JBBPA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDI5MSBTYWx0ZWRfX3+Xx1s2yD912
 e0HywwpTT4YTMqoaVt7DgEuf8LSygIj0d4oyGVzVk9YSt3kBjCBTiWsTKZzmuV5Y+ErSmQgE66W
 SlvyaWrJ0ZZASTr0GYX6vXOxivza0HU=
X-Proofpoint-ORIG-GUID: k0TVcuaOVx5L_4QD2YncusgzSDOnilMB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210291

The PAS resource-table query may successfully return a zero-sized
table. kmemdup() with a zero length returns ZERO_SIZE_PTR,
which is stored in rproc->table_ptr. The remoteproc core then
dereferences this invalid pointer while processing resources.

Treat a zero-sized result as an absent resource table and return
NULL after releasing the TrustZone memory buffer. This allows the
remoteproc core to skip resource-table processing.

Fixes: 8b9d2050cfa0 ("firmware: qcom_scm: Add qcom_scm_pas_get_rsc_table() to get resource table")
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
Changes in v2:
 - New change.

 drivers/firmware/qcom/qcom_scm.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index df20773dd754..b5959f833dd7 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -823,6 +823,14 @@ static void *qcom_scm_pas_get_rsc_table(struct device *dev,
 		goto free_input_rt;
 	}
 
+	*output_rt_size = size;
+
+	/* A zero-sized table means that TrustZone has no resource table. */
+	if (!size) {
+		tbl_ptr = NULL;
+		goto free_output_rt;
+	}
+
 	tbl_ptr = kmemdup(output_rt_tzm, size, GFP_KERNEL);
 	if (!tbl_ptr) {
 		qcom_tzmem_free(output_rt_tzm);
@@ -830,7 +838,7 @@ static void *qcom_scm_pas_get_rsc_table(struct device *dev,
 		goto free_input_rt;
 	}
 
-	*output_rt_size = size;
+free_output_rt:
 	qcom_tzmem_free(output_rt_tzm);
 
 free_input_rt:
-- 
2.55.0

