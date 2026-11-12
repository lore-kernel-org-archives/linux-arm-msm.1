Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794490696;
	b=NMFfazt9FV2coQMJN515MRzst4WbM/VMQEKOiHJIRrSndAL6oTltlIUYaqUkVVSC/ppT
	 Pb5zZUDeU7FdxXPzLPWR3oHFvHRcw+1DSekbw1wc2+vUkfL9PWg8+ajYRunoqGMyycbZZ
	 S9BHh0CzApKyoi6cJ6UgtVO0z9DlpRJqjmiB3Hof2cQQs5fDNfB/8zHm07D9LwlGWQffF
	 rkv4pCXQoIC7NGu7jctm67qpSQpe8wo9JwV2YLTTI3IwL4cMadKkwRwFj0DAGTMU87BX8
	 GTvzJRpU8DFHVNTvFhE0xMHVXA3beQPutGAJGo5dRphliBceerl/zCB6Sii9wyZww9A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794490696;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=uZMjiV5/PU+tMAzofbimEmP0pnjSzO4K3nywvn4aU+8=;
	b=GIYxsOmHBkuFOOgWWN+6C+8U7ZjofrOhvkESO1i/E/p7q0lsa4EattMrjlNoSUmSBE1o
	 9wndaZshGRKad1Xtx2Ydp8mD+zqkJBqllSr3BlFgAH7vcw8DJmkMrjpr8uvfktiGjrZjm
	 YsvD4Qd1aHYgJAKvl0/1YVrGZq2FHor85HmHIUZWaOPwj5DnUPjzP5BtvyLQUfIlHqZhZ
	 aKAybNsqLrxkqQWbqrCIOwedvlsZ2yl1/3CaxwQo3Ncp2O301P/eb3jHB5ldg9aUCGxB7
	 bCP957c0dnDZw2X+ZwItGCcHI5Iw9nHnlluezUoStrDQ/uFJ8UiIluBYiw0edxk0Z5w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MtUI6b7Q;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LjSMJFt3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76301606A8B2
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 13:38:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76301606A8B2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MtUI6b7Q;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LjSMJFt3
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC9Dv5D480051
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 13:38:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=uZMjiV5/PU+tMAzofbimEmP0pnjSzO4K3nywvn4aU+8=; b=Mt
	UI6b7QHyfXoOS6mthpt5UkYsrXFRFdOvk9PuS6cQY5NyGIuFYB86u/dqXUjXTtfl
	49R7eTNlkbSLIk03IfdrR58QxSwGLTlLIVmM93s3jdH1l7OPOhK5uoavskG4BUj6
	KTzGW+FkUKKyQvA5xiNbebNOtXwfnK8sRkGGwGmj41eb3wviOyl9nO8jEhr905kB
	vcq7tuFStdabpWVFZlSJYVJMCxmfcTrwYLrF8sO06RJib2XNDlRBXYMMDXUNldy7
	Z/f0DrYsWc0AnceZgHfq4VBvQ0XTAGQn5P5n2gVUygvbxl/htcC1uB9jOwaxUoKM
	4yXJBz4za3xxVUA2rwYA==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwan4rv3g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 13:38:15 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-46f178d813bso4091908fac.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 05:38:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794490694; cv=none;
        d=google.com; s=arc-20260327;
        b=hEhZDEtCMxjSLArHV0pMdBka3sdZRI6DCzF5xESXNPyhOo058nMdDNtcnmkB1W2fRN
         0f85z2REVH/F0AaxMFDdNRMjyxmywiwmSc+zioc5I1ZdDKO7TcMmfLPIlwTlNLk0C1DR
         yxUK4JfONY3lZ77ojnHkQquzL5VmMQlpsIylBeSoguYcYAbBCSriJ1KCQVayhH4DVEwq
         LDptSFnYe/0Yc8W3JMhK5yaLE/bRciYdQZYUlD8nmSfrCu9zAngXVs848aPhbT4/xdzl
         nInY76Tht/xCTAXXSRyLL41xen1yYjTP5sumRqzO3lu9d1V6Zpq5eDVjhrz3ZUZO2sPY
         LnUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=uZMjiV5/PU+tMAzofbimEmP0pnjSzO4K3nywvn4aU+8=;
        fh=6nV+K64bYU+uwYHtkpelLhgDAiIhE0AaPKV7etBXSEM=;
        b=f21U7fbh02LOjsDM+xiB2FcShWO9rrcj/pzhlUFvA5dMcsN65+taDJwavSGPhtpReQ
         D5Z6GdRFwr7l38Ei+k59TthKzeias7NGl53qF0G9SB7pAaESZngdctpYsbbq1gkGJOSD
         1w6d9ank8yTNJLLcuvsL65zmJhvE0S+RyIAM1xbhyyrU7uBlHNyO4KjD7Xiyd4Lj8Td6
         IEuo7cDADw5LkJRgpD3QWpdAPP1t7dZHx9TYAfoX7vVrqnBmFGM/SrtM0g0VB/Wjsn3u
         gX5xh3E1ZZ2Ooll8kOy1V0aa/05NwiWZvezghXan9ALPI+ip/tIzobjQKTquZFk12G4s
         KX9Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794490694; x=1795095494; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uZMjiV5/PU+tMAzofbimEmP0pnjSzO4K3nywvn4aU+8=;
        b=LjSMJFt3OQ9EeeS3lZE2lW4IdyF2K9by0rimSlDL0Qhhq8UUr+BaCZBLgas671tndI
         4eoe7ZZQ40ZsQ2dsDMdpi8gu2I/VDJ0xxO+pj8/GWKbIJhxByCVvQtBSIwgKx5ahjmam
         t0l6N+WUkfs/bKGYIGrIyrX7FDKg9porOCVrsCQElpzmNpyd6nb91FUZtBcwfNW1EiGU
         xmDj7pqVMlchzvNTZ00eH56Vt+UK/7DmkYKwn6LpIkXd3zb7te1dYOsRlG5rBm2d9F+v
         +I3Wj801494p+Px98eqk5t86nKnHoBxB5ZMl3gsREzokrLHE4yC0jePpw0SdES/TC9d0
         VDiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794490694; x=1795095494;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uZMjiV5/PU+tMAzofbimEmP0pnjSzO4K3nywvn4aU+8=;
        b=gQ3WS1QXhmzwvzpA1PpY/f/p9+FDfhcCUqsle5xejGiUflK3DF9BIsmx7Yvfbj8TJl
         7v6xeyoElotvqtguiEsoUhpoSDja9RDhcE82eTodbvovZewpP8MyhvADX+O6z7DVLOrw
         IWw4ylUjkwRtLQlVNhnJ/o8Sx2amNjPk8ZVp9KXHCm6eiN0B8ML91xboVi4+ykdPemdQ
         vwXCYnBViGQVMc4myiN3GLHc3UOlLD+NLltrycK4nKjrklZjzOUouqoOQmTYKl/jC3AF
         gy8fA2EQIZjGw0GtieTgOIN0wjVg+C74Lt6sqJDmqmgnJf/Vo2JYyC5uv2JlkDBPXkm8
         yM9A==
X-Forwarded-Encrypted: i=1; AL+hErGqNooOA9UdNvPRuieKpCxVF9gXUkALr1WL4P9A01hf2NmR7r2ejYntoTZ+HkEml4o3v7bvQYuup6IFjq8f@vger.kernel.org
X-Gm-Message-State: APuU4Z9N/FfA2NRPm1Z3GwCAF0KPMeW4+B8s5DsuD2Pnky66eSvB2ruf
	EnP1MINWlqYjJX3Accd7t7TNGZ4c0PKPG6x9z4FwuvDxGXSHNlxanqfO9IWwVCyE/9dTNL77y2I
	b7pXq+garveiRthQOYJoHt7xtVTlajgIDlR7cc0HXqvg7v+WckyWUZXNiqArkg3N0O5j5sCQwUq
	1l1ttJwWj/G8+I+FuuiLu+7M1jnZWXwepI7okgPzPN7Js=
X-Gm-Gg: AYBFou3T3tJHRvWMfaiemfWwkgPMFzlZxmIG5qjnzKZ3hC6WJ714Bo3PgIPUQyE2/v7
	dTbJ6VTRWgMNktwq+1WxbAqZjk7ZmdLSu+1d6FzCKdDCKnYPRDL1KVNSqYQlu7wGNCwd4zMkEIE
	FShxCj2URl6TLoCimLXwmoWrIVpE2QX4nGv0mqVCFSzlVKrB5aspKxEjQ2J2evXuCuZP/bcN5aW
	YscHCQ4szvP9tguA1ffUw==
X-Received: by 2002:a05:6870:ac93:b0:479:47f9:27f1 with SMTP id 586e51a60fabf-4ae46c5620fmr4972469fac.36.1794490694562;
        Thu, 12 Nov 2026 05:38:14 -0800 (PST)
X-Received: by 2002:a05:6870:ac93:b0:479:47f9:27f1 with SMTP id
 586e51a60fabf-4ae46c5620fmr4972438fac.36.1794490694085; Thu, 12 Nov 2026
 05:38:14 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110204732.531432-1-robin.clark@oss.qualcomm.com> <141d09b6-8635-4e9b-ba50-3c5f352bf045@oss.qualcomm.com>
In-Reply-To: <141d09b6-8635-4e9b-ba50-3c5f352bf045@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 05:38:03 -0800
X-Gm-Features: AclHuK8IvmQSAh8MLCERgDgD1nk4EMGzjbERLsRckPKn8tpmXw-AAtPEd21ydVo
Message-ID: <CACSVV033yjfbbpLMOMtWbSGe9y1XjbVmveRGMFDu7VzaKAAd3A@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a8xx: More nonctx list updates
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: 9IF3mHoB2EFSAdY7pGbJJNaDkBvRHlTt
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1NCBTYWx0ZWRfX5moAYvALg3qd
 FKPeWCYNN6+o4rHwKWNua1vNEtLARGWeP1JfOtNjW5+N9k3yxpFwf4zYM1oaoL+ORmQBFCCX7Ae
 hCmroIvSEq1h3Dgox8esVKYTfWM/Eh8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1NCBTYWx0ZWRfX3aHXNUeTo0Iz
 Qrw8w/YVJfeRoEhPm9EbBP8rSOG3LAe2bLp+4cH2wbFNI8LLFlswmGwZ4Q4lKgWp+26486V4/kv
 cIg8FAkmRG0JaNSaeiB+z+mxR4b+SpDTz4KG2oTMBBtBkTGoXI3GZz3fDP2q+ugPqC2VcKWa5om
 ulBs7QI9hZVGk+CWpemD6AspCoVeqRzhU3VxJ948u3irD4Iwnzet+id9SfA/BMk0jk0oBy/glDu
 iKfAiuhlZ0fSg5sidKeGVhHg73Q5CZWzQiERDqQbY5C9iqTW0PhDAja0JHFHkOmwOrlC11+knl2
 gwsCxSuRNV9gOrBT18YT4t6FAAr2h5cys1QQCPumUxiQsXqRcXReoam4WwIBM6VFxdCs16FfsZr
 M/LrIhT9E3bVnpJUB0frqjZwi9LEd+EmJvn5wv8u8jH/8jOj1L/y2y/0c3L3MLFaaGzx9Jy0cEO
 C1da4MpQ34+uelzVXPg==
X-Proofpoint-ORIG-GUID: 9IF3mHoB2EFSAdY7pGbJJNaDkBvRHlTt
X-Authority-Analysis: v=2.4 cv=Gd+CDgXL c=1 sm=1 tr=0 ts=6af5c147 cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=RUdMuCsKevVNhb-ASNUA:9
 a=QEXdDO2ut3YA:10 a=eBU8X_Hb5SQ8N-bgNfv4:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 malwarescore=0 phishscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120054

On Thu, Nov 12, 2026 at 12:56=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 11/10/26 9:47 PM, Rob Clark wrote:
> > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > ---
>
> Any dependencies on mesa changes?

There should not be

BR,
-R
