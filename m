Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792582352;
	b=r14eMpZN6Z4Yn7OQSEsvORlUPNhFnVJiG0R/A2tpO8Lx3bgChEYY/8yKshD3l7rbS8bz
	 CsTDcewgz4aTJAZhNDU78gVEVXOdYdwua5PnBA2rGMl1dAXKAd3wTxlRJjUYXa3y6nRjs
	 DdfLArhZEds5MwiCSZOKLCfJW4pt6p+aBoMSnKZM7vAlcqttJAYTQVu+9qvIdbS3Fg4yO
	 whPae7hxgQZ6lUGXeK4+3wrsUNRT2llVOojO8B/pxq++W2ArjtrW2hio1He7oFrpJ4o2n
	 J+8y2trvt1zk9rOa2c1LQgCK6bLsRYbvolSFN+pkyyS6Fu4e8QNwo24btSrjwSK4yMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792582352;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4bn9+rLi7mMU4unxZrBwSU21TRh2XBO4KfFG2d5PF1A=;
	b=NFQHXjHmk3RvordUWlOsS0tFJZl/sm4MGrFbqq3ZTXIHF3h3pYSSMVcv0cDeC4cus3QW
	 M9xfEFBn+h5uCDmDFAjrkHKrkQNhPN0UVYHWOwBreZ5xo1n/EIuflgJwV2B1dJeBwEKnk
	 Z8xkIHp/Du5Fjf+LPxyUXvFSvVHhbemNCLJ1cKBYzjquZgQbFaT2RYwiqXf1qnuKCvZKR
	 i6avSwcE/Fv49r3/spfxQ3wMVzrPYZ4hpYP1Uy8GWSkWJCfW5s+0AISFa/fOGrxSsoqB4
	 C7VtFpDECpHYXu88F3RmoJtcsrc9XGAI9EdsUOdEsEAWw3sJ1Md3kqFpwUaEGytecVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l8RcDq9l;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BX8vv8eG;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1FE1606A31E
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 11:32:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1FE1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l8RcDq9l;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BX8vv8eG
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA69Kk117878
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 11:32:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4bn9+rLi7mMU4unxZrBwSU21TRh2XBO4KfFG2d5PF1A=; b=l8RcDq9l3hlmBKdH
	rHQYwc1NxJzwU37rKeIVvtCVpG8tsm7/8m+fWL+7YJUxZ6Vz3+cd8wWCQAS9o3c5
	UdJdmH9FKwP5kfwIwPl+6MWhFnTlVJPaPtLBL7lNfsIAWyL75d8BjyW6+oSjkyUJ
	ts9zKlfWRcQohLZIuyF4Kv2BswJmjxVnnHcFvKZONBDwYAAPXPzEQlklVjDT1vn6
	Pb+hBCG0A9MkIXgbz/Mn7vUDpELVFnNAi4axkd37MCHC/jFgEMY8ILSzysAg/KqK
	Fd+dyBGog6MJCbZC6DMF7dy2OC4ssqVHtW3J9pskxoTBWqBA/VRpeZn2rAqlwH9F
	yNqkLA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9v3qqg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 11:32:20 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7cc781089b9so11753137.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 04:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792582340; x=1793187140; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4bn9+rLi7mMU4unxZrBwSU21TRh2XBO4KfFG2d5PF1A=;
        b=BX8vv8eG8yWLU8t59zgLyYucAfauxQu/MVcVqHl2vpjylDXahr3wVfRZ06iW+ZRxJ3
         6CWxW+zygFXhtz6Mo0HWMDW+qYuhan67+2XfnOIsCx/eUxFo18/ZCv+mTDIQ0lL78nCf
         ++Gp8KseVbLeJnMZiTP7oxohYQkVXc5YCsp2OoqoAQSarSBiwktZdIoH/MH5YUGiitZX
         8/W+EWcAT/xerh2c5R29x+CvH/LUYiyJ5lNIPfZuo3L3Ekkobw48/y5UYm4d+tcnW06k
         vUqZiN9eCLUnPXAJyNP7twozyjkXKQr4Bm8pDd9pRWFxA4FXR7vOku5T6bbHptlJ3J/k
         Y1yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792582340; x=1793187140;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4bn9+rLi7mMU4unxZrBwSU21TRh2XBO4KfFG2d5PF1A=;
        b=NU31Rqt4lUxMmOodGKDIK9kZk5XcR6T02rDF31PvKaqMmrtJXcoAzzVBRphlT/thy8
         gmbUpwNTClLtxfD7PL1upHiPSJeqR7lw4Ytc6+9NbMHT3qJ8rKnlYG4Rp1rXmyHImAq5
         NqHlHpin1gWC/trwsafv+vahedmMxFaN6X65MPWZ8ErZJWUll0doilrertJ78mfgMo0u
         W0hwxzN8/PHrOH/8CI/m4qgMrgDh1R3A9+UYMYO+m2aQk0u3wLVQme6SQwmv0XToe1Ya
         IkOHEyRq4VAmOVbgIG8PA7bhEcYZA6wMRRaUBGbC5KskctxekMLaqy5Auo4hW5rWmV+h
         7F/A==
X-Forwarded-Encrypted: i=1; AKwUvBxIevAOsEmRcq5RSN3LQHoQ5SwKGGXDFGe6vypjCYozohQ/75XSwkk2K0X1P0cX3i+Vm7l+GcFJwetUBNxl@vger.kernel.org
X-Gm-Message-State: AFq9FYLMZpN86w9qBW5aX52Tn9zgenRUVyqZ9UYp6BRFk6/NsrjQWfOh
	GG1AIAyfOqXv4vgAh5m3K4OYYaIP20dKrhEzFAIq0H+MwNbEQUdokMnOJZ/4I1zkx8u3dM04++R
	nCl5YmtOFMcDaSOIJu9+4IYwsHI+ITwqY+whoCI2azrgCS+JlLjQnY4ParYwQZ4XQ6anY
X-Gm-Gg: AYBFou1gvVEaLBG968CUwn1D6ATL71cpwypHX8p7pZXSMUjopv2zOt0zaWmvOLGO4Qf
	zC+AKIc2UyZ4zOKW4NkhkUtNEhTlHjSld+HY1D+QVoGc5JMwglBdY7tjhA3AGtEPmQjkwvUebGN
	l/60adldCtOfc77ptYfIIJZpywnPmnqah6yP2aJ+7XFrKzloWfVhJcLv6ykhfDJVyZX3xvRViXI
	C/5m0/jWCSA9wLuo5bHHMoBUBK1GBy+ab8+0dcby5cYR7G8Saf3Z+3JOEYqm86EKoQB7VsdIY4E
	O1KJTtmtk4jmmfQ/mlAPXHLjOfBPmohRD65aIC/ZEmkgvw0WUO2mtEb+rAPhXOSA8kp/F7srvL+
	aN0zy89rnxiXnCyqkq6EigA==
X-Received: by 2002:a05:6102:1626:b0:7cb:fef7:3763 with SMTP id ada2fe7eead31-7cc92623e94mr467074137.3.1792582339599;
        Wed, 21 Oct 2026 04:32:19 -0700 (PDT)
X-Received: by 2002:a05:6102:1626:b0:7cb:fef7:3763 with SMTP id ada2fe7eead31-7cc92623e94mr467038137.3.1792582339070;
        Wed, 21 Oct 2026 04:32:19 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4678fafd25sm67887866b.47.2026.10.21.04.32.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 04:32:18 -0700 (PDT)
Message-ID: <ce3f58f7-f500-49f8-89cd-611d8e1ac6ac@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 13:32:13 +0200
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] Migrate PAS clients to qcom_mdt_pas_load() and
 qcom_pas_prepare_and_auth_reset()
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org
References: <20260925155737.4161358-1-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260925155737.4161358-1-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0NSBTYWx0ZWRfXyctOLm80JMVS
 B8lbMneYZFYlT3apYdHwYKgGLp7diUW/NDAa7T08mM0oaQ0GLcz7K0WU+EpMSD7xuVR2eL3Mf2/
 457yM7+qL8Dd0Ts3uh21m0p4gXoyD2c=
X-Proofpoint-ORIG-GUID: jsLswiOcjCxKLcjG8c_zz17P6tp0LyXy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0NSBTYWx0ZWRfX7u82hdZcqAsn
 UQ/RgSQ25xA//sPKotFZ6H8l8zuUfLeuQ0+naHUEsZGy5/yzfQ1tANZnkqE1S7UH72gfrjqLcuw
 WAyWcqnKbFKoLcVIeL1o521hSiRWxt/poTmyPxYjPp9NYSUJGi3XkHp8YYhwDipnKvD+aDnEl3i
 Z5SvYT3Dl1exRQW8AXsh8GFWz3eZG7vLrV5eCKl2aLDgqibfoLdfuVhE1xcCnSW2/1ypdWfxrKL
 qB07BtPTfNuwIRzOeZvBfhWg1g2qYmrojfTo2U9MLw82Jr4WmQLajaCH/CftGJi3ikdrEn2mdWZ
 WqsKOmb8XL84YY2vCgrSQPEo56kQ+cgLOnu9bWSy35eOjmByOhQ+85tLyl0h5ab/8jQVAOkl/98
 aMJzKADejYMAI3P2xsO+7tYYKk4FBAzxOvCTsvaimYUVY+Ql2aLJabdzMtmttA8EZMPg3qNafZS
 Ig0vO3ZlVBMSEnLUMLw==
X-Authority-Analysis: v=2.4 cv=I6zw19gg c=1 sm=1 tr=0 ts=6ad8a2c4 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=25W5T12MUkcB5wj6RmwA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: jsLswiOcjCxKLcjG8c_zz17P6tp0LyXy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210045

On 9/25/26 5:57 PM, Mukesh Ojha wrote:
> In preparation to remove qcom_mdt_load() and qcom_pas_auth_and_reset()
> public function, migrate every user to the new PAS context-aware API
> qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset().
> 
> This series migrates every remaining caller of the deprecated APIs
> (qcom_wcnss, adreno zap shader, iris, venus, IPA, ath12k) and then
> removes qcom_mdt_load() and qcom_pas_auth_and_reset() entirely.
> 
> This series is based on top of although no dependency as such.
>   firmware: qcom: pas: Make MDT buffer retention explicit

LLM has the following comments:

 1. Metadata buffer (ctx->ptr) is leaked, and overwritten on
reload, because qcom_pas_metadata_release() is never called
(patches 1-6)
 2. devm_qcom_pas_context_alloc() is called from repeatable runtime
paths, so contexts accumulate until unbind (patches 2, 3, 4, 6)
 3. use_tzmem is never set, so the shmbridge prepare step never
runs on SCM and the commit messages are inaccurate; TEE gets
a real mem_phys/mem_size change
 4. Not bisectable: patch 4 relies on the NULL mem_region
handling that only arrives in patch 7
 5. Patches 3 and 4 don't apply to this tree; iris
iris_detect_firmware() still needs mem_virt after the load;
the base of the series is not stated
 6. Patch 7: NULL mem_region now means "map internally", which
weakens the -EINVAL sanity check
 7. Patch 6: redundant second ioremap_wc() on top of ath12k's
persistent memremap()
 8. Patch 6: ctx is set under one scm_auth_enabled check and
used under another, which is fragile
 9. Patch 2: the context now carries the full region size instead of
the MDT size, which matters if use_tzmem gets enabled
10. Patch 3: stale qcom_mdt_load() comments remain in
iris_firmware.c
11. Patch 8: no issues found

Konrad
