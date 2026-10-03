Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD3718DB1F
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 Oct 2026 00:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790986828; cv=none; b=ttXy8G4h5AY4qFj1YUHBAkkiv9hIYnPGImZUJX1agDG5WXbigs0+xaw9j7iX4DyN2X5sMSjnU+uzvkmJX0W3ZbP6nxaUjwI9qVAHRczNgpxRwmek1SNgKftUWxHH0rlLl3i8uxb3gYVm/W4gaWXNBOUuDsZ+gd1PVmFNf8LszFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790986828; c=relaxed/simple;
	bh=PpX7RJLO0gizq0oeVGZdXXRcZ2YnCD/BPbiiubTbfKw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ckObbqlQrpNPwfrvLhFPU1zzXw46UKrX2woGNJ++uSre368pY2W+ASe20EtPQMHSDFtxcywciAxmFRKIidH/zh1RhrAgw9577NHSdhfTeVJES77CjXp5/8pO7e3hZGqfokFmWarp73tnuglI3mxtb+a00K38hK5GBPv7zTPCQew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CLF+z5tS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VfJhh8N8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CLF+z5tS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VfJhh8N8"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692NdxRQ2104551
	for <linux-arm-msm@vger.kernel.org>; Sat, 3 Oct 2026 00:20:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=f2ZdA70TwBLUT8+duBJwyLHt
	iJMHfNP6ZQ0iT51JS3k=; b=CLF+z5tSG0fKu2HioWxaPqDeh3Mln78SV/in48ax
	59WAlfgsZjRosxCu/HfQF/FucwjhB3iBYU+U6amzIdYX7K39kSfWBnENCoyzaDnV
	+wto62eJt4yIBp+Ei0bPv061uxCqikYJ1GaA1PagTbhoFq9MnzVwvjRE2e/EP62C
	8eadC1gery4fq+4QZfzmftS/M1Z6GxWv4hISIpxl6rBMQ16Oq9cg2eyIOJoAlc5j
	n+ajfsEBq1LhDepxjD779NM1lWUFxpoNrEikx9MxzuYdUXhOCvSa9V21VnaXY0ct
	JtYnvpi4JN/k2R5pUARqD8+YSyOs854V+/zxw1ui8egndw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2dxdjbbc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 03 Oct 2026 00:20:26 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93e49a1d3b1so26089085a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 17:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790986825; x=1791591625; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f2ZdA70TwBLUT8+duBJwyLHtiJMHfNP6ZQ0iT51JS3k=;
        b=VfJhh8N84oClut4o5GRoJFHcb5qaxvk+QpKN9wrfMwi6M017s8k2Bx3pTIBh8i/dEj
         baVHA1Kbk84c8HOgCfY2C8yN1oXDGeu3cKcDD0Rtb2rmWDU20pgDTFNGURKaW501T33i
         sp309dcwrJ6INEBWEbjLziFLvak7cHXtbXnS3GiR+n6VSCrFguyKmSavUyKzqDTvaJ1G
         DzjiyA6Tl8MA4H9GAFyLdle6miUPSXYwxTe7YBwRxoqrexuxtTyKXf9Qk0jIpZdpNKHg
         FS65Xh7W+mo4hCOEt8mIbtqi+Al64aUE4VXH9LS/ofgIEbKe8EgFNfcsIHebHPWbr6KB
         E7BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790986825; x=1791591625;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f2ZdA70TwBLUT8+duBJwyLHtiJMHfNP6ZQ0iT51JS3k=;
        b=YC/YChVvka4Rq+nsfr/oXF/uTt4thZ1ybnZkgpUIQivJGALImxLSw8hn14GExn6Y+C
         86cInPHxY4OHBZADh387axOKUBSlTsnyNrA3n5zbKTRrCYA8Hy2+AqDMHlhyzD0Z4yeI
         VnEYB4QFAh9bAPkvZt1ao/q4HtaH0TbFeX6cKZxzhxD7TuL31NbjvnW1YA9b8UoM+QnP
         XCZOXB6IQuuLEGS4NS8lBabGXE5J6JIoq+JjvufE9ejK7w1jT1i67NWqvFz2OLTP66ks
         heGMxg/iTp9rRzimcR6na7GteKX80U/b5u+bECBAHM54ntl5i4lx5pHtVvmwae7GncQW
         gj+A==
X-Forwarded-Encrypted: i=1; AKwUvBzrcMFbIqd05Bc7dZVk7/pETZLgAoyzJlaAHjFr2BIliEvnWtOxR+J78+lurQ78LR2WQkRw3/6rH1t0HEUL@vger.kernel.org
X-Gm-Message-State: AFuF++npnKYMwtDHD6mf8eCDkQvion8JNRykrskfQo+TJOtFXDR9gA9k
	Vtal3SubOCXD1vLlXXA3/U3XTmEUaJg6Ke2nZj+pEfBMHwN7Z3XBeMnp6MvrItvbTK75ZUD2+Bz
	DaKYuyH9XQIku2WYn4j4WmJujT8uYbEvmp5zzaRd1SflyRzOFcFfAYgIXZTdPO29KKvuH
X-Gm-Gg: AYBFou26jX9VSmpkU9O8FQNYExAy532M0/x5PpmYsSJGd2NNxopJ5qITiWk4Wqk8Uqn
	ZHcacNXWnDWU7hmsXxUBUxa1WSGFG2lnEqhpRdcpjGcOIn2mjAxH6SLccR4oC7fxvMtsZ7gXxxf
	xNqKQBOZxMbp4dfnisGtTTIA5tlxORSdXC864KYlDkTsZRKlxknSh2GFc0dzCwTZ/HDQ0F7HniW
	D1Z11iFQ9n/9Z1wB4VaO+49DguLVgN8S+PRS3+DPMWG3qE4Iqr2Y4tHiwpKN9HyUePSAzI4UBaX
	9Z2ZwYne8LzKBa2Jl/XgjFgkQDgzpfxp7IvshWCptz1542AIbEQ0kD/HKLJ8KwcDN/eNaUznMnI
	hGIOIzfxFoV+I1a958K+E7rXx+wkT6/GE46x7cOC4lcNHBG4re8D/MkLiQwkLa9iRN/oY7Skn34
	IBztZhMvgHX9WO
X-Received: by 2002:a05:620a:4113:b0:93c:6507:a6e2 with SMTP id af79cd13be357-93cf1a62b30mr751647885a.65.1790986824902;
        Fri, 02 Oct 2026 17:20:24 -0700 (PDT)
X-Received: by 2002:a05:620a:4113:b0:93c:6507:a6e2 with SMTP id af79cd13be357-93cf1a62b30mr751644085a.65.1790986824308;
        Fri, 02 Oct 2026 17:20:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a87e2f7dc8sm13737291fa.6.2026.10.02.17.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 17:20:22 -0700 (PDT)
Date: Sat, 3 Oct 2026 03:20:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jun Nie <jun.nie@linaro.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v21] drm/msm/dpu: Enable quad-pipe for DSC and dual-DSI
 case
Message-ID: <olwdkzm3nefubm7j37se3vmmpkfyxdfkrmgyiytbiv4jdz2w2q@op7vykeopdi2>
References: <20260727-msm-next-quad-pipe-split-v21-1-965dfa5b669e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727-msm-next-quad-pipe-split-v21-1-965dfa5b669e@linaro.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDAwMSBTYWx0ZWRfXx6kFMrk6NNgq
 jtJBRUJgRUC13GQffXAdsYO419EUSj3mnWG3ELrc4KW3RiwD0ynGYH4Ns4ql09kvK/RBM6RywLB
 BichZX8FtfRLWp+I/R6n61R5sCj7FJQ=
X-Authority-Analysis: v=2.4 cv=Ko/YSmWN c=1 sm=1 tr=0 ts=6ac04a4a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=e5mUnYsNAAAA:8
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=DT45myXMZceectMb0b8A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=Vxmtnl_E_bksehYqCbjh:22 a=cvBusfyB2V15izCimMoJ:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: v0oKC9iy4EEqy9M-JWRoldePtTg3LFSo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDAwMSBTYWx0ZWRfX9TpASihdmJ0x
 /t7yHT0HFkyEwuhcSrNP8id5yDBUqldPfOMNAhX1kJywN56n2PETTRi3A0MKU/7RqqIVBei9GIq
 Gc92AP3yCvPIYY+aEC/FvE1ci7OmIHlvJTrk4TgPc2GXjdbrjpuR4mAdHYsGtynuyyMlDn+xWze
 1jS/jVq4eX3JBfvP5/ZWSSgj8mN0zWEWzpPBE6gFRzzTA3+v7GnyEt0vriyoW0nuhmQss0vqsT6
 t58fz0o1pJwX+NAj062/N/AHKr6YTLVpAiiaRxYgjftkszp/RGEEjth6+VFe2FjZv8dZezWDdCr
 pp5qJq++Vt6rhf2lCSzpmjONCwdDd7aWz1648FvLmK0JUuntR4/ZcM81PLmYLw1VKXQBbbCrFDl
 6dt6dw8Pl2QXZj9xlnwkF9im5uEI0pMqIFIiutebk4c+c+AH5RQkraHMMvr/hO4BemwO0QS0Zd1
 Zb/B+H3i4HrnLXUhjGg==
X-Proofpoint-GUID: v0oKC9iy4EEqy9M-JWRoldePtTg3LFSo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610030001

On Mon, Jul 27, 2026 at 05:33:26PM +0800, Jun Nie wrote:
> To support high-resolution cases that exceed the width constrain
> or scenarios that surpass the maximum MDP clock rate, additional
> pipes are necessary to enable parallel data processing within
> the width constraints and MDP clock rate.
> 
> Expand pipe array size to 4. Request 4 mixers and 4 DSCs for
> high-resolution cases where dual interfaces are enabled for virtual
> plane case. More use cases can be incorporated later if quad-pipe
> capabilities are required.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> Patchwork: https://patchwork.freedesktop.org/patch/675418/
> Link: https://lore.kernel.org/r/20250918-v6-16-rc2-quad-pipe-upstream-4-v16-10-ff6232e3472f@linaro.org
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Jun, thanks for your work and your efforts. I hope you don't mind me
taking your patch, testing it thoroughly and finally polishing the LM
allocation conditions. I can say that without your energy and
persistency the series had no chance of being implemented and landed.

I've posted the (hopefully) final bits at [1]. I will run them through
the CI and if everything works, it will land in 7.4.

[1] https://patch.msgid.link/20261003-dpu-quad-pipe-fixed-v1-0-6a6a00917b71@oss.qualcomm.com

-- 
With best wishes
Dmitry
