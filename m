Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C694137AE
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 11:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787572525; cv=none; b=FFzPREkfbSFdymLT9z5K0QawurQ0q1GTks8bj4SD6xeSHzV1SaXD6kdZpEPaG9hIHcAbOzRcT/CwCvCO7U/GxihGEOiRmPNyapdX6YapMFtrZ57zPVBR2szLQLGmvt5+W+Hs8qC+Z+qFrJSfzQ4j5iHmkrhWFT7zJRWu0y1u3MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787572525; c=relaxed/simple;
	bh=sXwTkxDNsrjYc3YUNdYCEcpknwYEPLb7oSVj9VLIH/s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OED82MV+4EGMtxLIP4eggA+0TAywj6wAsBXj8gc52w+xlIpnhSNuXXvo52MHGz4Oy0cn+L6w3L08kpHCywG5aba5kJMSf3AyXbPX4NadJhGEAeAH58aUYlgGBpBNwQAS50+8nFkbPEQfv8JqXK0wQ53eSFymk5TVuQ+tHFVPlyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UXjPQD9d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XN4xDBgL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UXjPQD9d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XN4xDBgL"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMeQQ3195004
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 11:55:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eb9AG8NLGUD0/K09IwQY7+LrrefzUKzqTwmTKJvCiIk=; b=UXjPQD9dN8ncwMIh
	i7vWtp/8Ai1Z2N5DJwkI5kmvUsukgWKTydoXOQTJoUh8GyemvDlQZ+Fq/F/A0cla
	PP5B88QTWvceVsXqOGRfO+mVISdyYZgi93PdMH/ZbX/gH6DYunMu17SNRqEC8ojN
	Jwby2KW09lLzJ5zIAEGmEuR+JM063mArGvlDa3Yk+qNRqbBYlV4zdPfe5vwpPQ0c
	vrLZ3ikU/LB2oFq7kbnLkZwU1ro7YrKC2E4rEmkrqbulDm9q1WZqGqDWU/DBwcvh
	68Ss+y3onAIBG68tJyOflv0jSk/sySlktKJx0Hq35rzBZBrDNigFrWhOkSaa7WK1
	gt3e8Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8hjgs2v0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 11:55:22 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52ce64c41efso68815681cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 04:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787572522; x=1788177322; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eb9AG8NLGUD0/K09IwQY7+LrrefzUKzqTwmTKJvCiIk=;
        b=XN4xDBgLwVySXO+bpLkYvNaLO706G9dYiEipJwOcqROV6IVcrwlRfRam9yq4zO6ZiC
         7CjKy2zehwmcIgV9gxa+GpaD1Ffe5GrFh0uEvKAtuKR8siclLg0NUDNIT6TAnPF8O+lu
         +XsZyPblujfVnDQTbbLRzRH2XUadGRkFS9RMEgocYPch9HOypnXXQIXElqhnUaevrQzQ
         x2wT7yR09IhyXgthc8LHnw3rsJdgQ+QsmfvgxATM6zWsAlIANuNwATBIU5cmt2dJVudt
         VgDFn247+3xbfdyaVpZ+J9VJadG/3peTAfTV1/Se52cIqfHTaJTG4eOelArGg3VdG3tm
         14FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787572522; x=1788177322;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eb9AG8NLGUD0/K09IwQY7+LrrefzUKzqTwmTKJvCiIk=;
        b=Ek38D7M5HkdmZ9WJoM7c0MBy9jlH6XWuVD0jzZYE/jQoA4ANrKsaDOTddqCkhsS8gm
         PQhxxzf2jDWjXOS6bR3fb1X/bgeNACp5b1jhImg2pgU85/iIYAamh/dbBjPWSnd7dQsT
         Wm2w5KSFglFIF9qKAyf3kSZiFxyJA/2xI7U+E4BV++D+b1dIMGAXI04vM05BR8Yru6LC
         jnUUevz7ppC/Jh8wTrCNxs1v+pvulBqfw3NEWbU1Xx2LiEqBGmmyAU/7bJJL1D3Dy02p
         rv+Xr4PmQKkmHkrV/JTHAFvz7WaK02Kl2DS/hzChilwTKnTtweSwRCueKDUq6JBPasfM
         6rSg==
X-Gm-Message-State: AFuF++k1lu8NLfWDmPpc4Gx85JuEoDOI68FRb6kWs5PUbTVRLC9T35Gy
	OvxDPvguIkYDu27FZDfi1zvokZf4EbLquDPE3/gA6679lpqpF32ExinMbfYWMlDwIuiV9P2HVNP
	EwNKalL3NxnYTM6k+HWnHVbT8ouTNCw4ob5xeafgkwvt3lWFtRcACeerRjjQXlcmc2wfy
X-Gm-Gg: AR+sD132Uf7KtIO45KkI+Kk05iJ1v0Ryab2s7lpZG4/+FUdlrSmtT3jIyZbum3OSREk
	EE9I0ZAqD7jcceaG2kJs1N4jAMuDglb5JX7dPci+1NIqKJt7p4bixQCEHQD0ujjs44TRZFXFJxL
	jESW3YxnXTGHleFRpdnkC6k+w8CnAbH9rI3wzspGVk8wPSXYi8vnVLK8wTGv87Hh+A6DOAq0y4d
	gT7UrDi1PisSy4xdiIbI52gW0fidOADTdPAKgDxgBzGSqEAFU/duqevS85huc1WsKSlSRwQ86Du
	qBa1iBPGNDMkBe8IL4Hc7pOOAznXbqVY4g2c2s8iMoR/9BRYjmlDgZDlxYBt0Qo0xIiLRL/0vnu
	l7Flosyc0
X-Received: by 2002:a05:622a:48c:b0:52d:6de2:906c with SMTP id d75a77b69052e-52e09bd76b6mr171413991cf.14.1787572521731;
        Mon, 24 Aug 2026 04:55:21 -0700 (PDT)
X-Received: by 2002:a05:622a:48c:b0:52d:6de2:906c with SMTP id d75a77b69052e-52e09bd76b6mr171413451cf.14.1787572521237;
        Mon, 24 Aug 2026 04:55:21 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629563dsm1259990366b.17.2026.08.24.04.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:55:20 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:53:59 +0300
Subject: [PATCH v3 12/47] clk: qcom: gcc-qcs615: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-qcom-tie-cx-to-gcc-v3-12-f1205a92682b@oss.qualcomm.com>
References: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
In-Reply-To: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=794;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=sXwTkxDNsrjYc3YUNdYCEcpknwYEPLb7oSVj9VLIH/s=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqjDDhJhYCWO5CziHTTFNnVIGcJZ5qqsW2uXo2P
 KxD03z2unWJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoww4QAKCRAbX0TJAJUV
 VriED/9OYMQXxyf190SflJI+C3U4t9f3CvfOndlMetaQo0KhFG4WEf0exBpa7UMba7mQnM4M2FW
 VV0fQj1mBb/OWxQVKRG2kQIR1sxqFP0oW2ARXEVCvB9IyR5+bF9T5fHC0QksGdZrb+MGDCi/jvq
 wvcJTKnVIYgacO1AzW7a1eDRmhli06cuQwQO3yz4sQq6IHX7+iAm7Xu8tObTk7r+FDgJdua7yAE
 y4/aXz19T2Jat3i6x4M/qOjkZiDzuDopnh6o/SVnvFEfuA2mllgI8/XHHdxfXSdlLFtmToIy174
 Zmu/J0euKMh0GTuotmWBOrTHWI9rphJFb+kjHbsO4tl5vBVHAulyDWW3iyCLXqfX3uml5ANVwTf
 HYKL/ykIo+1FWlOdZfoJolSxLTB8n9pgSz4A+q71zRd3SNmC/8jQccDgwXpw7tdwKyMuol82Vx8
 EFzbKe9m6JZRGRJTzmm+rfYUg5C3LsVQ8h4jsh2mpOuU2BLVVayh/U+s/vVp/MOipV++4hOYwGH
 taDtUNktqevs3x9AXzcpOPlp+fovYcDh6mg0BrEDp0DYl3o63DuWXPFNbZGYMMHNsWriBwvupc5
 huzNMESA1SbQBKF+9oZoqhvxLdD02tN6tXk3MtJyg55GIHhu+/mmbMYwTnfvDHhGzDc/PQjSPpT
 DcLWri/nhWsBvhw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfXz9vZClB2e+LC
 d/5imUQ+t8WwipcmoBV9MyWlbDfIUW3qY3UPLLs7rX5tFnLsZ6DzZxEkRE4O+wus+aIysCoaui7
 sKdX2Vdrn/N65c1GrVX6RwXSzF+X1rM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX2QdXQkX+lcom
 cS7qc9MM2YoPv7C/LlpVc5HOEBaN3ZzbYilcXxlckkYdEFvO+eVUuyk4jVu5ofl6GruZ2whBon+
 Q90bF0QNpZfyLDtGD3MkU0230U6WaJFfQb7gKurclMfjjvaNxnmKgyplrqBijTf9IwswYeGmool
 YImD8KEZaIOhAg6GBQvh3y4NZKpNajzABZtnM8EClXsKkfwrz7pczjhVk0Ab9aC5XV3B6fzy3gY
 ZgENj2C1cwWdve2qcOdLkfPyt78TFWO0EpOje0si8dLV7RIRU050RXDw27IkIO+cbs0H2VH5ej4
 8xmwzL9NAiyC6OW8gp1EcuEvygpzkNxkdEp8d7o2fgjIqzCCs836s5emlotTmK4uUXvX+t6UO2N
 5cYNyXPEhJMrgOORFh+BpfPrLJUrmmiG5qUA8e7T/b+Zv29ovo0xk9idqx8vdgNi7mR2AELP8jR
 oz8rBuRwb6/zwOScOmA==
X-Proofpoint-ORIG-GUID: f893YkyvK9pXHQXp4CvbVdkDYEQw_xPT
X-Authority-Analysis: v=2.4 cv=CoCPtH4D c=1 sm=1 tr=0 ts=6a8c312a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=ESHVkgNwe3RMy11JppAA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: f893YkyvK9pXHQXp4CvbVdkDYEQw_xPT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240099

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-qcs615.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-qcs615.c b/drivers/clk/qcom/gcc-qcs615.c
index 57f8c80c6f32..601c81c84450 100644
--- a/drivers/clk/qcom/gcc-qcs615.c
+++ b/drivers/clk/qcom/gcc-qcs615.c
@@ -2967,6 +2967,7 @@ static const struct qcom_cc_desc gcc_qcs615_desc = {
 	.resets = gcc_qcs615_resets,
 	.num_resets = ARRAY_SIZE(gcc_qcs615_resets),
 	.gdscs = gcc_qcs615_gdscs,
+	.use_rpm = true,
 	.num_gdscs = ARRAY_SIZE(gcc_qcs615_gdscs),
 };
 

-- 
2.54.0

