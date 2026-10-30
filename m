Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793354561;
	b=vvrnL8EsITW4R9pcPCg2D2K+HSTLef9flSVQdF9Uidwqt9JBanZimY3prW0DRCCmJFNG
	 zEVC1qyrQntG8ayf2Knn4ObipMlkLO4T1fkeJ66ncybxnSt4b5WH4fXPqE4OTNlRrmMVb
	 Dl6YaDpOZbqZRH0zOxPqbAD1oQwUhy8rO9sQWZr5LLF6TYvo4eRQO2vHU/pwIFet8i2iK
	 6Dt38fybAfl+DrZIKAIxqQu0+2NpP8i8HTFX2Yw8dC15w6K6qqpYCBPfiok4Rlvza08og
	 Pt0HTT2/0gzLbu9rVXhbhTbZvkK9jUA4Sp9Kw2ZxcmN++0VX++HK0oK5WyL9c9sGS9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793354561;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=XPOou6CQafNHNZDV+h/LKdSD2kkWtiLvC6RPPBJtYFA=;
	b=NNO66VitW56/BBwsrm9Ctpu6/jHsiUI4eM2MmNH2rINzZYSzSqxQrlJOO0/ZIFATotSR
	 fUgqckjm5kRXHtoY4O6V1eRrlT7LZAT1s3u5PcSUdSobZt6+lGC5xfk6keEiIHd0PomLu
	 npKeYu+wjDepaUZMHqz58h+iG2wBPn6L9ksRmyhiEnPE1XASrQAQo4OnbCHDbrS09AZrh
	 nc+hDOtXRxAYLDDSZe42Q4jgjvC3Wf5kiK6wIkQbmnaGW6Ff723gV9Yr9dYTksEmU5sn9
	 tXRnkCOkky9xR3NeaG6mpvUWp0Qnn82f+xSo41k1BPg+asMQvwIhu7Z5Nz3R9/awYSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KBFHhwPY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U4giFQcw;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C302E606A320
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 10:02:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C302E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KBFHhwPY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U4giFQcw
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8F9Ye3267865
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 10:02:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XPOou6CQafNHNZDV+h/LKdSD
	2kkWtiLvC6RPPBJtYFA=; b=KBFHhwPYr++jbg4TF3vSjdJW1POzBYkAi3+RvfSd
	RtzlrtdMwBBDIaJx7+ddGCxoPXXfmqWm7EkxNxwTiKaEcrFSpMBa4iZEtM3d+eTU
	BIylE7jUINtqtnmJpg37mM2mJdqS08SL1ZjE755XYPuNUalOxi3xRMeTeZKKCjeZ
	EbOL8tbpLV2lQgWI7m+wpdOue51XGnlbu50aUMb0EZ0v4QVqy4tmZbIl9PIM0J+J
	eiSzVyUm/6rX/jfH+EPgir2UQbmcjw40pAZwGygoR1r5wIuOiTq6yMx1YdVlZIEN
	ad4DhGtxKOQRaFQQ5SMFS0d4E87WWuYt78zNnAjLxqNc6A==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qjcpn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 10:02:28 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso1467276eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 03:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793354548; x=1793959348; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XPOou6CQafNHNZDV+h/LKdSD2kkWtiLvC6RPPBJtYFA=;
        b=U4giFQcwsLt8O88iH6fF/3J5vLMK0AZLuczdL4lXN18ry31u43LCXFz/OcNNCU3BQA
         CzcnAoyfclP5+Pk4yXSPHrW1OGIB32+aO1klCCIDdHXz3xcaIZkHJpwFYXnttyCXsTG9
         cAhffzpEQDariNokkBMlEFusJlkBcDoBaVZZMxgtv0rDWcgSfBBod0RhJMk0mD6zReFc
         Iv/CA6aOe5AJ2ojj8/YMkJ0dsaDJ9UsWTgS52GqP3hzpPUKwPqdV+yjLoFpM0UEho4d7
         kAl2HTnDCtmM++K98RA8v7+sJkl49OfeY4iIClunqZ3LpTuBX3EwQXl9zU2idNHqlNyY
         qsbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793354548; x=1793959348;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XPOou6CQafNHNZDV+h/LKdSD2kkWtiLvC6RPPBJtYFA=;
        b=Tew2keXHIqdskp17mXLav83RBFcJhQZD+GaB+Ril0iJ49oIMF04Hhh72e7+rB1eehM
         YP5zK/xhLzPGKqtOOz9XQ9fmClCEUHCwJt2++BitAohL+oYbjyYg2Jug4qLS9rF/49db
         5dq9XqCfOal2sthoC6EL1R/TRodMbr0EBBWeuJ8ccX5hy8ccuRqF27oFcNpaJWxV91SK
         H+YqWu47KFoVNHj/diWhn8ZxnS04B5PP1y2SaSP2+uMlK/KzD9vhojzcqdQjq8kZ6o2U
         Ay3qo9vFtD11YE5PLpd7ibebaSk+lW6ZkPQ+iAWh4PSjQ0ZcptnbURKK45mXIAvrl5Fx
         Uhkw==
X-Forwarded-Encrypted: i=1; AKwUvBx2mEx6bIChbhvWR1F1X50CnrVyoi137M8Yvl6X1EmgF/QHfK4HBX6A4tBaAbvTL7lIPT2EXrOsiPlBrRA8@vger.kernel.org
X-Gm-Message-State: AFq9FYJn9aIt4UM84MhExj6YBHd5pnGGt7Obo1wNThQI47SeblhRBczz
	v8gfi9IQB94ETfRklq1OEG9mlYwoM/lQE0zbsLhSBeYRjlqc/ZZLSWhvUDHArYDuJpyuEdlqK2Q
	meAbLcYP0Hvqh5SQh/akUuQJEATLaWvhZvNYueJYycqyfedchOgaOtlAoIvvyi7bupwVd
X-Gm-Gg: AYBFou1wOKDa+50kf7QCz6Ol/3tEpuBLdap334px6EfAY+mWrnV3vQ21Gpm5vI4J0yq
	NOoCsrbqYX+uR0bXucX1De/mrg1nsnuKd4DMUB9HgPWwDuhkJ3HqE+pgh1VuzdsFynowe9vXkuM
	N1jSQgNR3+uuRZRHoA/tIDz+35fpl0xUNMetK412QCGzQ0XcImWO22Qpzw9cLMuNTRSe7lv4FAK
	OA1iR8ZpVg0+TLlc+je77XFNQmHNuiqTH01UvkNdrPnBl5+D+NbPzrakbDCtcJDjQJxBcdeul3v
	p3gN+dRtzcdc13v7hDtVbKa/HWpTHtC6VZcKeQtAOmqr/nBLL1yaWu6Y6f4yqIGJRKxPkWgilly
	ZSfi9xKQd+ht9HZFn1lUMxJOGEiCCm2u3BRzG37wS0DeAHdp5fgOe+6bYEu+YXvpIW2EY+76B7u
	w0PfGcLRjo8z09OrU=
X-Received: by 2002:a05:7301:6183:20b0:36a:1089:9836 with SMTP id 5a478bee46e88-36a423c8988mr2702552eec.15.1793354547646;
        Fri, 30 Oct 2026 03:02:27 -0700 (PDT)
X-Received: by 2002:a05:7301:6183:20b0:36a:1089:9836 with SMTP id 5a478bee46e88-36a423c8988mr2702509eec.15.1793354547051;
        Fri, 30 Oct 2026 03:02:27 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42aa8999sm6925218eec.29.2026.10.30.03.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 03:02:26 -0700 (PDT)
Date: Fri, 30 Oct 2026 18:02:19 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Sasha Levin <sashal@kernel.org>
Cc: stable@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        Yingying Tang <yingying.tang@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pavankumar Nandeshwar <pavankumar.nandeshwar@oss.qualcomm.com>,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Subject: Re: [PATCH 7.3.y] wifi: ath12k: Increase RXDMA buffer ring size for
 default memory profile
Message-ID: <auRrK4JWN-7rUcG5@QCOM-aGQu4IUr3Y>
References: <20261029095541.685879-1-shengchao.guo@oss.qualcomm.com>
 <2026-10-29-1-daily-reply-0011-ath12k-rxdma-ring-7-3@kernel.org>
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
In-Reply-To: <2026-10-29-1-daily-reply-0011-ath12k-rxdma-ring-7-3@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzOSBTYWx0ZWRfX+qAstjZEjU3D
 eU7B3y3Bjv9MEfy7XEqOGOBblHdJmnGp962TZAxYQZH+ETGYgQraMMXsnHPCFxqjeKUZX5iIwbz
 iOoJtHB5hcSEHb67eYmdlZlHryu8dP4xE3LYvttAY+Z6lnNtF+ifl1+uuApeWPOEYYD9tjSlkjG
 1YDQScF3TCD0hav28nPCS3LEASCk/TWPRYC6uNHRXmeqOd+R2r53vUqfoKU2YBjG2h07AdK6B84
 ScMXzRMhmg/Wje++AjpxOsV6ez6UOXbtHBp8fuiF0TCWc3JLFseQuyPxZDb3tKUjtnIP0/drxdB
 7grvCrkyoOTDe8ZQFIIcgUaI1nab52e/c304vPRUJBQwrbCCx2zTiCHu5F3HVbERLFcs1Vchws5
 UVJE/bRmFbv2OwAAPfhc1bmG/uyxB7KALKgnvppILKNyTo5I1czmID/1XPaEOX5F9RLG6Joyxj5
 DZ603uCfLnxgB+5YLnQ==
X-Proofpoint-ORIG-GUID: gnbwMmwtEyJQ_SZZv44a1AX2pkZ20drk
X-Authority-Analysis: v=2.4 cv=IeoSymqa c=1 sm=1 tr=0 ts=6ae46b34 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=3Y6tUoXcgYOYlkcqMpIA:9 a=CjuIK1q_8ugA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzOSBTYWx0ZWRfX1X0F642U9F9c
 DQMk2v6ofAS1GxI4EqDb56E0usQAEPHsghK0ySPg4goip6RwdPDAuJxjFBTp8OqLtF9+umQBbzC
 KT+5KGlVHPmV232GZAux43+VdXpTlVc=
X-Proofpoint-GUID: gnbwMmwtEyJQ_SZZv44a1AX2pkZ20drk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300039

On Thu, Oct 29, 2026 at 02:43:18PM -0400, Sasha Levin wrote:
> > commit 15f7603b69a83a0acc7fcc8992ecbea6110f9424 upstream.
> > commit 643f0bf936176c114d5631da7547e991b5d99f10 upstream.
> 
> Queued the upstream chain for 7.3 as Greg asked, rather than the folded patch,
> thanks.

Awesome! Thank you, Sasha!

Shawn
