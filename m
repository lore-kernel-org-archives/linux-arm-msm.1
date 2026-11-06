Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793968414;
	b=m+Q8rDc3xxX0cczgnSWvRGqcTY7D+MLy5yno+1xb2yjNePapulK0Way6G2Ld0I/7dniO
	 k6QOu/9VPAyv/0AW0v6AIFARzXSLyastUzLJ+7dYbofsH1g0zIR0mLu83pUkuDMP9lO90
	 cerM/pabP0kmMxFtfLMY/DEHAypB+Y4NNapcI64cFRJF9vslVh7DfQfyJrYor5XIaBQhk
	 FUcq453MlmgSZ12aKFbCZ3L1PL0NMqAdm99RUt1FgbwI457j+s+u0Z7ldqXrJ7/KSItGH
	 hzaT/YvDlMi5SvPQlJG/nY3BpWKwA4qj3kl5S+wAltgN+YrEBhT1iFdw8F4iQ1aDrXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793968414;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4iF+PkaOWNwka3PIa/FYyP93P2CuZ/1cLxIV7q4hNLM=;
	b=CXvBAEDMEbofOlVrydfr088ZIlT55bNlDUK41HZcwx+49nwlKPbIldUogQKFTt3ESybP
	 bZAgLqT4EYz3bWLhItMJ6OpCY/KZdiARYpMcuFFDJBZ23oHoZRJRv6T9F96NX1WsasX6I
	 3w/y8W83xYgBt9DsCrPKCe3a+gwOpOj8IQaXE347QPD3TkKccRlP/bT3bsi+B9hJnf6te
	 Iu79aErwvwFKuLUt0h7rQQm5aTZ1Prk5RIQs8IdOmWLuKqYv25yMq0qpiHcODPbxXUQkC
	 wqe/UzSk24upl95wlE4rGfX01vl3jKQv0iwi7rQCmPv9NQI3BAaIrXOvZxGBiyowBLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SaiyfY6c;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZtVk0OCQ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F75606A33B
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 12:33:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8F75606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SaiyfY6c;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZtVk0OCQ
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6APA3u3645828
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 12:33:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4iF+PkaOWNwka3PIa/FYyP93P2CuZ/1cLxIV7q4hNLM=; b=SaiyfY6coeC0grlK
	2vMGzRo+xVKQuBZK80QW4+Ul9sxRE7y0fo7R18UdEiZ8+WTXWXCyRSDdTerYuoYB
	PkWF9LcdpEdsvDhCMprbEIurD61myC3jWJOi4D0FTTilH5NrIyFuNk/lUm4A3kcE
	+3W8X0+7mVlF8LSoIdfPuA4lhjnxb4LPWo9pripy7JQRUz4V1H7/sYOSJQdiikMg
	9UuxLg48NZbCaG7SZARobueBzi2yni0MgFH0xKk1GoJLBxPAJ/zlHkXzvxX5a/8E
	N6Exs+WSLMz0am8vfMGLDfCviF9H7xTL6eY2hBnRALtLHSvHb2P+JsMyqbMFU1VX
	+9FoMA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa2r6p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 12:33:33 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-341eff9e381so1348907eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 04:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793968412; x=1794573212; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4iF+PkaOWNwka3PIa/FYyP93P2CuZ/1cLxIV7q4hNLM=;
        b=ZtVk0OCQMD/EQeod2JxNj2FBHNqDPYXa+cfn+xP9PkKW6EGLE9Mi8ftV9T9HYQk8sY
         p0zxhDtB1z3wMB9tz0BhFbkQGWY1kysUIxw6z6eTyLfqTfSQj+98eepubHhXqDR+vDq7
         IDvVXUYrgdFY3bqQsSmdjnINvkte4loXRah2VQJoILsVP5AwmmNsJkWMB8h1T2zrefgz
         MBEI0hk1tJFav9MOWiPSeQ4vEurEYEfMXOniUGqq0uAECiZfz6ecfO26WHndfB9uvgjy
         fRqjXkLJNgy9nSbQa/8STaMvipErucoRL+bvbXFBA3PKfRz38M3shsNVeb9UKSdBQHw9
         72Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793968412; x=1794573212;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4iF+PkaOWNwka3PIa/FYyP93P2CuZ/1cLxIV7q4hNLM=;
        b=xHKPy4W7lKu1m7FLKd+dy0bQxBvIn9dYfabwZnqjOKuf5mA/7Qfmy2wJgONL7ikmq/
         srB3lRSU0+XnVpZfOXXOlE2ACiuB2+CtrVI+UliBia9a970PtfanV0UBGOLSgZAQ4I7S
         vmRbJXncKs17yoKi6RccZz0+KI0DBPKCtoK3tFWww/uvGx1P2Gvqa1X0uesxzEUewfsF
         DrFFYieKLIg7Kk6k3mkOzfkGk7+4vCet909sJPHTCxSRd0B5vvytYGruu864ac+nSrPD
         ZC8F3mmcAtP+4Mpe4tYzVwzxfb0g7uS2O1NDt0t6yNGfUEpWJjGRwQzCubl5dYm8Lt0P
         IwQg==
X-Forwarded-Encrypted: i=1; AL+hErHvKyPdAEdh/FbnjZgxb4MwQQHzuvr7JiaYrnjRcQ66JpRnQkm6CKMGqGS8eurkz6fnNPCRJ894HT5jNIEh@vger.kernel.org
X-Gm-Message-State: APuU4Z9fpsw3x9dvz0iWPCbp3oG2FVZbCqvEZTaEsfnq3EHoXOnsi2NI
	VC2PeojgSm8Za4Y4wVi4PteH+KxyAVIc+FY8KmnvbYUEkFuV3rgcVbawbpXxNYkXgkWoVXvyzlO
	kpaCJGzeoiHktSidIXycKhPpywT5gUu3ICMmBwzDbQ4juZEzuYHTTER8SHArO/yg2CSCJ
X-Gm-Gg: AYBFou1jVxPlFwOG2jbk7fCZiezCFZyBlTsBglYu287cC0OvD3VokjLPMqola+rzKyt
	cQ8Jh0hkh0C9+AMlbk43HyEKJfTup2X8cs8IcHv6LCl8dVFZpNLGQI6Zch9K0fhXCEmYHd8Ueo5
	WnIfTLR1qbFNAJ/N1YAlXSyLb/DxOchPLNYWQ/WJqP5LuuJuEE+E1pNG+ek7oLYiTFpKCpWVwyh
	vlK+Gx4ohZ/nG2HecetNhhZ0u5O0KbTD0mKdMBqoNF5FkMD1qUocucJRy9KjIgN0YA4LaxOMV6T
	/SJRd6nkNJLrpK+DkoWAX//GdV3KpU7dREa3tNBXo7VfKnJTjpGlEm1xmwFQkM4Nc52A/5Nt2P/
	I/RYCeOQu47cC29RICB4ZpY117UtIFq2fVDwZnWzYbaV/7o0Wu1uxVVAk/6bWaH0s1KWXs1keAZ
	xOB7KhOsk0
X-Received: by 2002:a05:7300:3e97:b0:36d:9900:bb92 with SMTP id 5a478bee46e88-36f75254a98mr2940121eec.10.1793968412272;
        Fri, 06 Nov 2026 04:33:32 -0800 (PST)
X-Received: by 2002:a05:7300:3e97:b0:36d:9900:bb92 with SMTP id 5a478bee46e88-36f75254a98mr2940078eec.10.1793968411733;
        Fri, 06 Nov 2026 04:33:31 -0800 (PST)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faa4b8aacsm6514804eec.23.2026.11.06.04.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 04:33:31 -0800 (PST)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 18:03:01 +0530
Subject: [PATCH v6 v6 2/9] ASoC: qcom: lpass-macro-common: Add missing v2.9
 version string
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-add_shikra_support-v6-2-2cda302237cc@oss.qualcomm.com>
References: <20261106-add_shikra_support-v6-0-2cda302237cc@oss.qualcomm.com>
In-Reply-To: <20261106-add_shikra_support-v6-0-2cda302237cc@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793968394; l=1038;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=N+hLPxTgejZRAB42bRC6ExNtrEIYfRCVRfd5P/YRASU=;
 b=+YQw4Ncu42wXGT//Nl8iiC0J3w5HLLx8E0Sm3l1OcNUNdDoQ4nJd+Z9FRn0IIvnYETfqAgZ/5
 bZlKqEgro1XCnola6Eiz8L1SerpSFk32JOW1OeJb+zSwBRl1srGGoPN
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Authority-Analysis: v=2.4 cv=PLeaavqC c=1 sm=1 tr=0 ts=6aedc91d cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=nrwinYagBEXx2xsFsuYA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA0OSBTYWx0ZWRfX0mIK5f+fsuo1
 X1quWTWvk1BcB//MRCXIuPIx0T1GVCNyhQ0U47wy6BAyiwIP2lX0nSDDW8BBXng44zYegXWBrAJ
 9DlK9i+n6QjBzbqO4ZKxsXIa0xmjhdo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA0OSBTYWx0ZWRfX0pdi4ksatL5u
 aHPRFbSgM0HPfyB0lrpQ5HoSFBVLaducUEyJaN4ze3xfoadEQhIoT46E9QLiowNoAvuwlasvdC8
 4JIyfRy2bMUk6ULvz0wij0I0dmiryT7WG0ILxXH+cm/niCtM4zvhvVghGWE1N8Ex2EqTXMpLBgJ
 JDXADPn76CDBxFHz0LfFg+29GKAQcLwoAx+9DjQrzG91w0fyM7/72k6xLcerMahW9xC6fzqyrsu
 rORVi/4oh0aVrBaWbeHh2fCluUIk9Ndew8P/LjV+nOcRtgMFPdX97/EL1RSvhoSnhXvpw3v6pCA
 9Hun3ohOLT+iTzrlg3qTnJL8qqswX0CMAuG7nNWqj1JbEvHRoi62mdhrChyXxl5tfRPvdjUVYce
 lo3VeZw3Jlv5xtNCEJtVgs4rkRCrONpJoaGdgcJJnYVqMrnG78xmgruSFzYHXQzA9i0JF8esuYS
 NdG2AZyZkGYl9fTm6IA==
X-Proofpoint-GUID: 31JWYNwPZKzwVMwrGhEmCH8nnUyQLKYT
X-Proofpoint-ORIG-GUID: 31JWYNwPZKzwVMwrGhEmCH8nnUyQLKYT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060049

LPASS_CODEC_VERSION_2_9 is detected by lpass-va-macro.c and consumed by
lpass-wsa-macro.c, but lpass_macro_get_codec_version_string() never
learned about it, so the probe log reports "LPASS Codec Version NA" on
those parts.

Add the missing case.

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
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

