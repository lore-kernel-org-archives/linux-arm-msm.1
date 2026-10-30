Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793371387;
	b=MYqggkFOdRy3el2GByEuh/6hjDvwlCTCC51fJGFF5am6UR+3XLzsbbkChyYh9mrfTL9L
	 5JIhY/t7rgNY14nDaJX9g7OwMK8rfDlGMNtyIHB2IZ+jxETXdLzgH4GV5tDxAQItXENAI
	 IbxlKYAIyE1Pw4tTa3mqQpjHVdW4BzKvDrlqNzCPi9wJAJ/VH1A98GjTu+f55IOYfHALy
	 AMNC/Z0JBEMDVan49A5ZONoW+vUFMFo5Ymgf5oGLKYfy5dtJKSr/n47/+nzU+xeOEVIqI
	 xRJi/qRwH3aAFU1+HLrUyHH5NYs//IXKVTnFc/4BcuuX8GRgUpfGXpL8QxhFUrdH32w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793371387;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=KbultFdxARc0+R6qwvP8HKFaCeHvN/9tHGKKeMncdgM=;
	b=PdOCxXemn7UEVAieLfb5RME5C5b9m/FiyUtll7oLRJVY8ftL/aUzs5ZWKQ7I0S8mWOpX
	 QGymXnI69zqNBF3dURoMCdbFRqlG4+JDoHrDKGDqTvBUfrDsfn/UFrnQBt9odzpqihwxh
	 YBI2TPooi5Ftb/YJnBNuVfdWCr/e5dqAOKJFZOISaOIlvW/wibuAilHaNvpVDJleWKZCu
	 yWxHO8OVj4iWhO9+HM3sQfiORBeatdq4Npa1IlvbhJzogA1QgHo6IANfKfl2yQfDmogX9
	 npVJ5P9+sUfrufj+ek4yIybTsnY06279lsjhAttBwbxKBZh57yvcPbJugdzPeR5mutw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="i/q9l+Sw";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hHGYAMN8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57577606A31C
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 14:43:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57577606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i/q9l+Sw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hHGYAMN8
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UERKSG2495308
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 14:43:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=KbultFdxARc0+R6qwvP8HKFaCeHvN/9tHGKKeMncdgM=; b=i/
	q9l+SwlxImRNuH/8humXE68p8ikHqaC3OSwA5xqd/ORguVoNvdE5CAij/2FZgECT
	RSwS0D6O65xqDzzHk3aCD0TVCe/1d+kxlTz1qSLvEYGrZWm1Xu68bO+oyBkQvJeO
	scx+OsSHS3phCkp0AjdaZkOJFboxghlui9Ctc5hvNREqq9NIMyQVbCkESARQpVqT
	yYMdIUTNRsgL4dLtdR6GFCLhmNo/iGHcpMcYGXrsPlWD7LYrmduNZvQ9SqH9T+Mx
	aHYQb9b4RghMtbAVBDOv1dBkBl1flnMl8tZsZ6kVPPTRlY6v2ktfXODXZh2cQ76V
	B5yb8rhEtu570PHwaU+A==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6p3kkk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 14:43:05 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-47b7f5b898aso451089fac.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 07:43:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793371385; cv=none;
        d=google.com; s=arc-20260327;
        b=UmBq6TkzflGrC7b50e5/0zrN41bmz7eeWLdKTQpqY3Pobir87Z9MbaAffc7ipzU+VJ
         EwZ8z8fNFDjCRu+5Mv43MskV80Y8wUhD761ZMNtnN/LoAgd0TufwLqUH7ZTy7nCzvCqY
         DnYmblM6iSS60fAM2cK7wevwu604KL1Z3Qqfh7mtGRj7NVwSaIeR98FUXHSbbwEXieG9
         t0j7k3uZMt81PT2NleU/Pgq6xJaLEErkyZlW5/dMFpK3/I7+9okTgXEmgsGd01NPiEVg
         CrCPgUCECW0aZ+Xf1Uy4GHd3/jWvFu7ybHtnr8iaWfdru/qHTZ2mSEuQ+GgZ7QZZ76b1
         QEvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=KbultFdxARc0+R6qwvP8HKFaCeHvN/9tHGKKeMncdgM=;
        fh=mQZ2ahFw6vAKETI0g5t++7PNUBnMZuIV/OR+ghMDwQw=;
        b=jZNdhQ7lvlDYe+fAlQXbnggqwREqiEklYARYEsTND/B7fDA8OBn21gp13I4eP8Byuy
         OhwkcMMSk1DcywpRQV5V/G+/wVJvRO2/w5L0WkxhEnadZq2bKF3N9prggCbb7ngEVXZw
         u9b/Zh5ZyP0VxbR4DP7cMDjajq0EPoCVAKHxFekfrt9HRv+UVujF+5mafOHHjkEMe2oB
         3ZU8ijOa90ZpxWdU/QpW65Aio+y0LPvtklJxhiqF+LOSqp5GmZohIDpKAZdhW2CsxdFe
         E2ZdfP6y/QTwDG5OLiyhFdmvLwFY7nUCm7CvNbOBNLpmYk113saE+dw/ZRzQ+zgUntYJ
         e4Nw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793371385; x=1793976185; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KbultFdxARc0+R6qwvP8HKFaCeHvN/9tHGKKeMncdgM=;
        b=hHGYAMN8MeNKFiS4t40qKZtFAoGSZN863fn+QnXvO9c+KniJ5SyqfLOXAgUDjEEVfA
         vierh1aTU/abnEbsHvyIMooyUV+hJw7a0Kc0HHRkzqiplmWderyoaLBD6pcA642R5Mqr
         LZAlSvE0LFxaoAAGyp+XO0dYY5gToNg9AamNMhCUSeGJmrAuCXx9KshP+b/Xfw8UDsLx
         ZProCu6XbxJV9VDjVyEwVN9msYwDtf+U3Xcrr6xCT8CRcq3ozgB7bo/Kpya0on0wnSsb
         2vFPMPE+y6T3LbV86ZtnmY05cvu+Oz3VmpLNEP5yoWjJVOEAOT0TsME2R56t/nGP0tff
         zZlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793371385; x=1793976185;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KbultFdxARc0+R6qwvP8HKFaCeHvN/9tHGKKeMncdgM=;
        b=2gLdYly2oRZqXdqL67iL1tJ4MqKp8XUE3hE9CRP9ZIAqIRdq8DGsLMIDN6KvNB1OGH
         h0IYDLwLMktIUzc3ZDgX7WufWSiaSK9f0GT6peqpYpMIYrO8BQ5jgKlVaUdKgSJNuiPx
         mvsTfVDwzSgsQbqoPw/wkemlvo9kQapf1T68PlCfOWKTC9DpTNudguMMovOCWUZeHHe5
         NZrPJnC0Uqf1VAyRFOK87EEkaTO8nGqIiZMwOJHBweyQSpQdk7jrP+quDWgsvfFTs1ug
         civi9iZm3JKebonj5wO8IMe6Eii5lk9oUJhYJZqMS7SRyYESVIHJqS874OwEivRdIIMs
         4KhQ==
X-Forwarded-Encrypted: i=1; AKwUvBwi/MmKKNM30CMIjl9EP/oOurukJpIT48LRXQTMIymIBOmEcSbLVnL8g3iA7FS99t6ce3NhNuATN5NynChb@vger.kernel.org
X-Gm-Message-State: AFq9FYI8JF6la/devtnWWzqaSfe/V6qJyhQFvdIfmr6NN2c9YDcsJCGk
	uudzv+m1HKyizSZU/QnigwJCU+Hvqyhy9HOnfTh0JNsutKJ4gw3Xd4F+2HpVRkLumVbwm/BCVV0
	BR1IalScucUrrqz5shHOrlAGRQIs3hSTFg8/g4Id+MGCU7S6EO1f3eu8KYMwXeFwZca/oV73qnQ
	LmvWNHhc1B/qtEb3oJ/+hI80PPyt/hSUUD7uQJqixMwE0=
X-Gm-Gg: AYBFou3/8SWl12IongvUL8//2rLEWtU+IQTE2c1q0h8Vqdoen1POYfMinI1mD1Mtbsx
	Xns9qEL54Xs1DD1krNZTeXGQ6agTEveYP7gO7n0ZOE/++6GEV4qR7YVFNzXqrc5gN8tCfM0vbvT
	IAydjiEoTzXs/rImhgFyGkfZiFt5MdYpkmiKFOVUAXY9g2SWOM8kKd5S4w5w==
X-Received: by 2002:a05:6871:3149:b0:4a7:4323:3fe1 with SMTP id 586e51a60fabf-4a9075f9d96mr1670317fac.20.1793371385039;
        Fri, 30 Oct 2026 07:43:05 -0700 (PDT)
X-Received: by 2002:a05:6871:3149:b0:4a7:4323:3fe1 with SMTP id
 586e51a60fabf-4a9075f9d96mr1670299fac.20.1793371384641; Fri, 30 Oct 2026
 07:43:04 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029201730.151754-1-robin.clark@oss.qualcomm.com>
 <20261029201730.151754-14-robin.clark@oss.qualcomm.com> <b1bf792c-8571-417d-9c98-f0b330a3abf9@oss.qualcomm.com>
In-Reply-To: <b1bf792c-8571-417d-9c98-f0b330a3abf9@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 07:42:53 -0700
X-Gm-Features: AclHuK99uM--i8GzOCl9TFxS2xsZbwdUt-6JFVQBI-5UrBBF9foFWcKCI-hrO7g
Message-ID: <CACSVV00dx2kijKkL6-=GzQX4pw+1pK0MA-hyveCscVdDKy7w0g@mail.gmail.com>
Subject: Re: [PATCH v3 13/16] drm/msm/a8xx: Add all CP_PROTECT_PIPE to pwrup reglist
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1OCBTYWx0ZWRfXzZTwq9YXzLN+
 bAxbqjrjui530A2kJiiYUwCP08nvUAEm7JHZd605K8iL1ZkDn+YMW6p39ZOiaMMdBeV9+7y9Jk8
 rs/wXzp6iVaUkZWiZsowtlqCwucL5ozEV3X4vrE66BRzaSapm5w285dW90ShNHJZ1kVTeMf5Uil
 MlxtYCeaC1Vlx4XjoR6OQcv9bGKQJtcmwtB1X1uFRXXjHgaEvvAOkxzDAhV+J72YONqmxHRmg1+
 xECFlzxyoqxyLxSmvNKtRJ56lnUVliB2oWtw3SMWq1UKJkjVSL4nBQt4IAYWP1ZwoG3PZeJ9csJ
 mwwxYqUB9f4JXTMtVKJGuwH9oedkFr78P606Qsa3MpG+0vRGRP27zPzZlGzCOASP9eYjnw7oOeX
 5huF+M+tJYprJAyVnQlTpT/wkw864Zp86x6Ude3Lfq6MfGMOd/Xn0z4wmYnTPpSQOOJqC+hOSFR
 GedOWu/KYI1hxihjKMg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1OCBTYWx0ZWRfXxOQXvtmwT10f
 FvvUd8kQY88TWRgqBKjwN28u2fyuUXpZP2CdZwh5ulGT7Wr1cIonDtkwD5n0lmpaeLpOh6gMf60
 XAs3/9/aS5DQIEwmrocCJHJ3NfjRcUw=
X-Proofpoint-ORIG-GUID: qhHNpYCBZCq8uz5-HwEyZBYCyxZPmWUl
X-Proofpoint-GUID: qhHNpYCBZCq8uz5-HwEyZBYCyxZPmWUl
X-Authority-Analysis: v=2.4 cv=TL3Q2Fla c=1 sm=1 tr=0 ts=6ae4acf9 cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=XFQ3HDCW75CJcarWahIA:9
 a=QEXdDO2ut3YA:10 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300058

On Fri, Oct 30, 2026 at 6:46=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 10/29/26 9:16 PM, Rob Clark wrote:
> > We're going to start using more of the CP_PROTECT_PIPE regs.  Rather
> > than missing to restore one somewhere, just add them all to the pwrup
> > reglist.
> >
> > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > ---
>
> I was kinda hoping we would iterate over them in the code instead
> anyway for this one

I think it is possible to generate these.. so the looping would be in py ;-=
)

It might be worth re-purposing the 'value' field in
adreno_reglist_pipe to be # of consecutive regs?  That would be a
straightforward way to compress the table on the generation side,
regardless of regs being an <array> or not.

For all the generated tables (esp. the snapshot tables) it would also
be nice to deduplicate identical tables.. either at generation time or
with the compiler.

> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

thx

BR,
-R
