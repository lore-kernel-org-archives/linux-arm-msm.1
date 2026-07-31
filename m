Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F3145D5D1
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 16:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785515196; cv=none; b=m34OO9ZTARqXNtoNCfGP5nOUNHBedE/aXK8AOcDZXbk/1U8rXnb//mRwJiqbqonn0slpqNaYBr39MmXa1LxWkdr/uyFiwyRXytpVdAVQcQ+uQMBvdx4V3r7HwdVqdaFlQ9Izraj64E5l5gD3y254+YHBXkqmU0jiH+x+MX5xixc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785515196; c=relaxed/simple;
	bh=KP7BgwAkIlRHJZuj8RiZpKnFmdNMlN/boL92Xkk3NNk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IYkBRzJdwayIND+rZYfmjXTpwDR9exCJq8z+BgkEoFgI9AQKw2obyhX8NYrxY1l+NQCdlVLMxFiAdZh+s/Co1RuTPu/n7mjKEd/hrlv4sG0nBh+7pSsr8uD/hUhLwOyC9o/ab0mHQTQfobxgBHW4uLxmLr94vKKwf1aFvGYKoR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d+QsJ6NG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cXjDt+Ug; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d+QsJ6NG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cXjDt+Ug"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VFODZx353526
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 16:26:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=cWwtUDJ9pXA
	8+7sKQ/snQmdMPTxApD9GTI/8fu4jJO0=; b=d+QsJ6NG/NY8NJnKGVZ4Xrlq2td
	F7FkQX1cmwj2z87TpPj2O7nKAPvqOvok40xW6EXTeKKxIZoiDSVsWRFa8si+sMm9
	mcJfdS4qe1Ig9qSoSNIWbId71R0LtJg/pIIFSjZR21dGe5yMAcc/I37Khwr0YXMo
	tmbNE1C46GDhIWk7N//PCnwHSZXINwEFo9L9DFjhQYKOppw5rEfdu2MT17eG3ll7
	qfVuimbClSrETbf3HURP8SPBn8BueKYpK5AsEz8J8eK4s+Ncf/lj/drHnSxPer+r
	0u4Py7dLs1OlXh66BtCUItTF3pi3YbLdUFhVvKCiFtRPAaU2D5G0unSgJWg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fru4811tv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 16:26:32 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8f39a46efd9so18527576d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 09:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785515192; x=1786119992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cWwtUDJ9pXA8+7sKQ/snQmdMPTxApD9GTI/8fu4jJO0=;
        b=cXjDt+UgbDv2HQoXHsPQ3tXCTUo7Oc+oNyYVCuh6NcAmn7x8uzsuJlmAniiHmL+Ngq
         pQCB5ZETs9TAjuYtHGelhpYybPJKiiUAGWsgFedsyJuurobc/0p+hywWWo2dlVQM5Bnw
         bHuyjT656520i4Q71Z/x46a3Kwuf3oOj9eMqRj3LX1Z4FLQyaLa2qENkudezrYS3arJJ
         TZjYRRYTBsEBBhbblZNT2OIWMNqhrnS+HlollmPP25s/jEB0f5tXnjBRUmWQoVbR7ukT
         EEAA6b3QSmkP2Rr+E1EbUMnjbjfB6kOjsV+55E6jp28tgTrx4IBnnwFuaBuUHxKdpmEj
         ISTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785515192; x=1786119992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cWwtUDJ9pXA8+7sKQ/snQmdMPTxApD9GTI/8fu4jJO0=;
        b=hhCM1b8cMsn4psw8/W9DVu8HiGZ/JUAD2mYRKSjwN9xB9lmyjYGOJfJ4QrJyiqsPgL
         XjzWhJ8KFjY0ZjKMaoyjNcgw/hqQ3+pt6bKnqzvkIhwsZg6yHZHanoWNc+EqQO5a+YLk
         NPz/34/fMTjZlAuq3TA/VOcXIRvP60r/kGM9IPwp4kJFTRbkgfGCUgAMDkgN93u3i/ZI
         Fj/mnGA71bFZ2TDGo19kDSxrEQ2RAMkpsQzk7bjOW81Oy2pBCWF2gux8hKBV0opW3L5A
         aLN9/Tp32gSHdL6NydLxTjV0e0Y+WqoG6BjrDIfVRp75dowMycIJgja15bPkWup3B5R4
         oozA==
X-Forwarded-Encrypted: i=1; AHgh+RpWh55i1E5nbnp+Rb9YroUUS41JYjbLPVTC4FXuQb5w8Qo9PSMA9gyIb4nokJPIaBn9egl0oBBrXnvxm+ZQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8nopR4D+ShglzAo/1M/kx37IJtjWPa8X5UOK0qX1kbG4iwXGP
	u1IkHmg2VRKP9/SgUa4HwyFT+UsLBI+jxsAY45CLaY82zREBeGPORJqhj8uWTvWVR/AxAub5RtP
	WI9yb9nhgCpCZtjpbZIv7VwyKQ73sgA03nWYk8WRnWHrpHH/joa4ajLcoZwQEeaH1xh5P
X-Gm-Gg: AR+sD10E5ngt1zwXiGSoaSRF8OtS1YR9xUe2h+P5Kid0FgUe4wH7Rlw8tScLg3mG1Zy
	LKt052sKxCmvy96iytsKXTxdWYwqmDGS8JF3cOTTB06s/nX5fClSVezM3/Leqq2Og0rfZQAMfDh
	41NnRS/ULLBVmvmTwgjjPGnOl0bp//rGx8LRmpasldvGrRFHJkf3tPMeMTp2F2qglngqfhU21db
	JcZBnK2xEg8OWLpCDxTWGPnwm/wi0DhQTLe5CHZXLN8TnAnfZJBALIVwq2Th+vF8lNX+yW8DBfw
	Zc0rb2HzUtEH+KW/MX7zxkHxouMVWIpMEYZ/A78kMEsTDfj3SVePMmjRyPlhygNPiUGl0eYfE/B
	QhTK2WhSMBTtZ4w==
X-Received: by 2002:ac8:5850:0:b0:516:d83d:b28 with SMTP id d75a77b69052e-52b4c5ac831mr14473611cf.17.1785515192084;
        Fri, 31 Jul 2026 09:26:32 -0700 (PDT)
X-Received: by 2002:ac8:5850:0:b0:516:d83d:b28 with SMTP id d75a77b69052e-52b4c5ac831mr14473211cf.17.1785515191615;
        Fri, 31 Jul 2026 09:26:31 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41d1a58sm7084050f8f.7.2026.07.31.09.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 09:26:29 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: srini@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        hongyang.zhao@thundersoft.com, neil.armstrong@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 1/4] ASoC: qcom: sc8280xp: tolerate -ENOTSUPP from codec set_sysclk
Date: Fri, 31 Jul 2026 17:26:23 +0100
Message-ID: <20260731162626.1588561-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260731162626.1588561-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260731162626.1588561-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=IJsyzAvG c=1 sm=1 tr=0 ts=6a6cccb8 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=OIS-06W-AobEqumY0CQA:9 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDEyNSBTYWx0ZWRfX6zNKbGUQFm8P
 A4p3Q1kwUtDKYkgfYY5kCCMPxFDhfEJAy4k4jmIbWDPqEk/8dljsxI/DcehYvy4ufLN8oY+ul7V
 L0VDjIocsCTKdIIY3hmxnlYe6M3kBUE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDEyNSBTYWx0ZWRfX+aefmAhVIhD+
 9TPRlgd5zf55ZmxnsrKCnJTskhp7O176bVt9tseSitjycOgSz/AGhBBKrNRNZ0iXvcT1iOaC8qo
 SGLRcAO2CYwLnXb/aqYx7bZWBIVT7AdK5PSTUUtB+3K0C+DITIpkXmUV7jwxLpbc/TUbKZF6Zxe
 QJRapfkMq/JorWj3LWEcq0CQc3gXPEPtLMKIVS+1C0G7z/8q/TBuKhKFaphLaF53hlfmJxceF/k
 HS6cpBiodTkAIOagdMOcaN5/BvJ1frigdlCx3eTJVg3VNySJOktCHsj43ZYnJnnNZIoKiS6kLck
 cL4+kk+AdZXZ59kU5lUqD3uMTr0WYYvUej2UJ6IiTlbQpHc6nKr/ETXn7j5qYu82zREu3gX0/U8
 XQlZXIKszGwcL6iN1ncd/SLu1sKcpLo/z10qSRc6mumnaz2oo9aVJGWxb+akPfFKmjsrpQILLS+
 OdlmTaSbzqi2ba2snqg==
X-Proofpoint-GUID: g9Os9SSF-PgME9sZRC_9p6e_NBWbho0o
X-Proofpoint-ORIG-GUID: g9Os9SSF-PgME9sZRC_9p6e_NBWbho0o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310125

Not all codecs implement the set_sysclk operation. When the board
enables codec_sysclk_set, snd_soc_dai_set_sysclk() on the codec DAI
can return -ENOTSUPP, which currently aborts hw_params and breaks
playback/capture on such boards even though the missing clock setup
is harmless.

Ignore -ENOTSUPP for the codec set_sysclk call.

Fixes: 766f3f79c312 ("ASoC: qcom: sc8280xp: enhance machine driver for board-specific config")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/sc8280xp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index a9304784d41e..ce2b0633688c 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -202,7 +202,7 @@ static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
 			ret = snd_soc_dai_set_sysclk(codec_dai,
 						     0, mclk_freq,
 						     SND_SOC_CLOCK_IN);
-			if (ret)
+			if (ret && ret != -ENOTSUPP)
 				return ret;
 		}
 		break;
-- 
2.53.0

