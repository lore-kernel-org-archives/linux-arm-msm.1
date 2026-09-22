Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E414F5326AA
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 23:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790118396; cv=none; b=rXgNnBHrdleS3Av7gw+QyUmdG23EUzxuaE2Wn7hrYske6oM4QlkGoQv7OFLGQEXtj5fZ+LvsZw3fysVokTofm95H8aYmBytoD/Pb3fQ9n55uq2hlkULJzbMrsJbvXOR0eo0cnJX8e2gjP/bBQ4zub/DfgOnZcNkm8XxXyREoI3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790118396; c=relaxed/simple;
	bh=xHwgCpYLu0si4Pfes3zqvjcu+Ip84iYvwtsZMW4bY3I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J9biwNeGA+jq3KsaAfpNAKYbe6G3cD5LaAiAncfew7yB+RIj8y5hILbywj65/Sy4GnOeFphWFrBsZ2X60VZIbAiSa+zhcGM17UfVPfplAHaCvgnhWTFaBLhX//t4YBUdlw7XDTCv15vIrHA9fJoCgo5sT4+14mTV0siV6P1DzEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P/z//zjE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ea7c2PNW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P/z//zjE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ea7c2PNW"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI7QMM900419
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 23:06:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vjll4+6S3K7UaA5Jfvs9SMPlp+iGGexPGe5YOA6lo2M=; b=P/z//zjENHGpZJfu
	4HWAIomuYvEbYpl9VuWVfsy3PIpAPZ+Q28VfAbPjeTkljfHIC1I0vogDQWxANei2
	u70KF8/3sOvr6DkcxyWRZf4E+dtUCf/JK1JKUE35jMh7GwHX7T2JZJNufr7rHiEp
	GIdypWwj0YyLmOBz26y3/G2eOVJ2Cz+/DJeoC6Ej6BCPqqsV5aZJ++4j4f5iBSix
	ohwCoYX5r/4bFljov1A1JiMbY0A2K0QSq2MKBinSpsnAO9RwxfdHBbNXD/VJkUjt
	gG88OoWg68yB1lFoyUjdsiNGcjj6HQQKLAEP78na/JbVIdTSpNLUlhxO6GhJfqrV
	bO1Z4g==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gunjyv749-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 23:06:33 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-32b8c2b30c4so412118eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 16:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790118391; x=1790723191; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vjll4+6S3K7UaA5Jfvs9SMPlp+iGGexPGe5YOA6lo2M=;
        b=ea7c2PNWEscWFMLfcwBQlHuv6h+HLRvp1ZnDanzyAZYq3C8HfXE2gYCEnTa5K7yzFW
         fXRufmgwMipW87UOeiHH8Xt8aU5rzT9x7uNEdoOgFS2g++R6/UdAhQxfX68ORTCSer+7
         OrcKR5RJSJanteZwuGN8LpxnKbPNZqzQZRv+V6dVYkzbOFBFQZY91yTvOq5MJFrujvT6
         k4FcG6zGz8sSwXsDwrEfPjKucI9Mf224vS0hkFWbZiK5ENLmvyIr0Bv4bXXfUBCpRCyY
         KVKr8QC5P33PI8oGpfJIfBYl0jHz58ijpZb/5kKDFrjYvFq06CSeo4lMFM9MbBF/c2Hp
         Fyww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790118391; x=1790723191;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vjll4+6S3K7UaA5Jfvs9SMPlp+iGGexPGe5YOA6lo2M=;
        b=evkCDRlVibuz9zQoVs1E7E7PcrRTw1+nc6MORTc5UFWRud+p8twgVdzmzKY2Sz7RHb
         P+PEvsyhXQ+rWwuX2aduAHmPOPcAOT0OebhYBzSEZdq+eDMbKOhbF/tRW7FouVr1brvz
         7tUi8S2w9qOkDnFzyyZ6dEaxW7O/bKpyzCnu+PewZLJSxSVxsqwIYZD/j2v7JpkfUuAS
         7i0jcfAzpnLVuo1XW1icRNqaJG8q+wUsMPo7BQOaJWjpHsfIRwSDM2PTWc7cmtRX8hH8
         Cz9QJ1ngTt+gz7IR6PJ1b66CIS+UBcn+TmqoFdGnfzc9VOWt5Ob1OrKAvQ48EdDrgxnn
         5Bow==
X-Forwarded-Encrypted: i=1; AKwUvBxuAZmlR12WjkYrkO8yXeITuvlT6HVSUdVEG6AI3PuvNUkLI5i/A6rxfzc1f5JKsqYtOj/SMojkSsmFNraC@vger.kernel.org
X-Gm-Message-State: AFuF++mu3TNklhsBnre3k3bBJOYhAa1GxRBgdqS+FqtYUmncsmjAgyhn
	pZiKAWoga6KFud/EvpILmTBQqEqdpKEdmc+F26ryQHIbeIVvhgUmZdVnh69xZ0UE4N5vAhMtmrE
	wPxosJCNsNHLqb654lI/ZmgaFjUHfr7BSORz5EP3wXpTUMY+5OSkyVwphFvkQqpv9SZvf
X-Gm-Gg: AYBFou1fJo/9aw8SiCHnT+FYC5OPCTCRCMUv8wVsDlExT/ATXzRaD3uG0Do9DmhSi5l
	yIopuCyOdmrbbHgR4ipZKnhjoyNblg5qS5n7eHPUKAWipyJ2X1CAyEjelbhMi0BeO4U/olSXWZ5
	kRqaFOxXQq1KJtxCnK8t2CptFvzgDhkP8gwJmRqot8Ok7LWpg203Vd+d+DnmFV+LGuUO1HR5Ok7
	UFKwfc5n+5kssHAGLe2dJdi0KhLtNjzhvNDgUg5QPtOOMBib9HuFsocmCdR1vI4muuzFk24JM3V
	7emyH4bKZyFvMVJnrkGxTKJyxyVMWSh+tGrQaArHyfgfHgBZYhdL/dKjj18j23RdfvQKrdaWUpt
	hPwkzYHP3J/plbwnYIyXQxrwG/AxjDiNlQky4hwybVmw7u2bR+g==
X-Received: by 2002:a05:7022:1582:b0:144:dfc1:9aa with SMTP id a92af1059eb24-144f91372a3mr1164192c88.10.1790118391046;
        Tue, 22 Sep 2026 16:06:31 -0700 (PDT)
X-Received: by 2002:a05:7022:1582:b0:144:dfc1:9aa with SMTP id a92af1059eb24-144f91372a3mr1164160c88.10.1790118390509;
        Tue, 22 Sep 2026 16:06:30 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f983c5a1sm1737515c88.7.2026.09.22.16.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 16:06:29 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 16:06:20 -0700
Subject: [PATCH 2/2] soc: qcom: socinfo: Add SM8950 SoC ID
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-maili-socinfo-v1-2-a82bd7d4ca77@oss.qualcomm.com>
References: <20260922-maili-socinfo-v1-0-a82bd7d4ca77@oss.qualcomm.com>
In-Reply-To: <20260922-maili-socinfo-v1-0-a82bd7d4ca77@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790118387; l=676;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=xHwgCpYLu0si4Pfes3zqvjcu+Ip84iYvwtsZMW4bY3I=;
 b=D4uXkpGQkgOT5eWB5mIWevK+4RcKk7vmgeixxpTyUIo0QQZhveu2Gubmq2+OnOvyV3TVdQWNi
 /7jHPaX6wegA3/7i1qxcnwZrTOI0Jcj4RJcmYk3fXud2h2sHKHY7JcQ
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: kwTLiyCHDtAKoOdBenqZVietT8lluP3t
X-Authority-Analysis: v=2.4 cv=KqHYSmWN c=1 sm=1 tr=0 ts=6ab309f9 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=fbO9nyDmYvn0aybkFicA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDMwNCBTYWx0ZWRfX24ElJ1RMJBQ/
 ZZ4tAC5Rg4rgTnnr4YM0iA2IhM/6Rbs1s3jESxsLfQ8FN0V/hcR1Op3kjHUtwfFXVCd3Pvv2qSB
 qVrkO96XSDzHrRvuv9KgV6eK6ygUOomP6WyRx37khVILJX2OamI5s88cwzu/LkA73d6MueYNFju
 8fdeBXQkGa/crWKM/EQB27+BxH08sOzFbuKZUB2XcYf8dq6WiJ4Sd8Qt0QhiDW+xLxUeg1Tz0sq
 LJ3tjgPt+9pePif03swNaRTwGgRNgvor10t7z/tq0K/1wBw0tKZ0kTN01DSdLcf3rdFVAk2nRjH
 8so6kYb0MZkoRCvxyXTimLGq/7QnMNzdYF4725GhdyrjKFZI1NIfCmLp4VQI7HKfqCWrY23x8Ps
 Ekeq5cR7AnUf/2UYa+ngKUv/xsePS//GmYMFtCYNW+L094M3lV6kHxMt3sKeJBjcAPYvWQZEOtv
 lY2C+cyk7dUcsY17Qfw==
X-Proofpoint-ORIG-GUID: kwTLiyCHDtAKoOdBenqZVietT8lluP3t
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDMwNCBTYWx0ZWRfX9YvOiuuKT0Fd
 FDFdhxCgXqL5cbFBmJiWTKnHi4N1VD5yBYOYWQ2nWA+tqx3lIzBDkExnJnT12V4BMOQ6GhjwTxj
 ZMo8elrDOdSZ6NHVqWjxtpmWyrLAb2A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220304

Add SoC ID for Qualcomm SM8950 which represents the Maili platform.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 drivers/soc/qcom/socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 63ee5cd561a2..2b4282863e72 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -544,6 +544,7 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(SA8797P) },
 	{ qcom_board_id(CQ7790M) },
 	{ qcom_board_id(CQ7790S) },
+	{ qcom_board_id(SM8950) },
 	{ qcom_board_id(CQ2390M) },
 	{ qcom_board_id(CQ2390S) },
 	{ qcom_board_id(IQ2390S) },

-- 
2.34.1

