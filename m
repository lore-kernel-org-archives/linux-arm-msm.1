Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2904052C3
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 09:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789033653; cv=none; b=OHCedZ3K+189Z40xhwQG59C6KtWbSbeDIhC72mlDjYdPPrJ9oyEEUoCExC9uVT+fpT/jo+84SjprgI5MoEtRae9CrTz08mKN9bopbFVKzPTZo5USjifieukAZ02Bja/It7WxhijohrSlLJtTPPKloo/zyfEVqHD3FcPYnDvb/uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789033653; c=relaxed/simple;
	bh=2LhCRdb4SB1knRbK3yyCnOaHr8rfIhz2uYgEE+b9MQA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CMCGyr9bRxV2F3Xmekep7dbT6fpCyR2eEKtmrgSQMkeou5cHVKqERoIhfrwbRojbha/ihrDUsbRoUpWvpy2uB3Ce7zk5MMU6Bwy40sKHcscA6BbImPF5BrgaLE7X0IIJG7ngp4nZrEIvPCkdpKcIocEwBUusZpjTw/dCHhnZR1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pkve1dYX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aJAcXscE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pkve1dYX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aJAcXscE"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A8qJlH644511
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 09:47:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RY2nV6IgGFcHLC9gYLbk26u/oCbJf2cVf35SBZTctoU=; b=Pkve1dYXS7qT5+tP
	G7nS5XldSHKoDXYb2aNzykx/yJ5BVL+gu6641EzSc+C0wcgJbz6cqWz6j6MFHvB+
	gdL5exdlhZivLZQMBQxp8807rfnk+OOc56VPthbsxOr1FE5WqkTqk1SZ6OiJWMkE
	H0HpwmV8lyS/CkMdQWGPb5P4Pz1d6F5HCIPh4tswlLDboOkKLsUt8nPWcVJKhbPT
	fgTQ2p1bYBhlB+TbwMPX4WxujimIIPCupH5Vyt10QTSYZpO8ctjJvLq6KaQQgTV6
	8hKAEKQsC07FGnMoMalki402iKxPfWPOlOkOEMvs6LYIBlw9xxAF9D6paLyIAAjT
	KwD8fQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyg39p5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 09:47:30 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2dcfed75f77so28941665ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 02:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789033650; x=1789638450; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RY2nV6IgGFcHLC9gYLbk26u/oCbJf2cVf35SBZTctoU=;
        b=aJAcXscEbd6zGlg+hRGLPW4dzFuXZbJ9WvbCrBm+M8wpPqFh5PRFx0fDIkPfq6rvJh
         /5Q2myQ27OYwwxQaCpwHcTo4vZOQRvrBDdLWJglhyhoLnSz6HajS+/SXjAW4IUb/hMkk
         oop8qZjQvp8kAmN+if6VNhrukHCekjhYJXr0GZybAgBSO7SmHLYztagQSuSFWJDokEKK
         LKngGNEY7fVq5tEaAd9bcoodyOtK5NVQjMSaBXAksKBMxLcfTvaBIU7dI/brvOSz6n4Z
         9t8KDTFKgyc+U2jcqJD6EgiHjBrXzy7dsS47kkru8BxSaf8/hpUnURpp+3B937Ccn7YY
         sTQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789033650; x=1789638450;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RY2nV6IgGFcHLC9gYLbk26u/oCbJf2cVf35SBZTctoU=;
        b=G4fQ786x39XzNJvi7VAqeVM7/3Au0flx2oHld7jVb1hgb03oigxLBb9GstWOIkP1E3
         sfygxuX0++vTpcFwucx6DGHxVj72+I7bCCCoBxvjyXpIuE9m9UJPTEsROMs3vVXYG2rA
         jDkTJDho0eDSTPcDgliwPZroDP7X+t9QJkqMdhZNBNOg7i+WMoUBAkCPQQtbRPRCSZW2
         c50pQCOlxhsLGk23EjSNzUpVtwGGqKGX276Buh28Iz+JRfKGWw2zcF/U+37kknt7fm29
         Ls2p8yFX+ClEuX/nhYrvPhi0aOJI2GUZxr5LpYL/s2u6njtB9SUq4fSMkWAmehk+ZhoT
         hD/w==
X-Forwarded-Encrypted: i=1; AKwUvBzIwH+SVtsNlBcjF/4V4cSSDIcuz2dKcKiHqP67Ij985rHLG2xAWwUgye42Q6SCyBLRSbljjN/8+mdvfUeR@vger.kernel.org
X-Gm-Message-State: AFuF++l0HjjufUokIeaW+7PP3Kjwn0UQMnQ6yWhgn0sdn6Za833+r8Of
	OzXqZCElgqgUFUkKRY6D/iPfXDbaOy9sq9GZLORW9oUd+z4yzdfsQysMwAyF7tJQ87Px05dID8G
	dceoGYxEx3bX4EqV2tzHHO1ov41y+9tz5OitPlJA7xtwTRx1B/e8JdiL9HIWV8QrvxQ18
X-Gm-Gg: AYBFou1L9TDV15Vl0UpdvvWdJ0WIG7LpIFjAVJ0q1GeHWjJzj6txJFc1jrqdqDiYDGu
	Igncs3AvnYC3cid+RbJAD+0tZ87f77Q3ooT8hdoF5VG1BtF1i5EaBh674AADmJqrmg/dRCV8fDG
	8H7v9DkkjPLEtEz3aI1I3OSflTgh2N+jkkzSYRPqLeM7bZ8F39BEosOUhsBWRj4r2lkvCvkRZEj
	eIZZjEfnGM7NkW8EC5M0dMhbFxKmrXSM1KA5i7C3io20SjW1ONtKjJD+KbCSDj7RzSS60zai2OP
	HWnGjTHjoPx2j/m9B8N3+hBBoozaK7ZNXRmN3PqHTMoLbXT12Pj4jghPMWypb0Wsz77D24Fx1yV
	um1Hn7r1ZHmyBbi249HoBQoa8gK2OojVkzCH3
X-Received: by 2002:a17:902:e54c:b0:2d3:7c58:b0e1 with SMTP id d9443c01a7336-2dd07320bb9mr96322685ad.0.1789033650034;
        Thu, 10 Sep 2026 02:47:30 -0700 (PDT)
X-Received: by 2002:a17:902:e54c:b0:2d3:7c58:b0e1 with SMTP id d9443c01a7336-2dd07320bb9mr96322195ad.0.1789033649594;
        Thu, 10 Sep 2026 02:47:29 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33987ccf483sm11941129eec.20.2026.09.10.02.47.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 02:47:29 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 15:16:53 +0530
Subject: [PATCH v2 2/6] ASoC: qcom: lpass-macro-common: Add missing v2.9
 version string
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-add_shikra_support-v2-2-fdd2129c696c@oss.qualcomm.com>
References: <20260910-add_shikra_support-v2-0-fdd2129c696c@oss.qualcomm.com>
In-Reply-To: <20260910-add_shikra_support-v2-0-fdd2129c696c@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789033635; l=896;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=2LhCRdb4SB1knRbK3yyCnOaHr8rfIhz2uYgEE+b9MQA=;
 b=9vnuclAJhYWlGpQD1qQiEVG5tCtfh5GCTouC758hlLvHN+C1+1+7xPRnKfgXYk0OPdAJAGY66
 m9YDRsxIf4mCMgmlxoE6DTlAnXi75TswqDGmD76PIe4lH4NDKYIsNOV
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Authority-Analysis: v=2.4 cv=Vu62kO2n c=1 sm=1 tr=0 ts=6aa27cb2 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=QNNIS7QUJBVbuyI2g7kA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: kbLjF2rZb7OVoxyrMChAo5FBURhQUff4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDExMSBTYWx0ZWRfX8FAma711i0XY
 XqJMDXenmDbjk8jvxy4V+NABIyPXspo2roUxGBY43kmYBCIfpI0U/Ee8n3C2yOSyRIZbRnxJsPI
 f5908vpJo1ds8MpJ9NNhwa7S5cK/aQ8WOO70RgjUBHwq8XBhpONa7QI6ZnbDW+qZTeBmZbsykrZ
 EaCF9hkJWkAapde7wjMSuUqndzIRkcd5NJtGI7hLY/zp9SN5oZHh4cCKiV/p0MiaacFxP/YvChY
 xIpfPwRWGpEq2pQZk1K5rEU+Y0ObfPlKzhsg+apXm7XEAUEhipJz1sQpTd9vKlcbY51Uswxm8l6
 gcVJ2awZ1xE8LdSRrNyGp9vMy7udgAUtWHLV3Hrx5Lrk5rLTPYJV1WrX+UYcPVjl/fZxOCWsKJ0
 NEYSd30gQLK+fry568SMnjihSWnmOTr34bYPU53m+ldg+cihFU4W1AEjIDrtFYKiIdjgNpY0IMx
 5+L6R2uPp+xw3RFSxgA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDExMSBTYWx0ZWRfX6YpGbUKy4GEK
 z7D1+WdqaJogO3Z7CpxhHIQQbUo1vZHGA1knjbeirte3v3kP/hBulWe9OnXNpckl9Fn1Bvo7zpM
 v0IyWw6YuMmA364GjIcf0FlPu1u9d7c=
X-Proofpoint-ORIG-GUID: kbLjF2rZb7OVoxyrMChAo5FBURhQUff4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100111

LPASS_CODEC_VERSION_2_9 is detected by lpass-va-macro.c and consumed by
lpass-wsa-macro.c, but lpass_macro_get_codec_version_string() never
learned about it, so the probe log reports "LPASS Codec Version NA" on
those parts.

Add the missing case.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-macro-common.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/lpass-macro-common.h b/sound/soc/codecs/lpass-macro-common.h
index 10ad68201..573b2145e 100644
--- a/sound/soc/codecs/lpass-macro-common.h
+++ b/sound/soc/codecs/lpass-macro-common.h
@@ -68,6 +68,8 @@ static inline const char *lpass_macro_get_codec_version_string(int version)
 		return "v2.7";
 	case LPASS_CODEC_VERSION_2_8:
 		return "v2.8";
+	case LPASS_CODEC_VERSION_2_9:
+		return "v2.9";
 	default:
 		break;
 	}

-- 
2.34.1

