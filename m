Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604083;
	b=wnFOp0T000jTQZRrcwa6mUyeUOOAGOCenY4GaW9Q4klg5JmkQeivx7KBPWoQKxP7DopW
	 hVDlX/lOlrObphAp4DBJg04gvqUh4+Wc8fPBLCCzFbCm8c0eNTQk7AtVqYbj3GTAlu82Y
	 AQRmxcj98QCzd02V8LIAVuOQZEjg7TnHfl3MCOtChO5UNt68k2KWpzvm5os7zAzXrDzoG
	 gJqlP3ELyB5kgmIEKKl/gOHNtQGH6as02CUw9HE/ZTyFSVpyl+SDTRDS2iMK+Xj8GBb/O
	 L+UATX+OAvGMhlEJu7mI1yW1Xu03Rqnun9juoPVm+Z7BRmyAIBGeDMUyDqdYtLk1vAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604083;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mYdA0Lu2qjNo2evtNJ4tXUQFqZz6hfshGFjdq5gk3CA=;
	b=lCEnDLPj6pNXl+GcDqlX2W9IB4MJPS/+ZSqRpE8+DWzFVcZn+y4MdiD2bAAbHSzpdt4N
	 vsbRMNz336pQdYZ4f+K6+vSty2qL3SQeZRJUB1wDM+JRwH2QEq0WrmMzthSC1EWiNS5FM
	 F4wnHVJ1YIlol3kp/059Ujma8ZIg7ABg3kW32hi7EtUcAaVwtJjlIa2s13hRGqr56w1cD
	 8q4Ib12OVkEGWeXVn69MutAdyEWSx/KMUWXj3/DGf2RkLy2d0AEZWDTvIrQNK8WJw6Y7h
	 cWPomUXYddv4jYiWxI0RJqwwzaYMBHe2Iog2SidiN0geWE4QpgZVu2cQm4vk/FzI0uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bV62D0qb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Lg1ZsMJn;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 928B6606A326
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:54:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 928B6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bV62D0qb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Lg1ZsMJn
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mO5u2356539
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:54:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mYdA0Lu2qjNo2evtNJ4tXUQFqZz6hfshGFjdq5gk3CA=; b=bV62D0qbmQ5GPMHj
	rJcyDrWn+tkh7KG08A5zKMU3C4XHwCAcfkTKnmhv6PBbGw9cex7IhehX8cxY6ycR
	ijxOCQyikQCjvohpG+kZQJadElCe5mqIVJ67UooAn/NbwU0SAwCGt2LQa3Ak8C0t
	39rfbGd+Xq+/9/p1aHDl+JMyaOox58BcGvjRFl5Rm8BEEqxnzEMTGmNPMMgsn852
	n0mbNS+gy4nzyzKgCOUAp2GXB+75mWciQwVvxjf4DxWOu8y4E+jUBQq0Db7LtoVK
	gOP+ZvBQsUuSN72MZXUK+OB3K77L7iedI+MIhOLOnk4eK/6DdhAeynUWS7VCYThY
	lMmrAg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5nu6a5ff-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:54:41 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-53657d237ddso8505461cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 02:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795604081; x=1796208881; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mYdA0Lu2qjNo2evtNJ4tXUQFqZz6hfshGFjdq5gk3CA=;
        b=Lg1ZsMJngBWzNvhO6VOxhR3+xf+00ZlSHVrirrGO52gPSqMbGSbg8tM4ze1kmwidP/
         6kal8KeKhxn5FPUKO3/Zt3keyFShGeGzjMdkFOJeWPOl+8/PxwK7IhoB3986ymIaDfNF
         fA/iEONi1OHkxigIcHSc/ZrNt1iEcNpMlgwDwJpvhYgrjN6PT3dA+4yw+oN0K2C5Nlz2
         uuSWn9rmCEgRR7Pj135Qd1jAuSZeePpEeGcIF+lggH7yWhC1yG6oLx3+SvsYV669jsnh
         PHVFCXe0VPNHrbMDrrad38jS82P3c5DO+vfvLwqVaxPFo3x4YMede7v0njKaBW7P6HwU
         dC0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604081; x=1796208881;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mYdA0Lu2qjNo2evtNJ4tXUQFqZz6hfshGFjdq5gk3CA=;
        b=lY/FZzuHykLDbKA4mRkrlKeVJle8atRe09OZzu9fXNoK1VH9Frx1o2dZJXz+D9qdH+
         hT/VrdQkwJXoFFezcn5aQIPpGRNk4zuFYrtw1Gf7S6PNICsSVkRAXAw3id1oHwO3Wsvy
         xhFfUCTyvm433ylGPGzGrJtahxSkAyCJbaAggWuRsjXxWjPoipBSIjFkcVqU/tPir/lS
         mnn/8mRJMfoCVtoZBfD6kMehklMWzrAljqEEcdwK4EMcUwrVIysbBA4Xk8OYkrZQfegg
         HIrqtUUYtBEPVOL7NuaQOgHMOgzjxSJ1JsjRS58l40XRa5w8zpvJ4XFWnq7k5I6sxmbt
         Atpw==
X-Gm-Message-State: APuU4Z989LFk1Pw94myuSv4ZQK/vnkebiuTFnN0h28/Fajr18DVDgjTk
	fpD4K1lGfDHnzg4mMRs7c2Rpr3Hqm6YfKURWkowiF4/5zuJd5+7dWB51VgJAxKIo6pJlwoDF2cD
	6We4lR8dPcxjxOfTghYBF4EjGbQRge1TpcmXx5IZsWiUqmYQcXRE0viH6xCMZ7FLTFGzV
X-Gm-Gg: AZFdTZdQ2M0B5sLvkfncUoiOdMus0c063hkkHcXpOkUk53DW1FHEXaK7Z6RiKTRaVet
	9eci7BTjawjCFRQsVf5nFDQOSNIPNNHliWb11kPg9bhzaArwaBFGoPD+Pu1N6nZcL+5/CVZQ+bs
	YJ2q2G5BPEHZubEbXAk03ydSk+al19Gw8WZqaOPcNaLKAUdyhlQFUYVdlj9uBx0aZfe/yBInj3/
	WR37jak4tf2XLwwk8sXddQIG1nHNxg4O8APFRbmUtAMK1oIbBTy4k6HSvUybvKGAaTke7QLeWCp
	3SOndOfHnComHx0Pl0yW/Y9w+uaS3AiaCNTkWh/MISw+nbGuqmB/wwQcqANP2/P2GscOW5BiF4f
	7ImzHz0ItAU/deuecZ2cp6cqiUNFUF50Xgr0BCqkPc4V4SSpAFK0BqYPL+6SAAP8XanJllFQ=
X-Received: by 2002:a05:622a:e447:20b0:55c:b745:bcc5 with SMTP id d75a77b69052e-55d76884627mr307731301cf.1.1795604080858;
        Wed, 25 Nov 2026 02:54:40 -0800 (PST)
X-Received: by 2002:a05:622a:e447:20b0:55c:b745:bcc5 with SMTP id d75a77b69052e-55d76884627mr307731081cf.1.1795604080410;
        Wed, 25 Nov 2026 02:54:40 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba371072f6sm8191977a12.28.2026.11.25.02.54.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 02:54:39 -0800 (PST)
Message-ID: <9472d897-6fce-417b-b130-481b6b109f66@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:54:36 +0100
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
Subject: Re: [PATCH] drm/msm/dpu: sc8180x: restore dp_phy_intf_sel on runtime
 resume
To: robertijtsma@gmail.com, Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20261124-drm-msm-dpu-sc8180x-resume-v1-1-a6201f43136d@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261124-drm-msm-dpu-sc8180x-resume-v1-1-a6201f43136d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: X3R9gLJpT72-6jUbhFr2pgyW2ZYnQCU3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MyBTYWx0ZWRfXxCo9gG6/AFhK
 KpVBwwSsCt7kYmT/qq4lRrK8KZZggH/OXgiq1ljpIhNJD07a4V9jOc+gLipnX3W3NSnVnH23Gen
 QjwtqANJSSmzERnL6UZjHj4Moz++bMM=
X-Proofpoint-GUID: X3R9gLJpT72-6jUbhFr2pgyW2ZYnQCU3
X-Authority-Analysis: v=2.4 cv=Vra2kO2n c=1 sm=1 tr=0 ts=6b06be71 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=SvDnwdDAYdV65z6mAxsA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MyBTYWx0ZWRfX0Z3Ez1cinf2y
 zCxRHPEbznLUNUu8U3u+SkwngMXsP43mtyL4p1vjCEpMgZmk6wPsMrSixZUWA986XBgBlqr9ucB
 C6WTpV10111zfvbVSnHIRGCd5wOQYgq1boZIkstlrIJd0CJkMbv7cbGvapEXip5I1ci4G+cSuZ2
 AElTq/4Raf8Y5uw9GdEOU8HsfCZf27ckDePfAk5vsNNp/pQgY1HmWPBP7518Qgy7e4yelsZDCQW
 b19DU4SvTU52I8fMfo0Ulr0bpKtgCIzmAOirb6i8AXCR1ATjSrTp7wwZc0bT4aZtNyRR2v/q/rU
 Y3pH5Baynjfs7MWBhGi7PFo1GC0i9TfgEzv86F6YnnkMMLGG47bL6uyfZ3qI1jY+Mu8jI5BRDNe
 aGNfDZOeKOvZL75/DW8sbvz3pLbA3j/oRaGsxhQFyV9kkimkQt++m9tf51gscCIXJDBoL8kmp5C
 MGxNvthYB+7Tm/DzyNQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250043

On 11/24/26 11:46 PM, Robert Ijtsma via B4 Relay wrote:
> From: Robert Ijtsma <robertijtsma@gmail.com>
> 
> On SC8180X, MDP_DP_PHY_INTF_SEL is currently programmed only once during
> dpu_kms_hw_init(). When MDSS/DPU loses register state across runtime PM
> or s2idle suspend/resume, dpu_runtime_resume() restores VBIF memtypes
> via dpu_vbif_init_memtypes() but leaves MDP_DP_PHY_INTF_SEL reset to
> zero, misrouting eDP/DP output after resume.
> 
> Factor out dpu_kms_setup_dp_phy_intf_sel() and invoke it from both
> dpu_kms_hw_init() and dpu_runtime_resume().
> 
> Fixes: be3415c620d1 ("drm/msm/dpu: Configure DP INTF/PHY selector")
> Signed-off-by: Robert Ijtsma <robertijtsma@gmail.com>
> ---
> Restore MDP_DP_PHY_INTF_SEL in dpu_runtime_resume() on SC8180X so eDP/DP
> PHY routing survives MDSS runtime PM and s2idle power collapse.
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
