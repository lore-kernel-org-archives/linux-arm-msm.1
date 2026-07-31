Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851EA3314B7
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 12:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785500709; cv=none; b=CEZ4StlvL3NqqBjZOsWPrwxcFk6ZGEPdwu3rlsaHKF5K4WJV5dspvAdd973LAsPq5qDWfyxAIictMjWHMquQrq6WadUQXG5GEnTuADUiXehV6yWkNlfcMDr0Li693XTvispVci7+45b+Sx2Ddp0Gegz5lshjZyAyBeQIJDhjkPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785500709; c=relaxed/simple;
	bh=jgA9+92Q9rPvQCWeeI4dvtvzVN9EhGJdXsWniM7HmeY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bh5g8ZOLN9jpakPk5QvcDQTmS504UUK2yYx3WS9H5BI2ro/Puet4otl7jJGtryrGrERS9k6GNraYd9CkcII3qtM5Venho3sanXj82T1yNtFUV2noW+or9xnytYXOBMx1n8fmgL0j2DyyitIuWnBBRYjGadKGOxqA+Beezzp/+/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XOqzULvD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g8wjFIwE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XOqzULvD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g8wjFIwE"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VBejxO892136
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 12:25:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Z54HanEuCNVlg2Yh0Jseuort
	qjgg4ScxpftoOIWrzrQ=; b=XOqzULvDyn7PDohy6oI0vNPl6IkZmEx3IsR72tdy
	pCwJ4pP6zvD3MCurdvITwHCRnQpfYphkEfItMOpHr124W5ntb71TWaYMdxB0gKml
	XzEfTxWVCdf3jcl2JZuBj7+DRIKda3bonQdPHZhFLRhDN35E5QIpJM25ahIgsPrP
	167whYf4XPNHNC6vwlrLCuTQF6CCMsdC5RF34Yq9ywMQOtvI+Rq81Wa/cX22EAcs
	OANyUZp+t2Pu+j6yvl8hV1TZbJEXNJsOZ3OtTEx78ZajbGs893KjVVI63kdJ+AUB
	6Nyh+Luc0HWff4C8P3TGcUABxTQD6eHDQLrRmycajq/FKg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fru1x84xv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 12:25:07 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1c7f135bso15454511cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 05:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785500707; x=1786105507; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z54HanEuCNVlg2Yh0Jseuortqjgg4ScxpftoOIWrzrQ=;
        b=g8wjFIwEFYSrgiwUihcaoqxRwCEmrJ4AWkt4CQsVHeJHhAzUMXiU3HKwxbzsleZCtJ
         JE7khJWJpJKs4Xm9F1S/WdWu5DaRA/9BTy0RMyjhedLgNR4IEfRKas4sXqqDsvUcGE3n
         c7MppLXEJzanzbYpXnVHDbgO6MezXqcc4JHycdVNmyw3yQZXxfHK8L5kOuuRsn7N8CxZ
         qhJ3TgLkW48JcKV6keca8ANSm5D7S0/UpFDcEckkICPaOpxnUUCS4ApacmwpGItTEcwO
         LNkbFOYJ05BUImsiXNjRCZZBoqsgkNXFZOKGL8m2Sx2vHSCkIDFYJCNxkcrjfJohNVoB
         8jyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785500707; x=1786105507;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z54HanEuCNVlg2Yh0Jseuortqjgg4ScxpftoOIWrzrQ=;
        b=jcDPlV/nbqtG5FLbENke6kskGfXQfY1m4/smL1EWeG75r6XyZKZI5SzVMknJJw6uo/
         1H+1a6pVREnV5GbxgDVplTYUxMbV/2sdb+vBCjlp7e5TbQJ0fBdyPizXa+TGDa7Jut/c
         bFK6bhAjqQ9GzPVNh2uQwkOnPVYZypY/aT+734A+Tc1citnyB9PotaVYWwWCjvT9R0K9
         5p1XqiLtwZdApN7GDMLIIa6Ww1OB/iREfEA5JGITHcSLcE/Jalmdh1ZLWZ5gNXaeEAAy
         cgDd5FOUYYGObjZTCF2yFTFC5w57oN14SiNXcneU8o6DkIVzqiUcB90oolUJKloB/6ls
         pwmA==
X-Forwarded-Encrypted: i=1; AHgh+RrTSohabIJ2wdkVx9aLmuKqaxKL/8aoQ2wgmn9qWnab+HUTWVAajk8d5szz+qHyRabz/O+1BKD6cqHzzIh7@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+vt0E+XWVaAGs73tPW+owLnajwftoKsffVx6hIF78sNvHnTA4
	nhKdYKCqp2HbYl2QBOlRusDLapimVW1m9oiIeNQG0y3s/MzdWlCwzk4FNpHc8tI40A9bi2lSmtu
	92VHVP73DD8+JRE43gLPdd4c25nEm1dNZMParanoJQhMzQaVnC/W9UueunJP+sJ5heZ3/
X-Gm-Gg: AR+sD1161QskMARtJqkP6XIyGL5vilQeRRYyIwiQUJerkxLdDPAvNkfbOnJSyehbKQj
	8soSgtTSDPcRx5A6V0JcPOwYrohWm4H74IDJl1oLHZiBZESO7opmB6zIPqRii7Tm7nqZOkPuiOf
	L1U+lO8gQv/FFHeFTRDj+yrXRcPMsS3/hHBEQawxlAH3uaOfUAvn4mwNC+Kf7RmrFMV+1HYjU74
	uCoZDJ3gwjE4Pqcqxb5QFEu1lWBR1fDveDxcpSMbM1k30WGLdfYw9RhCFBy/Zf5dY1W2lqqLQoV
	jsDp3WBghObdD62+ZjFgz2tguUXTeInKQ8xQdGzfREGYmVuS2Zb93L9sCR/VNYi0xifYs6XhcNb
	xm+lW4rZDrIdFZQ4lmfWkjG/JiKFhqHF5zto3mxFM673c/JJwYSRFBEqAzxvnZ3w32fp2xvhHrV
	wnlAYXGeZgCGuCyA==
X-Received: by 2002:ac8:7e95:0:b0:51c:1fa1:80da with SMTP id d75a77b69052e-52b4b0faf2dmr23061611cf.40.1785500706876;
        Fri, 31 Jul 2026 05:25:06 -0700 (PDT)
X-Received: by 2002:ac8:7e95:0:b0:51c:1fa1:80da with SMTP id d75a77b69052e-52b4b0faf2dmr23061071cf.40.1785500706449;
        Fri, 31 Jul 2026 05:25:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2e2456d7esm269506e87.75.2026.07.31.05.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 05:25:04 -0700 (PDT)
Date: Fri, 31 Jul 2026 15:25:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/9] media: iris: enable VP8, MPEG2 and interlaced video
 support
Message-ID: <ll3jwycl6rknom5p2dvsgkoaqitcptyk5zdos7knl7xny2uwoe@ms5rstlsp4gh>
References: <20260709-iris-vp8-v1-0-6af3ab578a7c@oss.qualcomm.com>
 <xbvyccur5htwxzxpqywtnh7orm6gwjxqmfh7qkzb4egqxhfv46@ilvrnxrztdbv>
 <0ff4bd78-1536-4246-a4f1-91f8294118af@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0ff4bd78-1536-4246-a4f1-91f8294118af@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA5NCBTYWx0ZWRfX3Pfe0ddcSWaS
 9uskk4TRfThcANN/dZ1irmDgxXb+3453dRI51sxwyNuqNFIaU0G2cXpN+auSR/LGCaHc3TscbKC
 q3YZgLJSBwcOYM/lUi9UlEuH6CpQjww=
X-Authority-Analysis: v=2.4 cv=GpByPE1C c=1 sm=1 tr=0 ts=6a6c9423 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EiIT1U1qUc4YKD5Fr6UA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA5NCBTYWx0ZWRfXyGluNRLVk8cg
 9hTYJb1Njt5YkiruCAFj4U14T09ctRB8Esy4sWhgmpDnp03BY3qEwSv6D+7nX/vSogyV7sUuFZS
 6BS0ylSAq4MbFly+no1DXf2oTVvJmXbFLFfxZIyJLoXF8OvQBYlCXROXtRLlCguaokxBN+BHtA1
 kgNAoom7aAMFHNwUT24zyPdQ1gIDBX26mBUMWZL3NZw8abCcSLyQWcB+fk1372Rg5qSqlkQWtR0
 zKWlybOypfqP14R4IsvZdgg+xRpL/s0fD/YSoHzPr4yaxRCZi2NJQNocO22BiR9v1EHN2yxT2Kg
 M6kjeOK2fmEdwAkLXV5LjBPlYn/9N0tOcraJpgw9HXsz8FfvkJUUiy54UdZGNzkxyP46y1N9yHn
 xpR09/AEH5S8KKXAqcjmMqbve+QHcEO7XpMpu7pvz8LrobwAizwF6XU7cOx+l5ZWc758uybCx3C
 80LyNUUE25TYC+sixPg==
X-Proofpoint-ORIG-GUID: jyh8WY3PlKlThcfiQylZLAoHmUe5keBC
X-Proofpoint-GUID: jyh8WY3PlKlThcfiQylZLAoHmUe5keBC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 impostorscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310094

On Fri, Jul 31, 2026 at 01:07:13PM +0530, Vikash Garodia wrote:
> 
> On 7/31/2026 4:22 AM, Dmitry Baryshkov wrote:
> > On Thu, Jul 09, 2026 at 10:36:57PM +0300, Dmitry Baryshkov wrote:
> > > Bring back features supported by the Venus driver, but not supported by
> > > the Iris driver: VP8 (encoding, decoding), MPEG2 (decoding only) video
> > > support and also support for interlaced video streams.
> > 
> > Dear maintainers,
> > 
> > This has been sent three weeks ago. Zero reviews. This is hard to name
> > as an acceptable response rate.
> > 
> 
> Acknowledging the delay in review in this series, and my sincere apologies
> as this had to wait.
> 
> I did not see any sashiko reviews in this. Is this all clean OR the series
> was posted before sashiko was enabled for media patches ? Incase later,
> might be a good idea to respin it to get the feedback while manual reviews
> gets in.

What is _Your_ review? AI tools are a help for the maintainers.

-- 
With best wishes
Dmitry
