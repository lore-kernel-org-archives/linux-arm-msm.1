Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F2134D382
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 07:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788421525; cv=none; b=gp2BqEtbYLZx9vJ6yPq591lVTXwTiVoOd31t9T/5kOPdtOAnEQDICi+nv3a8/AiPb32Ueemyofk7K4NdMssHHsB1lorxgKpYjru/xZ+W+jQHwExbuxu0gBvJNHbyZX5ga1iq/k5EXqKo5AXMuQdDjkYGF9GnxsuaC5NMB6Fs1Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788421525; c=relaxed/simple;
	bh=ZpH0V3BiX1xeS5UP5XkVFneyRdbxvPFWZs3TtaJJwL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m/hVWHo31tmng87dW2upsSLNUcn+jf86/crgp+9mv0kBcz92ZJAB3dxIS405WAbO1w+pg+9JNKbHEsjNTAQ4Zoa14EZVtejJC9XZArlEvTgWZywtQNPpBTcn5FEomPPSsWobhFZ0ljB7d0M3nWylApnAXAuk+8+q7A8Lq8QtlUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EOq7cMxI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OkA5Xj7S; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EOq7cMxI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OkA5Xj7S"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835lMfu324615
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 07:45:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7CSoZYq3KBXVxdgrzwHcBQJR
	+p1brH+pLBCnK12LtNQ=; b=EOq7cMxIfefwSGLvo7J5uYpH0oNc58JxoM6BMyuZ
	7SZwqLFNR+zcC/4rC73OVoyhN+r5KNn38gMc/rESMzrO6yWNuaYVnWsPiX3498aH
	7I4qcsyPgVptaeM+pv20/ynqTdClOCtzp5YQ59bEPJBoovY6QuYP0UFOiOIwr3aS
	16ZTd1282+fK1ddFs7dd2h8gbS+cKr++9oK1lLhgWqhBESUm0CWJR4hkM9bPI/6j
	yeLFWCiDRcAN1wb2fmEJqC7nTY4rOZXwOx9lsQZhEotrbOg7oS7ZD4hNhJTs37KE
	z6vP4xZZA73xixI4s4hteZWmRwBVWObSUvkpuiZHtVMmdQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gerdnb5bt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 07:45:23 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934963b2bc0so396061585a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 00:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788421522; x=1789026322; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7CSoZYq3KBXVxdgrzwHcBQJR+p1brH+pLBCnK12LtNQ=;
        b=OkA5Xj7SkbR91yd4NhVDs/iF6DN4VTIeyfGkBtGlgtfNKfJ/LxEXc7rLA1YgPG4NbW
         2DwRXsApQPLvnyfewGbm8lkQD6uqGTBrt0mKRx+cjbAJ2f2gyEOqBa3qnRFxb2AodP4H
         0RMtQGX4xuh+Mc0WICTEerzkF4jzoCNt4ZlCRf4EmWxUZtZKI8hjhd18s1abjp3aXBdj
         QHGQZqk/+i2fmsgXvkBR9cn5TDYziirAlvGzql/euGsUWa1hBSpQOb83jC02Vhk2PVAP
         Jhu15NIAaRrFR82d6pH6I/b2lVFN2qzNjwAgOrQOnEIi0ekiRSJ/QXqDVzIvwLHhgYrb
         Liog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788421522; x=1789026322;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7CSoZYq3KBXVxdgrzwHcBQJR+p1brH+pLBCnK12LtNQ=;
        b=rO9nDqEg8zD0Rp/14EfOZ5YtPFplDYvpsZREp8ItEg/7g4qwFJ3alVLHh1vC5t6pN6
         e4Vs/giiRAZmsNEsYqJIzlyxIYfZbFW61hTUitiuRU6ArnIremG4Mf1IMUP1+EiyNk/M
         e86Cd37sqF7Z2UUNNgfqJ6BdgjLOqIWXl+2kq5//CCMG6IfFykhvRauQWUDJrmebXnco
         37NEzx0V7zGx8RhxNnsCAUgBII7n4vH3WItgceb57CRe5fFXNq87bxIW0mlNR/c6TRav
         jz4x0Er1gkWWXX+DgJ0x2JuWcSXa2CRHma1EkeEPy2Lw++IXvLM5FGUEuz+T49y0YKoH
         EH3w==
X-Forwarded-Encrypted: i=1; AKwUvBzMFOBVhLD8trhBdzdoEaG83Ltib2Mr+I0KSNqqdPJ2ZuOetnxVoCFiQQ/gr8DfbR2nc2DlaMgvvbe+Tx6e@vger.kernel.org
X-Gm-Message-State: AFuF++nxrdYDCAeC6CfBzAXbNhCpIM0lqxz32Vf1MlF2IMJIwKFDgQ2F
	faFPp53eZyw8MYZJFITScMke7dchXQOATQu08luCfA4NMHKTlP+y7XL/smXpBODwAoPXPJ6qK2B
	pSvVnIisLHoVHqGiJlldQLeVlcDd03/c+tEPETxfWkPgSmJbgkCMl69IsSv1MQztX584GNS7oTt
	IF
X-Gm-Gg: AYBFou0MUhWpWI4bByCLsnttGcOdcZK9XxA19yBcBeKy6xajF6xLirT5+lAwBDfeR3F
	O/4tvGmzzLuiliblzvLBs3bRr1qgTs5xfOtNV/MwxlsXqfoVYujVzfEn+idAQsCBbT4jX33Jtq+
	P5J1c5CfkJxaS+1iOQ2diblX1A/ED3N4nl3Rds8MAnG75e4ZArmKM7iZXU9xW6sr9CUH52FHFI9
	A8fDUpcq1E5l85GsG5Si+JngIOVq1rfHOCrHsBRkPKiXV/9ugOuCLv1B4Uo6GEzlRTIeod4EgYT
	Pf3DOlrGheDNNbX8ANiI9s6Oo8NMRje+fVKCDgaDhNnzGvUZUmCLJvGwHsqF9BC9hmFWYfKQHDX
	1JbNRDnAix3s+q43bWwcQrom5VZW79ePkgWKEdBB/hwymppGPs051NSu7rncKe0dMeivcW8FNa0
	5d0Ebd3pG8ztMT
X-Received: by 2002:a05:620a:468c:b0:92e:745c:6c5a with SMTP id af79cd13be357-93960dd6fa7mr1181066185a.14.1788421522341;
        Thu, 03 Sep 2026 00:45:22 -0700 (PDT)
X-Received: by 2002:a05:620a:468c:b0:92e:745c:6c5a with SMTP id af79cd13be357-93960dd6fa7mr1181062185a.14.1788421521913;
        Thu, 03 Sep 2026 00:45:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b606b0f173sm1111969e87.7.2026.09.03.00.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 00:45:20 -0700 (PDT)
Date: Thu, 3 Sep 2026 10:45:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] remoteproc: qcom_q6v5_pas: propagate
 dev_pm_genpd_set_performance_state() errors
Message-ID: <kaad7btqyhq2puyjjnm2lp5e75hjizhpnaiyaol74icpkcfjlm@7yzadtvizm2e>
References: <20260902204334.2061226-1-mukesh.ojha@oss.qualcomm.com>
 <20260902204334.2061226-2-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902204334.2061226-2-mukesh.ojha@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=YcmNIQRf c=1 sm=1 tr=0 ts=6a992593 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=h89225zfqaSm5xtrkw8A:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA2NyBTYWx0ZWRfXw+vorciHZ/rU
 HD3y1nAclLGDT2xc8rfe1OB32pn3N6DUoqrfL9rwjQrfx99bqGaZ9rsS/Yhl84kqluyjkAKpEMK
 W5P2QSYEyD7vsyMizkAt5+nMuW/T7vw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA2NyBTYWx0ZWRfX/ERIzS8cCHDA
 sLlQ1k32rLqjCu2phMfF1cFlm9ry01HFIKan53VU0ls+mgHLYvLBmsZVc3Rqc6+Ivc+ngXll2iW
 vuGeTZ9YMZv0llR+Ep+uATzUVWNAT5Yqtv9mxN6QmcRFCJLN42YH9c5rJVOErlo1/GB0BVRz/GC
 wYEF6gt/8Cj097KNipQAArmqI9vviTsxmh1gZA4YhYB9CYK82RIuOqY9RatduF/YKlu0dKMK3PQ
 bcBRyR1Xillq+x/9WUz1Z552rgHVliTXeWqrVIQCoN2Z7Li0GjpKG8vXuRsNN2fGjz6VphoIOoN
 ajvWuQHQjB0RuqxKyYhq8nO977zjLv1Kc/JjsWZNQp7/MhdxlTEdgOZVi+tH/Q3JmQLoTM1OnrF
 O0L+49OMJBp49ApNc0qdPFL+Y9qHwwuEabmGodK/qRr66WnmNDOSS5ZimkQV2xGwI1Lc9QnFOAG
 iutARJvMMARid2Qv1tA==
X-Proofpoint-GUID: Lt3GX4Ij6nZeRiLBl03p09N6uPSQuUmJ
X-Proofpoint-ORIG-GUID: Lt3GX4Ij6nZeRiLBl03p09N6uPSQuUmJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030067

On Thu, Sep 03, 2026 at 02:13:32AM +0530, Mukesh Ojha wrote:
> The proxy power domain enable path discards the return value of
> dev_pm_genpd_set_performance_state(), masking failures silently.
> When the call fails the performance state is not applied, yet
> firmware load proceeds without any indication of the problem.
> 
> Capture the return value and emit a warning on failure. Firmware
> load continues regardless a performance state failure is non-fatal
> but the warning provides a visible signal for debugging.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index a005546c265d..01dc0194e130 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -167,7 +167,11 @@ static int qcom_pas_pds_enable(struct qcom_pas *pas, struct device **pds,
>  	int i;
>  
>  	for (i = 0; i < pd_count; i++) {
> -		dev_pm_genpd_set_performance_state(pds[i], INT_MAX);
> +		ret = dev_pm_genpd_set_performance_state(pds[i], INT_MAX);
> +		if (ret)
> +			dev_warn(pas->dev,
> +				 "failed to set proxy PD %d state %u: %d\n",
> +				 i, INT_MAX, ret);

Should it be turned into an error?

>  		ret = pm_runtime_get_sync(pds[i]);
>  		if (ret < 0) {
>  			pm_runtime_put_noidle(pds[i]);
> -- 
> 2.55.0
> 

-- 
With best wishes
Dmitry
