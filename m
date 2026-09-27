Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6506C3B8BA5
	for <linux-arm-msm@vger.kernel.org>; Sun, 27 Sep 2026 18:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790533534; cv=none; b=RUTAcvteYO4zL709V8KY5vAk9OMQtyjzFjvJx/8EM5jD3yI6YJV/6TedOn5TPZ5/9seMfj4g0NZca6R9EXK8OkGc/g8Ij7TLeu1889/MSgCbBK+hjqHhlW66vQbMXLHdkJZsvfhgccTjObvUnRrX393ZLXkN4StbkkgzMma7bW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790533534; c=relaxed/simple;
	bh=aXfyzzxMn15wcJM59JSZ909Fa2u2VlwzaGtsLMF0mRM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=chY0wHxBrhVkf6lwsyx3/zRWg2/egTfLbrJT0bgpu0dGUouZHE7FoYtX3vBvz75mwZoyqrd8c/z2gdb97Rw7rvAw6JVxdqem/1aYuMD901YVDDUSfbgg4nAzdXYuKR3NR9sWyz6lkNPwpBzv5xyGIee/LF381MrzWjpfAkZtdZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QNH+Z5N8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SiJK254B; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QNH+Z5N8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SiJK254B"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68RGjqKo3341162
	for <linux-arm-msm@vger.kernel.org>; Sun, 27 Sep 2026 18:25:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=psWMezYs962Qvz0Ag5XK+ISQ
	ZvPQmczAqE5pDosFazI=; b=QNH+Z5N8jUyspqYuNpVyU+/wu8vt/eYQlnwGtLe9
	KmeTHXX+Iv0FS0L8+xUikLc8PenTYw0/SX9vGRQc/58sQUvdAWgkSCZZc/6VcENo
	gmGGoDJIAJTOHj4DJaCrJVxi4wv2w3Ve5/pT8xE/wpLJu3huzNBSNFme2QyDEzBo
	K2RUXYa63P312je8cEeCWPJadlQ3iCaC/Pve9DUdAd3eIcC7gKUCIJWuLHLXyDZw
	GdS6AkPRELO8vLhOO4tQN9AZCYSST/KZB3X1EaMU6FqPVkKt+rW/orQnZ/OJMdL0
	qpLHtvoo9Aa5jDC4yKIwyAalAZkKKYlUpVJK7GowibFCDA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx64uun14-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 27 Sep 2026 18:25:32 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e82060977so461109485a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Sep 2026 11:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790533531; x=1791138331; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=psWMezYs962Qvz0Ag5XK+ISQZvPQmczAqE5pDosFazI=;
        b=SiJK254BO3rv+bAfGFhFUwN4Ko1pz316io3TnwfEgvlVJSYAnJucpANDqhy3ZHbzRb
         9ESr7TqZ0a7PpC9Xa2bAJ0ps/ouYfRIi+ZAonk3/F6mgVOqCLfaA2nvLfVXlorD1K0sB
         VvieyQ2066qCAyEI5mtK4yMX/Ktq0UQ2oB648j0CYRlwHkSw7qETwz7dIctHCx6NbrTS
         ceiumpGPzAP6JxZ7eLaTrDQ9Nfex2MYKMhz1+iw/5wIdEHahn2PdCZYmKPQctaEI1pMM
         vxNRPpg7wIChxWbQ0SDwF4WBSbDa2Ec7KHjCpOxeKppzC/lF944hfthW51jIzljJqK0D
         DQ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790533531; x=1791138331;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=psWMezYs962Qvz0Ag5XK+ISQZvPQmczAqE5pDosFazI=;
        b=1YxIunkQnCzCCaP2VUDJCrr9p/7ZGNVzdV34m9RkgyKCuD7yNxgrXI5WmHS/HVcYgA
         ELghyFA/BZAZg1MFxVYxSRFiBq/gNFbtDcSjxWR/x5jrr4PJAHHg+SpD71xKdt8t25VO
         YFvXd0qeJ96ug2QjsnOtNFsYxzRbWQtPvF5WLdw8VfPqX2e8C5+ywUdtY0YLJ/jKehnF
         b7wbvtobO3ZIjs59d3F3L+bpZchCyZmQK4L9LEzdzDTMZqIX7vLEoyRzODaHqWk8W+h9
         JGzGK7GL5j/Y0FLEgJE72HbrEXCXU2WzesKs0IUUTsQcbqUflkl6AnsIVg3ObR8VOIGC
         0B7A==
X-Forwarded-Encrypted: i=1; AKwUvBwJiHeP67/OZiocQshI+CfRWd75WRr1w/ZH00HphbZhieb/eRZn+sPzdYBBfxdxYgxsrA7edbek+iIUz17i@vger.kernel.org
X-Gm-Message-State: AFuF++kv/WYfUUnjE87+LS0Y3bFWBCae4ePVeh+ogPelOSmbhQKgdCTP
	xVe5btLcbALB7UWr3m90eJTbE6YbgQCdWavdLo4c/YIoBLfMO30XVi3pDKlC03CBWO/jlqE8lYS
	oZjzLC08UfCJToMHF8qH9IxZWIpQtsFbb3YTFomErZWeyHD/236H8aIlVnNy/I0gql9sV
X-Gm-Gg: AYBFou24dntWyRdBZzqAZ9SuprEvBjbLBJOKpl9oeMR6/f7DjNGN00AbUnIsizWi+hT
	4exrrhl3I2xPPzjtIQ4jA+diSo07xgzzkVYR3kxvoPwcEpH9y4Yylv9qdx9YstYArJX2HkGt6jw
	bR1e2XQhoz3rsvpwfiQWOl4zpdIobyy7jbKphvRlmgeliKEqkElawWkmgEqglCMYXM1WLUhJ0G+
	yupL57/C4W5Zzz88tdwmrkv6ivpidsgscJSj938Vz0Ns0tlTJIin2+2DfbZXxZUPMrTR5iLNe71
	tI5xA+KSI1eMbtz03OkgszjfQW3nJXi9OmC7sN9IrNX6TFL/pSXLoZ5HZRMvss6bP1UlgO93ZvJ
	mF4/H5pm9FhgECIMFbwC3nhrOxiOfwreU+cIlMKKGRFFZ4sXW8XX9PzF0dSzCdZWJ14IpzLKawK
	0b3Wi9ngK1Hmh/
X-Received: by 2002:a05:620a:2547:b0:93c:290e:9e9c with SMTP id af79cd13be357-93c43d17a10mr1544161585a.16.1790533531544;
        Sun, 27 Sep 2026 11:25:31 -0700 (PDT)
X-Received: by 2002:a05:620a:2547:b0:93c:290e:9e9c with SMTP id af79cd13be357-93c43d17a10mr1544159285a.16.1790533531072;
        Sun, 27 Sep 2026 11:25:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8e6b0e9bdsm1994006e87.70.2026.09.27.11.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 11:25:28 -0700 (PDT)
Date: Sun, 27 Sep 2026 21:25:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] media: iris: add support for vbv delay
Message-ID: <jc4vctqyyrh7gvoxv7h7ioqnrv72t73trgesscx3xpd4xwpj2m@m6no5tnmet5s>
References: <20260927-iris_vbv_delay-v4-0-8ee2b7462e68@oss.qualcomm.com>
 <20260927-iris_vbv_delay-v4-2-8ee2b7462e68@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260927-iris_vbv_delay-v4-2-8ee2b7462e68@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI3MDA3MyBTYWx0ZWRfX2+z+I/Iq1yV9
 wTXbxJ6bMcGW0tPCOujIbq1JiC+JEK/YmxGatYSsJUe71yuO/OwzQTGy817pkvQSS7BDxQPFCxs
 cjJVoebe6//5SVQuhYy0M71V+7qb4/c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI3MDA3MyBTYWx0ZWRfX5iZIjxW3FLKI
 /IYTXtJQtcyazrCKT15IoLjL3KdWZ8HLg1VAOlf0vhfp5e91jr7BBYzSBUXnaVBSkL8Nq+ISOeb
 QVbqoFH7o9VGanbnX5B4SJcgzQl4hPGzMkSLOs5yGySIefEcUEzFmn2XVaZNgkPWLMg7usdayu8
 qHKzp159aJijIfxc8EAoXL0FVNhOLOE8YK9zg8ik+V7aHcP+yGmMvQgES0m8TXWK9HdNXEDeNQS
 PEE2wQgGWMAPNqSGnF5GhsFqJ/xa4AyfBBedLw1Wj7+De2wSuA1E/9roNZMaayfiYOk1kPCJWZk
 /+ekclFVJY/3KX/SvqD9yAknwKrzjBl5Dfxch4el/yNtlGcB5YxAT5lGtT1A7lNkl+2b5kf3/FP
 jV13FvwdqAHwWp7GYj/o22XGRjbp0N2rEP+XEWaTx9SVK+mxeah6FO/rXlALNm4oMt+ujlqyxu8
 HfcDlXVAEWGoUzE1EkA==
X-Proofpoint-ORIG-GUID: QTULjfR29nhmKYB01xpXoFq29kz2dVUc
X-Authority-Analysis: v=2.4 cv=E6xYNqdl c=1 sm=1 tr=0 ts=6ab95f9c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=h-tNxE82WNmto9AfkSgA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: QTULjfR29nhmKYB01xpXoFq29kz2dVUc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0
 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609270073

On Sun, Sep 27, 2026 at 09:27:46AM +0530, Sachin Kumar Garg wrote:
> Add the VBV_DELAY instance capability for the HFI Gen2 encoder,
> exposed to userspace via V4L2_CID_MPEG_VIDEO_VBV_DELAY and mapped to
> HFI_PROP_VBV_DELAY through a new iris_set_vbv_delay(). The property
> is only meaningful for CBR rate-control modes.
> 
> Low VBV delay values (34-100 ms) require the encoder to run
> with a single video pipe, so extend iris_set_pipe() to force
> work_route to 1 whenever the configured VBV_DELAY falls in that
> range.
> 
> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_ctrls.c      | 37 +++++++++++++++++++++-
>  drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
>  drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 12 ++++++-
>  .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  1 +
>  .../platform/qcom/iris/iris_platform_common.h      |  1 +
>  5 files changed, 50 insertions(+), 2 deletions(-)
> 
> @@ -541,8 +545,19 @@ int iris_set_stage(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id
>  int iris_set_pipe(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>  {
>  	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
> -	u32 work_route = inst->fw_caps[PIPE].value;
> +	u32 work_route = inst->fw_caps[PIPE].max;

Why is being set to the max value instead of using the .value?

>  	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +	u32 vbv_delay;
> +
> +	if (inst->domain == ENCODER &&
> +	    inst->fw_caps[FRAME_RC_ENABLE].value &&
> +	    inst->fw_caps[BITRATE_MODE].value == V4L2_MPEG_VIDEO_BITRATE_MODE_CBR) {
> +		vbv_delay = inst->fw_caps[VBV_DELAY].value;
> +		if (vbv_delay >= 34 && vbv_delay <= 100)
> +			work_route = 1;
> +	}
> +
> +	inst->fw_caps[PIPE].value = work_route;
>  
>  	return hfi_ops->session_set_property(inst, hfi_id,
>  					     HFI_HOST_FLAGS_NONE,
-- 
With best wishes
Dmitry
