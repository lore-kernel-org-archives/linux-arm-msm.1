Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794234094;
	b=pokkxT2XV4eeJNMQuuIwBjq06urKmtBxDrs3eHG5sKFj39M+OC8QmRY2GTjIIhnpMiuc
	 bJQur7bKWvUn1iZGhD1cSq4e30JG2Du33wGwemwsq1DJ1BODfJTJFDJyJ5Gy8E18oL2SS
	 yEEkbyrRKDXIXfdJAv47ihGEy07KZnvJoGnwnsy5nebUqewNQfIKAL4mWpyEkBdvnNXuE
	 SFupwH0oVJf6fi44j6RLffNUdXV6wwCL8Zk9CkhYgtcShwV5c54veYSCSSd9PM09DCvwm
	 hBfAXJVRj+bMJXvKtmYe8OVLS4TVKO+JWdFW1jLk+m1ngeKuIO/ZMjMdAaTVmCnzsEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794234094;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lfoXwA9UTdoZzNFdOqsicYhSJ5ry/Efkki2NBM8m1i8=;
	b=LyGiYU3WZX71WmirNzuMgciuqX0+/EAzhdMKftZXdzOrxu81w+IAp6TFvs/+aEm5ycYF
	 eYSLyUx4CVrQCPEhZVZGVHCRewnUwDxfAoju3FemZVPDNM8I231n0K2ulgJ3o/7joVDHn
	 ZGOMoG6PLZLmixwMe6zEdT+yjv9KOU7e2L0QBmP6T5bwwncTLaPoBnbDddYK5HkR6KAwe
	 TLhxAY2rIVoAI1oVPrJ3LU4zpxACNJlTaE4zZxy5/rhh5sDvmCBT9m4JBq8/BD5H1Bmgy
	 r9Lv5pzJoBbCpga4xWeNHo2LVpTi434ptgySsXgGmYVk4CPtlW1ayfCdezSI89/i+NA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="GxlfGPQ/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aiMYlRtL;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C39B6082BC3
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 14:21:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C39B6082BC3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GxlfGPQ/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aiMYlRtL
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DFKiJ971492
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 14:21:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lfoXwA9UTdo
	ZzNFdOqsicYhSJ5ry/Efkki2NBM8m1i8=; b=GxlfGPQ/B0QTgJj+VxKJcPcr+GV
	ruR9j7k+NIZsuS3xdRIU3n+/H9EMBDzt33oxJkVADO7KBEkvm0LS8Xpa6WTrYdWD
	A17luVLRTqgTGeSUiVuO/Whtnub7FZsFIuCDfL4Zoc01Ln9MND75uZ7iut8IQnm2
	ZJFj1us+OUNAjDUjskVU+u2AJZLemvDaGN7u135dUcymBLa3VBquGhLfa0J+Iv9J
	X2qRpHf7f1wzkV/tKl/9wbF9tAw7VdgwFjMG+cDi0tZ+w1FIpZNSRwBzEC67bpbU
	nI20nFw4YrjUwCxzNt9NrShg55EAnvwp2d3Wuh4Kzo5jbyEyxXnUfkZIf7w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4htuqm3h4m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 14:21:32 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e9d52f684fso9968475ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 06:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794234092; x=1794838892; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lfoXwA9UTdoZzNFdOqsicYhSJ5ry/Efkki2NBM8m1i8=;
        b=aiMYlRtLUrcNdlklgHiR4NBTVEe3FaawU1KgESm8HHL2QySBRiF2jJ3kcYPN4DHxrv
         WUei8CHk4d2LqvsbpqjTB5cq0uzvCx4F1UAAFxVMU/tqQFYqHXvyVd05HR6/wWKHDrJ5
         XFRif0fqOrSCLMC87Adnw7ubeX758R4pmtjIQE7PZzxQtM28cB6ax1PkpY08S/XQRqoK
         cn3lKtzaqWodQ4twMFe4rCuMAEYL/EGiaHKr2C5ZdLE/4VYA4eW2y19My8Jhln9HdQMD
         6kStTGyuvJecaKUm33G6ulfZGttn6GQCY7CwpXnAzRhrPxWK63Ewq/TEF7h35WcBYbc1
         XdTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794234092; x=1794838892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lfoXwA9UTdoZzNFdOqsicYhSJ5ry/Efkki2NBM8m1i8=;
        b=h1YJmmyP2EfsMfs/Hz2QnFcaPUCaf7pmTMxN7yGXt07QbrJpVUntKipiShkehr386U
         usWoFjNBdV+WZvF4HniDFf77+eCfNha5OBAO7wQVJs2ZND9pjorCQ2DaMFB7B8sTfcaw
         81TaELSdJC2APpcMUVqQnU4sxeUlzxEeJmRBnSCdSXNgkSYAm5jtpvapUqfu2Ky52YLR
         Rnd7nmK4mxtl3XadulKqEIgmh54fdpxUqg+ZeRA8LiartkGy+HL8cbAqLIjmgRd3HOR+
         1O/faPm0qntFcyvE7SUtTLN+de21RosT7MH6eVOmZRaB/YW08fD48pOVtfysttcMsN15
         4UYg==
X-Gm-Message-State: APuU4Z+Ntlp53HdJG2xOvLhXSDai6j5UmQMp+pQsjrigfsji6pAi3ayd
	pDPU79srxzQoFTEMKY1kSkGSaixYJe3QQEs08nQrXNlOGB+Ulvogkn17N/EjKlBleZoUMx0QcQr
	JhH9g9m5Jsyk/mFqNa4V+d3dLNLqqd86OJ62R7Af2ODKdKCEcsmweaa+Rb4/mJO6Ne85S
X-Gm-Gg: AYBFou38feRLElhdR3KzgSrrEJwl53pZhlxTcrNE5DqaIijX9lLlKama7t+/5nXhJKD
	x894mCocZ3nhIP/nL1VbbSJLWHjJN5pf9TfQitTzLFM/CaFZl7uXqBj/Koxn68PUj2w14npYNGj
	WUU9AXWHFYjy866ujj22s02ygMPCBfN27T7rlsnRq3dl5RJ4o/NhnQI3EaTDiqULhzRX0HTyES9
	MVXzDvsQrfcQnx4UAVI+w5a9ePQv5tfJyYz5JvLg7d3wdEXeP3Fvg9J7HNKL6u37sLuzzSvJvdE
	/ThzLTImfL3KOKvXmX6yjh9vDXSUqlH7zDG5DGMaeNF90sZq0uuLZFNW5i6xUoRlM8l7fpcd1bR
	FbuZPcT6EQyz/9LQ4T5Hp7GJ5pzRG8jS2UGgveaSF8HYK1EOFDE5YShyEg8TxbndR8d7CU61k+/
	gegi18aeH3fwmXoB8vhJMZeSaFaIJdFhDj13IHvRicOfXgM7CEz6IETDZptoKKYA==
X-Received: by 2002:a17:902:e810:b0:2db:733c:fd1f with SMTP id d9443c01a7336-2ed833c44dfmr41961035ad.8.1794234091982;
        Mon, 09 Nov 2026 06:21:31 -0800 (PST)
X-Received: by 2002:a17:902:e810:b0:2db:733c:fd1f with SMTP id d9443c01a7336-2ed833c44dfmr41960585ad.8.1794234091496;
        Mon, 09 Nov 2026 06:21:31 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed81600ac0sm12128725ad.32.2026.11.09.06.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 06:21:31 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Nico Angelo Dela Cruz <nicoangelodelacruz@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v8 09/15] drm/msm/adreno: add temporary __maybe_unused
Date: Mon,  9 Nov 2026 06:19:55 -0800
Message-ID: <20261109142111.256630-10-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109142111.256630-1-robin.clark@oss.qualcomm.com>
References: <20261109142111.256630-1-robin.clark@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1NyBTYWx0ZWRfX+sufU3eEzYvQ
 c7vYdqWe1jLc3kzNUWxyjWXQlS3Tn/K8J69ZB5q7qu3IRSTJJYpw8FhmUj+MD0iUcnelz+Kqles
 a1tL+D/D2rxJr1kGD9bhRo2jjy3iNhU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1NyBTYWx0ZWRfX8eKEG7FwocCd
 tIIQrIfEt1OjhXCPI8xXkjjkLkBG3BdD1F0xBamMBCE22zSQI+LReBGkHzG3AUPmOKpif+rTqIa
 aVgPl1tdP8P5XuKLUqOMIPrdc3N6n2kmiQXcTi25hjAJ8jB/JIH3zOHc5rKLBvCD4ijISq/0yCw
 1JmtJyr66WUeeoc7KTkWTr6I67lJuqazaghl5/dwASuTuF8lyUYcylaJpYifqMW68ywuAGC5O74
 RJfNi0FRSxRTLKaWjzhibIYNRp7lfFov30qZmQwbn6SN8RLBzkCOTkDCLnqKuveBIHwtAaEnSZQ
 vdDsLonbKJt46loCbAvtWDay0ZE8I4S71N1HNh35PxiyB8R2LxKqc8rVrnQHYT6iCf9xhfn1dJf
 aTiK4pyyU0TDreygvgL0EzmMXxSYXLDtqvf+KncfD06dOOq1CKYynJwzHAmsGcVwrS09RSjBMl7
 AWZRpl20pwmvjRafRPg==
X-Authority-Analysis: v=2.4 cv=JLquIMKb c=1 sm=1 tr=0 ts=6af1d6ec cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=5VHPQfPT90DSkkNPp7MA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: 6ViRkDoXNzrnxlbShF_CJhWj1Kq-IB1L
X-Proofpoint-ORIG-GUID: 6ViRkDoXNzrnxlbShF_CJhWj1Kq-IB1L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090057

To keep this series bisectable.  This will be removed once there maybe-
unused protect tables are gone.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 9e0d37ec9c15..2408adfeeb23 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -168,7 +168,7 @@ struct adreno_protect {
 };
 
 #define DECLARE_ADRENO_PROTECT(name, __count_max)	\
-static const struct adreno_protect name = {		\
+static const struct adreno_protect name __maybe_unused = {		\
 	.regs = name ## _regs,				\
 	.count = ARRAY_SIZE(name ## _regs),		\
 	.count_max = __count_max,			\
-- 
2.56.0

