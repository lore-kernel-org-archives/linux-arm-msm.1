Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794318192;
	b=KleaiOWlh0M70GQuQ0M/vQz0Ph0jsIgmj7ZElcQAwbAw7FJepCzcvTjXBvyQiIMVLhFV
	 6eAQ9KRY2IZzR6fqwa8qNC4fnn74MIEemPjO1RRViFdHUnHlrBmT+Q/MwlAudx6XXBiDD
	 y+8iTHU8w2p0OdJgQORd0aGQz51+4Vkr/l5MxW7T/lPtH+5BbbW60BqKVrnCtfnb79VT9
	 umyRsotPRCXx9K8rS+4Awj3s49W/AJt6zzIFKpxi1wfrU9YGAjfPiy2exIXSvbP7YNd/8
	 J47aPUK0LMvP8TRHnYGB4NxEFBEd9QdbmNcd2BFRHpBcNGg897+6cAPSTzOVdWwf/bg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794318192;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=S8dLlgm0BL+8pRjOClw2hAAWBHdyZ6f25O6El3Zjkuo=;
	b=FyElHsx0VWjmejDxDsiQF8sFxDb6KKsrKLNBabGIpybj/2VxcUcRKJlrZYO8AhnU5Ohg
	 7mddcOtOFGOfZEb8PQwAejInP6NF7bHcLulAfJKcoNUmlSHZzTvCA06xzVU6KtqXbVq//
	 Ipp36i19+WaeMSklsT7+tPHjWUC6jcS5OGVHVLQ5dOkMF46uX79hA0D4JFmNjX0YEACK1
	 zGj2ylr6qo3NtJ6X8QywRKucYB6HHwDFidYUxqHSuX3W2AC/Lwpnwzv7ERq3GVIIyOuMX
	 zjbzsn1iJh+6y4VcoVvMlTkFi9BltQvRDABZaAKi48Luzi1J+0pSJJdLSV9kVsy1X7A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DVMuvjEu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PTK9JzsF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE22D606A31C
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 13:43:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE22D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DVMuvjEu;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PTK9JzsF
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AABAGmD3839674
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 13:43:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S8dLlgm0BL+8pRjOClw2hAAWBHdyZ6f25O6El3Zjkuo=; b=DVMuvjEu65KZkolF
	cZINIYban3cuQraNxZGcDb6ICiHTmbJMtlbmiuBiR+xMSs3hfr9dj6iY71/j0PKz
	q0Aaj9/snpYUSgPMGHCoPLOHlGTDxhKXY+ZnfHF6G47GMkxuMHLfstL3XU0qGbE2
	1q/RB5mPctMegyTHI+F4Tem3guN+gaqLVhRdHwAccy9YEqnvlH5o+4IA1n8ilVbb
	qztFHaXNackneVeL0nBx6Ap4w5j+oyW25kVxvVAF6DDHWNWhkbGDgmrETm5Xn00W
	0Jbxba8NvNJ0hJy5f+rTTQeH464ZNt1w6x/8Xyw+M9T740D4AOoOPH2JJ4UTb7Bj
	PvIfzA==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4humjg3m7j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 13:43:10 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-67bee42cc71so4688996d50.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 05:43:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794318190; cv=none;
        d=google.com; s=arc-20260327;
        b=rVQnaIbgjpGD/mG5Hanmfo2q8gWDtEc0XN2+/fpR/DVaqDN3QkNApfQOHHpQM6CF2N
         +67tXbS7ENZhFTXlfvfoS4/+vh/c2UxB4BGFmKJA7Mr/RWm7Pizbqp8m6YMZBli2xA96
         InrniZ0+D07nO0rzArzslN4/kCLuGrlv9zuQcuj9qqdYJgJW4xkf3LstUIu1jfeVCtsI
         KaC7pUcsSYmORBPnD7yDOYaVncI42koFOkuhBIzaNYSsY7QZtb9IIDzCdVArghcv4ux1
         zLMWmzI0L6KfjpizKrXlYwWRLpBzHh0F23RUdGpgRcm7MM/5+DxF8Ia7MuX5Xnbfdvcc
         DVVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S8dLlgm0BL+8pRjOClw2hAAWBHdyZ6f25O6El3Zjkuo=;
        fh=XV4vCQQEY8lawCcDa3cmxPIfoMyjEMHGZH2c5H+KGk8=;
        b=JgxHINJh+diARQBpvAOZGg+pTXb03HUHTJdColiBAs1jLZs/P2yKY4TvT+TPRscjZ3
         xhjmssiEwnRap2ewOk2uyF11hv4HIo/MRaHfzJ5/ryhFaaCb2SX3WIk3NQBERf0WuxtJ
         FyhkkZuKb0LvOQedp5JWhOto/jBNSDNRh+7+2tSfBF2WKTR4zDory5c5U6O9o5HqNyCM
         X/caZcL/7VweX2PsJwo7sts9uYf7Tq92ngQLV2WgEAIv6DmRcY5/3H/+Hjteu48AytTT
         CeDQ+1iBdY9ozg8mX9J5TJiv/tMI2QbyYw/OgLIzOdubExuqbLlSetaNcVtLBuwMkEGO
         VHDw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794318190; x=1794922990; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S8dLlgm0BL+8pRjOClw2hAAWBHdyZ6f25O6El3Zjkuo=;
        b=PTK9JzsFSau1ErdLGjUaMDUA1xCDVso0YQzJT3U8w31U1xsw6uxBUJOzsz+08Og0uW
         zM5fslFF7isMPBWzYfkKHMKUkVCNPfnig2GJGSCz60thV1/fySNS2kR3i6KQ+fFUfVFV
         guWVzZX/K7iJCaVXMYXPG2kWuFPxXDQU/4SAK76DBylQtRVYgt3zHRKaPjfE3dg4k27O
         vCh7MubqHyZWbjGwmttbIghJvrrxbUK6yrCoDbVOJC9kloxx/u32o2sbf8QvfvVdloEk
         mmGYCLpn9GXL0SsSZCTDDprFP6xn0FgisvykaSR7SlcBVmyaU30DsKttgyavFXwJafZw
         X7EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794318190; x=1794922990;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S8dLlgm0BL+8pRjOClw2hAAWBHdyZ6f25O6El3Zjkuo=;
        b=1Yp4Fv7/AQ5696NNpL0tONN1akwOvEYxqzbBAJJBH3veW/KpZMVfTuRfyVpVaeksTr
         BN8RRYSKisQJD0cBjxUaNEJRdD2li2FgxRe80JjorcvSIMlZKWyHYV3gx4NgEEjQSVfr
         1c5UQPCTep+51IGsTmjJAuaJkASlmEbQzj+IXouEMhCbC67ieCaE020t3L+DNxdWf2sv
         4nDhu124tAi3mSohwkDtTJSD+VMCWP7fjzjBn2Qj/AQLcmqAtb0aH5kpSa7pEfYr2Me8
         GNQ4vFjBGDte+dZcG00FBzDM6aeCSV3tKdjgP1FKluFb/B+ezYULwdoRHl1NPa6aAO7B
         1scg==
X-Forwarded-Encrypted: i=1; AL+hErHRFAQHiLZOr0iE7+I9o06t1VhtCPJA4eQt09pPTA7oRkE2m5jMPTXrBjYHrBSM6pVuM8q7Jg5zgxXrZiY0@vger.kernel.org
X-Gm-Message-State: APuU4Z98JbXYXr4NUrurZus7ZdDbxTcDP45t6J1AMEMeyTnZ2d7QVbdM
	v075v+rYlHC+8CyIbmcxU4dtsvrOyxK3xtdLTjv7iPVy2tsHPY2PpWW8QNxjD7NomMb3qkgVzVE
	0I3O0FJNKJGpMbKibrexRzHMKFpoNxRWBWRnyeWJMOwhLK+b6vLEcNJ8yOw3hCE99mYRKHjSvtT
	dJG08quAOIC1ws4TsauGm/gjvt0e9UY7MFoG7BpVGN++U=
X-Gm-Gg: AYBFou2nPj+7yi4Av9oVHqAbTRIJ5PLPeUfkdlxg4fyYpni/a1wr1rHIbigy2XxtSoa
	pXYxKxC/cnQUNQy8HzEsYZ+l7LAIkpCfH87YatqldCM7ORHCFbTNURxNgoS3tT3xV1nzlDRaJez
	e58554l5oMK72s/TilLr1EPOBA7eR549lVPIjQilHvPQaTtIFFZsPENfI0Fw==
X-Received: by 2002:a05:690e:480f:b0:679:b86d:6977 with SMTP id 956f58d0204a3-67c568b644emr1210424d50.73.1794318190152;
        Tue, 10 Nov 2026 05:43:10 -0800 (PST)
X-Received: by 2002:a05:690e:480f:b0:679:b86d:6977 with SMTP id
 956f58d0204a3-67c568b644emr1210415d50.73.1794318189718; Tue, 10 Nov 2026
 05:43:09 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108-checkpatch-fixes-hash-v1-0-d49b3085c20b@oss.qualcomm.com>
 <671a7f6bda4ec81f56e3eb7ee287bce4a96b9d5d.camel@perches.com>
In-Reply-To: <671a7f6bda4ec81f56e3eb7ee287bce4a96b9d5d.camel@perches.com>
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 07:42:59 -0600
X-Gm-Features: AclHuK9gNUY-5DUl9XxCj9OZHjqpeyg91U7ZNj4UaVgpbOKq1q4U0wiyNr5nzIo
Message-ID: <CADLxj5T36OOBR4J1HGNT3U7H1FwwvSPmBWYRM_vGAEsXfWT0MA@mail.gmail.com>
Subject: Re: [PATCH 0/4] checkpatch: improve exit criterias
To: Joe Perches <joe@perches.com>
Cc: Andy Whitcroft <apw@canonical.com>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA1NCBTYWx0ZWRfX2r/E75+0Je6O
 iWgJkpzWi8ke9n3PmHtJFGYfDBvDoY0xhbEw8esnNdo3SvVjwvfhCuGAFiyy4uP/Ft926ctFU3m
 wQqCUBXujPQ/fjVDNkQ0NTX189/Aq1wMZeyzD8JAhDkdcIk7d4R7Wpn7gDt0OazW5V8e2NgE2Kh
 8sFWOC0J4MXs4hELv2ldAVmBeWwTS2vwoC8KrW04ktnWLcpTdOzT6VVG0h7Ql3wK+NAGQPs+nrl
 VQmnb5M0bdf+b6yU5JwtpY5cMQpfv6otW6Hi4hUigoxL3Zc0qYJQPP8/Ngr/kZzLz4Itqksvppd
 g7W0loE++gYMRbv8XMEv8ZYIobeeYvtQWQ90Iv1QtA1i6tEct+Fxhk7y7mqlNrZfx23i3xizDcq
 SzTDU7FFh4nPWttsOI9yKZf0oXY2v2tk+v0DoBSYslJVEQDd/zQGGXQIFezRSQpXB6iopjR8Lge
 yy4E6fm7Cg9BBmAOSAw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA1NCBTYWx0ZWRfXw5k5/bDbLocW
 kHrJZdM2NonVF7DtIiMSF3I/7sDHK4djdg/bnssAUnz0BZzokYNMGV+rO+wSVVljy+6T6xkb3Wd
 +4kT67jmmuYCEBBh+WEsSWtyxLd1cg8=
X-Proofpoint-GUID: _qrgNqPKD8uNhq7Ax1eHrMPY-0aXxtBN
X-Authority-Analysis: v=2.4 cv=B6gsQ+tM c=1 sm=1 tr=0 ts=6af31f6e cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=IJv9LcIfAAAA:8 a=S814grWw63F5jRhWiAAA:9
 a=QEXdDO2ut3YA:10 a=nd2WpGr1bMy9NW-iytEl:22 a=cmr4hm9N53k6aw-X_--Q:22
X-Proofpoint-ORIG-GUID: _qrgNqPKD8uNhq7Ax1eHrMPY-0aXxtBN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100054

On Sun, Nov 8, 2026 at 3:04=E2=80=AFAM Joe Perches <joe@perches.com> wrote:
>
> On Sun, 2026-11-08 at 04:21 +0000, Bjorn Andersson wrote:
> > When invoking checkpatch with the --mailback argument over a range of
> > patches the tool unexpectedly exits successfully on the first clean
> > patch. For example:
> >
> >   ./scripts/checkpatch.pl --mailback --git v7.3-rc1..
>
> Why is it useful to do this?

My use case is that I create a maintainer branch off e.g. v7.3-rc1
(now v7.4-rc1), then apply a bunch of patches and before pushing that
out I run "checkpatch.pl --strict v7.3-rc1..".

But this is quite noisy, and the compressed "b4 prep --check" output
is more what I'm looking for. So, I borrowed the "checkpatch.pl -q
--terse --no-summary --mailback --showfile" from there and it took me
a while to realize the difference between:

--mailback                 only produce a report in case of warnings/errors

and "don't produce a report if the first commit is good".

So, might not be useful in itself, but the behavior tricked me and I
pushed patches into linux-next with checkpatch errors.

Regards,
Bjorn
