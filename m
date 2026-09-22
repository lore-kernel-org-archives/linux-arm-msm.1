Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E65454CF5F
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 22:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790115128; cv=none; b=k+/US09X/oac/qSp1Nqat6Kto4DfNwvKCmMhfWgnyCm5ndKeTLBsAQ5uM6P5jXqyt4NIXjDcaX5pBlwaiqmJ334GvKqrRA164WY/kouM0tvf9ChOqgWpaNqO/CasL0FGmhent8KYHajh41GVCPwMLZdrqZ6/DVAsyPaj5mW8dVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790115128; c=relaxed/simple;
	bh=Twip/C3mRSt6gu4wo7catfd1T62ZT3Ril7C7SiKejnA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sodwSGsyq6ld1OXz5hSOstpwlazm4qdPJQAluPh1seJWNUZtq2/3/qfs2iA9YMwfB2O15yYVrdjO/zY8KQ6oBEXcCwn832lZk8U0nE91daUPxeKaK29Yi/SpW6Ws8fHoEN/ww3EbjaH+jdu4IGxfpDi/ydUXiIqkCgh1AXuJfIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nlm+c5HG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cbcIqhk4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nlm+c5HG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cbcIqhk4"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI6wMe178706
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 22:11:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/MVYf1j9dZY
	8m3zx433PpPi+oUAxxCgjBxkMvHlFnnQ=; b=nlm+c5HGgVtlqUDEzS7QRvCf7rV
	N5JF6GEcx+jQYz9jry9x+tLIb6oJ1gkuiEEuOdlW/3NcVZtVaIR2I4XqIbK6aHdu
	sO29dwbVBry8WuERuZEnmKYEc24xkMDf4V0/Yjz+XVt8t+6GlfTyc17jvr8NM3ZQ
	sz7sayOUCAe4U/XJ3Itfe9y/xumdwn+005W7dg4LN6+afUfPdJzch7vqoBbXEMk+
	dURvoSKWSeYFZeafBIxAJRVydhCffXynVgidlwZ+sc57zaEs/hTWdThOYlj7nuqy
	OC/nU1VT0unOtPSNAVETr2eS5oRu9ERm9Kmmj4Cww82twxn5lXNwMfIBG2g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guuec2bbn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 22:11:54 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9104eedb5b0so8088296d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 15:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790115114; x=1790719914; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/MVYf1j9dZY8m3zx433PpPi+oUAxxCgjBxkMvHlFnnQ=;
        b=cbcIqhk4KPdiexXGtMy4Ts/L3HaElytrWSdR1dnRbYUE+4G4QpzUE1ECnnhEkBo+p9
         FQb+D5zEgW12sw844p/3YSnPF7ipy5cMp47kxJOE7qU/VHgbVrtbTrq6KCP1i+99tmkd
         mSxsCTY/0uhqDGNYFV9tO/G9lXQlHV3FnZ0RT2WA5nT7KNG/tNARB+M+O7jnhwcyJT7d
         gxcTp44KUwHblatS14Z2ES1VaLPllsYFkoZgR0zXZnuPYEzOyx6WM9piDGWUfDf8E4a/
         uiRRBhRE4B1xAUF99eO/2J0IqVnnqqZBLrBDAsyuU1lmyNG78fCCXzY7SEoduzIJHkgt
         sFzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790115114; x=1790719914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/MVYf1j9dZY8m3zx433PpPi+oUAxxCgjBxkMvHlFnnQ=;
        b=sENrVeyDhrD9rL35w9NNcffY+wF0iQ8PGRqqTY8aaC2tSWO675OlnwAMlfG27yriJw
         K+XX+94lhFV/fgL7cl6ZyZzM70Rh0Yt7LSxHEBAixzVxI+NBGWDqM3TMJPzpF48kn4RK
         UZWy1ZFbgc8kSLt6XyG/FZRezPrwz+Ghp2BqNn4TZg5JPE8R/32sCsO5doo0Y+tc3Dc3
         RdFO6WIKVhI3+tzGmoDaslMJF8o5l9Y8zJ+G1Qq1RRiBN82XLtOe7vGdnATD03gnhTW+
         3BhormNAlQpnRiePd3i5sXjbBHNr+mzKmddDvWKCelFPzq0QP1azihvjNZVms8dyP8hk
         uSxg==
X-Forwarded-Encrypted: i=1; AKwUvBxogUB9GS41bgWa7fOulf9OAxQXSN/9ocjnaR55H2Fz3T5evAhnyvn1L0esGfTlonUjr4CnuYVhXWawZMPA@vger.kernel.org
X-Gm-Message-State: AFuF++ksCNP4lKxfJyTpzH+E31YpsfuBy3HZUNsfX2Dv4oUOm2NuwD4G
	9uxj6elmIsVUVCxPtlQ2Tl0vEHrHelOGxc3NOOstmAJpRTtuIlceNHMSNrJODrCN8sy89WSkQAL
	MrRCoNOPU+lXuzyRoWSdqZKZMZyixhtlbbeXCJVabnuBZHjjqNu+hk4TlxtacOWNp2pfF
X-Gm-Gg: AYBFou2MLdtoqQw/fBFzD4olMhd4PYwsKGDBpxIX1rRTQKt46p5QeQQA1hdVF7+GuSy
	WVHK0CqxjFSlx5YtknpcuW9041imJHD6lZuAj+ThnDSZbc1X5g5ojrKW6fn5weGvAnROSzL27te
	iNjoi3HEVip6aXb75b/FPH3yah5MumbG8fC8aVHuXK5AntaRCqPTOlGrACDFQLsOgVoZFfC1DVP
	gAX0NA+8VKoMnNOnlJePTvRYNwY5TdGQHlnb7OT8ISG5zr77k11Z4zxpJCpwp24BrgDt7hPwGEQ
	rXgyyQiF2WwTfki49t4VPTs2FNefWo6kq25K3jXik91FXdSU5VcUUJ0iwInat0dsI8c474Sw9kr
	nxiimTXyYIvMu9H7ezEveZ4SE6uR9OPiLhAGs5uvuvm5NnG9yumrZ8p2dJOKxa5TN
X-Received: by 2002:a05:620a:19a7:b0:939:feee:630 with SMTP id af79cd13be357-93c25103981mr127195085a.30.1790115113748;
        Tue, 22 Sep 2026 15:11:53 -0700 (PDT)
X-Received: by 2002:a05:620a:19a7:b0:939:feee:630 with SMTP id af79cd13be357-93c25103981mr127192685a.30.1790115113428;
        Tue, 22 Sep 2026 15:11:53 -0700 (PDT)
Received: from debian (cust-west-par-46-193-35-178.cust.wifirst.net. [46.193.35.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-488688856f0sm1400270f8f.30.2026.09.22.15.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 15:11:52 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, sboyd@kernel.org
Cc: dmitry.baryshkov@oss.qualcomm.com, alexey.klimov@linaro.org,
        r.mereu@arduino.cc, srini@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 5/5] arm64: defconfig: Enable configs for audio drivers on Arduino UnoQ
Date: Tue, 22 Sep 2026 23:11:27 +0100
Message-ID: <d7e64ce498db8aec475b8652563c6cd8bc8cd429.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
References: <cover.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDMwMSBTYWx0ZWRfX2uKgPC81uBCO
 dXeDTEK+so/QY8/c08irFWkFjHE3NNz8sxIiWhrKmNcGfR3GTfEZ91mq1zjCr120BKY/+7Q4kAl
 nRBRYEJGmVVJZdPt9TbMQWBstaHvFOZAMjIkaAiwRLy/8PKLFfyww+JZSXgcbY9BlinIK2ySHMC
 WsM3lvvhPV0JqtXSMk8iEBuqDyksgUNrabv/Yu1/pWmS3Vn4+m3LwnM43fZq/RMK8alAZtMdX5h
 7AFzPH+QgBKE6uwOmA9vifsC28PgJmzO8pJHCxVICTVsNTKwBBt5+tGgnzK8Vuk1CWs1HC9FnQj
 TvclY4+q3Hyo5Zdb/Yqs9Sqej7bibMCS+fUsvAfaM3UmXkYThUvjGqSSEPz4s+Fp5q8In+sGxyj
 H4Nfxj3vmLiYL039GMuANHrB6GV4KlybtF7zWo11yUALmAUGbFQ8gOXKVFN3B9ae87O5N3LNOIS
 dZkqlevSzeATNSuwIMw==
X-Authority-Analysis: v=2.4 cv=VKdIDNPX c=1 sm=1 tr=0 ts=6ab2fd2a cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=Hji71o54RgNgZYqDgtlrhw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=rO3wVDe-YCVyVCuK1RsA:9 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: F2j_QKEiUpNFtpIp3k9DMLTTwOH9l1MD
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDMwMSBTYWx0ZWRfX/4HkqXpO2dzL
 vXTu5pxQYb8HvNe/vrr/D3T/x3HAZFksTb1F8z6eR0M+dxuLjLqy5v6LhkVOl202m7xgNdtO+zY
 jYqIWp+EDaGDnB0oHxqu14jODRmXMac=
X-Proofpoint-ORIG-GUID: F2j_QKEiUpNFtpIp3k9DMLTTwOH9l1MD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220301

Enable reset controller and pm4125 audio codec driver that are required
to enable audio support on Arduino UnoQ board.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 982ea1758eb6..f734c413dba5 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1168,6 +1168,7 @@ CONFIG_SND_SOC_GTM601=m
 CONFIG_SND_SOC_MAX98090=m
 CONFIG_SND_SOC_MSM8916_WCD_ANALOG=m
 CONFIG_SND_SOC_MSM8916_WCD_DIGITAL=m
+CONFIG_SND_SOC_PM4125_SDW=m
 CONFIG_SND_SOC_RK3308=m
 CONFIG_SND_SOC_RK817=m
 CONFIG_SND_SOC_RT5640=m
@@ -1586,6 +1587,7 @@ CONFIG_SM_GPUCC_8450=m
 CONFIG_SM_GPUCC_8550=m
 CONFIG_SM_GPUCC_8650=m
 CONFIG_SM_GPUCC_8750=m
+CONFIG_SM_LPASSCC_6115=m
 CONFIG_SM_TCSRCC_8550=y
 CONFIG_SM_TCSRCC_8650=y
 CONFIG_SM_TCSRCC_8750=m
-- 
2.53.0

