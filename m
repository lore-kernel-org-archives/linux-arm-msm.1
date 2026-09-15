Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB3E35CB7C
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 12:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789476632; cv=none; b=jLBqOhhYObozNqzVsSiZY/N8rvs2gc8rC8Lyvvmhcyx9LA1i7+eOZ0lYSuL0LJIFY2M2Eaf8dMvwt+iPhSU2Q7QtA+wqqYgk8kXI4m7VAHMlhSOr/EUJAsNIsZuHEt95zzSJWudL2hCDqVRbSv6QebTN4VlhWolV4xQo3IZ1K0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789476632; c=relaxed/simple;
	bh=Eo7WbJ50OpvVIUjtbzxHDPcIBLddnAaq+MHvsUeuiLc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UMcLkLSDh3Zvvn/bfViUfghc8Z5kJgw4DedFjejG2d3fKGAuoC+nybCSJPL0jEMlG1SMSlmMqomDwuk8GCl7H9LJ1DUeGPvUbrP2opzyrKfeW4oDhJI9APLInUUnusFJLJ3BmGvB2P0aEG9o7Osz/s7OHvV7zhYXxbFmTbUOusY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dCwpFf3x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DDEntbFr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dCwpFf3x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DDEntbFr"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9guC7275470
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 12:50:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=twDB8oqFADQMDFlkJ1NnoxAf
	enWCG7E1ZKvi3p96cdI=; b=dCwpFf3xyMlimSYCVtolN85HFpjOY45clbAtjtA1
	BY6Ixp0tRqWj1lIkty8poFODQaRa49tyg8341QcuqrdguBqVrBDZx8iBanaYHgCT
	0ArTHQk4rxd+g4/IbGFwBBIwn2a1mokl0W6BrT5Kd9Krt80tubJHavoycARa3xWI
	JyB75Kqrhfw+cNF92zaH30+mQPgbnno2CaLlKiKIwevv3m0DstkabXWdMUJ2WnIM
	z8gjF3gVFMHAzLAGGqz2S2DQCgCNMclahOnkZTJDjReRDcsF685dHwsvuL+roghN
	ZmrFkbwaMsXzKj5nTIGgphdcpO9PYN+w1iq9fNCEYdfP5g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpyea1u0g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 12:50:30 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-939062ecda9so687625885a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 05:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789476625; x=1790081425; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=twDB8oqFADQMDFlkJ1NnoxAfenWCG7E1ZKvi3p96cdI=;
        b=DDEntbFr/AZOF9DZcPkQLPgtKvNbQCew8M9yeqM/LxiXDpfuSHv3WBYUaUFsOaKH0z
         a1by8zLJLuBlL1m/V/llLz1SWOuRc0rLDmiW6FukVvMu5Ld7Whw9lQrA/s6SKSv/oaM8
         /R6pAzQ5HgJm/Xug8Lm7s3yLtPZawXvknHTQk35f4AKvrGZRt/fPHTV9VObreapJ4HUb
         A0UvWSUQCNeebTrMX192Bw8mDvZeO4J28nsop39oFHj5S+MWxT6HuepQw3oyp4EwnlML
         57mpu3QhjgZwgRifK5HX/xW2Odi6JlkIkHOwZ8ZhOk/7TV6SlO7AG+3tBwpafqnZHXDI
         r2eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789476625; x=1790081425;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=twDB8oqFADQMDFlkJ1NnoxAfenWCG7E1ZKvi3p96cdI=;
        b=q4lMmWREXyk9grEoUKW1Ufgk9VKvzrBKD+aAZxw/45nqZUByQ+oSunat4U+zo9AwP8
         COV4FW+ZV8oiklZqI4VCXT9jfWmKnq7Z0WZcrLnUohIyVF4ZOJawhRYwiahuAXgC6yxe
         0Elx93Z/W0yhj3dVnMswx9OGAB3k/81a8Rdo1otEqAkLu40XtWAVvjiCZKJSbbow/fz5
         Bqy7/ggh5oNEVuTC8bQS8djBGl4C30n4DT22KUCScAPamNeC3m6I6A5Fy3EnNZZsA6Ag
         b9Ie7bpp8yGXs2yYJrJWSvJ1TTDboUPcS0i/kDyMH/UHUX/h3k6p1Nvp/sUH3G0/BqNn
         u9Iw==
X-Forwarded-Encrypted: i=1; AKwUvBxOcmZZgB7sSZlFOtWm7wC7nnvZMiCvs+ZGFjK4Rtq9x+5LLtTNIbbni/56wmSZKNk8I0l2yHJi3lIhydFH@vger.kernel.org
X-Gm-Message-State: AFuF++nRtCpQBv/9I29P4vOFpkKSaERMuzdi07L/f3V4FSYmR6baYq0j
	9XwelxGaW0xsR6noi2+IWMwWBamL8K4VI7hx5AvTOVxzkfCvdLne4Oea7EIOrg73aT5mk+eiISt
	d7ur2wcOAMrYyfkp/cOcXK/uOkmnwHxi4y+jb5qm5gjadHXJ4X/KPjKKg6MW2/h7Pus1Gfd1p7s
	cL
X-Gm-Gg: AYBFou1rElQVvkDp0vn4E2uUzhfCtWTCkRKoze9x9EuCF4ytVJr3EpD+LGr0qnkBW/t
	xvUwVzQSU2AGxJF08ZvcE2R/TNwjVW4hmigPiNt4vKoz7MlSlKSjkIiBastkOXlweUpY1bw3qve
	n+qkpph5NxgdpNTdlXAp+G+Czi4ba8xETB+Ox0BhMUroJyj6f1b3eGEU0vfPhhOb21HgdavCRyM
	mxMhYbDx17nrBCTWOYNm/o/JPfPUxqVOvqijJ4J6MvB8c1cPIF4BZl/XVndSWbbrZNPtmdnTsPw
	V/2OHBEoVJEeQ0Pe/WlsOFk0+Xkt5d6mKW8/F5C2X+LqbCWKKAAA3Wkz0e0B3bUpITo6AisLAiM
	YCl1QyUD4pMoa1/o=
X-Received: by 2002:a05:620a:3915:b0:937:5ab5:53f7 with SMTP id af79cd13be357-93a29a15cecmr1153310085a.43.1789476624826;
        Tue, 15 Sep 2026 05:50:24 -0700 (PDT)
X-Received: by 2002:a05:620a:3915:b0:937:5ab5:53f7 with SMTP id af79cd13be357-93a29a15cecmr1153299185a.43.1789476623862;
        Tue, 15 Sep 2026 05:50:23 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa12ab77edsm477841a12.13.2026.09.15.05.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:50:22 -0700 (PDT)
Date: Tue, 15 Sep 2026 15:50:21 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Navya Malempati <navya.malempati@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: qcom_stats: Add support for NSP subsystem
 stats
Message-ID: <a6q6zbfrz3gmio4gvf2zrbgofun7ksalg2rcnr3l5ykfrjwiqr@ezmkywxgtm3q>
References: <20260908-nord_stats-v1-1-a55adb083d65@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908-nord_stats-v1-1-a55adb083d65@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: uy2H_38xdCjtKHBPYlT9Gatio52Q0uD8
X-Authority-Analysis: v=2.4 cv=cehHPXDM c=1 sm=1 tr=0 ts=6aa93f16 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=aJpCXM2tXIwcEqQ61nwA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: uy2H_38xdCjtKHBPYlT9Gatio52Q0uD8
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE4NiBTYWx0ZWRfX0UbcxUWcFK0l
 6LXiRYGuKJ7//jgUMP9SL+diMPw7juxAUejoPt/+mjyGRlREhes9sygR7f4Llc70y/MyYCUx7pG
 VUkvt26wayTlxXZvWn3M2psdACR8gwo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE4NiBTYWx0ZWRfX6jiGYRANOvrr
 8xAu7rLWg3OXCZQUss+5PV8sjxWbehPWwG6xXGstYLZpNrMCjo7NizWKcyRzGZV+O8EibrpqM/Y
 8k5/VPoHPJjEV/eZ0ZPpCsXZaEefScOBz2SuiowQPTHvko9VPNbisPim/fAlJzcBEN2gp9u2xVf
 /nXyw6New0CunyEBwycQlxJdpYPaT/2U/ZBh3CESQmX/TFdqE7FVtUi+Tg9qbOs4l07ufu0SUIl
 NIT8lLfhoBef8eze/b04wXgziPjNfLQ49vDa3x8aawpu03OJ2EPdC0NUCbG2k+bHaaMIgz8Upzk
 nsyZVpGAAbGhhmJUJDnfbJhhuhR+AHkOZmJ2/St0XtqphaOAye9eQHjAq+nwEXn0Xj3iED+Y7cS
 u3EPl4fSVB/rkIdDpBz0P96EdRejQge9gAaTN/qSSGcDhxu2N9JkkeZ/WO71E5bw4eD8q9/YaEw
 QkF7dC33oOXL9RrKOeg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150186

On 26-09-08 13:43:08, Navya Malempati wrote:
> Add SMEM items for four NSP subsystems stats which are present in Nord
> SoC. Rename CDSP stats as CDSP_NSP as both use same PID and SMEM item
> id. Add new entries for NSP1/2/3.
> 
> Signed-off-by: Navya Malempati <navya.malempati@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
