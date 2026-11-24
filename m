Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795517863;
	b=fx9nL49/4R1Zl8QkXzJxfKvBTPfobtKccuyvNcyYu7DY1zjAlqNn6K3j7oeC22p0FC0c
	 Wd7wNeNPvv9Dp17dAIW4yvOT+TNOhrALh1wps4HCm7prTDRh9DNL57DqBNQ1eRcTI+4kB
	 YWu6sHuVqsTzoAN8h5lZrme0SdvGFr9Ib/tzV8nUZxHVwGV+zMq94lZBCffi2zX/tCsl3
	 I/ui39rJme0vbYu2efpUDQ04FL5fJVW66D+b+E1p3H97Q2bUiW2yObFIB8YReCHRBsKpT
	 HLBlUJUJ/weFW9eUHknEYSuuGSjugpETT0ONnB/Oie+QXMB8eVbF5CfXH0WncSLA/8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795517863;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pMm5C+6m+dqtRJM0hj53gmIHOtmjDMO4GWXIMwBO54U=;
	b=5a2Ma3UuCaCNDVYC05m83lRWNtvGNaKXkoW9um782Ct+f+9MeQcqpLiQ3VSv728Nr422
	 W+wwTggJUTfEygPx/Dm5PrFy7Ui/o6ka/eX2DApcT5WQ3Ly6TTtulcaAn64ee/9I2CRIE
	 Bd9J5k2TOUrHSfOugKVmc5tUw2JnvDu1xuYCTV2PLN1swTKD/dyzGG1Zx/8eAozPUHCne
	 38b3cpQjcc3OgnbMi2DhToq7lm4b7UZvtV5Q2KLYGrC4YR4uzFV3E+9y/AOn2XYG4/Fem
	 z1VnJGwt54Fm8nLKRZJ8UjsJOzYgsZBz4u2S7hnaOvRuShnUJnr5o1Urjsc05sfx+9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fv+hPwVF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JfqILFKT;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571A6606A68D
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 10:57:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 571A6606A68D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fv+hPwVF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JfqILFKT
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAuSkO120218
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 10:57:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pMm5C+6m+dqtRJM0hj53gmIHOtmjDMO4GWXIMwBO54U=; b=fv+hPwVFsRVCqLcz
	IAcbNAoo2HKXDnyKmCNtqbuBY0XoM9GhCzq60iZzie68Qt7XgjuwMen0X+G/8rek
	qRDaZGeWGJgHQSZgE+5y9DZEHjo4G09q5Flm/jM9aRYYnXBJZpn4p4GykxXrGRiY
	QK0SNKNSMENXJ/2HQqbUGjZpUehJ2HR9UWuuYIHFnJMwXikk45yVn5AZovl29rEd
	9WlWIFDKxnviiaACWpot+I1sSAfp3L+bYX2Wbyc7tMPg9HM8zZkWK/QSvnx/Lo24
	MvaK1f2y2gpU1PiF7CWdfP6e7ywvtx0grZQb0sFF4/cKR1P7hLA/rwsQCHtnihR9
	sa8I6A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4x8f2nua-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 10:57:42 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-949dc497896so252105785a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 02:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795517862; x=1796122662; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pMm5C+6m+dqtRJM0hj53gmIHOtmjDMO4GWXIMwBO54U=;
        b=JfqILFKTiPAtykCece/2GNT1G4DtiNpxjn/fVvXg2Aim/T4FbQab2eWmz/prGsMUSo
         3cyb7kKnBZyoeYqBDSRdt60fVKfGadbubjT7/NTF/RVS64KwQE7+ud5By0SpIhFjWckZ
         nbBQ31EwxaayYMywqOg5LZ6xZx07CKgKuO68nz4l2FjuGNZxNNDKgM9sfw77uQdCRPGU
         HYwmxblip8t1ezXoZnSBUyrNIVaX7Oe6u24JHMNLnV2OiyXPIfPe80WNH7/rNDkOrHZ5
         alDy9w8sbUZXC0A4vJXMg8CsjuSpaDzAhiVWZstftvafwo4LO3gBQ13/D1aPZCrIY6L+
         0oRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795517862; x=1796122662;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pMm5C+6m+dqtRJM0hj53gmIHOtmjDMO4GWXIMwBO54U=;
        b=dog0eZBPg3Nakk5A8A22IkbXc5KQY/GYK+S79B+5X4E8LhfJ+bLYFMmlgEv5lFWuZA
         7Pb9qVtwyURPWCaRnTbZGiMgenT9isOu5usPvBhK/seFQ7RA9W/RfKaePfPwxmMGXfY9
         h1NNozA/NgSu+ZTzsuFeSlEibo+YbComflHgZnjjBLPySNc70IW60mA7ZJbvYv7T+ciJ
         cibATCnCH3q8X6LgBj/l+mpX9dJCABfuhI86AVzGAocuMDha7h5/c/Jht7LuDKRVJk+X
         Surj1gZZ7RGwgkuKVWgn5JANaqQxMAeM8DZX1BW0UQG8UvSIVr1KCw4TuQQWjCIjMHna
         n2LA==
X-Forwarded-Encrypted: i=1; AL+hErF8FJr4+IDbB8NrivGryJV4GuWF0wSn8HzJGJb6mq7aCn3JBqMV9Nuc4TuGsNe01rgEBk60tkmvu+8b1Nj/@vger.kernel.org
X-Gm-Message-State: APuU4Z8QFka4yq088dLBBWjqioZ0ZxLk0xn9/zO8kDqrPjFvgeVEMtLH
	11Nwgh0j5Lh1dBQ4S+7IqxYGdRxC6NfnaJumvMFQCyquxMMI4WqaV01/Ueq2qKr3wbWaJxbkN1s
	shPT/XDNhXW41h0P8lo6UyJcphb4B8FsohykuAq/JfrZsPcZbE6XUOT8s/0wD5EXG4NnZ
X-Gm-Gg: AZFdTZdot8HVTIqJYuq9kU1g7GTmI+zEjoptybgV1HB12NQV/vUfx29pi7r0AbRgEq2
	fzyi4hIEOwgzsun43nWE5ETyW912sZpQH79LDq7bKcNAZdpH4lpq8eFIQkOcu9yYCaamld68f6P
	hhhFaIviPkKSEX/fGLlp06etPsDu+Xu4eVG2Azz7uqnLCTWwS2UPsQwxfVVujtAAcmFjU9DJEqj
	XUOtwsywjTyIl8645P49OhrbCxEeJPCO65N1XMDDZz9A/7fN17FQVnckQFuwXcf5eKujdjJDIqU
	EduJlSxoNmmS2Aan035NI5cx76vOQRZ9J5twOXV6B1rKcGXkUh0OvZpKmlr3tysp2dPofon9UDA
	FuODpLJJd89J+FUNzh15R02iG2Hc86oFx5KBWsg6gZj6JYm+szWaf48vl
X-Received: by 2002:a05:620a:4056:b0:949:7893:397d with SMTP id af79cd13be357-949ba9b8ccdmr2710098585a.23.1795517861633;
        Tue, 24 Nov 2026 02:57:41 -0800 (PST)
X-Received: by 2002:a05:620a:4056:b0:949:7893:397d with SMTP id af79cd13be357-949ba9b8ccdmr2710094885a.23.1795517860980;
        Tue, 24 Nov 2026 02:57:40 -0800 (PST)
Received: from [127.0.1.1] ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm612415085e9.11.2026.11.24.02.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:57:40 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 12:57:23 +0200
Subject: [PATCH v4 2/4] ALSA: pcm: Report writable chmap controls as
 variable
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
Message-Id: <20261124-b4-sound-qcom-x1e80100-allow-ucm-channel-map-v4-2-1197ac8eacd2@oss.qualcomm.com>
References: <20261124-b4-sound-qcom-x1e80100-allow-ucm-channel-map-v4-0-1197ac8eacd2@oss.qualcomm.com>
In-Reply-To: <20261124-b4-sound-qcom-x1e80100-allow-ucm-channel-map-v4-0-1197ac8eacd2@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1580;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=ric+pGuXgkY67TTKo3amOZ0wmL5auh8AHkx7rZk/1VM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBrBW2drfmuTZfjC4r6uwFV5T0RDMhequAw6Stv3
 +Cm6Hv8TzyJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCawVtnQAKCRAbX0TJAJUV
 VhJBD/oCJSyiFk27dHBL/2jIxT7m3txNdZHwVFYVCXN0xfU1ZOjUbsSHaoiro2CKwQwE/CxGXvM
 ZsAtrbd7ZD+mMW78C8W0gWRlO8XYrwyxpsvQprGUVomsI+m52sNlR+0dU4K9HJ/be5v+/x94FZj
 uaMn12msga30+BpQRMfwb36JqlLC5h3vsIKNSzfBRWTOvAkfrbglI416tD4ggcKOEgGSQwHPfkf
 Mx/h7GuLzrv+yJVtuEGqrwl9VTd8DydJWbsTsswrK3qdDF3xWiJZD4q00DukCp6uaE0YnKU1dWB
 VNLSffCYKlyt1KFWeQb6l0ZL/NogFazutmkF0f+Fr1rw4fAQtosX/Rs11kdsRC1rOQhLhJUMe19
 G+vUIFD3g3cqbJugbLIJzeZanjqLipwLqctRNOGHslEl0Wy9xVa+OaQKaKUq+uThYawUYcn8fyh
 ewm547lzQptxF/VIRcpQHYaE1mPe5dkVu6LXuCrPAenoIg7TRCw5WoyMdWPrsQQOszkrDsz/AMu
 K2zqUqBcJByume1F188ghpNZp+a3yWxFSD5KO0YVEppanunMJaFFgVSsM8QmL2cCzkixS//SYrz
 ff5aByPC113kfHS9Ra1NDqKR16HPDT4wDDWTRYesN43fJ9g299Y5ItrmaaER+2BZBWHJDAkZrma
 5IeObS3IBywkPzQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfX3EA0KTlLnaG6
 DosRbuPs4rTliMCZCMx03itReU3WnvKOBtfezDv7SBEAMmymWFkjvVqUgQy7LDo0k7Y5XblVQAB
 HUu0gjd88BAJIMoElUH/+aPolQwl2YU=
X-Authority-Analysis: v=2.4 cv=JbgpPkKV c=1 sm=1 tr=0 ts=6b056da6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ukOy2RhdxH-JRRExvroA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 7MP2a0PFpM5Ethay2AHBXuXdNkjZkLe0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfX9fs+vQe5o1Xp
 ES08W/qQ/XXV2Ba6qjty9spZIC6j/zWFJC+yzSqJCrUyFqynC3SZ+fVEudjnqUeXyM2qi+aB7jN
 LyGqvnXkBPuVqUfRrUWLc57PTlNh8pxKG7Zr6a+SaH+0DK21m8ipiGRQw8G3BhHsGVQE/1X9sfG
 1AWRDurlH7fqv4OTo6LNTddQXwgaK9kRbs5t80Acjj2SN0jk1Dki5PlXJCndMjBdWCCarK+2E5Z
 Pevk+dGD0ObtBfDFg0iOvq0GZ5zgaaacYNcZ6+7OoOhneEBXptgRD3SaSyQWkgqtCBNei38vRXp
 CP7SmT+6UigaqNhETSgVJOCjOdbwVAb5em0OAz+3d+UrllaJEG+u3tgDUJ7AbcFtrQDWUpdmE82
 pRzVNWde74Lunfb1aZUWq1S4eTvYMqdBEQVTYTVxeAZCA1NoFBshPiceXy2UApffuMbBVbBRreP
 gUcP7HYU5FI/0QFG2Tg==
X-Proofpoint-ORIG-GUID: 7MP2a0PFpM5Ethay2AHBXuXdNkjZkLe0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240042

The chmap control TLV always describes the maps as
SNDRV_CTL_TLVT_CHMAP_FIXED, which tells userspace the channel order
cannot be changed.

A chmap control that accepts writes exists precisely so userspace can
reorder the channels. Report such maps as SNDRV_CTL_TLVT_CHMAP_VAR,
so tools like alsa-lib expose the map as freely swappable.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 sound/core/pcm_lib.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
index 6806b1d258f2..219d506fdac2 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -2539,11 +2539,15 @@ static int pcm_chmap_ctl_tlv(struct snd_kcontrol *kcontrol, int op_flag,
 {
 	struct snd_pcm_chmap *info = snd_kcontrol_chip(kcontrol);
 	const struct snd_pcm_chmap_elem *map;
+	unsigned int tlv_type = SNDRV_CTL_TLVT_CHMAP_FIXED;
 	unsigned int __user *dst;
 	int c, count = 0;
 
 	if (!info->chmap)
 		return -EINVAL;
+	/* A writable control allows userspace to reorder the channels */
+	if (kcontrol->vd[0].access & SNDRV_CTL_ELEM_ACCESS_WRITE)
+		tlv_type = SNDRV_CTL_TLVT_CHMAP_VAR;
 	if (size < 8)
 		return -ENOMEM;
 	if (put_user(SNDRV_CTL_TLVT_CONTAINER, tlv))
@@ -2556,7 +2560,7 @@ static int pcm_chmap_ctl_tlv(struct snd_kcontrol *kcontrol, int op_flag,
 			continue;
 		if (size < 8)
 			return -ENOMEM;
-		if (put_user(SNDRV_CTL_TLVT_CHMAP_FIXED, dst) ||
+		if (put_user(tlv_type, dst) ||
 		    put_user(chs_bytes, dst + 1))
 			return -EFAULT;
 		dst += 2;

-- 
2.54.0

