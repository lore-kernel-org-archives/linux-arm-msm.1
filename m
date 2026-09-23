Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA2A3C2BA2
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 16:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790181249; cv=none; b=B3SFdk3an71Hzsbdb1FvhASfipG4AEf3wia7Yr4wBJSgIKAWqOvdyL/3SpACMGuCXLLJKOOC5OHZoY0Uw3hc6tiyFieSEbdlq+IjEwsj0aebGZUuyW8Za8h15ozRwSZFp71uhjHxLO57YbQnpHqA+gdY0sYcT3X+nCWC2H7vYnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790181249; c=relaxed/simple;
	bh=coYj6sdykkd1PCi2KNjcYdAGy8fu1yFBf4PZfUBvnrY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m8/ycDk/MmA/9wAol2fWvSW0zICrsriAXx+SqY+Xx7sVH6j1B1krQG8iePMwI643jukamp3zhsORvPs+KFmayx9W3gNE5ZBUFO+pdwUAqVYZkGim5dQ4M2HT/m6zIlU/IoF32oaIYTjlhzKsrR+/QpdwrIMY4bp3Vbi2+G0Mt1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U2LWSuA9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jAZT0ooo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U2LWSuA9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jAZT0ooo"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NGTilv2470183
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 16:34:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	llOjDMEuBFDv+DyQdi/V2z3mxuMuRRhWgPZ4yTvTgrw=; b=U2LWSuA9ySbC9DCv
	oxBX5bPcUF7vpwb+ebNWmeTDI/8DmP8rIYhSSyMr/L13/5kX3Zjq4feHf/XlD4pS
	/1LdmbKvfDr0LkK4zyy71hJLrSUx96gJm/qXABVc9UNw4U0nx0VnFcVHM3q6ygqR
	J31VkBwr2MRdO9/zJX/BcUWJuQF29nQN/jHrpc95HEYpQrR69IWH+RcxNYa1GmEC
	CASNA1IRQfAakvJrU/ff3iqHKAsQrZ7JDg2ZTeNfEMyfDf4aaBnV2FhfCi8V5DaO
	w2a1xoe6qOcbZRzp38FT+9h88POIqobtecGmuoEmWlHX3mc6Nnn9mNBR/iXBsz6J
	BMH/xA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfjv0w3u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 16:34:02 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cee1ec30f2so11410935ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 09:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790181242; x=1790786042; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=llOjDMEuBFDv+DyQdi/V2z3mxuMuRRhWgPZ4yTvTgrw=;
        b=jAZT0oooBgcDa9O/kLR9M5vCeODvhRctJOpVOlBafLgzIEPIDQNKyXxEOGw8LDIYdg
         M+CDXj6YwUhK6pW06bD966TOH8pFO7xiTw1//YwQOul1Wm4xCvpBPBG69XUHXoSO1LuK
         QR49Jig36y6u8BUCVLc1MxvdDiUMBuK9N9PTwtTjiR/8GU/nxof7VVUg9Rq+rLqMqryA
         +hCXbjXU/9UAsFXKbN4RI5Al8At0b88yGNF21x/HBru4xBijm18nOajJnqdox7G6ddWq
         LH3JHC58un47Aj0DbLedE02/NKEJvODUH8rDAIgE1GJbEaCscKEPdmcxhlHBy18ZJlWy
         jh0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790181242; x=1790786042;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=llOjDMEuBFDv+DyQdi/V2z3mxuMuRRhWgPZ4yTvTgrw=;
        b=L9nFdGxxwZg6Vps6k2XVDSDS8l0Q7ftDH+dj5+tLUrX6vzaxQCS5Kcn4keYm11hzYp
         NPDCy8S7RzFEPmYkEVk3ZeIpYe/mkojixc68VkjbGOlup7iQD18SDXcQwE75whGT7ak2
         v00EZmTtW4vI8o70ISzgag/G/Qx6RAOHtoCJcakVzcd4HQdmIss0+flKIBIS4xaJ5YWS
         CcdxTPjlrMyia3xe/XlE5ym40wLbgACYuMAOOZ4hDt2FVqH4/ftJR5BRYLbmce6KW449
         quYBvkeV51zj6scwQ8ukoDuhDR2YNiCunA3vuipcmG/9K4cyWo77NwWGLX61X0nKGj9g
         X1Rw==
X-Forwarded-Encrypted: i=1; AKwUvByCfI2Lm5fF/aUaLPhL/x3ZhpKj/G7HjpCpEfmOlDg7aSafDdUoMeNoeqp0YPav0p0aWOD5rvZS9UR64SDx@vger.kernel.org
X-Gm-Message-State: AFuF++mcnowf+e4QavxE9Mmmlzh85NDNGPqROBYqBmsxF8aR9aMcCcvL
	zL4UcGTLQZvWKMPGfSufv5Fnee+b9qZ2SwHHEYN03RIbpUb49CFOusEC7veVBlLgiHggzmQERyJ
	eeEBL1wfE2bqpH8etiR4y/k7HK9LOIE2ePSkPZLJdoDMe+8/8mMRXahoaSUedx0o63g8P
X-Gm-Gg: AYBFou39jAGz+WrO7jwm0zAkpaQMMLZKLt5au1sla6G9KKIAWSqB7aoNs5XtEDsw7lr
	VjviWoW5RRSjor6nTlE1UEt6cbJ43x5K0BoQwhclkajzbZWYiGI0LsotV0armsSodASNI9hT+9j
	sg1NlRjfg2GCQt8Qk4dDDiP1XFHSozUVBnDcZM9IaRQG93eATauVraZiAoSeyKu23kX2x9sBIPv
	uoaV2KgvaYoa3gBdmlzphu11h/vaEZKunv1RyHHvnt4t68KyGNvQ4JY6tPojwRCPwdimTjhQxiz
	9fYtDRlw8vAvE0CtTy+uanaXGP9BG5+bph/egMzlXb+WIXprRrFzJQPVMeA2lEvg3UREOShEkV8
	nPxVHocun9zCvstDutI/qyU6LAzc=
X-Received: by 2002:a17:903:2f85:b0:2dd:c053:ec71 with SMTP id d9443c01a7336-2df69dc771dmr26576325ad.36.1790181241888;
        Wed, 23 Sep 2026 09:34:01 -0700 (PDT)
X-Received: by 2002:a17:903:2f85:b0:2dd:c053:ec71 with SMTP id d9443c01a7336-2df69dc771dmr26575935ad.36.1790181241272;
        Wed, 23 Sep 2026 09:34:01 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5a6d35sm13994895ad.19.2026.09.23.09.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 09:34:01 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 22:03:38 +0530
Subject: [PATCH v6 1/4] ASoC: qcom: q6apm: clear g_apm on driver removal
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-vmid-v4-v6-1-3d61a0319b1c@oss.qualcomm.com>
References: <20260923-vmid-v4-v6-0-3d61a0319b1c@oss.qualcomm.com>
In-Reply-To: <20260923-vmid-v4-v6-0-3d61a0319b1c@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: ajay.nandam@oss.qualcomm.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.15.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2NiBTYWx0ZWRfX/UjzcRWr1cj5
 dlSbqGSiT9Z6/+XmSLnC4chnDcgqqBsmUX+AHb/FLCcZtuJrqTDQs7jKX31M8FIE7Ccwp1IEwtk
 kYnh2Kul+ZdWiK4JGHLYnr2zaxDtejgEHx+f2/hHChNqCl5yxft+5/PoVBr/cfwfWlnO/lyAXji
 pz7S4odw0mqL5OMauiPqJW9pYg9ucvyRGo4xsucFOvgpBbwi5uHeAmhVQBWiAGbfMjWo6gkIpnU
 JJmn6Vqb7y+SFYGoTRQ2KwmnOByNG+eaQgFV278IK8VRiDD7ZM61VPKwShweuzQjGB/RA4+JIj9
 BvLagrY/y7WGhqlGuVi6wKKVXT3v64qtVRVuP1hsGGHBT9uab5FbGWV8Pfk0GZN21yWcOTiEUEQ
 7xrAG7tBJ8lgnrkiVgh2sDmQoeoAya4Aui45lUJ6hgir1ON0Qq93ddjme+mKrNFVR2bLNzKKzgL
 G9b477HFWpcZSDdUyjw==
X-Authority-Analysis: v=2.4 cv=aIxlOr9m c=1 sm=1 tr=0 ts=6ab3ff7a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=i9zpEd1wrD5FINdKp7YA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: bVg-RpgiTJqEbOL9GSsC0obbTG1vVdoa
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2NiBTYWx0ZWRfX9Dmej05UNX6E
 /f2bZBcJMhrzuKjXcOY/rE/mHl58hi2zcXATA5ji5JaPgqvoSz468kUtF1Xv4/BNoz6AC+B0hHu
 NXASinMs64+sk0BlzSKVyFNA8+v1M58=
X-Proofpoint-ORIG-GUID: bVg-RpgiTJqEbOL9GSsC0obbTG1vVdoa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230066

The global g_apm pointer is set during apm_probe() but never cleared
in apm_remove(). After the driver is removed the devm-managed struct
q6apm is freed, leaving g_apm dangling. A subsequent call to
q6apm_is_adsp_ready() dereferences the freed pointer.

Clear g_apm in apm_remove() before the component is unregistered so
that q6apm_is_adsp_ready() returns false instead of triggering a
use-after-free.

Fixes: 5477518b8a0e ("ASoC: qdsp6: audioreach: add q6apm support")
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index f167b9dae3fa..eef4b496d2aa 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -900,6 +900,7 @@ static int apm_probe(gpr_device_t *gdev)
 
 static void apm_remove(gpr_device_t *gdev)
 {
+	g_apm = NULL;
 	of_platform_depopulate(&gdev->dev);
 	snd_soc_unregister_component(&gdev->dev);
 }

-- 
2.34.1

