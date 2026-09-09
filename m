Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D42530DF3
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 10:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788951074; cv=none; b=A6BrXY37KFmbTDeQYuWgTaTd+9v1/QanUDLZ9nz6z1YXifZqyWd1hIOrKTTDD5bAJzEYzVrbMrG5h6g2oqsfCjv6p3fPBzXvtCCZlAO10BI0aXuLcO/p8aLuEYiUVFcIH3vN3vAG4Ue7LH2qbeKv0luLMVlaJjaRrLypBAl+oKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788951074; c=relaxed/simple;
	bh=2uL+BEbJFI0aZgxBFxpVYgInsl6ywz9PoGcVsUCsRUA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pOii7O8rfeDK8d/MHJCqCY8Qjv1VOacWtYadII6IgTh5OZVV/Mo0C3KSWmltIUsVnIgEUZqRBcfDUhci/XGcm0ZySEDpIPN310gWogNh/F9Vbm4AU/pLXhTsBiV+P1WNTAe8RxDq8fj1fi/TUjuc6dV/AfSU/5fFaAytKX6fXjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B3YIB9F2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cJqFJ9W6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B3YIB9F2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cJqFJ9W6"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689ASHpt1170107
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Sep 2026 10:51:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fkauJ7thgLh
	tosPxn69++tv1mpgFbiKGw88ZWJVXATk=; b=B3YIB9F2cwfqdb0DywFGJt3kkqm
	BSUMZAlr53vtV2g9tG8FcGSVW9SdMPbpMcwcvB0tun6fKvHDOzsSCkpxM7Mfsw/s
	Q1cqEmrM0lxfIaFilfIFRiQj2rNaK5XnozToCf+S5SAI1VuEjCk+bCidVPNUa4gZ
	tCUsUmojBiOGjtLv16wZeBS+I6CkZreJavg7WSAF1qJdRL2FQYOF6wYDv2KTcV77
	kFo2nW86cdYZ8pUW1+75lIY83RWg05s14CWEXvV7IpCUZKTMCEJx6Dk8toEz7K7m
	Vf4wDFI2IODKN1MtD47cA1aOZaKoE/D8DIy2Vqv/a2Ti4nLbqD4S4SVtIcw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjstuau1e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 10:51:11 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc489e7a701so3493628a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 03:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788951071; x=1789555871; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fkauJ7thgLhtosPxn69++tv1mpgFbiKGw88ZWJVXATk=;
        b=cJqFJ9W6wCuCDvnKD+PhwwHvLjgjV5Gjk/qCkBK+rA995tobUkovs2hEdZYCdmBYWJ
         BwV7euwQJ4L7LPCp8JsAzdQ66A4Lsnrm9uNi4K8eneMZxN4XtBMQ3fMqi2LuXBObD6h6
         SI9utvlGdLTzSqX84gCO3976Bw0sYup0Yjzg+vtg8hMA+IRRB7kfIB6e4bXoF8q8CSsG
         xWkRKbrTYXqL6eaUjKBiDdlJjzB+UEY77afyjzmwanNak4EyrlUuGD30SziKVLpUJw0y
         KG5GquAlXPq13UYphFhtzBFNqV0erN09JLkyqpKmv+6b9rS1Sbo18jXfrqtBYpuOZmNz
         r6TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788951071; x=1789555871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fkauJ7thgLhtosPxn69++tv1mpgFbiKGw88ZWJVXATk=;
        b=MQkRYcBc9MtK/ZoO9RP/OFcKLgfmr/GlyL79Grsab8KQ+ENPFfby3FPGthF1h4PbhP
         kK8tLrFIsqhesQcXihonYrCoqQTXkV4qqDQ76GfYxSckMXLWakD9zuMUXXPT54RCej7s
         tld3pFjVILWVWZYQU3xQsT4Q84GD5Gt90BCqwyqjVN2QN4yhHfcj5NezLT7BvSCbkGDb
         DMimq4JV5dlHEnD9DeGGicjhCGtj5T3RzL5GqSTCdh0XGxXHVtOVjm++QwsgvnSqh5JV
         msrcd+zPHk6pnYWu4rgurFBb/BN8kkL9uFk7Mhj9IWpzn564/QTBhFcGZsHPm5Rczj1c
         wA8g==
X-Gm-Message-State: AFuF++kojMj4c4rDo2bdLi1TKbl/5QQgkG7npjCcL2xo4gz+n/XfgvtE
	Itx1udGjkxsuTH8fIHE1OmSLiR0ZQTK1X0vdKdVNqZjZUYfnTM6SCkzbaEzQKUXi5DZ2zgenh3e
	7VSMHy4RAB8LWlc77cFWwZGsgH57fCp8ckOtd+oh2CGbDnszd9nG4FTyIFTaJWqDqweZA
X-Gm-Gg: AYBFou2zNv1FRoSp/FQrztlxE6mZ6zN8LngW5jxQ+0+5b+AHaKJaNi1NvhueOj6+/e7
	QYBQ4SVjYd8xHKJEVPAoypb2/qRMdJmwrgRcMelz+BSEhOrwAmbLWUlwzuf2kYxxeKYe6RfDKYL
	ivBu5w+DFKNiceoa3t7ft0hHCk9gDkYrPeypWGBjrhg97AuTXhXHdNZfiADHynVUgG1NgiQLq2x
	+mAVkfOsI9fa3O3a2hSAuVSit63CjY6h9wxdim8xX2WzyPHV8dIhGDbGsAP2kwspzDVdLYX5Wdu
	M/f7nnhQ+MWk4Sj69qrx4xn4hSPlC53tDooh3/m5k/pdFjzvvLXLHz/71Lio7u6q7v8Lm7CtApj
	6jXmEQTgFpZkDnuj8KZZPCaq+hzY=
X-Received: by 2002:a05:6a21:329a:b0:3cc:8f53:26c0 with SMTP id adf61e73a8af0-3dacbef08d3mr484695637.17.1788951070782;
        Wed, 09 Sep 2026 03:51:10 -0700 (PDT)
X-Received: by 2002:a05:6a21:329a:b0:3cc:8f53:26c0 with SMTP id adf61e73a8af0-3dacbef08d3mr484629637.17.1788951070277;
        Wed, 09 Sep 2026 03:51:10 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1434bb7d71fsm12084678c88.15.2026.09.09.03.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 03:51:09 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v3 1/3] remoteproc: qcom_q6v5_pas: propagate dev_pm_genpd_set_performance_state() errors
Date: Wed,  9 Sep 2026 16:20:47 +0530
Message-ID: <20260909105049.1317985-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909105049.1317985-1-mukesh.ojha@oss.qualcomm.com>
References: <20260909105049.1317985-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ItAutr/g c=1 sm=1 tr=0 ts=6aa13a1f cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=l42t8P_hCmqpnny7Gc0A:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEyMCBTYWx0ZWRfX863FsUu75nNr
 TleaYYHz1VMuKHktjcfu0gEGp7fOS/OBwRf9lX/3higHwsWkcFGUeBlFZlQ453KfcFTOv8+eJr2
 VOtjdItB/gZogvwprIAzEhSXNac5rKQ=
X-Proofpoint-ORIG-GUID: H5BgGfdlErLtrzfvi7WOxsgcExV9rXnP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEyMCBTYWx0ZWRfXxo3BrWflVif9
 sAbzVKFZ3pYDfvjcKmxZTNTjYmtsMhuZ+DTtWv3VM3ZE0ZnVL53aqs7D/9Q11Z8GTPKOnPKRrPe
 Zl6ZvyPpOm6UoFiCb9f3lK/MMtMgokSCCg8f+aMj3N4y2TVAsQUX4yeiC3kUKNK9jedomLWctb5
 JHQl3gRejE08Bh3lcQyyvp8ENPSYeBl5r9Hr+3wdaUZ9ONoKGfTeBjJesiUEQ1rxnWzjUKK5quW
 KV65yQOBqToEjwGBpcvcQ9qk29R6ILchdZDcDL5fGZTZU0Md3xQcHmFyhey1XoH+XGzdwL/KiZq
 p0NIwM0ZMQSA22nBbJdZHDxUnpKfOPuEXefFl+mhZa2tGLDZl6SR8IpHqmZPwFcIwCHkhWpA/9p
 sgr5GFVc9go1MkWYrKOvGFELJdxLCV+6JTtBP5V6L9MBcGcPR69WXnV1BGN/xZtB5xdWfldEC2k
 SiUYFz3p8e+p2oU5m/w==
X-Proofpoint-GUID: H5BgGfdlErLtrzfvi7WOxsgcExV9rXnP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 phishscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090120

The proxy power domain enable path discards the return value of
dev_pm_genpd_set_performance_state(), masking failures silently.
When the call fails the performance state is not applied, yet
firmware load proceeds without any indication of the problem.

Capture the return value and bail out on failure, unwinding any
previously voted proxy PDs via the existing unroll path. A proxy
performance state failure indicates that the requested OPP is not
supported by the underlying power domain; continuing would leave
the remoteproc running with an unconfigured voltage/frequency
vote, so treat it as fatal.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index a005546c265d..c163e66347f8 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -167,7 +167,13 @@ static int qcom_pas_pds_enable(struct qcom_pas *pas, struct device **pds,
 	int i;
 
 	for (i = 0; i < pd_count; i++) {
-		dev_pm_genpd_set_performance_state(pds[i], INT_MAX);
+		ret = dev_pm_genpd_set_performance_state(pds[i], INT_MAX);
+		if (ret) {
+			dev_err(pas->dev,
+				"failed to set proxy PD %d state %u: %d\n",
+				i, INT_MAX, ret);
+			goto unroll_pd_votes;
+		}
 		ret = pm_runtime_get_sync(pds[i]);
 		if (ret < 0) {
 			pm_runtime_put_noidle(pds[i]);
-- 
2.55.0

