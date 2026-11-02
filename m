Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793612412;
	b=FcSGG18eA6Q4Uw7FriXDPxdYmuz+xCcD+DAUqO3ZLRknGWEkBFO7WqU523yBUrZHRagn
	 C9Ey8tTs55FNYNPI8KH73bSQawrnsQGWoIXrx8G3XT71ZyUupZ1OQOD2MJB7ewexl7v06
	 b7+Ema4fHj3I5yZt4GkJQqw4jwVie7lwHCWkfySmTi5HBDEFcDOwXQPUJexhwJccJWGs1
	 fLHjroJrb7vyyOD09Q0cTgjywbHXprKd/U0jKCBHEX5MKEILuq3X3dFDgYIJEyM/KNUls
	 5Do+1jTjoktjKT3kQuRkFSrL4S2DLJqlAAS3uFyNGrK/xD7m0YNt1Q9g5UbSfhgZ1eQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793612412;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=0RisWK7U/ImCk7w0ULia5Tu4LqGc3vPjywy19ERXZsQ=;
	b=ebctnT9k4vwYhlgwOMyvT8OKAP2XgxjLjQGyw43t/LmVEk7YpOF/ho/F+K5thJ4UY2xQ
	 6GewKew9nvSffCY3+SiTHGcWG9X/6cdo1qtUFiIhjJim2/XE9lpPwHqSAyR4WcVWkTyj7
	 JER8aiSE48vKwlt+Iw7Snu6qKLgFd+lQTOlbe0boO6GuSzub187hYoomSnUuMZY/Yb9WR
	 bibZ29Gke5tRKmPNoC9z3H2Ytem0XrHBKU2jRHAq47L3WhBOzrQCygD+B6X0ZYlufshUO
	 4VSBblZzpzorQo7pNL/PywtDyivh5uj39nemaXcZeMHmhZiNTvy3czACE2EN9oh4Dxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WYSudKPo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="L1Gxju/0";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3761D606A339
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 09:40:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3761D606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WYSudKPo;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L1Gxju/0
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A3vK2466298
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 09:40:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0RisWK7U/ImCk7w0ULia5Tu4LqGc3vPjywy19ERXZsQ=; b=WYSudKPotsYPLwNp
	JFoW9I3Cr2K2uGjJrsMH3te9gqMtSjWXR5IkLN108Fh63tvro9X41DCJvt//N1FO
	0daUuZWq66VEuJYlYwSMQTkpRvIhpr9N/kiKlHlY9SlrUkH98p7Rzla1sU7ex9dn
	dLDWxBDI12KHmNIkc7UZjaMWj/dI60BE/hu6T0Ogc2hELkoAxpBBVbPefPXm3bAD
	pjuoqkD9WDP459LD+2gMQydsG7WCrErR12pH+TIvkyk7b59bplXjc1+hx3ZLgEek
	zls1FewViGUlgtSmEVyyFBGQcoKOjiaE9cm6ssaGj4yo/TIZcpeQFWEtA4C5SxzI
	bI6o5g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpk9rh4wx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 09:40:11 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-536708d1a3eso4523861cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 01:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793612410; x=1794217210; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0RisWK7U/ImCk7w0ULia5Tu4LqGc3vPjywy19ERXZsQ=;
        b=L1Gxju/0ZhSgeECW9d/nHo6+HeELVdftWMdeLI6PC+S9jYPA4SIyVd7jV1kDMQOhKD
         SyPPFlHNR6qZeZwRt3pxK7pbpiQAZ1NO/VMJghaYY29ordwDo1voThyOIB+23/dR90CW
         Z9bUqIuJ3bskxQ6ZruzjJAfHCBEqYxFXQ/VYW4wjmVbHk6iL0RMT8EeIGssIQeUYC+eE
         aPjRbQg11sK5hTRNuhSM/NjsMvr4KbkMxgQ3P5kJACklh7VeAZYsWf34FBLbq7Pp0sMo
         ZkmjvyhgT5e/aX5VdWLaYdKjNiRg3GTNcpSyc6xAxrMOqCwN8Lu4UAgtmu4Ny+TjMjhG
         eHCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793612410; x=1794217210;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0RisWK7U/ImCk7w0ULia5Tu4LqGc3vPjywy19ERXZsQ=;
        b=THIW2ppe7YKdpFVVNgWnqocyWGROJX/UyGcrykV/7iDj43UvZuIpbzfnGo4EKgwq6O
         p8VwvFT5vYsDx5I51kMtZvPPjw2kOL3rTXRuiZiRyreRTtogr+kWRnTEkRV4sOo+JFgj
         q5tYpQDrGOdPJLmt+YAepIb6ZSnBDBZW6aDQ2DQJSkMG122pyubFxGL0K6hkXB4rB850
         2TbkcjDivbp6aov9RDGJ+J1pXnSNMqu5SO5xJkVTOTDsarLMcgOkG9oZjKA4hbVWPXLr
         CtGpaRxPSklZxQ94aEuRc/46g9KnlMIKSWSrW6fD+Wo0ZGPL6HLr30Gvz1sRGhbK8tS+
         926Q==
X-Gm-Message-State: AFq9FYIJ4J3IuD8awb7VwV7kvA5eWSqo0GRTxcSiOh+dR84mPybaL8g8
	wlbrOyPwiYZcy1oNSz8VTLAihT2RzZBmPrjWr27d5b9CWG8y8SV7B6NtqUghGe1V8g37s+V22qq
	hI16WIiztr/7qUlBE6rzR5xbpb7/mHeicH6Q3DKQ2b8XdqYagIXQmU4kA1VvB6V68GUmC
X-Gm-Gg: AYBFou0sVMPDaeKj/DrSpMOWrCkOtYoy7Do60LLhdYdf3bkOnAgWtcyJYK0k+JpEp1L
	XkblnhdBpjaslz+WxCN33sBW062TQ7ki/aIHyj0bmLG0xu7QfPbFIHnik+/NvJQPwVz7w5oVNRQ
	89VrE7d7SEwFGID6AGf7HVx+XNbw3/BP3m56EKTcEh4jM3HyVoGmgW+BvAYD1XiPg1iRtE9/za0
	3GyxEW/0uC9xtZ1ry2CwQqRhZmZGwcz8oKGDZnYaI1ytAWjALjIA8mIqe6dvhKDh/r1kEcsmT75
	wZRLUAUfROMDfXrtqQh5ZlNWqzVoFeK6EBXcHHBRq6fn1U8EN6LqDnRv/U3nNLXCr0o+JDuWjW6
	+jssocLyKG7AVI8P78lGWJx9epxy2kxoNZ1cGwtvgJskrResU93nRGwTbVIQ9ekcICCZeCnk=
X-Received: by 2002:a05:620a:a8d5:20b0:93f:1eb0:88bc with SMTP id af79cd13be357-944214c4e2dmr1568138085a.1.1793612410391;
        Mon, 02 Nov 2026 01:40:10 -0800 (PST)
X-Received: by 2002:a05:620a:a8d5:20b0:93f:1eb0:88bc with SMTP id af79cd13be357-944214c4e2dmr1568135085a.1.1793612409919;
        Mon, 02 Nov 2026 01:40:09 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabcfd195sm364609966b.23.2026.11.02.01.40.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 01:40:08 -0800 (PST)
Message-ID: <90ae1b4e-d83e-4209-9df1-7ebf778a881a@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 10:40:06 +0100
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
Subject: Re: [PATCH 1/2] drm/msm/gem: Fix VM_BIND range check
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20261101174911.25184-1-robin.clark@oss.qualcomm.com>
 <20261101174911.25184-2-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261101174911.25184-2-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: d3hHnxFBqK4xnCemrJZg_VAJxtah1bSp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfX+fldceqIROx4
 w9tWPn1ZOMloCZJNYxlccZ1+6lJKJBcaQLQVBl//WNapz1uuzcOZNqHR2IrY+2Nnr2ouh+Mwm3w
 tv/wNsz9A58LsvWRL4nl+k4OK2Ns96PMfoTcXkUKBGSgC5spsDG2rJ/MPCUt092yifJDtUdC1ky
 r6ch1QvxQ9pBasqEsFcbiDRIrD7ngWDZTIDI/JwmDPdqsCRelNRM7IKUV0ly9BDaZui0VXYfyU9
 y2tQFESIPbKEbudqOhJOaZqf84D1XjNpIaXDz0Vv3429ebyw2FVCy8AisGnkPU4u27dn0ulGV7F
 6tuIkOIvkPm33pETsDZoxOMEf2pbuFAJUFoImaCwoS1I+zLuNUSV28+bqAObfPZU1HObWnzOmgd
 nX9couzIqn1NAiOc3uxvJDSTXgn0U/M7/J7Lj4kPHF/NIlo7mCADdzCnMJpxX9yQQiwR5BAsBkE
 8sF69Ojs59Lw7ZSO8xA==
X-Proofpoint-GUID: d3hHnxFBqK4xnCemrJZg_VAJxtah1bSp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfX8tEL/VE3yXFU
 rHeFBNh878B7Kh52qSbPZ69jGvQ+uxSWZsyxppt0XiQhcm8Z7/j3M9R7SG3FmdyakarHgp8quOX
 5DkPjwsFASlP94P9JdwcU59TLcpEL1I=
X-Authority-Analysis: v=2.4 cv=LvwHWXdc c=1 sm=1 tr=0 ts=6ae85a7b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=chFjt-TYfWtG2qqLwSIA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020038

On 11/1/26 6:49 PM, Rob Clark wrote:
> Use size_add() to guard against overflow.
> 
> Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Fixes: 3a3bef68a6c1 ("drm/msm: Fix missing VM_BIND offset/range validation")
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_gem_vma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
> index f687a629629d..16b3870d5e90 100644
> --- a/drivers/gpu/drm/msm/msm_gem_vma.c
> +++ b/drivers/gpu/drm/msm/msm_gem_vma.c
> @@ -1118,7 +1118,7 @@ vm_bind_job_lookup_ops(struct msm_vm_bind_job *job, struct drm_msm_vm_bind *args
>  		op->obj = obj;
>  		cnt++;
>  
> -		if ((op->range + op->obj_offset) > obj->size) {
> +		if (size_add(op->range, op->obj_offset) > obj->size) {

GPT and Sashiko are unhappy about what this does on 32b

Konrad
