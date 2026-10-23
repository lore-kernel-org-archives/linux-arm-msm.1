Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792739792;
	b=A1vOQnKKoh0dgNo8QHd+/NDvINiTSy+4mKk+NANzaWjpFR8JG3i8xdLnwu6NzggIVbHE
	 YkVQOgZ9sooViRk8WYriE0svHzbhnh5ozBB1xKGMAJ/DEqY+3orXoL/p16HpERygNnCAP
	 ZrwQkMRZzZK9tSYE7qknwryMZ5F+eqaMfZrUUyslKlGVLy0wbHeXNQG6hQHDK/os9fr/j
	 /Hc9UHhVbFkGKIvCaTI3uI5yV1fDWjexfVI36xEs6x1DLfxJwCOGS4yZuqHmmDziyBU1e
	 1qygtEckMEwsKhc5AF23TVKm9pAXpGpwbkFnkEjgyXdioduwiEuwjaRKI8XmIgLkMHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792739792;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fnCHzkMl/tRSoOoOmfGusYJwL1UrHp+aabajQ/sL5Js=;
	b=saDqnvUHnb4iR7h8JSW9Eo+6rn1YSKTDyjbiQ9kzMa8t6S/R73MWCh95mUNY2RbtdoZJ
	 SP5yWS8IwQfXeQK9zRYbodnqbEGwZKGMh0XyQkkIe1D/2yLI2QbbjoxFomWFCaEmHjecS
	 cD6keVQ2Yt16asbXpWHB2ycAUiLoVyqEUorTJzt92h74RFsGxxHjhhx96pFX55Vj4n3cp
	 plcOVxbfCSAWF5irKBO4/tVeIZ+U7fo5Fmgustu/d+dEbj994II3DMfcpMQcXkvx3LVJU
	 FONWMHObwFdSoX6SWd3cKiCMEII3WEtEKZknfeKuzn4pvtvOWhgqZfkGE+jW3JQ/h4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dBLk4Ho4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UvCbbhFz;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52AE606A322
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 07:16:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E52AE606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dBLk4Ho4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UvCbbhFz
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7F9012112124
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 07:16:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fnCHzkMl/tRSoOoOmfGusYJw
	L1UrHp+aabajQ/sL5Js=; b=dBLk4Ho4qkQhKjoVeSI5pWWyd5Oabiv1lWIm31KY
	XBcPtBr2vVtev6+fGdo4vrPDrsdXKHkYkE0KHMDJmc/Uijd92O4rCHkLwt6Vl0kG
	JcRP6P31K5zAP8WYNKKLS34Tpf/0XOnZD0Xxke7t+9MnxG/7hhHh48aobgtZsFf3
	xajKoBWDLqT8LxGT+2hAqjNB6hGg8BVoP+M26KVbUzAwfxki0wSf+KPrD0k6XjIj
	NsdJhcdsuuTIxZJSxJRe0+Rz9olSM+HpvP4I+fpDbJVe0RUhtF5PlQfLtgNpNC+0
	zrJtVtaJGpkQ3FnDwKvCBgXwLXUm+LJQ0T2U9LUIzV/j9A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfsyk9v7t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 07:16:31 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e82060977so115513885a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 00:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792739790; x=1793344590; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fnCHzkMl/tRSoOoOmfGusYJwL1UrHp+aabajQ/sL5Js=;
        b=UvCbbhFzvXWqDloFrgUx1A3Am0vw5Z0gBizbaxxJZUWaoyZiajHAts/hrRNE/WVo28
         LMhk0YeP5MsUuAWLjxCMnZaEfGplFn1uwSkEiQSZRIl9xGZZyNbxZ9FiDQY2JTLNdZl2
         cgKrL/tzp4oZAfB5ZYlNWSn2mVO2AM5YEg2iN6qBvl9QOOIIdiNc3//A10DBFW135kak
         r+DyOrc7eDZIJ+sDfJFb+ylmVJISuUTMr+3mpEi6//cOpgE01L/9Nn6DOQ3wCff0Ca76
         bEXHvwIKHb8xZwyTCEuZJPB6e3qcrIPWZQa0/VexkmgdXnUmh0+bhB+SNXkgPuzX0wjy
         p6yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792739790; x=1793344590;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fnCHzkMl/tRSoOoOmfGusYJwL1UrHp+aabajQ/sL5Js=;
        b=vRopFHI6D7Qe9SY2VEAwS5ivbi52fJRmsV3xRb0+9xxPf6ItNOTGuJdUCmWW23Se0l
         BMfqi3/IYMjDfugaPCtzGGBYP0k3cYdJxZFUkMHkFUw7dPUEZNvHmXdu7GeEbBzwyZUT
         h/VUzOnKcTQNLvJXBwYX3oPMApXXuTaUuTLsDsLwMqhDk59HkzivoyRJt3ns/6w6hFGf
         fE4o30+i/QRgPb0uFBQ7CwGtRsaA1W35y9dEdp6YNbGBnp4SuulCIAGPpJ6BK+11a/kc
         dD0edoZjOXXAOEG0OW7H9NGrtOnTCwXXASq1LC63bzQDNL6bg8/hJPNmWg8TzmNw4dYl
         VcPA==
X-Forwarded-Encrypted: i=1; AKwUvBxvGRqJRMXbfGmnADlPIIT4ysG1sK1oOYus2JaA4Z20Hp4SYe+9n0ToN3if0gBZBJLsCS9Xj13f9Q5r4hp2@vger.kernel.org
X-Gm-Message-State: AFq9FYKIbVZp2m8fiyvA0xHwK6n+u04N5AuScuMqDWpHRGzI0xbNTylM
	r85lvScp6yE88CyO/+XHtjjl3hDxCyMjxAh09Biuf4iE/iRiUDfJQol+5TJe3/zaMOT64MsneMT
	jFbAVHA9gp4EM2skxwHVCYqAtdXKZVXZvpJK7QdMtHwfKCfW+QnMcyaE5gUNXn7tkaDULt0m12Z
	fv
X-Gm-Gg: AYBFou1WMpqnMx5NymRNMgTtdwdArG/4k75Nmt4c9paImEJW9VsCqTAqxcVvGgl7z9u
	j9BJyAgjp5fSIBQaBEeE5d9dviRpCT3Qbf2FP8AkyHuGHF0qemgKqFHQQKGbTi7xZm73pP0Q8lW
	kA2sb3rgjL8RAtyGM0oT1/RaHlDC+w/UnVCd8X/9fmfIT2HYVkzs4yy4JAJ8jff48V8H1s+59mk
	jtJdAG0804Q/btig9HxJg2b6vn1B872hfEOcHvSyJurKB/nv9NB70rdj24ffhUYmR29LlJ4bzLh
	Hkh6r/vTSJ3CMU4sW/4td9dl6McxsmpGxwsrDYIbSbYDSAw3q8RSCI3Y2BV2K2jrJ1RuxFVVNXp
	IDvkawwWBtHWZ5zPe
X-Received: by 2002:a05:620a:270d:b0:939:5d22:d1f0 with SMTP id af79cd13be357-93f624b1fa5mr751724685a.2.1792739790045;
        Fri, 23 Oct 2026 00:16:30 -0700 (PDT)
X-Received: by 2002:a05:620a:270d:b0:939:5d22:d1f0 with SMTP id af79cd13be357-93f624b1fa5mr751723385a.2.1792739789532;
        Fri, 23 Oct 2026 00:16:29 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e38048ad9sm3287521f8f.35.2026.10.23.00.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:16:28 -0700 (PDT)
Date: Fri, 23 Oct 2026 10:16:27 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Harshal Dev <harshal.dev@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Selvam Sathappan Periakaruppan <selvam.periakaruppan@oss.qualcomm.com>,
        Basant Kumar <basantk@qti.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org
Subject: Re: [PATCH 5/5] firmware: qcom: scm: Drop exported ICE wrapper
 functions
Message-ID: <hwjwaxabshws26kx7xa5qfdxnj3zomkvetpbp73vnl5ugdmvae@vckrsfkyptbp>
References: <20261021-ice-migrate-tee-svc-v1-0-b035be7aab0a@oss.qualcomm.com>
 <20261021-ice-migrate-tee-svc-v1-5-b035be7aab0a@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261021-ice-migrate-tee-svc-v1-5-b035be7aab0a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAyOCBTYWx0ZWRfX8vQmyQPwsDvh
 opzzG54DmiKpwWlRYUGWAKgAhjDJ3R6Tflaqi8phlH2Tw2Ot+sVHt9S9X0lort9MJsXzeVuGUAv
 Ym9axo+Uz7bF9Pc8RP4GtI9psm7ocne77BKdREfzr6a6/C5EgnLLVdpkPs/BPSpd2bgH7PP5opM
 kHaFEoYox37h2WhNKQLlM4xv1BVyuY4eEe/hwWEXZvWQ5SU8qKNC41js5kGw/vo0tcYH/q53ET/
 3woyEkdvVH6Mm5QLPFHeuE0inv8Ko0AAekMAHXNfIXbJrzM3Y4vyOmyqhkPfpwr0y8lz1FnFVZm
 jRB1C2l0XLKZZ+Str93J6G7wp1FICzddX7ryYVzp8go8V83GZg/3dTgJCQ8BuWjEqnfbVA+55KW
 4ddupzg0BKitdJO46ZYHm00GmrQOzUMeQ0Si/fQwUg0i25kTvnCrYW0ThSgxee5z3Oc71bqhoP2
 /30gHXNJyxkDHB9QVhQ==
X-Proofpoint-ORIG-GUID: pRccGAts_pfSMhwtBms9IvQ-GCJES1RJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAyOCBTYWx0ZWRfXzabwPCyHjF4g
 7wArvzZz38tHNcKAcoAMj4HSRLZLsOmV6pwahJyfPNuh3Jls8Ji2aJa7kNMyLwlWbBjWfGduBDh
 gA/k1jERfEmwLcGc5L3KEKz+vH0F0uA=
X-Proofpoint-GUID: pRccGAts_pfSMhwtBms9IvQ-GCJES1RJ
X-Authority-Analysis: v=2.4 cv=GLKdgeNK c=1 sm=1 tr=0 ts=6adb09cf cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=-aaPCLjwiM6LKh8ESrQA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230028

On 26-10-21 21:13:11, Harshal Dev wrote:
> Drop the exported ICE wrapper functions from the SCM driver since the ICE
> driver has now migrated to generic ICE service which allows re-direction of
> of ICE secure service calls to the appropriate TEE (QTEE or OPTEE) at
> runtime.
> 
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
