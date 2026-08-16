Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB7FF9C0
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Aug 2026 12:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786883827; cv=none; b=jwfRTjToKBDULsAU5W2QvU0ENupF0shnYh2qsJPVoWc3zrRhWJahG1sLlN9v2NNj1J3iD3Y4h8fwvwRMtpxJhwmj96chSSwHUZ4OPeXp/bAv4fUhStyWFrNZWZZp3SXr/XTnwnWDad15a+DcS4AE137Ho7leO5Lgq8xOzf4ELAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786883827; c=relaxed/simple;
	bh=1v/keRZaqkzcW4ftGeGFyG82kJauSKfHcxDLIVbqNiU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wl3jBhZaO0w+oDFpmaxJ7/aionm9VTdnN8cA1l8loDtFNh7ZsU14Ru80gkVxlzaUUQMufTXMf0FVeNaqwDGZmfIAELjyKgaNk/sbHHnaQf4ud9FucNZOIMDqRcoTA6e07WYs7L/s3ba7RV31/rSv3ofBbncH73zayKo10xIHaD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XPh8ws0W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P0/VojfK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XPh8ws0W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P0/VojfK"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67GAgg2M2838801
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Aug 2026 12:37:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=u3+0mYShXgV
	KPEXiTrpEtDfmgLeQVZax9kjcimnThUc=; b=XPh8ws0WBrSV+CfNs8bKdCs06Hi
	eRgdBO7nrOB6zTwMfoxFGLG5/8lZsKG0nuFjC6X44wQX+UPPoB0fMRa9dOehPqy3
	xz2vgHTouVz6a/Pr2WcWyvdnLbrgnH4u7xXzkMHj6DV+LCmtldZJPrjaUkDMGv9V
	uQ9DqUrTOo6Oi90V16c/jnmklXpYAeSpS0YVhSK1MqzCe8VNaiCAlvrqrkvwRrhh
	O0BVDvyh//NJHLxWfefge1oWtpHNh6ggajhvAhxU5zmmMU2e/FszgP3P5JQl7OGP
	6pezs2sjplu/1KE2TfFAlDXsBr8XwiKnvRW0tPm3SJwxTE4+gThDPwucv0A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2ghfbea6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Aug 2026 12:37:04 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cca3673560so42613365ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Aug 2026 05:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786883824; x=1787488624; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u3+0mYShXgVKPEXiTrpEtDfmgLeQVZax9kjcimnThUc=;
        b=P0/VojfKFu7+QLRkWLSbetfyLHtSf8XWeXgQZ9DP4akIEBsJ+QMiGyPaCxxsZ1yXyH
         HSRZpRVfsxVlROCPpOBvMJgRiksF0+wsdQAXAFAkfR81h2T0tp8n6Bv85Q1/DvaXTSAH
         Bs+VsrOaFxjv+AiAgP5T43VQ+HVAYeAj1RPTESfKuFxzMYr+q6kGsiIdK156LDmSi2WP
         D5uBS9iRxAOETQSaTqSEZYqWy6bJD1XvpAZrEzAMT8X+jG1EZJo4YiL/WF1u2WKDI1zJ
         WCKKFTd+SuuV8FFhgtpxtVgJhlUxeUWCsKUNcvhrmKhE6FWo1KPu+v5cOCjtTGOWfKWr
         OezQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786883824; x=1787488624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u3+0mYShXgVKPEXiTrpEtDfmgLeQVZax9kjcimnThUc=;
        b=VlcEYiyK1R+SdNMJ4RkYNmJnN5Y23t0tSAAzuZxZ43EuzcO6kvV7RiXWiK9fy3CUgz
         ke6tGys+7P/jeSOhnB28nuhF4jefQOrRNto6BFu1MpzsQh7BBXCzX2XAsO9dWLWL8UQw
         L0w93npBPxeNqQvuz/YsxRw65EG7ViQ8tY2Ln5UFku9Wg+IWVxoVjfUydT5COKI5ng9o
         lxn+qZUHixynFKWuf1mIcV9VqXwXAp8UYgpm087yX+tfEBbkzComSBsPOWwqmMF7jXWF
         pWkEyR+xhgu+krNy5VoOMFPrUZL6LvHEAVV2qxsnW7jIBMQeDZJMkXyhfIqA6KqVYQ+D
         Oejw==
X-Forwarded-Encrypted: i=1; AHgh+RrDTkDXagxmOx8TI0afeIfkirK9UpkPmCWxQ2H9BGKGlhCIywVaW+SFnrcJbo0hr73H8o9P5aKR42/UmtfE@vger.kernel.org
X-Gm-Message-State: AOJu0YwqpmxLWCjV8UvVYC0gn3XNZdD+BLKGK1Naa4A4mCMChWwbYEwB
	e6E/LyCGqnJ3dyZzEJyzQG8B7eNyTWKGHMTxO8mpRsHLWSu40wtJ6Ml8TnZsLBicarILI6Er5LJ
	DgsaeF0u1vMkUecF0zoUH7pbOc+zQCNFuVNow4Z4cFzYy5tfVPZGjfDUtciqWnVnKoboc
X-Gm-Gg: AR+sD11BCXWR6M9wodqjKOesqU9jrOhhqtASxBsQITmNC4i49mDul1MbWSWwACsvN2Z
	V64SNUOmBlGtR+5tIAnU8B3dt4T/v0kda83C2PsAb+nu9Vk7yLnbN5YoInJblbcsFYPNXQrwL6m
	BARHFHVKkQT2RRN15DAhwjuzY/8AHzw/0BRo4HLzWHPrHYTSbmWyAd0jaUwZ2HafuhYPsmeS6Fs
	IqxE7Rbmrw1k37lPQJpeGwC3Vihl49qbVHj2Uhmpr0kzneyeaKRGmW9uT4yYVGDNF13olVQ3pTY
	l7UwQc8SYikAL9kpnOKefdilPeh48hZRXhDkq3/NVmikxJhVzOcP28eEpneu62FpbZVlFI1r8Ob
	X5ShOwHPR/Hx/2kGdfngB/dGyQOXMqjPn0uhTdGMeUjHdcq8qY1OO0TS1STLJ
X-Received: by 2002:a17:902:f64d:b0:2ca:619f:9733 with SMTP id d9443c01a7336-2d3b0c88987mr234163155ad.17.1786883823636;
        Sun, 16 Aug 2026 05:37:03 -0700 (PDT)
X-Received: by 2002:a17:902:f64d:b0:2ca:619f:9733 with SMTP id d9443c01a7336-2d3b0c88987mr234162745ad.17.1786883823238;
        Sun, 16 Aug 2026 05:37:03 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320e9df03f9sm26146956eec.19.2026.08.16.05.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 05:37:02 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 2/2] arm64: dts: qcom: lemans: Use hyphen in rpmhpd OPP node names
Date: Sun, 16 Aug 2026 20:36:48 +0800
Message-ID: <20260816123648.1632681-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260816123648.1632681-1-shengchao.guo@oss.qualcomm.com>
References: <20260816123648.1632681-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE2MDA5OSBTYWx0ZWRfXxWW2Z5O+5+EN
 DLtKy0qSy+XIV37Rw/SGrT/yQ0631T4eAzv+3T8i9WRwhXS6U7wkpfl/b9YUU/qIHUr4VKxw3Pv
 E1fSJiOMNPBd169KbW3cyzz76afTB6E=
X-Proofpoint-ORIG-GUID: mqPTQm19_dfyaw1laAqRpVHCxdyWETsj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE2MDA5OSBTYWx0ZWRfXyPSmMDM8y819
 hT0DZtByVyX7elkv9BRD8YgEOMxS0eH/jKKxXl1GbvlqW7hqqBjGOH4yHtRV0tdr+CoEw5uGF4K
 WlzSdDf8pXodX4v9i/ln4/OXqTf04aTIm61wDkNE1s0Iwy37j8let/pSxySFKPmTisc8+e6PEgV
 i+N3pLEo8Tcvtq+iTVhNM21+C7hYJqHHcT3iWcyH63RpJzM4bKpmgU8hZ5CojvvWh6dAWbGTN+E
 sKMvxnYJm+X1jl2OLmRtO7od+TsPkk4GYUtlcGBUwtmMl0PLj9JAjG8YcPgXK0wD4UFOPVeNohK
 uYhLUE9xVMbOXjgItYUFBOmMzoyhGzAFr7pKrxDiM8+4F6a6rfRjmMcWOemoBlDbnmHsSj0QyoI
 qjUTuOWr2B71vQgD/sQ8Y2gZpC0DHyF7pDxeUzdqxlrRiPTtnl8VIAK2OqK39al9qpmW3JMj9nR
 qQlwmjG4P9Nu5SJ74QA==
X-Proofpoint-GUID: mqPTQm19_dfyaw1laAqRpVHCxdyWETsj
X-Authority-Analysis: v=2.4 cv=I/dVgtgg c=1 sm=1 tr=0 ts=6a81aef0 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=jHMX-OgH2kBFWhD5V08A:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608160099

Two OPP nodes in the rpmhpd OPP table are named opp2 and opp3, while the
surrounding nodes in the same table use the opp-N form.  Rename them for
consistency.  Change should be safe, because node names are not
considered an ABI, and all references go through labels.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 695eae1b7256..fc55624f5043 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -7168,11 +7168,11 @@ rpmhpd_opp_min_svs: opp-1 {
 						opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
 					};
 
-					rpmhpd_opp_low_svs: opp2 {
+					rpmhpd_opp_low_svs: opp-2 {
 						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
 					};
 
-					rpmhpd_opp_svs: opp3 {
+					rpmhpd_opp_svs: opp-3 {
 						opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
 					};
 
-- 
2.43.0

