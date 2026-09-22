Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6723A4BF935
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 09:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790070211; cv=none; b=Oo9LLvV1UFK6Pf/ZRrAu5uDObM7XJtNv1evwRY0M7v64igj9meQQRFn7tp9I1jEeRyiaHGi2YjCUNTaSXXcw1FGoXPzkpokBgNGVmky/IUT81jxToJJIgxlvdoERggR1+0DSNoF21ci6s2BXk3NYNkmvoHfSjbH6XthtXgzEEhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790070211; c=relaxed/simple;
	bh=Dw7u3gycMBUuusWdFunc7MB0te8LR8j9fzuF/6sKLO4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gWYImkAA3tDoROoBhN4hGs5cQjclpW8Th8VU4eM2g62qtROoKDp1Ao96tbVjZwc3n4gFUVBzOfgli2exJvdKSPj9GUgF68TZPBfvOtP94YFFOGjJFNpSUdLyQxnHS6NMfn9XfIbyGekDwePOwGunDgsrZPbkGqV9YmHbbvilcTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WaipGbOC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TGvXGkTF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WaipGbOC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TGvXGkTF"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M7Buad2166354
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 09:43:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WCX5BCf48amXglknlAvtG2fxTSb4kKRHLRbJKsFlN48=; b=WaipGbOCENlfYCV9
	xpwbpwgrlibILapO9nVe+ZPQ3pr78UKZeDlzwQGn5TRK3qt6RG+nAwVojxo7S8Gi
	lf8zwh5baxT8zIs/vN4OEikPPJZgKC/9m93Q/Tfl7D7BI6vV+XMGKVnfPIMnsK2l
	I6UJLfJ5mVXPkJQxCXRxj2Y/t8jmBEHaz90WIW05N92UR9a2en2Mu1Py4McLafdy
	SnZ7LYz7U+noxrvfBqdOYacXyDeDbfBOp90g4l8QuwpreIVTRBROx/OTVv8aUhbX
	ZmW5cBJ3f4jmx6/Xb26LRdu12fhqCuuEbve6uVjDQeeQaRSgepuibktUKO8mJ6MK
	QttNPA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu8xeub4u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 09:43:28 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e54b6556aso5050617a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 02:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790070208; x=1790675008; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WCX5BCf48amXglknlAvtG2fxTSb4kKRHLRbJKsFlN48=;
        b=TGvXGkTFZGCbvSqeCt2kOhAkqXn9LBQavLpPoSWn74Fnal/84N0cgyhFuYXR1Hch84
         6Sl+EtH3gH+ZeG7h2hA6mLr4v74XFJP1qijuVdYZ+EYgValk0yEZBKx9aOiJSoDxyFV2
         Rp+OgIlXs6gxE2K8j48gfz4Po68RA28QsaDVEguUF2UxiH57LjX4x1DBR8rdjSaGPVpm
         i3dMtXA9pU6z6Jl31sV8/+L/mu6rdg59hAGRdU+Qdq8sUqZwppZZyWOed9szj1hvGf46
         zarhw2dQnCbdfqfS9sKljvwSdGRUZqAjLdxMpIcxaR29X9B0DCbEgrRTbgwbg/X4Uiye
         FAjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790070208; x=1790675008;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WCX5BCf48amXglknlAvtG2fxTSb4kKRHLRbJKsFlN48=;
        b=iRPr5Hi3RKETeiWUMMwfR8qw2xkJqHLrnKdP3D6frld1EQEO6wwPXlVLDrGtXsRJsP
         8SCZz1WO4uSUwHkVW/rWnePMhUVIkND2vzIBWWoyLVMEjxa/yyIiswpjy0cxzE4U3/Qw
         IhuLFbkI/FHSeylpC8bgLzPjeJ+/W4Xe6uvhW99Ht4Z0gfW+NBRSdzi6O1gDYjib79Qs
         HcCUeucwtUvGaCIVkXP8erh9r35XwnwSKPUzTuylr++MaUrS39a7yG8mkynVTeoIXDJ6
         I020pVi33vAWWNd7Xjqh9XkDzLZjBito83jFrXlCFv3HHo5/nLf3HrV6tqs4Hn7Rk3CF
         dexw==
X-Forwarded-Encrypted: i=1; AKwUvBynBLJsHr5d94B2coDdxsOw44MBrl3y2UrySGJbggRYUJGuEcGJ8/HyF+10cRbJ8EqvEs7BMmrvFpokh+57@vger.kernel.org
X-Gm-Message-State: AFuF++lrjrbUhFOEagSXyCF1aTMxiA3Y/VumC0o8SQCN28OUK04rWhBn
	7nrEG5oP5ckvMlKSIWPJCq+ZKe5ar2KS1yDRprHMORiGhcXun/5Pdea4qHrAiWel69ZA1oHZAvJ
	CYGsgKBhsKBYys5c3dbtNGka+VWGhR4tpwK27gYVNOc24xwbYRxS7nru1vlczsOEW/b8H
X-Gm-Gg: AYBFou3T6PMSfrpYrl/IOtYGq53ZjUCwf3uv6HM48pE/b+cmJgMi128KbG/wlqAFWzA
	ZJe7075YrlvChW244ZcDfZESfI8tBKgIqLlT32ntUxkDDqwVzLyp/WiHkWmf+JFK8FrTEmDFyCj
	imz8YGA41j7yeNjY0VEAaTHme9db/GYCg2TUTCoisDYJkr+Nah3IDVtQ/4An9EweC7SmqBloWiJ
	q4c82cNMntufc3Zji4e6w/KbQRuV1jhNmom9yi0Fd8evAFMXhusKf4DHMtkubUcCtCJDb/bv+tx
	7wBm8KTA5uNSEihbl46Igx7xeGa0nXCTugT27ZqxqOwvo0wZn3p+ui1jjhHLatzcA0OxXOrCvJG
	q8c/7Xnfm/cl2AoAAkhGbQ9pGtSyWw9PdFJo=
X-Received: by 2002:a17:90b:4ad0:b0:3a0:4146:293d with SMTP id 98e67ed59e1d1-3a0732851bbmr622449a91.62.1790070207854;
        Tue, 22 Sep 2026 02:43:27 -0700 (PDT)
X-Received: by 2002:a17:90b:4ad0:b0:3a0:4146:293d with SMTP id 98e67ed59e1d1-3a0732851bbmr622422a91.62.1790070207397;
        Tue, 22 Sep 2026 02:43:27 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f2a44cc8sm3776183c88.13.2026.09.22.02.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 02:43:27 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 15:12:31 +0530
Subject: [PATCH v4 2/8] ASoC: qcom: lpass-macro-common: Add missing v2.9
 version string
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-add_shikra_support-v1-2-6c6cb6444caf@oss.qualcomm.com>
References: <20260922-add_shikra_support-v1-0-6c6cb6444caf@oss.qualcomm.com>
In-Reply-To: <20260922-add_shikra_support-v1-0-6c6cb6444caf@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790070192; l=975;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=Dw7u3gycMBUuusWdFunc7MB0te8LR8j9fzuF/6sKLO4=;
 b=ucyvmbAnZBU9xU+YER0LlTRJswgvXYL7O1Oq+wB/Zf3Wv00b811Qus7uuBjCzvcPXCY/iUMuy
 CAKL4KQM0NoAktpbpA+LO7mL04ruSk/vtYIKzL/gqXfydITwGD/SDJB
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-ORIG-GUID: HU5qR9V83Nc0YhDCGjOqXsraISChJaiK
X-Authority-Analysis: v=2.4 cv=PZhqFShd c=1 sm=1 tr=0 ts=6ab24dc0 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=QNNIS7QUJBVbuyI2g7kA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: HU5qR9V83Nc0YhDCGjOqXsraISChJaiK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDEzOSBTYWx0ZWRfX20PhV/tNWtNT
 TG52nllS5XUvApJSqZEF2s1mHHSXv/hYjr3R2WS1Pn34nFN57fR0fqz9k5jHDvkM7mPxTI7r9NN
 K6fUer0V0jeMxDLKXo2kjKwuQ/Xjtqz7ekag/fzY98jwxLF/BKul4A7MImX1yTx0ZaCS9/UNMM1
 S5+Sq7tVnewGSgSBkFy2MfV/CFHpX12Ze31hDa4J+gVBoER2KsZAc6IEKVjXnC3lxjI7sIMdobi
 FfIGpIm8/6ZktgrIfhvblZg1cIJ11KYhls8VXsGPrGStPeJNJN0xJsw2A23hhzNMT5uOuVqF7Ck
 UzgtpK0BHLqvWY0L8op88moW187SHJQ58kECFFuvbON+OgJB48MElV76XD95kiqRzL1bSGxEF5G
 KYq+LrnBOLraUiQ1e5xGFH4nxcqrmrx1QOroT4pe9jB/SPJGvvxdIzv2BOQnaponTJYmRsSv2eB
 p3M/6r9dq0rfhYgMdgg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDEzOSBTYWx0ZWRfX3sA5gbIxVP2A
 5iCyp8jnzFA31iyMGeOuztMP3c0qmrPWO84BcLiGFqjFsO5vqib7Xky2w7VvLiLkeiC0zJQHTnL
 TOyLisgFN02zNgnI4lJyt3W8Fl/SZJA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220139

LPASS_CODEC_VERSION_2_9 is detected by lpass-va-macro.c and consumed by
lpass-wsa-macro.c, but lpass_macro_get_codec_version_string() never
learned about it, so the probe log reports "LPASS Codec Version NA" on
those parts.

Add the missing case.

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-macro-common.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/lpass-macro-common.h b/sound/soc/codecs/lpass-macro-common.h
index 10ad682019fa..573b2145e1c4 100644
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

