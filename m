Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795772784;
	b=ZN1HmtwNDeL7P4XF+U7uKXGAk687EKSi2HL9GscnJw2zA6ELgaJcKq7sTx70ADXyfaT4
	 gEGt98iDqN9n5GlfOfyPUwVvkfAdTeAjt1cO8SIfFR5wlu98wboklRX9F0JHP/JeHeA1a
	 z/vIBbbOjRYzJ4MYCxqUlC3CmD4Lokxl4Kz+/WNNtcYywzZGQx1rqCO6U7nFlOka5o5xs
	 BYa1ntXicHOntgGQB8pjnF2+nnCWXVDu93p7qi1XupHkqZiftwbdkI9O3jefAwpT253UD
	 vtnRl6LYNppVj24pknDfbM56jPAxmwfGlWksYrNBMDtpb0U4PPX26C8qONR+Ue4Kj3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772784;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:Content-Language:To:Cc:
	 References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=YxKSlO+moGy/0VDy261jO9fGPMmC050avn3F2JluBAA=;
	b=Hoc2CKYe1SvOfZQxAeVbz5qnfVneAHxLkyo6ZiGQ4X46kqW/EmX03Z9UiX8nGPMBpZ8w
	 IVsk+4IL1ZpoLDeQ6siNRvsADYo627iF/xKkZfZgiHpQAH/6ZehWGFVXDVLzag/HrImsy
	 +YfX2bGRqIRnTthfbEzGvlVVeDkPLxDo/neNc6CcOc6cH3d4raI4FiFqdy4NUAQAMx4Wl
	 q4Tf8f+efQ764E41U5oyH5a8CM8LIeNIJc958PuuAPtyG97rERW/pdYJGu4cdVgZDBYh9
	 AxcfP2V+8wUuqjKQ5u3unoQV7M3zl6wfPxGTyh9FapA1CQBFVRlZe1Pdj4SkVPUQRPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TqgV4653;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FSUWuVEY;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B62606A321
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 09:46:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48B62606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TqgV4653;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FSUWuVEY
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7GYBT2188181
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 09:46:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YxKSlO+moGy/0VDy261jO9fGPMmC050avn3F2JluBAA=; b=TqgV4653DkLm6qkz
	RlPLfQBpnyFjhT3TU+1XMh9kPuI+jN3rszvdilnmyVAVaah5E85sngPVHehl6kiN
	EB0YWygwrJON462cztZYudwLWboBJCWeTTfZUlLOhRSahJjp//V4jbnZrWKKqU/n
	Ta1mIJhLmKi/uf3FyrOD9+vZx7tjtpg+CUUWnu7AGpbCf4A5GSyVF1DV08goR0gP
	rmuq1VmWqUOoWu8xEtRrywr3teSbzl/QTHLq/RuSJtMLu2xf1QUv1wKPj43+fk1j
	Qb1nt1EllfZjGevExiaZxtEYu3mXgwzmW7MuMbVvj2xCgPL7VzaYlrh0kUy8WEab
	w3VyYA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74gh8s9g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 09:46:22 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-386b8624cf7so6680601eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 01:46:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795772781; x=1796377581; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YxKSlO+moGy/0VDy261jO9fGPMmC050avn3F2JluBAA=;
        b=FSUWuVEYy2Z3A4FjS3mYNm51kUraX0wPp8a/BGuYCrlvu5tVXuDj1fl9soR3mvEKZT
         EJs91zKwnRd3uVtbL+z3b/yequfp5+YF31Hz3i1gW5VA5jbbnR/3yZ6ibBIkIXN8C2Z2
         ik1zeLyoknkaXy8I9P94vIDcvT6L41D8KK4g5ZXDybqoJhNlz2GIq3RoEgELu6n+Bn35
         9lMZ/c9ZjD9mKSDpMSaWok+aSv0cIbN5cWTkg/w5JvW/ha24xYXNo0bOcKABAngbGJPs
         36apGIaqjdIEUUS6fKPadbrmaDBMkXSyAQMN5Y2k3J5vjFXcRi7bDBzYHW6oR5bQMj1M
         mq/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795772781; x=1796377581;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YxKSlO+moGy/0VDy261jO9fGPMmC050avn3F2JluBAA=;
        b=fbmsL0poHdthsSD3cAMWvbv21hoJGYV6aif2qXstmms9EIlNg6E0JPzuEkXs12u/1U
         z51XUraHdCsmk/U1UKGBqKKDIjXtly9OcKsWU15+VJaO9mONfKAPNAztjY5ZTFcJrPdz
         vmBEmrCXvGoItQpaPdKQ+qPeHmiK+AmQ+71PjhyZ8RetQ41s5/KiTFqU22DAxHXgeJ/e
         Drrf2IIoKToh/ufUrC1ZTkm2F/C2R0SEts4VdGq1fGMoMhSDO2S0PbfHtzhoTh+lBnpm
         awyXBM+mwxs0KB/PxSDtrEZHYaQmeVbhE9cWWcHzqD9KQ2KXjZRU8hZYGD6fsTGCHRkn
         WS3g==
X-Forwarded-Encrypted: i=1; AL+hErEfq3KrSSwBTu7gkARMLMY/w6ZFUuiBTuWArH9TfiltcH0n9N7iZnhneYRdaOzR4qanzTp+MBI80BVaxOHx@vger.kernel.org
X-Gm-Message-State: APuU4Z9JIngGIfxoOyAYaRm2xfcwhNMqx6cGXbQCGBYrUgXgMyT1dJxI
	TY///Uy+uZZAnpr/adFdySpf9kEjwm5Xd4x8E5x6LPJnmIt6cJLL7WT6yEgbCJg1mGONOeuMngk
	Sbbu1eos3MdaV/cAOYfvmHiTN9wOWE+MonXnNSrU/5czgSVH9pU2Th/5UGqvt3onnNJie
X-Gm-Gg: AZFdTZdVrPTFzJy+uZnGZqJrUSE1a2CG4rRWw2zk++bxr3an2AGZknxr9IYA41xsdXs
	OzskOBOGk0+uxWvt6vQ5YMMlO5K6AKhsWkY6ZC3jPa1nddssm7Uc/O1I4xMEM5A+obyrFPrbWtE
	OIujPer4n8sJTzZruY3dp3JgoCj1p7eB126bZ8yoFvCQv9rR9Gy6csekwj93dUEvWvHb3nycPqp
	+bMfjjAgI76lStB93C1s2DxRvXvr5rm1Pq1RDkZOM8aw0iKgUKlkpQ3GFXOMu5+Slld7n6dtgGE
	qsmIlGtstgOEizt7tczZvOUVrPUCfHzcp/9xaFc3tUD3dn+OOdRGxarLnpOsvJFnXDGEjiPwsk+
	nd3msL7ksc4FO99N/uLnNLdrS1HLq5+K6rmiL6TIjhhh8Su4DWFPp8B5t6jwA0EMRwcSWau6IoR
	Wa4BEP
X-Received: by 2002:a05:7301:dc3:b0:386:ce5a:41aa with SMTP id 5a478bee46e88-386ce5a47f9mr7306866eec.13.1795772780934;
        Fri, 27 Nov 2026 01:46:20 -0800 (PST)
X-Received: by 2002:a05:7301:dc3:b0:386:ce5a:41aa with SMTP id 5a478bee46e88-386ce5a47f9mr7306841eec.13.1795772780452;
        Fri, 27 Nov 2026 01:46:20 -0800 (PST)
Received: from [10.204.100.41] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm66869920eec.16.2026.11.27.01.46.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 01:46:19 -0800 (PST)
Message-ID: <6ca6b0f2-575a-6c1c-5b97-73f22d369438@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 15:16:12 +0530
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 4/5] media: iris: Preserve timestamps on error buffers
Content-Language: en-US
To: Xilin Wu <sophon@radxa.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>, dragon@radxa.com,
        Chris Obbard <chris.obbard@oss.qualcomm.com>,
        Deepak Sikri <sikrid@qti.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Loic Minier <loic.minier@oss.qualcomm.com>,
        Jason Pettit <jason.pettit@oss.qualcomm.com>
References: <20261029-iris-va-fixes-v1-0-44a2783f782b@radxa.com>
 <20261029-iris-va-fixes-v1-4-44a2783f782b@radxa.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20261029-iris-va-fixes-v1-4-44a2783f782b@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzOCBTYWx0ZWRfXwX5fvIUkSIxC
 9lFdSJJAt47ZLqmewLCdIyHAf4femj+7eFq48D5eIaErF+EeplrbM1bDjCCmtmm7CjZz0B9Oca4
 AaiuPU/xwcJzXxL128eIvC1GuU/x1KU=
X-Proofpoint-GUID: I_Sl0sIWUsmhBKQ1Qxjl3Gj36oKfn3og
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzOCBTYWx0ZWRfXyCFTqTwGksuq
 siYDwl1bc9pRWuwTr2cJa4YyPxEn3EPv+pH/7LfWUqPhaGdzRaunidDmoAUrhcl0O3Wq8qArJb6
 CsUTHdnP5HiUDk8sk5dXnjFDE8p0/sSCeVRsXkO5aFZaFIBgYLSORa/W5EAs4fyXPTj6JUj/e36
 dVgj0STtNpuojwy4r8oGgPSZEX8pCZfrgnyhjP58wlzWaktun9f1QQARvE8StIj9p7BbSb7luhE
 VK1BN1XXL0zs034hNzXb9N98TODUQ8TjX4LQDX7y+/JRombSO2oV++14QwqPyiKy4dfE9eqT7UA
 jGTEN2MDbaAryjD5159wU4ZTNKpTzgO6Zr9p+YWYMKWn764QZH3hfGiEh+/IukP+Fn3Ci2U6YB6
 B/iqW+xGduOaTYIjMF+qiBIeC0cWOUQ9OyODXBooWF6Q8+CJbCo1aPPqIC7HeOP0UN8AOhx1Fk1
 MjG9NLoEz33MAlpgBMg==
X-Authority-Analysis: v=2.4 cv=U5kHnuru c=1 sm=1 tr=0 ts=6b09516e cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=ksxQWNrZAAAA:8 a=EUspDBNiAAAA:8 a=pyson8MKFhwrqUQxeQwA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-ORIG-GUID: I_Sl0sIWUsmhBKQ1Qxjl3Gj36oKfn3og
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611270038


On 10/29/2026 9:28 AM, Xilin Wu wrote:
> Clearing timestamps on error buffers prevents clients such as libva-v4l2
> from identifying the failed picture and can cause synchronization timeouts.
>
> Preserve the firmware-provided timestamp when returning an error buffer.
>
> Fixes: b791dcfcba3a ("media: iris: Add handling for corrupt and drop frames")
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---
>  drivers/media/platform/qcom/iris/iris_buffer.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
> index eb8de60c1177..f790483d13d4 100644
> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
> @@ -899,7 +899,8 @@ int iris_vb2_buffer_done(struct iris_inst *inst, struct iris_buffer *buf)
>  	if (buf->flags & V4L2_BUF_FLAG_ERROR) {
>  		state = VB2_BUF_STATE_ERROR;
>  		vb2_set_plane_payload(vb2, 0, 0);
> -		vb2->timestamp = 0;
> +		/* Allow userspace to associate the error with the input frame. */
> +		vb2->timestamp = buf->timestamp;
>  		v4l2_m2m_buf_done(vbuf, state);
>  		return 0;
>  	}

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

