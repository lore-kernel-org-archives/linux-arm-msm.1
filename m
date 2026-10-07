Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6CC279329
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Oct 2026 07:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791356833; cv=none; b=RMX3YfvcP+PeehpZMg5yPCsto+Ivq2c6kJrd0yd00ir1xxbUhG7Qr2zC4dmDeT1RP0MkaWoElSundhy6SVykpTPpGfNH8JFiL5CQzmnfljtiw71RSZCOYT4T/Ol8Os6lflBWnJwylOa6qONIDPk1yMkGbluAAlLSukzTHeeBvOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791356833; c=relaxed/simple;
	bh=2xu3ydqR25irKH3DwztwsUkt8vMa+0pAkoN6XvXyQ4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TpQfala//Wk2Pqc/zmET5k0lRLJtwF93ufQ3eXH5qpP8gSXy6I/y3oIML8W2b8oDfpkCEuLal5tzTcCjJrC2n18mAgQZcXQfs6+nZBnBvKAhuMXQbw8SWdXA3xYCY+jaOAkF/nMc8OawKcPFVmLWXc2PfWj7CkkK/7dIpbc6D+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NaSViDn8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WsDSRQ8z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NaSViDn8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WsDSRQ8z"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6974U0uv2294795
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Oct 2026 07:07:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=REdsKXMdkmNBVolsHOiGFdM1
	vrJDGL8kKYoVEdCkWkk=; b=NaSViDn8yT7Lltx4kDek7qbhz+RVHl3A2ZJBFGmY
	vArKbx2G6mtlQH9axzXPfM5xnTDS9v1VVGoijvbxtN/dM6LmFFCN5EOSxWmid560
	vsUo3obpJZbZwKYi8d7/p7buR+KrOjV4mUO1c2WlJtKGIqpyoD+1jXIZ9rPFBfqb
	qmft/OExaoeycsGeWIIxSSkDoo4OnieAr0+iBs8EAk5zV5WnhoBzSKQfr5kQe9lO
	oUjGdFqf6D1dyjFxc2g9jM9bU/dMZq7/2OfIZ5QB6OINxAdUqWaJSafuP1Ka4UyH
	02BfMTWB1LdLkJ6gYs1e6XwChaux9/FxiIuslEOC+70Hhg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c1s11dv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 07:07:11 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93dd3c3badbso713995685a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 00:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791356830; x=1791961630; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=REdsKXMdkmNBVolsHOiGFdM1vrJDGL8kKYoVEdCkWkk=;
        b=WsDSRQ8zCViz70bI2bs1M5bEUfXhk3g8COU6fqMiPBe0Z46z9QLdGi3EfhaSKx1OQ8
         BVkKv9MGkR1Iw0d+VgzHtNnikrnz4trcOoZj4yU3FKQlj6gVkwZAxad5BOs6HMm/mqDG
         eA55dUHd3IHmc0dP5djgk3PN3hPcs5Rirn7KVfs8Cd3mJJIK+pv85vR1NN3y6zTzLVKn
         9f3xt0RWy3u2ooSOgB/Ct33GcCBJoN0g2VC7UEYplNUYgcmBdajeEqMKhOl1kL274EbR
         BZ+hc4XvzXe2elnKfXoapsES6N4MojbxHZ5FlfmX8STjy/juxzfF8D269oKRC7mY0MsT
         +CSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791356830; x=1791961630;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=REdsKXMdkmNBVolsHOiGFdM1vrJDGL8kKYoVEdCkWkk=;
        b=11E3RKSdBelis4jNkcNmk0ULYqY3TFnodXe9rJ03lHOhsEYe9E6jAv73iYSwXjc42N
         Eq/XFoHXRtdgR7UJYrWO9cIeMxlouwFcrPGxA6Ijop8nwYaTKvwjpVLxL2AVpHW7qu+T
         NlAjgZq3AUlTpjO8W8PAz5FocPJ2YtE+MQDg2fJdPogmFcC8PkLKU5ijTt2sg5I/wMg5
         8Je8HKGAWTz99VSXxv9ZWTCpznx6o6c43OrzmC8rb7guA7S4Nf+HcRbsaqKKOyDzK+ba
         goOEm1zkF1i9e0d8J8wDXzoVoeVvPofbSQWlRHPK2wifYxvyg/sYSr0gTEXjBODdtvD/
         MLqQ==
X-Forwarded-Encrypted: i=1; AKwUvBy9UVbNOYWV5b6gIse16cTZl6sxAp65iy52JeCQnpSX0Z20joormoVzA6/4qT5quflg+H97S+SHqgs+2ML6@vger.kernel.org
X-Gm-Message-State: AFuF++lmwx6fIyuyhG0iKySQt0soeZIvMhZBXQgBcJef7UM9obkeET5T
	RZlfrq8b5E3YuL16s4elnA9bTE2C+JQZrR/VrOYhaQ7yvCHWe6FzPa0GQE5YPU2t/VXZWeZUWqF
	kFgxdsSo+Irb9jBTQec/QovC166ieXMLTnxyfnTK8zLXtTl/masSM4jI0TZrQJBukS2RD
X-Gm-Gg: AYBFou3tIs7vH0IOofsf6ZiyxondD7g6r7CKM/CvuuwfxEWlSZ0URT2lrqZSqoevKYZ
	1ypRp9lW4hWxuFOgM5Jrxm7dO6TPDkxXdZ08QB8OvAvv8aiuwC1K0WvxzN6vDoHu4LfxgUX1jcL
	B4pPzPOai5vXriZdAJbdfjC+2HGox9Yk+uPtolJCESLSDJVRwOrIMOKGLGrXyFJQTMXnD7PW8Dy
	ZG6xzUevHw+3d/hCW2Odya/tLi037GQWXqa9qerHDFumC8SEbEXoULBqAmPlt/NWtnFvI0g3hGy
	u1A/BzH/InR5e5V4Cyz9aP3Mp+1iwp90BnYSNmQfNKggpLlVq9Y73KLkxRE4THhqmLLVxyHffci
	76KDpjIrr9UaS27NzEHaQ/xc/PlDUuTk18uQERVbvRtgE+UcftIDl4IjkoC9E8a1qyRZuHvhvOp
	H4igtdSBCFBW+j
X-Received: by 2002:a05:620a:29c7:b0:93b:beb3:5898 with SMTP id af79cd13be357-93e9b807709mr253453885a.49.1791356830315;
        Wed, 07 Oct 2026 00:07:10 -0700 (PDT)
X-Received: by 2002:a05:620a:29c7:b0:93b:beb3:5898 with SMTP id af79cd13be357-93e9b807709mr253450985a.49.1791356829790;
        Wed, 07 Oct 2026 00:07:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bccfdb892bsm440897e87.12.2026.10.07.00.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 00:07:07 -0700 (PDT)
Date: Wed, 7 Oct 2026 10:07:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, Ilia Lin <ilia.lin@kernel.org>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] cpufreq: qcom-nvmem: Add IPQ9650 support
Message-ID: <tnmm2misly3wct7out4gybimrql42si47trcoygaquan2gm2w7@rzqqkefwdmvh>
References: <20261007-ipq9650_cpufreq-v1-1-bb808da4ab2c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007-ipq9650_cpufreq-v1-1-bb808da4ab2c@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: rFipdI7xXuXXaI23N-6dgvKR3i0Lq_hY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAyOCBTYWx0ZWRfX/a3w4cV/hAyj
 g0j71/VPFESokTvRYFZDoVS/ix3EROTTRHvcw3TwfksFwtfP0Yvl/c+8g97CKaA3cOO1EJK4PEZ
 SkO5CXsmP+pa8AXwP+ZrBs0/f6OqqvBdkQkCAhnw4JobFjMxe1ogoBGv+kFJEmAbhq1Nlj70HQM
 cxxlBMJmzfLir93OZ0FY5mogE+LcbDnfq+WMClJbA1zFsc2F5bxmeljFuWsnCXWrpqXkarSoPmi
 IG8zVqSa+XJwF2AV/Q6uRoqMOXyKuymekeNUAYnTl347PH5HtLV56nqD3k4MulE7cq1emsR5BQQ
 NDVEVRoFeICEbTcgQrrGHP1Ykrv+LQ5ctklEU45uhgZohpYugWMT/jpn+0y7ytI3c4ZGf9gHCsz
 8JOsCzR72GjVQCzcADohohq7/IHGzH5RgoPL4yskWyOv9oRChqXULchY7DY+7eZp05RM4VqKygC
 UMj3iDfBli/YZXK6wJw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAyOCBTYWx0ZWRfX5adjHRky/w6X
 fDEGF8vmUqtY9KHs0dsWeJQ09oqdjIK8Dhj3eHUo+GhE6dGSB/Hf4wkU3lgPb4mmNcj/C74WBNG
 f6N0FhJDx4rSxNTkU68AJ9y2quyDfTU=
X-Proofpoint-GUID: rFipdI7xXuXXaI23N-6dgvKR3i0Lq_hY
X-Authority-Analysis: v=2.4 cv=NatzRGD4 c=1 sm=1 tr=0 ts=6ac5ef9f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=kH__5QHoUz9KciXxkXMA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070028

On Wed, Oct 07, 2026 at 12:31:56PM +0530, Kathiravan Thirumoorthy wrote:
> Add IPQ9650 support to the Qualcomm NVMEM cpufreq driver so the supported
> OPP can be selected at runtime using the eFuse value and the
> opp-supported-hw OPP property. Also block the generic cpufreq-dt platform
> device for IPQ9650 so the NVMEM-based driver is used.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  drivers/cpufreq/cpufreq-dt-platdev.c | 1 +
>  drivers/cpufreq/qcom-cpufreq-nvmem.c | 9 +++++++++
>  2 files changed, 10 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
