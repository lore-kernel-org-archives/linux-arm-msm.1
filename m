Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793006472;
	b=EMLMD+QAFIujvNUvzYggNJsuWIboS2oohKflEZjfsd+x6hqwPb/NcStM1DkuSHRv+oN1
	 bXqDrf0+eaTMtFDlhDBD/WGQvGXCU04K7O0A2PerUlQFF6Wn3mEOyKanBSEpGESHdCm2Q
	 M/7GJwjddgSupjEs/tosMo/6qH3GbsTb+PofB0Z9ohZaSy26FKJsXqok64e+gC9TNm4+x
	 WEEVRt0JZ45Vyaj+Y8xi/jsRFHIPNia2nVifyJuikBB1C+NEa1P/p2qWefPcGFWta6MKR
	 YvhWz6aTZPBp3s3uTSs1oepRm/unGjCpK6HE5D2i+Wh+wKGa3D1TngnOpH0fN2EJySQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793006472;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JYl7nG9VCZ7POIwjt2f7CoGn454MZk1gl17DIn6O5n8=;
	b=AjahFQVhKfR0JRaOkzOWZsv6W161t0mTCc+U8jR4Snv6X03nhHq0yk0Oevhj4QRAfhCT
	 6vf16WbpTFmmKdTcBjgIt8MLgU+uShNsH096XAc+cbDJc/+FR6Bdr71pGVEg2iqu3jaEq
	 j9aSyniQEguNlo5OeQMknMO7e9cUa8B2jcZoDJtFZ8O9A0OZYS77GJ5e9hmQ3qtEkkL2o
	 /JV+TB/A/PmKL2xGa/No7THR+iMSfLCI88ZInIrU/c3ni38iix8htUqrz0JOPuP3isL2b
	 +ltioICQJ+RXs9yEC63LRq+vQgGqgqaENTJXtehTkp9KCdwdEGU75pSA0Qd813NRKlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h6Y0oEWA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X6PnV0xR;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC23A606A31E
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:21:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC23A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h6Y0oEWA;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X6PnV0xR
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4aqhn1181756
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:21:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JYl7nG9VCZ7POIwjt2f7CoGn454MZk1gl17DIn6O5n8=; b=h6Y0oEWA0ENairNF
	O1YRQJwuTXnKRSqGAu4ITnPg5XNsSEgeBHRCuP8GxMUL0vikQ8kCgR0ntF6Imybj
	oNrLvXThJt6y1gbvrB3uqu5Q1rvYyorZkSL0bFIQs1kXR6IGJOKv7D+bGYUFYgZ3
	Jeq2hgPafQaLfS/Wz4kvEMqNNwgO8xBSCe9jWhidUdueJDzTzZ3HULwfBYaNjHf4
	PkYL6iTf4G7rvwzs4Jr8b8/MjEKO1x3eVJhz34fiWxMA2fHdKhYVfnlhw6EjkJPf
	Lz5pPO4pjIryofSl6wX3ZqsGDtaZzkMeuxMTwcJkD+6U6cax9BgtQitN1GdK+7IM
	WeJ0Qw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgn27wp6b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:21:10 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cc50fb0d2so43859585a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 02:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793006470; x=1793611270; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JYl7nG9VCZ7POIwjt2f7CoGn454MZk1gl17DIn6O5n8=;
        b=X6PnV0xR9woVRNgSiO6dCHb2ehUj3leZFWLD70JovJu1iAB2YlriMiTpl0Pj61242g
         eaoXkC+YLdS57AZn5CXtBuxrxl8ccNpQXDabTe2yhqBA2kKqMqRr9cDbgoeuNjfkqgM5
         pCdfr1l+ulLTK6YM8jar0DExhwR5CqiqJJZVaiiUZN1pCspm3/Lk8UCVqK/inhvAAK85
         Z5S7gZBhzO4YMmcSDdFjGgVjHZEREgtkEdSisE1Ng5iaHx0KFlVw+T6Xjuiz0Csgo4HJ
         ECTIPaEX7g70nBTYD72LidsiEW1+lEG3XmIW70QZiz6m+SfniOU9iOspH2rKifI4Cijv
         ccyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793006470; x=1793611270;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JYl7nG9VCZ7POIwjt2f7CoGn454MZk1gl17DIn6O5n8=;
        b=J6os71GBj+y364wGXvVmvKZUZGjxVimfe516kZHHEMO6G0HMS2JIRzqZZsdJAoSGVA
         hwlIL1mSJXwSn+nx109ss3FfK8xi0QjwotRhEi6HOY96QXAD5Q5ARVLqhY9H5T+TkNYz
         JsJpTwnmjApquM+CIDO7UPCsI/xdWz/yxnic279lv3+KXqjqZpgK/AGwuoU6xJeblFJ0
         pmg2IYTx3SsMaR3O3oCoZQ8wb3SWUNCUpHkgYzpAUfZVrzWHK7iwwoLxyLeBebVaF0/V
         LqU7j7FJAfZ/RCEUf2FhaJ4l07l4N0bntzytvTcMyKnrvxaEcIrnFkr6VhpqIhr4n/z9
         TWBQ==
X-Gm-Message-State: AFq9FYJAZiWvo/0sO4oaJ7oi6LcU/s7t3Pb8+zJGjr6EABya9k8JF7zx
	olVPIvuhPoiI27VGsifHKyOkwjgOihz3N+PNzpJNEE3PG43dRsNP+Krmknzd0NjhBkWbm67qNeo
	WLf3XobCr4RdS570d8yqoVy98xlxO4jUo3qzJ7NQUDAnzkKAHEr4/mhrLnR0z5UdZ2n+y
X-Gm-Gg: AYBFou1gJhLLjs4IKTx0p16n7qSJSzcu2ZJO+WoS7kvBzpo6nQ0sdjKBcGvTvBhH6L0
	VzEiZ2kMCwkEysu7c9jEElgry5wD22Jq90+u39c4TI6oRlvaNjbiqXH/d15iNU89eQ2Lq05ekFu
	OyaJWD7yQQAmQW4Nv9Cvrb3ELjA7vTO2YlCQoGMhgdYXwQKWCQmcWb9vuyHrhCwQayi3b2lv4LM
	FR955n8gq7r8FY1CLyW39ucUIQBIwMfckJLO1TF6WuLr6ZYzMKfiS8Zczj2oSp+RBOkcDItl/x8
	Zl0oGFaFh+cQ67xGYAnUERfg8aXZb0hxsRHJYt28xuqr70KvY9ivkF+FRjzLQXQWQ8o8awEqccB
	uSZ1GLS49yMwDwSm73qAO2Q==
X-Received: by 2002:a05:620a:8703:10b0:93a:14c:329c with SMTP id af79cd13be357-940ef7c179dmr952636885a.1.1793006470035;
        Mon, 26 Oct 2026 02:21:10 -0700 (PDT)
X-Received: by 2002:a05:620a:8703:10b0:93a:14c:329c with SMTP id af79cd13be357-940ef7c179dmr952634785a.1.1793006469588;
        Mon, 26 Oct 2026 02:21:09 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd34fbe6sm294029966b.10.2026.10.26.02.21.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 02:21:08 -0700 (PDT)
Message-ID: <f932be26-d911-4c77-b958-353001929692@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 10:21:06 +0100
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
Subject: Re: [PATCH v3 01/14] drm/msm: fail the snapshot init when its worker
 cannot be created
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261024-msm-kms-destroy-fixes-v3-0-66a30120a5ea@oss.qualcomm.com>
 <20261024-msm-kms-destroy-fixes-v3-1-66a30120a5ea@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261024-msm-kms-destroy-fixes-v3-1-66a30120a5ea@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=G7GJgNk5 c=1 sm=1 tr=0 ts=6adf1b86 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=O4p-ns5tyOGKaCv9pfgA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: kr8zbH7NG2m8NH2-AVttcZ7nUmof6LSN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzNyBTYWx0ZWRfX9Oy5NMUaJIna
 c35ZjUNO549+xutfuyfPilGmXua+hqDBrERhJ5cRatFkBaOP9djH2QZIy8c3QPaDGvGa8BFDxjl
 0W3txkN4EjoGMuyDFBBkUlg6q/IDQQI=
X-Proofpoint-GUID: kr8zbH7NG2m8NH2-AVttcZ7nUmof6LSN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzNyBTYWx0ZWRfXz2W87kCSHB7b
 KLB5nIPEMnEpeTLdpP+fOchctcXjPT/WpOtvAUw324ujS3mgFTXgjgu6QbavHPP+OL8YuEamzUG
 6FJH2rJydtt+Y2sRvO+PsLx6Kv7lKs8UCZUdxSVH1XK/cpmwIXECXLEGZ0VGfd6YgsaYkBQ3mX1
 SFjW9D3f9uTI8+whtyMyVpi/yo+MCUC22XoeiFU133QqDqHYK3cK5ko9OZJZeAU7L1eheRbyzGw
 1uM4hWzdScK3TVlEjdFS10o2RPcrgRmxOhQ1cjGrNrLnZSJSgWdl0bO+zBPDQH2Sy5B5967Q2+P
 kuH5e6Qqr7ew5Ukp2TrBqDrhADg+mlX61mPBfJbVT1OQQH1o2PxcVlyjbTukzf0Sss1dkqCgb9Y
 h1dvEuwPgaTJJFp8EYxcOKLQjtjJfCauSy7h3C1Mz7FcAoQVbvLZ0MEzpkhuKAK8FdCCHsbSApS
 6cJUgo8DUW2IFEdNQEA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260037

On 10/24/26 1:19 AM, Dmitry Baryshkov wrote:
> msm_disp_snapshot_init() only logs a failure of kthread_run_worker() and
> returns success, leaving the error pointer in kms->dump_worker.  Both of
> its users then dereference it: msm_disp_snapshot_state() queues the dump
> work on it on the first display error, and msm_disp_snapshot_destroy()
> only checks the pointer for NULL before passing it to
> kthread_destroy_worker().
> 
> Clear the pointer and return the error instead, so that the KMS init
> fails rather than leaving a snapshot facility which crashes when used.
> 
> Fixes: 98659487b845 ("drm/msm: add support to take dpu snapshot")
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/msm_disp_snapshot.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c
> index d99771684728..d1b10656e41a 100644
> --- a/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c
> +++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c
> @@ -98,6 +98,7 @@ int msm_disp_snapshot_init(struct drm_device *drm_dev)
>  {
>  	struct msm_drm_private *priv;
>  	struct msm_kms *kms;
> +	int ret;
>  
>  	if (!drm_dev) {
>  		DRM_ERROR("invalid params\n");
> @@ -110,12 +111,21 @@ int msm_disp_snapshot_init(struct drm_device *drm_dev)
>  	mutex_init(&kms->dump_mutex);
>  
>  	kms->dump_worker = kthread_run_worker(0, "%s", "disp_snapshot");
> -	if (IS_ERR(kms->dump_worker))
> +	if (IS_ERR(kms->dump_worker)) {
> +		ret = PTR_ERR(kms->dump_worker);
>  		DRM_ERROR("failed to create disp state task\n");
> +		goto err_destroy_mutex;
> +	}
>  
>  	kthread_init_work(&kms->dump_work, _msm_disp_snapshot_work);
>  
>  	return 0;
> +
> +err_destroy_mutex:
> +	kms->dump_worker = NULL;
> +	mutex_destroy(&kms->dump_mutex);

LLM:

The error path calls mutex_destroy(&kms->dump_mutex), but
msm_disp_snapshot_destroy() runs later on the same failure path and
destroys the mutex again. That's harmless in practice (mutex_destroy()
on an unlocked mutex is benign, and the debug checks don't fire), but
it's a redundant double destroy. A simpler version would drop the mutex
handling from the error path and let the destroy function own it

Konrad
