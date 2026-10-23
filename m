Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792797412;
	b=qjjMzeCOt5W/bR18lwXYPdQRQlBGQgLFkiQHFXUPj9+B1DIEmx3AMK6kR0vIQJ5xi9l2
	 /D/H7u7D6UR+kHR1gMhfF9HICDobsMqK+eQPHFBsdv7Qw9yq95YAV0WuUTSAUMxtvxsGb
	 /Kfx0PPaUGGjST8MfXQ5FZc5F1Lxb7vrg/m2XDDhKyROW0x40jomIjuO+Qj9eJklKn+Jj
	 GJswwJpFH+v9/k+Ujm9q1zowvWrRU1Um3iSmS2a4Db9DchJmLggxI9Cky8LQwQgOPhfxr
	 QVqJgMwStPTeuq0F4vpmRru78XJ0AdRew8aZLH1/5NB9o9vywVJDQLEuLaiyJnJDhHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792797412;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Uf/HLf+gvCGbaUy1xNBEudLWqzzIfdykWFA/o6PVAmI=;
	b=KSnKFl+EYf63+7n6UmW1QA0Fr61naVj6Wr2Banu6e++/g/jqT96bYDxBi4oUXIQIpUzP
	 +zgI7jd0eQjV4pjZV4eg4V+Vgu0kMMZVqeXkL+sxQdH1W/PkV/NuPCy8KKG/pPOIwGDC3
	 hMyEOSI1DzaGuxS3ovfm0OZq0D8CBcxb3hi16XXD8fNsetc3b+Cytf3nG6BiR+LRPdimA
	 JgSLqU+arAVp9P7hfbhxperieGTFAq92ITuEQlOWZs/J1UB5AgQWdKfRZj30vicl8ZJMz
	 ueWZjJXNrKYFTv+kpoYk2zHtWbDcUomGHrY6PJtlSy2clNdlCSl9RB2OG3k3rxyEwVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SjqKlVSn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BXNj7W+X;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE02606A31B
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 23:16:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABE02606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SjqKlVSn;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BXNj7W+X
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NLvapj3471129
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 23:16:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Uf/HLf+gvCGbaUy1xNBEudLW
	qzzIfdykWFA/o6PVAmI=; b=SjqKlVSnNWlW0GeO05ZZwUu5Gn64FEJ/PwAiY9yj
	/Uj932ookfMP0o82G/ocYnwE9TORuDtPZl9rEP2LsXaVA3pL3ctdny2fqtCW7H6x
	mB3N3cIwLZYVK+lPJMGyzo29avK8B5FBzJ5AUVQ2L9cjA6c0Oa/qc0gAJEXv529a
	5++WWU+Rf3WgOnlP1KavgKZ5vAEMhUGDaxnVWutbdGRqrHRj2Jd8V0rJ4txQvS4K
	Fh19n+dfrwy/QH1R5GTayplUsueHNY7D1n254xzAdw6ihq/32OlkBbvPiKAIiCyB
	LNq3+e2DStPLjpoc7N5UAGjEhfK7bnGF3cu6eaoQk5vN9w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgcrugube-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 23:16:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cbf2fd504so263067585a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 16:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792797410; x=1793402210; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Uf/HLf+gvCGbaUy1xNBEudLWqzzIfdykWFA/o6PVAmI=;
        b=BXNj7W+X8YoP4Ot9Y/kKHsLsZgkqoZ9el6UAb2t7MsLGEQLtJ/I1x+3OEnAAa1zdEt
         brcqNrVz9UKhFwBkQBWwcRBJVlpC+l6slHh7ap/asFyfvSzyGY9M6gLr+XHxTc5tw+ix
         tUL+ObsfkItj5K6G63PgBJ9TaL6YcIIK1q7Ccoh80AmxJ+q/R1sbGnSgswKVkbPl9M4f
         b+DEDD+LGhy5j4o/pioLh/a2q5MC3EzRq0YPhAK1orvUQYrS8IvS0Nb02j5d/jNX08ek
         8A8J3deJegcTnBYniDP74bOBn/x4O1H1mFABXVZK6o91J9bd7Dj0LoCIN3mQCZ6gXdZc
         Ub3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792797410; x=1793402210;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uf/HLf+gvCGbaUy1xNBEudLWqzzIfdykWFA/o6PVAmI=;
        b=TTq1s1TQ+YZoZyg15lgN1JCfLRDDSNMv42BFGMYz8bY4XSZLxGjOS2OrXjguJ5pIHC
         ikkasrWEGSzhM87OydJwHKCButNmQSMLdtzSu1bFRE83ki5SF6CaLK8hp8UOQjPgftqb
         g35yrxIRRZFLnTtt7mAgmAAKWYmJgtiJsryIZr2D+QduaQ27RJOrUOSlr4TeUSfphSxf
         tInfcXSiwJ+P5aJJ0cmz8EmjXsTrxQW/JX5EppmTeceyrHP37XeFJEtCUczjJ7RINU6a
         4zwzoGPZVQSA315RwCPstCvqXIf+0bKLI45L6yEDzB6/iYdMBKQ/UuL2w/t4WvOExE1C
         MBsQ==
X-Forwarded-Encrypted: i=1; AKwUvBw/OoKWp3Uhzl0tBYWihFgWFFeIzpt+qPEGSjiid8PpXZ8+VDaRU6JkTlDV68A0eVbtI55eebdJzGrrX44z@vger.kernel.org
X-Gm-Message-State: AFq9FYK1fVLRMWrY89soWgsdgfGgsIsgw7Lf01bjFWBFPulX+Dh4oBiC
	UUb28tTm5iaIgMeAQxnqUOIlV0AKKtVSmkqiKz8y+HJomrv/DVwDRPNubmp8q4Qf1KNX9njam/H
	vLEBUQFpSS7RFoYG0LuMINMXtVm8tpGx2Va0k29GHFTOkebGARwdYrHzcFtFYIZgEJWdX
X-Gm-Gg: AYBFou1pKuSQygJJzohFKxfR6aVFHWqJGLHrBDqLc9ka436ch46coMyTu1siiHQtRKG
	qY2bYJFsX2oj4jhwZNWSE+sdmuGmUYGqSCApuACxtgTqZkgc+FLccLbveL27AJxpJqXHfWns8GW
	NlBSklVCNJLPM3MBuWS4jRsfe1YynRYLR58V/hHm0HdJhD483b8XbuBQhtCL9zRkir93wGOuTC5
	chx7+Jab82PRaOW4/WrlW6Y3w0k4jDYO28An2pqaMfqjjAhaTzdrIeRffvNYKEmRVPgaIXhD8K0
	yUYm0DpeHMyzyJ/oLRcueAI16wQ3WSNyRJiJtO3I+FXsgTdmcBqot5l8TVMwBKZ4j670/6LPhtt
	SZvoMKHkENzXb7I/z784clke9xMk2x8sFud9gi1NHRSy+USTohEWK6nq9cEVVnAgEhIPu5wl/R1
	frlH/Lmq/rVxah
X-Received: by 2002:a05:620a:6f05:b0:93c:c162:125b with SMTP id af79cd13be357-940ef931614mr82906085a.39.1792797409753;
        Fri, 23 Oct 2026 16:16:49 -0700 (PDT)
X-Received: by 2002:a05:620a:6f05:b0:93c:c162:125b with SMTP id af79cd13be357-940ef931614mr82904085a.39.1792797409401;
        Fri, 23 Oct 2026 16:16:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac70a493b6sm955911fa.37.2026.10.23.16.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:16:47 -0700 (PDT)
Date: Sat, 24 Oct 2026 02:16:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Michael McAllister <me@michaelmcallister.org>
Cc: linux-bluetooth@vger.kernel.org, brgl@kernel.org, marcel@holtmann.org,
        luiz.dentz@gmail.com, lumag@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH bluetooth] Bluetooth: qca: Fix the WCN3950 NVM baud rate
 offset
Message-ID: <phkghjerfiho5a2tqzuckaraacy5mnsgnfwfqfqonogcl7ctkk@pekseqogr6eb>
References: <20261021195112.41138-1-me@michaelmcallister.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261021195112.41138-1-me@michaelmcallister.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA5MSBTYWx0ZWRfX2tZ+eLYilNdM
 aq/GFJqK3mQvHdscUqYmkbaxVmi8lKca3kAnmrzIcUHnysfxN0F2izC5leQZFR85h4NRJZHBGxx
 dSeey6SXPm639n9lNTWblcHX9lLYK70=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA5MSBTYWx0ZWRfX87WzgDEdqecd
 u/gB4dzkeY1xWN3j8NFNW15jjvLQ+53UgOePB8t32abBCVAAyi4psxNLRtD1suYQsddK1MdWp1h
 8JnUUpBmUi9icShHqOvtw9PK3aNirEZ4D2T8asFncqWHKhi8uIyZscuhEwh1XFbU0R254oe3JpX
 ReB/wqWxkRyZRczP4k8XL05q0+3ET0E6CnGwjUpu14J7ZL3f1AMoznKM/yVl4QR3bfBt8H1mV2f
 rgjFwQ0yFk7iQhGoQ/4PzvZ+kEhmMNWv9oDnpnQjOuVI5yETwuK9BiMwX8qt/snRnpymIinwK2T
 zEeCTPIk2m7XrkFQHB+CuwKSFU/5oU1aZV7O0PSzFrx6ejwc3EmGpm0mj/+1SvoXR0zNLUz8kVP
 8h+G0znya7ynsfiQeUepXLiE5SoK7T/vIl/2gD6SP16myKDqF8A/LkZ+DfEUOQiFSdaiGXjhICp
 t3KsraV76rlbny/j0Cw==
X-Authority-Analysis: v=2.4 cv=Ju5kP84C c=1 sm=1 tr=0 ts=6adbeae2 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=JwJ85b4fAAAA:8 a=EUspDBNiAAAA:8 a=RX1V4Qf_SthgjYcjEs8A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=qg2vb7sgHZQYDKbllo_a:22
X-Proofpoint-GUID: IwPNRdwA-qlFFsoDpDkzZl2OH_WhQTD0
X-Proofpoint-ORIG-GUID: IwPNRdwA-qlFFsoDpDkzZl2OH_WhQTD0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230091

On Wed, Oct 21, 2026 at 08:51:12PM +0100, Michael McAllister wrote:
> WCN3950 uses the HCI transport tag layout that stores the UART baud rate
> at byte 1, like WCN3991. However, QCA_WCN3950 precedes QCA_WCN3991 in
> qca_btsoc_type, so qca_tlv_check_data() writes the baud rate to byte 2
> instead.
> 
> On a Motorola Moto G10 with WCN3950 and cmnv12.bin, configuring a 3 Mbps
> UART therefore leaves the NVM baud rate at its default 3.2 Mbps and
> overwrites the following byte. Firmware download completes, but the
> subsequent HCI_RESET times out and Bluetooth initialization fails.
> 
> Include WCN3950 in the byte-1 case so the NVM baud rate matches the host
> UART without altering the following transport parameter.
> 
> Fixes: d5712c511cb3 ("Bluetooth: qca: add WCN3950 support")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Michael McAllister <me@michaelmcallister.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
