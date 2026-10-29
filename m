Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793260660;
	b=rjvtwq0y6EF5KLJG8kAdINyvDhr5S47oBJ6Vl1LLTJn7P1pmMHxZyVriZUw/73JYNbn2
	 P04FR53MJt6DoAgXBsr8iT2Lv48qWLfd3KOB9hOuLnG51Aq2JBcDGDkmyTvi130X4tDly
	 eQIFwusQ/Y5D1v1odkAD+Vm1dMyNh+NDpBv3nitH7B8vCNTsBAt+7quuMA6FSC3knz46C
	 ezX+v/mc7ry7k72Cg/jllwLXgy66h3wA6sVe6oWXwZ4EsXiDmldnln+9wBtc7W+fBeTWF
	 QxhYikpiN0pSj3+sVNAfxu2xTzIcVGTU5mbsmNKXJba91eVU7eRuuMrqRnmP3Su04TA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793260660;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9R87gYw/cy5uKWiwAMeRUbz2KigGtGCOWIclDCkHwR4=;
	b=jAPDsqN79EFV+5MJSkIcD+zmMnxM7PANMute2zYbO9RgWSeM+eTbgVtaW2rPAJQfOyl1
	 lx9gEzgzQ0V/3P4G0Ti4qh9Dy5dAJVqAH99438YzpG2znIKOrs/MKrCWVU4BKf/32s8rx
	 Oo+7AKaiN+F13qI/I1HRVcPTbzC5e0XJMPEiZ7kflxEZAFkUfsRAoZfZmqeAmZ4yVPivG
	 rejplEYRLVVLvi+j2m6KkkIbbItaOik8K3OOQdtI1awpqVC0JK2KnKXZJo4supezgf33F
	 1FP6g7CZkF0CtMtf/mpJN82PQoUZcoDB5yTvXUktb5N/zRLMqVNAzw8fsLfEr8t0vBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Bb9PoiBq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TQHlDtiy;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0E8606A31D
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 07:57:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC0E8606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Bb9PoiBq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TQHlDtiy
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T5HCUd3282553
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 07:57:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9R87gYw/cy5uKWiwAMeRUbz2KigGtGCOWIclDCkHwR4=; b=Bb9PoiBqSCoRChvf
	1o890rAKaJB6cQmvACTmekSeLbSwRg9ojrrPtRQHEKwxuouNAd1IePVH3vJAbEJN
	wdw/KnxGmf9kBxNelZfBhP4sFRAwmxAN5iJNeR8iQoc6eji2FZi1Adp4V5l3J6V4
	6MkVBO6ztvLc4SFlMu7SfN8aZ36mffjZn+1aUkvA8JCYGceziBLZbUHHpTMIoLXu
	FgRTFspeyjI/e1yDvcv/86/20uSgs8NIjAn2VX9Oyit1+Ten8GSu4ucnUIpU3BXX
	21wMYCToayu0h9i4xQnoKlu8TsLis26Daudg304YsCnQpkTNsWHHRGcHwKXC7fTh
	wq8+KA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkpgpthu4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 07:57:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-943fffbc5dbso39181085a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 00:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793260658; x=1793865458; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9R87gYw/cy5uKWiwAMeRUbz2KigGtGCOWIclDCkHwR4=;
        b=TQHlDtiyrP3ZkOc/nRLlpzAvZ3DJ7SZ3FfM2N9mumdnCuhE7c3KPzbNzXvrsqo8zUb
         tEakyaUqGjth9LvkdM49DstaIE3sgMZUAVTfc8a+A3920Wh2hBAxx3qhwLh7qYde+QHR
         AEM11TE/7q2j0D6zdNDUUXT/Ff34JlDdHfjvGeijXDtEPxHHWwFJBqYCCC9RQm+Kl7zN
         vZJq+EFacpOuT5HfeeNwaXMWu31laEA9A1UUSvHbiHDUlqYByQEm48/SNkJWvaSjZpXG
         nsw6VtSWmOnxwu0sQrmKOsZpRO9FayhvRyi4A74zwLfs8uv0nMdhugjW4sZTJwIZuhxN
         9uuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793260658; x=1793865458;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9R87gYw/cy5uKWiwAMeRUbz2KigGtGCOWIclDCkHwR4=;
        b=Zr265ElkTi+7LeW4dC8yucqwbTJ3VZ1OCBS2NvLQ1lpWcXhWofflI/llXb3OIvmqDZ
         clb7WBn/XiLzQJxQmbQtzZ1wfVckprFsfrZcckQfxL11AzhPcYyzKd1E0kMkD1zUiOOj
         Kq/RFoaZGX0v48YDTmzjg5vBtGjq6u22clbYc6df6P2hj5Ui2J7zM2DHVQ36iyjxik4u
         +srm22n7+x9Uf45Bi4fuSI30KVqw7IG3OsMnPqunLzv4IFMUkRfvJT/Cf5F34nVskw6w
         LumgzY1VpA0od8V/d2QiEMfD1IARfzq0TV6X1D4tuLZtL63Ho8CyF1GUg9pq7fxnO+yu
         X/YQ==
X-Gm-Message-State: AFq9FYLgxJuEdkT5MRF5tNqTAmDrDBpwIzuQa6whtWl0nGaA/WmhXpvX
	Fr6I8FE/sPdFviBd8TEeUIDqf1SSfSOTCXO9mK0Z3GIEO/duF9N569Q3fxiYwN9Rnmmba9xfCEJ
	FOepkirZBewRkGZ4DU9Ks9r7yvFXoy/prVglblXT9dLV/Htqu7WV/4692MUHmKohH0t1I
X-Gm-Gg: AYBFou0gE8Y5e9AQJLPOhBmXtftRfwmpLlSMdxvakPU2YFLk3qRMrOXMwE0wAvhZ05C
	54Z41bupPJcCFYTKQaBQTySCu+JmuAG9AM1P8ud7AkEhcQ6vCFKnt3inwcpm2sdu+oIvtvImQWd
	WPJEOxJIwGCrWRAnHwdBW9vhZnNIId8MTs38WV7kvLwQNeYTmNasNhAJgk2h8DodVggy5ty9AGE
	JNSdWqJHL9DKAAij4yDgSBCsAschPHY25L4NKcHM+vA7Ylelb63d5F0SxtYpYtTUYZuhJ7yn3ix
	voK0ktFTBNfpn4pKcIX+NXo6cW1EpD9DYkqXEs/dGYsflriSov5wdOCATpYeTwE1JSlXGyYQrwi
	r7W23fdZ//jpn98pcaqaPFe8LLs/UlwbLLF3G3BM/vftXBERCgFTOV0gREyVe2FbXVwL/pZ8=
X-Received: by 2002:a05:620a:3bc9:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-94408d42cd1mr780795585a.6.1793260658069;
        Thu, 29 Oct 2026 00:57:38 -0700 (PDT)
X-Received: by 2002:a05:620a:3bc9:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-94408d42cd1mr780790685a.6.1793260657590;
        Thu, 29 Oct 2026 00:57:37 -0700 (PDT)
Received: from [192.168.226.64] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd650a56sm705458166b.50.2026.10.29.00.57.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 00:57:36 -0700 (PDT)
Message-ID: <66c299b0-d30c-47d9-a6ff-cb0c47d2d789@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 08:57:34 +0100
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
Subject: Re: [PATCH] drm/msm/adreno: Soften no-firmware message
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20261029001601.82269-1-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261029001601.82269-1-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzMCBTYWx0ZWRfXy8To2NnF4NKI
 atAACjhEX0cjtITdhu7436OzFl6jeO5rCFhUR+YdbRcjdTotJbhHSI0qV8kuWQ4zARbPzONBr3N
 8y6LGerDTXo4d4sgTriQc2steRfbeiUNWeLEn4eSFmc98whEOBmAJwbuyUb1UFyptfG+/MxfuqX
 p4d3Zu+3dnHRw6+sS6hJRWWZp206IfLYUYixuzodtwWtmXiltrAhCaLkpgnAL7bz3Revkdtkj1S
 7rSHgVsMP0qlqr9z+iOobgtutlDMq2TWFZnFy6558oFQw5w/3dUdS5Ej38zU7d0323e5z5Hwizx
 nT/Oc2iyr57m1XbXyYCxnkGUpamnekOUVCHcn7InyuDNqexXE3Z85XmBKbvTeG/LKOI84j7uqvT
 TfhiKR6J6MeDh6a6hCZt+Zoq1y2BbChcALQbuVZu5/hhYTDNdv8Sk0fxkN9ctUEPvUStlCoWqD3
 IG8HfT8aLSn95NgX/JA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzMCBTYWx0ZWRfXwRqqNwSJGKIa
 9SjyKhzj9lc7oJoaHp4URIXVCJGPCgJYbau3ecmFWMd5ZH27gbfEH0S/KiS7b0kjyYvpm93+ULE
 FchtMgsoPqVD7Zq90todl9smg8CehF8=
X-Proofpoint-ORIG-GUID: BEXQrwssLnFw_Wrr0cuBmwsTUyPln7r4
X-Proofpoint-GUID: BEXQrwssLnFw_Wrr0cuBmwsTUyPln7r4
X-Authority-Analysis: v=2.4 cv=T4oZ3PKQ c=1 sm=1 tr=0 ts=6ae2fc72 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=MTgaiBtVHodLpOmOn-4A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290030

On 10/29/26 1:16 AM, Rob Clark wrote:
> It isn't _necessarily_ an error, the driver will try again each time the
> device file is opened.  But if you don't have GPU fw in the initrd, you
> end up seeing this error message at least once.  Which seems to confuse
> users.  So try to re-word it slightly.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
