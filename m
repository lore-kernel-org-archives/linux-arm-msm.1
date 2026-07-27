Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935C23E0C4A
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 07:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785138398; cv=none; b=FVnvDDbTahmIvdn+WD2mGoHIzJCfUCIaH6nNgdrzJzFNbNuih4puiPVeJsECXdT9EHbmYGfw5kqAPXd9kh73jmEg5P04MvWT41zqCc2zBKIkHsR3kXS6cybBkpPL+OBHW5NCUP329jKWeHx/+Svcq1RVsyEwp5yalkhxQ8TR7FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785138398; c=relaxed/simple;
	bh=A+5TRK9EGz9fRh7GbcDS+rgwOlXWbnjXZFW1ALyzjTE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ponBnSa+IN5Us7kv8OqcW3FdezYr+gDoZwl7LYllWQaBbZKhUHrdQEM5cEDqNzk4KX0sb8y3dKxT1iquZ7NOwnvvy2M7e6/vkXFARX6TLV8UutMY7zh/DaxXvvjMTmEn8wRju2XFfE+sOuOY+HvaHN4UvTQTBurzEHiD5L+qdII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z40wigdI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ggzW1kXA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z40wigdI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ggzW1kXA"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R7Rad14161896
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 07:46:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=FKM8mzcDPeP
	brNMyncwZRP5amm3MqElucl2ZBJ9iPr8=; b=Z40wigdIT3sUyAvTSzE8owg18o0
	SayNxRNdUkeufjNfQY2L2PBPA2HKSbzokl/gjTl40VEfx4HIxfLXyZMT76fGYO5p
	a3Bqf/s+3tqqP84+ec1XLgDM7X/3AAnKTaOeTrNgQjNgKy0bbuO0XrSJVGh39Eud
	Gpl3X1XRdlkuqlLrvmoTixpYM66yYHlahu6MrUR55ngHe7S6J0D7RZV3S21hotjJ
	YnbXKUGJTNFZcNrhuEmPyhuyQUGe31oXOtVMFhJOVA2ffToi976XFTTC4LAUqVfM
	0Jm6Q0gcvmLzaH+IBwEtLDKkRN2jcCF1/pvp5kApr0zQpLgR2YvbiLtcwzA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fny9wgs5k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 07:46:36 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84877b362f6so4033398b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 00:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785138396; x=1785743196; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FKM8mzcDPePbrNMyncwZRP5amm3MqElucl2ZBJ9iPr8=;
        b=ggzW1kXAQcwacdZ9ZCpL46RUzM9UQJZheGsCEog2Tl+oRzpzp0Gs5Egs1eR874REDd
         Y80Y1AvjYu7Gju6slmQ64CgUdUhSJLJKuJC+iHDtiJ2B2yAwXUwsA7kzSOmIxNUezSI/
         QtO0+5PIfQvg39VvaCdV3q/2+kGJ4LqfC4FntRX8FAdZA3PxQ1A+tH8IyMde4vCAiD77
         kpkmHQ76Qudqf4Bgvjtp7xeqatlPNGopZlTPTzgk3P/wE3tw7duwRzQS7LmNTZNNbHOc
         U+b+dxy2SbbGhmRyiyWHCxNGzEcmNYEj2/HA90y5Ky0qsuFwZxC3A/lGkKYuLfnea7VD
         qrbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785138396; x=1785743196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FKM8mzcDPePbrNMyncwZRP5amm3MqElucl2ZBJ9iPr8=;
        b=joxnNatPpeyy3UXyRbgYrG0BiK2GV47ttUDDt+BVmHHrtKqIliaRTYfqka8z/kC2QN
         uXMh7m6oZ4ss5TSqw5q1J2+7XdBBDizrVebP+2yEJOzRu6PT5WTtMIAjb8UuaDjhwVT6
         QpnyC/gbvOlH+IchmT1Sok1RU0QGkhgrevqtEEN7tUQgOfnMhQq1j46l6D6KAtzvnvAI
         3tpI7d/wnuTBHrA2U0cTHs/LShW/vKVQLUEfAhqwvk/nIsZLksKlI75yvmtMmovdjVNA
         cJ2iZBiMWitu/ZduugvuTVGD0giSgCUmODn/bkMqXANUxgYoLCTUQizIiHejCTSC0sV/
         yyZQ==
X-Forwarded-Encrypted: i=1; AHgh+RpZZ5FCGcrfMWQoThfHCkAvkLQlNvntmZhAnLwER6YXwMBJWBR/BGKX+v/ABLeoPv1ciOuEY5VaiZxkYZCx@vger.kernel.org
X-Gm-Message-State: AOJu0YxGMQMw4mC7e7OgA8FqekPmDg7db3lpVkw6u8QU1z5YooHpLFGg
	qteBjrVfnQpjRx7wD0gYWD0g11zbzJDvawcVg6rStVhbg+HD3crjGZCgSWGWjZ99qDhnnrgPRLi
	A4BBBcsNBE9vv13zjMrTo5wjxJaa7acqezKYKupXqNF3XL51+hRsLDB74gvxA3bmdty4S
X-Gm-Gg: AR+sD11njKPfbMEY163xliN38QcdFyrzETvzYO9mnwROKd5Omzq/z7RSZfwhd/m96xD
	2Nh97jkmYs83ygBI5ZH7QauiPtJrsg2/DEzcWftJQa2i5Ft6kOUWVJvdygpVHvjk+hWFDRTxz/P
	FJD4D+GMGwp3n0sPkoJ2Jtk4oVEIHRsf51mMfBQ/iF7TagXMdbZone69sR3JOIQbDasCIkM7R/n
	saVqrPNkj6sqPRKhA7xe+NhqG/wuQ56G76sdcVFn4OPjLxQf0disEWNEvlnPlSh8nVK7m6yNmXo
	RVFWkSryPalbDgfja+IRJCBXxkjHKUYgVJxHJZYuCL+aFnD3c+VJs1kVfxNNUFd8FnqzU7GsOJO
	wRkTaL7BRWfDbndOeoIlPljxQUf1QRlINWbgKddiyqV6RWSH4ErR+rLrY6irB
X-Received: by 2002:a05:6a00:17a8:b0:846:8b21:6304 with SMTP id d2e1a72fcca58-84e593ff371mr5978615b3a.14.1785138396269;
        Mon, 27 Jul 2026 00:46:36 -0700 (PDT)
X-Received: by 2002:a05:6a00:17a8:b0:846:8b21:6304 with SMTP id d2e1a72fcca58-84e593ff371mr5978597b3a.14.1785138395810;
        Mon, 27 Jul 2026 00:46:35 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e5342471dsm2590150b3a.47.2026.07.27.00.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 00:46:35 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/3] dt-bindings: soc: qcom,aoss-qmp: Document Nord AOSS side channel
Date: Mon, 27 Jul 2026 15:46:19 +0800
Message-ID: <20260727074621.561661-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260727074621.561661-1-shengchao.guo@oss.qualcomm.com>
References: <20260727074621.561661-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA3NSBTYWx0ZWRfX1tv4M0r48A1i
 T1nmMC2qU7dNncLb9LTQEDq4J9aMilrlmDx6y7OuaaONqBaBJpnFm5TuPMpjAKBr03iiwnYAh0l
 pgraiPWjCefJTDmkQtub7lqXd0tRq14OrNfjL7ugP1p2PPFS78j+nKhygLP+uzOO/SNuj1/oS7u
 tViDUjjJ+pzT4ewPtz6jlPh8ufYH6imk9IcXd9odfqHIAEbvthet8AXQHtcqUSRWtvID1CQ9Slg
 61LeASl4j8N7BNQ8a309ZXni2XC27mfj36CD5dLRzFR584M+s/iNR8BR7PkL1x3ITBiiqL/F1cr
 Hc3LSMteEXupzOfWkbAGjxZwmeRddnv6FDnHM4p2Y+zQOUG9dgS4c6N+t3ULdmPYHVwj6mbMcKj
 A0/y0oLcQMyk8hwFHIrvTP4/Iz0u0d3lGa7O1Hjtfxqb6/0pRPqakRWD9MlqcEgF23cSKtBfSw4
 1R4IFv3uHkU7NxL4buA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA3NSBTYWx0ZWRfX6rc+tEf5XPYS
 qruiHB10x5cDeK+xF5iSXkjd+oUNyX5DiV3n9I4i2f5gBcKUyQzfCj9XOSFTc09Wd5m3mfwH+ru
 85mfZhNpJcsl+qUbbdDlN+08EO/EH4o=
X-Proofpoint-ORIG-GUID: y4GEreRqCOx2S4lAylGK1xf7PrXMcjYg
X-Authority-Analysis: v=2.4 cv=E4b9Y6dl c=1 sm=1 tr=0 ts=6a670cdc cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=ubaIkse6WMRjXItqsd4A:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: y4GEreRqCOx2S4lAylGK1xf7PrXMcjYg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_02,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270075

Document Always-on Subsystem side channel on Qualcomm Nord SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
index 9f9d9bcb66c4..d2ae2ae87a95 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
@@ -31,6 +31,7 @@ properties:
           - qcom,kaanapali-aoss-qmp
           - qcom,maili-aoss-qmp
           - qcom,milos-aoss-qmp
+          - qcom,nord-aoss-qmp
           - qcom,qcs615-aoss-qmp
           - qcom,qcs8300-aoss-qmp
           - qcom,qdu1000-aoss-qmp
-- 
2.43.0

