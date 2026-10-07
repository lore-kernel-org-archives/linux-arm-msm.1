Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92E147D93B
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Oct 2026 13:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791380531; cv=none; b=hZmmfjobHv7aolc+8sIWvcGYp48qIEPPtkOT4czA62pLv8Y4GjLptMPQ7wNXNun4CaEuax/pz8NK7EXpM5UFzcxLp57s3OXq9kuRiNzkP4UWpZkBLd1KNg2Og22bMU/g7RZbQo23n9OLZ+wvilSSu7Lzyg4OQ34XBf/Z1uEelkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791380531; c=relaxed/simple;
	bh=LjHu/GXybxzs4xe5GtqrxQ728YWgfwBGwxNbu3gH8pY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yb3hnsgtos8BQvJCcjpfT4cLR99nz1FhDeD3/dH3KHvjqrJkv0CjmgtDJbzxB4DvcWcmeXDpFrMC8WN/PU8qXgvRsbYqiSvB7J7oCRwM66RLByFuKy9NIi+RDY8pbaSPf9uOl17dgWni198i3h0Ntm9pGZ/sBMvAdAIXQ8tvGw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YRElo8ZW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HK1g/gGC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YRElo8ZW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HK1g/gGC"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697BVCeA3198233
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Oct 2026 13:42:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KGUO9Rm/3Kp7eJz0vM+BTmpU
	efwN7FAzKqUEkIaj2gk=; b=YRElo8ZW5cnbpy/eU4UOhguAjnN+1T/XxF3EsT4u
	l2iEvrSTdeVMoBMIk0IiMzR0IZCIEYcqx4bkP0GjDH/GcTrFAexAgC+kv3kb7Oee
	e9dHcoX2q0h1nHv2vNxOjd2Irj5WdxCY9+o+7hehip++iNh0Tkx2aJhE7Kuf2run
	XfAFA2/KDdqLn5v4Ie4BWiBHUx4wACTwGzIr50tIEGgjjP9MJHySOe9t6YDgXVZq
	AbBowdkJU7egs2X3bFePu86mByRvzF8Iy8RGDTbhmQpoTNHz+lonQeu3Cg5Tjn4b
	QaTf4G0vaTEgPZ14GEhwZv+PJZqJ71QWNkNlm7AR5l4cog==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c1s2dfq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 13:42:00 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cbacbb996so656248185a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 06:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791380520; x=1791985320; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KGUO9Rm/3Kp7eJz0vM+BTmpUefwN7FAzKqUEkIaj2gk=;
        b=HK1g/gGCAlPYx/f+dweuhnn5edpGnl5gNeZzJrkTY4Vxk9AOaFIW6kDPHwnKZvoBnS
         XzrjP8r9N7KqdaNjWL+48JT4aOtNWA/m3Aku6ioKf8ACaMcglDwTzId8YHLBcSiX42Xg
         c2u6dxSUU8AM88OQoboUAD10SF6EBy2hCsS8YMym2p2SpJYsYj0B+5cM/yBELPc26iqn
         OTy02LyClKUKeB+kkiLc4feTDMvd8JWvBoL3LcycAqIe5lr/ENko3Vbj2JMDYpN+PEsI
         C2sv/svQQzGRCo5r39SKre3m1IGx5HblFA9DM8OSq4qROFohY+uqesgGQ4K0QmBuuYfu
         FTxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791380520; x=1791985320;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KGUO9Rm/3Kp7eJz0vM+BTmpUefwN7FAzKqUEkIaj2gk=;
        b=1N8sPrua8vFpvusxntW1JKD75/k0iCVDt/aqDK2uGC1XSlr2Ev/MqU2x4pd9ZRAweO
         bYyuWIKKLpdVP7YRJZYZTFvKdqBU3X9/96GW3jikrMePWt0js+d+gjp1rCe9NQUsi/37
         uEA1pn0xqJn602oUVjpbzUQ+l+XXHbC6sgYIO008IpBelF5D+8wpbEjOzcZNNz96SAIF
         wioVFlaWSLqre3yZNU5nrBaWzXjsTd8H5qpRMqcqE3O8nQuC00bfZR0rvu6Y8YxkeEDg
         J1ByJy03y9N7j7ESmFtoQG+aEWPT9xv+eIBLmPcRXwXyp8wEC0VKPp5RknKbS3a2v80O
         NGaA==
X-Forwarded-Encrypted: i=1; AKwUvBxA6yH+9+I2t24t3xrqpuUj3oQU49ep8wG4omgpITyIjaJtsjXFFSI0LDgL2CeAkqVOaLlkQ47VTqS0qCTf@vger.kernel.org
X-Gm-Message-State: AFuF++l7PHncAGqY8UeOu2/btbFputv0qF2AKayXg2Rqlc5AQ5hhJieT
	wJcJFehll0CogBIFy053tDOW/++QKmorQ5ge4lkcWOGXjQDxU+kjA0v+W+IW7+6phBL80a6HfOv
	S+xfR2O8AFXUhlLp7nybW/EQKNJXNzm3KBECE4teJnk3ASm+tTx8Z0qS/bQnVW2LFQXM9
X-Gm-Gg: AYBFou0EeJMWZ5k6ZaDfEI5urfh7RBj1t266c0vo3VCQ0QTRpYBibH6g8f/WKQzzQCL
	JpKnDUGpcV5eiFzMCAvC97gRvoCkG5deTkR7Ez0IUojx8IzgAmTzqIi+LXmRqOhLDcz7FF3kafm
	/joOeW2p5eEd2F1LUGJBFAbg4ffzju4jShO0bCXbaJJ3UstPxwHd5bYbCfnLZGk8eRswFv+6YBt
	QviPZOCitsLugwLagLNlV5+5a528/7tsGvlKvhWDM5NwQRbgTQD+iYw5SG2CkBcmVRJE236AvUb
	edQw/pwvcKQuVLNxj+Nh/dODgBg2B5YAnYgPeINlUJTsqD2e0pt7sjpk9UZtkgpiXoTQssOofDH
	y4JsQy4GAypZaxkKhsn+x2A+3ywlR6XvXzps6AXpg1qNShhFohBO4Ze1YTW5myz+HWwP4EVPUs8
	S43Ix8QMeYylN6
X-Received: by 2002:a05:620a:2b47:b0:93a:2239:4ac1 with SMTP id af79cd13be357-93e9b7424cdmr451575485a.32.1791380519901;
        Wed, 07 Oct 2026 06:41:59 -0700 (PDT)
X-Received: by 2002:a05:620a:2b47:b0:93a:2239:4ac1 with SMTP id af79cd13be357-93e9b7424cdmr451569485a.32.1791380519340;
        Wed, 07 Oct 2026 06:41:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcd30a959asm48293e87.84.2026.10.07.06.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 06:41:57 -0700 (PDT)
Date: Wed, 7 Oct 2026 16:41:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Joonhoe Kim <26rote@gmail.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, yongxing.mou@oss.qualcomm.com,
        yuanjie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: add the SSPP rec0/rec1 blocks to the
 snapshot
Message-ID: <seuzkp6defi5uft2uhgclrt6iltd3sj2hrntvdluesqqtoadmb@zp2zolf4qf5o>
References: <20261007123945.1694-1-26rote@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007123945.1694-1-26rote@gmail.com>
X-Proofpoint-ORIG-GUID: B5eKdkG1VdUm19xL0cosexh2Hxcnffrj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA1NCBTYWx0ZWRfX5/IfVFPsxl1F
 KJ0yFpfCeh9SI6L2XAPBH2/iK6lodg0viZkLjZcZroyDQjR2KHD17DfzojpMUWXK2gLMK9BCWpm
 pw46ggJQEMezh6NkisETjTqUG6JL+WjTLcBy8myEgzP1Joc3GRlbZ/qj+XuyvKHMZ7uVTm7MXa2
 R79oMgoUDJ2VPP8kJmyIZMmaq86lTxhNmaErIX2Y6H7xW0nHWwS8eXILVGMwGtUiZKUYQHBlTCJ
 fyRVso50bNbFdK28HxxseftN2NXVi28WrMAtgvOzOPJJ8nWhRcffCVdydH/VeO8ONV2q80SbNwg
 mlCmUZ0F1+PwcdcS0pcF0k0eUkd8j0rLfht6sW1i+DcRdpeV9sZlH2AwF1ces/LkEqYFf3knWus
 7qHiHwlVzYpQCZvcjEFEEQipGMtoTsmgo8tRN9s7bS/7Uf5aQvU0mKk6AeXnqApYxZ+hIfHv7Vp
 DnPjV/t1zOOwrHEsDvw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA1NCBTYWx0ZWRfX6oDf5GryyS6G
 KHAhr1WcGLBcRSWTY0+mXWt5QY3//zfkCCAnINu9cZ6FYn+TnaFzWzG6mGfZcfAq3//4Q6dlIE8
 pUq5TWDzhsl3gBtgvxatVVDNZbsZ/iM=
X-Proofpoint-GUID: B5eKdkG1VdUm19xL0cosexh2Hxcnffrj
X-Authority-Analysis: v=2.4 cv=NatzRGD4 c=1 sm=1 tr=0 ts=6ac64c28 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=s5JHMdqm-UuCYFehMJkA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_04,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070054

On Wed, Oct 07, 2026 at 09:39:45PM +0900, Joonhoe Kim wrote:
> On DPU 13 the SSPP block is only 0x84 long and the fetch registers
> (source address, size, format, multirect) live in the rec0/rec1
> sub-blocks at 0x1000 and 0x3000. The snapshot dumps the SSPP block and
> its scaler and CSC sub-blocks, but not rec0/rec1, so the plane fetch
> state is missing from the devcoredump and from debugfs dri/N/kms.
> 
> Add the rec0/rec1 sub-blocks to the snapshot.
> 
> Tested on a Lenovo Legion Tab Y700 gen 5 (SM8850).
> 
> Fixes: 688c7734002a ("drm/msm/dpu: Add Kaanapali SSPP sub-block support")
> Assisted-by: LLM
> Signed-off-by: Joonhoe Kim <26rote@gmail.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
