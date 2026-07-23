Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B3A2E88BD
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 09:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784799973; cv=none; b=ExlhqF5SFQj1gJ5jEcwQBEdVcg03PMgeCBR2FN37uOLyf43hyFl63XMsG/xFGFlsnctW1h9JJhKJeZOanH9b6j59XwKLFLJpQdcq0Cjk7KA+iGFBPjF4x1i4bpRZFoNZwD/HTmu+Ecqu1Xu45E5Fycqvmx4TLf8Eob+ivSbkYDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784799973; c=relaxed/simple;
	bh=mEaSNKIZQkhzcIvs9wwj+MbuDWAAHQ8OzD84k4hqnxI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IHcFQz7CewBWv9swcjlbKiVuO+Rl/PFQHYyn61TcLpRBCSlKhVOs2AHF/xI101rra8sm42dpPYrdu/ivvKxnnb57A2C57vav3rHN6c/P9lcBmBu39lzyMTc1yeSfeY1wvn9mpIuX/4SfwjlVWhTSThEWdAFY/MeALVNm0Zfploc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AA/itLAC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FgfiCPv/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AA/itLAC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FgfiCPv/"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qSkX3260920
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 09:46:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jpgPkTjce3V3c9vePB/knLzy
	/Sfg34SkWnewCsyQcdA=; b=AA/itLACVUPf+Vs0T+HVXiLDOAxXmzWj33ETB3l8
	UR2LKj4VbCKOo7wUnzpCv+ON3Qbz/uvqi8nYL8CjBT4r/iEjQ55NNXkDGgy9otlZ
	swTaHxv0gVfHtxTeGJqS780A95tCJO/RZVxKTA7CKVqYNSXrR+BrmSo502ltZ0w5
	9on+wqkw3B2z2nuq1xxP8qQmsQFpCLcOMOg7lmNMum06/0NZB4YVGXBCjWepm9bD
	31fMbuj/GHcsJdyt6BafnOWJ1scDn7oYQP8T3r+NRGFnpVFOHeu/BQjXFOw++RwO
	FDFGHh8dV8nSs/0UvLRS4I7RWl91I3fmQ93oUIPprViZcw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkafw1gtt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 09:46:10 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c85798977dcso980998a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 02:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784799970; x=1785404770; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jpgPkTjce3V3c9vePB/knLzy/Sfg34SkWnewCsyQcdA=;
        b=FgfiCPv/39Es9VUd0HAndG5JJ9GLkir8Ws/83qBKP3nbV08vtvctqSNiVdFGH2RJTj
         PldyW79jOdVG24MffwtWiCKhZAuh/Cg5Mxqky1nwZC3uMnr323g5YnHxCwEfkChJpjHI
         pRizsdkM70zuMCDivVath5pmjkLOqTsutt2GN08ngjG+qFMZyBOmwdhiTOexiCCtf8NM
         L/IjfNegTAEKYwbQ+nQzaNaqotkgvgiD+E/rnzC+elZxQKjqpPPjIu5BIUzLkr8H4hVw
         BSsRHXg4meQxA8MUeelHZHIpRQYXJ/N8ArxjzbCLKPnnTjykChNZrAQwHGDpSpmIApxX
         H1Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784799970; x=1785404770;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jpgPkTjce3V3c9vePB/knLzy/Sfg34SkWnewCsyQcdA=;
        b=T1/zjIiPP9Jg2LWjW7+z1ALCfkIz51AcrrtxpxbErQ03JMoUkxxRP8NMBhSUQeT4sd
         kwB+onw7qickfxSDWaMwTRUCXIdy9WnIGhBHxxD+vafw4EzDPi4CYiQZk48MlLgQWz6/
         DF99MAwlWzpSA0G+5QWy4lgrJu61BxqidnToDYyEmO8ShLFApDuvWyMUQrn0F3zrJbuv
         w0rLdGyUyOXgi6zFUdEz2jg5UdYzKzl+I5P9DB/MpEUye5qp3Agd63NJqVMXIcVpH6MU
         beQ63xy8r+jbILGG9kwO2cEjmRDp9cRwXsiTzThukwEPRzOF4vYKzCu52VwxIfB0Ka8K
         5zaw==
X-Forwarded-Encrypted: i=1; AHgh+RqJak4GDn/IRpeXomJuDBdIlCxDmDlOYiumi9sm1fg9R6OCHES+PyT7MfYmvfb/8VX6zoaDiUu74S2rNXTP@vger.kernel.org
X-Gm-Message-State: AOJu0YwHemk3iR3H0p0buHfUMh2ir09bLaYyMZqBPaJDNu+PtLV/7wZ6
	PjGwfdZsKEH9+Z8e+Z411u6jPUnnSZuVk9j0kcOwIQIkEBn4Qd+3HZiSdnXa2V4KVFEjuL3KCK6
	pnlPY2aixeSSlrT247/dlBOtrhYE7WPcGR86Zh/RB6XXHXA1GWtXt10Aen6XjWrsRoSRt
X-Gm-Gg: AR+sD11xXTZibScyWA/pHC4iLqprTnpkZY6QTEvRCnwResLvU9iaU06zNwFou2yIBjS
	+h11fkP78QYGu+wZu44BhscEDUaTnhT53PzQLKeQcIqfUGiQ3Qn4Ry0gQXVaRTjhtlLcHoX4JuG
	ZzyZwGdBzYmJMnZDdqVLAin0fLDD23VNSasBI2eFfLccBLfLwCpn6r1dVbD26AEHiz4AJXcQS8Y
	HpUKPOqXl5lQz4ZmgTPlN+KRZ8fGiiPldMnmB9Qvc8w3gOwj/bFZ+fJduAQGVp1LQiJVLDa6di2
	LHtX/uWVxC6mYbyYEx8kM0KdyAhju/4kGB1Kls5xsDJ/WxgOT8QD8036WfJndJKYsroajjeYqC7
	wThWNPDemA9ntYbvYY2loi0dnu1s=
X-Received: by 2002:a05:6a20:a11a:b0:3c0:9c19:65b3 with SMTP id adf61e73a8af0-3c44b2ae24bmr2247081637.75.1784799970031;
        Thu, 23 Jul 2026 02:46:10 -0700 (PDT)
X-Received: by 2002:a05:6a20:a11a:b0:3c0:9c19:65b3 with SMTP id adf61e73a8af0-3c44b2ae24bmr2247055637.75.1784799969526;
        Thu, 23 Jul 2026 02:46:09 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc1b99esm18341564eec.3.2026.07.23.02.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 02:46:08 -0700 (PDT)
Date: Thu, 23 Jul 2026 15:16:03 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Gokul krishna Krishnakumar <quic_gokukris@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: qcom: q6v5: Request shutdown if crash is
 triggered host-side
Message-ID: <20260723094603.47yomvvn2qapkghh@hu-mojha-hyd.qualcomm.com>
References: <20260723-q6v5-host-side-crash-v1-1-23bd53db90a7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723-q6v5-host-side-crash-v1-1-23bd53db90a7@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=XNkAjwhE c=1 sm=1 tr=0 ts=6a61e2e2 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=tFdicZlxEcvME1bRR5kA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=CjuIK1q_8ugA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: 1cD8wpwJxKfavSdZkCTQ4Ib2NZqOpcLw
X-Proofpoint-GUID: 1cD8wpwJxKfavSdZkCTQ4Ib2NZqOpcLw
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA5NiBTYWx0ZWRfX6kV0WtkykXiD
 yq0R3KHs2kYCLO5XwXwgC2+dNnVrbXIRXv66AO2eu3kiQU232nRMay2X9R1Ga3BRvkovsWrBZN2
 5Yv+iWLORJyp+pMb/2gzaqgJ2B6ZnH8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA5NiBTYWx0ZWRfX7HpIFILrIPxN
 TcbSaPKBK/CSKcl5E7v80fhJf42dh+n54Qh857pDmf8ixWw06e+CW2l59UP3VbjjDrIeoEHWzgi
 XDLnCD+pphaj+q9LhmCvYhj4BFCF+1BYgEQ8VZ7HOORcyw+NNSDeMTc1D//gNLqvWzNLJ4J/7ix
 WhLNpzlesA2JWeC3/go8MOuleV29Nkmt65tG7aAhuD6JmBA7kOYE9d/fkEI6EdPRpBbSg7K+0fi
 1wy+U2j7LiddVe5dh2dCVbRl82u8c8sIOj5di8qZ524sy8O3SLReNBcdlequUtLQnigO3uHIJfi
 7yUkCBFHuna7bnhPwYBB4p3incnoGj/Z0Fo0AO2v+IDghgjvwj63QE5REsgebQkdpuCQqwpx77t
 2aWBu0DA3Ax6o4FG1kl/G/303IVaxrrry9DAT6VogM24MjjAEbyAs/ztI+edNq4XwPZFchtBWOY
 1DClLO2h8Ay/RaOtiiQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230096

On Thu, Jul 23, 2026 at 03:00:41AM +0000, Bjorn Andersson wrote:
> rpmsg client drivers are allowed to invoke rproc_report_crash() on their
> grandparent when they determine that the otherwise seemingly healthy
> remoteproc has entered a functionally broken state.
> 
> In the crash handling path qcom_q6v5_request_stop() is invoked, which is
> based on the current rproc state whether to request a graceful shutdown.
> 
> But the current rproc `state` will be RPROC_CRASHED regardless of where
> the crash handler was initiated from, and empirical data shows that
> unless the firmware is taking part of the shutdown the system state is
> often left such that it's not possible to start the subsystem again.
> 
> Use the `running` state in the q6v5 driver to make the decision instead,
> as this does represent the actual state of the firmware.
> 
> This makes it possible to reliably trigger a restart from client
> drivers.
> 
> Fixes: 3cc889eb83f5 ("remoteproc: qcom: q6v5: Avoid setting smem bit in case of crash shutdown")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_q6v5.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
> index 1075ef4027b7..fe148b4b3775 100644
> --- a/drivers/remoteproc/qcom_q6v5.c
> +++ b/drivers/remoteproc/qcom_q6v5.c
> @@ -229,13 +229,13 @@ static irqreturn_t q6v5_stop_interrupt(int irq, void *data)
>   */
>  int qcom_q6v5_request_stop(struct qcom_q6v5 *q6v5, struct qcom_sysmon *sysmon)
>  {
> +	bool was_running = q6v5->running;
>  	int ret;
>  
>  	q6v5->running = false;
>  
> -	/* Don't perform SMP2P dance if remote isn't running */
> -	if ((q6v5->rproc->state != RPROC_RUNNING && q6v5->rproc->state != RPROC_ATTACHED) ||
> -	    qcom_sysmon_shutdown_acked(sysmon))
> +	/* A watchdog/fatal IRQ clears running; logical crashes still need a stop. */
> +	if (!was_running || qcom_sysmon_shutdown_acked(sysmon))
>  		return 0;
>  

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

-- 
-Mukesh Ojha
