Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB174BC007
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Aug 2026 19:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785873506; cv=none; b=rSd9hDQpooxm/AwbHE6jThOuik5fqtdk+FGgG5eBrQOL/veF5dJkSYl6hjw5wpHFzh5Lf7DkAi9Fml/p7Z0AsYOmzdflMqL0ROjZA4grSjhBRUPT9ounyLcfJ/1gSAJdZj+Gafs1jLq+/8Kx41bzFGvR1QQDloNIn81EGki0+2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785873506; c=relaxed/simple;
	bh=d6d0/DeGE3Zxr1kZjE+gOHD96ASmEQ3t8wnWQwXjT/c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P/gzld7su7k2r5R534MzqlnDxi0VvZwiSNuEwcqpOoDF74wsfp1cQLpYJfNtanaIMkBbfv7/F1uQOgEZq87VIPVV44eOCKG9jzn1tJoXZ3wG3024hBUZaLI3GYV3Cdq2ZIkVvcRH7gPZyrLethc2pSUPzO6ZWAPsR0dF97sA+no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i83+yZKY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JPssm2RQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i83+yZKY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JPssm2RQ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674JlqIC642082
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Aug 2026 19:58:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ph0ufNEa96Zz2A1aJhFqvsPdf+v7nzrhZzRMqE9cg4Y=; b=i83+yZKYwRtsQhH0
	QjNbFAVQXm9MSznLIyGZAjKTV08ZKsOgMZdV4VaXOh5Di+Ha8DTIgQ859+l620IA
	kDa9pR5BZU8Vyr5LM8kSZhBUK9p2ItpQI4OGXgVPSrO0RrSR5lNFtCtbBcAGRE4s
	gyHxYI2kfKFDApJZFx3RDZSVmPTzmYQ4z7sXBOh3LhAQlZOpQWwxeZ8CUhhYF67+
	isITaPHdpbWtR1+ESuqNM0Oc4GB9KrlplSvm9gXlVXw8MYpbkR9xHH6TPR8M4TCu
	LU9lZ7dKVNns0ghRcva0hZTJY8ayXOD2/FojToTPOGOOfSWqcR+Ur2QMSOcpv2td
	ewqxdA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fum3nrsxf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Aug 2026 19:58:23 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb7d6ba548eso159717a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Aug 2026 12:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785873503; x=1786478303; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ph0ufNEa96Zz2A1aJhFqvsPdf+v7nzrhZzRMqE9cg4Y=;
        b=JPssm2RQkv7N/h1FoX539m74lKjp8IqS4geur5guQdaUxeRgeAmY1L+kE1lIIRTrI8
         lR2nAV6o5SDc7Me6Cm74XVRh0kOY4RxelGCGFZHJwDTWtw5US5QalbhdMCBhGRuduX0w
         Bvxb81GVJNvDT8w0WXi+lgjz2daYDhGN0PhErDjVmx0bJe98Hv/+z9pL2qV4hnLn2cmY
         8JoUzGi2u/RmKvlYXav/3LuuHdzQ6gT713436yaSxCYsEP9LxRPjZn8GQIiXIfrHs7ZP
         l/U9/8rUWeT5vyRaGo5kOleoDx7ZOh8XDA66kIhAoI0N8qEJpO2j9j73vzwwL5BD09lH
         Juyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785873503; x=1786478303;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ph0ufNEa96Zz2A1aJhFqvsPdf+v7nzrhZzRMqE9cg4Y=;
        b=sWWZobP/P1cgJoBq0Qa2qXrLshaKipzrlNem+Eqcc5p3KSaHYlAWwS7klMbV6XeNPc
         QoWcSWpOQdt1oVKeuJdt3Stt99CGk/8gt+HRIpRMulT9W/9bkpQoHEO1pmZPrnHWfsBK
         EYZi5zf7fe7kUZbpjmIbbeSHyi3p0y0aWYRGl3ZogLW3CM3kSsDmAITSg/r3u68/w5SC
         /tyOk+SKRbTtJJwzdKui4k+ve+ADYeuVbgANQxbyWmQJty9egwso8ixeS30mQhI3F3FK
         v+VLy4/U59D/erPGwrNfeh4UcBf8PQgzjXtn9fn1XmMiXneA0RqjLTXltEc7bpZmFRKX
         wffQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq1qS1ndEG9n5pVQ+X3gNorpLW6q/+uVUxguG01kLdf0QA+JNo+dgrELjEcqRyDfD8xn9z417OBV+RFWBLC@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+Yu9n0ccRZrdkrG0biuPmt3roZHghIlu1QipFDHTIdIdyhZmR
	hJwfWGcaVD0Hz7bFx+qR0+ydlDt/SRTH8PSwaMOk5aC835OSH6Nc+eQ6IazEDq6cFgMPw95HPI4
	oBVO9VtEg+UZD2z0TqufQtVlD1xXLbeO4FFAtEgosnNCMjyAoyj578c2foTrLgfrcrZRk
X-Gm-Gg: AR+sD13jltFbTFZGMOGqljyq9V/o7yioakbvc/+FuhsA3dkoznv9c79pJWHwPoVZ1yP
	etxYBCKHqQovoGxmxIchM6HzdJK+xkxawBgH3RpZU+/m9gWkxs0RvVg8oiIcrs41alCXHRGLRJ/
	NfJgSm1TmQfZPD2H23Qv2QXr+NOkvS4KrPEYg5fSprJhkZqMkt3wYVdymPYpkqxKicUjbGfY0DD
	yVmg7VOelweBIbY7DRi2Uf8TiQYt56kJCIM8B3E6wd4q7we+aa+DebGhceGz4ce26Veh9Zm1bfB
	V6xl+jLHDg2ZVdLn+edAmSAZBpDkJLcETKWxXivwdYiziOPS6u23pGATN6tkW7dA7VEvWZh4OrG
	T8eSudh/guEFQZ2Hs12kW4keTsw51AYr7bA==
X-Received: by 2002:a05:6a21:600f:b0:3b4:5c70:ca3e with SMTP id adf61e73a8af0-3cb85ea36femr1324162637.25.1785873502883;
        Tue, 04 Aug 2026 12:58:22 -0700 (PDT)
X-Received: by 2002:a05:6a21:600f:b0:3b4:5c70:ca3e with SMTP id adf61e73a8af0-3cb85ea36femr1324103637.25.1785873502336;
        Tue, 04 Aug 2026 12:58:22 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315867a68fdsm12316636eec.25.2026.08.04.12.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 12:58:22 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Wed, 05 Aug 2026 01:27:41 +0530
Subject: [PATCH 3/7] soc: qcom: geni-se: Add helper to set SE clock rate
 via OPP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-3-61171ab1cdce@oss.qualcomm.com>
References: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-0-61171ab1cdce@oss.qualcomm.com>
In-Reply-To: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-0-61171ab1cdce@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785873474; l=2843;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=d6d0/DeGE3Zxr1kZjE+gOHD96ASmEQ3t8wnWQwXjT/c=;
 b=RNrRH08KNhEECkTRpUjvpqBA4QDpuU4MFOR6NphuoK9WIbOI536zxIc00Xcl0m1Hi+lonCG0I
 v4CxIsNyDFKDd/zjHIjDqf9hTbWXzLaUKKnFt4oaNgaCk3pvXrRwR0q
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDE2MSBTYWx0ZWRfX2IjylGoSyzYY
 P92ID6sSLP3dgh6IbztEWqnLj0YR7vAxYWTRPtEgF1tuXM/AiDe9KW+7HrXf4DoBxApdbn0XEtI
 eQiOK705hZmBLDLbDAextEJDiPymECiZJCS7aEhs1vdqXTkaV192F5mk9Yl1+ZbF2mjdno7VP7z
 solkYT8agAo+6SQS5X03UCNn2DwlWImM49P1JDPiv751YvRbfBlJRLrcb796UvLwNcHYwAbPksb
 cZkBhzZ/trCW/K0OG3yxI7erdRI5uqwqj8Iz2pbQO6SGDxYiqaHXDgJIqqhuJsorb9XjANx+M0g
 5eNr6AoHLJeKF6PX099mECRkHAlkju8BfvoiGg03ZLJRRD/JOVf9f46K5AyfnjIFVYllnzm9r9f
 +A2zQOdoRriT9prXrPKgDY7a1g9dvHvMhluWHNBYpm7ET/BjDkV123AmWVoU18xZhA65NNrcNTK
 NYMIjg+XbTyPZDv0Kkg==
X-Authority-Analysis: v=2.4 cv=AZqB2XXG c=1 sm=1 tr=0 ts=6a72445f cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=590DCAjQX6RtSPayVpcA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: fLcF5mynQ7BctZMvEOFfFd7tkYQdcgZ9
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDE2MSBTYWx0ZWRfX1N1Rf0UZTaMn
 JYOlbeeUbpMJJoHNFzDvcc1L1DP209P8trVoxziuzd65tUMgmIY5L0261Vz71/dqpsEyiGHxpxf
 GvYugqKnuxA6jnTjt2uh6mNaXlzIeVk=
X-Proofpoint-GUID: fLcF5mynQ7BctZMvEOFfFd7tkYQdcgZ9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_05,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040161

GENI protocol drivers need a common way to scale the SE source clock
through the OPP framework. However, the device that owns the OPP table
differs depending on how the SE resources are managed. For Linux clock
managed platforms, the OPP table is associated with the SE device,
whereas on firmware-managed platforms it is associated with the
performance power-domain device. This requires protocol drivers to be
aware of the underlying resource management model when requesting
frequency changes.

Introduce geni_se_set_rate(), a common helper that abstracts this
difference and applies the requested frequency through the appropriate
device. The helper automatically selects the performance-domain device
when power domains are attached and falls back to the SE device
otherwise.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom-geni-se.c  | 22 ++++++++++++++++++++++
 include/linux/soc/qcom/geni-se.h |  2 ++
 2 files changed, 24 insertions(+)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index a88bd092b87e..12d7cbc84d60 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -1149,6 +1149,28 @@ int geni_se_set_perf_opp(struct geni_se *se, unsigned long clk_freq)
 }
 EXPORT_SYMBOL_GPL(geni_se_set_perf_opp);
 
+/**
+ * geni_se_set_rate() - Set the SE source clock rate via the OPP framework.
+ * @se: Pointer to the struct geni_se instance.
+ * @freq: The source clock frequency to set.
+ *
+ * Applies the given frequency through dev_pm_opp_set_rate(), targeting the
+ * perf domain device when the SE has power domains attached (firmware
+ * managed path), or se->dev otherwise (Linux clock managed path).
+ *
+ * Return: 0 on success, or a negative error code on failure.
+ */
+int geni_se_set_rate(struct geni_se *se, unsigned long freq)
+{
+	struct device *perf_dev = se->dev;
+
+	if (se->pd_list && se->pd_list->pd_devs[DOMAIN_IDX_PERF])
+		perf_dev = se->pd_list->pd_devs[DOMAIN_IDX_PERF];
+
+	return se->has_opp ? dev_pm_opp_set_rate(perf_dev, freq) : 0;
+}
+EXPORT_SYMBOL_GPL(geni_se_set_rate);
+
 /**
  * geni_se_domain_attach() - Attach power domains to a GENI SE device.
  * @se: Pointer to the geni_se structure representing the GENI SE device.
diff --git a/include/linux/soc/qcom/geni-se.h b/include/linux/soc/qcom/geni-se.h
index 29a53bbc0dd4..3b411cba9339 100644
--- a/include/linux/soc/qcom/geni-se.h
+++ b/include/linux/soc/qcom/geni-se.h
@@ -596,5 +596,7 @@ int geni_se_domain_attach(struct geni_se *se);
 int geni_se_set_perf_level(struct geni_se *se, unsigned long level);
 
 int geni_se_set_perf_opp(struct geni_se *se, unsigned long clk_freq);
+
+int geni_se_set_rate(struct geni_se *se, unsigned long freq);
 #endif
 #endif

-- 
2.34.1

