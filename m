Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795457593;
	b=qldZbVflV7dd1L2P8DwB23XUeQUvbBPZO2UOmbdGs9DDEgP6sOI8ADMjl4mX1Fa9xgsk
	 EUW5eIxK65y1Xz0GCkuMX9XzjDNlx68FaQcOqhD1FWYyidc6YjahU48xncieuej8ZY4sk
	 m1RYk2WDjbq4UMj2nkKUb4bG/MKsn+/RcE+0HesjPYt5pUVYhAE6vM5h7rw6ksZdkTvtL
	 7RJjc5FhyIDmz+nsmA2yJZkQuc47bkNnf+Dq7kuclCSHLIgcQfpPCir8P7F/p76Nv9aXn
	 Z7bZS2LObe9x74Kelyfv7MwVVB+sKqYP5R+razJvC0WYeP0VfSj8Tdyd2GlQP0XB9hw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795457593;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=W1rYKUQurdfUpTs0/e4xfd9Tck45cp/Lz+Egqb3NjbE=;
	b=H9CMD7gv9Wb0AGwiEv7cVSnNs/xfgTXOkySJfRnNG7Zm+KZmCUp3jp9Azn5Vg8rnufbN
	 Vgq3JmKZrnmwqSDn0WeLIorVe3ueWVuW16+QnmYKlBx9GPUCOnH+J/tDDNZ4Jk1viB9Tg
	 lNv/wtMDLWAPmVbobnmtjZx2EjXHhhsFK2z4L+Rf8TbAETB5ivUlpZH3ecfydXjWhsmaZ
	 C6wbVEtEvuGFv5Vw0dkMNyROTR6NQX3lbHOIPYJPFs9xb+A5zpCCxS9QquH6vfxVMyCwV
	 7AkiR87uMMgHW/S3HNg352AU1zUkPaW9jYiLlSPXIWnIEYDAvpPx9Ok4vvnPPhedIjA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E0On3RRD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bvWEHlaP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF96606A31E
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 18:13:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFF96606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E0On3RRD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bvWEHlaP
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGI3AP236275
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 18:13:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=W1rYKUQurdfUpTs0/e4xfd9Tck45cp/Lz+Egqb3NjbE=; b=E0
	On3RRD8QKH+iGkuS4AgzN5qY2LFi1otifOJS7h/Hk1yBWlBIXCRxRCIwgZ4K4AU7
	YffkwXQauP7q/FQC+Jn2Jws3vSWSyEPR+idymqsoAuQp4EBLXF9r6rOWCqS/YzGZ
	LUnVkzGyeSW/LPn3RrLnicUR3KTHeLtpcaktSWLKr6J1/yBSWJVxv1qVjRr5FMbk
	Nxz7MIsFE8wRQPljU/1ArbiW5ZyWx7aXVpasruSTVo4jX4q2fNwNLKhTZsV2n/Ch
	NuXmmpHjLL9kZ9yCM7A4GwPYtfy5jRjYPGPEUataE/mhyDTSl+qqp6Ot9pIGfBYJ
	o6rKiUME3xccIp5UbV5w==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4evsjxv2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 18:13:11 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-703a37d970eso3673678eaf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 10:13:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795457591; cv=none;
        d=google.com; s=arc-20260327;
        b=G3pwZnj01095VhfU0qsrBiNsirri83GaBPWLG7F5sn6DDsS1GakduPIiQAz9XJd5Kc
         2H7sUWMmCvaJHvqEVdK6ZwY/HHqusvZtnPPcOefNSttGeTYe/N1w7iaZTE4M7L1d2+B3
         WxMvCDqpPMUPY4dx8CHNQUpXmIRo500RtvZ5FxFXZK9mzFFtQ8fJvU6Akic9VY0JN48j
         6g8v4s/rLjoY9nQjttx3dIXTqmv/kV0ry7Nhybx+qcNCl+u+a69edRRpHqPO9AJFtt2e
         k7YLli6k++FmvojL8pcybri15IHrVwEQOgiAOgvIaX/GqE9gnYVxHrmpJLx69aNhKTMf
         5uWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=W1rYKUQurdfUpTs0/e4xfd9Tck45cp/Lz+Egqb3NjbE=;
        fh=Ieca4rAg8W77SKt4rVCjAPuRQXBC2g2hOUVZ8S886yM=;
        b=bAPYNohL/PrY2t7b7AKw7+4JrsTUmGXFMgqVzcnNjQ3OnAmlR6BFDo2DE1mF0CJn9h
         ksznT9ZXOpqLEwz4jSQUx3WUXEu1JfJbQAAIa4tEotfjPrXHY8KDLDwtWwfPtCh7qDBI
         dpmMYUWYpx1rrQyxbGDalQPoZcE18x8S4hh6vLdmsOuSSgKP0IjraZ43Ce3WL2X6t6nL
         +RGmOaE/TeW+xYAx0Z60uIVqdQ7ibedBNTTucHQ5wi21YBll/fOBeqRMxbTzLl62EjIc
         iLodUoHaObkpcpKm+KN/yzNYeh4fslh7wRD8YD9EoRqjb2lL8IHGTX5UHHlGNZZytI2q
         SSUw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795457591; x=1796062391; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=W1rYKUQurdfUpTs0/e4xfd9Tck45cp/Lz+Egqb3NjbE=;
        b=bvWEHlaPPhN72i0U/jBrJwyueGJlKr57qTaY0ZlQv/pwGb7si5jLrNHSZ67tFFduKZ
         yck3OK22B5xEdqijoF3kFNTTnbUCe/+oolWojbubMKJejCqo6dE8qAO/fhpvD07FjhBC
         TifgjojAbFAERLEVQACcPuqiXoStuSr20EYvTNmF6buHh/Du2O9RuPlg2gU8hO6pJfGw
         1/al2Q8OT1i1gRuXbqfdVb+OV1JIlhvUENnxy21deDbkxRmcvNgA3+L5nvG82xE5uGG5
         5pMBOJQDf/GtzI5hMgTA3e7NES9nTowGCa5ZYkfO654MvnH6KlZVPos5rUaGnW3JEK84
         k9pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795457591; x=1796062391;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W1rYKUQurdfUpTs0/e4xfd9Tck45cp/Lz+Egqb3NjbE=;
        b=fwDqaFO3oSLLWHDEqYEmFe5wL74CMauI8/idQCoP4yvdSCyCnuh/5OD4NB8KWbYXKp
         SskPVS9dTlSGnO9gYZIRgkFL2s1RyBuREUKRIcN8IwOItal/jiyLB/D3VqUwmS8Jwsan
         MCePV1c/B0QN6pz+XBDwyT645FIQNlTxCQU3jLyihDJKwTPVVyzeJGylzzAW9LbikaxC
         SvkZ5KUfY5EBeUI9yPeHQKRp35alKHS9HKEXi8Zl9TC4ax9qeLVBr4QXjyERhnQp3MmW
         P1bT2ajVadNtjeSdRLvlCcYwI/VfSyy0HnnrFKpMIH23DRqVhi6rSTKEgOOoaT+d5iPR
         ihBw==
X-Forwarded-Encrypted: i=1; AL+hErGPxmZXOnw1Heh9ilyr5/j8M1Hjs95ihz5xanQqHGDmUkNO/uQ7SSVjLA2p2LNL+Mv4tVlbrNQoqZDSxmel@vger.kernel.org
X-Gm-Message-State: APuU4Z/Ycz9bKOWoV2/myv78XquiGvVe+flirG05Gja5/oUs2e07agOi
	CKZpj3GsIwYd47jTv17TZOXt6rG7M/tXi5ABpdPcd9KLqJsGdeJoJwb0sdsuJz/Qf399y34+EDL
	gI247ASxWJLc2/IB1Y+kB5s15XObm+p1MKZUzGkWz8BEjmaNBF213Fccx5PJqfNm3luaaiMCKqR
	z19AmpMZJTNTrSNaXpilfxKP2kwhYUAEVzI8CVVKxZLz8=
X-Gm-Gg: AZFdTZey/LwrvUS8O9eKQCK1L+eCWH8Fx0Vf6VQANOlJfnhLypTNbqS3cLlIb1OORhl
	PeHA7AdEelHOBuH5fm1hFsSZbkkrdQCF0GOc+zuFChPHLg6p9Lya1W+Vd8u38kc0Jtv9+PdFfka
	w0/KFAe8TBHpIJOYHWXERrHYD5DiqOuWI0h9iBnNAs/31J5XF2QgfJqzYwJMtRJvDD1qVkChiRl
	q5kWhHdguJAiPnXiEJIxQ==
X-Received: by 2002:a05:6820:570c:10b0:71a:f390:ae4c with SMTP id 006d021491bc7-71b396335cemr6592063eaf.82.1795457590949;
        Mon, 23 Nov 2026 10:13:10 -0800 (PST)
X-Received: by 2002:a05:6820:570c:10b0:71a:f390:ae4c with SMTP id
 006d021491bc7-71b396335cemr6592049eaf.82.1795457590649; Mon, 23 Nov 2026
 10:13:10 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123172025.402295-1-robin.clark@oss.qualcomm.com> <40157685-826e-4011-93f2-1632b244a1df@oss.qualcomm.com>
In-Reply-To: <40157685-826e-4011-93f2-1632b244a1df@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 10:12:59 -0800
X-Gm-Features: Aa3M54pc3x4GvgAvloxZVUq-tvmXPPOywnjTSJ1ICbSrR3N_W2wUuR71qCW52GE
Message-ID: <CACSVV01GuU5N1TcSP9mK-Um-KrKeowuBQcc7PTOPHirX01_y_A@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a8xx: Add missing preempt_record_size
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, Connor Abbott <cwabbott0@gmail.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=AL9GXjHq c=1 sm=1 tr=0 ts=6b048237 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=z8o7zT-b7kWXHJIS-gcA:9 a=QEXdDO2ut3YA:10 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-ORIG-GUID: PLHUGSyoYxTTfNeHgJoeipaw2T9MLgOp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3MiBTYWx0ZWRfXyRgVEoDTqdYF
 IdFwh4qN9P0XIeAEbqS799Rr1FuR7E2hwUPFDv8SzKWCaj6NB+01/5TBQsUHQpI2OgFeh3NtK+d
 UiVIgSg3StrAdnYN5jX1uEow4RnGfkIqrQnjGCQy11GLDJaVIPwY0v2NU9HW1giU/nhT7vD77xp
 DkCrNT4DURspmGOoMnV1I3UarfMoxc/QoGASeuMmiSVvasGm+xcJj/GD7L71+r42GL+/d5jXY1m
 vA/0lwtFuGlP9OhbWvWxUd8eSORNYiIboctzsdkY8h3rKH6gVtwvnGEBPzoea0PPoaBOP/V1Zf5
 mvCpZql+ThW+zfR59954g3WTlhsC78sSzL6F23HOl72qfMWyeOQnejhSEIXhHRhXcAsKVFif3bQ
 GAZ8jaMThr2Y+HQuhxaHtk4UBne6D6y5kNOHTaI/l+YOAqZuX8IoapH+QNKb1XPFpRziK9zCHXH
 Q5OXPIbqVyhc1ZEKqYQ==
X-Proofpoint-GUID: PLHUGSyoYxTTfNeHgJoeipaw2T9MLgOp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3MiBTYWx0ZWRfX4jyKBOj9JocE
 cUAgnEu0pZH9xJ0edRpGLcwzmq3s9vo+6u2PIn9nsebp8aqtQOuG1MrKuh/+Q9z7QRy6NGucIDM
 nJT17gPF3yCf7jYZev/2T0A+uZ6im5s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230072

On Mon, Nov 23, 2026 at 9:23=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 11/23/26 6:20 PM, Rob Clark wrote:
> > Somehow this got overlooked, and Glymur/Mahua were falling back to the
> > default 4MB.  Which is way too small for the amount of GMEM on these
> > devices, causing faults in cases where preemption needs to same GMEM
>
> s/same/save?

oops, yes.. fixing in v2

> > contents.
> >
> > Reported-by: Connor Abbott <cwabbott0@gmail.com>
> > Fixes: 7fad33097e67 ("drm/msm/a6xx: Enable Preemption on X2-85")
> > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > ---
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Konrad
