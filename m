Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793915895;
	b=U9XrmcBnazeO5Un05gZ4wuOLxW3ShKiowiF2XDcm+e/ebanZ35kDEbmNfqsNuAGbFLEz
	 VjYDtsuU63ar8O2ZLwjF9EShMGP6Z++OBtpZ4gdLR6fsPmlu/gDxkpDkVAXIeFWeP3wix
	 DSX95D5yYGeXAbyOXPOxPL+BfSK4IdlRbMvXRQuPva2R80pXS9sWW+SlNGtpPZjhNiIxP
	 PKZlWafGjjbbKXrUUtt0dLwYh3HCS9VQn7fIadohNO6NCoiRhFrt6Km5+nwKdw4H7PgrQ
	 BYd4o1F50cmiiJIGHUH8nY8mGmV2ff3fjEXCli6+vLl2ei2/9FQAqUku24YFaB3Qvqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793915895;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=la31nE+r5Wjkc5I+4kvYjaUy2Ab5etDtNmr/mKr9EWo=;
	b=TTTt5k1n3Sphk/4CwoJ4SzU6JNXkQAmg9kc+txzyfwjRRPbMfqO1Orw4AyW3yR9SJ6v2
	 z/zmxU5AI7LdafMhSfJe7GEUKES6xsYm+aJptNNrZLA3Y9GG5HVJCPKfU1XrpE5gKNNkY
	 mXHTyxyzcnr13ic5OD4HTFhGP+M8qF7ZsU90enDGmTwSj16QtWILi/0davHzCZAfyAlSR
	 lHN9pRHhOwD9x5PLgTet8EexSBVz551yThpndsqlJ8Sz2EKd2Q8Z0MBw+gL2LNFTCbVMa
	 A3Z0SmDQBEoG18evrMhY+jpxPCi3yg81SNESC31uc0F7g+GblE/YRSn1S9ZFzL0EEBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ksW5kuTU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E28if4L8;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1205606A326
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 21:58:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1205606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ksW5kuTU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E28if4L8
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5L6Or72529113
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 21:58:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	la31nE+r5Wjkc5I+4kvYjaUy2Ab5etDtNmr/mKr9EWo=; b=ksW5kuTUtdme20pL
	Q4rm5o9B+T3Gq9tLowI20h6thiSKw2uAPDiIHNDyyn/+/KCYtuwj3cVZo0e91rxN
	KVAB57ma03rSDSU8RrA1muxaelrZFB69qP5riUKkNkzk5+IieBhxvq1BT7Hi96br
	jThd0cNAXIYbASnaEI+txk9Dy4PyZJp/l23J0uBIZxXK7dUghgyFsc9+4+MQCXKr
	w/9t6SKIDOA/yalWiWOj8U2mWEEmdgEwXusjYFo2sQqY2KskO12THKv/MXV+AUSK
	KWgXItncDQOH0l7xfcqQNcbSLAJZ22ALKvBimumAeWkzNmPj7w11Er9nrJoOU5Zf
	bKuAGA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hryw18m9j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 21:58:13 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1b20a4b5f2bso64355c88.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 13:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793915893; x=1794520693; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=la31nE+r5Wjkc5I+4kvYjaUy2Ab5etDtNmr/mKr9EWo=;
        b=E28if4L87oKC5zqf81wZgyXsvrkXYvumqWf8eOHT7Pq2ucK6FDXnAoeCVR7tjinUWK
         jPmLz/Qm+knNiz80Skn14BEeXVK8i3VMaXK1ZwHRLq+KiL7RwEfvSfX20a79oNU9yFd5
         heMN91zsCZfSUq/n+ouWjRlHm0drnTLwhqmF92fRFzFt3FqUCzsXQ0Wdp5SIpDD0DhmT
         fzkuVnRPLW8welGpYxUm/N6P3KPLfcfipAvFXpV9SX4QqsboY/KEBm7kBS0mucu0eAyE
         hV1tHomcLnI0ZGYXR9e6rltQowS8cIsCUI6wi7aam6moh5wxHW18TiXUptU47Zfukvwh
         i9fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793915893; x=1794520693;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=la31nE+r5Wjkc5I+4kvYjaUy2Ab5etDtNmr/mKr9EWo=;
        b=Hb/41ZzDYiHkqgJ9nFL6Zi5kcvfnQ5GzNGoj2DGcXxmhiOLNNBaUm4OuPkLEgL3Nl6
         aGmf8x/U9/pzVtyoHHo381ZbOAz+NChGebzG72cAqCKTRYS8Iq/cjMZ7C+UpDlV3ySE/
         hIQ4roFxDf5B6Mwg7wQcN/rZchBB/VV5HIMRfwpE9ryoKV2trUyRUUUixj2S9zG4Dd5d
         dS3hqHHGLyIpmoJb56Dd+thbKaeB9zhoS7h8fvjcaQ5tC+xGzBToNNMpK0tm4i7D7lzb
         FOvyyXyMmtf8wlMDZIKCG4xXQ0sFK+vSFwdMzuDQEgHnrM+fL91WmoKwNsmVjD9biTAN
         1nqA==
X-Gm-Message-State: APuU4Z+/bcs0tgzv3wrCShpXkZkJ5z1817kwfkQaoVKi8z0wMQ6aYuJF
	cYX07tOzGHamYA5pbud+qq2T/Xrb0Uaq2+4psk/0taL5wGIIJT9loEPLO2cRRUBJ1UL/xu3Uyh0
	/FRloyvSjtfUbIQSxqmNk69p2IuILHYO+L7xdaXNwD3jeMhvS5glP368oWDhJu7wlUbmY
X-Gm-Gg: AYBFou3bA8qpb4Q152C3bRUaDxNY1MBzl7EM2SAEDF5fDz2GRyqNK5zc11fOEP81+Zd
	+PAtgNKo064fV+d/9DsgiyCBn0Ck4zDXj4RZq+bqvtfytcQPXrUreHV1NdrZ6tZwtFb/AArOnAN
	32unAUXmGaRkTbYDmAeeVvfOX2F9N6cM0TLi/4KLzShYEhs0RtMfcyslLzK8yMyTxEhaWCHZl/q
	X0EiA/mvnK7GlT1gyl2vY0+Xgz9+rrjFvnhgKRFOXIgFtZWammdYiKjBloy8Yj0kScEvDnVhXWb
	2IvXhIYM2bXldsy49aDuxqsfwhq7CrQGco3FKXp71HjPywSBZa99l+rbIZqxRBwUBji+hbLdxkC
	X7u7NaMS+I6g6cddonQef578KvyVe/8GtpPi6MY/zL7NKyi4HtCnxFQURhwMeR2u9J46Dae8=
X-Received: by 2002:a05:701b:4281:20b0:165:90af:a25f with SMTP id a92af1059eb24-1b25d36e618mr419942c88.41.1793915892692;
        Thu, 05 Nov 2026 13:58:12 -0800 (PST)
X-Received: by 2002:a05:701b:4281:20b0:165:90af:a25f with SMTP id a92af1059eb24-1b25d36e618mr419857c88.41.1793915891501;
        Thu, 05 Nov 2026 13:58:11 -0800 (PST)
Received: from [192.168.1.9] ([106.222.231.155])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245b8822fsm23076429c88.2.2026.11.05.13.58.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 13:58:11 -0800 (PST)
Message-ID: <0d7cf70f-cc16-4d9f-a53c-7f2f9e3e509d@oss.qualcomm.com>
Date: Fri, 6 Nov 2026 03:28:04 +0530
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
Subject: Re: [PATCH v6 07/15] drm/msm/a8xx: Stop getting GMEM_PROTECT from
 nonctx list
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Nico Angelo Dela Cruz <nicoangelodelacruz@gmail.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20261105203057.66520-1-robin.clark@oss.qualcomm.com>
 <20261105203057.66520-8-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20261105203057.66520-8-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: -T9JskXOJUcaxlweQsbC-eCELzbLfPyq
X-Proofpoint-GUID: -T9JskXOJUcaxlweQsbC-eCELzbLfPyq
X-Authority-Analysis: v=2.4 cv=RdYFmFtv c=1 sm=1 tr=0 ts=6aecfbf5 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=Hj0ah+TxS5FywmoD0uLh0Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=QD3LnjK7qLuM3IoIZgoA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA4NyBTYWx0ZWRfX2u0XVZA3ow1p
 1A29O1USyRudJ8hqhBLfNlKoCe5ing999yBL9T/Mm4A0vqJgummzR2bvxB9UF9DK7FAMQ84XzxH
 4uzand0dKc/qVpv3gocbq78XId3SOzxzO6sAjDXSEhJplLeskHL7xyTY+Z0mg2+t0NMum33jzzn
 2Itpht06WecGAEdhQ+h+DuCMrvhmbcIm2ymPbWmJ/W2908zCNoyFWIi9DFBOsd08phLBOCkghfK
 znmImojA5jXw3UHdDuap2z0U7+ph8GOlxTu/rSMPTCx9zYg6mx0j12R/vRGn1BiRSU2wt16t2Es
 1g7d3QO2FHtqhtHvk72o0L97x4JmmNtEny0BFFUS3EHWAkE6WxoSLf7tksBhRvcCKkF9+UHW/TQ
 J2knf6EVKXevDP1fGAyiIhA7xFSiFiqouN45o/SlYFM9tOHKVAAosAioi784a6gTKcYb1EK/MUm
 uwlbxfRhTLmfKmzeYmg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA4NyBTYWx0ZWRfX/NAJNFlHY/7h
 w6uh1+e/OXqt6NGXkldag7zHMTPvdraIQFQpVZMYb/35O/hALpJRGQ/vAxXEEWeay2bsQfejEwM
 MYjlaxSYR9Wh75/k7g8muTT0AttWLXs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_06,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050087



On 11/6/2026 1:59 AM, Rob Clark wrote:
> We can just simplify things and calculate the value, instead of manually
> adding it to the nonctx list.
> 
> Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil

> ---
>  drivers/gpu/drm/msm/adreno/a8xx_catalog.c |  6 ------
>  drivers/gpu/drm/msm/adreno/a8xx_gpu.c     | 12 ++++--------
>  2 files changed, 4 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a8xx_catalog.c b/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
> index dd1a5ca91812..6c5ee227243a 100644
> --- a/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
> @@ -27,7 +27,6 @@ static const struct adreno_reglist_pipe a830_nonctxt_regs[] = {
>  	{ REG_A7XX_RB_CCU_CNTL, 0x00000068, BIT(PIPE_BR) },
>  	/* Partially enable perf clear, Disable DINT to c/z be data forwarding */
>  	{ REG_A7XX_RB_CCU_DBG_ECO_CNTL, 0x00002200, BIT(PIPE_BR) },
> -	{ REG_A8XX_RB_GC_GMEM_PROTECT, 0x0c000000, BIT(PIPE_BR) },
>  	/* Configure number of outstanding transactions to 32 */
>  	{ REG_A8XX_RB_RESOLVE_PREFETCH_CNTL, 0x00000007, BIT(PIPE_BR) },
>  	/* Configure UCHE request time out to 16 cycles for CCU/UCHE arbitration */
> @@ -309,7 +308,6 @@ static const struct adreno_reglist_pipe x285_nonctxt_regs[] = {
>  	{ REG_A8XX_PC_CHICKEN_BITS_2, 0x00000200, BIT(PIPE_BV) | BIT(PIPE_BR) },
>  	{ REG_A8XX_PC_CHICKEN_BITS_3, 0x00500000, BIT(PIPE_BV) | BIT(PIPE_BR) },
>  	{ REG_A8XX_PC_CHICKEN_BITS_4, 0x00500050, BIT(PIPE_BV) | BIT(PIPE_BR) },
> -	{ REG_A8XX_RB_GC_GMEM_PROTECT, 0x15000000, BIT(PIPE_BR) },
>  	{ REG_A8XX_RB_RESOLVE_PREFETCH_CNTL, 0x00000007, BIT(PIPE_BR) },
>  	{ REG_A8XX_RB_CMP_DBG_ECO_CNTL, 0x00004000, BIT(PIPE_BR) },
>  	{ REG_A8XX_RBBM_NC_MODE_CNTL, 0x00000001, BIT(PIPE_NONE) },
> @@ -483,7 +481,6 @@ static const struct adreno_reglist_pipe a810_nonctxt_regs[] = {
>  	{ REG_A8XX_VFD_CB_BUSY_REQ_CNT, 0x00200020, BIT(PIPE_BV) | BIT(PIPE_BR) },
>  	{ REG_A8XX_VFD_CB_LP_REQ_CNT, 0x00100020, BIT(PIPE_BV) | BIT(PIPE_BR) },
>  	{ REG_A8XX_VPC_FLATSHADE_MODE_CNTL, 0x00000001, BIT(PIPE_BV) | BIT(PIPE_BR) },
> -	{ REG_A8XX_RB_GC_GMEM_PROTECT, 0x00900000, BIT(PIPE_BR) },
>  	{ },
>  };
>  
> @@ -709,7 +706,6 @@ static const struct adreno_reglist_pipe a840_nonctxt_regs[] = {
>  	{ REG_A7XX_RB_CCU_CNTL, 0x00000068, BIT(PIPE_BR) },
>  	/* Partially enable perf clear, Disable DINT to c/z be data forwarding */
>  	{ REG_A7XX_RB_CCU_DBG_ECO_CNTL, 0x00002200, BIT(PIPE_BR) },
> -	{ REG_A8XX_RB_GC_GMEM_PROTECT, 0x12000000, BIT(PIPE_BR) },
>  	{ REG_A8XX_RB_RESOLVE_PREFETCH_CNTL, 0x00000007, BIT(PIPE_BR) },
>  	{ REG_A8XX_RB_CMP_DBG_ECO_CNTL, 0x00004000, BIT(PIPE_BR) },
>  	{ REG_A8XX_RBBM_NC_MODE_CNTL, 0x00000001, BIT(PIPE_NONE) },
> @@ -1102,7 +1098,6 @@ static const struct adreno_reglist_pipe a845_nonctxt_regs[] = {
>  	{ REG_A7XX_RB_CCU_CNTL, 0x00000068, BIT(PIPE_BR) },
>  	{ REG_A7XX_RB_CCU_DBG_ECO_CNTL, BIT(10) | BIT(9), BIT(PIPE_BR) },
>  	{ REG_A6XX_RB_DBG_ECO_CNTL, BIT(17), BIT(PIPE_BV) | BIT(PIPE_BR) },
> -	{ REG_A8XX_RB_GC_GMEM_PROTECT, 0x0C000000, BIT(PIPE_BR) },
>  	{ REG_A6XX_RB_RBP_CNTL, BIT(5) | BIT(6), BIT(PIPE_BV) | BIT(PIPE_BR) },
>  	{ REG_A8XX_RB_RESOLVE_PREFETCH_CNTL, 0x00000007, BIT(PIPE_BR) },
>  	{ REG_A8XX_RB_CMP_DBG_ECO_CNTL, 0x00004000, BIT(PIPE_BR) },
> @@ -1161,7 +1156,6 @@ static const struct adreno_reglist_pipe a850_nonctxt_regs[] = {
>  	{ REG_A7XX_RB_CCU_CNTL, 0x00000068, BIT(PIPE_BR) },
>  	{ REG_A7XX_RB_CCU_DBG_ECO_CNTL, BIT(10) | BIT(9), BIT(PIPE_BR) },
>  	{ REG_A6XX_RB_DBG_ECO_CNTL, BIT(17), BIT(PIPE_BV) | BIT(PIPE_BR) },
> -	{ REG_A8XX_RB_GC_GMEM_PROTECT, 0x12000000, BIT(PIPE_BR) },
>  	{ REG_A6XX_RB_RBP_CNTL, BIT(5) | BIT(6), BIT(PIPE_BV) | BIT(PIPE_BR) },
>  	{ REG_A8XX_RB_RESOLVE_PREFETCH_CNTL, 0x00000007, BIT(PIPE_BR) },
>  	{ REG_A8XX_RB_CMP_DBG_ECO_CNTL, 0x00004000, BIT(PIPE_BR) },
> diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> index 59898b49a201..f65bf82e5c21 100644
> --- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> @@ -370,7 +370,7 @@ static void a8xx_set_ubwc_config(struct msm_gpu *gpu)
>  		  hbb_lo << 1 | ubwc_mode);
>  }
>  
> -static void a8xx_nonctxt_config(struct msm_gpu *gpu, u32 *gmem_protect)
> +static void a8xx_nonctxt_config(struct msm_gpu *gpu)
>  {
>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>  	struct a6xx_gmu *gmu = &to_a6xx_gpu(adreno_gpu)->gmu;
> @@ -390,9 +390,6 @@ static void a8xx_nonctxt_config(struct msm_gpu *gpu, u32 *gmem_protect)
>  			if (!(BIT(pipe_id) & regs[i].pipe))
>  				continue;
>  
> -			if (regs[i].offset == REG_A8XX_RB_GC_GMEM_PROTECT)
> -				*gmem_protect = regs[i].value;
> -
>  			if ((regs[i].offset << 2) >= gmu->mmio_offset) {
>  				gmu_write(gmu, regs[i].offset, regs[i].value);
>  			} else {
> @@ -638,7 +635,6 @@ static int hw_init(struct msm_gpu *gpu)
>  	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>  	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
>  	unsigned int pipe_id, i;
> -	u32 gmem_protect = 0;
>  	u64 gmem_range_min;
>  	int ret;
>  
> @@ -719,7 +715,7 @@ static int hw_init(struct msm_gpu *gpu)
>  
>  	gpu_write(gpu, REG_A8XX_UCHE_CLIENT_PF, BIT(7) | 0x1);
>  
> -	a8xx_nonctxt_config(gpu, &gmem_protect);
> +	a8xx_nonctxt_config(gpu);
>  
>  	/* Enable fault detection */
>  	gpu_write(gpu, REG_A8XX_RBBM_INTERFACE_HANG_INT_CNTL, BIT(30) | 0xcfffff);
> @@ -838,8 +834,8 @@ static int hw_init(struct msm_gpu *gpu)
>  	 * GMEM_PROTECT register should be programmed after GPU is transitioned to
>  	 * non-secure mode
>  	 */
> -	a8xx_write_pipe(gpu, PIPE_BR, REG_A8XX_RB_GC_GMEM_PROTECT, gmem_protect);
> -	WARN_ON(!gmem_protect);
> +	a8xx_write_pipe(gpu, PIPE_BR, REG_A8XX_RB_GC_GMEM_PROTECT,
> +		        (adreno_gpu->info->gmem / SZ_4K) << 16);
>  	a8xx_aperture_clear(gpu);
>  
>  	if (!a6xx_gpu->pwrup_reglist_emitted) {

